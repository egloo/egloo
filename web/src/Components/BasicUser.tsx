// import axios from 'axios'
import { useGetData } from '@egloojs/use-axios-react'
import * as React from 'react'

export const BasicUser = () => {
  const [data, loading] = useGetData("http://localhost:8081/user/dac3e982-7b26-4e90-9819-8dd059560b4b");

  if (loading) {
    return <div>Loading...</div>;
  }

  return <blockquote>{data.username}</blockquote>;
}

export const BasicUsername = () => {
  const [data, loading] = useGetData("http://localhost:8081/user/dac3e982-7b26-4e90-9819-8dd059560b4b");

  if (loading) {
    return <div>Settings</div>;
  }

  return <div>{data.username}</div>
}
  
// export default class BasicUser extends React.Component {
//     public state = {
//       userProfile: {
//           firstName: "",
//           lastName: "",
//           username: ""
//       }
//     }
  
//     public componentDidMount() {
//       axios.get(`http://localhost:8081/user/dac3e982-7b26-4e90-9819-8dd059560b4b`)
//         .then(res => {
//           const userProfile = res.data;
//           this.setState({ userProfile });
//         })
//     }
  
//     public render() {
//       return (
//         <h1>
//           { this.state.userProfile.username }
//         </h1>
//       )
//     }
//   }
  