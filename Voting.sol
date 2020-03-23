pragma solidity 0.5.1;

contract Voting{
    
    /*
    mapping is equivalent to associative array or hash.
    The key of mapping is candidate name stored as type byte32 and 
    value if unsigned integer to store the vote count
    */
    
    mapping (bytes32 => uint256) public votesReceived;
    
    /*
    Solidity doesn't let pass array of string to constructor (yet)
    We will use an array of bytes32 instead to store list of candidates
    */
    
    bytes32[] public candidateList;
    
    /*
    Constructor is called once when you deploy contract to the blockchain.
    When we deploy contract, we will pass array of candidates who will be contesting in election
    */
    
    constructor(bytes32[] memory candidateNames) public{
        candidateList = candidateNames;
    }
    
    /*
    view - function is 'read-only'
    The function returns total number of votes candidate has recieved so far
    */
    
    function totalVotesFor(bytes32 candidateName) view public returns (uint256){
        
        require(validCandidate(candidateName));
        
        return votesReceived[candidateName];
    }
    
    /*
    This function increments vote count for the specified candidate.
    This is equivalent to casting voteForCandidate
    */
    
    function voteForCandidate(bytes32 candidateName) public{
        
        require(validCandidate(candidateName));
        votesReceived[candidateName] += 1;
    }
    
   
    function validCandidate(bytes32 candidateName) view public returns (bool){
        for(uint i=0; i < candidateList.length; i++){
            if(candidateList[i] == candidateName){
                return true;
            }
        }
        return false;
    }    
    
    
}
