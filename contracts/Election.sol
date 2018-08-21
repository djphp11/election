pragma solidity ^0.4.2;
import "./SafeMath.sol";

contract Election {
	using SafeMath for uint256;
	// Model a Candidate
	
	struct Candidate {
		uint id;
		string name;
		uint voteCount;
	}

	// Store accounts that have voted
	mapping(address => bool) public voters;


	// Store Candidates
	// Fetch Candidates
	mapping(uint => Candidate) public candidates;
	

	uint public candidatesCount;
	// Store Candidates Count

	function Election () public {
		addCandidate("Candidate 1");
		addCandidate("Candidate 2");	
	}


	function addCandidate (string _name) private {
		candidatesCount = candidatesCount.add(1);
		candidates[candidatesCount] = Candidate(candidatesCount, _name, 0); 
	}

	function vote (uint _candidateId) public {
        // require that they haven't voted before
        require(!voters[msg.sender]);

        // require a valid candidate
        require(_candidateId > 0 && _candidateId <= candidatesCount);

        // record that voter has voted
        voters[msg.sender] = true;

        // update candidate vote Count
        candidates[_candidateId].voteCount ++;

	}

}






