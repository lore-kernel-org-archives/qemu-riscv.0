Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6EE8C44520
	for <qemu-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 11:03:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wllm2-0002me-Kb; Mon, 20 Jul 2026 07:03:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wllm0-0002lW-KZ
 for qemu-riscv@nongnu.org; Mon, 20 Jul 2026 07:03:00 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wllly-0002rJ-M0
 for qemu-riscv@nongnu.org; Mon, 20 Jul 2026 07:03:00 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66KAvQwo1910235
 for <qemu-riscv@nongnu.org>; Mon, 20 Jul 2026 11:02:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 AUt+AMRzrovPbK+AnI8+0HQF5ZnC2kx6GdtubimLLD4=; b=Okiws0FqogYx7E2g
 0dQ9bxFG0UrrTVAXL5gRT1e0VjFZHwQrw6q01tV0mMADU9KMRCZjtqkWPtCJoub6
 pVymuv4MMKLnk96JlQ9W8jDu5mZzjCV2uDhZQEbx+8rGQsdPiqq9wHKu2zkXKwTZ
 fh9Q0AaWdVoyF3NHciaO/8HxhrjT1toddDGppuoxGsPw/dlxEfVg2Vehhgdo2kvK
 NjkyDaqhRS+xwRvOWK8KT5yYTrXggS7O2BOKvPrWpiu/F4JUaqJQ9y8k1koxWgXP
 eMZpUyZWYsHeo364uT9uhV6uDHLG+NTlrwuB6ZnFyVto2K29vzwJUUN0AnVsmGb0
 +4zbZg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhgs50exv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 20 Jul 2026 11:02:56 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2cc4c126cf0so28655655ad.1
 for <qemu-riscv@nongnu.org>; Mon, 20 Jul 2026 04:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784545374; x=1785150174; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=AUt+AMRzrovPbK+AnI8+0HQF5ZnC2kx6GdtubimLLD4=;
 b=bXjZAFf4CGQNDh3+PY11vFHmquAzZcW0fACRuP2rPqDnWaxEjjkDHq273ksMTKowfq
 MDzG+vL9B05H6CyBhqMY11OixZGwiPtk0sO7R9Rscow+ur7HXn5fX8EDHlHxt7wS36Hf
 R1Zz+1QAVcQX/qjuTTCPOB6MYxJXquOCOJJ0SKCT5LF0HwL4KkmccFJBQgAHr7+UPcIl
 7fMTFEG8MPU7s7r0ar7hHpbkr9H0xWmTcjoQVe+7mbpe/BuWAjHo+QbLACS+ApUQ6KYK
 xtDwUh5O/TSkKhlYZgA6e7VeXNlH1i9ob3RksPuOZiPMeA8+liXr1dwpSTLCyXv2Dc8t
 jvyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784545374; x=1785150174;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=AUt+AMRzrovPbK+AnI8+0HQF5ZnC2kx6GdtubimLLD4=;
 b=eOM/brh4jw/2N3LGvxNcBeB0IOr6CdbHwWtWQjf9fOXUQAfehkXLHmnVIl3OxlV+NP
 pd8hsI1eaWvnvJhZw7qnDBkZJO8xBrdju8WX6Da/LpXTaCfiNU1T7+STibrmS0/Y5k4k
 4zfuYCyfld92PIkLhVQxdxM4TfOrrX3LjuxRZkyID3Nkxi721HRcDt2EFbpMOVq80Dqb
 kxorfFW3rev+jT7khj9bruXFCTSKi4UVKMBX6X2uZUq88aMvrtxQsOou98385Gec2TUh
 OoAGcR+QUFHnqTw4qeL0KVmNUIbh8Za3huLX0HtxpQM5ZgeoUrSFsGdsNqTbDp9aKYz1
 vHPw==
X-Gm-Message-State: AOJu0YySPuZhladb88+BPkfhuTMWtOPJzdQaZWVpPuv39wkYlWAOqflC
 5k6lxHziPofFwQcF02V8D5atMj6R2aE2Y/Xp2i/aLmRV5JeqDkhWvmHhMPSLTJzxstMaUna6n/d
 NH427ehsWcmKhJDa2Jak7n/kLIQp8E+xTyxrY5AuPHSLuuqSrn5GG0Zyop+s7uqRKHQ==
X-Gm-Gg: AR+sD11+TfVb0OQ/aiHz5/IKOhP/cPYYAbZrvK3hQhZZaYzTsAvAeeWNIK2ybwU2zp9
 mlqpOr67tSf1umkiIDbzDW52fkNXapo4gw4La1nJozWGS7Z/aNuPg1Ts9butgUCjFYZdJhFESzR
 FR8ovBZ/LpaaSrpliZM38M5xDNUPxhqxdmTfek0tG5Yr34RXkENTxAJT+Sei8Wn6iLnuXofUJim
 bE35zRybdOnWjCxvAVI7lw7WeOjm+h+b0LIM784XKLctSQ3cMwsfJW31yg0ulGfqjWh53VZG6EH
 zh63dMaRkb2Tq/pIrzWdAiNESJK4BMf2gTL6CK8OQ+P6mAIOToVy1B/JKYDUXhXx0P+DN+d12rR
 ITEzMSGoiZYW+X7oB6p4J4mVdSPmvgtjfDrmIvtF8c68layNl9NDi5efS/jcu1PYbqDrQ1vSz2J
 oBKwQ67TJ3X1bQGGR/qRLh73lgsynwxZg=
X-Received: by 2002:a17:902:f54c:b0:2c9:d298:6c0a with SMTP id
 d9443c01a7336-2cf7bed9b36mr181955ad.2.1784545374533; 
 Mon, 20 Jul 2026 04:02:54 -0700 (PDT)
X-Received: by 2002:a17:902:f54c:b0:2c9:d298:6c0a with SMTP id
 d9443c01a7336-2cf7bed9b36mr181645ad.2.1784545374087; 
 Mon, 20 Jul 2026 04:02:54 -0700 (PDT)
Received: from hu-slingapp-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3142a20b1f3sm34698566eec.26.2026.07.20.04.02.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2026 04:02:53 -0700 (PDT)
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
Subject: [PATCH v4 01/10] build: add optional librpmi dependency
Date: Mon, 20 Jul 2026 16:32:24 +0530
Message-ID: <3cb9160b3aa2f38397d14116abf59bd049a49eba.1784541996.git.subrahmanya.lingappa@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1784541996.git.subrahmanya.lingappa@oss.qualcomm.com>
References: <cover.1784541996.git.subrahmanya.lingappa@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDEyMyBTYWx0ZWRfXzNgBTyw/2mGv
 fuOPIzm9QSCmrv/95vcg380MR0ixebtWsjLxNLOMTdi8loDdTOUNI+oZ6h8NBxisPYPVGrp0bar
 t49CbHFKyOoebjxmgnJ20+jAYE+Mz8k=
X-Proofpoint-GUID: On1Dd-nQcq_HO1wgKnW7FGejYJkLjKK_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDEyMyBTYWx0ZWRfXyqyUY6RMWIUk
 MkCYuPkU8mah3yumcUhIofgE/+uKrUD5QmE9gnH3wWAzcEBvmiQzuxyZLRwybsyXMy1XqI+Vqbs
 Cr9VXX2vFfAma7krhh3PV+K3BIJZI1pRFsjV79AvwNtqgfNQauo8NBcKSrc+JENiCeCCCHjXnP9
 2y3XSL9gsLrFzC+2EvOgTWqys7LuCP+mos8W+4PZ903XP/6U7xlVUuoGIpbF7pMLkaqK4KctM1i
 MER8sXAyiG8Dov1JHkwK1OX6vc9IfboW9H4jkFrQbVixrQeQj1tgLM3w0v214RSC7iTHmpKaZAM
 HKRRtIKC06jr0zWgX/W/NGYjdeZLWIfl6cSygpH7zmw6pT4Anods5vZU9fE4SPYXT1X5eqahDDX
 HqU0I+1R64g286X/dts7wMdGnMeFE+Ogd4wMXwB+r+89Wy1yXWD6eiPriE7vQBAG+QRMGYt4Km5
 18cY8AHymN+9SpLq30g==
X-Authority-Analysis: v=2.4 cv=CpiPtH4D c=1 sm=1 tr=0 ts=6a5e0060 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=_6tmRKQHnRYSWcN6IbQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: On1Dd-nQcq_HO1wgKnW7FGejYJkLjKK_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_02,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200123
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=subrahmanya.lingappa@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
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


