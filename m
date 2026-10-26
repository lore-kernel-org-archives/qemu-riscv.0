Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E194C606A31A
	for <qemu-riscv@archiver.kernel.org>; Mon, 26 Oct 2026 13:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NdtK6cIJ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T8vPoVMu
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xLKfn-0001Rd-Oj; Mon, 26 Oct 2026 09:23:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1xLKfl-0001Qt-CR
 for qemu-riscv@nongnu.org; Mon, 26 Oct 2026 09:23:33 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1xLKfc-0005De-IC
 for qemu-riscv@nongnu.org; Mon, 26 Oct 2026 09:23:26 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69QAsxnS3631944
 for <qemu-riscv@nongnu.org>; Mon, 26 Oct 2026 13:23:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 c7Apu//vZJzbInnGD9i0yt6UetOB1zhCDAWsiR8yYUY=; b=NdtK6cIJia0HO/iF
 JnpOfVI65hiQb23kV1DTUmyU9R7zzxQdCUxnDPwXa2dTRvVa2SSBe2UpaWyWIcOb
 sWCwUJohM7duR5Zmf4ZYGW5XzPPUR1LUm054E3mwwyG4lieCxLSSp6AzJXukbuSV
 chzxZVttxJCNwQAnvEDH/N2aMQ0yRRPgjmlnRNv+bz1P6rLADp1tM0+q4ZS5EFWq
 GRPeZL9ImQb+4rorXWmIbSAIal5eVJGbndnvtw4GX4jpTABjPHtZuTYpU64aYBgg
 qO38Lj5XB1WTU6hKDBBPXgZmLx9ytuQtWCmRqsQrCv3rfed2/CUwkpALQuMtmCvH
 p3fJpg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com
 [74.125.82.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4sf0qb2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 26 Oct 2026 13:23:23 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id
 5a478bee46e88-33bf1d17dfeso478132eec.2
 for <qemu-riscv@nongnu.org>; Mon, 26 Oct 2026 06:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793021002; x=1793625802; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=c7Apu//vZJzbInnGD9i0yt6UetOB1zhCDAWsiR8yYUY=;
 b=T8vPoVMumeeVxyEBTUipi6q3T6kXRz8Ln0GrEqeDD0s9g/AGO6uJp2zWWM70DWGXU1
 cSXDD9FxbLCHuko+QHOocaX+2W2c2VLLbmB2kxrDkXzhV00Ellxz85e9zG2ADHSgJeqZ
 XFliw3pas0m5oKGGiI6VQUxWiNdbMxropGWBS4kckCI1T/M6TcQxDMx49b7XCOtnwtXH
 Kq2Ex+Lr4dctdnPVwxU8RxHsxjyfhT987hXPlei3K19FJSPYzuBpamxzT4oKQYIdGTYF
 HbTxF7IGEQg9nZ6xCYrFPf0+DyM+N9kE8yMn7uCU5FCqKkBW/K4An1XAiHzU/O1dil/Y
 2o2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793021002; x=1793625802;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=c7Apu//vZJzbInnGD9i0yt6UetOB1zhCDAWsiR8yYUY=;
 b=jKXPonv5vxmIFeQQnb0wFS9k8cChz+56nu47Zdtb/9NwOPKPwfNek/5uoVTXsrAmZD
 4po2vENirkA4gb+OGhsAj2meYF95Sl+css7TBqCYm68+gqnp2E/akOl/bEZHvbZm8Mc9
 jZ2Q7DBph71C7SC/ESNCYX9jL1xi65nFPV6hha9OJXayeszmXpE94bH12EIZ1Wz0xKkC
 hNCywZ43stcSiEHpey+DHDjh+NjlkTxcpkP34eCnwJZTAktX2gqg1DbjQyR9fA9R2jeT
 ePzpJ0+m4690ODMaLxSSQRMi3waoUF/0TDxJHT332AT6s05GMsl8DoFWp96d1k2QqR/W
 iZOg==
X-Gm-Message-State: AFq9FYKYs3WuqfHamMqMZnPHOTYVJlHrntJ0pPBUiXQ1Yi88nBxWhIji
 6UsYYxPxIJSmZcSCkgZnrfvTILPBtWnCYbuixcxOr4H13fZGF9dqTEISekkw/BzEFvBQbrSe7Ny
 lTSw0NsV9HIfyBmtxQ3LcK658NpvUz274nQNWS8qnpyhBdvyP1/hSgy/WZPkUTM1Pmw==
X-Gm-Gg: AYBFou3MInQhx0ihtUFHM2eDs9+tJE5LJ51+Sb19+myyHCDrAAr+GONKR62+nfTaNZb
 ZEjgZuoH2WMdn8QonZRxxfm5dEoQRGTldJhS0cNcn8/Gc+HXCvpFXG5FeWzv/AAfWOa2kQWw2xG
 dMzmiU/cIFKd/VCLvgEflEY0nF3HxT/jphc4OycMX+1FKyfoaWCwr9s0iRd3ijYOc4tRD3lJzdH
 cyoiQVEcjHXmGDl50sU2iBrgSB90mL4eGkaLA/1SI+h31qvoqumEd4aUXVNLTgrwT9dwBDjTbtS
 UxQ6r9xq/mib7DOh+wenBiCXWDlR5hrymXuweEFETGcdoMPTs66BWsR5KXzSoLZ1r81yIyzaEkG
 TuOIRXETCWWDT1fvcXgGuLtip+HeIwMFJhNxI/J45/c1mEWUcjdZiYtyBM/Is4Ikn6pHPjOToVO
 aEaGlvCupk6QX5C643VfGjTfpWhoxI2Hg=
X-Received: by 2002:a05:7022:7f05:b0:17f:641e:7f6b with SMTP id
 a92af1059eb24-199345c5ecamr16603901c88.1.1793021001843; 
 Mon, 26 Oct 2026 06:23:21 -0700 (PDT)
X-Received: by 2002:a05:7022:7f05:b0:17f:641e:7f6b with SMTP id
 a92af1059eb24-199345c5ecamr16603815c88.1.1793021000898; 
 Mon, 26 Oct 2026 06:23:20 -0700 (PDT)
Received: from hu-slingapp-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-198a21bc6cbsm24360931c88.16.2026.10.26.06.23.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2026 06:23:20 -0700 (PDT)
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
Subject: [PATCH v12 01/10] build: add optional librpmi dependency
Date: Mon, 26 Oct 2026 18:52:44 +0530
Message-ID: <20261026132254.2652399-2-subrahmanya.lingappa@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026132254.2652399-1-subrahmanya.lingappa@oss.qualcomm.com>
References: <20261026132254.2652399-1-subrahmanya.lingappa@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1MyBTYWx0ZWRfX8ZwY4eZ71Wbu
 wYerHER5S+krmd27KQB5avgmB6/ZRIcB7Mr2qGfNSnAukHRm3Mkh6YMqqgqoj58niylvt94OZjL
 RSigv3guqHBIEt123+1Aw0kSKx2u+04=
X-Authority-Analysis: v=2.4 cv=ZOdCCn7b c=1 sm=1 tr=0 ts=6adf544b cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=JF9118EUAAAA:8 a=ZLPlHWeyiUGg96gsXukA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-GUID: qC0gOcVcNO35Mca0Gyip_jC19MNMrbFI
X-Proofpoint-ORIG-GUID: qC0gOcVcNO35Mca0Gyip_jC19MNMrbFI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1MyBTYWx0ZWRfX9yiSJsV8mtUr
 TNZHISMs0ZS6TMQAZk02H7HeuB6Q8zntKyLN9TpouEUzYETjGl4Oj/r2rrfW+g5LfuAZeM08lHD
 1BN+z8eVUJVo0DbZwfW/ezMg962gUr4ppWz9QVF2qIcAxqisriOICRzqc3kUieDDiGeaol5q0Yr
 FMLRaaj8sY1253qbVVP2pTODMEyl71Ts9tOkTmiYJZkZkT8sYhsoarge3jv33Dod3OUDVZiAMq+
 y8xbUddtxTpnZgXCbAH5EMMz6HL0dLFXOVmj1XOT2/0gW0DHJGsOA0C72syApGVU3W5JTO1qQfM
 sKcpMMXxH8LTnDTbBo52LRESQ4CX8vDzeiR0l2uh75YWhqf9t+0jUuSMzOT++BjpzSFeAfkCSru
 95xv8A45mV3qdC2Hwhe3UL1qx9Wb/Ij5GjeVxTrRGd9oY1jjNHEd6YVr2SR+42tK7neB1lrCVDo
 3zeep04YWVKCFQWG93Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260053
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
index 4f29bc6cc3..9c4d501687 100644
--- a/meson.build
+++ b/meson.build
@@ -2026,6 +2026,17 @@ if lzo.found() and not cc.links('''
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
@@ -2449,6 +2460,7 @@ config_host_data.set('CONFIG_LINUX', host_os == 'linux')
 config_host_data.set('CONFIG_POSIX', host_os != 'windows')
 config_host_data.set('CONFIG_WIN32', host_os == 'windows')
 config_host_data.set('CONFIG_LZO', lzo.found())
+config_host_data.set('CONFIG_LIBRPMI', librpmi.found())
 config_host_data.set('CONFIG_MPATH', mpathpersist.found())
 config_host_data.set('CONFIG_BLKIO', blkio.found())
 if blkio.found()
@@ -3280,6 +3292,7 @@ host_kconfig = \
   (multiprocess_allowed ? ['CONFIG_MULTIPROCESS_ALLOWED=y'] : []) + \
   (vfio_user_server_allowed ? ['CONFIG_VFIO_USER_SERVER_ALLOWED=y'] : []) + \
   (hv_balloon ? ['CONFIG_HV_BALLOON_POSSIBLE=y'] : []) + \
+  (librpmi.found() ? ['CONFIG_LIBRPMI=y'] : []) + \
   (have_rust ? ['CONFIG_HAVE_RUST=y'] : [])
 
 ignored = [ 'TARGET_XML_FILES', 'TARGET_ABI_DIR' ]
@@ -5009,6 +5022,7 @@ summary_info += {'TPM support':       have_tpm}
 summary_info += {'IGVM support':      igvm}
 summary_info += {'libssh support':    libssh}
 summary_info += {'lzo support':       lzo}
+summary_info += {'RPMI support':      librpmi}
 summary_info += {'snappy support':    snappy}
 summary_info += {'bzip2 support':     libbzip2}
 summary_info += {'lzfse support':     liblzfse}
diff --git a/meson_options.txt b/meson_options.txt
index 895c6e63c2..ca54c6e731 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -208,6 +208,8 @@ option('lzfse', type : 'feature', value : 'auto',
        description: 'lzfse support for DMG images')
 option('lzo', type : 'feature', value : 'auto',
        description: 'lzo compression support')
+option('librpmi', type : 'feature', value : 'auto',
+       description: 'RPMI support')
 option('pvg', type: 'feature', value: 'auto',
        description: 'macOS paravirtualized graphics support')
 option('rbd', type : 'feature', value : 'auto',
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index 14990966d3..0b78ea6fb1 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -147,6 +147,7 @@ meson_options_help() {
   printf "%s\n" '  libkeyutils     Linux keyutils support'
   printf "%s\n" '  libnfs          libnfs block device driver'
   printf "%s\n" '  libpmem         libpmem support'
+  printf "%s\n" '  librpmi         RPMI support'
   printf "%s\n" '  libssh          ssh block device support'
   printf "%s\n" '  libudev         Use libudev to enumerate host devices'
   printf "%s\n" '  libusb          libusb support for USB passthrough'
@@ -390,6 +391,8 @@ _meson_option_parse() {
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


