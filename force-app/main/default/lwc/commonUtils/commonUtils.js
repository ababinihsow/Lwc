const getMaxDayForThisMonth = (currentDate) => {
    if(currentDate.getMonth() === 12) {
        return 31;
    } else {
        const tmpDate = new Date(currentDate.getFullYear(),currentDate.getMonth() + 1,1);
        return (new Date(tmpDate - 24*60*60*1000)).getDate();
    }
};

export {getMaxDayForThisMonth};