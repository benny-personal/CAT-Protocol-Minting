# CAT-Protocol-Minting

repo of minting cat protocol

## k8s 部署 fractal bitcoin 与 cat-protocol-indexer

> - 会使用默认的 storageClass 存储数据
> - 使用的是 apisix 作为 API Gateway, 因此此处使用的是 apisixRoute.

修改 `k8s/fractal-cat/kustomization.yaml` 内 TODO 内容为所需配置

- 用于将 fractal bitcoin 与 cat-protocol-indexer 部署到某台节点上

```yaml
nodeSelector: 
  kubernetes.io/hostname: TODO
```

- 用于配置域名, 需要将 `example.com TODO` 替换为自己的域名

```yaml
- example.com TODO
```

## 准备运行环境

1. 下载已经提前准备好各种环境的 image, 并进入 container

`docker run -it jinbangyi/cat-token-box-tools:v0.0.2 /bin/bash`

2. 修改 `config.json` 文件

修改下列两项为自己的 indexer 与 fractal bitcoin 节点

- `"tracker": "https://cat-token-box.example.com"`
- `"url": "https://bitcoind-fractal.example.com"`

```json
{
  "network": "fractal-mainnet",
  "tracker": "https://cat-token-box.example.com",
  "dataDir": ".",
  "maxFeeRate": 1000,
  "rpc": {
      "url": "https://bitcoind-fractal.example.com",
      "username": "bitcoin",
      "password": "opcatAwesome"
  }
}
```

3. 创建钱包

`yarn cli wallet create`

4. 将创建好的钱包导入 UniSat

`cat wallet.json` `"mnemonic"` 后面内容为助记词

[钱包导入 UniSat](钱包导入UniSat.md)

## 准备 Token

[购买FB](购买FB.md)

## Mint Cat

到目前为止你已经

- 备份了钱包
- 充值了 FB

现在可以 Mint Cat 了!

回到上面的 docker 内，执行 `bash mint.sh`。

现在你的地址会一直 mint cat token，直到没有 FB

## 其他

如果你不小心关闭了 Docker, 没有关系。

重新执行 `准备运行环境` 里的步骤1与步骤2

之后创建文件 `wallet.json`, 将 mnemonic 后的内容改为你助记词即可

```json
{
  "accountPath": "m/86'/0'/0'/0/0",
  "name": "cat-f0848020",
  "mnemonic": "a b c d e f g h i g k l"
}
```
