
{if $DebuggerInfo}
    <!-- This will be loaded if we have debug information available -->
    <a href="#" id="toggle" class="toggle">Debugger Console</a>
    <div id="panel">
        <div id="DebuggerConsole">
            <table width="50%">
                <thead>
                    <tr>
                        <th width="15"><b>Level</b></th>
                        <th width="65"><b>Time</b></th>
                        <th width="*"><b>Backtrace</b></th>
                        <th width="*"><b>Message</b></th>
                    </tr>
                </thead>
                <tbody>
                    {section name=debug loop=$DebuggerInfo}
                        <tr class="{cycle values="even,odd"}">
                            <td align="center">{$DebuggerInfo[debug].level}</td>
                            <td align="center">{$DebuggerInfo[debug].time}</td>
                            <td align="left">
                                <ul>
                                {foreach from=$DebuggerInfo[debug].backtrace item=backtrace}
                                    <li>
                                        <span style="display:inline-block; width:25px;">{$backtrace.line}</span>
                                        <span style="display:inline-block; width:200px">{$backtrace.file}</span>
                                        <span style="display:inline-block;">{$backtrace.function}</span>
                                    </li>
                                {/foreach}
                                </ul>
                            </td>
                            <td align="left">{$DebuggerInfo[debug].message}</td>
                        </tr>
                    {/section}
                </tbody>
            </table>

        </div>
    </div>
{/if}