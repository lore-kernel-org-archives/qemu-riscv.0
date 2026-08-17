Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FA8BC5DF7A
	for <qemu-riscv@archiver.kernel.org>; Mon, 17 Aug 2026 10:56:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wvv0d-0003IB-Av; Mon, 17 Aug 2026 06:56:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wvv0E-00038i-E0
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2026 06:55:41 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wvv0C-00066q-IS
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2026 06:55:38 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67H9dnV11542891
 for <qemu-riscv@nongnu.org>; Mon, 17 Aug 2026 10:55:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 a/5p61xQaYVPkAjYS8CsqPTMi8Z+ZbCfOetNwPWaI3c=; b=B9F/OhaFBfGe8gvJ
 ZsC4KCYKv6dcQVWxQkUrAz1rGgx4hZQ700TWbhlup+QaEHuvZZDYYPPlCL2ur996
 RGl/sztmu51qJHzI9dP7wBa4s9ooyRwcMLVx0GoalJowwcrp7kBbljlE+meHqGOR
 XJZV3Z5zrG6vmRuaAmiuVGsnFDgEDxozxNIT71Ug/TaBKTtl/P3rma1gYHq827Rx
 Rp6Qbe1qw9umRTrZlHxvNjGOyIj8LJlU5VNlCvOEhhmBd/Hs6otI/7039MJ36pKy
 VOBhzqLzm99+063nFaq9U2EVMqG8yaQhTQdtxX2I8GZsgLWaZax+eSlgHcmbnnED
 iJLfIw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3xw8gh4f-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 17 Aug 2026 10:55:35 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2cfd13d6d50so7031585ad.1
 for <qemu-riscv@nongnu.org>; Mon, 17 Aug 2026 03:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786964135; x=1787568935; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=a/5p61xQaYVPkAjYS8CsqPTMi8Z+ZbCfOetNwPWaI3c=;
 b=NAdEptMtQ7CysKREvjCN+zAp53MfTnBsoogeqZmh85mLlVOqwOPMoYievWhvZcV7yD
 vhfQS2AFevT2D+vC7osc5gU7M3Ms8RN7Khaz9dtRESfn8M04En7GOOb9yeeq8n+ac0zS
 Lm9TzDiw11XLli7aFpjM6juWGe6IxV4uwnq3yNXdMhvxIE+mtGGZ+esXIONgYc9SYHPv
 wauce+YhjJ4Cm+nt7emj7JJnQIDmQhBdd+yRQTaztCRxT0qdB457blZfWLcrdGmct1gk
 JwuzwJOtEvbWn3gFDLqtac35ohQord8LmHNu3OqbbC+ZaklqUjbUQIpbRXFHkleqstOY
 svHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786964135; x=1787568935;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=a/5p61xQaYVPkAjYS8CsqPTMi8Z+ZbCfOetNwPWaI3c=;
 b=dqhqlDSehE9HEs4ZoBME44mSnnW0qUlPRxdfmK3jUuuEio23XSodXpxwZK4/7hQaBQ
 fvnQzge8nJKriz9iTINxYH1R0khavkM0Mnu210RI+60AmlyX3jSdtopJvYQNz3AYtjIH
 RkD3G4XrX29fYS0d1M0/mYJW2D5weVFpNbs2CGJTICLMj1NHdu0zfEMinydsvk6V3m44
 9vHQwG272Z+LmY1KSYLihjBjXiIW922oO0mHcPlYqmOS5O8DQW91UcPn8MXymWxYCBHP
 RUxEd6D/NBeED1iIvjorpAEhZSjpbS3nLNve4ILYdpAWBarviIIKr7h9CuPVp8CmKfKp
 dCmw==
X-Gm-Message-State: AOJu0YzFForjaSUBLNNiLRvMIPG6Sv7gvVdWfWBc3uR3bWiXmdziHiol
 aEL8Mw3D0ebOSOmzpGkxzl73rDmwh2Z9pW65j0t7qB3dKADMA5ITb7uIHHBU4WbUeQJ2X/IBV8W
 n/9QjLiMVY4ysr9JUMdHwuqZ/8uPKV04c7WV8rn06mdfFvWB7PKSVgH5PyQ==
X-Gm-Gg: AR+sD12tGX0PQRsWm4LNUqSzMWCLlfNdaEdnNUZ8CZZTOXisBSlQy72jThIxW9l6J4C
 06oWVRP8zDGP/e3RS6rivIDoq3yX4cJPCsWckxeya4a1ryQYAZDIOgP5orIeFZB3O+vXziuupKb
 ySgI4BTHLGDHn1/5HN0kq5hI5z1/QvdY85RQi6l93IXyzwbX7O6SCoxf3lKl637Yg2QVc9Hnw0z
 PfqIBvfL1lRksFfXatoYbswNJAPchl92syS654jCYijFs2pqZV3DlYyPwVYxwagA0Vq7ou8ifZA
 anlwt0zZPMxLQDMy3/Bjrod0VWC2e+TadErVTgIrMRWsE84CKJRozWAXbWjHd/cV/Tjgt5vHeqy
 t6P5GY5ssvxF6ra3NnzSF5LuXlhZnSMt6xgEF0eLcoybLCFovYcS1j6NhOyOXRMIakwmyItNqCW
 JnBUuPh1lDCUW5vCUfVE95TtS0ONj7NLU=
X-Received: by 2002:a17:902:c944:b0:2c9:e846:a582 with SMTP id
 d9443c01a7336-2d3b04fdcb2mr192995275ad.0.1786964134566; 
 Mon, 17 Aug 2026 03:55:34 -0700 (PDT)
X-Received: by 2002:a17:902:c944:b0:2c9:e846:a582 with SMTP id
 d9443c01a7336-2d3b04fdcb2mr192994865ad.0.1786964134165; 
 Mon, 17 Aug 2026 03:55:34 -0700 (PDT)
Received: from hu-slingapp-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3267c389363sm5431136eec.23.2026.08.17.03.55.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2026 03:55:33 -0700 (PDT)
From: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
 Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v9 01/10] build: add optional librpmi dependency
Date: Mon, 17 Aug 2026 16:24:55 +0530
Message-ID: <20260817105505.2607506-2-subrahmanya.lingappa@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260817105505.2607506-1-subrahmanya.lingappa@oss.qualcomm.com>
References: <20260817105505.2607506-1-subrahmanya.lingappa@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: OBdA-LrpTKiSfHFyY4H1ex1HCKKrsbaG
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA4MSBTYWx0ZWRfX2Txi/fRn7TT7
 I3ELPnFcgxDSRTxMfjQ+6A4BaxVHPuqi+GBJ3kptYPZepxa/fkP+vKENwdBE2f0EyCBZb3xymrJ
 DRgfgD/+Z/1B9Ys9pdwbxYpaEtm/fcE=
X-Authority-Analysis: v=2.4 cv=SuCgLvO0 c=1 sm=1 tr=0 ts=6a82e8a7 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=2ZSorBgdJM4krTjbFk8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: OBdA-LrpTKiSfHFyY4H1ex1HCKKrsbaG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA4MSBTYWx0ZWRfXwQ4Qn5FhPMOb
 AH68dZymcDHTtSJlX1jcxFcii47Hj8nZTDgNbEnMjecI8InMA1aPX3jTe04EHga5FNnzHF19sX5
 zJEc7dl5JeAWzPnPnaw81oGSooOy20xXOq0GEBp3RuNrmu9R1TBIQdmE9kW4qbor4/ScEE6UIms
 IFBkAPy2d1fFk2L1ijvrVLZ+pKV/xZUYic2kCBj/ixmLD6GxWZb5TeBsdbl8UdUEocl7vReNZRW
 vTEa2AIwUphPPAMQsRG3svGlnhjIvN10yToMv0Lrt6c45B6QuRJt5Hspqw2iTyZ5IjRj6Q5fUg/
 9IxQ2vJWb3A4ysHO2CZDCxlSZ0REbFmNUfuUhTqSjL1Im96oqp8jFRnHk09qwsV61fl40U5Ychy
 MUxVLWY7nLtBkVqMPpqhDjjictoZzJArx2taPZfy5iNLpjyXghxhjkvPqAPU9anmKpV2DSjKvEa
 kO20Ba1Hq7FXjbK/9yQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170081
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
index 49a5baf5b5..99219dffad 100644
--- a/meson.build
+++ b/meson.build
@@ -2017,6 +2017,17 @@ if lzo.found() and not cc.links('''
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
@@ -2439,6 +2450,7 @@ config_host_data.set('CONFIG_LINUX', host_os == 'linux')
 config_host_data.set('CONFIG_POSIX', host_os != 'windows')
 config_host_data.set('CONFIG_WIN32', host_os == 'windows')
 config_host_data.set('CONFIG_LZO', lzo.found())
+config_host_data.set('CONFIG_LIBRPMI', librpmi.found())
 config_host_data.set('CONFIG_MPATH', mpathpersist.found())
 config_host_data.set('CONFIG_BLKIO', blkio.found())
 if blkio.found()
@@ -3271,6 +3283,7 @@ host_kconfig = \
   (multiprocess_allowed ? ['CONFIG_MULTIPROCESS_ALLOWED=y'] : []) + \
   (vfio_user_server_allowed ? ['CONFIG_VFIO_USER_SERVER_ALLOWED=y'] : []) + \
   (hv_balloon ? ['CONFIG_HV_BALLOON_POSSIBLE=y'] : []) + \
+  (librpmi.found() ? ['CONFIG_LIBRPMI=y'] : []) + \
   (have_rust ? ['CONFIG_HAVE_RUST=y'] : [])
 
 ignored = [ 'TARGET_XML_FILES', 'TARGET_ABI_DIR' ]
@@ -4987,6 +5000,7 @@ summary_info += {'TPM support':       have_tpm}
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

base-commit: 539bc315538afe036a4b99088659aa82e3b489f2
-- 
2.43.0


