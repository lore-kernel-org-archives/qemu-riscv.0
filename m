Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F7A0C79FA0
	for <qemu-riscv@archiver.kernel.org>; Mon,  7 Sep 2026 11:47:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x3XoS-0002uS-Vp; Mon, 07 Sep 2026 07:47:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x3XoG-0002kO-NH
 for qemu-riscv@nongnu.org; Mon, 07 Sep 2026 07:46:49 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x3XoD-0003Gh-MP
 for qemu-riscv@nongnu.org; Mon, 07 Sep 2026 07:46:48 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 687AnE9g2652808
 for <qemu-riscv@nongnu.org>; Mon, 7 Sep 2026 11:46:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=1LQc3MHagbs
 qNP6Gfy/bvJe0yknu38X5VO+oSaaO4w8=; b=Pvl8E5oD9/g4FGMGdre9JP9oP51
 bvaOokE2xRslFkZxkbdHvbikuQb6HOMVli4/eora0VO656azj5eywm5yiSZVTGDn
 O7xZsPx0NAEcQ229Vb+u+4wODEYhQttVJkZIhBOiSeAnS1C268pHexoEGX8d4sHD
 FydK/jvw+jMPox9l6arYfm+HJReS93qVuvUcZCRrmMi8O1PnPT75AQSZ7cgfj0Gd
 C4oY6bZQAmqDmNuRjrbVD5hFIySl0hs6wrVB++tBGt7Ib4yPEoe5dxZsMdaDAmGy
 SMNvg6hodWv0o2JiAlpa1UTGEje8E0LpuZQTi/SpBLrm4sgNz5zf6fvhE+Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtty0fjx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 07 Sep 2026 11:46:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-92e62e3459fso534706085a.0
 for <qemu-riscv@nongnu.org>; Mon, 07 Sep 2026 04:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788781603; x=1789386403; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=1LQc3MHagbsqNP6Gfy/bvJe0yknu38X5VO+oSaaO4w8=;
 b=A8aNQVk67dyoHgc0b8Ez7cFH8kmnnlmXCCbYH4TWbOz+mhgMPxBlz5TE7wYPss8yqC
 +tMCObS6F/rsl/ZbRwpiVxs3nhUJgjwB4hRjYviB9C8GwEJkGfUnYODpO4w958nNATLP
 244FBylN1iyjZRuCJliN8OgyIOe/hd84TQpiBmD/mf7BXNcpE91YTAKlefxOoqYsjnO9
 /nkWy/781FdSEiRUdGW9n2+8VDcz9oElT/k6Y2xVAwNa4o0vZHqqz7Njgz5WRSWSGWL7
 7fNNNN6UkET8s4xADBfndbQtB+8Ljgv8j6blXAQ5FXBqVxwKPjgs8KQoJM5R1laNItaE
 FsUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788781603; x=1789386403;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=1LQc3MHagbsqNP6Gfy/bvJe0yknu38X5VO+oSaaO4w8=;
 b=ZHfcbYj3w0cDN8DjWP/eDfmjc5Kf4dZ50nB2e7OwTDjtBoXWiO+LCeNvebM4L7f+sN
 NCJuZieCs4ANLgzYVZ9xWSyuTKZV/xZlKLfwktNnhHU5pdlDHO8ocjfVZqc1+fWPRfOC
 K53h7hV+n3JPsJjelevPi/TABf8fJGah0sziFwCdWE7oVu0I/w+2fln+KHd3cMGjK67a
 ErUh7VNPXd215mDxjpJHXFaiPdbFv0BIdDWrMOcDZK6WRG09Bylwplo8vVH0wz1S47SQ
 SY/F93iKCvzUKVBCMMmbVbGDHG2a/q31dgMbFVrP+wbKi1YHJrc4fDgFGSOAp0L15RTA
 MjtQ==
X-Gm-Message-State: AFuF++nBNnmDtr2w/E7SM/yqhBRM65Cm/1oTXML5o1978TdW2Hbm1xru
 WbajdAqSrKeHC+NEb4qcQXeu4jmCrT/fuGX4otuyozIdTWL+Pmo7uwMZUMX4ieIoD3Pklp9egio
 xP8o1gnQ0q76AztivrhUg4wnK4Nn2euduRqhqYE6WV1kPurArEhmel1/Y+A==
X-Gm-Gg: AYBFou1zdCo3/9BTGvzDACHKLNcRRRK85kHViZ7UKppWOavUlwnxiptvmb7KLT1iBd3
 LPvrleJDqCwWxzQGaUfEjXp0h/mzn0d34ak564UYm66/eLY9L1oNHrSO/F7USUxiTkv97Yhlf/t
 BNWLLYXCdX32oPUsfu52aON9WPvPiZG87m+2E1sxWwRmvQDzAGxdlur3bmIrQeqbYLIGo+5q0zv
 oaexlRVv6BLYp7MK1x7CjsnslA9lhbYM2T5f16tRLsACy75hgjlq5oR+Tx+gYosJrPIzxvgNUx1
 50paFoJywdVuNhEQPWdUa30XRavzckEZPpJPCwZApwxNHIldo8biH5v889xfJhAtRfO8h+xUYVS
 zhv+9iPj9BlzLDeyfdZGBBx2p/cKFj/lCGWmJ
X-Received: by 2002:a05:620a:5229:b0:936:afa0:3661 with SMTP id
 af79cd13be357-939804a386cmr1758002385a.36.1788781602991; 
 Mon, 07 Sep 2026 04:46:42 -0700 (PDT)
X-Received: by 2002:a05:620a:5229:b0:936:afa0:3661 with SMTP id
 af79cd13be357-939804a386cmr1757996185a.36.1788781602375; 
 Mon, 07 Sep 2026 04:46:42 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([177.18.66.131])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91040679e13sm89834876d6.26.2026.09.07.04.46.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2026 04:46:41 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v8 7/7] tests/tcg/riscv64: add sdext "not on Debug mode"
 sigill tests
Date: Mon,  7 Sep 2026 08:46:14 -0300
Message-ID: <20260907114615.1609913-8-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907114615.1609913-1-daniel.barboza@oss.qualcomm.com>
References: <20260907114615.1609913-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=QNBYgALL c=1 sm=1 tr=0 ts=6a9ea424 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=CQQxcbsX5Byh3TlVSSGwig==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=FibE5N0eoUlo320SlN0A:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: Ko8sFhwkOzu1lYXHcxJEVXzYkcLTpktQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEzMCBTYWx0ZWRfX4aaedN1Eolbm
 2TgCW+l6SLckboF/og864Ol0ARFoREzJi0P0cW8Yw3j8CDicp/D+gfGh/SrJPX8sBMm7iXG4EO/
 vTgQQa39VG2mwWy52d7qNLr99M1/NiM=
X-Proofpoint-GUID: Ko8sFhwkOzu1lYXHcxJEVXzYkcLTpktQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEzMCBTYWx0ZWRfX+uZzKrx1GDjV
 4U6Gg9bERN9Ep11LvdxLEOIj1xGfVVgcYKzYagZMTJT47yGylHGC/WQEpMVO3Kv5W9Og9mFHKOl
 QP6zcQktg0Cr5poWxybMMnqg71ugvr62D/PvGIzXhe9Y6Rcbq9NZIpFu6e3lbtWfG81aLJRxOxS
 ziydbQ0dLfJWgdaNKc/+rrvQuaYi9oavflNfIo2YhNp7wab1DrpkBIxrKH84zaZsrWiuIBL8M1p
 mZC5Ia1ECjg8iN25R8nCMzOKqOWwaOcPNH/Thz1OcdeHSCg6wjTphsK/huaveleRGlQSpHkSkiu
 k2xg3aNvRPmf4w+nyAvIYF28uJ/06pENsyy77plorASZkXsNpE7SjkMn1ErItTZbkprWqKuIExu
 05+mzu7zQGf+s1UfAlORYJPq1JHC+EANy4FgY4CrPE2GuOd/ZWGtSNxFkgUEAWafBuQKmCSXZUi
 fmRplcGMbtVpEHigdow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070130
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
index f2c75abd57..0a36376f85 100644
--- a/tests/tcg/riscv64/Makefile.softmmu-target
+++ b/tests/tcg/riscv64/Makefile.softmmu-target
@@ -85,5 +85,10 @@ run-test-vle32ff: test-vle32ff
 	$(call run-test, $<, $(QEMU) -cpu rv64$(comma)v=true $(QEMU_OPTS)$<)
 test-vle32ff: CFLAGS += -march=rv64gcv
 
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


