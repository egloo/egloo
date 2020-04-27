import { useGetData } from '@egloojs/use-axios-react'
import { /*faBiohazard,*/ faMinusCircle, faTimesCircle } from '@fortawesome/free-solid-svg-icons'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { makeStyles } from '@material-ui/core/styles';
// import { BasicUser } from './BasicUser'
import TextField from '@material-ui/core/TextField';
import * as React from 'react'
import { useState } from 'react'
import Col from 'react-bootstrap/Col'
import Container from 'react-bootstrap/Container'
import Row from 'react-bootstrap/Row'
import profilePic from '../profile_pic_daedalusx.jpg'
import { StatusUpdate } from './StatusUpdate'

const useStyles = makeStyles(theme => ({
  root: {
    '& .MuiTextField-root': {
      margin: theme.spacing(1),
      width: 200,
    },
  },
}));

export const UserProfile = () => {
  const [data, loading] = useGetData("http://localhost:8081/user/dac3e982-7b26-4e90-9819-8dd059560b4b");
  const [menuActive, setMenuState] = useState(false);
  const classes = useStyles()

  const setMenu = (event: any): void => {
    setMenuState(!menuActive)
  }

  if (loading) {
    return <div>Loading...</div>;
  }

  return (
    <Container>
      <Row>
        <Col xs={12} md={4}>
          <Row>
            <Col xs={12} md={12}>
              <div className="profile-pic-container" >
                <img src={profilePic} className="profile-pic" alt="profile pic" />

                <div className={`menu ${menuActive ? "active" : ""}`} onClick={setMenu}>
                  <div className="btn trigger">
                    <span className="line" />
                  </div>
                  <div className="icons">
                    <div className="rotater">
                      <div className="btn btn-icon">
                        <i className="fa fa-codepen" />
                      </div>
                    </div>
                    <div className="rotater">
                      <div className="btn btn-icon">
                        <i className="fa fa-facebook" />
                      </div>
                    </div>
                    <div className="rotater">
                      <div className="btn btn-icon">
                        <i className="fa fa-google-plus" />
                      </div>
                    </div>
                    <div className="rotater">
                      <div className="btn btn-icon">
                        <i className="fa fa-twitter" />
                      </div>
                    </div>
                    <div className="rotater">
                      <div className="btn btn-icon">
                        <i className="fa fa-dribbble" />
                      </div>
                    </div>
                    <div className="rotater">
                      <div className="btn btn-icon">
                        <i className="fa fa-linkedin" />
                      </div>
                    </div>
                    <div className="rotater">
                      <div className="btn btn-icon">
                        <i className="fa fa-github" />
                      </div>
                    </div>
                    <div className="rotater">
                      <div className="btn btn-icon">
                        <i className="fa fa-behance" />
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </Col>
          </Row>
          <Row>
            <Col xs={2} md={2}>&nbsp;</Col>
            <Col xs={8} md={8}>
              <div className="profile-data-container" >George Cooper</div>
            </Col>
            <Col xs={2} md={2}>&nbsp;</Col>
          </Row>
        </Col>
        <Col xs={12} md={4}>
          <Container className="inner-container">
            <Row>
              <Col xs={1} md={1} className="cube-slate-controls-tl">
                <FontAwesomeIcon icon={faTimesCircle} />
              </Col>
              <Col xs={9} md={9} className="cube-slate-controls">
                &nbsp;
              </Col>
              <Col xs={1} md={1} className="cube-slate-controls-tr">
                <FontAwesomeIcon icon={faMinusCircle} />
              </Col>
            </Row>
            <Row>
              <Col xs={12} md={12}>
                <div className="demo demo2" augmented-ui="bl-clip tl-clip r-clip exe">
                  <form id="outlined-status-form" className={classes.root} noValidate={true} autoComplete="off">
                    <TextField id="outlined-status" label="Status?" type="text" variant="outlined" />
                  </form>
                </div>
              </Col>
            </Row>
            <Row>
              <StatusUpdate />
            </Row>
            <Row>
              <Col xs={1} md={1} className="cube-slate-controls-bl"/>
                {/* <FontAwesomeIcon icon={faTimesCircle} />
              </Col> */}
              <Col xs={10} md={10} className="cube-slate-controls">
                &nbsp;
              </Col>
              <Col xs={1} md={1} className="cube-slate-controls-br">
                <FontAwesomeIcon icon={faMinusCircle} />
              </Col>
            </Row>

            
          </Container>
        </Col>
        <Col xs={12} md={4}>
          <Container className="inner-container">
            <Row>
              <Col xs={1} md={1} className="cube-slate-controls-tl">
                <FontAwesomeIcon icon={faTimesCircle} />
              </Col>
              <Col xs={9} md={9} className="cube-slate-controls">
                &nbsp;
              </Col>
              <Col xs={1} md={1} className="cube-slate-controls-tr">
                <FontAwesomeIcon icon={faMinusCircle} />
              </Col>
            </Row>
            <Row>
              <Col xs={12} md={12}>
                <div className="profile-data-container" >{data.username}</div>
              </Col>
            </Row>
            <Row>
              <Col xs={12} md={12}>
                <div className="profile-data-container" >10 ❤️ 4 🍑 36 🐒</div>
              </Col>
            </Row>
            <div className="glow-wrappe">
              <div className="glow-container">
                <div className="glow-label glow-one">Metric 1</div>
                <div className="glow-progress-bar">
                  <div className="glow-progress glow-fill-1">
                    <div className="glow"/>
                  </div>
                </div>
              </div>
              <div className="glow-container">
                <div className="glow-label glow-two">Metric 2</div>
                <div className="glow-progress-bar">
                  <div className="glow-progress glow-fill-2">
                    <div className="glow"/>
                  </div>
                </div>
              </div>
              <div className="glow-container">
                <div className="glow-label glow-three">Metric 3</div>
                <div className="glow-progress-bar">
                  <div className="glow-progress glow-fill-3">
                    <div className="glow"/>
                  </div>
                </div>
              </div>
            </div>
          </Container>
        </Col>
      </Row>
    </Container >
  )
}