Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9077606A31C
	for <qemu-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 20:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GVOSjR9H;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BnxpJaIN
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xRb4O-0006ov-G5; Thu, 12 Nov 2026 15:06:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xRb4I-0006lZ-JD
 for qemu-riscv@nongnu.org; Thu, 12 Nov 2026 15:06:49 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xRb4G-0008Pc-PP
 for qemu-riscv@nongnu.org; Thu, 12 Nov 2026 15:06:46 -0500
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ACJZli81840813
 for <qemu-riscv@nongnu.org>; Thu, 12 Nov 2026 20:06:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=YZ8VoNhOGEehTJ/f+HP/W0rRBliAPDLWh15
 r9nGZhEI=; b=GVOSjR9HPLF1nNbzEcBIJFIjVQ10n3q/Co8swT8/E9Zsk9q8Ye+
 WKbtGz/dyqbUwXfycLpby8S/G7Q7r5w73Y08R1Xjq8Mhq4EYvc4yWR3ZXCLRyvXa
 RQEptWOq2m35MQD2iz+2Ijr5rXtYFfi2kI/j9fSF/8ZUmZKVG8qfS22I09ncfBFX
 8UG/lpj1HfWFrSAqpSpGH/fSH328m8MDImmL1tEaS7Sx/G9VGGsjb1rWpcfvIDCN
 jJ3zjIM71bI/Qa62PQwV6Ko169r/nWhnSIVAzRxC4E3Iz3VUILWg/iUXdpWp1V6t
 /hhot9v3Qrv9BjFfAVtg4mhk5sTzLADWIvA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwan4tar9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 12 Nov 2026 20:06:42 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-91f10c68ccbso4669486d6.1
 for <qemu-riscv@nongnu.org>; Thu, 12 Nov 2026 12:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794514002; x=1795118802; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=YZ8VoNhOGEehTJ/f+HP/W0rRBliAPDLWh15r9nGZhEI=;
 b=BnxpJaINTpHJ/UsAEoR58MbRhiRme/uZYJPJseXm3lbPHIS8pXm2OcSoJyZY2k3sWH
 N0h08dbg1oqkn6qrhorAy1kJ4DH78KA4UwklPU9QXKU2hEjR1hTMTxZ6Sk4v2yE/xw4A
 pm+ir+Kefjy51jqVxoDVkVr29sknv5QNOAujK/IrJ2wJxtBY0KMRjJvF8TwSOfcgZKCC
 drpAIx1G99wGzZ/xLwwQDbFoQzDZxgtwGbSxYyqO3Mkn0OLe5tptMseAkkgn8eJrfUaO
 /bEui9RumGdFPMYz82VwdP+0kdpIsXa3FVS2o0zSRa0+Hr68cLJyvTZ+a4BzFYLBUKE1
 33DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794514002; x=1795118802;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=YZ8VoNhOGEehTJ/f+HP/W0rRBliAPDLWh15r9nGZhEI=;
 b=PHR/A9ejM1SiRcA2W6poj67Ku/54nM2Ky3O8Sq/sawApae08/wNt49wIQvFoZWs8JM
 oYh1t6dDe4WfWxjWGS8BSR2cg1drmjINdo6nqRpK85LuPqNu5vVNyiTu2j8yYWItk+Ly
 V4gPn+CrmpX2DOM+VblDvghg6vgxZGdDRmgJMSBwsdiUzoNeR+NDEBlGABBFEsjnU+/U
 U1hRKKmu2MbqTZBYf11IVvAJejWZP+CvhFAScsfLxrFpFuOtjpcCvV5IGW6028xGVKU1
 eKiekol8RjLqI4Dp7ZBxfMcf2Pl3L7COMAlkQw0c8GzRPf+6WYtSZxRbYz3OP8j398K0
 0kig==
X-Gm-Message-State: APuU4Z+cZJpDS1hjGHbx37Gg9WRIAzml3AQRB+zrpVAoyLhW98JkKLJ5
 OBw9t8aInlsXCgQKwPJXTcH3aZYyjZG0GNtNu95YCcSQQ2mlhvM27GAeNjm3r2sQm1oLjs6Nn61
 OTjuugOXelAfIG48A0LlLJ+eooE93d3KQYRKuE19Txc/mY1zLYrj9luOoH9ysgnif/w==
X-Gm-Gg: AYBFou3Lcemii5z+Atv5E7BoNCNqsO8Zw5WuvGF59Op6uNAU9HBg751ywA1mD0BjfXB
 62OF1oMgbVGDO1v21pgOLl4GAJtqnHUQs69lYvd7tllo+KMAClz7Z1pKPDYhj5fea59KPUsz2d0
 jUW/P2qdRzLdLmdCJGujKO6Clgy/fcokEHwt9Md/1PaGlgOVHxwFGCL0I2d39kGqBoFSoyfhyme
 sTszOYKffmN1yNeuPJHcYXA7/zicjF7yZlIbMiJu7pgKmM/+ni1gGj6bpTeT4uMsDdwJy/f6Eeg
 USAUMiO/924A2G/EAluFFyBqFCGc25Tq257rwEDJrTD3Nx9f+srqqwSUqQi6uF5wmazYNjYXMFj
 76LRzO1vmg0Ln7AXCvJd896wUyBP8vMik1qxVbbmrY9dmyZWZuYl1TFYTwSnOEOSpQMYkc/ibfh
 M60yYd1M6ZxBd1iJmHAmEOXlbepHHI8DTEmC9neEEOASiv
X-Received: by 2002:a05:6214:4521:b0:917:96b8:de25 with SMTP id
 6a1803df08f44-91f24050652mr6449536d6.1.1794514001732; 
 Thu, 12 Nov 2026 12:06:41 -0800 (PST)
X-Received: by 2002:a05:6214:4521:b0:917:96b8:de25 with SMTP id
 6a1803df08f44-91f24050652mr6448856d6.1.1794514001016; 
 Thu, 12 Nov 2026 12:06:41 -0800 (PST)
Received: from QCOM-UWl2o8bcGT.qualcomm.com (189-68-253-226.dsl.telesp.net.br.
 [189.68.253.226]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91f23c9b30asm3881066d6.2.2026.11.12.12.06.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2026 12:06:40 -0800 (PST)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH] target/riscv: make mstatush.MPELP writable [GL4220]
Date: Thu, 12 Nov 2026 17:06:35 -0300
Message-ID: <20261112200635.549520-1-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: uvxjeimW5m3CWFKI_9U0N5ULEZL2Pa0M
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA4MCBTYWx0ZWRfX+F7KvU4/pNqS
 ILR4QeSdyrAyrYpo/nCv4bOxD/b/3IuMDBqdIo8ZFf1t1sL6H6Fy/kz3HRa2QExQ7JUz98AQEkD
 0Y3dS93n6Nql2jHrEITvBAwG/5Pwsg8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA4MCBTYWx0ZWRfXxgcj3nn1nPEb
 /akk+QptXP9Nnww1ReTgM/HyrQB9BTs2YR6P2UNcldMaEZqSt7WYGFkzWvBl1zFw3IurI9ulmQx
 5UomaHKg2Dukrkkycrdoh7VbrU9iu/jC/1p9AnVELwJ5OFCz0cdhRfheSnrNFJEIKLPZ1EOGriN
 ks7cCuemRX/Nrbl32Gk4uuDXt5Gfb4/qMRz0PwArFR11kxbasEJsotMnmIq3AU+NAJz1ZWnjtk0
 EhRqAhRbDFYJmePZfUWUNcvlxDBbQEFFxq358nSFl4yFu6u2bRRjr8iv8Qyh8dlhBwd49Fa3N/1
 RmNdHbp4hbu55DpG+GNc1zDEcAk1VUt6tG9jpVrxNMggQdjgu4TxnLV2lp/cbpfuYlldiIxPJau
 5wKiBv6IV02Sl5zr2N3BOTzNz7LWxG3M/mPICeCwRyxP7TmAVluRMvsHoaBX0eKj8ewY/mGmFep
 XmPl+CUL7Q/cieDJQuQ==
X-Proofpoint-ORIG-GUID: uvxjeimW5m3CWFKI_9U0N5ULEZL2Pa0M
X-Authority-Analysis: v=2.4 cv=Gd+CDgXL c=1 sm=1 tr=0 ts=6af61c52 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xcxBfRYLw5hNHjR815/AfA==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=p0WdMEafAAAA:8
 a=EUspDBNiAAAA:8 a=H4QQ7LzBS-9MoOeKjzIA:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 malwarescore=0 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120080
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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
X-Spam-Status: No, score=-23.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add MSTATUS_MPELP in the write mask inside write_mstatush().

Fixes: 4923f672e3d7 ("target/riscv: Introduce elp state and enabling controls for zicfilp")
Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4220
Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 target/riscv/tcg/csr.c                  |  5 +++
 tests/tcg/riscv32/system/meson.build    |  7 +++++
 tests/tcg/riscv32/test-mstatush-mpelp.S | 42 +++++++++++++++++++++++++
 3 files changed, 54 insertions(+)
 create mode 100644 tests/tcg/riscv32/test-mstatush-mpelp.S

diff --git a/target/riscv/tcg/csr.c b/target/riscv/tcg/csr.c
index af444e3e6f..e73455d021 100644
--- a/target/riscv/tcg/csr.c
+++ b/target/riscv/tcg/csr.c
@@ -2155,6 +2155,11 @@ static RISCVException write_mstatush(CPURISCVState *env, int csrno,
     uint64_t valh = (uint64_t)val << 32;
     uint64_t mask = riscv_has_ext(env, RVH) ? MSTATUS_MPV | MSTATUS_GVA : 0;
 
+    /* If cfi lp extension is available, then apply cfi lp mask */
+    if (env_archcpu(env)->cfg.ext_zicfilp) {
+        mask |= MSTATUS_MPELP;
+    }
+
     if (riscv_cpu_cfg(env)->ext_smdbltrp) {
         mask |= MSTATUS_MDT;
         if ((valh & MSTATUS_MDT) != 0) {
diff --git a/tests/tcg/riscv32/system/meson.build b/tests/tcg/riscv32/system/meson.build
index 117ae6fbce..415a1c212d 100644
--- a/tests/tcg/riscv32/system/meson.build
+++ b/tests/tcg/riscv32/system/meson.build
@@ -22,6 +22,13 @@ tests += {
   },
 }
 
+tests += {
+  'test-mstatush-mpelp.S': {
+    'cflags': cflags,
+    'qemu_args': ['-cpu', 'max', qemu_args],
+  },
+}
+
 if 'qemu-system-riscv32' in emulators
   tcg_tests += {
     'riscv32-softmmu': {
diff --git a/tests/tcg/riscv32/test-mstatush-mpelp.S b/tests/tcg/riscv32/test-mstatush-mpelp.S
new file mode 100644
index 0000000000..f70b4dfc32
--- /dev/null
+++ b/tests/tcg/riscv32/test-mstatush-mpelp.S
@@ -0,0 +1,42 @@
+/*
+ * Test that mstatush.MPELP is writable (Gitlab 4220).
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#define MSTATUSH_MPELP 0x200
+
+.option norvc
+	.text
+	.global _start
+
+_start:
+	lla	t0, trap
+	csrw	mtvec, t0
+
+	csrr	s0, mstatush
+	li	t0, MSTATUSH_MPELP
+	or	t1, s0, t0
+	csrw	mstatush, t1
+
+	csrr	s0, mstatush
+	and	t1, s0, t0
+	bne	t0, t1, _fail
+
+	j	_pass
+
+trap:
+	j	_fail
+
+_pass:
+	li	t0, 0x100000
+	li	t1, 0x5555	/* FINISHER_PASS */
+	sw	t1, 0(t0)
+	j	.
+
+_fail:
+	li	t0, 0x100000
+	li	t1, 0x13333	/* status = FINISHER_FAIL, code = 1 */
+	sw	t1, 0(t0)
+	j	.
-- 
2.43.0


