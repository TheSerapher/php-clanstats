<span class="highlight" onmousemove="ShowContent('statsPopupRibbons{$COUNTER}');" onmouseover="ShowContent('statsPopupRibbons{$COUNTER}');" onmouseout="HideContent('statsPopupRibbons{$COUNTER}');">{$data.ribbonstotal}</span>
<div id="statsPopupRibbons{$COUNTER}" class="statsPopup" align="center">
    <div class="popupContent">
        <img src="site_assets/bf3stats/images/{$data.bestof.ribbons.img}" border="0" /><br>
        <table width="100%">
            <tr>
                <td class="li">Most Common</td>
                <td class="ri">{$data.bestof.ribbons.name}</td>
                <td class="ri">{$data.bestof.ribbons.count}x</td>
            </tr>
            <tr>
                <td class="li">Unique Progress</td>
                <td>
                    <div class="progress_bar">
                        <strong>{$data.ribbons.progress}%</strong>
                        <span style="width: {$data.ribbons.progress}%">&nbsp</span>
                    </div>
                </td>
                <td class="ri">{$data.ribbons.unique} / {$data.ribbons.available}</td>                                
            </tr>
        </table>
    </div>
</div>