<span class="highlight" onmousemove="ShowContent('statsPopupMVP{$COUNTER}');" onmouseover="ShowContent('statsPopupMVP{$COUNTER}');" onmouseout="HideContent('statsPopupMVP{$COUNTER}');">{$data.mvptotal}</span>
<div id="statsPopupMVP{$COUNTER}" class="statsPopup" align="center">
    <div class="popupContent">
        <img src="site_assets/bf3stats/images/awards_s/r16.png" title="MVP 1,2 & 3 Ribbons Per Game" alt="MVP All Ribbons" border="0"/><br>
        <table width="100%">
            <thead>
                <tr>
                    <th>MVP Type</th>
                    <th class="ri">% of Total</th>
                    <th class="ri">% of total Games</th>
                    <th>Count</th>
                </tr>
            </thead>                                    
            <tr>
                <td class="li" colspan="2">All</td>
                <td align="right">
                    <div class="progress_bar_small">
                        <strong>{$data.mvptotalratio}%</strong>
                        <span style="width: {$data.mvptotalratio}%">&nbsp</span>
                    </div>
                </td>
                <td class="ri">{$data.mvptotal}</td>
            </tr>
            <tr>
                <td class="li">MVP1</td>
                <td>
                    <div class="progress_bar_small">
                        <strong>{$data.mvp.mvp1.oftotal}%</strong>
                        <span style="width: {$data.mvp.mvp1.oftotal}%">&nbsp</span>
                    </div>
                </td>
                <td align="right">
                    <div class="progress_bar_small">
                        <strong>{$data.mvp.mvp1.ofgames}%</strong>
                        <span style="width: {$data.mvp.mvp1.ofgames}%">&nbsp</span>
                    </div>
                </td>
                <td class="ri">{$data.mvp.mvp1.count}</td>
            </tr>
            <tr>
                <td class="li">MVP2</td>
                <td>
                    <div class="progress_bar_small">
                        <strong>{$data.mvp.mvp2.oftotal}%</strong>
                        <span style="width: {$data.mvp.mvp2.oftotal}%">&nbsp</span>
                    </div>
                </td>                                
                <td align="right">
                    <div class="progress_bar_small">
                        <strong>{$data.mvp.mvp2.ofgames}%</strong>
                        <span style="width: {$data.mvp.mvp2.ofgames}%">&nbsp</span>
                    </div>
                </td>
                <td class="ri">{$data.mvp.mvp2.count}</td>
            </tr>
            <tr>
                <td class="li">MVP3</td>
                <td>
                    <div class="progress_bar_small">
                        <strong>{$data.mvp.mvp3.oftotal}%</strong>
                        <span style="width: {$data.mvp.mvp3.oftotal}%">&nbsp</span>
                    </div>
                </td>                                
                <td align="right">
                    <div class="progress_bar_small">
                        <strong>{$data.mvp.mvp3.ofgames}%</strong>
                        <span style="width: {$data.mvp.mvp3.ofgames}%">&nbsp</span>
                    </div>
                </td>
                <td class="ri">{$data.mvp.mvp3.count}</td>
            </tr>
        </table>
    </div>
</div>