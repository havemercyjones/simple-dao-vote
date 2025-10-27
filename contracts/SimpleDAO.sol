// contracts/SimpleDAO.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SimpleDAO {
    struct Proposal {
        string desc;
        uint256 yes;
        uint256 no;
    }

    Proposal[] public props;

    function create(string calldata d) external {
        props.push(Proposal(d, 0, 0));
    }

    function vote(uint256 id, bool y) external {
        require(id < props.length, "invalid id");
        Proposal storage p = props[id];
        if (y) p.yes++; else p.no++;
    }

    function get(uint256 id) external view returns (string memory, uint256, uint256) {
        Proposal storage p = props[id];
        return (p.desc, p.yes, p.no);
    }
}
