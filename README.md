
Thermal Fortunes -- a fortune cookie printer
============================================

Press button -> Get fortune

This is meant to run on a Raspberry Pi connected to a small receipt printer
that uses thermal paper. I got mine from [Adafruit](https://www.adafruit.com/product/597)
but it seems they've been discontinued.


Installation
------------

1. Clone this repo to your RaspberryPi
   ```
   https://github.com/larcher/thermal-fortunes.git
   ```
1. Edit the `config.sh` file
1. To test it, you can run the script directly:
   ```
   ~/thermal-fortunes/button-watch.sh
   ```
   and then press the button
1. If you want it to run in the background when your Pi turns on,
   run the install script to add a crontab entry
   ```
   ~/thermal-fortunes/install-cronjob.sh
   ```


Adding Fortunes
---------------

The Kevin Kelly advice and Oblique Strategies and Merlin's Wisdom sets were
things I found online and wanted to add, so I converted them to a format that
fortune can handle.  
Some notes on how to do that:

First, you put all the quotes, nuggets of wisdom, advice, whatever, into a text
file where the quotes are delimited by a `%` on a line by itself.

For example:
```
A multitude of bad ideas is necessary for one good idea.
%
A problem that can be solved with money is not really a problem.
%
A vacation + a disaster = an adventure.
```

Then create the "string file" from that file.  
Ex, if your file is called `stuff`

```
strfile -c % stuff stuff.dat
```


Then drop those two files into /usr/share/games/fortunes/
(optional: if you craft your `fortune` command line right, the fortunes could live anywhere .. I think)

```
sudo cp stuff /usr/share/games/fortunes/
sudo cp stuff.dat /usr/share/games/fortunes/
sudo ln -s /usr/share/games/fortunes/stuff{,.u8}
```

TODO
----

- Just put everything in one file
  Original reason to use separate files may have been to make it easier to test.  
  Ex: I can run `getfortune.sh` to fetch a fortune without printing; but there
  are ways to do that with a single file still
- shfmt and linting and general cleanup
- document the hardware (it's a button connected to one of the Pi's GPIO pins)

