<span class="highlight" onmousemove="ShowContent('statsPopupGame{$COUNTER}');" onmouseover="ShowContent('statsPopupGame{$COUNTER}');" onmouseout="HideContent('statsPopupGame{$COUNTER}');">{$data.gamestotal}</span>
<div id="statsPopupGame{$COUNTER}" class="statsPopup">
    <div class="popupContent">
        <table width="100%">
            <thead>
                <tr>
                    <th>Type</th>
                    <th class="ri">Count</th>
                </tr>
            </thead>
            <tr>
                <td class="li">Wins</td><td class="ri">{$data.games.wins}</td>
            </tr>
            <tr>
                <td class="li">Losses</td><td class="ri">{$data.games.losses}</td>
            </tr>
            <tr>
                <td class="li">Ratio</td><td class="ri">{$data.games.wlratio|string_format:"%.2f"}</td>
            </tr>
        </table>
        <table width="100%">
            <thead>
                <tr>
                    <th>Gamemode</th>
                    <th>% of Total</th>
                    <th class="ri">Count</th>
                    <th>Wins</th>
                    <th>Losses</th>
                    <th>W/L Ratio</th>
                </tr>
            </thead>
            <tr>
                <td class="li">Conquest</td>
                <td>
                    <div class="progress_bar_small">
                        <strong>{$data.games.conquest.oftotal}%</strong>
                        <span style="width: {$data.games.conquest.oftotal}%">&nbsp</span>
                    </div>
                </td>  
                <td class="ri">{$data.games.conquest.total}</td>
                <td class="ri">{$data.games.conquest.wins}</td>
                <td class="ri">{$data.games.conquest.losses}</td>
                <td class="ri">{$data.games.conquest.wlratio|string_format:"%.2f"}</td>
            </tr>
            <tr>
                <td class="li">Rush</td>
                <td>
                    <div class="progress_bar_small">
                        <strong>{$data.games.rush.oftotal}%</strong>
                        <span style="width: {$data.games.rush.oftotal}%">&nbsp</span>
                    </div>
                </td>  
                <td class="ri">{$data.games.rush.total}</td>
                <td class="ri">{$data.games.rush.wins}</td>
                <td class="ri">{$data.games.rush.losses}</td>
                <td class="ri">{$data.games.rush.wlratio|string_format:"%.2f"}</td>
            </tr>
            <tr>
                <td class="li">Squad Rush</td>
                <td>
                    <div class="progress_bar_small">
                        <strong>{$data.games.squadrush.oftotal}%</strong>
                        <span style="width: {$data.games.squadrush.oftotal}%">&nbsp</span>
                    </div>
                </td>  
                <td class="ri">{$data.games.squadrush.total}</td>
                <td class="ri">{$data.games.squadrush.wins}</td>
                <td class="ri">{$data.games.squadrush.losses}</td>
                <td class="ri">{$data.games.squadrush.wlratio|string_format:"%.2f"}</td>
            </tr>
            <tr>
                <td class="li">Team DM</td>
                <td>
                    <div class="progress_bar_small">
                        <strong>{$data.games.teamdm.oftotal}%</strong>
                        <span style="width: {$data.games.teamdm.oftotal}%">&nbsp</span>
                    </div>
                </td>  
                <td class="ri">{$data.games.teamdm.total}</td>
                <td class="ri">{$data.games.teamdm.wins}</td>
                <td class="ri">{$data.games.teamdm.losses}</td>
                <td class="ri">{$data.games.teamdm.wlratio|string_format:"%.2f"}</td>
            </tr>
            <tr>
                <td class="li">Squad DM</td>
                <td>
                    <div class="progress_bar_small">
                        <strong>{$data.games.squaddm.oftotal}%</strong>
                        <span style="width: {$data.games.squaddm.oftotal}%">&nbsp</span>
                    </div>
                </td>  
                <td class="ri">{$data.games.squaddm.total}</td>
                <td class="ri">{$data.games.squaddm.wins}</td>
                <td class="ri">{$data.games.squaddm.losses}</td>
                <td class="ri">{$data.games.squaddm.wlratio|string_format:"%.2f"}</td>
            </tr>
        </table>
    </div>
</div>