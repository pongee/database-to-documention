<?php declare(strict_types=1);

namespace Pongee\DatabaseToDocumentation\DataObject\Sql\Database\Connection;

class NotDefinedConnection extends ConnectionAbstract
{
    public function getType(): string
    {
        return '';
    }
}
