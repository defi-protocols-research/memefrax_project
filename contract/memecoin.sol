pragma solidity 0.8.22;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract memecoin is ERC20,Ownable{

    uint rate ;
    constructor(string memory name,string memory symbol,uint totalsupply,address owner)ERC20(name,symbol)Ownable(owner){
       _mint(msg.sender,totalsupply*10**18);
    }
    
    //Assume 1$fraxeth == 1000000$meme
    function setRate(uint _rate)public onlyOwner{
        rate = _rate*10**decimals();
    }
    
    // convert fraxeth to memecoin
    function convertFraxToMeme(uint amount)public view returns(uint) {
         
    }

     // convert fraxeth to memecoin
    function convertMemeToFrax(uint amount)public view returns(uint) {
         uint fraxamount = (amount*10**decimals() * 1 ether)/rate;
         return fraxamount;
    }

     function buyMeme(uint amount)public {
        // require(msg.value)
    }
   
}

contract memefactory{

      struct memeId{
        address memeAdrress;
        string  name;  
    }
    uint public counterId=1;
    mapping (uint=>memeId)public memeIdentifcation;
    
    
      function createMemecoin(string memory name,string memory symbol,uint totalsupply,address owner)public{
          memeId storage _memeId =  memeIdentifcation[counterId];
          memecoin _memecoin =new memecoin(name,symbol,totalsupply,owner);
          _memeId.memeAdrress=address(_memecoin);
          _memeId.name=name;
          counterId++;
    }
}


