# eth jsonrpc

### test getClientVersion
```shell
curl --location --request POST 'localhost:8545/' \
--header 'Content-Type: application/json' \
--data-raw '{
"jsonrpc":"2.0",
"method":"web3_clientVersion",
"params":[],
"id":1
}'

```

### test getEthBlockNumber
```shell
curl --location --request POST 'localhost:8545/' \
--header 'Content-Type: application/json' \
--data-raw '{
	"jsonrpc":"2.0",
	"method":"eth_blockNumber",
	"params":[],
	"id":83
}'
```

```shell
curl --location --request POST 'localhost:9545/' \
--header 'Content-Type: application/json' \
--data-raw '{
	"jsonrpc":"2.0",
	"method":"eth_blockNumber",
	"params":[],
	"id":83
}'
```

### get version
```shell
curl --location --request POST 'localhost:8545/' \
--header 'Content-Type: application/json' \
--data-raw '{
	"jsonrpc":"2.0",
	"method":"net_version",
	"params":[],
	"id":67
}'
```

```shell
curl --location --request POST 'localhost:9545/' \
--header 'Content-Type: application/json' \
--data-raw '{
	"jsonrpc":"2.0",
	"method":"net_version",
	"params":[],
	"id":67
}'
```

- l2_geth_id 17   8545
- l1_geth_id 31337 hardhat 默认chainId  9545

### test getBalance
```shell
curl --location --request POST 'localhost:8545/' \
--header 'Content-Type: application/json' \
--data-raw '{
	"jsonrpc":"2.0",
	"method":"eth_getBalance",
	"params":[
		"0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266", 
		"latest"
	],
	"id":1
}'
```

```shell
curl --location --request POST 'localhost:9545/' \
--header 'Content-Type: application/json' \
--data-raw '{
	"jsonrpc":"2.0",
	"method":"eth_getBalance",
	"params":[
		"0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266", 
		"latest"
	],
	"id":1
}'
```


curl --location --request POST '172.17.0.1:8551/' \
--header 'Content-Type: application/json' \
--data-raw '{
"jsonrpc":"2.0",
"method":"eth_getBalance",
"params":[
"0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266",
"latest"
],
"id":1
}'

