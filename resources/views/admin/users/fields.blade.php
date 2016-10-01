
<div class="col-sm-8">
    <fieldset>
        <legend>{!! $dictionary->translate('Información Personal') !!}:</legend>

<div class="form-group col-sm-6">
    {!! Form::label('code', $dictionary->translate('Codigo') . ':') !!}
    {!! Form::text('code', null, ['class' => 'form-control']) !!}
</div>

<!-- First Name Field -->
<div class="form-group col-sm-6">
    {!! Form::label('name', $dictionary->translate('Nombre') . ':') !!}
    {!! Form::text('name', null, ['class' => 'form-control']) !!}
</div>

<!-- Last Name Field -->
<div class="form-group col-sm-6">
    {!! Form::label('last_name', $dictionary->translate('Apellido') . ':') !!}
    {!! Form::text('last_name', null, ['class' => 'form-control']) !!}
</div>

<!-- Email Field -->
<div class="form-group col-sm-6">
    {!! Form::label('email', $dictionary->translate('Email') . ':') !!}
    {!! Form::email('email', null, ['class' => 'form-control']) !!}
</div>

<!-- Password Field -->
<div class="form-group col-sm-6">
    {!! Form::label('password', $dictionary->translate('Contraseña') . ':') !!}
    <!-- {!! Form::password('password1', null, ['class' => 'form-control']) !!} -->
    <input name="password" type="password" id="password" class="form-control">
    <em class="red">{!! $password_message or '' !!} </em>
</div>

<!-- Language Field -->
<div class="form-group col-sm-6">
    {!! Form::label('language_id', $dictionary->translate('Idioma') . ':') !!}
    {!! Form::select('language_id', $languages, null, ['class' => 'form-control']); !!}
</div>
<div class="form-group col-sm-6">
    {!! Form::label('dni', 'DNI:') !!}
    {!! Form::text('dni', null, ['class' => 'form-control']) !!}
</div>
<div class="form-group col-sm-6">
    {!! Form::label('role', 'Rol:') !!}
    {!! Form::select('role_id', $roles, null, ['class' => 'form-control']); !!}
</div>

</fieldset>
<fieldset>
    <legend>{!! $dictionary->translate('Información de Localidad') !!}:</legend>
    <div class="form-group col-sm-6">
        {!! Form::label('country', $dictionary->translate('Pais') . ':') !!}
        {!! Form::text('country', null, ['class' => 'form-control']); !!}
    </div>
    <div class="form-group col-sm-6">
        {!! Form::label('city', $dictionary->translate('Ciudad') . ':') !!}
        {!! Form::text('city', null, ['class' => 'form-control']); !!}
    </div>
    <div class="form-group col-sm-6">
        {!! Form::label('area', $dictionary->translate('Area') . ':') !!}
        {!! Form::text('area', null, ['class' => 'form-control']); !!}
    </div>
    <div class="form-group col-sm-6">
        {!! Form::label('department', $dictionary->translate('Departamento') . ':') !!}
        {!! Form::text('department', null, ['class' => 'form-control']); !!}
    </div>
</fieldset>

</div>
<div class="col-sm-4">
    <div class="box-body box-profile">
        <img id="image"  alt="User profile picture" src="@if (isset($user) && $user->image)  {!! asset('uploads/'.$user->image) !!} @else {!! asset('img/user.png') !!} @endif" class="profile-user-img img-responsive img-circle">
        <hr>
        <h3 class="profile-username text-center">{!! $dictionary->translate('Foto de Perfil') !!}</h3>
        <hr>
        {!! Form::file('image', ['onchange' => 'readURL(this)']) !!}
    </div>
    <div class="form-group">
        {!! Form::label('client_id', $dictionary->translate('Cliente') . ':') !!}
        {!! Form::select('client_id', $clients, null, ['class' => 'form-control']); !!}
    </div>

</div>


<!-- Submit Field -->
<div class="form-group col-sm-12">
    {!! Form::submit($dictionary->translate('Guardar'), ['class' => 'btn btn-primary']) !!}
    <a href="{!! route('admin.users.index') !!}" class="btn btn-default">{!! $dictionary->translate('Cancelar') !!}</a>
</div>
