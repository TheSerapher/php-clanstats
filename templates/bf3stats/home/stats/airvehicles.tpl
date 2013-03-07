<span class="highlight" onmousemove="ShowContent('statsPopupAir{$COUNTER}');" onmouseover="ShowContent('statsPopupAir{$COUNTER}');" onmouseout="HideContent('statsPopupAir{$COUNTER}');">{$data.vehicles.vehiclesair.spm}</span>
<div id="statsPopupAir{$COUNTER}" class="statsPopup">
    <div class="popupContent">
        <table width="100%">
            <thead>
                <tr>
                    <th>Type</th>
                    <th>% of Total</th>
                    <th class="ri">Count</th>
                </tr>
            </thead>
            <tr>
                <td class="li">Total Score</td>
                <td>
                    <div class="progress_bar_small">
                        <strong>{$data.vehicles.vehiclesair.scoreoftotal}%</strong>
                        <span style="width: {$data.vehicles.vehiclesair.scoreoftotal}%">&nbsp</span>
                    </div>
                </td>                                    
                <td class="ri">{$data.vehicles.vehiclesair.score}</td>
            </tr>
            <tr>
                <td class="li">SPM</td>
                <td>
                    <div class="progress_bar_small">
                        <strong>{$data.vehicles.vehiclesair.spmoftotal}%</strong>
                        <span style="width: {$data.vehicles.vehiclesair.spmoftotal}%">&nbsp</span>
                    </div>
                </td>  
                <td class="ri">{$data.vehicles.vehiclesair.spm}</td>
            </tr>
            <tr>
                <td class="li">Time</td>
                <td>
                    <div class="progress_bar_small">
                        <strong>{$data.vehicles.vehiclesair.timeoftotal}%</strong>
                        <span style="width: {$data.vehicles.vehiclesair.timeoftotal}%">&nbsp</span>
                    </div>
                </td>  
                <td class="ri">{$data.vehicles.vehiclesair.time|easy_time}</td>
            </tr>
            <tr>
                <td class="li">Kills</td>
                <td>
                    <div class="progress_bar_small">
                        <strong>{$data.vehicles.vehiclesair.killsoftotal}%</strong>
                        <span style="width: {$data.vehicles.vehiclesair.killsoftotal}%">&nbsp</span>
                    </div>
                </td>  
                <td class="ri">{$data.vehicles.vehiclesair.kills}</td>
            </tr>                   
            <tr>
                <td class="li">Destroys</td>
                <td colspan="2" class="ri">{$data.vehicles.vehiclesair.destroys}</td>
            </tr>                                
        </table>
        <table width="100%">
            <thead>
                <tr>
                    <th>Class</th>
                    <th>% of Vehicle Score</th>
                    <th class="ri">Score</th>
                    <th class="ri">Time</th>
                    <th class="ri">SPM</th>
                    <th class="ri">Kills</th>
                    <th class="ri">KPM</th>
                    <th class="ri">Destroys</th>
                </tr>
            </thead>
            <tr>
                <td class="li">Attack Helicopter</td>
                <td>
                    <div class="progress_bar_small">
                        <strong>{$data.scores.vehicles.vehicleah.oftotal}%</strong>
                        <span style="width: {$data.scores.vehicles.vehicleah.oftotal}%">&nbsp</span>
                    </div>
                </td>                                       
                <td class="ri">{$data.scores.vehicleah}</td>
                <td class="ri">{$data.vehicles.vehicleah.time|easy_time}</td>
                <td class="ri">{$data.scores.vehicles.vehicleah.spm|string_format:"%.2f"}</td>
                <td class="ri">{$data.vehicles.vehicleah.kills}</td>
                <td class="ri">{$data.vehicles.vehicleah.kpm|string_format:"%.2f"}</td>
                <td class="ri">{$data.vehicles.vehicleah.destroys}</td>
            </tr>
            <tr>
                <td class="li">Scout Helicopter</td>
                <td>
                    <div class="progress_bar_small">
                        <strong>{$data.scores.vehicles.vehiclesh.oftotal}%</strong>
                        <span style="width: {$data.scores.vehicles.vehiclesh.oftotal}%">&nbsp</span>
                    </div>
                </td>                                       
                <td class="ri">{$data.scores.vehiclesh}</td>
                <td class="ri">{$data.vehicles.vehiclesh.time|easy_time}</td>
                <td class="ri">{$data.scores.vehicles.vehiclesh.spm|string_format:"%.2f"}</td>
                <td class="ri">{$data.vehicles.vehiclesh.kills}</td>
                <td class="ri">{$data.vehicles.vehiclesh.kpm|string_format:"%.2f"}</td>
                <td class="ri">{$data.vehicles.vehiclesh.destroys}</td>
            </tr>
            <tr>
                <td class="li">Jet</td>
                <td>
                    <div class="progress_bar_small">
                        <strong>{$data.scores.vehicles.vehiclejet.oftotal}%</strong>
                        <span style="width: {$data.scores.vehicles.vehiclejet.oftotal}%">&nbsp</span>
                    </div>
                </td>                                       
                <td class="ri">{$data.scores.vehiclejet}</td>
                <td class="ri">{$data.vehicles.vehiclejet.time|easy_time}</td>
                <td class="ri">{$data.scores.vehicles.vehiclejet.spm|string_format:"%.2f"}</td>
                <td class="ri">{$data.vehicles.vehiclejet.kills}</td>
                <td class="ri">{$data.vehicles.vehiclejet.kpm|string_format:"%.2f"}</td>
                <td class="ri">{$data.vehicles.vehiclejet.destroys}</td>
            </tr>
        </table>
    </div>               
</div>
