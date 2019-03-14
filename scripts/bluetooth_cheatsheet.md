# Phone Moto X4 bluetooth
# Device 38:80:DF:95:DB:4E
# Pin 726604

# Wireless keyboard bluetooth
# Device DC:2C:26:54:56:DD

# Oculus Go Controller (From the app)
# Name OMVR-V190
# Device 2C:26:17:09:CD:74

# Jambox
# Name JAMBOX by Jawbone
# Device 00:21:3C:6A:DC:67

### Tips for pairing the oculus go controller with the laptop.
When you initial run the pair command you want to press both the home key and back key on the controller. A little white led (at the top of the contoller) should light up. Then, keep reruninng the pair command until it pairs and connects.

$ bluetoothctl
[bluetooth]# power on
[bluetooth]# agent on
[bluetooth]# default-agent
[bluetooth]# pariable on
[bluetooth]# scan on
[bluetooth]# pair [ADDR]
Request confirmation
[agent] Confirm passkey [XXXXXX] (yes/no): yes
[bluetooth]# trust [ADDR]
[bluetooth]# connect [ADDR]

## Items of note:
A bluetooth controller is a device that can pair devices together. Your computer or phone should be equiped with a controller. Running the followint command will show the controllers.

```
[bluetooth]# list
```

An agent is a bit of software that enables the passcode sharing for the pairing step. The agent must be turned on. You can set agents for particular devices, but for the most part you can use `default-agent` listed above.

Turning `pariable on` allows the contoller to pair, and turning `scan on` will scan the airwaves (really EM waves) for active devices. If a device is active it's address (and hopefully id) will appear.

Once you've identified the device you wish to connect run the `pair` command. If the device is able to pair the agent you started eariler should initiate the passcode transfer.

After you have paired a device the last step is to connect it (with the `connect` command of course). Then the device should be accesable to the host controller system.
