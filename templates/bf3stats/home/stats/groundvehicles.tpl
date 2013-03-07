<span class="highlight" onmousemove="ShowContent('statsPopupGround{$COUNTER}');" onmouseover="ShowContent('statsPopupGround{$COUNTER}');" onmouseout="HideContent('statsPopupGround{$COUNTER}');">{$data.vehicles.vehiclesground.spm}</span>
                    <div id="statsPopupGround{$COUNTER}" class="statsPopup">
                        <div class="popupContent">
                            <table width="100%">
                                <thead>
                                    <tr>
                                        <th>Type</th>
                                        <th>% of Total</th>
                                        <th colspan="2" class="ri">Count</th>
                                    </tr>
                                </thead>
                                <tr>
                                    <td class="li">Total Score</td>
                                    <td>
                                        <div class="progress_bar_small">
                                            <strong>{$data.vehicles.vehiclesground.scoreoftotal}%</strong>
                                            <span style="width: {$data.vehicles.vehiclesground.scoreoftotal}%">&nbsp</span>
                                        </div>
                                    </td>                                      
                                    <td class="ri">{$data.vehicles.vehiclesground.score}</td>
                                </tr>
                                <tr>
                                    <td class="li">SPM</td>
                                    <td>
                                        <div class="progress_bar_small">
                                            <strong>{$data.vehicles.vehiclesground.spmoftotal}%</strong>
                                            <span style="width: {$data.vehicles.vehiclesground.spmoftotal}%">&nbsp</span>
                                        </div>
                                    </td>  
                                    <td class="ri">{$data.vehicles.vehiclesground.spm}</td>
                                </tr>
                                <tr>
                                    <td class="li">Time</td>
                                    <td>
                                        <div class="progress_bar_small">
                                            <strong>{$data.vehicles.vehiclesground.timeoftotal}%</strong>
                                            <span style="width: {$data.vehicles.vehiclesground.timeoftotal}%">&nbsp</span>
                                        </div>
                                    </td>  
                                    <td class="ri">{$data.vehicles.vehiclesground.time|easy_time}</td>
                                </tr>
                                <tr>
                                    <td class="li">Kills</td>
                                    <td>
                                        <div class="progress_bar_small">
                                            <strong>{$data.vehicles.vehiclesground.killsoftotal}%</strong>
                                            <span style="width: {$data.vehicles.vehiclesground.killsoftotal}%">&nbsp</span>
                                        </div>
                                    </td>  
                                    <td class="ri">{$data.vehicles.vehiclesground.kills}</td>
                                </tr>                   
                                <tr>
                                    <td class="li">Destroys</td>
                                    <td colspan="2" class="ri">{$data.vehicles.vehiclesground.destroys}</td>
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
                                    <td class="li">Main Battle Tank</td>
                                    <td>
                                        <div class="progress_bar_small">
                                            <strong>{$data.scores.vehicles.vehiclembt.oftotal}%</strong>
                                            <span style="width: {$data.scores.vehicles.vehiclembt.oftotal}%">&nbsp</span>
                                        </div>
                                    </td>                               
                                    <td class="ri">{$data.scores.vehiclembt}</td>
                                    <td class="ri">{$data.vehicles.vehiclembt.time|easy_time}</td>
                                    <td class="ri">{$data.scores.vehicles.vehiclembt.spm|string_format:"%.2f"}</td>
                                    <td class="ri">{$data.vehicles.vehiclembt.kills}</td>
                                    <td class="ri">{$data.vehicles.vehiclembt.kpm|string_format:"%.2f"}</td>
                                    <td class="ri">{$data.vehicles.vehiclembt.destroys}</td>
                                </tr>
                                <tr>
                                    <td class="li">Anti Air</td>
                                    <td>
                                        <div class="progress_bar_small">
                                            <strong>{$data.scores.vehicles.vehicleaa.oftotal}%</strong>
                                            <span style="width: {$data.scores.vehicles.vehicleaa.oftotal}%">&nbsp</span>
                                        </div>
                                    </td>                               
                                    <td class="ri">{$data.scores.vehicleaa}</td>
                                    <td class="ri">{$data.vehicles.vehicleaa.time|easy_time}</td>
                                    <td class="ri">{$data.scores.vehicles.vehicleaa.spm|string_format:"%.2f"}</td>
                                    <td class="ri">{$data.vehicles.vehicleaa.kills}</td>
                                    <td class="ri">{$data.vehicles.vehicleaa.kpm|string_format:"%.2f"}</td>
                                    <td class="ri">{$data.vehicles.vehicleaa.destroys}</td>
                                </tr>
                                <tr>
                                    <td class="li">Infantry Fighting Vehicle</td>
                                    <td>
                                        <div class="progress_bar_small">
                                            <strong>{$data.scores.vehicles.vehicleifv.oftotal}%</strong>
                                            <span style="width: {$data.scores.vehicles.vehicleifv.oftotal}%">&nbsp</span>
                                        </div>
                                    </td>                               
                                    <td class="ri">{$data.scores.vehicleifv}</td>
                                    <td class="ri">{$data.vehicles.vehicleifv.time|easy_time}</td>
                                    <td class="ri">{$data.scores.vehicles.vehicleifv.spm|string_format:"%.2f"}</td>
                                    <td class="ri">{$data.vehicles.vehicleifv.kills}</td>
                                    <td class="ri">{$data.vehicles.vehicleifv.kpm|string_format:"%.2f"}</td>
                                    <td class="ri">{$data.vehicles.vehicleifv.destroys}</td>
                                </tr>
                            </table>
                        </div>
                    </div>