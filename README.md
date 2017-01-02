# rplock
Simple screen locking tool for ratpoison based desktops

## Usage

Run `rplock` to lock and blank all ratpoison screens.

Press some magic keys to restore everything to the way it was before
(or open another session and run `rplock unlock` from the same directory)

## What does it do

For locking, `rplock` first blanks all screen by going fullscreen and selecting
an empty window. Your layout is saved in a file called `locked_layout`.

The `top` keymap is then replaced with a new one, redirecting all alphanumeric keys
to the script for entering an unlock phrase, thereby making your normal bindings 
temporarily inaccessible.

Input from these keys can then be used to enter an unlock phrase, confirmed by
pressing enter. The screens are unlocked as soon as the same phrase is entered again
and confirmed by pressing enter. 

To just blank the screens for a short time, hit enter twice.

The `rplock unlock` command replaces the `top` keymap again, with your original one
and restores the previously saved screen layout.

## Installation

Install `rplock` by running `make install` as root.

Add it to your ratpoison bindings and make sure it is executed from a known path, eg.
by running `cd` before starting ratpoison.

## Emergency unlocking

If you run into problems unlocking, change to another TTY by pressing Ctrl-Alt-F<1-6>
and log in. Run `export DISPLAY=:0` to set the target X server and run the `rplock unlock`
command from the same folder the corresponding `rplock` command was run from.
Change back to the graphical TTY (usually tty7) which should be unlocked again.

## Other considerations

`rplock` only makes ratpoison unusable, it does not prevent attackers
from eg. just killing the X server by changing to TTY1 and pressing Ctrl-C.

Some programs like to open popups and new windows, which will be brought to the
foreground even while the screen is locked, allowing an attacker to interact with
that window. This might be prevented by mapping all keys in the `locktop` keymap
to something, though that would still leave the mouse.

Some other measures you should take

* Always run `xinit || logout` (eg. by setting it as an alias) if you start your
X server manually. This works because forcibly quitting the X server makes it return nonzero.

