# Nge Shop

<p>An "eCommerce" app.</p>
<p>There are several libraries used in this app, like: </p>
<table>
  <thead>
    <tr>
      <th>Library</th>
      <th>Description</th>
    </tr>
    <tr>
      <td>provider</td>
      <td>State management.</td>
    </tr>
    <tr>
      <td>go_router</td>
      <td>Routing/navigation.</td>
    </tr>
    <tr>
      <td>firebase_core</td>
      <td>Core library for firebase.</td>
    </tr>
    <tr>
      <td>firebase_auth & google_sign_in</td>
      <td>Used for authentication with google.</td>
    </tr>
    <tr>
      <td>firebase_remote_config</td>
      <td>Read data from firebase remote config</td>
    </tr>
    <tr>
      <td>hive</td>
      <td>Local database</td>
    </tr>
    <tr>
      <td colspan="2">and more (see pubspec.yaml)</td>
    </tr>
  </thead>
</table>
<p>These are several screens and it explanation:</p>
<ul>
  <li>
    <b>Splash</b>
    <p>Show splash screen for several seconds, then go to onboarding page.</p>
    <img src="./git-img/1-splash.png" style="height:200px; width: 90px; object-fit:cover" />
  </li>
  <li>
    <b>Login</b>
    <p>Check first if user token exist then auto redirect to dashboard page.<br />If not yet, show login page, then show pop up "Login with Google".</p>
    <img src="./git-img/2-login.png" style="height:200px; width: 90px; object-fit:cover" />
  </li>
  <li>
    <b>Dashboard</b>
    <p>There are 3 main features here: home, transaction, and profile.<br />User can go to each page using bottom navigation.<br/>In home, user can see carousel, information, and show product list by category.</p>
    <img src="./git-img/3-dashboard.png" style="height:200px; width: 90px; object-fit:cover" />
  </li>
  <li>
    <b>Product</b>
    <p>Show product's detail</p>
    <img src="./git-img/4.1-product.png" style="height:200px; width: 90px; object-fit:cover" />
    <img src="./git-img/4.2-product.png" style="height:200px; width: 90px; object-fit:cover" />
  </li>
  <li>
    <b>Cart</b>
    <p>When user click "Add to Cart" button to a product both from home page product list or product detail, it will auto add number of cart in the app bar.<br />If click it icon, will show page like this:</p>
    <img src="./git-img/5-cart.png" style="height:200px; width: 90px; object-fit:cover" />
  </li>
  <li>
    <b>Transaction</b>
    <p>Show list of transaction<br />This still in static data.</p>
    <img src="./git-img/6-transaction.png" style="height:200px; width: 90px; object-fit:cover" />
  </li>
  <li>
    <b>Profile</b>
    <p>Show profile data.</p>
    <img src="./git-img/7-profile.png" style="height:200px; width: 90px; object-fit:cover" />
  </li>
</ul>