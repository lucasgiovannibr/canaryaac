
# CanaryAAC v0.0.1

CanaryAAC is a free and open-source Automatic Account Creator (AAC) written in MVC-PHP. It supports only MySQL databases.

## Overview

- Fully Object Oriented
- Model/View/Controller (MVC)
- Middlewares
- API
- Composer
  - Fast Route
  - PhpDotEnv
  - Twig
  - Google2FA
  - GuzzleHttp
  - DiscordPHP
  - PagSeguro
  - PayPal
  - MercadoPago
- Using .env to configure

## Getting Started

### Configuration

#### Pre reqs:

- Run db migration script from `migrations` folder
  - An user with username `admin@canaryaac.com` and password `admin` will be created
- Configure `.env` file

### Docker

1. Make sure you are running Canary Server DB

```bash
  docker compose up
```

> If you are not running Canary Server's `docker-compose.yaml` file, you will need to create the `canary` network manually
>> `docker network create canary`

### Debian / Ubuntu

```bash
  sudo apt install php-bcmath
  sudo apt install php-curl
  sudo apt install php-dom
  sudo apt install php-gd
  sudo apt install php-mbstring
  sudo apt install php-mysql
  sudo apt install php-pdo
  sudo apt install php-xml
  sudo apt install php-json
```

## API Docs

### Search Characters

```http
  POST /api/v1/searchcharacter
```

| Parâmetro   | Tipo       | Descrição                           |
| :---------- | :--------- | :---------------------------------- |
| `name` | `string` | Pesquisa de personagens. |

#### Client Login

```http
  POST /api/v1/login
```

| Parâmetro   | Tipo       | Descrição                                   |
| :---------- | :--------- | :------------------------------------------ |
| `request`      | `string` | Conexão ao client. |

## Autor

- [@lucasgiovannibr](https://www.github.com/lucasgiovannibr)
