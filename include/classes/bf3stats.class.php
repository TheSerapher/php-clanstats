<?php

// Make sure we are called from index.php
if (!defined('SECURITY'))
    die('Hacking attempt');

class bf3stats {

    function __construct(&$debug, $config) {
        $this->debug = $debug;
        $this->config = $config;
        $this->debug->append("Class loaded", 2);
    }

    public function load_data() {
        // prepare the post data from configuration
        $postdata = array();
        foreach ($this->config['players'] as $player => $data) {
            if (is_array($data)) {
                $this->debug->append("Player $player added", 2);
                $players[] = $player;
            } else {
                $this->debug->append("Player $data added, no additional config found", 2);
                $players[] = $data;
            }
        }
        $postdata['players'] = json_encode($players);
        $postdata['opt'] = json_encode($this->config['stats_options']);

        $this->debug->append("Preparing CURL call", 3);
        $c = curl_init('http://api.bf3stats.com/' . $this->config['platform'] . '/playerlist/');
        curl_setopt($c, CURLOPT_HEADER, false);
        curl_setopt($c, CURLOPT_POST, true);
        curl_setopt($c, CURLOPT_USERAGENT, 'BF3StatsAPI/0.1');
        curl_setopt($c, CURLOPT_HTTPHEADER, array('Expect:'));
        curl_setopt($c, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($c, CURLOPT_POSTFIELDS, $postdata);
        $this->debug->append("Executing CURL", 2);
        $data = curl_exec($c);
        $statuscode = curl_getinfo($c, CURLINFO_HTTP_CODE);
        $errormsg = curl_error($c);
        $this->debug->append("CURL status : " . $statuscode, 3);
        curl_close($c);

        if ($statuscode == 200) {
            $this->debug->append("Got 200, storing stats", 1);
            $data = json_decode($data, true);
            $this->data = $data['list'];
        } else {
            $this->last_error = "BF3 Stats API error status: " . $statuscode . " : " . $errormsg;
            $this->debug->append("BF3 Stats API error status: " . $statuscode, 1);
            return false;
        }
        return true;
    }

    public function get_stats() {
        $this->debug->append("Fetching statistics for players", 2);
        return $this->parse_stats();
    }

    private function parse_stats() {
        $stats = array();

        foreach ($this->data as $name => $array) {
            // Scores
            $stats[$name]['score'] = $array['stats']['scores']['score'];
            $stats[$name]['scores'] = $array['stats']['scores'];
            foreach ($array['stats']['scores'] as $key => $score) {
                if ($key == 'vehicleall' || $key == 'score') {
                    continue;
                }
                $stats[$name]['scores']['total'] += $score;
            }
            $stats[$name]['scores']['objectivepart'] = @round((100 / $stats[$name]['scores']['total']) * $array['stats']['scores']['objective'], 0);
            $stats[$name]['scores']['squadpart'] = @round((100 / $stats[$name]['scores']['total']) * $array['stats']['scores']['squad'], 0);
            $stats[$name]['scores']['generalpart'] = @round((100 / $stats[$name]['scores']['total']) * $array['stats']['scores']['general'], 0);
            $stats[$name]['scores']['teampart'] = @round((100 / $stats[$name]['scores']['total']) * $array['stats']['scores']['team'], 0);
            $stats[$name]['scores']['awardpart'] = @round((100 / $stats[$name]['scores']['total']) * $array['stats']['scores']['award'], 0);
            $stats[$name]['scores']['bonuspart'] = @round((100 / $stats[$name]['scores']['total']) * $array['stats']['scores']['bonus'], 0);
            $stats[$name]['scores']['unlockpart'] = @round((100 / $stats[$name]['scores']['total']) * $array['stats']['scores']['unlock'], 0);
            $stats[$name]['scores']['kits'] = $array['stats']['scores']['assault'] + $array['stats']['scores']['engineer'] + $array['stats']['scores']['support'] + $array['stats']['scores']['recon'];
            $stats[$name]['scores']['kitspart'] = @round((100 / $stats[$name]['scores']['total']) * ($array['stats']['scores']['assault'] + $array['stats']['scores']['engineer'] + $array['stats']['scores']['support'] + $array['stats']['scores']['recon']), 0);
            $stats[$name]['scores']['game'] = @round($stats[$name]['scores']['total'] / $array['stats']['global']['elo_games'], 0);

            // SPM
            $stats[$name]['spm'] = @round($array['stats']['scores']['score'] / ($array['stats']['global']['time'] / 60), 0);
            $stats[$name]['spmgame'] = @round($array['stats']['scores']['score'] / $array['stats']['global']['elo_games'], 0);

            // Real SPM
            $stats[$name]['rspm'] = @round(($array['stats']['scores']['score'] - $array['stats']['scores']['award']) / ($array['stats']['global']['time'] / 60), 0);
            $stats[$name]['rspmgame'] = @round(($array['stats']['scores']['score'] - $array['stats']['scores']['award']) / $array['stats']['global']['elo_games'], 0);

            // Accuracy
            $stats[$name]['accuracy'] = @round((($array['stats']['global']['hits'] / $array['stats']['global']['shots']) * 100), 1);

            // KD Ratio
            if ($array['stats']['global']['kills'] != 0 && $array['stats']['global']['deaths'] != 0) {
                $stats[$name]['ratio'] = @round($array['stats']['global']['kills'] / $array['stats']['global']['deaths'], 2);
            } else {
                $stats[$name]['ratio'] = 0;
            }

            // Time
            $stats[$name]['playtime'] = $array['stats']['global']['time'];
            $stats[$name]['playtimes']['per50euro'] = @round(50 / ($array['stats']['global']['time'] / 3600), 2);
            $stats[$name]['playtimes']['perday'] = @round($array['stats']['global']['time'] / ((strtotime(date("Y-m-d")) - strtotime("2011-10-26")) / (60 * 60 * 24)), 0);
            if (!empty($this->config['players'][$name]['bought'])) {
                $stats[$name]['playtimes']['bought'] = @round($array['stats']['global']['time'] / ((strtotime(date($this->config['players'][$name]['bought'])) - strtotime("2011-10-26")) / (60 * 60 * 24)), 0);
            }

            //Kills
            $stats[$name]['kills'] = $array['stats']['global']['kills'];
            $stats[$name]['killsgame'] = @round($array['stats']['global']['kills'] / $array['stats']['global']['elo_games'], 2);
            $stats[$name]['killsminute'] = @round($array['stats']['global']['kills'] / ($array['stats']['global']['time'] / 60), 2);

            //Deaths
            $stats[$name]['deaths'] = $array['stats']['global']['deaths'];
            $stats[$name]['deathsgame'] = @round($array['stats']['global']['deaths'] / $array['stats']['global']['elo_games'], 2);
            $stats[$name]['deathsminute'] = @round($array['stats']['global']['deaths'] / ($array['stats']['global']['time'] / 60), 2);

            // Last update
            $stats[$name]['date_update'] = $array['stats']['date_update'];
            $stats[$name]['checkstate'] = $array['stats']['checkstate'];

            // Score by kit
            foreach ($this->config['kits'] as $kit) {
                $stats[$name]['kits'][$kit] = array(
                    'score' => $array['stats']['kits'][$kit]['score'],
                    'spm' => @round($array['stats']['kits'][$kit]['score'] / ($array['stats']['kits'][$kit]['time'] / 60), 0),
                    'star' => array(
                        'count' => $array['stats']['kits'][$kit]['star']['count'],
                        'needed' => $array['stats']['kits'][$kit]['star']['needed'],
                        'progress' => @round(((100 / $array['stats']['kits'][$kit]['star']['needed']) * ($array['stats']['kits'][$kit]['score'] - ($array['stats']['kits'][$kit]['stars']['count'] * $this->config['servicestars'][$kit]))), 2),
                        'img' => $array['stats']['kits'][$kit]['star']['img'],
                    ),
                );
            }

            // Rank data
            $stats[$name]['rank'] = $array['stats']['rank']['nr'];
            $stats[$name]['rankdata'] = array(
                'name' => $array['stats']['rank']['name'],
                'img_tiny' => $array['stats']['rank']['img_tiny'],
                'img_medium' => $array['stats']['rank']['img_medium'],
                'img_large' => $array['stats']['rank']['img_large'],
                'nextrankpoints' => $this->config['rankpoints'][$array['stats']['rank']['nr'] + 1],
                'progress' => @round((100 / ($this->config['rankpoints'][$array['stats']['rank']['nr'] + 1] - $this->config['rankpoints'][$array['stats']['rank']['nr']])) * ($array['stats']['scores']['score'] - $this->config['rankpoints'][$array['stats']['rank']['nr']]), 2),
            );

            // Skill
            $stats[$name]['skill'] = @round($array['stats']['global']['elo'], 0);

            // MVP
            $stats[$name]['mvptotal'] = ($array['stats']['ribbons']['r16']['count'] + $array['stats']['ribbons']['r17']['count'] + $array['stats']['ribbons']['r18']['count']); //total MVP ribbons
            $stats[$name]['mvptotalratio'] = @round((($array['stats']['ribbons']['r16']['count'] + $array['stats']['ribbons']['r17']['count'] + $array['stats']['ribbons']['r18']['count']) / $array['stats']['global']['elo_games']) * 100, 2);
            $stats[$name]['mvp'] = array(
                'mvp1' => array(
                    'count' => $array['stats']['ribbons']['r16']['count'],
                    'oftotal' => @round(((100 / $stats[$name]['mvptotal']) * $array['stats']['ribbons']['r16']['count']), 2),
                    'ofgames' => @round(($array['stats']['ribbons']['r16']['count'] / $array['stats']['global']['elo_games']) * 100, 2),
                ),
                'mvp2' => array(
                    'count' => $array['stats']['ribbons']['r17']['count'],
                    'oftotal' => @round(((100 / $stats[$name]['mvptotal']) * $array['stats']['ribbons']['r17']['count']), 2),
                    'ofgames' => @round(($array['stats']['ribbons']['r17']['count'] / $array['stats']['global']['elo_games']) * 100, 2),
                ),
                'mvp3' => array(
                    'count' => $array['stats']['ribbons']['r18']['count'],
                    'oftotal' => @round(((100 / $stats[$name]['mvptotal']) * $array['stats']['ribbons']['r18']['count']), 2),
                    'ofgames' => @round(($array['stats']['ribbons']['r18']['count'] / $array['stats']['global']['elo_games']) * 100, 2),
                ),
            );

            // Weapons
            $max = 0;
            $count = 0;
            foreach ($array['stats']['weapons'] as $data) {
                if ($data['shots'] > 0 && $data['hits'] > 0) {
                    $stats[$name]['weapons'][$count]['name'] = $data['name'];
                    $stats[$name]['weapons'][$count]['headshots'] = $data['headshots'];
                    $stats[$name]['weapons'][$count]['shots'] = $data['shots'];
                    $stats[$name]['weapons'][$count]['hits'] = $data['hits'];
                    $stats[$name]['weapons'][$count]['accuracy'] = round((100 / $data['shots']) * $data['hits'], 2);
                    $stats[$name]['weapons'][$count]['headshots'] = $data['headshots'];
                    $count++;
                }
                
                // Best weapon
                if ($data['kills'] > $max) {
                    $max = $data['kills'];
                    $stats[$name]['bestof']['weapons']['name'] = $data['name'];
                    $stats[$name]['bestof']['weapons']['kills'] = $data['kills'];
                    $stats[$name]['bestof']['weapons']['oftotal'] = @round((100 / $array['stats']['global']['kills']) * $data['kills'], 2);
                }
            }
            // Bubble sort by accuracy
            for ($i = 0; $i < count($stats[$name]['weapons']); $i++) {
                for ($j = 0; $j < count($stats[$name]['weapons']); $j++) {
                    if ($stats[$name]['weapons'][$i]['accuracy'] > $stats[$name]['weapons'][$j]['accuracy']) {
                        $temp = $stats[$name]['weapons'][$i];
                        $stats[$name]['weapons'][$i] = $stats[$name]['weapons'][$j];
                        $stats[$name]['weapons'][$j] = $temp;
                    }
                }
            }
            
            // Ribbons
            $max = 0;
            $stats[$name]['ribbons']['unique'] = 0;
            $stats[$name]['ribbons']['available'] = 0;
            foreach ($array['stats']['ribbons'] as $key => $data) {
                $stats[$name]['ribbons']['available']++;
                $data['count'] > 0 ? $stats[$name]['ribbons']['unique']++ : $stats[$name]['ribbons']['unique'] + 0;
                $stats[$name]['ribbonstotal'] += $data['count'];
                if ($data['count'] > $max) {
                    $max = $data['count'];
                    $stats[$name]['bestof']['ribbons']['name'] = $data['name'];
                    $stats[$name]['bestof']['ribbons']['img'] = $data['img_small'];
                    $stats[$name]['bestof']['ribbons']['count'] = $data['count'];
                    $stats[$name]['bestof']['ribbons']['total'] += $data['count'];
                }
            }
            $stats[$name]['ribbons']['progress'] = @round((100 / $stats[$name]['ribbons']['available']) * $stats[$name]['ribbons']['unique'], 0);

            // Medals
            $max = 0;
            $stats[$name]['medals']['unique'] = 0;
            $stats[$name]['medals']['available'] = 0;
            foreach ($array['stats']['medals'] as $key => $data) {
                $stats[$name]['medals']['available']++;
                $data['count'] > 0 ? $stats[$name]['medals']['unique']++ : $stats[$name]['medals']['unique'] + 0;
                $stats[$name]['medalstotal'] += $data['count'];
                if ($data['count'] > $max) {
                    $max = $data['count'];
                    $stats[$name]['bestof']['medals']['name'] = $data['name'];
                    $stats[$name]['bestof']['medals']['img'] = $data['img_small'];
                    $stats[$name]['bestof']['medals']['count'] = $data['count'];
                    $stats[$name]['bestof']['medals']['total'] += $data['count'];
                }
            }
            $stats[$name]['medals']['progress'] = @round((100 / $stats[$name]['medals']['available']) * $stats[$name]['medals']['unique'], 0);

            // Vehicles
            $stats[$name]['vehicles']['vehiclesground']['score'] = $array['stats']['scores']['vehiclembt'] + $array['stats']['scores']['vehicleaa'] + $array['stats']['scores']['vehicleifv'];
            $stats[$name]['vehicles']['vehiclesair']['score'] = $array['stats']['scores']['vehiclesh'] + $array['stats']['scores']['vehicleah'] + $array['stats']['scores']['vehiclejet'];

            $max = 0;
            foreach ($array['stats']['vehicles'] as $data) {
                // Best Vehicle
                if ($data['kills'] > $max) {
                    $max = $data['kills'];
                    $stats[$name]['bestof']['vehicles']['name'] = $data['name'];
                    $stats[$name]['bestof']['vehicles']['kills'] = $data['kills'];
                    $stats[$name]['bestof']['vehicles']['oftotal'] = @round((100 / $array['stats']['global']['kills']) * $data['kills'], 2);
                }
                if ($data['category'] == 'vehiclembt' || $data['category'] == 'vehicleaa' || $data['category'] == 'vehicleifv') {
                    // SPM Calcualtions
                    $stats[$name]['vehicles'][$data['category']]['time'] += @$data['time'];
                    $stats[$name]['vehicles'][$data['category']]['kills'] += @$data['kills'];
                    $stats[$name]['vehicles'][$data['category']]['destroys'] += @$data['destroys'];
                    $stats[$name]['vehicles']['vehiclesground']['time'] += @$data['time'];
                    $stats[$name]['vehicles']['vehiclesground']['kills'] += @$data['kills'];
                    $stats[$name]['vehicles']['vehiclesground']['destroys'] += @$data['destroys'];
                } else if ($data['category'] == 'vehiclesh' || $data['category'] == 'vehicleah' || $data['category'] == 'vehiclejf' || $data['category'] == 'vehicleja') {
                    if ($data['category'] == 'vehiclejf' || $data['category'] == 'vehicleja') {
                        // Vehicle mapping to vehiclejet for SPM
                        if ($data['time'] != 0) {
                            $stats[$name]['scores']['vehicles']['vehiclejet']['spm'] += @round($array['stats']['scores']['vehiclejet'] / ($data['time'] / 60), 2);
                        }
                        $stats[$name]['vehicles']['vehiclejet']['time'] += @$data['time'];
                        $stats[$name]['vehicles']['vehiclejet']['kills'] += @$data['kills'];
                        $stats[$name]['vehicles']['vehiclejet']['destroys'] += @$data['destroys'];
                    } else {
                        if ($data['time'] != 0) {
                            $stats[$name]['scores']['vehicles'][$data['category']]['spm'] += @round($array['stats']['scores'][$data['category']] / ($data['time'] / 60), 2);
                        }
                        $stats[$name]['vehicles'][$data['category']]['time'] += @$data['time'];
                        $stats[$name]['vehicles'][$data['category']]['kills'] += @$data['kills'];
                        $stats[$name]['vehicles'][$data['category']]['destroys'] += @$data['destroys'];
                    }
                    $stats[$name]['vehicles']['vehiclesair']['time'] += @$data['time'];
                    $stats[$name]['vehicles']['vehiclesair']['kills'] += @$data['kills'];
                    $stats[$name]['vehicles']['vehiclesair']['destroys'] += @$data['destroys'];
                }
            }

            // Additionally add KPM
            $stats[$name]['vehicles']['vehiclembt']['kpm'] += @round($stats[$name]['vehicles']['vehiclembt']['kills'] / ($stats[$name]['vehicles']['vehiclembt']['time'] / 60), 2);
            $stats[$name]['vehicles']['vehicleifv']['kpm'] += @round($stats[$name]['vehicles']['vehicleifv']['kills'] / ($stats[$name]['vehicles']['vehicleifv']['time'] / 60), 2);
            $stats[$name]['vehicles']['vehicleaa']['kpm'] += @round($stats[$name]['vehicles']['vehicleaa']['kills'] / ($stats[$name]['vehicles']['vehicleaa']['time'] / 60), 2);
            $stats[$name]['vehicles']['vehicleah']['kpm'] += @round($stats[$name]['vehicles']['vehicleah']['kills'] / ($stats[$name]['vehicles']['vehicleah']['time'] / 60), 2);
            $stats[$name]['vehicles']['vehiclesh']['kpm'] += @round($stats[$name]['vehicles']['vehiclesh']['kills'] / ($stats[$name]['vehicles']['vehiclesh']['time'] / 60), 2);
            $stats[$name]['vehicles']['vehiclejet']['kpm'] += @round($stats[$name]['vehicles']['vehiclejet']['kills'] / ($stats[$name]['vehicles']['vehiclejet']['time'] / 60), 2);

            $stats[$name]['scores']['vehicles'] = array(
                'vehiclembt' => array(
                    'oftotal' => @round((100 / $stats[$name]['vehicles']['vehiclesground']['score']) * $array['stats']['scores']['vehiclembt'], 0),
                    'spm' => @round($array['stats']['scores']['vehiclembt'] / ( $stats[$name]['vehicles']['vehiclembt']['time'] / 60), 2),
                ),
                'vehicleifv' => array(
                    'oftotal' => @round((100 / $stats[$name]['vehicles']['vehiclesground']['score']) * $array['stats']['scores']['vehicleifv'], 0),
                    'spm' => @round($array['stats']['scores']['vehicleifv'] / ( $stats[$name]['vehicles']['vehicleifv']['time'] / 60), 2),
                ),
                'vehicleaa' => array(
                    'oftotal' => @round((100 / $stats[$name]['vehicles']['vehiclesground']['score']) * $array['stats']['scores']['vehicleaa'], 0),
                    'spm' => @round($array['stats']['scores']['vehicleaa'] / ( $stats[$name]['vehicles']['vehicleaa']['time'] / 60), 2),
                ),
                'vehicleah' => array(
                    'oftotal' => @round((100 / $stats[$name]['vehicles']['vehiclesair']['score']) * $array['stats']['scores']['vehicleah'], 0),
                    'spm' => @round($array['stats']['scores']['vehicleah'] / ( $stats[$name]['vehicles']['vehicleah']['time'] / 60), 2),
                ),
                'vehiclesh' => array(
                    'oftotal' => @round((100 / $stats[$name]['vehicles']['vehiclesair']['score']) * $array['stats']['scores']['vehiclesh'], 0),
                    'spm' => @round($array['stats']['scores']['vehiclesh'] / ( $stats[$name]['vehicles']['vehiclesh']['time'] / 60), 2),
                ),
                'vehiclejet' => array(
                    'oftotal' => @round((100 / $stats[$name]['vehicles']['vehiclesair']['score']) * $array['stats']['scores']['vehiclejet'], 0),
                    'spm' => @round($array['stats']['scores']['vehiclejet'] / ( $stats[$name]['vehicles']['vehiclejet']['time'] / 60), 2),
                ),
            );

            // Additional stats vehiclesground
            $stats[$name]['vehicles']['vehiclesground']['timeoftotal'] = @round((100 / $array['stats']['global']['time']) * ($stats[$name]['vehicles']['vehiclesground']['time']), 2);
            $stats[$name]['vehicles']['vehiclesground']['spm'] = @round(($array['stats']['scores']['vehiclembt'] + $array['stats']['scores']['vehicleaa'] + $array['stats']['scores']['vehicleifv']) / ($stats[$name]['vehicles']['vehiclesground']['time'] / 60), 0);
            $stats[$name]['spmground'] = @round(($array['stats']['scores']['vehiclembt'] + $array['stats']['scores']['vehicleaa'] + $array['stats']['scores']['vehicleifv']) / ($stats[$name]['vehicles']['vehiclesground']['time'] / 60), 2);
            $stats[$name]['vehicles']['vehiclesground']['spmoftotal'] = @round((100 / $stats[$name]['spm']) * (@round(($array['stats']['scores']['vehiclembt'] + $array['stats']['scores']['vehicleaa'] + $array['stats']['scores']['vehicleifv']) / ($stats[$name]['vehicles']['vehiclesground']['time'] / 60), 2)), 2);
            $stats[$name]['vehicles']['vehiclesground']['killsoftotal'] = @round((100 / $array['stats']['global']['kills']) * $stats[$name]['vehicles']['vehiclesground']['kills'], 2);
            $stats[$name]['vehicles']['vehiclesground']['scoreoftotal'] = @round((100 / $array['stats']['scores']['score']) * $stats[$name]['vehicles']['vehiclesground']['score'], 2);

            // Additional stats vehiclesair
            $stats[$name]['vehicles']['vehiclesair']['timeoftotal'] = @round((100 / $array['stats']['global']['time']) * ($stats[$name]['vehicles']['vehiclesair']['time']), 2);
            $stats[$name]['vehicles']['vehiclesair']['spm'] = @round(($array['stats']['scores']['vehiclesh'] + $array['stats']['scores']['vehicleah'] + $array['stats']['scores']['vehiclejet']) / ($stats[$name]['vehicles']['vehiclesair']['time'] / 60), 0);
            $stats[$name]['spmair'] = $stats[$name]['vehicles']['vehiclesair']['spm'];
            $stats[$name]['vehicles']['vehiclesair']['spmoftotal'] = @round((100 / $stats[$name]['spm']) * (@round(($array['stats']['scores']['vehiclesh'] + $array['stats']['scores']['vehicleah'] + $array['stats']['scores']['vehiclejet']) / ($stats[$name]['vehicles']['vehiclesair']['time'] / 60), 2)), 2);
            $stats[$name]['vehicles']['vehiclesair']['killsoftotal'] = @round((100 / $array['stats']['global']['kills']) * $stats[$name]['vehicles']['vehiclesair']['kills'], 2);
            $stats[$name]['vehicles']['vehiclesair']['scoreoftotal'] = @round((100 / $array['stats']['scores']['score']) * $stats[$name]['vehicles']['vehiclesair']['score'], 2);

            // Game
            $stats[$name]['gamestotal'] = $array['stats']['global']['elo_games'];
            $stats[$name]['games'] = array(
                'wins' => $array['stats']['global']['wins'],
                'losses' => $array['stats']['global']['losses'],
                'wlratio' => @round($array['stats']['global']['wins'] / $array['stats']['global']['losses'], 2),
                'conquest' => array(
                    'total' => $array['stats']['gamemodes']['conquest']['wins'] + $array['stats']['gamemodes']['conquest']['losses'],
                    'oftotal' => sprintf("%01.2f", @round((100 / $array['stats']['global']['elo_games']) * ($array['stats']['gamemodes']['conquest']['wins'] + $array['stats']['gamemodes']['conquest']['losses']), 2)),
                    'wins' => $array['stats']['gamemodes']['conquest']['wins'],
                    'losses' => $array['stats']['gamemodes']['conquest']['losses'],
                    'wlratio' => @round($array['stats']['gamemodes']['conquest']['wins'] / $array['stats']['gamemodes']['conquest']['losses'], 2),
                ),
                'rush' => array(
                    'total' => $array['stats']['gamemodes']['rush']['wins'] + $array['stats']['gamemodes']['rush']['losses'],
                    'oftotal' => @round((100 / $array['stats']['global']['elo_games']) * ($array['stats']['gamemodes']['rush']['wins'] + $array['stats']['gamemodes']['rush']['losses']), 2),
                    'wins' => $array['stats']['gamemodes']['rush']['wins'],
                    'losses' => $array['stats']['gamemodes']['rush']['losses'],
                    'wlratio' => @round($array['stats']['gamemodes']['rush']['wins'] / $array['stats']['gamemodes']['rush']['losses'], 2),
                ),
                'squadrush' => array(
                    'total' => $array['stats']['gamemodes']['squadrush']['wins'] + $array['stats']['gamemodes']['squadrush']['losses'],
                    'oftotal' => @round((100 / $array['stats']['global']['elo_games']) * ($array['stats']['gamemodes']['squadrush']['wins'] + $array['stats']['gamemodes']['squadrush']['losses']), 2),
                    'wins' => $array['stats']['gamemodes']['squadrush']['wins'],
                    'losses' => $array['stats']['gamemodes']['squadrush']['losses'],
                    'wlratio' => @round($array['stats']['gamemodes']['squadrush']['wins'] / $array['stats']['gamemodes']['squadrush']['losses'], 2),
                ),
                'teamdm' => array(
                    'total' => $array['stats']['gamemodes']['teamdm']['wins'] + $array['stats']['gamemodes']['teamdm']['losses'],
                    'oftotal' => @round((100 / $array['stats']['global']['elo_games']) * ($array['stats']['gamemodes']['teamdm']['wins'] + $array['stats']['gamemodes']['teamdm']['losses']), 2),
                    'wins' => $array['stats']['gamemodes']['teamdm']['wins'],
                    'losses' => $array['stats']['gamemodes']['teamdm']['losses'],
                    'wlratio' => @round($array['stats']['gamemodes']['teamdm']['wins'] / $array['stats']['gamemodes']['teamdm']['losses'], 2),
                ),
                'squaddm' => array(
                    'total' => $array['stats']['gamemodes']['squaddm']['wins'] + $array['stats']['gamemodes']['squaddm']['losses'],
                    'oftotal' => @round((100 / $array['stats']['global']['elo_games']) * ($array['stats']['gamemodes']['squaddm']['wins'] + $array['stats']['gamemodes']['squaddm']['losses']), 2),
                    'wins' => $array['stats']['gamemodes']['squaddm']['wins'],
                    'losses' => $array['stats']['gamemodes']['squaddm']['losses'],
                    'wlratio' => @round($array['stats']['gamemodes']['squaddm']['wins'] / $array['stats']['gamemodes']['squaddm']['losses'], 2),
                ),
            );

            // Best Of
            // Kit
            $max = 0;
            foreach ($array['stats']['scores'] as $key => $data) {
                if (in_array($key, $this->config['kits'])) {
                    if ($data > $max) {
                        $max = $data;
                        $stats[$name]['bestof']['kits']['name'] = $array['stats']['kits'][$key]['name'];
                        $stats[$name]['bestof']['kits']['img'] = $array['stats']['kits'][$key]['img'];
                        $stats[$name]['bestof']['kits']['img_bk'] = $array['stats']['kits'][$key]['img_bk'];
                        $stats[$name]['bestof']['kits']['score'] = $array['stats']['kits'][$key]['score'];
                    }
                }
            }
            // Ground Vehicle
        }
        return $stats;
    }

    public function update_player($name) {
        // Convert data to JSON
        $urlbase64 = array('+' => '-', '/' => '_', '=' => '');
        $data = array();
        $data['ident'] = $this->config['BF3APIIdent'];
        $data['time'] = time();
        $data['player'] = $name;
        $data = strtr(base64_encode(json_encode($data)), $urlbase64);
        $postdata = array();
        $postdata['data'] = $data;
        $postdata['sig'] = strtr(base64_encode(hash_hmac('sha256', $data, $this->config['BF3APIKey'], true)), $urlbase64);

        // Run POST Request via CURL
        $c = curl_init('http://api.bf3stats.com/' . $this->config['platform'] . '/playerupdate/');
        curl_setopt($c, CURLOPT_HEADER, false);
        curl_setopt($c, CURLOPT_POST, true);
        curl_setopt($c, CURLOPT_USERAGENT, 'BF3StatsAPI/0.1');
        curl_setopt($c, CURLOPT_HTTPHEADER, array('Expect:'));
        curl_setopt($c, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($c, CURLOPT_POSTFIELDS, $postdata);
        $data = curl_exec($c);
        $statuscode = curl_getinfo($c, CURLINFO_HTTP_CODE);
        curl_close($c);

        if ($statuscode == 200) {
            // Decode JSON Data
            $data = json_decode($data, true);
            return $data;
        } else {
            echo "BF3 Stats API error status: " . $statuscode;
            return false;
        }
    }

    public function get_last_error() {
        return $this->last_error;
    }

}

$bf3stats = new bf3stats($debug, $config);
?>