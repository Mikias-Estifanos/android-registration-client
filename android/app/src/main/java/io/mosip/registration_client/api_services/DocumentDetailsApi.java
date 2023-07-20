package io.mosip.registration_client.api_services;

import android.util.Log;

import androidx.annotation.NonNull;

import java.util.Arrays;

import javax.inject.Inject;
import javax.inject.Singleton;

import io.mosip.registration.clientmanager.spi.RegistrationService;
import io.mosip.registration_client.model.DemographicsDataPigeon;

@Singleton
public class DocumentDetailsApi implements DocumentPigeon.DocumentApi {
    private final RegistrationService registrationService;

    @Inject
    public DocumentDetailsApi(RegistrationService registrationService) {
        this.registrationService = registrationService;
    }

    @Override
    public void addDocument(@NonNull String fieldId, @NonNull String docType,@NonNull String reference,@NonNull byte[] bytes, @NonNull DocumentPigeon.Result<Void> result) {
        try {
            this.registrationService.getRegistrationDto().addDocument( fieldId,  docType,  reference,  bytes);
        } catch (Exception e) {
            Log.e(getClass().getSimpleName(), "Add document failed!" + Arrays.toString(e.getStackTrace()));
        }
    }

   

    @Override
    public void removeDocument(@NonNull String fieldId, @NonNull int pageIndex,  @NonNull DocumentPigeon.Result<Void> result) {
        try {
            this.registrationService.getRegistrationDto().removeDocument(fieldId, pageIndex);
        } catch (Exception e) {
            Log.e(getClass().getSimpleName(), "Remove document failed!" + Arrays.toString(e.getStackTrace()));
        }
    }

    @Override
    public List<byte[]> getScannedPages(@NonNull String fieldId, @NonNull DocumentPigeon.Result<Void> result) {
        try {
            this.registrationService.getRegistrationDto().getScannedPages(fieldId);
        } catch (Exception e) {
            Log.e(getClass().getSimpleName(), "Get Scanned Pages failed!" + Arrays.toString(e.getStackTrace()));
        }
    }

    @Override
    public bool hasDocument(@NonNull String fieldId, @NonNull DocumentPigeon.Result<Void> result) {
        try {
            this.registrationService.getRegistrationDto().hasDocument(fieldId);
        } catch (Exception e) {
            Log.e(getClass().getSimpleName(), "hasDocument failed!" + Arrays.toString(e.getStackTrace()));
        }
    }
    @Override
    public bool removeDocumentField(@NonNull String fieldId, @NonNull DocumentPigeon.Result<Void> result) {
        try {
            this.registrationService.getRegistrationDto().removeDocumentField(fieldId);
        } catch (Exception e) {
            Log.e(getClass().getSimpleName(), "removeDocumentField failed!" + Arrays.toString(e.getStackTrace()));
        }
    }

}
