Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 056D4C624C6
	for <qemu-riscv@archiver.kernel.org>; Mon, 31 Aug 2026 14:11:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x12ii-00047u-Ro; Mon, 31 Aug 2026 10:10:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x12if-00047G-ON
 for qemu-riscv@nongnu.org; Mon, 31 Aug 2026 10:10:41 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x12ia-0006h9-3Q
 for qemu-riscv@nongnu.org; Mon, 31 Aug 2026 10:10:41 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67VBADNW4099223
 for <qemu-riscv@nongnu.org>; Mon, 31 Aug 2026 14:10:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=7F+h/izz5m8
 Ql6K/eu+v2vbYtEL3lKlYqdFbJP7M/1o=; b=i5u9qQQt68e2TMvjzg4hLgbTOta
 rS+vMnNUW2Z5aNIUssHm3VylbpHev0WuMkQw9eaugLFSHdGT6rMvtSvSKzhJiewv
 bjA7wOEKYKpCOs82gnT88HfExI1bvH9QTUnr6enLl9h5SGwfoCzOWyWLJkZUVpga
 Mth6oyt/W1wbmftvPJI4sYRKP339o0wgvMJ3ixG61VkdAqIRo2QppzC/M0ftqiRy
 nNnvBXK/EXif204zRcYOym56e7W4kHOQhU61KNbtU5Y5xgFmffUwdugiCBJnxQu6
 T/xXmiAjBh7TZDM3WQn1vW2Ey1KnVrHmtCWtqQ8LEy3tOcooTLKJqDc13hg==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd4x09rm6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 31 Aug 2026 14:10:34 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id
 586e51a60fabf-455ad408573so5843455fac.3
 for <qemu-riscv@nongnu.org>; Mon, 31 Aug 2026 07:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788185434; x=1788790234; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=7F+h/izz5m8Ql6K/eu+v2vbYtEL3lKlYqdFbJP7M/1o=;
 b=UJ8q8afqH/h+bLnZvypGewmPqSfcwVIFt78PvHy9MpDjxPIfgM2ewD3CYv5rw2GECx
 iNN99DyveOc1UI9d5ogfpaEs1L07D/XWtsGanQQuPIApx3J49E9WUQYr3x6bl0mPttc+
 7YCXZnChuPPCeUQgce1mMdJI/PJ+lkytzWnUIL5DpVLy86D2hXDcdGt8nw5aYBo0iAhv
 K9A94jSvkp+rwUm/98mpXJKzZL86KqH108aQkbfBtsmLM+spQdiN8lEHbz1C2hO1R4L4
 bAOcEmqORGkH7g1VQdw8Rqi6aan5zQnehRiKDDsmybAIhYgqibSvbzApC/fRZ8bgDdPQ
 ehJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788185434; x=1788790234;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=7F+h/izz5m8Ql6K/eu+v2vbYtEL3lKlYqdFbJP7M/1o=;
 b=opU+qOJb3c9/775WnIubwHvZ7iSD2/Rh3CypbvEzOQzMFtDvk3O1hcpkJGsBnJyAbW
 XHkfUNwA2nC+kAT2kMF9ok+T7tWLbVUQaeiBHguTdZVOXPvJ4R/nCWWNEz7IeY0Z06fV
 E8B5395eH02p1wp7AAm5rJKTfwolURYKN3vKVCcIyMTSzTFaxJNy1LpoyUl+uZ5W2CtU
 z0EiPfEC5oAiK5vlN1WcDop1jJDIAZVpF/sN3aF6FKpk6Y/a+NO5CoyvbK5xaMsWyUqt
 eRPqSuYHiEJC7AOt54U5bV4oWmYucj5BziiIwOZ+2TC2hpK+sFPqU5yjdmHRIwM+FNZt
 82iA==
X-Gm-Message-State: AFuF++kdDINne97DW5zkv8nn2E5AxxB6y7zNtrwvGLeMYIA+HOpM1F86
 vTjXn4ADlGC7632GoK4t8otsAd/cc/cVwKvCAowprj9jNQClzqJoDB5xMYBBmjPN9cEWs7wiCu6
 /tH/Am1gqjjafWUWZUPF9ElumNznJ5k60GRnAZSTE/kVRWqro7v5FNlgAqoZcWnYxuA==
X-Gm-Gg: AR+sD1047KFMpIDCeaCtU6U4U6l7QnLoIifG7UUms0AK9DQX8usT8iUkMv9sEvphCo5
 vDYYbxKlfuegq/OvmeEVENvfz1xUXa44KZtkqxqIa3IF9Lyz9Ox1CQvJJLEbfWuQfnYAaY/waD5
 whpkJmK834HjW4rJg5Ppth7d8+62u9cn0mCcEU9rIpnAaEEU6L7Dz/DWXexlbOg/vh810Q6U/nE
 3E8/bqOLgB8Yn2AApZIpAJIG/zTc5jJwmALtO+S+TjLhoIT+GuTox9YUflVGb/a9K6tWpzSjKHn
 3s4Y5GLrJRNWzzUylcpARe0nKNP0ykfV9hC7ostCdtdEoC6iurz4PraVsicwbtZ79Cana35czII
 iyzJwaRC2uKHBzeNphd8g9tJFothVjm8MJl3Xyg==
X-Received: by 2002:a05:6820:a558:b0:6aa:e573:9ce0 with SMTP id
 006d021491bc7-6b1c65fc8cbmr20715919eaf.16.1788185433669; 
 Mon, 31 Aug 2026 07:10:33 -0700 (PDT)
X-Received: by 2002:a05:6820:a558:b0:6aa:e573:9ce0 with SMTP id
 006d021491bc7-6b1c65fc8cbmr20715861eaf.16.1788185433185; 
 Mon, 31 Aug 2026 07:10:33 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([152.250.131.13])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-468a3535e25sm9886129fac.5.2026.08.31.07.10.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2026 07:10:32 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v7 7/7] tests/tcg/riscv64: add sdext "not on Debug mode"
 sigill tests
Date: Mon, 31 Aug 2026 11:10:06 -0300
Message-ID: <20260831141007.353854-8-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831141007.353854-1-daniel.barboza@oss.qualcomm.com>
References: <20260831141007.353854-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEyMiBTYWx0ZWRfX4uSJ74rRp21b
 ew8yimQekme0S/zEcG7aPqsO5xK14Q1/YJsNEVpOSq/T0jWsRhUhH5o3FSkN1JQpeWSVOUSzfYo
 +0gSnb8S9F4yYmhG0UTQmXgdSLTn8Tk=
X-Proofpoint-ORIG-GUID: 89sD6TRMse3GfccRIlM-XZtHIvEDbkcG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEyMiBTYWx0ZWRfX9L4xcWJVSmgt
 0njy+XUU364VfRzwWk+jpTvzG2XnW3f6R6yXEaZLCF3li/BiiJailtmVPvD0piAStwFpMxdvVN0
 TVffGjA9lKtcrLNKfGzl2GwTk0MjUGksBhMVd9DGB8hqvltgjirMgTwNERdrUjbErvuRayBTxNv
 nLOAHyk7g6b0vBf9QzilcF7IB05ZxAOWfJJ+NHk3Kk4NY0oOTHNp0JF35M+EL9q2Aa+WzhVyxlu
 wdsMcUdKzliDjbnTuhgCKPsQCUISnkYmXdW/CGhYDMQ+8EbSIyUWoNGEy91RTuXjM+pjL6Ik51c
 43VmqVAQ0mVGTnwAmKjygGOHDGMYYUInA8QrrICABiOqqJ3+DsNSSVF3fmcGRHNlx+Rf6rx7Jt0
 UfHvvu4n48yd3Ww4i7HXvOMLktqazvig9cDrgMmfTpSi3pMLirJ5CVU+QNgccakp4dunuXs0Fqo
 mu3lzajmuBdKzGnIcGQ==
X-Authority-Analysis: v=2.4 cv=Iqsutr/g c=1 sm=1 tr=0 ts=6a958b5a cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=CXdxNCAnTuDr1kYd6DjE4g==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=FibE5N0eoUlo320SlN0A:9 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-GUID: 89sD6TRMse3GfccRIlM-XZtHIvEDbkcG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310122
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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
---
 tests/tcg/riscv64/Makefile.softmmu-target |  5 ++
 tests/tcg/riscv64/test-sdext-sigill.S     | 83 +++++++++++++++++++++++
 2 files changed, 88 insertions(+)
 create mode 100644 tests/tcg/riscv64/test-sdext-sigill.S

diff --git a/tests/tcg/riscv64/Makefile.softmmu-target b/tests/tcg/riscv64/Makefile.softmmu-target
index 6a219c306c..acfa7981ec 100644
--- a/tests/tcg/riscv64/Makefile.softmmu-target
+++ b/tests/tcg/riscv64/Makefile.softmmu-target
@@ -71,5 +71,10 @@ EXTRA_RUNS += run-test-misa-w
 run-test-misa-w: test-misa-w
 	$(call run-test, $<, $(QEMU) -cpu rv64$(comma)x-misa-w=true$(comma)c=true$(comma)v=true $(QEMU_OPTS)$<)
 
+EXTRA_RUNS += run-test-sdext-sigill
+SDEXT_CPU = rv64$(comma)sdtrig=true$(comma)sdext=true
+run-test-sdext-sigill: test-sdext-sigill
+	$(call run-test, $<, $(QEMU) -cpu $(SDEXT_CPU) $(QEMU_OPTS)$<)
+
 # We don't currently support the multiarch system tests
 undefine MULTIARCH_TESTS
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


