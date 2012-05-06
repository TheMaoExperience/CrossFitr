package com.vorsk.crossfitr;

import android.app.Activity;
import android.os.Bundle;
import android.content.Intent;
import android.view.View;
import android.view.View.OnClickListener;

public class WorkoutActivity extends Activity implements OnClickListener{
    /** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.workouts);
        
        View wodButton = findViewById(R.id.wod_button);
        wodButton.setOnClickListener(this);
        View allButton = findViewById(R.id.all_button);
        allButton.setOnClickListener(this);
        View customButton = findViewById(R.id.custom_button);
        customButton.setOnClickListener(this);
        View heroButton = findViewById(R.id.hero_button);
        heroButton.setOnClickListener(this);
        View girlButton = findViewById(R.id.girl_button);
        girlButton.setOnClickListener(this);        
    }
    
    public void onClick(View v)
    {
    	switch(v.getId())
    	{
    		case R.id.all_button:
    			Intent i = new Intent(this, allActivity.java);
    			startActivity(i);
    			break;
    			
    		case R.id.wod_button:
    			i = new Intent(this, wodActivity.java);
    			startActivity(i);
    			break;
    			
    		case R.id.girl_button:
    			i = new Intent(this, girlsActivity.java);
    			startActivity(i);
    			break;
    		case R.id.hero_button:
    			i = new Intent(this, herosActivity.java);
    			startActivity(i);
    			break;
    		case R.id.custom_button:
    			i = new Intent(this, customActivity.java);
    			startActivity(i);
    			break;
    	}
    }
}