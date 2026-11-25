Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487F4606A326
	for <qemu-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 13:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IV4Gk1RO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Gk8yrArp
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xWCw0-0002ZL-8p; Wed, 25 Nov 2026 08:21:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xWCvr-0002Wa-Gu
 for qemu-riscv@nongnu.org; Wed, 25 Nov 2026 08:21:08 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xWCvo-0000gH-HO
 for qemu-riscv@nongnu.org; Wed, 25 Nov 2026 08:21:07 -0500
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AP9miBb3642175
 for <qemu-riscv@nongnu.org>; Wed, 25 Nov 2026 13:21:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=Sf1vlvsyNSv
 3W8tH1Pd0HGHQYqYncQYGXkZkrt2mbuQ=; b=IV4Gk1RONfJe9nhxj6kCDjYxBmj
 WbLyAX+8WGdPEvUaFIp4ZD1t4xn/A6bFdBFI1Kd8oKm9kVZlJqWVV9tKvFodNKtt
 1XHxZh225Xy5sjDGfSX6mRNIsmZSJU/B29dStC84rxLxl6Nngkbpjod7DhfJ1m+Q
 UYeiXDFyTM2cv6Ya9xK9Bd1FbUOOXc88Sus+goOnE5uJkV+zK1GwMpVxtrdbZNMF
 T3RounuGroqgsC82Be8GOcd7qg1Mdfn1D4oH00Gw4Tqn7YdgdaguoVKgXV1GPUFW
 PRwgIgi3FHn1lUQMiUjEGPuZ80lzPhkbE5ZxxYCm6hhbw1uy1TWtdhhR06Q==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mc2b0un-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 25 Nov 2026 13:21:02 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id
 ada2fe7eead31-7b206156cc6so2929311137.1
 for <qemu-riscv@nongnu.org>; Wed, 25 Nov 2026 05:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795612862; x=1796217662; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Sf1vlvsyNSv3W8tH1Pd0HGHQYqYncQYGXkZkrt2mbuQ=;
 b=Gk8yrArplwwUh5r+RRBj/Sy2RkZQCEa3MXxt5/MyP4J57gYe9BFs3bg4CsfQgAFOTP
 knP2SmwmYnzVwAuEjlh90DW4KUr9ux5wX738W0xdmgFNfYhVRp40tdfdMVh8Gnj0Yg4q
 R3AdyqFvKJMW7BWUVy5Kl8PEuMFkemvrgLR0oUoMYIWpR2i0ieo7y077moiD7PupD2v2
 R5QGIyMifJl3fk2sDGdtktzj2CAJDGx9MhiUmHN0twio34BEI/7gdTj0FZsKDeFgbEEW
 uocAzWbC8MeTd+stomo/F2E06hTwt2g5qto679HtL3NPtSZ/c2lw3EN5LjODBqCWOOWe
 K2ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795612862; x=1796217662;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Sf1vlvsyNSv3W8tH1Pd0HGHQYqYncQYGXkZkrt2mbuQ=;
 b=R44YX0uy5WfNtxTfIKjZxCpFlNgr/tlxL/FjElxJSpla+maeCq2oIRb0rElY6H71ih
 8wIATTqCPPZ/EzIQNzXzXjqcuKlvdTEfhYX5MMRZqK996Ds7obu3LQry6OM9D6JRpXUR
 Huf+CP4TSLy/C6xe68g861DmQCm8QzSuFgbURP8FZ0NIzGgA7FB11YiaS7bhgOb075jj
 nIjcmqxFj9UMgO1UF/JzEaiumpaqt9pLiZXt0lhRfkZLHtWuOKagmVrPG98gjb1nR2ZG
 EaU3PiE7UK+qaVfnnDLaV0EjVYuLx4isfPyQeIF9nxQeCZCJLUis2DxmkWeaK3xb1bOX
 MgzA==
X-Gm-Message-State: APuU4Z+7R/hP4WJabEA7t4l7CZDpilv8LWDjqH7PyY6x0hJhsTkghNxr
 d+5cIpHAiSyz3aAIJZl3fe1z/5aZ68wEJoEJzSBTRvH9TJxepSwTls6aEDFkzZYI3KmM9PEYQfl
 j+46Jrk+frhiHSArbYDFRtQsqDit5ofFQV7+jqWPZOXmwrobBJDzbE03cKw==
X-Gm-Gg: AZFdTZc+6s2pgPCdW7ZSh/AoAgvfu+sE6dHGdhuteoTqPG0rQe/KaV8mCWZgOzP1cBo
 FbAxrR7g9s5UZ1o7BpBQT5uLN6bgc7B+VTaTIIRyYnDa4Et7fq4tdFHMYFglYCqT/D7LlDs5Vmw
 oOto6RzMSkw3vwgr/T7pxRNOzrDMwA3qV2eGlC2tKGHP9F6cskkXpiKVSs+ZtAVt55Sl3qpIMuF
 otmJfHjDKuFiiwbvAwL3zjyBZiHTGHTZtaIIBem20G4Jc1Fnp2KaMKGtuoHa90zd8n6uQLMdAQK
 jxoyvLDv5g9uaNiPv0Z/rCsIBY7aaEkzc+Pi/w/zaGVFdBl8ilAkn3SOJmE1TTwzP28wwi3tqA1
 rg0khKMbZ4GDBMGW0ORPWHqr2QujjmNX3vOLkUje2x6xz7obve/QPzQCDH2pbtlDO1bUMKGiWiy
 LgjDehdwgwpg==
X-Received: by 2002:a05:6102:3f13:b0:7b4:879c:bb76 with SMTP id
 ada2fe7eead31-7d739582ee2mr9904527137.21.1795612861843; 
 Wed, 25 Nov 2026 05:21:01 -0800 (PST)
X-Received: by 2002:a05:6102:3f13:b0:7b4:879c:bb76 with SMTP id
 ada2fe7eead31-7d739582ee2mr9904482137.21.1795612861220; 
 Wed, 25 Nov 2026 05:21:01 -0800 (PST)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.110.107.17])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-92134a08552sm160836946d6.34.2026.11.25.05.20.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2026 05:21:00 -0800 (PST)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 07/15] target/riscv: allow zicbo insns to run without RVS
Date: Wed, 25 Nov 2026 10:20:06 -0300
Message-ID: <20261125132015.229955-8-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125132015.229955-1-daniel.barboza@oss.qualcomm.com>
References: <20261125132015.229955-1-daniel.barboza@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aPJlOr9m c=1 sm=1 tr=0 ts=6b06e0be cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=2Chh/y2wedAoPG2p3qwUfw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=p0WdMEafAAAA:8
 a=EUspDBNiAAAA:8 a=KKjn5n9Ayip0tkzwBa4A:9 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: UIZf7UD0qLkiYSF-dl0Oj5g-haz7O57n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1MyBTYWx0ZWRfX+d25hE8OiHeh
 Mm8jvFcMqtiNpVwnXPbARyJJ9Wmz36LWDX1mLKqnzJ54X/r2pcx0JAwrZVeqIkOVQfgpaoRrqsO
 0Th0pWM6K27UJ7+GirRvBrVf+G3KEJ/xq8W/dXHnjPOfmebjpBecSfKrlyxW7uEZSoPGvDmID70
 lutdMsYVK37n+KqRcYALcx5gpR3SFYYCHt9KP7VCNAgnqEmyX5rQbQrHNa6JI7wJLvspEva75Fh
 db51ukJnrzEo0NRW41jgXG1C59XQEQwsBbGt3zprQYam6PuvTf80wHzFbSfqaAjhEu0vLCAjJ+9
 MezEHtJUU3/POPA1bh9SBq6TC9ivT9pOBOHpX0YqkX9BgrnXH9tT4s1zZqnnVvLL3Gijb257GgN
 qACzeZSa05vP+i830vU7bkPb1CkdIRDk6KHpdAbIZsKeuzENs1ntveD7vi2oJvgdU0Zm1eIPq8v
 6mdoA5cx9qTzE1Ajb3A==
X-Proofpoint-ORIG-GUID: UIZf7UD0qLkiYSF-dl0Oj5g-haz7O57n
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1MyBTYWx0ZWRfXysz/WaC9TKTU
 NjAeb1vy6Z6PB1/RMk6rDv0082/BHFdvQUqZbNBWjV4xWg6bSRAjAPQl6w9z3z24Ot6bEvJso1r
 yJMJZRxaV9TJ+GfZhdinKnuWwIwhZ28=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250053
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

check_zicbo_envcfg() is validating access using S-mode constraints that
are only relevant if we have RVS enabled in the hart.  If we have a hart
that has M-mode and U-mode, but not S mode, zicbo insns will always
fault.

Execute the exclusive S-mode checks only if RVS is present.

Fixes: a939c500793a ("target/riscv: implement Zicboz extension")
Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4596
Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 target/riscv/tcg/op_helper.c         |  5 +-
 tests/tcg/riscv64/system/meson.build |  5 ++
 tests/tcg/riscv64/test-zicbo-umode.S | 98 ++++++++++++++++++++++++++++
 3 files changed, 107 insertions(+), 1 deletion(-)
 create mode 100644 tests/tcg/riscv64/test-zicbo-umode.S

diff --git a/target/riscv/tcg/op_helper.c b/target/riscv/tcg/op_helper.c
index 52aa545eec..db4cea326a 100644
--- a/target/riscv/tcg/op_helper.c
+++ b/target/riscv/tcg/op_helper.c
@@ -172,7 +172,10 @@ static void check_zicbo_envcfg(CPURISCVState *env, target_ulong envbits,
         riscv_raise_exception(env, RISCV_EXCP_VIRT_INSTRUCTION_FAULT, ra);
     }
 
-    if ((env->priv < PRV_S) && !get_field(env->senvcfg, envbits)) {
+    /* Skip S-mode exclusive checks if we don't have RVS.  */
+    if (riscv_has_ext(env, RVS)
+        && env->priv < PRV_S
+        && !get_field(env->senvcfg, envbits)) {
         riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, ra);
     }
 #endif
diff --git a/tests/tcg/riscv64/system/meson.build b/tests/tcg/riscv64/system/meson.build
index 87a26389ee..fd52d1e4ec 100644
--- a/tests/tcg/riscv64/system/meson.build
+++ b/tests/tcg/riscv64/system/meson.build
@@ -146,6 +146,11 @@ tests += {
     'cflags': cflags,
     'qemu_args': ['-cpu', 'max', qemu_args],
   },
+
+  'test-zicbo-umode.S': {
+   'cflags': cflags + ['-march=rv64gcv_zicbom_zicboz'],
+    'qemu_args': ['-cpu', 'rv64,s=off,h=off,zicbom=on,zicboz=on', qemu_args],
+  },
 }
 
 if 'qemu-system-riscv64' in emulators
diff --git a/tests/tcg/riscv64/test-zicbo-umode.S b/tests/tcg/riscv64/test-zicbo-umode.S
new file mode 100644
index 0000000000..4ce91baafc
--- /dev/null
+++ b/tests/tcg/riscv64/test-zicbo-umode.S
@@ -0,0 +1,98 @@
+/*
+ * Test if cbo instructions are executable without S mode
+ * available.  Code derived from the Gitlab 4596 testcase.
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#define CSR_MENVCFG 0x30a
+#define MENVCFG_CB  ((1 << 7) | (1 << 6) | (1 << 4))  // CBZE | CBCFE | CBIE=01
+
+.option norvc
+	.text
+	.global _start
+
+_start:
+	lla	t0, trap
+	csrw	mtvec, t0
+
+	/*
+	 * PMP entry 0: NAPOT over all of memory, RWX, so U-mode
+	 * can fetch and access data.
+	 */
+	li	t0, -1
+	csrw	pmpaddr0, t0
+	li	t0, 0x1f
+	csrw	pmpcfg0, t0
+
+	/*
+	 * Enable the CBO instructions for U-mode and report what
+	 * menvcfg reads back.
+	 */
+	li	t0, MENVCFG_CB
+	csrs	CSR_MENVCFG, t0
+	csrr	s1, CSR_MENVCFG
+
+	// mret to U-mode at user_code (MPP = 0)
+	li	t0, 3 << 11
+	csrc	mstatus, t0
+	la	t0, user_code
+	csrw	mepc, t0
+	la	s2, cbo_step
+	mret
+
+user_code:
+	la 	a0, buffer       // address of buffer
+	li	t1, 1
+	sw	t1, 0(s2)
+	cbo.zero	(a0)
+	li	t1, 2
+	sw	t1, 0(s2)
+	cbo.clean	(a0)
+	li	t1, 3
+	sw	t1, 0(s2)
+	cbo.flush	(a0)
+	li	t1, 4
+	sw	t1, 0(s2)
+	cbo.inval	(a0)
+	ecall
+
+trap:
+	csrr s3, mcause
+	li t0, 8                   // environment call from U-mode
+	bne s3, t0, _fail
+	li	a0, 0
+	j	_exit
+
+_fail:
+	li	a0, 1
+	j	_exit
+
+# Exit code in a0
+_exit:
+	lla	a1, semiargs
+	li	t0, 0x20026	# ADP_Stopped_ApplicationExit
+	sd	t0, 0(a1)
+	sd	a0, 8(a1)
+	li	a0, 0x20	# TARGET_SYS_EXIT_EXTENDED
+
+	# Semihosting call sequence
+	.balign	16
+	slli	zero, zero, 0x1f
+	ebreak
+	srai	zero, zero, 0x7
+	j	.
+
+	.data
+
+	.balign	64
+cbo_step:
+	.word 0
+buffer:
+	.fill 64, 1, 0xa5
+
+	.balign	16
+semiargs:
+	.space	16
+
-- 
2.43.0


