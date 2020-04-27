import { useGetData } from '@egloojs/use-axios-react'
import { /*faBiohazard,*/ faHome, faInfinity, faUser, faUserFriends } from '@fortawesome/free-solid-svg-icons'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { makeStyles } from '@material-ui/core/styles';
// import { BasicUser } from './BasicUser'
import TextField from '@material-ui/core/TextField';
import * as React from 'react'
import Nav from 'react-bootstrap/Nav'
import Navbar from 'react-bootstrap/Navbar'
import { LinkContainer } from 'react-router-bootstrap'

const useStyles = makeStyles(theme => ({
  root: {
    '& .MuiTextField-root': {
      margin: theme.spacing(1),
      width: 200,
    },
  },
}));

export const TopLevelNavBar = () => {
  const [data, loading] = useGetData("http://localhost:8081/user/dac3e982-7b26-4e90-9819-8dd059560b4b")
  const classes = useStyles()


  if (loading) {
    return <div>Loading...</div>;
  }

  return (
    <Navbar expand="lg" bg="dark" variant="dark">
      <Navbar.Brand href="#home"><FontAwesomeIcon icon={faInfinity} /> eGloo</Navbar.Brand>
      <Navbar.Toggle aria-controls="basic-navbar-nav" />
      <Navbar.Collapse id="basic-navbar-nav">

        <Nav className="ml-auto">

          {/* <LinkContainer to="/league"><Nav.Link href="/league">League</Nav.Link></LinkContainer>
          <LinkContainer to="/portfolio"><Nav.Link href="/portfolio">My Portfolio</Nav.Link></LinkContainer>
          <LinkContainer to="/matchup"><Nav.Link href="/matchup">Match-Up</Nav.Link></LinkContainer> */}
           <form id="outlined-search-form" className={classes.root} noValidate={true} autoComplete="off">
             <TextField id="outlined-search" label="Search" type="search" variant="outlined" />
            </form>
          <LinkContainer to="/home"><Nav.Link href="/home"><FontAwesomeIcon icon={faHome} /> Home</Nav.Link></LinkContainer>
          <LinkContainer to="/friends"><Nav.Link href="/friends"><FontAwesomeIcon icon={faUserFriends} /> Friends</Nav.Link></LinkContainer>
          {/* <LinkContainer to="/settings"><Nav.Link href="/settings"><FontAwesomeIcon icon={faBiohazard} /></Nav.Link></LinkContainer> */}
          <LinkContainer to={"/"+data.username}><Nav.Link href={"/"+data.username}><FontAwesomeIcon icon={faUser} /> {data.username}</Nav.Link></LinkContainer>
          {/* <LinkContainer to="/dangerzone"><Nav.Link href="/dangerzone"><FontAwesomeIcon icon={faBiohazard} /></Nav.Link></LinkContainer> */}

          {/* <NavDropdown title="Dropdown" id="basic-nav-dropdown">
          <NavDropdown.Item href="#action/3.1">Action</NavDropdown.Item>
          <NavDropdown.Item href="#action/3.2">Another action</NavDropdown.Item>
          <NavDropdown.Item href="#action/3.3">Something</NavDropdown.Item>
          <NavDropdown.Divider />
          <NavDropdown.Item href="#action/3.4">Separated link</NavDropdown.Item>
        </NavDropdown> */}
        </Nav>

        {/* <Form inline>
        <FormControl type="text" placeholder="Search" className="mr-sm-2" />
        <Button variant="outline-success">Search</Button>
      </Form> */}
      </Navbar.Collapse>

    </Navbar>
    )
}