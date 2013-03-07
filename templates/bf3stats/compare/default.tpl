<div class="contentBox" align="center">
    <table width="170">
        <form action="{$smarty.server.PHP_SELF}" method="POST">
            <input type="hidden" name="page" value="compare" />
            <td>{html_options name=player1 output=$PLAYERS values=$PLAYERS selected=$smarty.request.player1}</td>
            <td>{html_options name=player2 output=$PLAYERS values=$PLAYERS selected=$smarty.request.player2}</td>
            <td><input type="submit" value="Compare" /></td>
        </form>
    </table>
    {if $smarty.request.player1 && $smarty.request.player2}
        <table width="350">
            <thead>
                <tr>
                    <th>Statistic</th>
                    <th align="left" colspan="2">{$smarty.request.player1}</th>
                    <th align="left" colspan="2">{$smarty.request.player2}</th>
                </tr>
            </thead>
            <tr>
                <td>
                    <span class="highlight" onmousemove="ShowContent('statsPopupScore');" onmouseover="ShowContent('statsPopupScore');" onmouseout="HideContent('statsPopupScore');"">Score</span>
                    <div id="statsPopupScore" class="statsPopup" align="center">
                        <div class="popupContent">
                            <table width="300">
                                <thead>
                                    <tr>
                                        <th>Score Type</th>
                                        <th colspan="4" align="center">Score</th>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <th colspan="2">{$smarty.request.player1}</th>
                                        <th colspan="2">{$smarty.request.player2}</th>
                                    </tr>
                                </thead>
                                <tr>
                                    <td class="li">Per Game</td>
                                    <td class="ri">{$PLAYER1.scores.game}</td>
                                    <td class="arrow {arrows a=$PLAYER1.scores.game b=$PLAYER2.scores.game}"></td>
                                    <td class="ri">{$PLAYER2.scores.game}</td>
                                    <td class="arrow {arrows a=$PLAYER2.scores.game b=$PLAYER1.scores.game}"></td>
                                </tr>
                                <tr>
                                    <td class="li">Assault</td>
                                    <td class="ri">{$PLAYER1.kits.assault.score}</td>
                                    <td class="arrow {arrows a=$PLAYER1.kits.assault.score b=$PLAYER2.kits.assault.score}"></td>
                                    <td class="ri">{$PLAYER2.kits.assault.score}</td>
                                    <td class="arrow {arrows a=$PLAYER2.kits.assault.score b=$PLAYER1.kits.assault.score}"></td>                                    
                                </tr>
                                <tr>
                                    <td class="li">Engineer</td>
                                    <td class="ri">{$PLAYER1.kits.engineer.score}</td>
                                    <td class="arrow {arrows a=$PLAYER1.kits.engineer.score b=$PLAYER2.kits.engineer.score}"></td>
                                    <td class="ri">{$PLAYER2.kits.engineer.score}</td>
                                    <td class="arrow {arrows a=$PLAYER2.kits.engineer.score b=$PLAYER1.kits.engineer.score}"></td>                                    
                                </tr>
                                <tr>
                                    <td class="li">Support</td>
                                    <td class="ri">{$PLAYER1.kits.support.score}</td>
                                    <td class="arrow {arrows a=$PLAYER1.kits.support.score b=$PLAYER2.kits.support.score}"></td>
                                    <td class="ri">{$PLAYER2.kits.support.score}</td>
                                    <td class="arrow {arrows a=$PLAYER2.kits.support.score b=$PLAYER1.kits.support.score}"></td>                                    
                                </tr>
                                <tr>
                                    <td class="li">Recon</td>
                                    <td class="ri">{$PLAYER1.kits.recon.score}</td>
                                    <td class="arrow {arrows a=$PLAYER1.kits.recon.score b=$PLAYER2.kits.recon.score}"></td>
                                    <td class="ri">{$PLAYER2.kits.recon.score}</td>
                                    <td class="arrow {arrows a=$PLAYER2.kits.recon.score b=$PLAYER1.kits.recon.score}"></td>                                    
                                </tr>
                            </table>
                        </div>
                    </div>
                </td>
                <td class="ri">{$PLAYER1.score}</td>
                <td class="arrow {arrows a=$PLAYER1.score b=$PLAYER2.score}"></td>
                <td class="ri">{$PLAYER2.score}</td>
                <td class="arrow {arrows a=$PLAYER2.score b=$PLAYER1.score}"></td>
            </tr>
            <tr>
                <td>
                    <span class="highlight" onmousemove="ShowContent('statsPopupVehicles');" onmouseover="ShowContent('statsPopupVehicles');" onmouseout="HideContent('statsPopupVehicles');">Vehicle Score</span>
                    <div id="statsPopupVehicles" class="statsPopup" align="center">
                        <div class="popupContent">
                            <table width="350">
                                <thead>
                                    <tr>
                                        <th>Score Type</th>
                                        <th colspan="4" align="center">Score</th>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <th colspan="2">{$smarty.request.player1}</th>
                                        <th colspan="2">{$smarty.request.player2}</th>
                                    </tr>
                                </thead>
                                <tr>
                                    <td class="li">Attack Chooper Score</td>
                                    <td class="ri">{$PLAYER1.scores.vehicleah}</td>
                                    <td class="arrow {arrows a=$PLAYER1.scores.vehicleah b=$PLAYER2.scores.vehicleah}"></td>
                                    <td class="ri">{$PLAYER2.scores.vehicleah}</td>
                                    <td class="arrow {arrows a=$PLAYER2.scores.vehicleah b=$PLAYER1.scores.vehicleah}"></td>
                                </tr>
                                <tr>
                                    <td class="li">Scout Chooper Score</td>
                                    <td class="ri">{$PLAYER1.scores.vehiclesh}</td>
                                    <td class="arrow {arrows a=$PLAYER1.scores.vehiclesh b=$PLAYER2.scores.vehiclesh}"></td>
                                    <td class="ri">{$PLAYER2.scores.vehiclesh}</td>
                                    <td class="arrow {arrows a=$PLAYER2.scores.vehiclesh b=$PLAYER1.scores.vehiclesh}"></td>
                                </tr>
                                <tr>
                                    <td class="li">Attack Chooper Score</td>
                                    <td class="ri">{$PLAYER1.scores.vehicleah}</td>
                                    <td class="arrow {arrows a=$PLAYER1.scores.vehicleah b=$PLAYER2.scores.vehicleah}"></td>
                                    <td class="ri">{$PLAYER2.scores.vehicleah}</td>
                                    <td class="arrow {arrows a=$PLAYER2.scores.vehicleah b=$PLAYER1.scores.vehicleah}"></td>
                                </tr>
                                <tr>
                                    <td class="li">Jet Score</td>
                                    <td class="ri">{$PLAYER1.scores.vehiclejet}</td>
                                    <td class="arrow {arrows a=$PLAYER1.scores.vehiclejet b=$PLAYER2.scores.vehiclejet}"></td>
                                    <td class="ri">{$PLAYER2.scores.vehiclejet}</td>
                                    <td class="arrow {arrows a=$PLAYER2.scores.vehiclejet b=$PLAYER1.scores.vehiclejet}"></td>
                                </tr>
                                <tr>
                                    <td class="li">MBT Score</td>
                                    <td class="ri">{$PLAYER1.scores.vehiclembt}</td>
                                    <td class="arrow {arrows a=$PLAYER1.scores.vehiclembt b=$PLAYER2.scores.vehiclembt}"></td>
                                    <td class="ri">{$PLAYER2.scores.vehiclembt}</td>
                                    <td class="arrow {arrows a=$PLAYER2.scores.vehiclembt b=$PLAYER1.scores.vehiclembt}"></td>
                                </tr>
                                <tr>
                                    <td class="li">IFV Score</td>
                                    <td class="ri">{$PLAYER1.scores.vehicleifv}</td>
                                    <td class="arrow {arrows a=$PLAYER1.scores.vehicleifv b=$PLAYER2.scores.vehicleifv}"></td>
                                    <td class="ri">{$PLAYER2.scores.vehicleifv}</td>
                                    <td class="arrow {arrows a=$PLAYER2.scores.vehicleifv b=$PLAYER1.scores.vehicleifv}"></td>
                                </tr>
                                <tr>
                                    <td class="li">AA Score</td>
                                    <td class="ri">{$PLAYER1.scores.vehicleaa}</td>
                                    <td class="arrow {arrows a=$PLAYER1.scores.vehicleaa b=$PLAYER2.scores.vehicleaa}"></td>
                                    <td class="ri">{$PLAYER2.scores.vehicleaa}</td>
                                    <td class="arrow {arrows a=$PLAYER2.scores.vehicleaa b=$PLAYER1.scores.vehicleaa}"></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </td>
                <td class="ri">{$PLAYER1.scores.vehicleall}</td>
                <td class="arrow {arrows a=$PLAYER1.scores.vehicleall b=$PLAYER2.scores.vehicleall}"></td>
                <td class="ri">{$PLAYER2.scores.vehicleall}</td>
                <td class="arrow {arrows a=$PLAYER2.scores.vehicleall b=$PLAYER1.scores.vehicleall}"></td>
            </tr>
                <td>
                    <span class="highlight" onmousemove="ShowContent('statsPopupSPM');" onmouseover="ShowContent('statsPopupSPM');" onmouseout="HideContent('statsPopupSPM');">SPM</span>
                    <div id="statsPopupSPM" class="statsPopup" align="center">
                        <div class="popupContent">
                            <table width="380">
                                <thead>
                                    <tr>
                                        <th>SPM Type</th>
                                        <th colspan="4" align="center">Count</th>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <th colspan="2">{$smarty.request.player1}</th>
                                        <th colspan="2">{$smarty.request.player2}</th>
                                    </tr>
                                </thead>
                                <tr>
                                    <td class="li">Real SPM</td>
                                    <td class="ri">{$PLAYER1.rspm}</td>
                                    <td class="arrow {arrows a=$PLAYER1.rspm b=$PLAYER2.rspm}"></td>
                                    <td class="ri">{$PLAYER2.rspm}</td>
                                    <td class="arrow {arrows a=$PLAYER2.rspm b=$PLAYER1.rspm}"></td>
                                </tr>
                                <tr>
                                    <td class="li">Ground Vehicle SPM</td>
                                    <td class="ri">{$PLAYER1.vehicles.vehiclesground.spm|string_format:"%.2f"}</td>
                                    <td class="arrow {arrows a=$PLAYER1.vehicles.vehiclesground.spm b=$PLAYER2.vehicles.vehiclesground.spm}"></td>
                                    <td class="ri">{$PLAYER2.vehicles.vehiclesground.spm|string_format:"%.2f"}</td>
                                    <td class="arrow {arrows a=$PLAYER2.vehicles.vehiclesground.spm b=$PLAYER1.vehicles.vehiclesground.spm}"></td>
                                </tr>
                                <tr>
                                    <td class="li">Air Vehicle SPM</td>
                                    <td class="ri">{$PLAYER1.vehicles.vehiclesair.spm|string_format:"%.2f"}</td>
                                    <td class="arrow {arrows a=$PLAYER1.vehicles.vehiclesair.spm b=$PLAYER2.vehicles.vehiclesair.spm}"></td>
                                    <td class="ri">{$PLAYER2.vehicles.vehiclesair.spm|string_format:"%.2f"}</td>
                                    <td class="arrow {arrows a=$PLAYER2.vehicles.vehiclesair.spm b=$PLAYER1.vehicles.vehiclesair.spm}"></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </td>
                <td class="ri">{$PLAYER1.spm}</td>
                <td class="arrow {arrows a=$PLAYER1.spm b=$PLAYER2.spm}"></td>
                <td class="ri">{$PLAYER2.spm}</td>
                <td class="arrow {arrows a=$PLAYER2.spm b=$PLAYER1.spm}"></td>
            </tr>
            <tr>
                <td>
                    <span class="highlight" onmousemove="ShowContent('statsPopupKills');" onmouseover="ShowContent('statsPopupKills');" onmouseout="HideContent('statsPopupKills');">Kills</span>
                    <div id="statsPopupKills" class="statsPopup">
                        <div class="popupContent">
                            <table width="300">
                                <thead>
                                    <tr>
                                        <th>Kill Type</th>
                                        <th colspan="4" align="center">Count</th>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <th colspan="2">{$smarty.request.player1}</th>
                                        <th colspan="2">{$smarty.request.player2}</th>
                                    </tr>
                                </thead>
                                <tr>
                                    <td class="li">Per Game</td>
                                    <td class="ri">{$PLAYER1.killsgame|string_format:"%.2f"}</td>
                                    <td class="arrow {arrows a=$PLAYER1.killsgame b=$PLAYER2.killsgame}"></td>
                                    <td class="ri">{$PLAYER2.killsgame|string_format:"%.2f"}</td>
                                    <td class="arrow {arrows a=$PLAYER2.killsgame b=$PLAYER1.killsgame}"></td>
                                </tr>
                                <tr>
                                    <td class="li">Per Minute</td>
                                    <td class="ri">{$PLAYER1.killsminute|string_format:"%.2f"}</td>
                                    <td class="arrow {arrows a=$PLAYER1.killsminute b=$PLAYER2.killsminute}"></td>
                                    <td class="ri">{$PLAYER2.killsminute|string_format:"%.2f"}</td>
                                    <td class="arrow {arrows a=$PLAYER2.killsminute b=$PLAYER1.killsminute}"></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </td>
                <td class="ri">{$PLAYER1.kills}</td>
                <td class="arrow {arrows a=$PLAYER1.kills b=$PLAYER2.kills}"></td>
                <td class="ri">{$PLAYER2.kills}</td>
                <td class="arrow {arrows a=$PLAYER2.kills b=$PLAYER1.kills}"></td>
            </tr>
            <tr>
                <td>
                    <span class="highlight" onmousemove="ShowContent('statsPopupDeaths');" onmouseover="ShowContent('statsPopupDeaths');" onmouseout="HideContent('statsPopupDeaths');">Deaths</span>
                    <div id="statsPopupDeaths" class="statsPopup">
                        <div class="popupContent">
                            <table width="300">
                                <thead>
                                    <tr>
                                        <th>Death Type</th>
                                        <th colspan="4" align="center">Count</th>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <th colspan="2">{$smarty.request.player1}</th>
                                        <th colspan="2">{$smarty.request.player2}</th>
                                    </tr>
                                </thead>
                                <tr>
                                    <td class="li">Per Game</td>
                                    <td class="ri">{$PLAYER1.deathsgame|string_format:"%.2f"}</td>
                                    <td class="arrow {arrows a=$PLAYER1.deathsgame b=$PLAYER2.deathsgame}"></td>
                                    <td class="ri">{$PLAYER2.deathsgame|string_format:"%.2f"}</td>
                                    <td class="arrow {arrows a=$PLAYER2.deathsgame b=$PLAYER1.deathsgame}"></td>
                                </tr>
                                <tr>
                                    <td class="li">Per Minute</td>
                                    <td class="ri">{$PLAYER1.deathsminute|string_format:"%.2f"}</td>
                                    <td class="arrow {arrows a=$PLAYER1.deathsminute b=$PLAYER2.deathsminute}"></td>
                                    <td class="ri">{$PLAYER2.deathsminute|string_format:"%.2f"}</td>
                                    <td class="arrow {arrows a=$PLAYER2.deathsminute b=$PLAYER1.deathsminute}"></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </td>
                <td class="ri">{$PLAYER1.deaths}</td>
                <td class="arrow {arrows a=$PLAYER1.deaths b=$PLAYER2.deaths}"></td>
                <td class="ri">{$PLAYER2.deaths}</td>
                <td class="arrow {arrows a=$PLAYER2.deaths b=$PLAYER1.deaths}"></td>
            </tr>
            <tr>
                <td>
                    <span class="highlight" onmousemove="ShowContent('statsPopupMVP');" onmouseover="ShowContent('statsPopupMVP');" onmouseout="HideContent('statsPopupMVP');">MVP</span>
                    <div id="statsPopupMVP" class="statsPopup">
                        <div class="popupContent">
                            <table width="300">
                                <thead>
                                    <tr>
                                        <th>MVP Type</th>
                                        <th colspan="4" align="center">Count</th>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <th colspan="2">{$smarty.request.player1}</th>
                                        <th colspan="2">{$smarty.request.player2}</th>
                                    </tr>
                                </thead>
                                <tr>
                                    <td class="li">MVP Ratio</td>
                                    <td class="ri">{$PLAYER1.mvptotalratio|string_format:"%.2f"}</td>
                                    <td class="arrow {arrows a=$PLAYER1.mvptotalratio b=$PLAYER2.mvptotalratio}"></td>
                                    <td class="ri">{$PLAYER2.mvptotalratio|string_format:"%.2f"}</td>
                                    <td class="arrow {arrows a=$PLAYER2.mvptotalratio b=$PLAYER1.mvptotalratio}"></td>
                                </tr>
                                <tr>
                                    <td class="li">MVP #1</td>
                                    <td class="ri">{$PLAYER1.mvp.mvp1.count}</td>
                                    <td class="arrow {arrows a=$PLAYER1.mvp.mvp1.count b=$PLAYER2.mvp.mvp1.count}"></td>
                                    <td class="ri">{$PLAYER2.mvp.mvp1.count}</td>
                                    <td class="arrow {arrows a=$PLAYER2.mvp.mvp1.count b=$PLAYER1.mvp.mvp1.count}"></td>
                                </tr>
                                <tr>
                                    <td class="li">MVP #2</td>
                                    <td class="ri">{$PLAYER1.mvp.mvp2.count}</td>
                                    <td class="arrow {arrows a=$PLAYER1.mvp.mvp2.count b=$PLAYER2.mvp.mvp2.count}"></td>
                                    <td class="ri">{$PLAYER2.mvp.mvp2.count}</td>
                                    <td class="arrow {arrows a=$PLAYER2.mvp.mvp2.count b=$PLAYER1.mvp.mvp2.count}"></td>
                                </tr>
                                <tr>
                                    <td class="li">MVP #3</td>
                                    <td class="ri">{$PLAYER1.mvp.mvp3.count}</td>
                                    <td class="arrow {arrows a=$PLAYER1.mvp.mvp3 b=$PLAYER2.mvp.mvp3.count}"></td>
                                    <td class="ri">{$PLAYER2.mvp.mvp3.count}</td>
                                    <td class="arrow {arrows a=$PLAYER2.mvp.mvp3 b=$PLAYER1.mvp.mvp3.count}"></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </td>
                <td class="ri">{$PLAYER1.mvptotal}</td>
                <td class="arrow {arrows a=$PLAYER1.mvptotal b=$PLAYER2.mvptotal}"></td>
                <td class="ri">{$PLAYER2.mvptotal}</td>
                <td class="arrow {arrows a=$PLAYER2.mvptotal b=$PLAYER1.mvptotal}"></td>
            </tr>
        </table>
    {/if}
</div>