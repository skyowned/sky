trigger DeleteRestrictInvoice on Invoice__c (before delete) {
List<Invoice__c> invoices = [Select i.Name, (Select Name From Line_Items__r)
From Invoice__c i
Where i.Id IN :Trigger.oldMap.keySet()];
// loop through the Invoices, attaching errors to those that have Line Items
for (Invoice__c invoice : invoices) {
if (!invoice.Line_Items__r.isEmpty()) {
Trigger.oldMap.get(invoice.id).addError('Cannot delete Invoice with Line Items');
}
}
}