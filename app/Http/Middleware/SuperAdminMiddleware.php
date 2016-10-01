<?php

namespace App\Http\Middleware;

use Closure;

class SuperAdminMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        if ( $request->user() ) :
            if( $request->user()->role_id == 1)
                return $next($request);
            else
                abort('404');
        else:
           return redirect()->intended('/login');
        endif;
    }
}
