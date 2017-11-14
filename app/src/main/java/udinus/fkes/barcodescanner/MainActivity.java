package udinus.fkes.barcodescanner;

import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.support.v7.app.AlertDialog;
import android.view.LayoutInflater;
import android.view.View;
import android.support.design.widget.NavigationView;
import android.support.v4.view.GravityCompat;
import android.support.v4.widget.DrawerLayout;
import android.support.v7.app.ActionBarDrawerToggle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import udinus.fkes.barcodescanner.activity.ScanActivity;

public class MainActivity extends AppCompatActivity
        implements NavigationView.OnNavigationItemSelectedListener {

    Button btnRegistrasi, btnIstirahat, btnSertifikat;
    Intent intent;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        FloatingActionButton fab = (FloatingActionButton) findViewById(R.id.fab);
        fab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Snackbar.make(view, "Replace with your own action", Snackbar.LENGTH_LONG)
                        .setAction("Action", null).show();
            }
        });

        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        ActionBarDrawerToggle toggle = new ActionBarDrawerToggle(
                this, drawer, toolbar, R.string.navigation_drawer_open, R.string.navigation_drawer_close);
        drawer.setDrawerListener(toggle);
        toggle.syncState();

        NavigationView navigationView = (NavigationView) findViewById(R.id.nav_view);
        navigationView.setNavigationItemSelectedListener(this);

        intent = new Intent(getApplicationContext(), ScanActivity.class);

        btnRegistrasi = (Button) findViewById(R.id.btnRegistrasi);
        btnRegistrasi.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                showAlertRegistrasi();
            }
        });

        btnIstirahat = (Button) findViewById(R.id.btnIstirahat);
        btnIstirahat.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                showAlertIstirahat();
            }
        });

        btnSertifikat = (Button) findViewById(R.id.btnSertifikat);
        btnSertifikat.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                showAlert("sertifikat");
            }
        });
    }

    @Override
    public void onBackPressed() {
        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        if (drawer.isDrawerOpen(GravityCompat.START)) {
            drawer.closeDrawer(GravityCompat.START);
        } else {
            super.onBackPressed();
        }
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            return true;
        }

        return super.onOptionsItemSelected(item);
    }

    @SuppressWarnings("StatementWithEmptyBody")
    @Override
    public boolean onNavigationItemSelected(MenuItem item) {
        // Handle navigation view item clicks here.
        int id = item.getItemId();

        if (id == R.id.nav_camera) {
            // Handle the camera action
        } else if (id == R.id.nav_gallery) {

        } else if (id == R.id.nav_slideshow) {

        } else if (id == R.id.nav_manage) {

        } else if (id == R.id.nav_share) {

        } else if (id == R.id.nav_send) {

        }

        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        drawer.closeDrawer(GravityCompat.START);
        return true;
    }

    public void showAlert(final String type) {
        AlertDialog.Builder builder = new AlertDialog.Builder(this, R.style.AppCompatAlertDialogStyle);

        if (type.equals("registrasi")) {
            builder.setMessage("Ingin melakukan scan barcode Registrasi?");
        }
        else if (type.equals("istirahat")) {
            builder.setMessage("Ingin melakukan scan barcode Istirahat?");
        } else if (type.equals("sertifikat")) {
            builder.setMessage("Ingin melakukan scan barcode Sertifikat?");
        }

        builder.setTitle("Konfirmasi");
        builder.setPositiveButton("OK", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialog, int which) {
                intent.putExtra("type", type);
                startActivity(intent);
            }
        });
        builder.setNegativeButton("BATAL", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialog, int which) {
            }
        });
        builder.show();
    }

    public void showAlertRegistrasi() {
        final String jenis = "registrasi";
        LayoutInflater layoutInflater = LayoutInflater.from(this);
        View promptView = layoutInflater.inflate(R.layout.alert_session_register, null);
        AlertDialog.Builder alertDialogBuilder = new AlertDialog.Builder(this);
        alertDialogBuilder.setTitle("Pilih Sesi Registrasi");
        alertDialogBuilder.setView(promptView);

//        intent.putExtra("type", jenis);

        Button sesi_1 = (Button) promptView.findViewById(R.id.register_session_1);
        sesi_1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                intent.putExtra("sesi", "1");
                showAlert(jenis);
            }
        });

        Button sesi_2 = (Button) promptView.findViewById(R.id.register_session_2);
        sesi_2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                intent.putExtra("sesi", "2");
                showAlert(jenis);
            }
        });

        Button sesi_3 = (Button) promptView.findViewById(R.id.register_session_3);
        sesi_3.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                intent.putExtra("sesi", "3");
                showAlert(jenis);
            }
        });

        Button sesi_4 = (Button) promptView.findViewById(R.id.register_session_4);
        sesi_4.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                intent.putExtra("sesi", "4");
                showAlert(jenis);
            }
        });

        Button sesi_5 = (Button) promptView.findViewById(R.id.register_session_5);
        sesi_5.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                intent.putExtra("sesi", "5");
                showAlert(jenis);
            }
        });

        // setup a dialog window
        // create an alert dialog
        AlertDialog alert = alertDialogBuilder.create();
        alert.show();
    }

    public void showAlertIstirahat() {
        final String jenis = "istirahat";
        LayoutInflater layoutInflater = LayoutInflater.from(this);
        View promptView = layoutInflater.inflate(R.layout.alert_session_istirahat, null);
        AlertDialog.Builder alertDialogBuilder = new AlertDialog.Builder(this);
        alertDialogBuilder.setTitle("Pilih Sesi Istirahat");
        alertDialogBuilder.setView(promptView);

//        intent.putExtra("type", jenis);

        Button sesi_1 = (Button) promptView.findViewById(R.id.istirahat_session_1);
        sesi_1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                intent.putExtra("sesi", "1");
                showAlert(jenis);
            }
        });

        Button sesi_2 = (Button) promptView.findViewById(R.id.istirahat_session_2);
        sesi_2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                intent.putExtra("sesi", "2");
                showAlert(jenis);
            }
        });

        Button sesi_3 = (Button) promptView.findViewById(R.id.istirahat_session_3);
        sesi_3.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                intent.putExtra("sesi", "3");
                showAlert(jenis);
            }
        });

        // setup a dialog window
        // create an alert dialog
        AlertDialog alert = alertDialogBuilder.create();
        alert.show();
    }

}
