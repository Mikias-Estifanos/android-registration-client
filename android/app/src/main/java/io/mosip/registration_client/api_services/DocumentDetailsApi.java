package io.mosip.registration_client.api_services;

import android.util.Log;

import androidx.annotation.NonNull;

import java.util.Arrays;
import java.util.List;

import javax.inject.Inject;
import javax.inject.Singleton;

import io.mosip.registration.clientmanager.spi.RegistrationService;
import io.mosip.registration_client.model.DemographicsDataPigeon;
import io.mosip.registration_client.model.DocumentDataPigeon;

import org.apache.commons.lang3.ArrayUtils;

@Singleton
public class DocumentDetailsApi implements DocumentDataPigeon.DocumentApi {
    private final RegistrationService registrationService;

    @Inject
    public DocumentDetailsApi(RegistrationService registrationService) {
        this.registrationService = registrationService;
    }


    @Override
    public void addDocument(@NonNull String fieldId, @NonNull String docType, @NonNull String reference, @NonNull List<String> bytes, @NonNull DocumentDataPigeon.Result<Void> result) {
        List<String> stringList = bytes;
byte[] byteArray = new byte[0];
for (String str : stringList) {
    byteArray = ArrayUtils.addAll(byteArray, str.getBytes());
}
        try {

            this.registrationService.getRegistrationDto().addDocument(fieldId, docType,reference,byteArray);
            Log.e(getClass().getSimpleName(), "Document Added!"+this.registrationService.getRegistrationDto().getDocuments() );
        } catch (Exception e) {
            Log.e(getClass().getSimpleName(), "Add Document failed!" + Arrays.toString(e.getStackTrace()));
        }
    }

    @Override
    public void removeDocument(@NonNull String fieldId, @NonNull Long pageIndex, @NonNull DocumentDataPigeon.Result<Void> result) {

    }

    @Override
    public void getScannedPages(@NonNull String fieldId, @NonNull DocumentDataPigeon.Result<List<String>> result) {

    }

    @Override
    public void hasDocument(@NonNull String fieldId, @NonNull DocumentDataPigeon.Result<Boolean> result) {

    }

    @Override
    public void removeDocumentField(@NonNull String fieldId, @NonNull DocumentDataPigeon.Result<Void> result) {

    }
}