# ob-js-osascript

Execute the given OSA JavaScript, e.g.:

```org
#+begin_src js :results osascript
Application("Emacs").version()
#+end_src
```

will output:

```
#+RESULTS:
: 29.1.90
```

## Install

Add `ob-js-osascript.el` to your `load-path`, or use a package manager like `use-package` w/ `quelpa`:

```elisp
(use-package ob-js-osascript
    :quelpa (ob-js-osascript :fetcher github :repo "cxa/ob-js-osascript"))
```
