const path = require('path');
const fs = require('fs');
const solc = require('solc');

const lotteryPath = path.resolve(__dirname, 'contracts', 'Lottery.sol');
const source = fs.readFileSync(lotteryPath, 'utf8');

// Export the giant object
module.exports = solc.compile(source, 1).contracts[':Lottery'];

// bytecode -- actual code of contract and executed on blockchain
// interface - contract ABI (communication layer between solidity and JS)
