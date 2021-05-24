# Ansible Playbook

Este playbook possui três roles:

* Apache2
* CloudWatch Agent
* Certbot

## CloudWatch Agent

Configura o cloudwatch agent para enviar metricas de CPU, RAM e utilização de disco para o CloudWatch Metrics.


## Apache2

Instala e configura o Apache2 para hospedar uma aplicação simples.

Removendo assinaturas de versão e sistema operacional, desabilitando indexação de paginas para previnir possiveis vazamentos e fazendo utlização de headers `Header set X-Content-Type-Options: "nosniff"
` e `Header set X-Frame-Options: "sameorigin"` para prevenção de alguns tipos de ataques.
`

Para mais informações consultar a doc do MDN.

[X-Content-Type-Options](https://developer.mozilla.org/pt-BR/docs/Web/HTTP/Headers/X-Content-Type-Options)

[X-Frame-Options](https://developer.mozilla.org/pt-BR/docs/Web/HTTP/Headers/X-Frame-Options)



## Certbot

Instala e configura o uso de certificados para o domino setado na variavel `domain` e alertas sobre o certificado emitido na variavel `cert_email`.

Também é adicionado um cron job para renovação automatica de certificados.