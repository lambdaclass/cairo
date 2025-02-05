use core::test::test_utils::{assert_eq, assert_ne, assert_gt};

#[test]
#[should_panic(expected: ('panic_with_felt252()',))]
fn test_panic_with_felt252() {
    // No semicolon here: Missing implementation for core::traits::Drop::<core::never>
    core::panic_with_felt252('panic_with_felt252()')
}

#[test]
#[should_panic(expected: ('assert(false)',))]
fn test_assert_false() {
    assert(false, 'assert(false)');
}

#[test]
fn test_assert_true() {
    assert(true, 'assert(true)');
}

#[test]
#[available_gas(static)]
fn test_get_available_gas_no_gas_supply() {
    assert_eq(@core::testing::get_available_gas(), @0, 'expected no_gas_supply')
}

#[test]
#[available_gas(10000)]
fn test_get_available_gas_with_gas_supply() {
    assert_gt(core::testing::get_available_gas(), 5000, 'high amount of gas used')
}
