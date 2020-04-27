import * as React from 'react'
import Table from 'react-bootstrap/Table'

export function Stocks({ }) {
    return (
      <div>
        <h2>This is a page for stocks </h2>
        <Table responsive={true}>
          <thead className="stocks-table-header">
            <tr>
              <th>Sectors</th>
              <th>Stock</th>
              <th>Price</th>
              <th>Change %</th>
              <th>Change</th>
              <th>52 Week Range</th>
              <th>P/E</th>
              <th>Volume</th>
              <th>Shares Outstanding</th>
              <th>Earnings Date</th>
              <th>Analyst Rating</th>
              <th>Market Cap</th>
              <th>Cap Category</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>1</td>
              <td>Table cell</td>
              <td>Table cell</td>
              <td>Table cell</td>
              <td>Table cell</td>
              <td>Table cell</td>
              <td>Table cell</td>
            </tr>
            <tr>
              <td>2</td>
              <td>Table cell</td>
              <td>Table cell</td>
              <td>Table cell</td>
              <td>Table cell</td>
              <td>Table cell</td>
              <td>Table cell</td>
            </tr>
            <tr>
              <td>3</td>
              <td>Table cell</td>
              <td>Table cell</td>
              <td>Table cell</td>
              <td>Table cell</td>
              <td>Table cell</td>
              <td>Table cell</td>
            </tr>
          </tbody>
        </Table>
      </div>
    )
  }
  