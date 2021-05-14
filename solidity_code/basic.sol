### Type of Solidity variable
In solidity has three variable category 
- Fixed-size type
    - bool 
    - uint 
    - address
    - byte32
- Variable-size type
    - string
    - bytes
    - uint[]
    - mapping(uint => address)
- User-define data
    - struct
```
    struct User {
        unit id;
        address _address;
    }
```
- enum
```
    enum User {
        ALICE,
        BOB
    }
```
### Build-in Variable of Solidity

- blockhash(uint blockNumber) returns (bytes32): hash of the given block - only works for 256 mostrecent,      excluding current, blocks.
- block.coinbase (address): current block miner’s address
- block.difficulty (uint): current block difficulty
- block.gaslimit (uint): current block gaslimit
- block.number (uint): current block number
- block.timestamp (uint): current block timestamp as seconds since unix epoch
- gasleft() returns (uint256): remaining gas
- msg.data (bytes): complete calldata
- msg.gas (uint): remaining gas - deprecated in version 0.4.21 and to be replaced by gasleft()
- msg.sender (address): sender of the message (current call)
- msg.sig (bytes4): first four bytes of the calldata (i.e. function identifier)
- msg.value (uint): number of wei sent with the message
- now (uint): current block timestamp (alias for block.timestamp)
- tx.gasprice (uint): gas price of the transaction
- tx.origin (address): sender of the transaction (full call chain)


### Constructor of Solidity
In solidity you can create construtor by use **constructor()**
- example
```
     contract Mycontract {
        uint a;
        constructor(unit _a) public {
            _a = a;
        }
    }
```
### Declaring function in solidity
To declaring function in solidity use **function Name()**
```
     contract Mycontract {
        uint value;
        function getValue() external view returns(uint) {
            return value;
        }
        
        function setValue(uint _value) external {
            value = _value;
        }
    }
```
note: 
- function **with view** for view only 
- function **without view** for modifies data
- **public** - Public functions are part of the contract interface and can be either called     internally or via messages. For public state variables, an automatic getter function is generated.
- **external** - External functions are part of the contract interface, which means they can be called from other contracts and via transactions. An external function f cannot be called internally (i.e. f()does not work, but this.f() works). External functions are sometimes more efficient when they receive large arrays of data.
- **internal** - Those functions and state variables can only be accessed internally (i.e. from within the current contract or contracts deriving from it), without using this.
- **private** - Private functions and state variables are only visible for the contract they are defined in and not in derived contracts.

### Array of solidity
- Storage arrays
Use to store data into blockchain
```
    contract MyContract {
        uint[] myArray;
        
        function foo() external {
            myArray.push(2); // add value to array
            myArray.push(3);
            
            myArray[0]; // read array element
            myArray[1] = 3; // change array value
            
            delete myArray[1];  // delete array element
            
            for(uint i = 0; i<myArray.lenght; i++) {
                myArray[i]
            }
        }
    }
```
- Memory arrays
Use to store data temporary
```
    contract MyContract {
        function foo() external {
           uint[] memory myArray = new uint[](10);
           
            myArray[1] = 10;  // use can add value only with this method
            myArray[5]; read array element
            
            delete myArray[1]; deleate array element
        }
    }
```
- Array arguments and return arrays from function
Use array in function 
```
    contract MyContract {
        function foo(uint[] calldata _myArray) external {
        }
        
        function bar(uint[] memory _myArray) public {
        }
        
        function foobar(uint[] memory _myArray) internal {
        }
        
        function fool(uint[] memory _myArray) public returns(uint[] memory) {
        }
    }
```

### Mapping in Solidity
```
    contract MyContract {
        // mapping
       mapping(address => uint) balances;
       //nested mapping
       mapping(address => mapping(address => bool) approved;
       //array in mapping
       mapping(address => uint[]) score;
       
       function foo() external {
           // add 
           balances[msg.sender] = 100;
           // read
           balances[msg.send];
           // update
           balances[msge.value] = 120;
           // delete
           delete balances[msg.sender];
           // default value
           balances[someAddressThatDoNotExit] => 0
       }
       
       function bar(address spender) external {
            // add
           approved[msg.sender][spender] = true;
           // read
           approved[msg.sender][spender];
           //update
           approved[msg.sender][spender] = false;
           //delete
           delete approved[msg.sender][spender];
       }
       
       function foolbar() external {
            //add
           score[msg.sender].push(16);
           score[msg.sender].push(76);
           //read
           score[msg.sender][0];
           //update
           score[msg.sender][0] = 80;
           //delete
           delete score[msg.sender][1];
       }
    }
```
### Stuct in Solidity
```
    contract MyContract {
        struct User {
            address addr;
            uint score;
            string name;
        }
        User[] users;
        mapping(addrees => User) userList;
        
        function foo(string calldata _name) external {
            //add
            User memory user1 = User(msg.send, 20, _name);
            User memory user2 = User(name: _name, score: 20, addr: msg.sender);
            //read
            user1.addr;
            //update
            user2.score = 60
            //delete
            delete user1;
            
            //add struct to array
            users.push(user1)
            
            //add strct to mapping
            userList[msg.sender] = user2;
        }
    }
```
