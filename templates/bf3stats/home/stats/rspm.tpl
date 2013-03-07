<span class="highlight" onmousemove="ShowContent('statsPopupRSPM{$COUNTER}');" onmouseover="ShowContent('statsPopupRSPM{$COUNTER}');" onmouseout="HideContent('statsPopupRSPM{$COUNTER}');">{$data.rspm}</span>
<div id="statsPopupRSPM{$COUNTER}" class="statsPopup">
    <div class="popupContent">
        <table width="220">
            <thead>
                <tr>
                    <th>Real SPM Type</th>
                    <th class="ri">Score</th>
                </tr>
            </thead>
            <tr>
                <td class="li">Assault</td><td class="ri">{$data.kits.assault.spm}</td>
            </tr>
            <tr>
                <td class="li">Engineer</td><td class="ri">{$data.kits.engineer.spm}</td>
            </tr>
            <tr>
                <td class="li">Support</td><td class="ri">{$data.kits.support.spm}</td>
            </tr>
            <tr>
                <td class="li">Recon</td><td class="ri">{$data.kits.recon.spm}</td>
            </tr>
        </table>
    </div>
</div>