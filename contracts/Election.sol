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

	// Store Candidates
	mapping(uint => Candidate) public candidates;
	// Fetch Candidates

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



}