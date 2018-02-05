<?php declare(strict_types=1);

namespace Pongee\DatabaseToDocumention\DataObject\Sql\Database\Table\Index;

interface PrimaryKeyInterface extends IndexInterface
{
    public function __construct(array $columns, string $otherParameters = '');
}
