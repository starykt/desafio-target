export class RevenueService {
  /**
   * @param numDias
   * @param min
   * @param max
   * @returns
   */
  generateVector(numDias: number, min: number, max: number): number[] {
    const revenue: number[] = [];

    for (let i = 0; i < numDias; i++) {
      const valor = Math.random() < 0.3 ? 0 : Math.floor(Math.random() * (max - min + 1)) + min;
      revenue.push(valor);
    }

    return revenue;
  }

  calculateRevenueStats(revenue: number[]) {
    const validDays = revenue.filter(value => value > 0); // Filtrando valores zerados

    const minRevenue = Math.min(...validDays); // Menor faturamento
    const maxRevenue = Math.max(...validDays); // Maior faturamento

    const totalRevenue = validDays.reduce((acc, value) => acc + value, 0);
    const averageRevenue = totalRevenue / validDays.length;

    const daysAboveAverage = validDays.filter(value => value > averageRevenue).length;

    return { minRevenue, maxRevenue, daysAboveAverage, revenue };
  }
}