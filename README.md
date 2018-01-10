# escher-cli

a command line tool that makes it easy to run massive experiments on AWS, GCE, etc.

## Organization

up-to-date stuff are in `dev/alpha` branch. We push to master to keep people updated.

## Todos

- [ ] test cli tool when implementing DQN experiments
- [ ] specify use case
- [ ] set up blog on ai.escherpad.com

## run: 

Take a look at the default make file. We have all of our CLI hooks specified in make. Compatibility on windows is not a priority. However, windows `make.exe` could be used.

```bash
make
```

## POC

- [ ] use terraform to deploy a *fixed sized* cluster, with existing image.
- [ ] use imperative launches to add new instances, with discovery

do NOT use kubernetes because cluster has a large, fixed overhead. Might be workth while with google cloud engine though.

## Key Problems

- [ ] decouple run and code editing

      run code anytime you want, have a unified dashboard to see what is going on, and to review diff between arbitrary git commits

- [ ] need a dashboard to look at and to monitor running jobs

- [ ] need a job queue so that we can kill jobs when they are being unpleasant

- [ ] halt a job
