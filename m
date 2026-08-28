Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CFFFC61DCB
	for <qemu-riscv@archiver.kernel.org>; Fri, 28 Aug 2026 11:29:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wzulk-0001oB-Aq; Fri, 28 Aug 2026 07:29:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wzulh-0001mw-P2
 for qemu-riscv@nongnu.org; Fri, 28 Aug 2026 07:29:09 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wzulf-0007cg-MC
 for qemu-riscv@nongnu.org; Fri, 28 Aug 2026 07:29:09 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67SA7RDs2061328
 for <qemu-riscv@nongnu.org>; Fri, 28 Aug 2026 11:29:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 p6z38RdTDcY3teR9UacJfqP7DIhYR9PcrjV7dGlrt3A=; b=mEpdHTCWpRWcJY9k
 5uFoOHj1xyLEvwtek5BD6zJIzgkn4oHpi6knnH9ts5Hh30VyyJbzqlUvwiG16DZg
 LFGJrwJojzO+I33a6Z2IMrARSxAmK6zwyRSMqfMN06a8XRbF7d1WpMQCPAMaqRco
 GM00um+F3OSmlZ8QXt9qmW77frAUaZNoIovMZMjka8qgTXqPh1SAnOkozxQ7gTjM
 7BAq78CSm28Y0vHpNhaD4Dn3xn6CUk0AooVRIrUYguQzKjXIjFzxZIuKGkejHXvI
 /SYrR2iuLZxQl/WgfVmSIh4ClB8TesbIQxvOqtX/lFQ2X0+CxfHsH8+6Itg1AE/7
 6cT8Uw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb3mu9fwb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 28 Aug 2026 11:29:06 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2d58262ffbfso1907775ad.0
 for <qemu-riscv@nongnu.org>; Fri, 28 Aug 2026 04:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787916545; x=1788521345; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=p6z38RdTDcY3teR9UacJfqP7DIhYR9PcrjV7dGlrt3A=;
 b=N7pta3iF2BU244ZTvkwvpxBN5p5vIdj4xrrsHZZYp83TfYApKVu/FN2Ae1ODLMAL7X
 HDy7MDLM2SpBW1vm+vyg+UsvnQ6I4lS8iS3KvRrvka89TGYuTmSEBvcNMPcU8+UKlRkA
 PrOFKmddlVxqx0HPC4CCNZmiqe/s8eYK/GQ4KKsPIOPINnd43ga42jttTnErnnXB7282
 0MQDnVjmYJVvSnsHqaN4aS1BUuSJZXu0n3R3TolTonnOfQjWaYwVUTgwVDBk9SE+mS9U
 A1+L/fUWlxitSIH+t8O45ERhMPNLIwQJWBXKHBG8VEhMD2sZSIxAPvMKCaOsmrjpeNjp
 7Wvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787916545; x=1788521345;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=p6z38RdTDcY3teR9UacJfqP7DIhYR9PcrjV7dGlrt3A=;
 b=YOIj2g8S73fllIp2eVmJDcV2GcEvXHxOR+/86y1ZlMTr7QvlqaV17S2qbtFC/FIJ2p
 RMvm/cN8zDcB2jmd269T/SY4SIdScu2fR3uxfZhdKoWd6ArMgMRnqVC3s33emTdO8hKC
 1uP7TKBpX5f+shsn/sOMnP2JCDm8Tjrbyj8JqSmNPxn/0FzXog3SVTxOoAhygw3LaFs/
 gMZ7axw2j6JPS3JNUk/o3MqF6BFIHUuHjY6qm8sb7vYWhDzTGwvq0ergbQO3ImSApGb9
 ZiFjaj7u/5QASrYxlwQGRmtHRp0VP4PZAS/DkT247zJ/UypXhgyaa503A+R1bAS6I0bn
 4Ogg==
X-Gm-Message-State: AFuF++lpykK42PDf4BMMaIwgoGfMm0HdtsI7QEp1NjI3udoYjFbYZL2s
 +382sn9gzvamftKjGKM4O3VYhz6jwHi+QZZI7R7xwYrcJNWyjjltScNfJAD7XgIrDH0EyvJkMzI
 eDkULwFeV3oITFUVEDlz3cYvlCQots77PMTUt2cjtRFtrqFZQN9JoYztlOw==
X-Gm-Gg: AR+sD11GupknWCzOUGEU74H3nH0+Hi08Jf1FmmKpnQm1V1MS6Mj5dcmqcKBuF0gvlWZ
 8UH2ja584ky2fTaFwhzSYDArvKwZYnTLZGllwxR8iqqxDsh7ucagUek+ESO6/c4TGwc0P90G3up
 52zn0ygyU853H4C81ViKZMLqiJKEo8C6/r4qkDV9uNP45lGuPomKDOOl8EIjK9NcIq+mUG2EFCJ
 85qHfPVXi+zSVd4esXJovIhcBdYRcO8U5dNlbhEX1ura5F0tKes4N/x8IgE5H8l0LQbaflPnLlo
 rtxlo0C59g5tnqBrO1QzJ6mi3G0FJM5bt+38AvpkrzBILBwwVt+d4JdOMkNan0ZZ08qk1ooPp1y
 0B/udGzm8OlW7u+56FVxpQD2Mw65uCsLuOaqmv4aNqhEPNCpCX/Lm+n3/cC57HQyN3IHOh7HZwa
 +Z+bzbqQ1ejt5f5dHzlzz6cpOrxe3pzY8=
X-Received: by 2002:a17:90b:380b:b0:396:54a9:8d87 with SMTP id
 98e67ed59e1d1-396d0d81bcfmr5950126a91.1.1787916542930; 
 Fri, 28 Aug 2026 04:29:02 -0700 (PDT)
X-Received: by 2002:a17:90b:380b:b0:396:54a9:8d87 with SMTP id
 98e67ed59e1d1-396d0d81bcfmr5949685a91.1.1787916537737; 
 Fri, 28 Aug 2026 04:28:57 -0700 (PDT)
Received: from hu-slingapp-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-142e0de4d92sm4997320c88.13.2026.08.28.04.28.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2026 04:28:56 -0700 (PDT)
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
Subject: [PATCH v10 01/10] build: add optional librpmi dependency
Date: Fri, 28 Aug 2026 16:57:53 +0530
Message-ID: <20260828112803.86636-2-subrahmanya.lingappa@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828112803.86636-1-subrahmanya.lingappa@oss.qualcomm.com>
References: <20260828112803.86636-1-subrahmanya.lingappa@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZbMt8MVA c=1 sm=1 tr=0 ts=6a917102 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=8ots_n__tzfDkp_RMYgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: qTpZBQi3ARi7ZnIqEDCiDA2Nsy0lDtTf
X-Proofpoint-GUID: qTpZBQi3ARi7ZnIqEDCiDA2Nsy0lDtTf
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA5OCBTYWx0ZWRfXzsgVs5r75t+h
 iTbdrrO74Il/aPSPQ+ym3J2m/NJo35DUk3UKYPPe7Kaxhc+ukjFTqXwCO1pwEB+73fdueRx/tPE
 zucWsg9b3erIVv1wha1E0ajOUsfVdbQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA5OCBTYWx0ZWRfX1JAIUVsYl5Xi
 ahVZTgr8DhwDGoqm4w5IcnI4hb1p1/1heccTX5OZxVfcgrvB738tS4VQS5jSjnIMuG3HSHBdHq1
 BkTTh4efpqM1YtUzqY5BWmTpY9xEo0l6a1WkFbN1ogaWf3i4EHJizES45NVjMoMhGVj8QhB8i/a
 QVUWT/mRVI1ADmtwX5LkK7/BY55ZJLpluO9OtesgNselDUT8twRAOrUF+9c5TVu8JQL+OkmwIn3
 iESLMYwNiLgb0d1uV89hde2R5Y2UNxJ816jJZplL4C+G82sKN4pD9lEVx8jO7gTwLoEv2g51K9M
 kdFnxZB8Fd6E+xDbXU1f+zba46FrmmMdvTcYa+/rCFEVTfBPX4PifCJnn4SxVBJNdo7jykoOjue
 dphp9JPirf+1puFLA8oArfhFwrMr/mQMI6uwrhSi5qIkEC5TPfdkxnewhMrQnyH+R/XFk8wkcCh
 jf7/J9SQsPrZUBbeeQg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608280098
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
-- 
2.43.0


