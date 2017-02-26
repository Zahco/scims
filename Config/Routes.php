<?php

//composer dump-autoload
$app->get('/', "\Web\Controllers\Article::articles")->bind("home");

$app->post('/Registering', "\Web\Controllers\User::registering")->bind("registering");

$app->get('/SignIn', "\Web\Controllers\User::signIn")->bind("signIn");
$app->post('/LogingOn', "\Web\Controllers\User::logingOn")->bind("logingOn");
$app->get('/LogOut', "\Web\Controllers\User::logOut")->bind("logOut");

//Content
$app->get('/Web/Content/CSS')->bind("css");
$app->get('/Web/Content/Images')->bind("images");
$app->get('/Web/Content/JS')->bind("js");

//Article
$app->get('/Article/Create', "\Web\Controllers\Article::create")->bind("articleCreate");
$app->post('/Article/Creating', "\Web\Controllers\Article::creating")->bind("articleCreating");
$app->get('/Article/')->bind("article");
$app->get('/Article/{Id}', "\Web\Controllers\Article::view")->bind("articleView");
$app->post('/Article/Regex', "\Web\Controllers\Article::articlesByRegex")->bind("articlesByRegex");
$app->get('/Article/Editor/{articleId}', "\Web\Controllers\Article::editor")->bind("articleEditor");
$app->post('/Article/Editing', "\Web\Controllers\Article::editing")->bind("articleEditing");
$app->get('/Article/Remove/{articleId}', "\Web\Controllers\Article::remove")->bind("articleRemove");
$app->get('/Article/Removing/{articleId}', "\Web\Controllers\Article::removing")->bind("articleRemoving");
$app->get('/Article/User/{userId}', "\Web\Controllers\Article::viewOfUser")->bind("articleViewOfUser");
$app->get('/Article/Subscription/', "\Web\Controllers\Article::allSubscription")->bind("subscription");
$app->post('/Converter/Latex', "\Web\Controllers\Article::latexConverter")->bind("latexConverter");
$app->post('Article/Tags/Remove', "\Web\Controllers\Article::tagKiller")->bind("tagKiller");


//User
$app->get('/User/Profile', "\Web\Controllers\User::profile")->bind("profile");
$app->post('/User/ProfileUpdate', "\Web\Controllers\User::profileUpdate")->bind("profileUpdate");
$app->get('/User/Follow/{userId}', "\Web\Controllers\User::addFollower")->bind("followUser");
$app->get('/User/Unfollow/{userId}', "\Web\Controllers\User::deleteFollower")->bind("unFollowUser");

//Category
$app->get('/Category/{categoryId}', "\Web\Controllers\Article::articlesByCategory")->bind("articlesByCategory");
$app->get('/User/Articles/', "\Web\Controllers\Article::articlesByUser")->bind("articlesByUser");
$app->get('/Categories/', "\Web\Controllers\Category::allCategories")->bind("allCategories");

//Administration
$app->get('/Administration/', "\Web\Controllers\Administration::manage")->bind("manage");
$app->get('/Administration/User/Remove/{userId}', "\Web\Controllers\Administration::removingUser")->bind("removingUser");
$app->get('/Administration/Article/Remove/{articleId}', "\Web\Controllers\Administration::removingArticle")->bind("removingArticle");
$app->get('/Administration/Category/Remove/{categoryId}', "\Web\Controllers\Administration::removingCategory")->bind("removingCategory");
$app->get('/Administration/Category/Add', "\Web\Controllers\Administration::addCategory")->bind("addCategory");
$app->post('/Administration/Category/Adding', "\Web\Controllers\Administration::addingCategory")->bind("addingCategory");
$app->get('/Administration/Category/Editor/{categoryId}', "\Web\Controllers\Administration::editorCategory")->bind("editorCategory");
$app->post('/Administration/Category/Editing', "\Web\Controllers\Administration::editingCategory")->bind("editingCategory");

//Statistics
$app->get('/Statistique/', "\Web\Controllers\Statistique::getStatistics")->bind("getStatistics");
?>
