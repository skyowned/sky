import { LightningElement } from 'lwc';

export default class HelloWorldComponent extends LightningElement {
    greeting='World';
    changeHandler(event)
    {
        this.greeting=event.target.value;
    }
}