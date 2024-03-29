[root@utrutstvault01v ansibleGists]# vault auth enable userpass
Success! Enabled userpass auth method at: userpass/
[root@utrutstvault01v ansibleGists]#

[root@utrutstvault01v ansibleGists]# vault write auth/userpass/users/ssi-vault-svc policies=default,userpass password=ssi-vault-svc
Success! Data written to: auth/userpass/users/ssi-vault-svc
[root@utrutstvault01v ansibleGists]#

[root@utrutstvault01v ~]# curl -s --request POST --data '{"password": "ansiblevault-svc"}'  http://10.13.3.10:8200/v1/auth/userpass/login/ansible | jq
{
  "request_id": "e9817b43-3612-5ee4-3382-4978aa99b0b8",
  "lease_id": "",
  "renewable": false,
  "lease_duration": 0,
  "data": null,
  "wrap_info": null,
  "warnings": null,
  "auth": {
    "client_token": "s.GGgSLFLIkj4aJn1h2jymTXNo",
    "accessor": "YIrksq92vVoseTFlKu2SCInA",
    "policies": [
      "default",
      "userpass"
    ],
    "token_policies": [
      "default",
      "userpass"
    ],
    "metadata": {
      "username": "ansible"
    },
    "lease_duration": 36000,
    "renewable": true,
    "entity_id": "d05ad06f-5987-9de0-33af-75505498352f",
    "token_type": "service",
    "orphan": true
  }
}
[root@utrutstvault01v ~]#
[root@utrutstvault01v ansibleGists]#

[root@utrutstvault01v ansibleGists]# vault secrets enable -path=kv kv
Success! Enabled the kv secrets engine at: kv/
[root@utrutstvault01v ansibleGists]#

[root@utrutstvault01v ansibleGists]# openssl passwd -1 ansible-ssi-svc
$1$8zZKKvTY$c2Ddy2YdGoWw2tzkIsU4b1
[root@utrutstvault01v ansibleGists]#

[root@utrutstvault01v ansibleGists]# vault write kv/ansible-tC-pass value='$1$8zZKKvTY$c2Ddy2YdGoWw2tzkIsU4b1'
Success! Data written to: kv/ansible-tC-pass
[root@utrutstvault01v ansibleGists]#

[root@utrutstvault01v ansibleGists]# vault login -address=http://10.13.3.10:8200 s.a94wPBs0lV5wI1CDp8o2a4SU
Success! You are now authenticated. The token information displayed below
is already stored in the token helper. You do NOT need to run "vault login"
again. Future Vault requests will automatically use this token.

Key                    Value
---                    -----
token                  s.a94wPBs0lV5wI1CDp8o2a4SU
token_accessor         tJXHPMFuv218dJao1psyR8zr
token_duration         9h22m36s
token_renewable        true
token_policies         ["default" "userpass"]
identity_policies      ["default" "userpass"]
policies               ["default" "userpass" "default" "userpass"]
token_meta_username    ssi-vault-svc
[root@utrutstvault01v ansibleGists]#

[root@utrutstvault01v ansibleGists]# vault read kv/ansible-tC-pass
Key                 Value
---                 -----
refresh_interval    10h
value               $1$8zZKKvTY$c2Ddy2YdGoWw2tzkIsU4b1
[root@utrutstvault01v ansibleGists]#
