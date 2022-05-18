# [Lego](https://go-acme.github.io/lego/)

ACME client supporting Let's Encrypt and custom certificate authorities.

## Variables

| variable        | default value       | notes                                                                                   |
|-----------------|---------------------|-----------------------------------------------------------------------------------------|
| `lego_dns`      | ``                  | (required) DNS provider to use for ACME DNS-01 challenge                                |
| `lego_env`      | ``                  | (required) environment variables to set when running lego                               |
| `lego_email`    | `{{ admin_email }}` | (required) email to use for registration, defaults to the specified homelab admin email |
| `lego_domain`   | `{{ domain }}`      | (required) domain to issue certificates for, defaults to the specified homelab domain   |
| `lego_args`     | ``                  | extra arguments to pass to lego                                                         |
| `lego_packages` | `['lego']`          | packages to install for this role                                                       |

## Notes

[Lego](https://go-acme.github.io/lego/) is the first part of the OBSD Homelab setup as it is going to create the TLS certificates for the homelab domain. The default lego setup uses the DNS-01 challlenge, which allows it to create wildcard certificates for the domain. Lego supports a multitude of DNS providers, listed on [its website](https://go-acme.github.io/lego/dns/).

The first example setup provided on the lego DNS page, which uses Cloudflare, would set the following OBSD Homelab variables in `vars.yml`-

```yml
lego_dns: cloudflare
lego_env:
  CLOUDFLARE_EMAIL: foo@bar.com
  CLOUDFLARE_API_KEY: b9841238feb177a84330febba8a83208921177bffe733
lego_email: me@bar.com
```

An example setup for OBSD Homelab, which wants to use a custom lego solver and disable waiting for DNS propagation, would set the following lego variables -

```yml
lego_dns: exec
lego_env:
  EXEC_PATH: /usr/local/libexec/lego_custom
lego_email: obsd-homelab@bsd.ac
lego_args: '--dns.disable-cp'
```

## Manual management of TLS certificates

The default key/cert pair used by OBSD Homelab is

| mode   | owner   | group   | path                   |
|--------|---------|---------|------------------------|
| `0640` | `_lego` | `_lego` | `/etc/ssl/homelab.key` |
| `0644` | `_lego` | `_lego` | `etc/ssl/homelab.crt`  |

If managing certificates manually, create a `_lego` user account prior to running the OBSD Homelab setup. After generating the certificates, copy them to the above location with the correct owner/group/permissions, as the `_lego` group is used by services to access the protected private key.
