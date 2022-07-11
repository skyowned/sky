import { LightningElement } from 'lwc';

export default class PropertyDemo extends LightningElement {
    message1="Non-reactive property";
    handleChange(event)
    {
        this.message1=  event.target.value;
        console.log(this.message1);
    }
}