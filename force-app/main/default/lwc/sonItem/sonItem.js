import { LightningElement, api } from 'lwc';

export default class SonItem extends LightningElement {
    @api itemName = 'test';
    changeItemName() {
        this.itemName = 'change item name';
    }
}