# sigred_win

|AppVeyor|Forge Version|Forge PDK Version|Forge Downloads|
|--------|-------------|-----------------|---------------|
[![AppVeyor][appveyor-badge]][appveyor] | [![Puppet Forge][forge-version-badge]][forge] | [![Puppet Forge][forge-pdk-badge]][forge] | [![Puppet Forge][forge-downloads-badge]][forge]

A Puppet task to get and set the value of TcpReceivePacketSize as a workaround for SIGRed.

## Description

Use the task `tcpreceivepacketsize` to set the value of `TcpReceivePacketSize` to `0xFF00` (255 bytes less than the max).

## Details

The task `tcpreceivepacketsize` has two parameters `get` and `set`. Use `get` to find the current value for `TcpReceivePacketSize` and the status of the DNS service. Use `set` to set the value of `tcpreceivepacketsize` to `0xFF00`. Optionally use the parameter `restartdns` to restart the DNS service after setting `tcpreceivepacketsize`.

## License

sigred_win is released under the [MIT license](http://www.opensource.org/licenses/MIT).

[appveyor]: https://ci.appveyor.com/project/joeypiccola/sigred-win
[appveyor-badge]: https://ci.appveyor.com/api/projects/status/2h0li0s6iecmqdhb/branch/master?svg=true&passingText=master%20-%20PASSING&pendingText=master%20-%20PENDING&failingText=master%20-%20FAILING
[forge]: https://forge.puppet.com/jpi/sigred_win
[forge-downloads-badge]: https://img.shields.io/puppetforge/dt/jpi/sigred_win
[forge-pdk-badge]: https://img.shields.io/puppetforge/pdk-version/jpi/sigred_win
[forge-version-badge]: https://img.shields.io/puppetforge/v/jpi/sigred_win