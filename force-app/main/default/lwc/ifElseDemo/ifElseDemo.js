import { LightningElement } from 'lwc';

export default class IfElseDemo extends LightningElement {
    isTom=true;
    isJerry=true;
    showTom()
    {
        this.isTom=true;
        this.isJerry=false;
    }
    showJerry()
    {
        this.isJerry=true;
        this.isTom=false;
    }
}