<!--//
var timerId = null, timeout = 5;
//-->
<!--//
function WaitUntilCustomerGUIDIsRetrieved() {
  if (!!(timerId)) {
    if (timeout == 0) {
      return;
    }
    if (typeof this.GetElqCustomerGUID === 'function') {
      document.forms["fedramp_form"].elements["elqCustomerGUID"].value = GetElqCustomerGUID();
      return;
    }
    timeout -= 1;
  }
  timerId = setTimeout("WaitUntilCustomerGUIDIsRetrieved()", 500);
  return;
}
window.onload = WaitUntilCustomerGUIDIsRetrieved;
_elqQ.push(['elqGetCustomerGUID']);
//-->
