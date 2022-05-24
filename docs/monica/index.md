# [Monica](https://www.monicahq.com/)

Open source personal CRM for managing relationships with contacts.

## Variables

| variable                | default value                               | notes                                                                        |
|-------------------------|---------------------------------------------|------------------------------------------------------------------------------|
| `monica`                | `monica`                                    | subdomain used for monica                                                    |
| `monica_domain`         | `{{ monica }}.{{ domain }}`                 |                                                                              |
| `monica_admin_mail`     | {% raw %}`{{ admin_mail }}`{% endraw %}     | email for the admin account, defaults to specified homelab admin email       |
| `monica_admin_pass`     | {% raw %}`{{ admin_pass }}`{% endraw %}     | password for the admin account, defaults to specified homelab admin password |
| `monica_smtp_user`      | {% raw %}`{{ smtp_user }}`{% endraw %}      |                                                                              |
| `monica_smtp_pass`      | {% raw %}`{{ smtp_pass }}`{% endraw %}      |                                                                              |
| `monica_smtp_host`      | {% raw %}`{{ smtp_host }}`{% endraw %}      |                                                                              |
| `monica_smtp_port`      | {% raw %}`{{ smtp_port }}`{% endraw %}      | see bugs                                                                     |
| `monica_smtp_tls`       | {% raw %}`{{ smtp_tls }}`{% endraw %}       |                                                                              |
| `monica_smtp_starttls`  | {% raw %}`{{ smtp_starttls }}`{% endraw %}  |                                                                              |
| `monica_smtp_from_name` | {% raw %}`{{ smtp_from_name }}`{% endraw %} |                                                                              |
| `monica_smtp_from_mail` | {% raw %}`{{ smtp_from_mail }}`{% endraw %} |                                                                              |
| `monica_packages`       | `['gpatch', 'monica']`                      | packages to install for this role                                            |

## Bugs

SMTP email does not work with port 465 with implicit TLS and should use port 587 with STARTTLS.
