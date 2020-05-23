import { LightningElement } from 'lwc';

export default class ShowCurrentTime extends LightningElement {
    handleRefresh() {
        this.template.querySelector('c-current-time').refreshTime();
    }
}