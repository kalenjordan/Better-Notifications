ABOUT
=====

This module at the moment just simply adds a close button to the notifications
that show up in the admin section, so they can be closed easily.

It doesn't show up for things like the re-index notice, which is actually 
triggered from the Index module, not from the AdminNotifications module, and
should probably be dealt with by a merchant and not simply closed.


INSTALL
=======

    modman clone https://github.com/sparcksoft/Better-Notifications notifications

TODO
====
1. If there are additional unread notifications available after the latest one is
closed, load them up after the latest one is closed.

