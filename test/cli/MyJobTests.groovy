import grails.test.AbstractCliTestCase

class MyJobTests extends AbstractCliTestCase {
    protected void setUp() {
        super.setUp()
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testMyJob() {

        execute(["my-job"])

        assertEquals 0, waitForProcess()
        verifyHeader()
    }
}
