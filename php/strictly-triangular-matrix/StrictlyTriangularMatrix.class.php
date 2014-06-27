<?php

/**
 * Methods for using PHP matrices as strictly lower triangular matrices.
 *
 * They allow users to abstract from the bulky iteration syntax needed
 * for this data type (two nested fors, and the diagonal test).
 *
 * The keys of the arrays and matrices involved in the operations are
 * preserved.
 *
 * The ability to createFromMapAndFilter at once was created as 
 * performance optimization to the otherwise sequence of calls to
 * createFromMap and filter.
 */
class StrictlyTriangularMatrix {

	public static function createFromMap($map, $aggregationFunction)
	{
		return self::_createFromMap($map, $aggregationFunction, null);;
  }

  public static function createFromMapAndFilter($map, $aggregationFunction, 
      $testFunction)
  {
    return self::_createFromMap($map, $aggregationFunction, $testFunction);
  }

  private static function _createFromMap($map, $aggregationFunction, 
      $testFunction) {
    $res = array();
		foreach ( $map as $ki => $vi )
		{
			foreach ( $map as $kj => $vj )
			{
				if ( $ki === $kj )
				{
					break;
        }
        $aggregationResult = call_user_func($aggregationFunction, $vi, $vj);
        if ($testFunction === null or call_user_func($testFunction, $aggregationResult)) {
          $res[$ki][$kj] = $aggregationResult;
        }
      }
		}
		return $res;
  }

	/**
	 * Analog to array_filter
	 */
	public static function filter($STM, $testFunction)
	{
		$res = array();
		foreach ( $STM as $ki => $row )
		{
			foreach ( $row as $kj => $v )
      {
        if ( $ki === $kj )
        {
          break;
        }
				if (call_user_func($testFunction, $v))
				{
					$res[$ki][$kj] = $v;
				}
			}
		}
		return $res;
	}

}

?>
