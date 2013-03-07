<span class="highlight" onmousemove="ShowContent('statsPopupScore{$COUNTER}');" onmouseover="ShowContent('statsPopupScore{$COUNTER}');" onmouseout="HideContent('statsPopupScore{$COUNTER}');">{$data.score}</span>
<div id="statsPopupScore{$COUNTER}" class="statsPopup" align="center">
    <div class="popupContent">
        <table>
            <tr>
                <td>
                    <table width="100%">
                        <thead>
                            <tr>
                                <th>Score Type</th>
                                <th colspan="2" class="ri">Score</th>
                                <th>&nbsp;&nbsp;&nbsp;</th>
                                <th>Score Type</th>
                                <th colspan="2" class="ri">Score</th>
                            </tr>
                        </thead>
                        <tr>
                            <td colspan="2" class="li">Per Game</td>
                            <td class="ri">{$data.scores.game}</td>
                            <td>&nbsp;&nbsp;&nbsp;</td>
                            <td colspan="2" class="li">Total</td>
                            <td class="ri">{$data.scores.total}</td>
                        </tr>
                        <tr>
                            <td class="li">Objective</td>
                            <td>
                                <div class="progress_bar_small">
                                    <strong>{$data.scores.objectivepart}%</strong>
                                    <span style="width: {$data.scores.objectivepart}%">&nbsp</span>
                                </div>
                            </td>
                            <td class="ri">{$data.scores.objective}</td>
                            <td>&nbsp;&nbsp;&nbsp;</td>
                            <td class="li">Squad</td>
                            <td>
                                <div class="progress_bar_small">
                                    <strong>{$data.scores.squadpart}%</strong>
                                    <span style="width: {$data.scores.squadpart}%">&nbsp</span>
                                </div>
                            </td>
                            <td class="ri">{$data.scores.squad}</td>
                        </tr>
                        <tr>
                            <td class="li">Team</td>
                            <td>
                                <div class="progress_bar_small">
                                    <strong>{$data.scores.teampart}%</strong>
                                    <span style="width: {$data.scores.teampart}%">&nbsp</span>
                                </div>
                            </td>
                            <td class="ri">{$data.scores.team}</td>
                            <td>&nbsp;&nbsp;&nbsp;</td>
                            <td class="li">General</td>
                            <td>
                                <div class="progress_bar_small">
                                    <strong>{$data.scores.generalpart}%</strong>
                                    <span style="width: {$data.scores.generalpart}%">&nbsp</span>
                                </div>
                            </td>
                            <td class="ri">{$data.scores.general}</td>
                        </tr>
                        <tr>
                            <td class="li">Awards</td>
                            <td>
                                <div class="progress_bar_small">
                                    <strong>{$data.scores.awardpart}%</strong>
                                    <span style="width: {$data.scores.awardpart}%">&nbsp</span>
                                </div>
                            </td>
                            <td class="ri">{$data.scores.award}</td>
                            <td>&nbsp;&nbsp;&nbsp;</td>
                            <td class="li">Bonus</td>
                            <td>
                                <div class="progress_bar_small">
                                    <strong>{$data.scores.bonuspart}%</strong>
                                    <span style="width: {$data.scores.bonuspart}%">&nbsp</span>
                                </div>
                            </td>
                            <td class="ri">{$data.scores.bonus}</td>
                        </tr>
                        <tr>
                            <td class="li">Unlocks</td>
                            <td>
                                <div class="progress_bar_small">
                                    <strong>{$data.scores.unlockpart}%</strong>
                                    <span style="width: {$data.scores.unlockpart}%">&nbsp</span>
                                </div>
                            </td>
                            <td class="ri">{$data.scores.unlock}</td>
                            <td>&nbsp;&nbsp;&nbsp;</td>
                            <td class="li">Kits</td>
                            <td>
                                <div class="progress_bar_small">
                                    <strong>{$data.scores.kitspart}%</strong>
                                    <span style="width: {$data.scores.kitspart}%">&nbsp</span>
                                </div>
                            </td>
                            <td class="ri">{$data.scores.kits}</td>
                        </tr>
                        <tr>
                            <td class="li">Ground Vehicles</td>
                            <td>
                                <div class="progress_bar_small">
                                    <strong>{$data.vehicles.vehiclesground.scoreoftotal}%</strong>
                                    <span style="width: {$data.vehicles.vehiclesground.scoreoftotal}%">&nbsp</span>
                                </div>
                            </td>
                            <td class="ri">{$data.vehicles.vehiclesground.score}</td>
                            <td>&nbsp;&nbsp;&nbsp;</td>
                            <td class="li">Air Vehicles</td>
                            <td>
                                <div class="progress_bar_small">
                                    <strong>{$data.vehicles.vehiclesair.scoreoftotal}%</strong>
                                    <span style="width: {$data.vehicles.vehiclesair.scoreoftotal}%">&nbsp</span>
                                </div>
                            </td>
                            <td class="ri">{$data.vehicles.vehiclesair.score}</td>
                        </tr>
                    </table>
                </td>
                <td valign="top">

                </td>
            </tr>
        </table>
    </div>
</div>