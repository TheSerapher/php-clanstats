<span class="highlight" onmousemove="ShowContent('statsPopupTimes{$COUNTER}');" onmouseover="ShowContent('statsPopupTimes{$COUNTER}');" onmouseout="HideContent('statsPopupTimes{$COUNTER}');">{$data.playtime|easy_time:"w d h"}</span>
<div id="statsPopupTimes{$COUNTER}" class="statsPopup" align="center">
    <div class="popupContent">
        <table width="100%">
            <tr>
                <td>Cost per Hour</td>
                <td>{$data.playtimes.per50euro|string_format:"%.2f"} &euro;</td>
            </tr>
            <tr>
                <td>Per day since release</td>
                <td>{$data.playtimes.perday|easy_time}</td>
            </tr>
            {if $data.playtimes.bought}
                <tr>
                    <td>Per day since bought</td>
                    <td>{$data.playtimes.bought|easy_time}</td>
                </tr>                            
            {/if}
        </table>                        
    </div>
</div>