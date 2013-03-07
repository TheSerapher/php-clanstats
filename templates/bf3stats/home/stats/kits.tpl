<span class="highlight" onmousemove="ShowContent('statsPopupKit{$COUNTER}');" onmouseover="ShowContent('statsPopupKit{$COUNTER}');" onmouseout="HideContent('statsPopupKit{$COUNTER}');"><img height="23" width="23" src="site_assets/bf3stats/images/{$data.bestof.kits.img}" /></span>
<div id="statsPopupKit{$COUNTER}" class="statsPopup" align="center">
    <div class="popupContent">
        <table width="100%">
            <thead>
                <tr>
                    <th>Kit</th>
                    <th colspan="2">Star Count</th>
                    <th>Progress</th>
                    <th colspan="2">Star Count</th>
                    <th>Score</th>
                </tr>
            </thead>
            {foreach from=$KITS item=kit}
                <tr>
                    <td class="li">{$kit|capitalize} Progress</td>
                    <td class="ri">{$data.kits.$kit.star.count}x</td>
                    <td class="ri"><img class="img-left" width="12px" height="12px" src="site_assets/bf3stats/images/servicestars/servicestar.png"></td>
                    <td class="li">
                        <div class="progress_bar">
                            <strong>{$data.kits.$kit.star.progress}%</strong>
                            <span style="width: {$data.kits.$kit.star.progress}%">&nbsp</span>
                        </div>
                    </td>
                    <td class="li">{$data.kits.$kit.star.count + 1}x</td>
                    <td class="li"><img class="img-left" width="12px" height="12px" src="site_assets/bf3stats/images/servicestars/servicestar.png"></td>
                    <td class="li">{$data.kits.$kit.score} / {$data.kits.$kit.star.needed}</td>
                </tr>
            {/foreach}
        </table>
    </div>
</div>