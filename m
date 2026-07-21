Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9815DC44529
	for <qemu-riscv@archiver.kernel.org>; Tue, 21 Jul 2026 06:37:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wm464-00027I-I5; Tue, 21 Jul 2026 02:36:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wm463-00025N-1u
 for qemu-riscv@nongnu.org; Tue, 21 Jul 2026 02:36:55 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wm461-0004Qp-6g
 for qemu-riscv@nongnu.org; Tue, 21 Jul 2026 02:36:54 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66L4T204528065
 for <qemu-riscv@nongnu.org>; Tue, 21 Jul 2026 06:36:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 AUt+AMRzrovPbK+AnI8+0HQF5ZnC2kx6GdtubimLLD4=; b=ebQ0IKgKjb/vX06j
 USQpxT4ro8HFj5G/OFqGTto4MtO/oxcJwckdkapCwtpOZDGNOkZvH2k7vZY9cI75
 zsdC6Hy7c4oztuaypaaN4Cm+LY2YJgh8Atdllb9bQfgig31MbdMrryDpnwlPR1ow
 4RTK6JTA7ucwbpAEvHOnvwSsEiOBYDSKWR5ygoQBkAqF6Nu1MgX+A2IhzYt5TNEu
 2RtmGRUUX4erAz3dIl4IoU/cHpBst37lhpe4k8LdKmqFJ3YlG1nYmrNi8iSy7/Pc
 sfF2pyezkS/8thD4/0zJAdLA2WQpwhcTmi2OSzdzEKga+KLESHYOTbin+8X0OSgx
 b1ECCg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1se0ehs-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 21 Jul 2026 06:36:51 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2ced1ed870fso24141255ad.2
 for <qemu-riscv@nongnu.org>; Mon, 20 Jul 2026 23:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784615811; x=1785220611; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=AUt+AMRzrovPbK+AnI8+0HQF5ZnC2kx6GdtubimLLD4=;
 b=jwuautr3mSD6wDfXMR7BJJWLbxn0tBaKC/A+0kOrjae8EE06xD4ySnGdQ4C7ZeAyIF
 sgudFESV9wF8opQACZTAkC0fZd6i4lDkJkYRYRKBSvK19zcWf7SvcDX+EzDr2CzXmujW
 PbL5x3qIa64a25pZsHcjU1fY+nA9p51MiRvzVW1B/uS1kiU+8jRE0LcpezoGBBeX8qXe
 A62qGf6GeZCz/QMjSLGketqLjsArpyEnkPvOldDS2rFoRe2scz/9VZDFNlnmaU83eHix
 I5+j3rbHQn6Viz3RtjB1xS8p+jW4fLSxByxj+fVpDZNIzEw03DDXa6v20XDNts315w5k
 U+mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784615811; x=1785220611;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=AUt+AMRzrovPbK+AnI8+0HQF5ZnC2kx6GdtubimLLD4=;
 b=ZSs3aamVJhr6L8jUlyPisVEMX3oJ/7wNZtVb6aF9Lst+CFsAg16GaR/D3warLcqWR3
 wBtf9i95KVvDSEPTDo+77l3kyLgCWtFzRw32639v99GLKxHYw7YKamDXzaacJaHt1m47
 VYVEbYYzXpWrVWWyljiyBwFBJjbnowrFwJtPoO3OyWRRC5BqSdhdEbuKrHe6hgK3O4Nc
 +UNx4xTgFOEE2GsO5I45C0nFPPXNX3VHjdkAH33/BIJfggZi1+vs8y8QLBQ4PZ5EKxj/
 kmZBEn2VWoGyKt9qlnuvy4mVPS869l+zrbio6uovwXckLDm1295n71xU8b+vMqLqbuCQ
 w9Ew==
X-Gm-Message-State: AOJu0Yx2KzHIGyvbnKbRhM0tOdI9kBm84ST+Dq86tzwCNl/5G3n17qNt
 vF4uTYTA5Yt4BJ8KV0dcHBqc0V3I6Gyo8i2HRTNEW7E58MkujMA6NoAhYw2qkpXzseYCMXTwpym
 nR7n2EZr1zcvhz4WWgDEORz0VC5OtOURmK/945wqmAVNKUy1nc5BpwslF1uAD9qp+iw==
X-Gm-Gg: AR+sD10WveF7r9t9dqbKmva5rOFe7sC03eyPn+FuHQMEJ/NKNthw/yAtpZbeesNpjw+
 EItCu6KI7Iq/Rp8ZBr4kGsp36vpaDOgXtT94AxSzYX1HY4t0ruz+Fj0ZviIUZAukb6oFrmAiBGW
 Sc6BBMOKLZ8VDXyfAxJC8/ZCVIG3XGKB/bV9JXFwDJzZUPwWABv9t+ROGV0lODPLDkjFjA/tKRM
 wXM29atD8/XBW54slCeyqSnsEnIP2ZyjKeWIDXl6gEh8ynTKIXO8Vb31DEj/BUS49NceUHk4hba
 c0OmCKQWU07J7jLy+aR1u/ROS/89v8WE2s03T7OHGTre1Zxcuc8BTDvZy59d5gf/JMqNgzoOThR
 dAFwdiny+13KD7baiAnWnAzquBtPyAKodeUhRFtWkY+tiUAuSvxSGMGpLmNU6/oNIxPkUhZN8ZT
 z9NE3SsyEjzzlvdjN/uVMs24yCA1J7jZE=
X-Received: by 2002:a17:903:38cd:b0:2ca:d9ec:3217 with SMTP id
 d9443c01a7336-2cf80578d59mr15218675ad.7.1784615810998; 
 Mon, 20 Jul 2026 23:36:50 -0700 (PDT)
X-Received: by 2002:a17:903:38cd:b0:2ca:d9ec:3217 with SMTP id
 d9443c01a7336-2cf80578d59mr15218425ad.7.1784615810519; 
 Mon, 20 Jul 2026 23:36:50 -0700 (PDT)
Received: from hu-slingapp-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3142a1bb8a4sm47161380eec.14.2026.07.20.23.36.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2026 23:36:50 -0700 (PDT)
From: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
To: qemu-riscv@nongnu.org
Cc: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org (open list:All patches CC here)
Subject: [PATCH v5 01/10] build: add optional librpmi dependency
Date: Tue, 21 Jul 2026 12:06:27 +0530
Message-ID: <3cb9160b3aa2f38397d14116abf59bd049a49eba.1784547370.git.subrahmanya.lingappa@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1784547370.git.subrahmanya.lingappa@oss.qualcomm.com>
References: <cover.1784547370.git.subrahmanya.lingappa@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: no2-DpzPb2f6JYDlY92nNhZgeVdMDF50
X-Authority-Analysis: v=2.4 cv=TIZ1jVla c=1 sm=1 tr=0 ts=6a5f1383 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=_6tmRKQHnRYSWcN6IbQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA2NyBTYWx0ZWRfX86p2TpdeEt4A
 Vut8sj5/QFb1aq46j5FGH3P1Y5mi8IJiwIzenqtFL0dsQICn+yECUv2MYHPh0gURkT3Rq+rS6DL
 0C932Pf1w1zg4ZTJZvkQOVQZD2gyYIk=
X-Proofpoint-GUID: no2-DpzPb2f6JYDlY92nNhZgeVdMDF50
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA2NyBTYWx0ZWRfXyYvLjyuf+gBm
 feSLrtwHLz8vrk7QBYpf4/6Z/TY15l66v+y0ZhQhjc2AqTFPyQxaMI++lDQa+VMaRpRl8DL0FXP
 wrX7ILm1LrZF8+1uyE5iM+CkWwFCaJXndAZPHhOGo3GaEEGCfNTsIdeI/ObRiZSiUXXqu3oKn9J
 r3/qdBmIrS+t2nKv61ztzE1wLu6jJPaZD7i+2vJrQn3MjGKdjsedjcDF2VAI7PTuN1qeKoBqj/b
 907AbT8zVthZVB6Okl+Bhr0xVq+ePFFQ2KBTgXclQ8LjXZdm3kJKRvXJYGRqCis7FO7g8Q8ZBh6
 zx1slojOcOAw4TExUu8D/gUueQgx9J4ylgAVlN4Ju078kv2OKJCBqQiSQ0mdnil+dn/fRH9uegj
 R405+VpaSmNKyQEfBAbvlEsB9x3MazutDuzN3KU+OqzpwFgAxZ3N19UW6hdqsg+YNGtd6HVlHVj
 p0uCS8uJBP2D7Ex2aiQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210067
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=subrahmanya.lingappa@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
index 19e123423b..e997c6cef9 100644
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
-- 
2.43.0


