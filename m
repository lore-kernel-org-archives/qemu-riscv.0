Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9438B606A324
	for <qemu-riscv@archiver.kernel.org>; Mon,  2 Nov 2026 08:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b6KUZmvp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CrmX4g4a
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xNnTe-0002x4-1t; Mon, 02 Nov 2026 03:33:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1xNnSm-0002m4-L7
 for qemu-riscv@nongnu.org; Mon, 02 Nov 2026 03:32:22 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1xNnSi-0004nb-M0
 for qemu-riscv@nongnu.org; Mon, 02 Nov 2026 03:32:20 -0500
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A23vISg3324658
 for <qemu-riscv@nongnu.org>; Mon, 2 Nov 2026 08:32:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 yduADB2OpVCwll9flVD3mKkXGUD6xulVEqJm2BB22+E=; b=b6KUZmvp6+ekfFfH
 Sl5MV2WkTbYWsC2Fn934OffPjHOhLYspiVlq7iYYWXHDK6oPSOhlYFkxKF1XoQfv
 B9VptfhUkxeDbEUAOKD3Rec863unOU+iCwJVVZHbS31MOvCBkXCF+pGWC5eGjyyo
 vkTLNsyc5kqSbYbZlgyzAkyEOkFr0f4qKlBObzQ73tqoqGIbvy0jeaXa9BlwGcJL
 qi0K91XF/sEDLY5OFJuJiaQOVx988adhwffRbAqCLCAfjwGhlvpxPhCX1j94t++0
 yNAPCLWtIdoNdfaxPWCDKv+QGqdGAy1cEimT6o/Oc0RYKjSwFi0AlYzSMQTOJBLu
 d8/r0A==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7b6p30y-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 02 Nov 2026 08:32:14 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id
 ada2fe7eead31-7c100f6f8ffso100991137.3
 for <qemu-riscv@nongnu.org>; Mon, 02 Nov 2026 00:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793608332; x=1794213132; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=yduADB2OpVCwll9flVD3mKkXGUD6xulVEqJm2BB22+E=;
 b=CrmX4g4aikxs4oFfDyi4LC+9hPhgVWYt45o6FXYBMKeQ//FuWoeFmikEHDGxlBTurr
 ZZiM0Nq75jAGz7H6TAH/O7m+ktAhCIRZ+7vpAZN5t/8U77h0gQGuJ/4hxcLlibWtclYp
 MwAgIY+2HJM/v9+KXlcUbvX3AqU/XCju/1dvX2LLFH2E1kkWVmfB2KsB31Aj3A46wMFo
 rctt1zHtRIluRAhKXYBpbbcmmjkMMTkYi/00yFKemgpJlvdqXAjRgFvvqgfaixioO1GJ
 xjIUqLvNwLTV6XkHr8inGTsvfKc1k78C6LFNbvN1IW8McwybxrX/0PDk/75tUDBGk9GB
 lBBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793608332; x=1794213132;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=yduADB2OpVCwll9flVD3mKkXGUD6xulVEqJm2BB22+E=;
 b=tA9YO0ICFzxTYZcbdy2esjI2H4WnDf5dTCIlx8DMJXaeSIi0nlbDZt+gW0odjVXwgQ
 VG7HJith0TZyKs6pCc61g5SYwjNlG3HLBrLXkOTaKkQfgtcI47ricLLNwGfL09XhV2oK
 hZeA+Qf0sSQe3LpIM3qRj6kyeJUGC1zQwMpI1Vyev4fH+nNb3quyb+ORSFJtyQIK7Yz0
 dS7iDqMK4rXhBYbjml8XzTqUQ7I7rksGMaTwHDWRSqAAPJoNpPngFK6s6u3CPEpP0QqB
 +q+/eEKzqEhLZEMl4W0Th8KdgPW/n8W2zsu7nusoZuomfWTy9k99WOuf50iwv2NC3n2Y
 obRg==
X-Gm-Message-State: APuU4Z9kmUslXiFpCUT+6KetO0xxbX5VyrRFNHNGDthfLwsezfzHheEo
 zGfu+Mn+uM/gP8Tq2j0OH5cgPuasbCDWpEXuRexQXnDHF7Phfu3t4Z+NBocOpmz7KtEyGPzDFZa
 IKfa7BxrJhbSjPItvvwtxZugjXiHqeqo7d3TK80NvXWzYsHIOismcb6Fh/Q==
X-Gm-Gg: AYBFou0vJJ9nUZB985HeH1mKHdxoWSjhIHIz3RTFV3gxGPrOQGVAqv/56dcCP08pV8l
 7Gz+dsUu+5FuueUCjEw92Dn5UdW22umg2DMXvaSAgQ5IA2w1jN8iQEAljXsI41MI5CxFI0hy/j3
 BbfWufYMfXWhIklKZQg8cvCl40xsEKHOKA48FmqxQ6ysZWhbI2hcjJ0uvWtmvjnH72lN+YhfRAu
 O3Jl1dHJLF2BlrLbPeTK8/gU66cvA0MPTxh2irQtnGwiqGXkK1vQsiwkkzNX1u5t/d9tRQLJrG+
 ARtQf0fYiQNRJI2WLHSSMV8SiLcFIc5I7hajS6B2wsH7OuZfDRorRo4/FEUxTw+gXri4N6it1kI
 iSrhUp+sofwvtknY7+vpYMa9n5qdd0YPg9TzHSOb3TrpCYIO2Yv0gl5LpG4szv1Tf4PUAyREKpi
 PN9Vhwo1PZaDgXzgnNO/po/5AYlQ59AImT63+hH5JL4vKXeyav7Jz1ku92ybq7LmCvdcVhfj41N
 64hQVGZ
X-Received: by 2002:a05:6102:8346:20b0:7cc:174b:f7b7 with SMTP id
 ada2fe7eead31-7d07239e743mr3998420137.0.1793608332050; 
 Mon, 02 Nov 2026 00:32:12 -0800 (PST)
X-Received: by 2002:a05:6102:8346:20b0:7cc:174b:f7b7 with SMTP id
 ada2fe7eead31-7d07239e743mr3998389137.0.1793608331486; 
 Mon, 02 Nov 2026 00:32:11 -0800 (PST)
Received: from hu-slingapp-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1b106edc7f8sm15083213c88.9.2026.11.02.00.32.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2026 00:32:11 -0800 (PST)
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
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v13 01/10] build: add optional librpmi dependency
Date: Mon,  2 Nov 2026 14:01:49 +0530
Message-ID: <20261102083159.3383468-2-subrahmanya.lingappa@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102083159.3383468-1-subrahmanya.lingappa@oss.qualcomm.com>
References: <20261102083159.3383468-1-subrahmanya.lingappa@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: DBplSkj3_W47fW26APB9AmiGkdsIjuDT
X-Authority-Analysis: v=2.4 cv=QuvLTlyd c=1 sm=1 tr=0 ts=6ae84a8e cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=JF9118EUAAAA:8 a=ZLPlHWeyiUGg96gsXukA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-GUID: DBplSkj3_W47fW26APB9AmiGkdsIjuDT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzMyBTYWx0ZWRfX1AL6z+LQUhBE
 3Tyr4uEDICDKzZzTLuRr3ELqS2pptY71V3yMFJK/HL7abmZ+60i/MoZBHtWWiAN9Bq7JLIjzdFq
 /Z/EQLXK4BiKRuyX737cmNUEEB74ggM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzMyBTYWx0ZWRfXwU3IlIvoQ2zO
 Ki6PQdZdacuXIhhdCvm+8HGxjztJq0eyK53ajTjzy9cq5CqLeqIBb2B+VhRl0Vm0GUYtXKuyw8f
 ZnSeXQkSLYs2dsxSK94m4KhGC6c4TmZuLWPfii1RNsCz5JCR4l+Yego92sJeQQo+ijPEZhV4N96
 BfRN/XQ8U5SID+5XmqtQgCdRzVUX26Rrh1eGQmlTzE7q0c2GmNVdEF/Vn0Sm/55oobz1lMtITCk
 IOi7R0AON4UNUCSWvynz8p07idQLInjWViJdU5JzlKPpcDIvdOkVKfB8lXHTwRqOJ4WDS8niZfO
 j4/hC+Xg78EgJUghlIM41VJHEDuO+OuMf648KJ30qadThSFS5CUWcpVq7EC5s0taZqSQIYM+0kp
 fGN1A4ptFETUPnl92HYwxCtKVGj54IXHt85GddZia5U/3r1eszoCUmPw855NIv3zhPmSmfUCLQU
 5XdU3CrBie5nGZAm1ww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020033
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

base-commit: d73149283205645625bfa9fe029cfb68e4c4a9ae
-- 
2.43.0


