# Javran's Opinionated Project Templates

It's probably a good thing that Haskell isn't part of my work,
so I can keep being picky about things.

## Principles

### Easy to Edit for Everybody

No spacing-aligning practices, they are simply noisy and counter-productive.

Maybe a formatter can do that for your,
but I believe a project should never requrie specific code formatter for developers
to be productive editing while keeping the style in line with rest of the codebase.

Don't use Unicode symbols. I hate being forced to type `\` all the time (or having
to install some sort of plugin to make typing those stuff easier).

### Don't Apply Everything Stock HLint Says

There are situations that:

- Non-infix version is more readable
- Pointfree is pointless
- Changing back and forth between `data` and `newtype` is an annoyance
- ... and many random reasons that you don't think HLint is making sensible decisions.

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

See [Official doc](https://docs.haskellstack.org/en/stable/GUIDE/#the-stack-new-command).

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

We choose to hard-code `stack.yaml` so that we don't get excessive comments in it and
`stack` won't cost some extra network traffic just to determine which snapshot should we use.
