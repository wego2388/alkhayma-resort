export const formatPrice = (price: number, locale: string): string => {
  if (locale === 'ar') {
    // Convert USD to EGP (approximate rate: 1 USD = 50 EGP)
    const egp = Math.round(price * 50)
    return `${egp.toLocaleString('ar-EG')} ج.م`
  }
  return `$${price.toLocaleString('en-US')}`
}

export const formatCurrency = (amount: number, locale: string): string => {
  return formatPrice(amount, locale)
}
