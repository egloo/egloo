import * as React from 'react'
import { useGetData } from "use-axios-react"

export const StatusUpdate = () => {
  const [data, loading] = useGetData("http://localhost:8081/user/dac3e982-7b26-4e90-9819-8dd059560b4b");

  if (loading) {
    return <div>Loading...</div>;
  }

  return (
    <div className="profile-data-container" >{data.username} is going on vacation soon!</div>
  )
}