Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04353CA5FA3
	for <qemu-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 20:01:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xBHWr-00055u-2Z; Mon, 28 Sep 2026 16:00:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xBHVe-0004LP-Sz
 for qemu-riscv@nongnu.org; Mon, 28 Sep 2026 15:59:36 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xBHVc-0006ky-LV
 for qemu-riscv@nongnu.org; Mon, 28 Sep 2026 15:59:34 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68SHwkwg2740625
 for <qemu-riscv@nongnu.org>; Mon, 28 Sep 2026 19:59:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=ODMk96uI9rM
 FysN7Qe9sV/K6j6+ntKjMjPc59ZGDCxU=; b=FtdFgRIKajIGcVp8qxEA2ktV/tL
 qCciEyRRrk+5wBzh1J7V6fHq+XEz2Nc/LYM/CMULFz2VnlBFAncMcDB9KRMvzItk
 jKy2yceFiAtpVcjR6yqv4KyK8tkioFVp2WEi8D1kuM0I6lZyebn9gaY+utsKHQoz
 6QBM6sQtx+82arkAifoy9Rxhncd1iEprGtqPZ7BSnJvOp45ayVVVdU0CNhAR4thF
 GA6m0Ieu54jcIbq65jthgxtydoTCEcE1XbTfC0BP+2Y/g1s5OYdzd7gFNlsJ3hc6
 gKMaXOnLb05BcajdeMOzPHXXihkJGT8o2dETgtZES/eG07ppsLiD+xU3wyg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gynb6jm5q-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 28 Sep 2026 19:59:30 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-916cc44720aso20266416d6.3
 for <qemu-riscv@nongnu.org>; Mon, 28 Sep 2026 12:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790625569; x=1791230369; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ODMk96uI9rMFysN7Qe9sV/K6j6+ntKjMjPc59ZGDCxU=;
 b=jM53wixYwD1R4fRSGuRzK6sgwGnfjVWAiZC4grEGGPcYbhQbb1ZNBvz+UWtYknKlRM
 qx4lEEm1XgmJ7806R8pl6FowmynQMzIXskkMVYwya3gOv+wtm/5Q57bv+T7Sn3gcyF/L
 SWyqhKese/Cg6C4fR8g7U9t83dDwC1qvLXTRBHRHTVKGu0xqX5HTGqUdphmnxpjM5Gjv
 P7seKcnEETCMbD60fkkk0qe7cDV7tehg2oRenHERHFTy49kLQ1vD84Ukje6VZR0ZOvxF
 iDYK8up9XKNsoezJNOti8q9ja3ZzUy/1F8rnl8XBkboKKmcVSQiZWR//8JEPmT8PCHTO
 fBqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790625569; x=1791230369;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=ODMk96uI9rMFysN7Qe9sV/K6j6+ntKjMjPc59ZGDCxU=;
 b=ssK7WlsP+mRYNdbPPE4Pas+TnsIfM8eCFc0o8emnpqTqJ/kJcAMTgZTUcPvz/3h5tc
 1nlF1EJA32lNvv1aHdVgP8+NTsqUPGtyySITTjfmW8o0QA6dO673SYlBYsarYpSipGDO
 zVegaruJYBrrtvPu15DhwhIdqkLIK7LyWe32SP7iud8/pp8MjoTUNhq8qrIcW4pSmftK
 xWVmKFTxTaAisMgkzldZ17gigaPjqMObxcgzm92CLqkgZIpcmlLjm0pXuwbavlYXzwga
 VXxIR5t24bzTcv4ihCQTFIZwZbO+AtAyN4nQq72HwKznnXFYB4NQss/isBgfcKfJ5Jit
 s/Nw==
X-Gm-Message-State: AFuF++njSg7s/mj4ZgGhIe8UMsslfKXLpvsE1puJXIGcECqcTN1vH0ia
 NjBdnaRtU1w18iGNWqVRqDWATSXuf8Ui4mxLo8eKz0sINy+kAumhQF/2J0iycFxmKXo7JF+/4lL
 sklaeD8Zcs0L9/s2R1k/iA2dzmRRDLowG67YLrHo0JWXAYhyNn3G9DuVGzQ==
X-Gm-Gg: AYBFou1avttH5suhzdYgk6KpkwqcbgJ70MS1J5sNj2xHg3Atquj5jBbogdpU+Fso/Ky
 x7wPriR9UpexzY1Ce9l9o5RLUj9AQuIgwgRTqvqWXSJScBE/RPuHWzivH9Ama/Jc2YdfZci5Etw
 vbjYyjS/zxxIMBsmKhIpx/cfD/27eK6oDFAKW+g1zzkrGwLpIJIVdze9B8nrwnwGDeat11cLNSK
 kKdvj/7T+reer2iJNyFvyY9M8jUKSv2MLi73jz+RbMiZXy38QU3SOAoJ1DfLE5hOV7XLKbILJKA
 9ORzDTQxNFm7SzFWVSZyJJBpDV3iyFN7k0uUPCi895UoHD7lf3mfHVd9k/whW8QI8Y14VAn3Ccf
 07xVkc519CPLw9OGHsMRRWOMyRZbtUbwYZX4=
X-Received: by 2002:a05:6214:4805:b0:914:3ef6:ec40 with SMTP id
 6a1803df08f44-9143ef6fd76mr194398136d6.24.1790625569429; 
 Mon, 28 Sep 2026 12:59:29 -0700 (PDT)
X-Received: by 2002:a05:6214:4805:b0:914:3ef6:ec40 with SMTP id
 6a1803df08f44-9143ef6fd76mr194397746d6.24.1790625568928; 
 Mon, 28 Sep 2026 12:59:28 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([177.94.15.187])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-9143d0a64b9sm75905556d6.35.2026.09.28.12.59.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2026 12:59:27 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v10 7/7] tests/tcg/riscv64: add sdext "not on Debug mode"
 sigill tests
Date: Mon, 28 Sep 2026 16:59:01 -0300
Message-ID: <20260928195902.2045235-8-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928195902.2045235-1-daniel.barboza@oss.qualcomm.com>
References: <20260928195902.2045235-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA3OSBTYWx0ZWRfXzP+HxIuaJ695
 GiL3Eva8mw+PzxCuzzXpZcL/jYS4FOLn+RONgzYHC7iNQjGtOZa676lQ/qhI6JPN4fvO/MxRLWr
 KAAvMuPs3NIKgPGrBFfNy/IDdYbK06wntGiMjd50r6Y9rVJE5fxBS7/z0FZ5ZctF5QHxfeAM1s7
 KrOFV0UdXhaA5fF2QWPUdaZVbl7mBZwflLNU1Ma1ONecoCy+AVRjjA77AVowfy7/H9n56Ebv5zL
 f4DhQhBLjjhqkjW0d/RWCJgM0I3i1th9//rcu/EUTZJxGoIJkx1CeUW7yk5tas6/eiOSFIvubM9
 1ImrYUZAPWiOPYRF6etpyKWKz86NY3dSEHEUyx4v4v5hOX2VLorJXPR0NlqduePqtDNQkev2Oj5
 iKRDd0TcloPKe2blKUMV1dwy+fPekGrDeb8h36IwGTo+vzd1b6NfHCvzc4s0HA+ivLtt5u8xn2N
 Sd5HJTqFl3RSQRzx5ow==
X-Authority-Analysis: v=2.4 cv=K+e3jCWI c=1 sm=1 tr=0 ts=6abac722 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=0kFmPUMe/4ewoYCJjrGTNA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=JF9118EUAAAA:8 a=lQlWDN6XiApmBSmPJFMA:9 a=iYH6xdkBrDN1Jqds4HTS:22
 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA3OSBTYWx0ZWRfX24M8dqrN0kJo
 7lzhRqvyMJPm1m+jOXdgeVOzzE583pbgtZ3vzvTGLP7irdY+6J8+WjIVWHKQ2B3z3DN+NBcBIYa
 HX7VDIF+qcmNm/6hT1MjgGj/dSoWrm8=
X-Proofpoint-ORIG-GUID: BiV7ee08Zn-vUhK5mwWzcFsKyIGRV03P
X-Proofpoint-GUID: BiV7ee08Zn-vUhK5mwWzcFsKyIGRV03P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280079
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Adding proper TCG automated tests to sdext CSRs requires enabling
gdbstub support for riscv64, which we don't have, since the nature of
the CSRs added is that they run in a higher privilege than M mode.

DCSR has bits to allow for context switching from other modes to Debug
mode, but those bits must be set via an external entity (e.g. gdb)
beforehand.

What we can do for now is a "negative" TCG test to ensure that we'll
throw illegal insn traps when trying to write sdext CSRs in machine
mode.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 tests/tcg/riscv64/system/meson.build  |  8 +++
 tests/tcg/riscv64/test-sdext-sigill.S | 83 +++++++++++++++++++++++++++
 2 files changed, 91 insertions(+)
 create mode 100644 tests/tcg/riscv64/test-sdext-sigill.S

diff --git a/tests/tcg/riscv64/system/meson.build b/tests/tcg/riscv64/system/meson.build
index 2aca68e078..8f920815cb 100644
--- a/tests/tcg/riscv64/system/meson.build
+++ b/tests/tcg/riscv64/system/meson.build
@@ -62,6 +62,14 @@ tests += {
   }
 }
 
+tests += {
+  'test-sdext-sigill.S': {
+    'exe_name': 'test-sdext-sigill',
+    'cflags': cflags + ['-march=rv64gcv'],
+    'qemu_args': ['-cpu', 'rv64,sdtrig=true,sdext=true', qemu_args],
+  }
+}
+
 if 'qemu-system-riscv64' in emulators
   tcg_tests += {
     'riscv64-softmmu': {
diff --git a/tests/tcg/riscv64/test-sdext-sigill.S b/tests/tcg/riscv64/test-sdext-sigill.S
new file mode 100644
index 0000000000..80a6c06465
--- /dev/null
+++ b/tests/tcg/riscv64/test-sdext-sigill.S
@@ -0,0 +1,83 @@
+/*
+ * RISC-V sdext extension "SIGILL" test: check if sdext CSRs
+ * and 'dret' will throw SIGILLs outside of Debug Mode.
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+.equ CSR_DCSR,      0x7b0
+.equ CSR_DPC,       0x7b1
+.equ CSR_DSCRATCH0, 0x7b2
+
+	.option norvc
+	.text
+
+	.global _start
+
+_start:
+	la t0, trap_handler
+	csrw mtvec, t0
+
+	dret
+	j _fail
+
+	li t0, 1
+	csrw CSR_DPC, t0
+	j _fail
+
+	li t0, 1
+	csrw CSR_DSCRATCH0, t0
+	j _fail
+
+	li t0, 1
+	csrw CSR_DCSR, t0
+	j _fail
+
+	li a0, 0
+	j _exit
+
+_fail:
+	li a0, 1
+
+/* Exit through the semihosting SYS_EXIT_EXTENDED call with a0 as the code. */
+_exit:
+	la	a1, semiargs
+	li	t0, 0x20026	/* ADP_Stopped_ApplicationExit */
+	sd	t0, 0(a1)
+	sd	a0, 8(a1)
+	li	a0, 0x20	/* TARGET_SYS_EXIT_EXTENDED */
+	.balign	16
+	slli	zero, zero, 0x1f
+	ebreak
+	srai	zero, zero, 0x7
+	j	.
+
+
+	.balign	4
+trap_handler:
+	csrr	t4, mcause
+	la	t5, trap_mcause
+	sd	t4, 0(t5)
+	csrr	t4, mtval
+	la	t5, trap_mtval
+	sd	t4, 0(t5)
+	csrr	t4, mepc
+
+	/*
+	 * Skip 2 insns (8 increment in mepc) to skip both the
+	 * insn that caused the trap and the "j  _fail" insn
+	 * that follows it.
+	 */
+	addi	t4, t4, 8
+	csrw	mepc, t4
+	mret
+
+	.data
+	.balign	8
+semiargs:
+	.space	16
+trap_mcause:
+	.space	8
+trap_mtval:
+	.space	8
-- 
2.43.0


