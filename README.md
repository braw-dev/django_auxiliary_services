# Auxiliary services

This repo contains shared, auxiliary services for Django applications.

<!-- Todo(kisamoto): Infrastructure diagram showing how the pieces fit together -->
<!-- Aux services are shared between multiple Django projects -->

## Services

### Caddy

Validate and reload configuration:

```
caddy validate

caddy reload
```

## Infrastructure

### Development

_Note: Weird virtualization issue may need [docker-desktop to be stopped](https://forums.virtualbox.org/viewtopic.php?t=107117)_

Use Vagrant+Virtualbox for development testing of the Ansible playbooks.
