/*
 * Created by Nguyen Kim Khanh on 4/20/22, 9:44 PM
 *     goodhere.cpm@gmail.com
 *     Last modified 4/20/22, 9:44 PM
 *     Copyright (c) 2022.
 *     All rights reserved.
 */

import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class ConfigurationModel {
  @HiveField(0)
  final adsConfig;
  @HiveField(1)
  final apkVersionInfo;

  ConfigurationModel({this.adsConfig, this.apkVersionInfo});

  factory ConfigurationModel.fromJson(Map<String, dynamic> json) {
    return ConfigurationModel(
      adsConfig: json['ads_config'] != null
          ? new AdsConfig.fromJson(json['ads_config'])
          : null,
      apkVersionInfo: json['apk_version_info'] != null
          ? new ApkVersionInfo.fromJson(json['apk_version_info'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.adsConfig != null) {
      data['ads_config'] = this.adsConfig.toJson();
    }

    if (this.apkVersionInfo != null) {
      data['apk_version_info'] = this.apkVersionInfo.toJson();
    }

    return data;
  }
}

@HiveType(typeId: 2)
class AdsConfig {
  @HiveField(0)
  final adsEnable;

  @HiveField(1)
  final mobileAdsNetwork;

  @HiveField(2)
  final admobAppId;

  @HiveField(3)
  final admobBannerAdsId;

  @HiveField(4)
  final admobInterstitialAdsId;

  @HiveField(5)
  final fanNativeAdsPlacementId;

  @HiveField(6)
  final fanBannerAdsPlacementId;

  @HiveField(7)
  final fanInterstitialAdsPlacementId;

  @HiveField(8)
  final startappAppId;

  AdsConfig(
      {this.adsEnable,
      this.mobileAdsNetwork,
      this.admobAppId,
      this.admobBannerAdsId,
      this.admobInterstitialAdsId,
      this.fanNativeAdsPlacementId,
      this.fanBannerAdsPlacementId,
      this.fanInterstitialAdsPlacementId,
      this.startappAppId});

  factory AdsConfig.fromJson(Map<String, dynamic> json) {
    return AdsConfig(
      adsEnable: json['ads_enable'],
      mobileAdsNetwork: json['mobile_ads_network'],
      admobAppId: json['admob_app_id'],
      admobBannerAdsId: json['admob_banner_ads_id'],
      admobInterstitialAdsId: json['admob_interstitial_ads_id'],
      fanNativeAdsPlacementId: json['fan_native_ads_placement_id'],
      fanBannerAdsPlacementId: json['fan_banner_ads_placement_id'],
      fanInterstitialAdsPlacementId: json['fan_interstitial_ads_placement_id'],
      startappAppId: json['startapp_app_id'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ads_enable'] = this.adsEnable;
    data['mobile_ads_network'] = this.mobileAdsNetwork;
    data['admob_app_id'] = this.admobAppId;
    data['admob_banner_ads_id'] = this.admobBannerAdsId;
    data['admob_interstitial_ads_id'] = this.admobInterstitialAdsId;
    data['fan_native_ads_placement_id'] = this.fanNativeAdsPlacementId;
    data['fan_banner_ads_placement_id'] = this.fanBannerAdsPlacementId;
    data['fan_interstitial_ads_placement_id'] =
        this.fanInterstitialAdsPlacementId;
    data['startapp_app_id'] = this.startappAppId;
    return data;
  }
}

@HiveType(typeId: 4)
class ApkVersionInfo {
  @HiveField(0)
  final versionCode;
  @HiveField(1)
  final versionName;
  @HiveField(2)
  final whatsNew;
  @HiveField(3)
  final apkUrl;
  @HiveField(4)
  final isSkipable;

  ApkVersionInfo(
      {this.versionCode,
      this.versionName,
      this.whatsNew,
      this.apkUrl,
      this.isSkipable});

  factory ApkVersionInfo.fromJson(Map<String, dynamic> json) {
    return ApkVersionInfo(
      versionCode: json['version_code'],
      versionName: json['version_name'],
      whatsNew: json['whats_new'],
      apkUrl: json['apk_url'],
      isSkipable: json['is_skipable'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['version_code'] = this.versionCode;
    data['version_name'] = this.versionName;
    data['whats_new'] = this.whatsNew;
    data['apk_url'] = this.apkUrl;
    data['is_skipable'] = this.isSkipable;
    return data;
  }
}
