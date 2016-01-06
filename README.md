## README

## Requisitos

### Rails 5
```
git clone git://github.com/rails/rails.git
 cd rails
 bundle
```

### VISUALIZAR JSON

Utilize o [Postman](https://chrome.google.com/webstore/detail/postman/fhbjgbiflinjbdggehcddcbncdddomop?hl=en)
para get e post

## Faça o clone do projeto

`git@github.com:jsvitolo/busca_cep.git`

`bin/bundle install`

`bin/rake db:migrate`

## BUSCAR CEP (GET)

`http://localhost:3000/busca/00000-000`

## CADASTRAR CEP (POST)

`http://localhost:3000/cadastro`

### Exemplo json

```
{
    "cep": "15030-300",
    "endereco": "Rua jose morais",
    "bairro": "Redentora",
    "cidade": "Rio Preto",
    "estado": "SP"
}
```

## TESTES

```
bin/rake test
```