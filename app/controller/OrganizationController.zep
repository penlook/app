/**
 * Penlook Project
 *
 * Copyright (c) 2015 Penlook Development Team
 *
 * --------------------------------------------------------------------
 *
 * This program is free software: you can redistribute it and/or
 * modify it under the terms of the GNU Affero General Public License
 * as published by the Free Software Foundation, either version 3
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU Affero General Public License for more details.
 *
 * You should have received a copy of the GNU Affero General Public
 * License along with this program.
 * If not, see <http://www.gnu.org/licenses/>.
 *
 * --------------------------------------------------------------------
 *
 * Authors:
 *     Loi Nguyen       <loint@penlook.com>
 *     Tin Nguyen       <tinntt@penlook.com>
 *     Nam Vo           <namvh@penlook.com>
 */

namespace App\Controller;

use Phalcon\Mvc\View;
use App\Controller;
use App\Model\OrganizationModel;
use App\Module\Auth;
use App\Model\UserModel;
use App\Model\AppModel;

/**
 * Organization Controller
 *
 * @category   Penlook Application
 * @package    App\Controller
 * @copyright  Penlook Development Team
 * @license    GNU Affero General Public
 * @version    1.0
 * @link       http://github.com/penlook
 * @since      Class available since Release 1.0
 */
class OrganizationController extends Controller
{

    public organization;

    public user;

    public auth;

    public app;

    public inline function indexAction()
    {
        var oid;
        let oid = this->route("id");

        let this->app   = AppModel::getInstance();
        let this->auth = new Auth();
        let this->organization = new OrganizationModel(oid);

        if this->auth->login {
            let this->user = new UserModel(this->auth->getCurrentUser());
        }


        if ! this->organization->isValid() {
            return this->error(404);
        }

        this->showOrganization();
        //this->createOrganization();
    }

    public inline function showOrganization()
    {
        //var css = [], js = [];
        this->out([
            "user" : this->user->getUser(),
            "login": this->auth->login,
            "isAdmin": true,
            "org" : this->organization->getOrganization(),
            "country": this->organization->getCountry()
        ]);

        /*let css = [
            "lib/bootstrap/bootstrap",
            "lib/config",
            "lib/core",
            "modules/index_header",
            "modules/index_content",
            "modules/org_page",
            "modules/org_test",
            "modules/index_flow"
        ];

        let js = [
            "lib/typehead",
            "lib/underscore",
            "lib/search",
            "modules/header",
            "modules/post",
            "modules/org",
            "modules/upload"
        ];

        this->res("css", css, true, true);
        this->res("js", js, true, true);
        */

        this->js([
            "org_name"  : this->organization->getOrganization()->name,
            "org_logo"  : this->organization->getOrganization()->logo,
            "org_id"    : this->organization->getOrganization()->id,
            "id"        : this->user->getUser()->id,
            "name"      : this->user->getUser()->name,
            "headline"  : this->user->getUser()->headline,
            "avatar"    : this->user->getUser()->avatar
        ]);

        this->ng("app");
        this->pick("org/page/layout");

    }

    public inline function createOrganization()
    {
        this->out([
            "next_step": 1
        ]);

        /*this->res("css", [
            "lib/bootstrap/bootstrap",
            "lib/config",
            "lib/core",
            "modules/index_header",
            "modules/index_content",
            "modules/org_create",
            "modules/app_footer"
        ], true, true);
        */
        this->pick("org/create/layout");
    }
}