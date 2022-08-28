# Javran's Opinionated Project Templates

For now this directory contains just the `simple.hsfiles` template that
derives from the default Stack project template ~~with all unnecessary junks removed~~
that fits my personal taste.

## Principles

### Easy to Edit for Everybody

No spacing-aligning practices, they are simply noisy and counter-productive.

Maybe a formatter can do that for your,
but I believe a project should never requrie specific code formatter for developers
to be productive editing while keeping the style in line with rest of the codebase.

### Don't Apply Everything Stock HLint Says

There are situations that:

- Non-infix version is more readable
- Pointfree is pointless
- Changing back and forth between `data` and `newtype` is an annoyance

Thus `.hlint.yaml` is a curated rule that disable lints that IMO does more harm than good,
especially when one just kicking off a project.
Feel free to get rid of some of them as project becomes mature, of course.

### Version Control System is Meant for Source Control

No unreadable `stack.yaml.lock` or hashes when they are unnecessary.

They provide secure benefits, I get it. But I'll only care when I need to.

## Other Differences

- No excessive comments in `stack.yaml`, over time they become stale and are merely visual noise.
- `hpack` over `Cabal`: the latter is way more repetitive.
- `app -> exec`. An over used term that I developed a distaste against it.
- `it -> describe` in tests. I always think this is an awkward attempt at matching human language.
- `z*` scripts. A bunch of `.gitignore`-ed scripts that helps local development.
  I wasn't aware of `--file-watch` and `--exec` when this template was created.


## Applying the templatex

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
