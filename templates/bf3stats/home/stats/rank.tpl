<span class="highlight" onmousemove="ShowContent('statsPopupRank{$COUNTER}');" onmouseover="ShowContent('statsPopupRank{$COUNTER}');" onmouseout="HideContent('statsPopupRank{$COUNTER}');"><img src="site_assets/bf3stats/images/{$data.rankdata.img_tiny}"/></span>
<div id="statsPopupRank{$COUNTER}" class="statsPopup" align="center">
    <div class="popupContent">
        <table width="350">
            <tr>
                <td colspan="2" align="center"><img src="site_assets/bf3stats/images/{$data.rankdata.img_medium}"/></td>
            </tr>
            <tr>
                <td>Name</td>
                <td class="li">{$data.rankdata.name}</td>
            </tr>
            <tr>
                <td>Score</td>
                <td class="li">{$data.score} / {$data.rankdata.nextrankpoints}</td>
            </tr>
            <tr>
                <td>Progress</td>
                <td class="li">
                    <div class="progress_bar">
                        <strong>{$data.rankdata.progress}%</strong>
                        <span style="width: {$data.rankdata.progress}%">&nbsp;</span>
                    </div>                                    
                </td>
            </tr>
        </table>
    </div>
</div>