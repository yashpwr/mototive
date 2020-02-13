<?php


Route::get('clear', function() {
    $exitCode = Artisan::call('cache:clear');
    $exitCode1 = Artisan::call('route:clear');
    $exitCode2 = Artisan::call('config:clear');
    $exitCode3 = Artisan::call('view:clear');
    return '<h1>cache route config view cleared</h1>';
});

//testing email
Route::match(['get', 'post'], 'testingmail', ['as' => 'testingmail', 'uses' => 'LoginController@testingmail']);

//slider

Route::match(['get', 'post'], '/', ['as' => 'home', 'uses' => 'frontend\HomeController@dashboard']);
Route::match(['get', 'post'], 'services', ['as' => 'services', 'uses' => 'frontend\ServicesController@services']);
Route::match(['get', 'post'], 'portfolio', ['as' => 'portfolio', 'uses' => 'frontend\PortfolioController@portfolio']);
Route::match(['get', 'post'], 'portfolioreadmore/{id}', ['as' => 'portfolioreadmore', 'uses' => 'frontend\PortfolioController@readmore']);
Route::match(['get', 'post'], 'aboutus', ['as' => 'aboutus', 'uses' => 'frontend\AboutusController@aboutus']);
Route::match(['get', 'post'], 'contactus', ['as' => 'contactus', 'uses' => 'frontend\ContactusController@contactus']);

Route::match(['get', 'post'], 'blog', ['as' => 'blog', 'uses' => 'frontend\BlogController@blog']);
Route::match(['get', 'post'], 'blog-footer', ['as' => 'blog-footer', 'uses' => 'frontend\BlogController@blog_footer']);
Route::match(['get', 'post'], 'blogreadmore/{id}', ['as' => 'blogreadmore', 'uses' => 'frontend\BlogController@readmore']);

Route::match(['get', 'post'], 'features', ['as' => 'features', 'uses' => 'frontend\FeaturesController@features']);

//Terms and Condition
Route::match(['get', 'post'], 'terms', ['as' => 'terms', 'uses' => 'frontend\TermsController@terms']);

//Privacy Policy
Route::match(['get', 'post'], 'policy', ['as' => 'policy', 'uses' => 'frontend\PolicyController@policy']);


Route::match(['get', 'post'], 'admin', ['as' => 'admin', 'uses' => 'backend\LoginController@login']);
Route::match(['get', 'post'], 'createPassword', ['as' => 'createPassword', 'uses' => 'backend\LoginController@createPassword']);
Route::match(['get', 'post'], 'logout', ['as' => 'logout', 'uses' => 'backend\LoginController@getLogout']);
$adminPrefix = "";
Route::group(['prefix' => $adminPrefix, 'middleware' => ['admin']], function() {

    Route::match(['get', 'post'], 'admin-dashboard', ['as' => 'admin-dashboard', 'uses' => 'backend\dashboard\DashboardController@dashboard']);

//slider
    Route::match(['get', 'post'], 'slider', ['as' => 'slider', 'uses' => 'backend\slider\SliderController@slider']);
    Route::match(['get', 'post'], 'slider-ajaxAction', ['as' => 'slider-ajaxAction', 'uses' => 'backend\slider\SliderController@ajaxAction']);
    Route::match(['get', 'post'], 'editsilder', ['as' => 'editsilder', 'uses' => 'backend\slider\SliderController@editslider']);

//Projec Type
    Route::match(['get', 'post'], 'project-type', ['as' => 'project-type', 'uses' => 'backend\project_type\project_typeController@index']);
    Route::match(['get', 'post'], 'project-type-ajaxAction', ['as' => 'project-type-ajaxAction', 'uses' => 'backend\project_type\project_typeController@ajaxAction']);
    Route::match(['get', 'post'], 'editproject-type', ['as' => 'editproject-type', 'uses' => 'backend\project_type\project_typeController@editproject_type']);

//Portfolio
    Route::match(['get', 'post'], 'admin-portfolio', ['as' => 'admin-portfolio', 'uses' => 'backend\portfolio\PortfolioController@index']);
    Route::match(['get', 'post'], 'portfolio-ajaxAction', ['as' => 'portfolio-ajaxAction', 'uses' => 'backend\portfolio\PortfolioController@ajaxAction']);
    Route::match(['get', 'post'], 'editportfolio/{id}', ['as' => 'editportfolio', 'uses' => 'backend\portfolio\PortfolioController@editportfolio']);
    Route::match(['get', 'post'], 'addportfolio', ['as' => 'addportfolio', 'uses' => 'backend\portfolio\PortfolioController@addportfolio']);

//Blog Category
    Route::match(['get', 'post'], 'blog-category', ['as' => 'blog-category', 'uses' => 'backend\blog_category\BlogcategoryController@index']);
    Route::match(['get', 'post'], 'blogcategory-ajaxAction', ['as' => 'blogcategory-ajaxAction', 'uses' => 'backend\blog_category\BlogcategoryController@ajaxAction']);
    Route::match(['get', 'post'], 'editblogcategory', ['as' => 'editblogcategory', 'uses' => 'backend\blog_category\BlogcategoryController@editblogcategory']);

//Blog
    Route::match(['get', 'post'], 'admin-blog', ['as' => 'admin-blog', 'uses' => 'backend\blog\BlogController@index']);
    Route::match(['get', 'post'], 'blog-ajaxAction', ['as' => 'blog-ajaxAction', 'uses' => 'backend\blog\BlogController@ajaxAction']);
    Route::match(['get', 'post'], 'editblog', ['as' => 'editblog', 'uses' => 'backend\blog\BlogController@editblog']);
});
