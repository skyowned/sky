import { LightningElement } from 'lwc';

export default class HtmlEventsBasic extends LightningElement {
    message='Welcome Aakash';
    handleChange(event)
    {
        const val=event.target.value;
        const lbl=event.target.label;
        console.log('value is '+val+'& Label is '+lbl);
    }
}