<?php

$finder = PhpCsFixer\Finder::create()
    ->exclude([
        'bootstrap',
        'config',
        'coverage',
        'database/migrations',
        'database/seeds',
        'docker',
        'public',
        'resources',
        'storage',
        'vendor',
    ])
    ->notPath('_ide_helper.php')
    ->notPath('_ide_helper_models.php')
    ->notPath('server.php')
    ->in(__DIR__);

return PhpCsFixer\Config::create()
    ->setRules([
        '@PSR2' => true,
        '@Symfony' => true,
        'array_syntax' => ['syntax' => 'short'],
        'concat_space' => ['spacing' => 'one'],
        'phpdoc_align' => false,
        'yoda_style' => null,
        'increment_style' => ['style' => 'post'],
    ])
    ->setFinder($finder);
