Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97ED9C43458
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 12:23:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wiAFK-00085V-PL; Fri, 10 Jul 2026 08:22:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wi6mk-0000Xf-IQ
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 04:40:38 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wi6mg-0001r6-Cc
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 04:40:38 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66A7dW0Y4194200
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 08:40:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=VaD0AacToDf
 loRwmZ9rCEJAESLcJZa4/t4f8anAA3z0=; b=nCZQmjTzNnxPlDFjQQPNpJdxteC
 WGu5xykoSG7D4Te5LUJ1PcvE7bKhHCUoVhjdSaZEV6Ts41JJS6xPgYHAdWeo94ag
 NghVrmJd2LCpFYVrJpvdpd50fDYhiNFe9A5S2R3CafNrsqiHA/in0hoMSrUJLeDh
 juPbwaaHRUt++qVSdSANzyOYK1kxlYsb9aSdTIuXx8N4+byEAlqfm05AsbIr7iZa
 YMV75A5MYLjYIbdvSpVOr60tLwBhwX48kn6XNc2T0I4kvk+xPsWGUPNhMcq4pbUM
 gqbVkpIJAGFWjkpI76//+SGg1NxtS5mD/vXSyOwJTWrVw2Dzop+sAvLAWCA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faf24ud9h-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 08:40:16 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2cc2c6e1d1dso2163475ad.3
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 01:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783672815; x=1784277615; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=VaD0AacToDfloRwmZ9rCEJAESLcJZa4/t4f8anAA3z0=;
 b=QY9vPO1S1MLUsOiJcIYHX7KpiaVEzLX22FEn+5dAwH8/w7//iiCXD7akNd7ZulOBZD
 eTY8n/HQeOK1sxC1DtHpLK2f0vv0aG6/pnA4UarU+hGgp+wxOazhxbC7UgA+YWXL/P6Q
 7oC9XYiAps5q/Bve38QNrmiYeF1lfVGIzdvw2YBCpcFUkjbCfpgg8eNznCEH0C4BvLCE
 ZtYzFkPexnfIrm9QQsZ9vuPEOhgEe3zCCKI3/KzIigIG9eCKiOXm9j/9UPTqkMp2rNDZ
 nXkzZzMMlZmSKJu6TA/xHdhKl7+mqFh3nvn3lVcuYm2KY+h5pI2kicJFjzwX3RB0UWhH
 tpgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783672815; x=1784277615;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=VaD0AacToDfloRwmZ9rCEJAESLcJZa4/t4f8anAA3z0=;
 b=q+QZH9qWLJTLkePQiCIbEaCk5Ni4Y1Eneau+zcDqU275r9fbw/55fJezGFsmp+Kq5M
 dBp96wjj4dVCdKsZRQgP3qTaH43B4000TJUhuuj2EZKH7UAbh+oTEu9Gy7ymQv4enZgQ
 kaPVWllPaly1tUGzVr3CfC0g8URaV9GSkFsB2g4YXOo4qRQIs5WdhZfI4HBv4H8vJhz4
 BnhMtMG4rhONPejqUe/nJ4FRl98JAdiOHDDpeoA7AqYpZn1/Y429V4ozQ8AlwCz7yjGD
 +MvzKrlZKy5IpF/SPcjiXWH6n7mgl2DZX5LK/GjQJaTOCKoHbvtOI2mhMberOsNfR2O3
 qEPQ==
X-Gm-Message-State: AOJu0YxfU/Ng5n/L8F1Na0cw7AJsXDF596FGaDNE8HItAQHVnIx/px24
 WgLnUyVkVTfir66IDTntwctl2dw9jmqcuvQsh4iGRgD5lIu03tDl2C/WOX3iwnLS95A5YsQry7E
 rwgdyrUX1PL0yucDMj6WdzCCkjf9t6VvYGk4vzWkWySX23dEUSlWLZwvnbF21dDYstg==
X-Gm-Gg: AfdE7ckSdXF0KaS4tEquNMqs4QhB+KnMI5RKhA/RzuCZdVGYLvff9n+qGMFPmSbNOop
 +HMPwcGN83muDl8Qm3vg4cAjNW3Hpl4WE8nM7aO4b3W2BvcpdfBIYnSr/P7zRMMIcTG3Hh7WmHu
 23ViPX2EFTSnpvs5SVccxPZuGjvL7x98WjEeKwTDgvnf0WGlay8KObzUGKKovpS6V7X1cLVtj6M
 NtO0Rr/akFhbHbBWUbtnr8jvQ2FzbmGQXwkUEF8GE4wTNL45TcLbpNBoIBM1gEoVcbdAH741h3M
 75KwTNzVWaeNMAIsYmGTCfvYDWkMPdUe7AOlVKtrCpjZHf5PgtBWLwE8W101M+Rxz9B55RyKs0s
 plgDeg0TEkDWMTGC+NA4ozrI5hvBP+m92qh0XIhN41EEHfs6BvlcyyKNAsEUKnh77KoNh4kyr0x
 mtcKh8xLtmcqFi/7//jXn/79nPvcBMbdH0isnjwAbEdw==
X-Received: by 2002:a17:90b:1d50:b0:37f:eac0:18f6 with SMTP id
 98e67ed59e1d1-38942b7d8c3mr7837426a91.8.1783672815060; 
 Fri, 10 Jul 2026 01:40:15 -0700 (PDT)
X-Received: by 2002:a17:90b:1d50:b0:37f:eac0:18f6 with SMTP id
 98e67ed59e1d1-38942b7d8c3mr7837398a91.8.1783672814543; 
 Fri, 10 Jul 2026 01:40:14 -0700 (PDT)
Received: from hu-slingapp-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3118389d9bcsm29164925eec.20.2026.07.10.01.40.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 01:40:14 -0700 (PDT)
From: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
To: qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org, daniel.barboza@oss.qualcomm.com,
 Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
Subject: [PATCH v2 01/10] build: add optional librpmi dependency
Date: Fri, 10 Jul 2026 14:09:43 +0530
Message-ID: <1f2732b7220280efc1b5f69ae022b318dbbc3827.1783660209.git.subrahmanya.lingappa@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1783660209.git.subrahmanya.lingappa@oss.qualcomm.com>
References: <cover.1783660209.git.subrahmanya.lingappa@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: xFuQQSJJkITy1T9Hlx0DiSQugwpKu1e1
X-Proofpoint-ORIG-GUID: xFuQQSJJkITy1T9Hlx0DiSQugwpKu1e1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA4MyBTYWx0ZWRfX2L53N0blRsvO
 kCrZlnDun16KsrR2cjDclszsmsU9SYZ1pRq7xImevSaUlTdL5MgPpl7SdqgrynTUq1mh5Dr9vOt
 sJC0PgQNFThkvxKj83nzCSzBEyFocvg=
X-Authority-Analysis: v=2.4 cv=daKwG3Xe c=1 sm=1 tr=0 ts=6a50aff0 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=_6tmRKQHnRYSWcN6IbQA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA4MyBTYWx0ZWRfX/OYlZnxQvZre
 u7mGrYPVZtyWKhVzSvh/1S8C3rVt7zbNFe59ZT2OYkThlbjIF+UyFSSkgpIm3Z1VYGmSXYO84Sp
 lEKUF8NtZ8WormIr37cquaLKXB2rDCUzSFe7joSEJW5bT1PwNBmYB/+lk52zhbuO+BUyPFqG0z2
 qSnH3/XiIBeWg6Jtv+DZqxkOFNLEjKNs31brP4xWrMP7KJZtMaZU5Au7Ilu1YbqWq/gSnyrygD8
 7Ou9wc2S7tvekTb1aKVf60+Dls+baD9Gby/xszIaaUt2yE36CVlkXwxt0p4T18jcWwuBm4zrJL5
 Dl34QgbJCB5ua8JhDj5OTnX7KqrgTaAOV4jGHGF0AjdqLGHwG8Kyun/im/8kgnZ/FQVMR7EN3L9
 jXlfmQ4Cv9Z8HmxCZjSVo88S9WGXpJ19wRlhdBSKXNHdUuP0LhBrih57GFFsX2TvDScVWlQixZE
 eSLORtW4ZFUF9GYMy5A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1011 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100083
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
X-Mailman-Approved-At: Fri, 10 Jul 2026 08:21:46 -0400
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

From: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>

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


