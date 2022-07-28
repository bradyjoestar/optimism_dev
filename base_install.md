# install op


### 1. install golang
```shell
# Linux typically has wget installed
wget -q -O - https://git.io/vQhTU | bash
```

### 2.install dep
```shell
apt-get install -y  libssl-dev gcc jq
sudo apt-get install -y pkg-config 

sudo apt install build-essential checkinstall zlib1g-dev -y
sudo apt-get install cmake clang lld -y

sudo apt-get install docker.io docker-compose -y


```

### 3. install nodejs and yarn
```shell

curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install -y nodejs

npm install -g yarn


```

### 4. install foundary
```shell
curl -L https://foundry.paradigm.xyz | bash
source ~/.bashrc
foundryup


```



### 5. build
```shell

yarn
yarn build

cd ops
make up

```



###6 .
```shell
warning: Unknown section [default] found in foundry.toml. This notation for profiles has been deprecated and may result in the profile not being registered in future versions. Please use [profile.default] instead or run `forge config --fix`.
warning: Unknown section [default] found in node_modules/excessively-safe-call/foundry.toml. This notation for profiles has been deprecated and may result in the profile not being registered in future versions. Please use [profile.default] instead or run `forge config --fix`.
[⠒] Compiling...
No files changed, compilation skipped
deploying "L2OutputOracleProxy" (tx: 0xdcc81aa1a3647478a085ecc42b2485ff8875e341cdb8d9cdbdc2cb88dda7c92c)...: deployed at 0x5FbDB2315678afecb367f032d93F642f64180aa3 with 523812 gas
deploying "L2OutputOracle" (tx: 0xffbe6758fcc19c8f090b19f15a04ccb214466fba6f81529d6f741277e699ac0f)...: deployed at 0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512 with 1731114 gas
deploying "OptimismPortalProxy" (tx: 0xda53a965578512b78b45418abae1a19855353e9bb48ac6420566e15e63951328)...: deployed at 0xCf7Ed3AccA5a467e9e704C703E8D87F634fB0Fc9 with 523812 gas
deploying "OptimismPortal" (tx: 0x800f8b46089f035056a01ab2e23bc58e5efce9e1a54e94ce8d79778441724b24)...: deployed at 0xDc64a140Aa3E981100a9becA4E685f962f0cF6C9 with 3531852 gas
deploying "L1CrossDomainMessengerProxy" (tx: 0x366c25725ca682619d77e6b7fe3d693f878f7189af5f865acacb07ac4e69865e)...: deployed at 0x0165878A594ca255338adfa4d48449f69242Eb8F with 523812 gas
deploying "L1CrossDomainMessenger" (tx: 0x1abffde82ea7fad98eb5b2adbe3ca11ea547c30f58ca131ac718aaaa14c281a1)...: deployed at 0xa513E6E4b8f2a923D98304ec87F64353C4D5C853 with 2423363 gas
deploying "L1StandardBridgeProxy" (tx: 0x01ecba6e26f43e836ba331480aff8fbe9b51df5aca7364acbf80942e31bf8f57)...: deployed at 0x8A791620dd6260079BF849Dc5567aDC3F2FdC318 with 523812 gas
deploying "L1StandardBridge" (tx: 0xa3d1c03e901f19d48bd7ca0ea595e682218e42c474245c5bc33e670b465ce1ad)...: deployed at 0x610178dA211FEF7D417bC0e6FeD39F05609AD788 with 2831230 gas
deploying "OptimismMintableERC20FactoryProxy" (tx: 0xbde2f231bf5e23bae015df7a4cdbab478a6dad9e8aafe1fcf89af7b090dfd675)...: deployed at 0xA51c1fc2f0D1a1b8494Ed1FE312d7C3a78Ed91C0 with 523812 gas
deploying "OptimismMintableERC20Factory" (tx: 0x9365d16ec01c3ac1c6fde956b117d1c6e38e83b2d578cf92d2893659bdbab3c1)...: deployed at 0x0DCd1Bf9A1b36cE34237eEaFef220932846BCD82 with 1519537 gas

```
