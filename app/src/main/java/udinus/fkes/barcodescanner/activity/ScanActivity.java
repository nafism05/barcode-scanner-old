package udinus.fkes.barcodescanner.activity;

import android.app.ProgressDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.SurfaceView;
import android.widget.ImageView;
import android.widget.TextView;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.VolleyLog;
import com.android.volley.toolbox.JsonObjectRequest;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.HashMap;
import java.util.Map;

import github.nisrulz.qreader.QRDataListener;
import github.nisrulz.qreader.QREader;
import udinus.fkes.barcodescanner.R;
import udinus.fkes.barcodescanner.app.AppConfig;
import udinus.fkes.barcodescanner.app.AppController;
import uk.co.chrisjenx.calligraphy.CalligraphyConfig;
import uk.co.chrisjenx.calligraphy.CalligraphyContextWrapper;

public class ScanActivity extends AppCompatActivity {

    private final static String TAG = ScanActivity.class.getSimpleName();
    // UI
    private TextView text;
    private SurfaceView mySurfaceView;
    private QREader qrEader;
    private ProgressDialog pDialog;
    private String link, sesi;
    private Boolean QRstatus = true;
    TextView txtNama, txtKota;
    ImageView photo;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        CalligraphyConfig.initDefault(new CalligraphyConfig.Builder()
                .setDefaultFontPath("fonts/OpenSansRegular.ttf")
                .setFontAttrId(R.attr.fontPath)
                .build()
        );
        setContentView(R.layout.activity_scan);

        pDialog = new ProgressDialog(this);
        pDialog.setCancelable(false);

        Intent i = getIntent();
        link = getLink(i.getStringExtra("type"));
        if (i.getStringExtra("sesi") == null)
            sesi = "0";
        else
            sesi = i.getStringExtra("sesi");

        txtNama = (TextView) findViewById(R.id.participant_name);
        txtKota = (TextView) findViewById(R.id.participant_city);
        photo = (ImageView) findViewById(R.id.participant_photo);

        txtNama.setText("");
        txtKota.setText("");
        photo.setImageResource(R.drawable.avatar);

        text = (TextView) findViewById(R.id.code_info);
        mySurfaceView = (SurfaceView) findViewById(R.id.camera_view);

        qrEader = new QREader.Builder(this, mySurfaceView, new QRDataListener() {
            @Override
            public void onDetected(final String data) {
                Log.d("QREader", "Value : " + data);
                text.post(new Runnable() {
                    @Override
                    public void run() {
                        if (QRstatus) {
                            QRstatus = false;
                            process(data);
                        }
                    }
                });
            }
        }).facing(QREader.BACK_CAM)
                .enableAutofocus(true)
                .height(mySurfaceView.getHeight())
                .width(mySurfaceView.getWidth())
                .build();

    }

    @Override
    protected void attachBaseContext(Context newBase) {
        super.attachBaseContext(CalligraphyContextWrapper.wrap(newBase));
    }

    @Override
    protected void onResume() {
        super.onResume();

        // Init and Start with SurfaceView
        // -------------------------------
        qrEader.initAndStart(mySurfaceView);
    }

    @Override
    protected void onPause() {
        super.onPause();

        // Cleanup in onPause()
        // --------------------
        qrEader.releaseAndCleanup();
    }

    @Override
    public void onBackPressed() {
        super.onBackPressed();
        finish();
    }

    private void showAlert(String title, String pesan) {
        AlertDialog.Builder builder =
                new AlertDialog.Builder(this, R.style.AppCompatAlertDialogStyle);
        builder.setTitle(title);
        builder.setMessage(pesan);
        builder.setPositiveButton("OK", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialog, int which) {
                QRstatus = true;
            }
        });
        builder.show();
    }

    private void showProggressDialog() {
        if (!pDialog.isShowing()) {
            pDialog.setMessage("Loading...");
            pDialog.show();
        }
    }

    private void hideProggressDialog() {
        if (pDialog.isShowing()) {
            //pDialog.hide();
            pDialog.dismiss();
        }
    }

    private void process(final String dataQR) {
        showProggressDialog();
        final String id_peserta = dataQR.split("@")[1].trim();

//        Map<String, String> params = new HashMap<String, String>();
//        params.put("id_peserta", id_peserta);
//
//        final JSONObject postParam = new JSONObject(params);

        JsonObjectRequest request = new JsonObjectRequest(Request.Method.POST, link, null, new Response.Listener<JSONObject>() {
            @Override
            public void onResponse(JSONObject response) {
                Log.d(TAG, response.toString());
                try {
                    Boolean sukses = response.getBoolean("sukses");
                    if (sukses) {
                        JSONObject participant = response.getJSONObject("peserta");
                        Log.d(TAG, response.getString("pesan"));
                        txtNama.setText(participant.getString("fullname"));
                        txtKota.setText(participant.getString("institution"));
                        hideProggressDialog();
                        showAlert("Berhasil", response.getString("pesan"));
                    } else {
                        Log.d(TAG, response.getString("pesan"));
                        hideProggressDialog();
                        showAlert("Maaf", response.getString("pesan"));
                    }
                } catch (JSONException e) {
                    e.printStackTrace();
                    hideProggressDialog();
                    showAlert("Maaf", "Terjadi kesalahan pada aplikasi, harap  ulangi kembali.");
                }
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                VolleyLog.d(TAG, "Error : " + error.toString());
                hideProggressDialog();
                showAlert("Maaf", "Terjadi kesalahan, harap periksa koneksi Anda kemudian ulangi kembali.");
            }
        }) {
            @Override
            public byte[] getBody() {
                String httpPostBody = String.format("id_peserta=%s&sesi=%s", id_peserta, sesi);

                return httpPostBody.getBytes();
            }

            @Override
            public Map<String, String> getHeaders() throws AuthFailureError {
                Map<String, String> headers = new HashMap<String, String>();
                headers.put("Content-Type", "application/x-www-form-urlencoded");

                return headers;
            }
        };

        AppController.getInstance().addToRequestQueue(request, TAG);
    }

    public String getLink(String type) {
        String link = "";

        if (type.equals("registrasi"))
            link = AppConfig.REGISTRASI;
        else if (type.equals("istirahat"))
            link = AppConfig.ISTIRAHAT;
        else if (type.equals("sertifikat"))
            link = AppConfig.SERTIFIKAT;

        return link;
    }
}
