Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D529EC43458
	for <qemu-riscv@archiver.kernel.org>; Tue, 14 Jul 2026 07:58:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wjY1m-0002W5-Dj; Tue, 14 Jul 2026 03:58:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wjY1l-0002Vb-JU
 for qemu-riscv@nongnu.org; Tue, 14 Jul 2026 03:58:05 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wjY1j-0003bP-Uv
 for qemu-riscv@nongnu.org; Tue, 14 Jul 2026 03:58:05 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66E6SXMk3954626
 for <qemu-riscv@nongnu.org>; Tue, 14 Jul 2026 07:58:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=yiotWj2VIis
 s3eyZxiMecku3YKV14swuwd5EFw/M1rY=; b=ngMglVpFzDo0QpmlmzrfgQUIdIx
 ygjhBQ3/VP2feumd896DPd2YozzbDxB67tfZMtL3beQGePvpihROqpOA6h1AW22a
 WXT6+mjOxJC2EECtpKZXCJwb4v5RZ0l6kwWoyPkXNDirVHWce059HCb7pVwSUuuu
 8TbwF3vK0zJbtT7wg+cxrvkPE4i4T8mk4YrIcfAmDvgm6RirWHDH22StzrA34ePx
 ORZmIuFwIsg+cMNI+iOzfm9RQYKlxqZ0oEtdsguZuOH5p7kp65LFW9CLkREvsV63
 lkPF49rxAJBNxIHdfmDHnXxzx82ZJENEfa0ZBs74+qmVGqiUL+36VnoqFsg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44jtr7b-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 14 Jul 2026 07:58:02 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-384cb1637c2so1080561a91.2
 for <qemu-riscv@nongnu.org>; Tue, 14 Jul 2026 00:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784015882; x=1784620682; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=yiotWj2VIiss3eyZxiMecku3YKV14swuwd5EFw/M1rY=;
 b=MI3dBI3s5lJ2K8yEZvwtdnGVFEuxp1kIYZcWNsA8iP5aRzxq1ncKsrv2mdh0x4S7hj
 QRb1XWgLjJaJjip9PYh59lNO5lTKLyQ1kxwRcEljKRnZC2i9/HLbqd9ZCIu8O8kjqua4
 tG2eaGV+CzDHJ1qNPMA37ygkn73zHkn1AwCS0UBdRs1z8kT1mTChCct193llYZkwfCtu
 KnRoLkuxZpdebihjwz4J+RXZh3nanXqDy1fhVzuZ01jJkoB82beawabu4Rv7Ta7jvj3d
 +CL7JSTWzeGvEx/29WMKj9ckFto5z3ym0/aI4dRpqMfQlSaNP908/q9pzHq4uUtsx5d8
 7+OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784015882; x=1784620682;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=yiotWj2VIiss3eyZxiMecku3YKV14swuwd5EFw/M1rY=;
 b=hCvo6aVqmZN7HqyKmftOFJkbe8m0waBk4oem+EqPJ7zfi2sHpAY/UngE6Z4UrmbGuU
 LyxhlLzyvD2fZ2NbWm9PpGJJIuINKu4hQAZo5rtYxBBgL4u/kQBfWXYmnYNC6Bk6rq+0
 uw545XzTzg6Hmj+oH8Yeqd2PEllzmCkCodeSPL0CJzTeTN9IGHIwLg3XVJrNCTZSEDrU
 jRrCcSl5t/OZ7HPf8h8BkyyoCUYsd8/72DzwWIoiC9voZZyeH7Av+KNm9WlVvgpzLq7G
 bANKvuNiHKMJhtMfOmv0oMcvHYcivBzwHKF6KubCNfbGssUbEhEqUxA46m6WG5Zf3UIf
 Rj/w==
X-Gm-Message-State: AOJu0YxTs4ceeJi0UEUCDhTOn31Cs5V0/De54Eziw1mVg1LmKo9uqaoa
 pub7W0nwiU5e9NuiDR9ZbZP3gICeGK/JMja1e+HvtpY8fAjlJrzwfhOq5ZW4oC9Sfy98zvU0Z19
 4fsJUmQahWCw7uyf1qgKPWO0uDy0V0mqQ50ebR2IgT8ImHGeBnNovjCBVUFVgc31bNg==
X-Gm-Gg: AfdE7cka9sqI7rJc6HSKAy0gtNDNYMwDpZSjRQi7w+R/3o8YcIaQml9T+4XFLdOjEwC
 0MF6n4L5amSDdr+asX+c5wMgNRTNknPG0ZDmeeg+pXXWj4wM6MImwWw5Y0zmwb8jUv6DeFJ/A0B
 yXEF7Zlle5Zf0IQ1ZEDvdFj/uets3AX2oReHCKHwX59nLK+caL6FARpw4o8FxRDlG48VVa5bxkO
 9owWKzk/GqjUpyF3MWU44+9zUkBfklgsPvkcspBL6oSXy3wtvaFJf+25oP5i2/zBWH13MSwhrMa
 CHa3HbwkbDxl487zQjkaLcE3Qduf8K+iGFkDN0wZfC2IRozQMtT0DBWeKvVU391yuv0tqDxhUP5
 9sjbGccjB8Vl1dtIM0DWMiswfunrHFmeY+IWRNeFXSQ/6E2NTMWa+afg7zSVli/jlHCFkzmMWJK
 zdLV/V7oPQ4FS5wGmdHaqpoCPFKJAEeNmI4Txl3URPBQ==
X-Received: by 2002:a17:90b:4b84:b0:381:16b0:55c5 with SMTP id
 98e67ed59e1d1-38dc7a978e1mr8984276a91.2.1784015881775; 
 Tue, 14 Jul 2026 00:58:01 -0700 (PDT)
X-Received: by 2002:a17:90b:4b84:b0:381:16b0:55c5 with SMTP id
 98e67ed59e1d1-38dc7a978e1mr8984258a91.2.1784015881290; 
 Tue, 14 Jul 2026 00:58:01 -0700 (PDT)
Received: from hu-slingapp-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-311950eb930sm55606355eec.8.2026.07.14.00.57.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2026 00:58:00 -0700 (PDT)
From: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
To: qemu-riscv@nongnu.org
Cc: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org (open list:All patches CC here)
Subject: [PATCH v3 01/10] build: add optional librpmi dependency
Date: Tue, 14 Jul 2026 13:26:50 +0530
Message-ID: <20260714075659.2258023-2-subrahmanya.lingappa@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260714075659.2258023-1-subrahmanya.lingappa@oss.qualcomm.com>
References: <20260714075659.2258023-1-subrahmanya.lingappa@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: vix74oH9EE2aXhdwLES0DOHSYIvsJpr0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA4MiBTYWx0ZWRfX7bpa5So8pW6/
 g9HrCvtXxbZLvf9BOxk9KRbgA7xQ2choZu54WI+mbW2Oj94ODGfRE4PYBCWp6sfHDjSY7n9ChRj
 DTpZQ5Q7I+25bnXjJ7MvP33DNp42xjTKt76Kzn2DhhOKp7AVSi8S1XHKyB/RnS6WubzdMAeRgoO
 THMEruJPID+MeTIaXk8/SW+j9GtlB0hLowLWQa91z2wTIW2dD7nFtpLT51deS/AZ5wORDGWzJlh
 OBaVG1+rsHBKxgsNJdXskD4DhEh1u8hPMYbkVEl1fgK/3u/IYBcUL8oDSeD2x0LgBCRUGU8mlJa
 d67TQPorTJ3yiuuezR21nBpq6Revj3FDOjQrr0MIn7xKSrd9K65oj72CDt6OHJaJr4BcmeGMmSI
 Qm05Ad2egRMnCM5qgMzSsXg5EWo600itWBouHU7aBQzWYjnfynFvO6RHXlv6QWDIsHYDegnQUPa
 haXEIRubgm4dmIp06SA==
X-Authority-Analysis: v=2.4 cv=XonK/1F9 c=1 sm=1 tr=0 ts=6a55ec0a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=_6tmRKQHnRYSWcN6IbQA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: vix74oH9EE2aXhdwLES0DOHSYIvsJpr0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA4MiBTYWx0ZWRfX/z0iJzyXAGtJ
 xX7r/s7rc3rrgVIIV5jaImw2KPd3k7KbDu9mBYYzVCjXoO8Ju24NbRQF+lCfc1I4Y/2W6ieyrHe
 PSTSlUbXtqKhV/UwFTCGO6CLbkyK130=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140082
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=subrahmanya.lingappa@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Add a meson option and config probe for librpmi so RISC-V machines can
opt into RPMI support when the library is available. Keep the dependency
optional so default builds without librpmi continue to work.

Signed-off-by: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
---
 Kconfig.host                  |  3 +++
 meson.build                   | 14 ++++++++++++++
 meson_options.txt             |  2 ++
 scripts/meson-buildoptions.sh |  3 +++
 4 files changed, 22 insertions(+)

diff --git a/Kconfig.host b/Kconfig.host
index 933425c74b..6f98dadb2e 100644
--- a/Kconfig.host
+++ b/Kconfig.host
@@ -8,6 +8,9 @@ config LINUX
 config LIBCBOR
     bool
 
+config LIBRPMI
+    bool
+
 config GNUTLS
     bool
 
diff --git a/meson.build b/meson.build
index 19e123423b..103b4649b8 100644
--- a/meson.build
+++ b/meson.build
@@ -2005,6 +2005,17 @@ if lzo.found() and not cc.links('''
   endif
 endif
 
+librpmi = not_found
+if not get_option('librpmi').auto() or have_system
+  librpmi = dependency('librpmi', required: get_option('librpmi'),
+                       method: 'pkg-config')
+  if librpmi.found() and not cc.has_header_symbol('librpmi.h',
+                                                  'rpmi_service_group_logging_create',
+                                                  dependencies: librpmi)
+    error('librpmi support requires the RPMI logging service group API')
+  endif
+endif
+
 numa = not_found
 if not get_option('numa').auto() or have_system or have_tools
   numa = cc.find_library('numa', has_headers: ['numa.h'],
@@ -2427,6 +2438,7 @@ config_host_data.set('CONFIG_LINUX', host_os == 'linux')
 config_host_data.set('CONFIG_POSIX', host_os != 'windows')
 config_host_data.set('CONFIG_WIN32', host_os == 'windows')
 config_host_data.set('CONFIG_LZO', lzo.found())
+config_host_data.set('CONFIG_LIBRPMI', librpmi.found())
 config_host_data.set('CONFIG_MPATH', mpathpersist.found())
 config_host_data.set('CONFIG_BLKIO', blkio.found())
 if blkio.found()
@@ -3258,6 +3270,7 @@ host_kconfig = \
   (multiprocess_allowed ? ['CONFIG_MULTIPROCESS_ALLOWED=y'] : []) + \
   (vfio_user_server_allowed ? ['CONFIG_VFIO_USER_SERVER_ALLOWED=y'] : []) + \
   (hv_balloon ? ['CONFIG_HV_BALLOON_POSSIBLE=y'] : []) + \
+  (librpmi.found() ? ['CONFIG_LIBRPMI=y'] : []) + \
   (have_rust ? ['CONFIG_HAVE_RUST=y'] : [])
 
 ignored = [ 'TARGET_XML_FILES', 'TARGET_ABI_DIR' ]
@@ -4971,6 +4984,7 @@ summary_info += {'TPM support':       have_tpm}
 summary_info += {'IGVM support':      igvm}
 summary_info += {'libssh support':    libssh}
 summary_info += {'lzo support':       lzo}
+summary_info += {'librpmi support':   librpmi}
 summary_info += {'snappy support':    snappy}
 summary_info += {'bzip2 support':     libbzip2}
 summary_info += {'lzfse support':     liblzfse}
diff --git a/meson_options.txt b/meson_options.txt
index a07cb47d35..9f773a7886 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -204,6 +204,8 @@ option('lzfse', type : 'feature', value : 'auto',
        description: 'lzfse support for DMG images')
 option('lzo', type : 'feature', value : 'auto',
        description: 'lzo compression support')
+option('librpmi', type : 'feature', value : 'auto',
+       description: 'RISC-V RPMI support')
 option('pvg', type: 'feature', value: 'auto',
        description: 'macOS paravirtualized graphics support')
 option('rbd', type : 'feature', value : 'auto',
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index c003985047..e8a20068e7 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -140,6 +140,7 @@ meson_options_help() {
   printf "%s\n" '  libkeyutils     Linux keyutils support'
   printf "%s\n" '  libnfs          libnfs block device driver'
   printf "%s\n" '  libpmem         libpmem support'
+  printf "%s\n" '  librpmi         RISC-V RPMI support'
   printf "%s\n" '  libssh          ssh block device support'
   printf "%s\n" '  libudev         Use libudev to enumerate host devices'
   printf "%s\n" '  libusb          libusb support for USB passthrough'
@@ -376,6 +377,8 @@ _meson_option_parse() {
     --disable-libnfs) printf "%s" -Dlibnfs=disabled ;;
     --enable-libpmem) printf "%s" -Dlibpmem=enabled ;;
     --disable-libpmem) printf "%s" -Dlibpmem=disabled ;;
+    --enable-librpmi) printf "%s" -Dlibrpmi=enabled ;;
+    --disable-librpmi) printf "%s" -Dlibrpmi=disabled ;;
     --enable-libssh) printf "%s" -Dlibssh=enabled ;;
     --disable-libssh) printf "%s" -Dlibssh=disabled ;;
     --enable-libudev) printf "%s" -Dlibudev=enabled ;;
-- 
2.43.0


