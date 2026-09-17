Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81420C982D0
	for <qemu-riscv@archiver.kernel.org>; Thu, 17 Sep 2026 05:25:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x74am-0007ha-Ei; Thu, 17 Sep 2026 01:23:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1x74ak-0007gI-Bs
 for qemu-riscv@nongnu.org; Thu, 17 Sep 2026 01:23:26 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1x74ai-0003zA-Iu
 for qemu-riscv@nongnu.org; Thu, 17 Sep 2026 01:23:26 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68GMdcHh3107043
 for <qemu-riscv@nongnu.org>; Thu, 17 Sep 2026 05:23:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9u8hm9OXCNsOjii0Vsxtf1al9O3Iakrbq+pZflTi7ns=; b=d49LU0yTmJGMi967
 1bZY+yHPgslVqwI4RxcbEXUEOhGBzh7+QMKvM0TIjA18ffhhOEEP8Pb83mFQPE2u
 Xz+Zi5usW7X+zxIIp4WoblLxbZettS+vnQzG2w1eXygkBec9sKiw3C0RPh/UaB2s
 tPEONMCgfwuzf8cqRnO2fj+UVjkCTH6HpWgzNJ/KtlLGc1ZKIP1ZrVUnkbUU0TPe
 2z+rhXgLGjgt68xCv4gWC2KrwdrIOvo/wP9/5hEqUzCPrZmm5Vf0V5vMW0gchl3/
 /jGMeKIwvh6fiHLvddfwY7eo8eXnNA8TZMI6Enjt9fG/dMwr4CcZh5ySoH23hqQd
 uWggqg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gquw2uk96-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 17 Sep 2026 05:23:22 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2dd15dd1254so1276755ad.0
 for <qemu-riscv@nongnu.org>; Wed, 16 Sep 2026 22:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1789622601; x=1790227401; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=9u8hm9OXCNsOjii0Vsxtf1al9O3Iakrbq+pZflTi7ns=;
 b=KGTbA5nr20ZDzRdcxdUCOZGAWZyiJBmzpOmLxzV1r0RWVHTnWmG06Qzh7f/NK8bTfY
 +2z2bYJ/Lgz+zi5EpuF6z9gNyKGJvO0/cnaqXA0iMJCOkZwKiEXDT0txf7bfgQ8SFUhs
 lea6RVNUG8Gjx7M8dpUxhUUcCFw1IxAdQArXm0rnsKbHNNmCy5rb8OSj3qtHySaruy6s
 ZHakWYSotGfAVuvoDyql4FJIiWUezunVV4ijZ/u9nWXX2CAos4Fe0DKZT2o6mZcsbQ/g
 opMaSE3OClaZ13itWIc+n3iUVrON15cQ/1al1Ej8jFJ4Nuor2Ee2sajTc5is21s+b5xK
 PYsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789622601; x=1790227401;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=9u8hm9OXCNsOjii0Vsxtf1al9O3Iakrbq+pZflTi7ns=;
 b=DEeH1QjRy/maw9WG6ck2BVQn7aja6qUXI1R5qAsqG/ieHaS4uEOzuSpuuru4rEHwZm
 yp6qeJQ1G8dOp9aylYnPlS+WrJSUhTxkQZKfrel1fSMRl6ehS6FLoN9XxB4U1FFFW0YR
 MOC7y0+O4Ox5wMjurpnMGCR6CADn3KFpTEW9qCyobOXNGJVUshQkI4+xy4CX8aTqM+z9
 ueVCThXLWTxJbNoJ6GugXPuDIRgyicdiOTOM1a97kb7kUo1fuw2vfgYc7FTmkg7sLXmX
 ncYQuBEmMpl8EFVb4eMtt29zUADnlIgMN0EIunwUxnaRvgewdCYxGHBjFY8hR2uXJPbL
 gVPg==
X-Gm-Message-State: AFuF++nr2Y94il0hfxQQjM4W9sdnSVDiurgGAPimXyVuTScbXu9uTSxi
 gHvDnhmMEFfUeAYXchzgxgT2IcN/NX7Qp1sMsqDy9SqVFh0DAt0fI/1eLw/X8FPxsfkys26jKb7
 T6zNVq0OxxEfTrpradV3jLLPtSPOSR96TgvVMV+f+6zo2XzV0nLtykr8S/Q==
X-Gm-Gg: AYBFou2B4QTRpEn946OpDj1cFSoN23pb7RVC124B1IET72bxlbf2xmPXzEjpEMTJ26+
 L4h3GUfmIVAwhcjS4IpEK68ulJS+4KBaqCb8lHvJTeaXjVhksvsF4ia/UHSp22wplaTF9UGBCQg
 llOF15HAFKBnVA8UO+gkcYKTvtOhsPWGJ/9x/eSBjWpW0nu6/wpwpCujwxjVPwStDzciLnvNnok
 9NUx8pGeL95qEOfimQHwM0z3jxRjp7KmRgM+OI70csQTAOF1QYva3ejh64AqpRltk3Y7mU/iKO+
 etKN/QDrf9jT+5LOB+Ya4SRWbmSu6fwTTnWD1ujAYQvwdDlNePziBFkXFcJC73Czf+LsYTKQqjt
 XVfqmDYgQyqVgnPq1pXl2DppxoKCWAyoF4owg+6c4YmaEBuR/NdWG1UqNHmQxzaxH+7BrDJnY7r
 X+95RXX75dIwOXRyULSzMYUL0Es9TBcY8=
X-Received: by 2002:a17:90b:2250:b0:39d:e1f2:3400 with SMTP id
 98e67ed59e1d1-39e1e5285d8mr7859172a91.5.1789622601277; 
 Wed, 16 Sep 2026 22:23:21 -0700 (PDT)
X-Received: by 2002:a17:90b:2250:b0:39d:e1f2:3400 with SMTP id
 98e67ed59e1d1-39e1e5285d8mr7859141a91.5.1789622600736; 
 Wed, 16 Sep 2026 22:23:20 -0700 (PDT)
Received: from hu-slingapp-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-33bf5af4f0bsm14256187eec.24.2026.09.16.22.23.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2026 22:23:20 -0700 (PDT)
From: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
 Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Sunil V L <sunilvl@oss.qualcomm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v11 01/10] build: add optional librpmi dependency
Date: Thu, 17 Sep 2026 10:52:40 +0530
Message-ID: <20260917052250.1041262-2-subrahmanya.lingappa@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260917052250.1041262-1-subrahmanya.lingappa@oss.qualcomm.com>
References: <20260917052250.1041262-1-subrahmanya.lingappa@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDA2OCBTYWx0ZWRfX2zWifjFl2kYB
 oUdMmCKNgQGVYBH89iJ316H1duA2eEtfe7kcOmjTB0wEODy5mIGSgUDjm3+VteuOFh+DR4hLLdB
 wqE5EmAnrr4npJvCz0bZqpEcpNWzXXY=
X-Proofpoint-GUID: 3Ew1B95_GnPCpfpwG344wmxnlAmyFIDS
X-Authority-Analysis: v=2.4 cv=N4m8hG9B c=1 sm=1 tr=0 ts=6aab794a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=JF9118EUAAAA:8 a=8ots_n__tzfDkp_RMYgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-ORIG-GUID: 3Ew1B95_GnPCpfpwG344wmxnlAmyFIDS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDA2OCBTYWx0ZWRfXzLZByuH4aDgQ
 QPW6hr93yhDT513Bi4NflNNjc8Wil3Wsxa9Rjky2O4UWg0/dy5oZQE7lVwTsPTy8ST4ueDHJfLE
 2X+/hJWZ8ZD7WD9WAEM1hNsU+haCrn2TNiGnSLnO+y23zzjR35xiWU85gWxQ9wVtCWViwsDgII8
 EEojiaNqhk65EfVha1r38u4RqgMkexGRYhZmC+kmzvPZIzvn6vYxy0LFplS397FGVS9Tnyv1wGN
 8z1u/6zbXNjaJRt5k4XUjUtyBpbDAfpZgTBdXHkuYD1Q+Oc3wEUUY1I7R/kIMC4M4OivKeeW3lP
 dDmTldIogQ0zrAGkwWzU1SPG0dv6IQYN4nmrdkq6JDKNi2fIrjKn8EGYcgNi/cW8zSbloOcGarx
 i9bghDmGS6dOpx8F9uxmISWqA4jPLqJ7O9TAzbU0sillcj7tPhZObPYfK2wEOIfLn6J7D/o05NI
 oiFl9LlZRtp1in/dpIA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170068
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
Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Sunil V L <sunilvl@oss.qualcomm.com>
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
index 6dcfdceb50..1e1e19e655 100644
--- a/meson.build
+++ b/meson.build
@@ -2018,6 +2018,17 @@ if lzo.found() and not cc.links('''
   endif
 endif
 
+librpmi = not_found
+if not get_option('librpmi').auto() or have_system
+  librpmi = dependency('librpmi', required: get_option('librpmi'),
+                       method: 'pkg-config')
+  if librpmi.found() and not cc.has_header_symbol('librpmi.h',
+                                                  'rpmi_service_group_syssusp_create',
+                                                  dependencies: librpmi)
+    error('librpmi support requires the RPMI system suspend service group API')
+  endif
+endif
+
 numa = not_found
 if not get_option('numa').auto() or have_system or have_tools
   numa = cc.find_library('numa', has_headers: ['numa.h'],
@@ -2440,6 +2451,7 @@ config_host_data.set('CONFIG_LINUX', host_os == 'linux')
 config_host_data.set('CONFIG_POSIX', host_os != 'windows')
 config_host_data.set('CONFIG_WIN32', host_os == 'windows')
 config_host_data.set('CONFIG_LZO', lzo.found())
+config_host_data.set('CONFIG_LIBRPMI', librpmi.found())
 config_host_data.set('CONFIG_MPATH', mpathpersist.found())
 config_host_data.set('CONFIG_BLKIO', blkio.found())
 if blkio.found()
@@ -3272,6 +3284,7 @@ host_kconfig = \
   (multiprocess_allowed ? ['CONFIG_MULTIPROCESS_ALLOWED=y'] : []) + \
   (vfio_user_server_allowed ? ['CONFIG_VFIO_USER_SERVER_ALLOWED=y'] : []) + \
   (hv_balloon ? ['CONFIG_HV_BALLOON_POSSIBLE=y'] : []) + \
+  (librpmi.found() ? ['CONFIG_LIBRPMI=y'] : []) + \
   (have_rust ? ['CONFIG_HAVE_RUST=y'] : [])
 
 ignored = [ 'TARGET_XML_FILES', 'TARGET_ABI_DIR' ]
@@ -4988,6 +5001,7 @@ summary_info += {'TPM support':       have_tpm}
 summary_info += {'IGVM support':      igvm}
 summary_info += {'libssh support':    libssh}
 summary_info += {'lzo support':       lzo}
+summary_info += {'RPMI support':      librpmi}
 summary_info += {'snappy support':    snappy}
 summary_info += {'bzip2 support':     libbzip2}
 summary_info += {'lzfse support':     liblzfse}
diff --git a/meson_options.txt b/meson_options.txt
index a07cb47d35..a65af0e633 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -204,6 +204,8 @@ option('lzfse', type : 'feature', value : 'auto',
        description: 'lzfse support for DMG images')
 option('lzo', type : 'feature', value : 'auto',
        description: 'lzo compression support')
+option('librpmi', type : 'feature', value : 'auto',
+       description: 'RPMI support')
 option('pvg', type: 'feature', value: 'auto',
        description: 'macOS paravirtualized graphics support')
 option('rbd', type : 'feature', value : 'auto',
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index c003985047..12179f6024 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -140,6 +140,7 @@ meson_options_help() {
   printf "%s\n" '  libkeyutils     Linux keyutils support'
   printf "%s\n" '  libnfs          libnfs block device driver'
   printf "%s\n" '  libpmem         libpmem support'
+  printf "%s\n" '  librpmi         RPMI support'
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

