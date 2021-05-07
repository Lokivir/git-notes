SSH-Authentication
====================

By using the `ssh` **command** with the **argument** `$USER@hostname`,
you connect with the given **user** to the specified **hostname** using the SSH protocol.

1. Generate a **private Key** on your local machine
    * `ssh-keygen -q -f ~/.ssh/id_rsa -t rsa`
        * creates `id_rsa (private Key)` and `id_rsa.pub (public key)`
2. Copy your Key to the remote hostname
   * `ssh-copy-id -i ~/.ssh/id_rsa.pub $USER@hostname`
3. log into your account on the hostname
   * `ssh $USER@hostname`


# SSH Agent

The `ssh-agent` is a **key manager** for SSH. It loads your credentials **unencrypted into memory**,
ready for `SSH` usage.</br>
It saves you the time to type in your credentials every time you **connect** to the server.

Private Keys stay safe, because the `ssh-agent`
* **doesn't write** any key material **to disk** and
* **doesn't allow** private keys to be **exported**.

Stored keys can only be used to signing a message.

With `ssh add` you add your keys to a running `ssh-agent`.


# GUI applications

To start a GUI application on a **remote machine** the simple `ssh` **command** isn't enough.

By simply connecting and trying to run e.g. `firefox`, you get the **error**:</br>
`Error: no DISPLAY environment variable specified`

So to run GUI applications successfully, **trusted X11 forwarding** has to be enabled with the **option** `-Y`.

* Open your **terminal**
* Use the `-Y` **option** of the `ssh` **command**
* Connect to the remote hostname with `ssh -Y $USER@hostname`


# Difficulties

* Understanding Git bare-repositories at first
    * tried using `pull` on bare repo
* `git remote`
* `ssh-agent` functionality


# Additional resources

* https://www.saintsjd.com/2011/01/what-is-a-bare-git-repository/
* https://askubuntu.com/a/507138
* https://smallstep.com/blog/ssh-agent-explained/#:~:text=ssh-agent%20is%20a%20key,you%20connect%20to%20a%20server.
