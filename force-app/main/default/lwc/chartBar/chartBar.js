import { LightningElement, track, api } from 'lwc';

export default class ChartBar extends LightningElement {
    @track percentage;
    @api get formatedPercentage(){
        return this.percentage;
    }

    set formatedPercentage(value) {
        if (isNaN(value) || value == '') {
            this.percentage = 0;
        } else {
            const integerValue = parseInt(value);
            if (integerValue < 0) {
                this.percentage = 0;
            } else if(integerValue > 100) {
                this.percentage = 100;
            } else {
                this.percentage = integerValue;
            }
        }
    }
}