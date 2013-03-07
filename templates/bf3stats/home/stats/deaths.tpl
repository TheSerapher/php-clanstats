<span class="highlight" onmousemove="ShowContent('statsPopupDeaths{$COUNTER}');" onmouseover="ShowContent('statsPopupDeaths{$COUNTER}');" onmouseout="HideContent('statsPopupDeaths{$COUNTER}');">{$data.deaths}</span>
<div id="statsPopupDeaths{$COUNTER}" class="statsPopup">
    <div class="popupContent">
        <table width="220">
            <thead>
                <tr>
                    <th>Death Type</th>
                    <th class="ri">Count</th>
                </tr>
            </thead>
            <tr>
                <td class="li">Per Game</td><td class="ri">{$data.deathsgame|string_format:"%.2f"}</td>
            </tr>
            <tr>
                <td class="li">Per Minute</td><td class="ri">{$data.deathsminute|string_format:"%.2f"}</td>
            </tr>
        </table>
    </div>
</div>