<span class="highlight" onmousemove="ShowContent('statsPopupUpdate{$COUNTER}');" onmouseover="ShowContent('statsPopupUpdate{$COUNTER}');" onmouseout="HideContent('statsPopupUpdate{$COUNTER}');">{$data.date_update|date_format:$TIMESTAMP}</span>
<div id="statsPopupUpdate{$COUNTER}" class="statsPopup">
    <div class="popupContent">
        <table width="100%">
            <tr>
                <td>Check Status</td>
                <td>{$data.checkstate}</td>
            </tr>
        </table>
    </div>
</div>