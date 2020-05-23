import { LightningElement, track, api } from 'lwc';

export default class CurrentTime extends LightningElement {
    @track currentTime = new Date();

    @api refreshTime() {
        this.currentTime = new Date();
    }
}