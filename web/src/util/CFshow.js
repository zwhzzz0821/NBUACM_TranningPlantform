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

export {getRatingColor};