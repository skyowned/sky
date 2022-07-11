import { LightningElement,track,api } from 'lwc';
import findRecords from
 '@salesforce/apex/LookupControllerLWC.findRecords';
export default class CustomLookup1 extends LightningElement {
    @api objectApiName;
    @api fieldApiName;
    @api iconname;
    @track records;

    handleSearch(event)
    {

        const searchValue=event.detail;
        findRecords({
            objectName:this.objectApiName ,
            fieldApiName:this.fieldApiName ,
            searchValue:searchValue
        })
        .then(result=>{
            this.records=result;
            this.error=undefined;
            console.log('Reocrds are ',result);
        })
        .catch(error=>{
            this.records=undefind;
            this.error=error;
            console.log('errors are ',error);
        })

    }
}