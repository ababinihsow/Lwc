import { LightningElement, api } from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

import NAME_FIELD from '@salesforce/schema/Account.Name';
import REVENUE_FIELD from '@salesforce/schema/Account.AnnualRevenue';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
export default class MyComponentWithRecordEdit extends LightningElement {
    @api recordId;
    @api objectApiName;

    fields = [NAME_FIELD,REVENUE_FIELD,INDUSTRY_FIELD];

    handleLoad(event){
        console.log('execute handle load');
    }

    handleSubmit(event){
        console.log('execute handle submit');
        event.preventDefault();
        const fields = event.detail.fields;
        fields.LastName = 'QIN';
        this.template.querySelector('lightning-record-form').submit(fields);
    }

    handleSuccess(event){
        console.log('execute handle success');
        const evt = new ShowToastEvent({
            title : 'Account Operated',
            message : 'Record ID: ' + event.detail.id,
            variant : 'success'
        });

        this.dispatchEvent(evt);
    }

    handleError(event){
        console.log('execute handle error');
        const evt = new ShowToastEvent({
            title : 'Account Operated',
            message : event.detail.message,
            variant : 'error'
        });

        this.dispatchEvent(evt);
    }

    handleCancel(event) {
        console.log('execute handle cancel');
        const evt = new ShowToastEvent({
            title : "Account canceled",
            variant : "cancel"
        });
        this.dispatchEvent(evt);
    }
}