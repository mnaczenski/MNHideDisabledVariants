{extends file="parent:frontend/detail/config_step.tpl"}

    {block name='frontend_detail_group_selection'}
        <div class="field--select{if $groupID gt 0 && empty($sArticle.sConfigurator[$pregroupID].user_selected)} is--disabled{/if}">
            <span class="arrow"></span>
            <select{if $groupID gt 0 && empty($sArticle.sConfigurator[$pregroupID].user_selected)} disabled="disabled"{/if} name="group[{$sConfigurator.groupID}]"{if $theme.ajaxVariantSwitch} data-ajax-select-variants="true"{else} data-auto-submit="true"{/if}>
                {* Please select... *}
                {if empty($sConfigurator.user_selected)}
                    <option value="" selected="selected">{s name="DetailConfigValueSelect"}{/s}</option>
                {/if}

                {foreach from=$sConfigurator.values item=configValue name=option key=optionID}
                    {if $configValue.selectable}
                        <option {if !$configValue.selectable}disabled{/if} {if $configValue.selected && $sConfigurator.user_selected} selected="selected"{/if} value="{$configValue.optionID}">
                        {$configValue.optionname}{if $configValue.upprice && !$configValue.reset} {if $configValue.upprice > 0}{/if}{/if}
                        {if !$configValue.selectable}{s name="DetailConfigValueNotAvailable"}{/s}{/if}
                    {/if}
                    </option>
                {/foreach}
            </select>
        </div>
    {/block}
