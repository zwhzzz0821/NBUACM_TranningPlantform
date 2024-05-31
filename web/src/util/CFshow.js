function getRatingColor(rating) {
    let color;
    if (rating < 1200) {
      color = "#808080";
    } else if (rating >= 1200 && rating < 1400) {
      color = "#008000";
    } else if (rating >= 1400 && rating < 1600) {
      color = "#03a89e";
    } else if (rating >= 1600 && rating < 1900) {
      color = "#0000ff";
    } else if (rating >= 1900 && rating < 2100) {
      color = "#aa00aa";
    } else if (rating >= 2100 && rating < 2400) {
      color = "#ff8c00";
    } else if (rating >= 2400) {
      color = "#ff0000";
    }
    return color;
}

function timeStamp(value) {
  let date = new Date(value); //时间戳为10位需*1000，时间戳为13位的话不需乘1000
  let year = date.getFullYear();
  let month = ("0" + (date.getMonth() + 1)).slice(-2);
  let sdate = ("0" + date.getDate()).slice(-2);
  let hour = ("0" + date.getHours()).slice(-2);
  let minute = ("0" + date.getMinutes()).slice(-2);
  let second = ("0" + date.getSeconds()).slice(-2);
  let result = year + "." + month + "." + sdate + " " + hour + ":" + minute + ":" + second;
  // 返回
  return result;
}

export {getRatingColor, timeStamp};