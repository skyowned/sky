<!--<aura:application extends="force:slds">
  <aura:attribute name="selectedLookUpRecord" type="sObject" default="{}"/>
 
  <c:customLookup objectAPIName="account" IconName="standard:account" selectedRecord="{!v.selectedLookUpRecord}" label="Account Name"/>
</aura:application>-->

<aura:application access="GLOBAL" extends="ltng:outApp">
    <aura:attribute name="selectedLookUpRecord" type="sObject" default="{}"/>
    <aura:dependency resource="c:customLookup"/>
    <aura:dependency resource="c:customLookupResult"/>
</aura:application>