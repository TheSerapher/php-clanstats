<span class="highlight" onmousemove="ShowContent('statsPopupMedals{$COUNTER}');" onmouseover="ShowContent('statsPopupMedals{$COUNTER}');" onmouseout="HideContent('statsPopupMedals{$COUNTER}');">{$data.medalstotal}</span>
<div id="statsPopupMedals{$COUNTER}" class="statsPopup" align="center">
    <div class="popupContent">
        <img src="site_assets/bf3stats/images/{$data.bestof.medals.img}" border="0"/><br>
        <table width="100%">
            <tr>
                <td class="li">Most Common</td>
                <td class="ri">{$data.bestof.medals.name}</td>
                <td class="ri">{$data.bestof.medals.count}x</td>
            </tr>
            <tr>
                <td class="li">Unique Progress</td>
                <td>
                    <div class="progress_bar">
                        <strong>{$data.medals.progress}%</strong>
                        <span style="width: {$data.medals.progress}%">&nbsp</span>
                    </div>
                </td>
                <td class="ri">{$data.medals.unique} / {$data.medals.available}</td>                                
            </tr>
        </table>
    </div>
</div>