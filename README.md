<h1 align="center">
  setup-steam-game

  <small align="center">
    <font size="3">(Windows)</font>
  </small>
</h1>

<div align="center">

  GitHub Action for downloading a Steam game into a folder using SteamCMD
</div>

# About

This action downloads, and then verifies a game from steam using Valve's official command line tool.
While SteamCMD supports anonymous login, most games - even free ones - require themselves to be owned. Make sure that the account you're logging in with actually has the desired game in its library!

# Usage

This is an example setup for ChilloutVR, adjust these values differently if you're installing a different game.

```yaml
- uses: DecentM/setup-steam-game-windows@v1
  with:
    # The Game ID on Steam
    # You can get this from SteamDB, by searching for your game, and then copying the App ID.
    # https://steamdb.info/apps/
    gameid: 661130

    # The game will be installed into this folder, relative to the project root.
    folder: ChilloutVR

    # Authentication credentials for a Steam user that owns the game. It cannot have Steam Guard enabled.
    # Recommended to create a new service user that isn't used by a real person, for better security.
    #
    # If you don't need to log in, set the username to "anonymous", and leave the password blank.
    # Otherwise, copy this as-is, and then set the STEAM_USER and STEAM_PASSWORD secrets using the
    # secrets manager in your repo settings.
    username: ${{ secrets.STEAM_PASSWORD }}
    password: ${{ secrets.STEAM_USER }}
```

# License

The use and documentation of this project are governed by [Version 3 of the GNU GENERAL PUBLIC LICENSE](LICENSE).
