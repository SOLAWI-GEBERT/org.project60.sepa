{*-------------------------------------------------------+
| Project 60 - SEPA direct debit                         |
| Copyright (C) 2013-2014 SYSTOPIA                       |
| Author: B. Endres (endres -at- systopia.de)            |
| http://www.systopia.de/                                |
+--------------------------------------------------------+
| This program is released as free software under the    |
| Affero GPL license. You can redistribute it and/or     |
| modify it under the terms of this license which you    |
| can read by viewing the included agpl.txt or online    |
| at www.gnu.org/licenses/agpl.html. Removal of this     |
| copyright header is strictly prohibited without        |
| written permission from the original author(s).        |
+-------------------------------------------------------*}

<div id="payment_information">
	<fieldset class="billing_mode-group direct_debit_info-group">
	<legend>
	{ts}Direct Debit Information{/ts}
	</legend>

	<div class="crm-section {$form.bank_iban.name}-section">
		<div class="label">{$form.bank_iban.label}</div>
		<div class="content">{$form.bank_iban.html}</div>
		<div class="clear"></div>
	</div>
	<div class="crm-section {$form.bank_bic.name}-section">
		<div class="label">{$form.bank_bic.label}</div>
		<div class="content">{$form.bank_bic.html}</div>
		<div class="clear"></div>
	</div>
	<div class="crm-section {$form.cycle_day.name}-section">
		<div class="label">{$form.cycle_day.label}</div>
		<div class="content">{$form.cycle_day.html}</div>
		<div class="clear"></div>
	</div>
	<div class="crm-section {$form.start_date.name}-section">
		<div class="label">{$form.start_date.label}</div>
		<div class="content">{include file="CRM/common/jcalendar.tpl" elementName=start_date}</div>
		<div class="clear"></div>
	</div>
</div>


<!-- TWEAK THE FORM: -->

<!-- Additional Elements -->
<span id="currency_indicator"><b>EUR</b></span>

<!-- JS Magic -->
<script type="text/javascript">
// translated captions
var label_months = "{ts}month(s){/ts}";
var label_years = "{ts}year(s){/ts}";

// set default time
cj("#start_date").val("{$today}");

{literal}
// fix up the frequency interval field
cj("#frequency_interval").attr('size', 1);
cj("#frequency_interval").attr('maxlength', 2);
cj("#frequency_interval").attr('class', null);

// adjust frequency unit counter labels
cj("#frequency_unit > option[value='month']").text(label_months);
cj("#frequency_unit > option[value='year']").text(label_years);

// set currency to EUR
cj(".other_amount-content > input").parent().append(cj("#currency_indicator"));


// disable the recur_selector fields if disabled
function _is_recur_visualize() {
	var is_recur = cj("#is_recur").attr('checked')=='checked';
	cj("#frequency_interval").attr('disabled', !is_recur);
	cj("#frequency_unit").attr('disabled', !is_recur);
	cj("#cycle_day").parent().parent().attr('hidden', !is_recur);
}
cj("#is_recur").change(_is_recur_visualize);
_is_recur_visualize();

</script>
{/literal}