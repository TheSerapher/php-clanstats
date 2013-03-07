<span class="highlight" onmousemove="ShowContent('statsPopupKills{$COUNTER}');" onmouseover="ShowContent('statsPopupKills{$COUNTER}');" onmouseout="HideContent('statsPopupKills{$COUNTER}');">{$data.kills}</span>
<div id="statsPopupKills{$COUNTER}" class="statsPopup">
    <div class="popupContent">
        <table>
            <tr>
                <td>
                    <table width="240">
                        <thead>
                            <tr>
                                <th>Kill Type</th>
                                <th class="ri">Count</th>
                            </tr>
                        </thead>
                        <tr>
                            <td class="li">Per Game</td>
                            <td class="ri">{$data.killsgame|string_format:"%.2f"}</td>
                        </tr>
                        <tr>
                            <td class="li">Per Minute</td>
                            <td class="ri">{$data.killsminute|string_format:"%.2f"}</td>
                        </tr>
                    </table>
                </td><td>
                    <table width="100%">
                        <thead>
                            <tr>
                                <th>Type</th>
                                <th>Weapon</th>
                                <th>% of Total</th>
                                <th class="ri">Count</th>
                            </tr>
                        </thead>
                        <tr>
                            <td class="li">Best Weapon</td>
                            <td class="ri">{$data.bestof.weapons.name}</td>
                            <td>
                                <div class="progress_bar_small">
                                    <strong>{$data.bestof.weapons.oftotal}%</strong>
                                    <span style="width: {$data.bestof.weapons.oftotal}%">&nbsp</span>
                                </div>
                            </td>      

                            <td class="ri">{$data.bestof.weapons.kills}</td>
                        </tr>
                        <tr>
                            <td class="li">Best Vehicle</td>
                            <td class="ri">{$data.bestof.vehicles.name}</td>
                            <td>
                                <div class="progress_bar_small">
                                    <strong>{$data.bestof.vehicles.oftotal}%</strong>
                                    <span style="width: {$data.bestof.vehicles.oftotal}%">&nbsp</span>
                                </div>
                            </td>      
                            <td class="ri">{$data.bestof.vehicles.kills}</td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
</div>