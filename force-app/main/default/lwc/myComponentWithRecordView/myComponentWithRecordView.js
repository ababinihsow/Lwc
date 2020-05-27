import { LightningElement, api } from 'lwc';

export default class MyComponentWithRecordView extends LightningElement {
    @api recordId;
    @api objectApiName;
}