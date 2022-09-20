#!/usr/bin/node

const AnotherSquare = require('./5-square');

module.exports = class Square extends AnotherSquare {
  charPrint (c) {
    if (typeof c === 'undefined') {
      super.print();
    } else {
      for (let i = 0; i < this.height; i++) {
        let ch = '';
        for (let j = 0; j < this.width; j++) {
          ch += c;
        }
        console.log(ch);
      }
    }
  }
};
