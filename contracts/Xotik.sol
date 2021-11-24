pragma solidity ^0.5.0;

/**
 * The Xotik contract does this and that...
 */
contract Xotik {
  string public name = "Xotik";
  string public symbol = "$XOTIK";
  string public standard = "XOTIK v1.0";
  uint256 public totalSupply = 1000000;
  address public owner;


  event Transfer (
    address indexed _from,
    address indexed _to,
    uint256 _value

    );

  event Approval(
  	address indexed _owner,
  	address indexed _spender,
  	uint256 _value
  	);
  

  mapping (address => uint256) public balanceOf;
  mapping (address => mapping (address => uint256)) public allowance;
  
  
  
  constructor(uint256 _initialSupply) public {
    owner = msg.sender;
    balanceOf[owner] = _initialSupply;
    totalSupply = _initialSupply; 
  }

  function transfer (address _to, uint256 _value) public returns(bool success){
      
          require (balanceOf[owner] >= _value, " Insufficient Balance of Sender");

          balanceOf[owner] -= _value;
          balanceOf[_to] += _value;


          emit Transfer (msg.sender, _to, _value);

          return true;
                
  }

   function approve(address _spender, uint256 _value) public returns (bool success) {
        allowance[msg.sender][_spender] = _value;

        emit Approval(msg.sender, _spender, _value);

        return true;
    }

    //transfer from
    function transferFrom (address _from, address _to, uint256 _value) public returns(bool success) {
    	// Require  _from has enough tokens
    	require (_value <= balanceOf[_from], 'Amount should not exceed than balance available');
    	
    	require(_value <= allowance[_from][msg.sender], 'Amount should not exceed allowance');
    	
    	// Require allowance is big enough
    	// Change the balance
    	balanceOf[_from] -= _value;
    	balanceOf[_to]   += _value;
    	// Update the allowance
    	allowance[_from][msg.sender] -=_value;
    	// Transfer event
    	// return a boolean

    	emit Transfer(_from, _to, _value);
    	return true;
    }
    





  
}