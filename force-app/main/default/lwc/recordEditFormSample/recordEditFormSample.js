import { LightningElement, api } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class RecordEditFormSample extends LightningElement {
    @api recordId;
    @api objectApiName;

    handleSubmit(event) {
        event.preventDefault();
        const fields = event.detail.fields;
        if (fields.Industry === null || fields.Industry === '') {
            const evt = new ShowToastEvent({
                title:"アカウント操作に失敗しました",
                message:"アカウント業界は空白にできません",
                variant:"error"
            });
            this.dispatchEvent(evt);
            return;
        }
        this.template.querySelector("lightning-record-edit-form").submit(fields);
    }

    handleLoad(event) {
        console.log('ロードを実行する');
    }

    handleSuccess(event){
        const evt = new ShowToastEvent({
            title:"アカウント操作成功",
            message:"記録は："+event.detail.id,
            variant:"success"
        });
        this.dispatchEvent(evt);
    }

    handleError(event) {
        const evt = new ShowToastEvent({
            title:"アカウント操作失敗",
            message:event.detail.message,
            variant:"error"
        });
        this.dispatchEvent(evt);
    }

    handleReset(event) {
        const inputFields = this.template.querySelectorAll('lightning-input-field');
        if (inputFields) {
            inputFields.forEach(field => {
                field.reset();
            });
        }
    }
}