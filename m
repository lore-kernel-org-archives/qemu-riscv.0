Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE51606A31C
	for <qemu-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 11:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F5w0bsGS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZoxAmesF
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xRpC6-0005zO-KC; Fri, 13 Nov 2026 06:11:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xRpC4-0005ya-TB
 for qemu-riscv@nongnu.org; Fri, 13 Nov 2026 06:11:44 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xRpC3-0003Oq-59
 for qemu-riscv@nongnu.org; Fri, 13 Nov 2026 06:11:44 -0500
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AD8VSDd1527728
 for <qemu-riscv@nongnu.org>; Fri, 13 Nov 2026 11:11:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=CJ6IdqJTWho9f8+kcYElOy6uZtozeIBeBOC
 x1jdA0KM=; b=F5w0bsGSkWEiR61SOc8i9rED63uYnyDhwxLUKGjRzeS9d894UEn
 JN0AFtX9sdzbJsoT3unGyaL7aQV2gqtOH1SLeUpm+Lq1zLdwyHG/qIftI7Kv0mW5
 g6meNar5SWiQmvDz6ChG9fIMnoSZYbfXUyOjs7dGNv4mmpVV+U3O9AjWhXRCvHXx
 COuiewgLXQwdnR8GJtAVOLWAFoT2JToux1a+X7NUMV9yGrvm5C7cttHzkbdYxh3Y
 FDtSpFc/o+h/pPSQflxEbpBgCantKU49XKv9ABZ4WxapjBVzkJ258COYZShcMBTT
 PPg9ZrmIJ0v3YRZXIi728/nTL/xa1Y/Ez8A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hww5r8xp9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 13 Nov 2026 11:11:40 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-535131e4c25so15783171cf.3
 for <qemu-riscv@nongnu.org>; Fri, 13 Nov 2026 03:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794568300; x=1795173100; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=CJ6IdqJTWho9f8+kcYElOy6uZtozeIBeBOCx1jdA0KM=;
 b=ZoxAmesFLQRreQ7m6GEGksKZokLXwteJf/+lH6KHnVZQC3Lf4ViaUXUZC2Ir+Whm4j
 LECfq6P3xUFFPZloaAZunGF8N3KIPceztTUN5WkLbTulSn3GWMpxRjDLPCwujD2TiFNv
 XwbSQ0Ct+FEe1JOeknjFHK6wmSrfUBKr1qNX/Ve6tCFP6gnJbWN0L/qNOmfjIFzHs26m
 bQXJxzraFetFKyok2jQ6O/4WYDszBqkvJ7/ObACEh4bny4WW07xPqV9crub9Fkxjf21t
 8MidMLzJNQYCbPBFjlwPtQrym9bpjM6Ijh/dCsGXN2QiaD3f74OO5A1yg15Uw7yUNJgq
 6aHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794568300; x=1795173100;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=CJ6IdqJTWho9f8+kcYElOy6uZtozeIBeBOCx1jdA0KM=;
 b=sDVAOAksmLvwDfqoZ1pnseevI/ekWYmSJe6BL3Kdd5iPKyXsPv0HKxIeJFwNYZGsdg
 Kgmi5M7fS/chscqgLF5WV+5l1fw14R6L2BA87TdpElpvlZBhvl9Aw8E23w4IWMbC1C0a
 3lgHABEOUdk4CBaXdEMMta/VH/1hjT5WGaeER1SRCUIs/52DE8dquVCxk+DwyTFVmpoh
 dwLohuBTkWHPXvN0mGQ0hOFxJYdCW1kU8xSF1Ft2keWoPGfY94ixK4DrDfEjvCtDM+01
 yGj3GIpThV8Z+Ms877nNVAgjtS2fB4ELFgkO2pYYEE8rJ2+quv4RHWsVWkuCrukSf+wT
 ZVZw==
X-Gm-Message-State: APuU4Z9I7Z5YWAp+MAfNbiXEiPOnIeSflxTx/bFYmDPQTz2R5wq78BWk
 6RoPm++uNtJSP47mH/xandFUvM5qp/qqhmSznGEmMjCiXcwfbdvJgtcl6kmYdLmCyt7bjUCDycz
 Rf105U0G7QkMw3jvFKhV2ws+Vg+ad11CGVjHtH8jzrTmsFDl7ZcCDD8vNfw==
X-Gm-Gg: AYBFou22opvHAwuX23jdSgoN2nTtNmeYjyPm2QlO7Lj+40crhg7Yg7Jjg/3Q9P4Lha9
 OA2q48yJfJfv958Job38wvFtL9Js4nCkc+i5ol3M0G9SYPoSMV9ej18w0uNoxkAK5awVuXhAp/B
 +W+q/rnynmgKHY/AKTK+MCTuDLtzebgbuh7jcMqYe5Nl2VN76K0r6V5AcTH3qdUir5LBYTSNz5v
 w1+OWj8FjLqVP5Wuw5xSEqSdAh/G9ZpI4xH6VlxQq1L/cEOr5bNmaLxPwZbbS4RG2koPjIjPx55
 p9t4VbZfvG7P9jHs8nYeTaIs2ovJDrpr0wnp3SSUUgc99pSEVwEkPl1YCRubA2MH8n4OBimHenH
 auGHLWkcaYUU57MGEp9raCA5XEKuXFOQTgazEYrUQ36xqm4x9mAeGM4CGSoClKfDpS9PqAxR04k
 lcU91B6UlcY1dqUh331lN2Lz53atAuHLEudj2kOoRQ1kWa
X-Received: by 2002:a05:622a:2b4e:b0:535:9a06:1fc4 with SMTP id
 d75a77b69052e-55ac7266e8emr31093501cf.18.1794568299937; 
 Fri, 13 Nov 2026 03:11:39 -0800 (PST)
X-Received: by 2002:a05:622a:2b4e:b0:535:9a06:1fc4 with SMTP id
 d75a77b69052e-55ac7266e8emr31093051cf.18.1794568299434; 
 Fri, 13 Nov 2026 03:11:39 -0800 (PST)
Received: from QCOM-UWl2o8bcGT.qualcomm.com (189-68-253-226.dsl.telesp.net.br.
 [189.68.253.226]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91f23d456b2sm18065946d6.12.2026.11.13.03.11.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 03:11:38 -0800 (PST)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH] target/riscv: fix hedeleg writable mask [GL4592]
Date: Fri, 13 Nov 2026 08:11:34 -0300
Message-ID: <20261113111135.27723-1-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0NCBTYWx0ZWRfX63lwLitdw8V5
 RdlX1UygvC/FGJVZrJJgjBOF43wa6ZWKQXMH8b90BwTowgRs15SrotzBRJ38BvtHtW4QfKI1Yd2
 J5qg6iRaZd44jN7ygq8cozo6CTFo4lIDBTcpO8xYmJqLBr94tmjXWGNPL7YJtLHE8/DBsg105sP
 5OMkKARhB4r4JggOpcLV0tp3GOpzs9tjKGddva7+9IAxHEdQC2N5UNiuwcy3dFVGeeT6IiSnwl7
 F5Q7yH3FvqwpGICsfpG8X84EWxIciHH5Qw4oBg9TC1mV2HVgSLHWq+FtHjJS8Y5BMGLqhRlFToO
 kCR5wtS2Rq8yx0/KRSV3SeVAqvxfqH70LIFQBrc0MetG2IKxXKG1QrazOHkBf/XxjuNgLpz6i6y
 TVZpbG2ja5Z06/T8gZWJYDF4sX3lRX38Hk6uPBi8v2Sqdq8T7C76zgQiSvB2C7KUTwYsNueZyyN
 NuefG0uPA42NliTHz+g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0NCBTYWx0ZWRfXzy7H4h94FSbj
 e022lqGYBSR3qc1iNiWNNCJU9cZXFOnIpoXPvbLU5LxcPGBffQ0rOROo/c2u5h51J7ALuH2keXx
 XJrJgdnoZcwL8kyPxPbnr/JNTxmYDFE=
X-Proofpoint-ORIG-GUID: bKjnUBfipWMLJE9QzPKWgeU1XGBpulGe
X-Authority-Analysis: v=2.4 cv=Vqq2kO2n c=1 sm=1 tr=0 ts=6af6f06d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xcxBfRYLw5hNHjR815/AfA==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=p0WdMEafAAAA:8
 a=EUspDBNiAAAA:8 a=IH4YEds1svsedXLTdUwA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: bKjnUBfipWMLJE9QzPKWgeU1XGBpulGe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130044
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

Bit 19 (hardware error) must be writable in hedeleg, i.e. it must be
delegable.  Add it DELEGABLE_EXCPS.

While we're at it, hedeleg bit 0 is only writable if IALIGN = 16, i.e.
RVC is enabled.  Remove bit 0 from the delegation/writable mask if RVC
is enabled.

Fixes: bc083a51caff ("target/riscv: hardwire bits in hideleg and hedeleg")
Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4592
Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 target/riscv/tcg/csr.c                 | 11 +++++
 tests/tcg/riscv64/system/meson.build   |  7 ++++
 tests/tcg/riscv64/test-hedeleg-write.S | 57 ++++++++++++++++++++++++++
 3 files changed, 75 insertions(+)
 create mode 100644 tests/tcg/riscv64/test-hedeleg-write.S

diff --git a/target/riscv/tcg/csr.c b/target/riscv/tcg/csr.c
index af444e3e6f..9bea91113b 100644
--- a/target/riscv/tcg/csr.c
+++ b/target/riscv/tcg/csr.c
@@ -1837,6 +1837,7 @@ static const uint64_t all_ints = M_MODE_INTERRUPTS | S_MODE_INTERRUPTS |
                          (1ULL << (RISCV_EXCP_LOAD_PAGE_FAULT)) | \
                          (1ULL << (RISCV_EXCP_STORE_PAGE_FAULT)) | \
                          (1ULL << (RISCV_EXCP_SW_CHECK)) | \
+                         (1ULL << (RISCV_EXCP_HW_ERR)) | \
                          (1ULL << (RISCV_EXCP_INST_GUEST_PAGE_FAULT)) | \
                          (1ULL << (RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT)) | \
                          (1ULL << (RISCV_EXCP_VIRT_INSTRUCTION_FAULT)) | \
@@ -4913,6 +4914,16 @@ static RISCVException write_hedeleg(CPURISCVState *env, int csrno,
                                     target_ulong val, uintptr_t ra)
 {
     env->hedeleg = val & vs_delegable_excps;
+
+    /*
+     * delegable_excps includes bit 0, which is writable only if
+     * IALIGN = 32 (no RVC present).  Ergo clear bit 0 if we have
+     * RVC.
+     */
+    if (riscv_has_ext(env, RVC)) {
+        env->hedeleg &= ~1ULL;
+    }
+
     return RISCV_EXCP_NONE;
 }
 
diff --git a/tests/tcg/riscv64/system/meson.build b/tests/tcg/riscv64/system/meson.build
index 3c8b018d9e..502d1d80bc 100644
--- a/tests/tcg/riscv64/system/meson.build
+++ b/tests/tcg/riscv64/system/meson.build
@@ -89,6 +89,13 @@ tests += {
   }
 }
 
+tests += {
+  'test-hedeleg-write.S': {
+    'cflags': cflags,
+    'qemu_args': ['-cpu', 'max', qemu_args],
+  }
+}
+
 if 'qemu-system-riscv64' in emulators
   tcg_tests += {
     'riscv64-softmmu': {
diff --git a/tests/tcg/riscv64/test-hedeleg-write.S b/tests/tcg/riscv64/test-hedeleg-write.S
new file mode 100644
index 0000000000..919de1fb3f
--- /dev/null
+++ b/tests/tcg/riscv64/test-hedeleg-write.S
@@ -0,0 +1,57 @@
+/*
+ * Test for writable hedeleg bits.  Based on Gitlab 4592 testcase,
+ * which is derived from riscv-arch-test.
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#define HEDELEG_W_MASK 0xcb1fe
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
+	 * Write a full 1 mask on hedeleg, read it back, see if
+	 * all the expected bits were set.
+	 */
+	addi	t0, zero, -1
+	csrw	hedeleg, t0
+	csrr	t0, hedeleg
+	li	t1, HEDELEG_W_MASK
+	bne	t0, t1, _fail
+	li	a0, 0
+	j	_exit
+
+_fail:
+	li	a0, 1
+	j	_exit
+
+trap:
+	# Any trap is a fail code 1
+	li	a0, 1
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
+	.balign	16
+semiargs:
+	.space	16
-- 
2.43.0


