import { LightningElement } from 'lwc';

export default class HooksExamples extends LightningElement {
    name='Aakash';
    constructor()
    {
        super();
        console.log('inside constructor');
        this.name=this.name+'Ghosh';    
    }
    connectedCallback()
    {
        console.log('inside connectedCallback');
    }
    disconnectedCallback()
    {
        console.log('inside disconnectedCallback');
    }
    renderedCallback()
    {
        console.log('inside renderedCallback');
    }
    /*render()
    {
        return 
    }*/
    errorCallback(error,stack)
    {
        console.log(error);
    }
}