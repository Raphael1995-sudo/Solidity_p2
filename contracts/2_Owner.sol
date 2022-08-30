// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "hardhat/console.sol";


contract internalwallet
{
    address payable public owner;

    constructor()
    {
        owner = payable(msg.sender);
    }

    receive() external payable {
    }

    function withdraw(uint _amount) payable public
    {
        require(msg.sender == owner && payable(this).balance >= _amount);
        payable(this).transfer(_amount);
    }

    function get_balance() external view returns(uint)
    {
        return(payable(this).balance);
    }
}
/**
 * @title Owner
 * @dev Set & change owner
 */