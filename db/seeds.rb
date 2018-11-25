##
# Populates the database with Faker gem values.
require 'faker'

##
# Generate departments with unique names.
def generate_departments
  100.times do
    Department.create({ name: Faker::Commerce.unique.department })
  end
# Just in case Faker has less data than I imagine
rescue Faker::UniqueGenerator::RetryLimitExceeded
  return
end

##
# Generate promotion codes with unique strings. Remove "nopromo" just in case
# because it's what we'll use for things with no promo code, as opposed to a 
# NULL in the table.
def generate_promotions
  # This "promotion" is the one used to populate products with no promotion
  PromoCode.create({ code: "nopromo" })
  Faker::Commerce.unique.exclude :string, [7], %w(nopromo)

  50.times do
    PromoCode.create({ code: Faker::Commerce.unique.promotion_code })
  end
# Just in case Faker has less data than I imagine
rescue Faker::UniqueGenerator::RetryLimitExceeded
  return
end

##
# Generates the products. This needs to occur after departments and promo codes 
# are generated as it references both.
def generate_products
  departments = Department.all
  promo_codes = PromoCode.all
  prng = Random.new

  10000.times do
    promo_code = promo_codes.first

    if prng.rand(1..2) == 1
      promo_code = promo_codes[prng.rand(promo_codes.length)]
    end

    Product.create({
      name: Faker::Commerce.unique.product_name,
      price: Faker::Commerce.price,
      department: departments[prng.rand(departments.length)],
      promo_code: promo_code
    })
  end
# Just in case Faker has less data than I imagine
rescue Faker::UniqueGenerator::RetryLimitExceeded
  return
end

generate_departments
generate_promotions
generate_products