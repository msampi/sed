<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\AppBaseController;
use App\Http\Requests;
use App\Http\Requests\CreateUserRequest;
use App\Http\Requests\UpdateUserRequest;
use App\Repositories\UserRepository;
use Illuminate\Http\Request;
use Flash;
use Prettus\Repository\Criteria\RequestCriteria;
use Response;
use App\Models\Client;
use App\Models\Language;
use App\Models\Role;
use Auth;


class UserController extends AdminBaseController
{
    /** @var  UserRepository */
    private $userRepository;
    protected $countries = array('AR'=>'ARGENTINA', 'AU'=>'AUSTRALIA', 'AT'=>'AUSTRIA', 'BE'=>'BELGIUM', 'BO'=>'BOLIVIA',  'BG'=>'BULGARIA', 'CM'=>'CAMEROON', 'CA'=>'CANADA', 'CL'=>'CHILE', 'CN'=>'CHINA',  'CO'=>'COLOMBIA', 'CR'=>'COSTA RICA', 'HR'=>'CROATIA', 'CU'=>'CUBA', 'CZ'=>'CZECH REPUBLIC', 'DK'=>'DENMARK', 'DO'=>'DOMINICAN REPUBLIC',  'EC'=>'ECUADOR', 'EG'=>'EGYPT', 'SV'=>'EL SALVADOR', 'FI'=>'FINLAND', 'FR'=>'FRANCE', 'DE'=>'GERMANY', 'GH'=>'GHANA', 'GR'=>'GREECE', 'GT'=>'GUATEMALA', 'HT'=>'HAITI', 'HN'=>'HONDURAS', 'HK'=>'HONG KONG', 'HU'=>'HUNGARY', 'IS'=>'ICELAND', 'IN'=>'INDIA', 'ID'=>'INDONESIA', 'IR'=>'IRAN, ISLAMIC REPUBLIC OF', 'IQ'=>'IRAQ', 'IE'=>'IRELAND', 'IL'=>'ISRAEL', 'IT'=>'ITALY', 'JM'=>'JAMAICA', 'JP'=>'JAPAN', 'MY'=>'MALAYSIA', 'MX'=>'MEXICO', 'NL'=>'NETHERLANDS', 'NZ'=>'NEW ZEALAND', 'NI'=>'NICARAGUA', 'NG'=>'NIGERIA',  'NO'=>'NORWAY',  'PA'=>'PANAMA', 'PY'=>'PARAGUAY', 'PE'=>'PERU',  'PL'=>'POLAND', 'PT'=>'PORTUGAL', 'PR'=>'PUERTO RICO', 'QA'=>'QATAR', 'RO'=>'ROMANIA', 'RU'=>'RUSSIAN FEDERATION', 'SE'=>'SWEDEN', 'CH'=>'SWITZERLAND',  'TN'=>'TUNISIA', 'TR'=>'TURKEY',  'UA'=>'UKRAINE', 'AE'=>'UNITED ARAB EMIRATES', 'GB'=>'UNITED KINGDOM', 'US'=>'UNITED STATES', 'UY'=>'URUGUAY', 'VE'=>'VENEZUELA');


    public function __construct(UserRepository $userRepo)
    {
        parent::__construct();
        $this->userRepository = $userRepo;
    }

    /**
     * Display a listing of the User.
     *
     * @param Request $request
     * @return Response
     */
    public function index(Request $request)
    {
        //$this->userRepository->pushCriteria(new RequestCriteria($request));
        //$users = $this->userRepository->all();

        $users = $this->userRepository->findWhere([['role_id','!=','1']]);

        return view('admin.users.index')
            ->with('users', $users);
    }

    /**
     * Show the form for creating a new User.
     *
     * @return Response
     */
    public function create()
    {

        return View( 'admin.users.create', array(
                                        'clients' => $this->clients,
                                        'languages' => Language::lists('name', 'id'),
                                        'roles' => Role::lists('name', 'id'),
                                        'countries' => $this->countries
                                     )
                        );
    }

    /**
     * Store a newly created User in storage.
     *
     * @param CreateUserRequest $request
     *
     * @return Response
     */
    public function store(CreateUserRequest $request)
    {

        $this->validate($request, [
            'email' => 'required|unique:users',
            'code' => 'required|unique:users',
            'password' => 'required'
        ]);

        $input = $request->all();

        $input['image'] = $this->uploadImage($request, 'image');

        $user = $this->userRepository->create($input);

        Flash::success($this->dictionary->translate('El usuario se ha guardado correctamente'));

        return redirect()->route('admin.users.index');
    }

    /**
     * Show the form for editing the specified User.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function edit($id)
    {

        $user = $this->userRepository->findWithoutFail($id);

        if (empty($user)) {
            Flash::error($this->dictionary->translate('Usuario no encontrado'));

            return redirect()->route('admin.users.index');
        }


        return View( 'admin.users.edit', array(
                                        'user' => $user,
                                        'clients' => $this->clients,
                                        'languages' => Language::lists('name', 'id'),
                                        'roles' => Role::lists('name', 'id'),
                                        'countries' => $this->countries,
                                        'password_message' => 'Para NO editar la contraseña dejela en blanco'
                                     )
                        );
    }

    /**
     * Update the specified User in storage.
     *
     * @param  int              $id
     * @param UpdateUserRequest $request
     *
     * @return Response
     */
    public function update($id, UpdateUserRequest $request)
    {

        $this->validate($request, [
            'email' => 'required|unique:users,email,'.$id,
            'code' => 'required|unique:users,code,'.$id,
        ]);


        $user = $this->userRepository->findWithoutFail($id);


        if (empty($user)) {
            Flash::error($this->dictionary->translate('Usuario no encontrado'));

            return redirect()->route('admin.users.index');
        }

        $input = $request->all();

        if ($image = $this->uploadImage($request, 'image'))
            $input['image'] = $image;

        $user = $this->userRepository->update($input, $id);

        Flash::success($this->dictionary->translate('El usuario se ha editado correctamente'));

        return redirect()->route('admin.users.index');


    }



    /**
     * Remove the specified User from storage.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function destroy($id)
    {
        $user = $this->userRepository->findWithoutFail($id);

        if (empty($user)) {
            Flash::error($this->dictionary->translate('Usuario no encontrado'));

            return redirect(route('users.index'));
        }

        if ($user->image && $user->image != 'user.png')
          unlink(base_path() . '/public/uploads/' . $user->image);

        $this->userRepository->delete($id);

        Flash::success($this->dictionary->translate('El usuario se ha eliminado correctamente'));

        return redirect()->route('admin.users.index');
    }
}
