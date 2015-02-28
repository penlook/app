<?php
/*
 +--------------------------------------------------------------------------+
 | Penlook Project                                                          |
 +--------------------------------------------------------------------------+
 | Copyright (c) 2015 Penlook Development Team                              |
 +--------------------------------------------------------------------------+
 |                                                                          |
 | This program is free software: you can redistribute it and/or modify     |
 | it under the terms of the GNU Affero General Public License as           |
 | published by the Free Software Foundation, either version 3 of the       |
 | License, or (at your option) any later version.                          |
 |                                                                          |
 | This program is distributed in the hope that it will be useful, but      |
 | WITHOUT ANY WARRANTY; without even the implied warranty of               |
 | MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the            |
 | GNU Affero General Public License for more details.                      |
 |                                                                          |
 | You should have received a copy of the GNU Affero General Public License |
 | along with this program.  If not, see <http://www.gnu.org/licenses/>.    |
 |                                                                          |
 +--------------------------------------------------------------------------+
 |   Authors: Loi Nguyen  <loint@penlook.com>                               |
 |            Viet Nguyen <vietna@penlook.com>                              |
 +--------------------------------------------------------------------------+
*/

namespace App;

use App\Router;

/**
 * Router Test
 *
 * @category   Penlook Application
 * @package    App
 * @copyright  Penlook Development Team
 * @license    GNU Affero General Public
 * @version    1.0
 * @link       http://github.com/penlook
 * @since      Class available since Release 1.0
 */
class RouterTest extends Test
{
    protected $router;

    public function __construct()
    {
        $this->router = Router::getInstance();
    }

    public function testGetInstance()
    {
        $input = $this->router;
        $expect = $this->router;
        $output = Router::getInstance();
        $this->assertEquals($output, $expect);
    }

    public function testConfigureRouter()
    {
        // $input = "testConfigureRouter";
        // $expect = "/home/vietna/config/config.yaml";
        // $output = $this->router->configureRouter();
        // $this->assertEquals($output, $expect);
    }

    public function testGetRouter()
    {
        // Unknown
    }
}