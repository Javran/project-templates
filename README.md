# Javran's project templates

For now this directory contains just the `simple.hsfiles` template that
derives from the default stack project template with all unnecessary junks removed.

For the record, I have following content in my `~/.stack/config.yaml`
to override stack's default template:

```yaml
templates:
  params:
    author-name: Javran Cheng
    author-email: javran.c@gmail.com
    github-username: Javran
default-template: 'https://raw.githubusercontent.com/Javran/project-templates/master/simple.hsfiles'
```

Note that you might need to replace resolver in `stack.yaml` with whatever version appropriate.
