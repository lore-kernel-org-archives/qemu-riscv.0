Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB221C79FB8
	for <qemu-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 08:44:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x4DtP-0008I3-5O; Wed, 09 Sep 2026 04:42:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1x4DtO-0008Hi-3k
 for qemu-riscv@nongnu.org; Wed, 09 Sep 2026 04:42:54 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1x4DtM-0003K0-C7
 for qemu-riscv@nongnu.org; Wed, 09 Sep 2026 04:42:53 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-2d6fe26ef1cso56923165ad.2
 for <qemu-riscv@nongnu.org>; Wed, 09 Sep 2026 01:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1788943371; x=1789548171; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=3/JSEN4yZJQug9AgbAgWw+4fekDHImfUc2lZDl80p84=;
 b=DQ9dL677NoWmHBzHOeiHaD0vc2xMax+B0qvdsoPJGTlZNKGAQUrigGhB7TpverFhl8
 5ykiqrpHrfyT0X/b3CyYL/D6DxeWkfKtfINEeVBTG7y+zs2lrlQKiR5pwJIo1PnRGkY2
 xdrCWJdDxd09vwEBjcpoLSFvNF4J2Iogu4S4l+p0wDobKySY4cfnTQWtUNYT3TToa0UJ
 35TM0AOfCHFTHE4Mbx5uoDC97ewwXxEquU8bKAIszgpmzUBH21OuQMKAN0Y2QV/Ehy/I
 y4HJiR+unPNghYajoIpib4RMWAM2HM3e/agIkiGF8mvX4H8lmw0nGkvWsLKemDtaGBeY
 ltXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788943371; x=1789548171;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=3/JSEN4yZJQug9AgbAgWw+4fekDHImfUc2lZDl80p84=;
 b=CPKmoh8xt+qPHkhDQ1aLwntRj4aiUHD49AmlZRVWlG01DJ1wHQCLKt/r6cJoqP6JZh
 zUa9+9aEKsG+l4Zjcl+L4YF5VaK2jyUc1suwQ0I49bqNmvTktc78xMnCF1vEpPvlHMTv
 Oj6GPB1dntK4j1JfYKU2N8XbsXsOXm+ZGu9izTXrKX0AYldd2IyaYaZe5qJyR80SQTA/
 W+6UHMnR+Hzi1JG/gV5yyWALmFQ3ECW8+lwvELHgzqx0D05OFCrR3T8itQ3EyZxR6oD8
 p55y8OBF3SWR7eXpFCaOHSUdtbw45IvXZ6nkotQvOEX7Ryx4F3BUsHQxVR6nHO6umxTn
 w/zg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxsTkUM0596zTONpxgipbM7GchbgMcTfHSEasd42gRlARw99x80P4l6g4gIq+zkcKQW415JsYALVNDL@nongnu.org
X-Gm-Message-State: AFuF++lJEyYNlkZOB6s8XWB9EYAOkSCGIwIWrtl0tYaaJ/1TLW/922z6
 P3paxMZz+KDofcvUQ2xqzCTkRldnfOvrjSowbGPeWBUr0NgsUpq3Ihz2uewjy6V50vI=
X-Gm-Gg: AYBFou2ByZvmYkBz+JIWDX5j/SHxaEMbnNLuMVSqll2RTydI/Y1Be5pQ0YB4gRWRiEK
 PwnidOx+lZQO89iiaz2OyTS0PxugHkDB4KZte+mCuYSxAU9zzDLTkCbFwWssUIRp7yVnAV2/9Fv
 GyO2iJcUETpshX7kdHUbCPvDkZO9Y2HQ6Si2i4p8Bn3v+Hv0CclxXep1HIzRgCY1BZsGhj1Ko+s
 50Axwy5hLoClRF8/YlQZBtmqZEddprPijfYoFeHjdXMZ8R+D0MLuCn6pjzB4sYFfuntW+GMaXxF
 eoJwdJ5fPvyBwiWwLc5URpZxVQ+wG3pAIhBSdAQgCFN3+7Nnh6F6ecHQKE2tEhoja5NhFrLIS54
 6R9xu8WzHt3IZ7fExORAn2ZhnvjU0KOKwSDBFmFPVsNuS0R58P74iUdwLv+J7V0LQ8YrGdTsx9V
 LWNLIQ3cBbashCOAkAWClZR+MeH+DlyNT531DaNQvB7MFAqoeVRVvi8mcY5kmDUoPQiKbzDBqgq
 Po1QD7jevLDDKWbDhI+uFqQvEVr8/+0J7LQLNhUnyUPVtZTT1dYNjWDewAm8cpFAeK1uLDPy3CJ
 2DmBOwgm
X-Received: by 2002:a17:902:930a:b0:2d6:e074:9cad with SMTP id
 d9443c01a7336-2db1236f4femr349937195ad.6.1788943371077; 
 Wed, 09 Sep 2026 01:42:51 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2db56c2a1f1sm38328225ad.78.2026.09.09.01.42.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2026 01:42:50 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, richard.henderson@linaro.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, Max Chou <max.chou@sifive.com>
Subject: [PATCH 5/6] tests/tcg/riscv64: Add vector fault-only-first page probe
 test
Date: Wed,  9 Sep 2026 16:41:52 +0800
Message-ID: <20260909084154.223529-6-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909084154.223529-1-max.chou@sifive.com>
References: <20260909084154.223529-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=max.chou@sifive.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Add a bare-metal test for vector fault-only-first loads whose
first-element probe crosses a page boundary. The test covers a body
access that crosses the boundary after the first element, and a first
element that itself straddles the boundary, checking that both cases
report a full vl and vstart of 0 rather than faulting on a mapped page.

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 tests/tcg/riscv64/Makefile.softmmu-target |  9 ++-
 tests/tcg/riscv64/test-rvv-ldst-ff-page.S | 83 +++++++++++++++++++++++
 2 files changed, 90 insertions(+), 2 deletions(-)
 create mode 100644 tests/tcg/riscv64/test-rvv-ldst-ff-page.S

diff --git a/tests/tcg/riscv64/Makefile.softmmu-target b/tests/tcg/riscv64/Makefile.softmmu-target
index 9e0e0490753..93c4e58e0c2 100644
--- a/tests/tcg/riscv64/Makefile.softmmu-target
+++ b/tests/tcg/riscv64/Makefile.softmmu-target
@@ -86,14 +86,16 @@ run-test-vle32ff: test-vle32ff
 test-vle32ff: CFLAGS += -march=rv64gcv
 
 RVV_LDST_MARCH = -march=rv64gcv
-RVV_LDST_TESTS = test-rvv-ldst-ff-pmp test-rvv-ldst-us-pmp
+RVV_LDST_TESTS = test-rvv-ldst-ff-pmp test-rvv-ldst-us-pmp \
+	test-rvv-ldst-ff-page
 CLEANFILES += $(RVV_LDST_TESTS)
 
 $(RVV_LDST_TESTS): %: %.S rvv-ldst.inc $(LINK_SCRIPT)
 	$(CC) $(CFLAGS) $(RVV_LDST_MARCH) $< -Wa,--noexecstack -c -o $@.o
 	$(LD) $(LDFLAGS) $@.o -o $@
 
-EXTRA_RUNS += run-test-rvv-ldst-ff-pmp run-test-rvv-ldst-us-pmp
+EXTRA_RUNS += run-test-rvv-ldst-ff-pmp run-test-rvv-ldst-us-pmp \
+	run-test-rvv-ldst-ff-page
 
 run-test-rvv-ldst-ff-pmp: test-rvv-ldst-ff-pmp
 	$(call run-test, $<, $(QEMU) -cpu rv64$(comma)v=true$(comma)vlen=128$(comma)elen=64$(comma)vext_spec=v1.0$(comma)rvv_ta_all_1s=true$(comma)rvv_ma_all_1s=true $(QEMU_OPTS)$<)
@@ -101,5 +103,8 @@ run-test-rvv-ldst-ff-pmp: test-rvv-ldst-ff-pmp
 run-test-rvv-ldst-us-pmp: test-rvv-ldst-us-pmp
 	$(call run-test, $<, $(QEMU) -cpu rv64$(comma)v=true$(comma)vlen=128$(comma)elen=64$(comma)vext_spec=v1.0$(comma)rvv_ta_all_1s=true$(comma)rvv_ma_all_1s=true $(QEMU_OPTS)$<)
 
+run-test-rvv-ldst-ff-page: test-rvv-ldst-ff-page
+	$(call run-test, $<, $(QEMU) -cpu rv64$(comma)v=true$(comma)vlen=128$(comma)elen=64$(comma)vext_spec=v1.0 $(QEMU_OPTS)$<)
+
 # We don't currently support the multiarch system tests
 undefine MULTIARCH_TESTS
diff --git a/tests/tcg/riscv64/test-rvv-ldst-ff-page.S b/tests/tcg/riscv64/test-rvv-ldst-ff-page.S
new file mode 100644
index 00000000000..63b1e0ac8a8
--- /dev/null
+++ b/tests/tcg/riscv64/test-rvv-ldst-ff-page.S
@@ -0,0 +1,83 @@
+/*
+ * RISC-V vector fault-only-first probe page-crossing tests
+ *
+ * A first-element probe validates the mapping only for the bytes that
+ * the first (fault-only) element itself touches, then lets the
+ * remaining elements of the vector body fault normally.  An
+ * implementation that instead probes the whole multi-element access
+ * range as one host operation aborts as soon as that range crosses a
+ * page boundary, even though every page involved is in fact mapped.
+ *
+ * Case 1 crosses the page boundary only in the vector body, after the
+ * first element.  Case 2 crosses it inside the first element itself,
+ * so the first-element probe must span both pages it touches.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+    #include "rvv-ldst.inc"
+
+    .text
+    .global _start
+_start:
+    RVV_ENABLE
+    lla             t0, trap_handler
+    csrw            mtvec, t0
+
+    /*
+     * Case 1: the body crosses the page boundary; the first element does not.
+     */
+    CASE    1
+    li              t0, 3
+    vsetvli         t1, t0, e8, m1, tu, mu
+    lla             a0, cross_segment
+    vlseg2e8ff.v    v2, (a0)
+    csrr            t0, vl
+    ASSERT_EQ       t0, 3
+    csrr            t0, vstart
+    ASSERT_EQ       t0, 0
+    lla             a0, output
+    vsseg2e8.v      v2, (a0)
+    lbu             t0, 5(a0)
+    ASSERT_EQ       t0, 0x66
+
+    /*
+     * Case 2: the first segment element itself straddles the page boundary.
+     */
+    CASE    2
+    li              t0, 3
+    vsetvli         t1, t0, e8, m1, tu, mu
+    lla             a0, straddle_segment
+    vlseg2e8ff.v    v2, (a0)
+    csrr            t0, vl
+    ASSERT_EQ       t0, 3
+    csrr            t0, vstart
+    ASSERT_EQ       t0, 0
+    lla             a0, output
+    vsseg2e8.v      v2, (a0)
+    lbu             t0, 5(a0)
+    ASSERT_EQ       t0, 0xf6
+    li              a0, 0
+exit:
+    SEMI_EXIT
+    FAIL
+
+    /*
+     * No trap is expected: a spurious fault from the page-crossing probe
+     * is the very thing under test.  Report the case number rather than
+     * vectoring to the reset value of mtvec and hanging until the
+     * harness timeout.
+     */
+    .balign 4
+trap_handler:
+    j               fail
+
+    .data
+    .balign 16
+semiargs: .space 16
+    .balign 4096
+    .space 4094
+cross_segment: .byte 0x11, 0x22, 0x33, 0x44, 0x55, 0x66
+output: .space 6
+    .balign 4096
+    .space 4095
+straddle_segment: .byte 0xa1, 0xb2, 0xc3, 0xd4, 0xe5, 0xf6
-- 
2.43.0


