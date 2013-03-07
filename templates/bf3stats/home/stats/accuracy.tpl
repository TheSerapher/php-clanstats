<span class="highlight" onmousemove="ShowContent('statsPopupAccuracy{$COUNTER}');" onmouseover="ShowContent('statsPopupAccuracy{$COUNTER}');" onmouseout="HideContent('statsPopupAccuracy{$COUNTER}');">{$data.accuracy|string_format:"%.2f"}</span>
<div id="statsPopupAccuracy{$COUNTER}" class="statsPopup" align="center">
    <div class="popupContent">
        <table width="100%">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Weapon</th>
                    <th>Shots</th>
                    <th>Hits</th>
                    <th>HShots</th>
                    <th>Accuracy</th>

                </tr>
            </thead>
            {foreach from=$data.weapons key=id item=values}
                {if  $values@iteration == 11} 
                    {break}
                {/if}
                <tr>
                    <td>{$values@iteration}</td>
                    <td class="li">{$values.name}</td>
                    <td class="ri">{$values.shots}</td>
                    <td class="ri">{$values.hits}</td>
                    <td class="ri">{$values.headshots}</td>
                    <td class="ri">
                        <div class="progress_bar_small">
                            <strong>{$values.accuracy}%</strong>
                            <span style="width: {$values.accuracy}%">&nbsp;</span>
                        </div>      
                    </td>
                </tr>
            {/foreach}
        </table>
    </div>
</div>