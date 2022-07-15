import { LightningElement, track, wire, api } from 'lwc';
import getContactsRelatedToAccount from 
'@salesforce/apex/LwcController.getContactsRelatedToAccount';
export default class AccountRelatedContacts extends LightningElement {
    @api recordId;
    @track contacts;
    @track columns = [
        { label: 'First Name', fieldName: 'FirstName', type: 'text' },
        { label: 'Last Name', fieldName: 'LastName', type: 'text' },
        { label: 'Email', fieldName: 'Email'}
    ];

    @wire(getContactsRelatedToAccount, {accountId: '$recordId'}) 
    WireContactRecords({error, data}){
        if(data){
            this.contacts = data;
            this.error = undefined;
        }else{
            this.error = error;
            this.contacts = undefined;
        }
    }
}