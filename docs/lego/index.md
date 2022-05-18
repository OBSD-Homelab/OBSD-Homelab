# Lego

ACME client supporting Let's Encrypt and custom certificate authorities.

## Variables

| variable        | default value                                                                   | notes                                                                                     |
| `lego_packages` | `['lego']`                                                                      | packages to install for this roles                                                        |
| `lego_env`      | `{'PATH': '/usr/local/bin:/usr/local/sbin:<br/>/usr/bin:/usr/sbin:/bin:/sbin'}` | environment variables to set when<br/>issuing/updating certificates                       |
| `lego_args`     | ``                                                                              | extra arguments to pass to lego                                                           |
| `lego_dns`      | ``                                                                              | (required) DNS provider to use for ACME DNS-01 challenge                                  |
| `lego_email`    | ``                                                                              | (required) email to use for registration                                                  |
| `lego_domain`   | `{{ domain }}`                                                                  | (required) domain to issue certificates for,<br/>defaults to the specified homelab domain |
