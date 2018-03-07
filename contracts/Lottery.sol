pragma solidity ^0.4.17;

contract Lottery {
    address public manager;
    address[] public players;

    // Constructor function - Automatically called when creating a new instance
    function Lottery() public {
        manager = msg.sender;
    }

    function enter() public payable {
        // Properly converts the ether into wei
        require(msg.value > .01 ether);
        players.push(msg.sender);
    }

    function random() private view returns (uint) {
        return uint(keccak256(block.difficulty, now, players));
    }

    function pickWinner() public restricted {
        require(players.length > 0);
        uint index = random() % players.length;

        // this.balance = current amount in the contract
        // send to a particular address
        players[index].transfer(this.balance);
        // new array of type address + dynamic + initial size of 0
        players = new address[](0);
    }

    function getPlayers() public view returns (address[]) {
        return players;
    }

    modifier restricted() {
        require(msg.sender == manager); // Enforces that the manager can be the only one who picks the winner.
        _;
    }
}
