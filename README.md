Description
===========

Clanstats is used to merge different players into a viewable statisic
overview for [Battlefield 3](http://www.battlefield.com). It is
simple to install and easy to use.

You can find the official homepage here: http://www.grewe.ca/projects/php/clanstats/

Requirements
============

* Either enable disk cache or use Memcache if available (recommended)
* BF3stats.com API Keys if you wish to run the player update cronjob
* PHP CURL Library

Installation
============

* Upload the bf3stats source code folder to your Website
* Ensure `templates/compile` and `templates/cache` are writable by the server
* Configure your players in `include/config/global.inc.php`
* Enable (if available) or Disable the Memcache in `include/config/global.inc.php`

Configuration
=============

It comes pre-configured with some players so once uploaded and changing
permissions you should already see some statistics.

You can find a sample configuration with comments here: [include/config/global.inc.php](include/config/global.inc.php)

License and Author
==================

Author:: Sebastian Grewe (<sebastian.grewe@gmail.com>) 
Website:: http://www.grewe.ca

Copyright:: 2013, Sebastian Grewe

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
