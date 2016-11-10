@if ($user->language_id == 1)
Para activar su cuenta su cuenta, siga el siguiente enlace: 
<a href="{{ $link = url('password/reset', $token).'?email='.urlencode($user->getEmailForPasswordReset()) }}"> {{ $link }} </a>
@else
To activate your account follow this link: 
<a href="{{ $link = url('password/reset', $token).'?email='.urlencode($user->getEmailForPasswordReset()) }}"> {{ $link }} </a>
@endif
