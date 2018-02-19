{foreach from=$contributions item="contribution"}
8750P{$contribution.receive_date|replace:'-':''|truncate:8:""}{"%-5.5s"|sprintf:$ta875_BC_ZP}{$ta875_EDAT}{"%-5.5s"|sprintf:$ta875_BC_ZE}{"%-5.5s"|sprintf:$creditor.identifier}{counter assign=index print=false}{"%07d"|sprintf:$index}{"%-35.35s"|sprintf:$creditor.identifier}{$contribution.currency}{"%010.2d"|sprintf:$contribution.total_amount|replace:'.':','}

{"%-34.34s"|$creditor.iban}{"%-35.35s"|sprintf:$creditor.name}
{"%-35.35s"|sprintf:$creditor.address}
{capture assign=cadd2}{$contribution.address|substr:35:35}{/capture}{"%-35.35s"|sprintf:$cadd2}
{capture assign=cadd3}{$contribution.address|substr:70:35}{/capture}{"%-35.35s"|sprintf:$cadd3}

{"%-34.34s"|$contribution.iban}
{"%-35.35s"|sprintf:$contribution.display_name}
{"%-35.35s"|sprintf:$contribution.street_address}
{"%-5.5s"|sprintf:$contribution.postal_code}{"%-30.30s"|sprintf:$contribution.city}
{"%-35.35s"|sprintf:""}

{"%-35.35s"|sprintf:$contribution.message}
{capture assign=msg2}{$contribution.message|substr:35:35}{/capture}{"%-35.35s"|sprintf:$msg2}
{capture assign=msg3}{$contribution.message|substr:70:35}{/capture}{"%-35.35s"|sprintf:$msg3}
{capture assign=msg4}{$contribution.message|substr:105:35}{/capture}{"%-35.35s"|sprintf:$msg4}

A{"%-27.27s"|sprintf:$contribution.end2endID}{"%-9.9s"|sprintf:$ta875_ESR_TN}
{/foreach}