<div class="contentBox">
    {if $ERROR}
        <div id="error" class="error">{$ERROR}</div>
    {/if}
    <table width="100%">
        <thead>
            <tr>
                <th>#</th>
                <th align="center"><a href="{$smarty.server.PHP_SELF}?sort=rank{if $smarty.request.order == desc && $smarty.request.sort == rank}&order=asc{else}&order=desc{/if}">Rank</a></th>
                <th>Kits</th>
                <th>Name</th>
                <th><a href="{$smarty.server.PHP_SELF}?sort=score{if $smarty.request.order == desc && $smarty.request.sort == score}&order=asc{else}&order=desc{/if}">Score</a></th>
                <th><a href="{$smarty.server.PHP_SELF}?sort=kills{if $smarty.request.order == desc && $smarty.request.sort == kills}&order=asc{else}&order=desc{/if}">Kills</a></th>
                <th><a href="{$smarty.server.PHP_SELF}?sort=deaths{if $smarty.request.order == desc && $smarty.request.sort == deaths}&order=asc{else}&order=desc{/if}">Deaths</a></th>
                <th><a href="{$smarty.server.PHP_SELF}?sort=ratio{if $smarty.request.order == desc && $smarty.request.sort == ratio}&order=asc{else}&order=desc{/if}">K/D</a></th>
                <th><a href="{$smarty.server.PHP_SELF}?sort=spm{if $smarty.request.order == desc && $smarty.request.sort == spm}&order=asc{else}&order=desc{/if}">SPM</a></th>
                <th><a href="{$smarty.server.PHP_SELF}?sort=rspm{if $smarty.request.order == desc && $smarty.request.sort == rspm}&order=asc{else}&order=desc{/if}">Real SPM</a></th>
                <th><a href="{$smarty.server.PHP_SELF}?sort=spmground{if $smarty.request.order == desc && $smarty.request.sort == spmground}&order=asc{else}&order=desc{/if}">Ground SPM</a></th>
                <th><a href="{$smarty.server.PHP_SELF}?sort=spmair{if $smarty.request.order == desc && $smarty.request.sort == spmair}&order=asc{else}&order=desc{/if}">Air SPM</a></th>
                <th><a href="{$smarty.server.PHP_SELF}?sort=skill{if $smarty.request.order == desc && $smarty.request.sort == skill}&order=asc{else}&order=desc{/if}">Skill</a></th>
                <th><a href="{$smarty.server.PHP_SELF}?sort=accuracy{if $smarty.request.order == desc && $smarty.request.sort == accuracy}&order=asc{else}&order=desc{/if}">Accuracy</a></th>
                <th><a href="{$smarty.server.PHP_SELF}?sort=mvptotal{if $smarty.request.order == desc && $smarty.request.sort == mvptotal}&order=asc{else}&order=desc{/if}">MVP</a></th>
                <th><a href="{$smarty.server.PHP_SELF}?sort=gamestotal{if $smarty.request.order == desc && $smarty.request.sort == gamestotal}&order=asc{else}&order=desc{/if}">Games</a></th>
                <th><a href="{$smarty.server.PHP_SELF}?sort=medalstotal{if $smarty.request.order == desc && $smarty.request.sort == medalstotal}&order=asc{else}&order=desc{/if}">Medals</a></th>
                <th><a href="{$smarty.server.PHP_SELF}?sort=ribbonstotal{if $smarty.request.order == desc && $smarty.request.sort == ribbonstotal}&order=asc{else}&order=desc{/if}">Ribbons</a></th>
                <th><a href="{$smarty.server.PHP_SELF}?sort=playtime{if $smarty.request.order == desc && $smarty.request.sort == playtime}&order=asc{else}&order=desc{/if}">Play Time</a></th>
                <th><a href="{$smarty.server.PHP_SELF}?sort=date_update{if $smarty.request.order == desc && $smarty.request.sort == date_update}&order=asc{else}&order=desc{/if}">Last Update</a></th>
            </tr>
        </thead>
        {counter start=0 print=false}
        {foreach from=$STATS key=name item=data}
            {counter assign=COUNTER}
            <tr class="{cycle values="even,odd"}">
                <td>{$COUNTER}</td>
                <td>{include file="$PAGE/stats/rank.tpl"}</td>
                <td>{include file="$PAGE/stats/kits.tpl"}</td>
                <td><a href="http://bf3stats.com/stats_{$PLATFORM}/{$name}/">{$name}</a></td>
                <td align="center">{include file="$PAGE/stats/score.tpl"}</td>
                <td align="center">{include file="$PAGE/stats/kills.tpl"}</td>
                <td align="center">{include file="$PAGE/stats/deaths.tpl"}</td>
                <td align="center">{$data.ratio|string_format:"%.2f"}</td>
                <td align="center">{$data.spm}</td>
                <td align="center">{include file="$PAGE/stats/rspm.tpl"}</td>
                <td align="center">{include file="$PAGE/stats/groundvehicles.tpl"}</td>
                <td align="center">{include file="$PAGE/stats/airvehicles.tpl"}</td>                
                <td align="center">{$data.skill}</td>
                <td align="center">{include file="$PAGE/stats/accuracy.tpl"}</td>
                <td align="center">{include file="$PAGE/stats/mvp.tpl"}</td> 
                <td align="center">{include file="$PAGE/stats/games.tpl"}</td>
                <td align="center">{include file="$PAGE/stats/medals.tpl"}</td>
                <td align="center">{include file="$PAGE/stats/ribbons.tpl"}</td>
                <td align="center">{include file="$PAGE/stats/times.tpl"}</td>
                <td align="center">{include file="$PAGE/stats/update.tpl"}</td>
            </tr>
        {/foreach}
    </table>
</div>
