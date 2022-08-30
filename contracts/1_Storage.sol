// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/math/SafeMath.sol";

contract timelock{

// overflow and underflow examples and preventions
// one can deposit ether into this contract but you must wait 1 week before you can withdraw your funds

    mapping(address => uint[]) public addressList;

    function set_balance() external payable {
        addressList[payable(msg.sender)][0] = msg.value;
        addressList[payable(msg.sender)][1] = block.timestamp;
    }

    function get_balance() external view returns(uint){ 
       // if(addressList) does exist
        return(addressList[payable(msg.sender)][0]);
    }

    function withdraw_funds() external payable
    {
        require(block.timestamp - addressList[payable(msg.sender)][1] == 7 days);
        require(addressList[payable(msg.sender)][0] > 0);
    
        payable(msg.sender).transfer(addressList[payable(msg.sender)][0]);
        assert(addressList[payable(msg.sender)][0] != 0);
    }
}