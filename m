Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E62ACC79F8C
	for <qemu-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 08:44:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x4DtT-0008JA-Ch; Wed, 09 Sep 2026 04:42:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1x4DtR-0008Iq-KH
 for qemu-riscv@nongnu.org; Wed, 09 Sep 2026 04:42:57 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1x4DtP-0003KM-LT
 for qemu-riscv@nongnu.org; Wed, 09 Sep 2026 04:42:57 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-2d71d1cc8b2so42022525ad.1
 for <qemu-riscv@nongnu.org>; Wed, 09 Sep 2026 01:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1788943374; x=1789548174; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=YGg/RvrSoKzoUlW9nA/79/jfYq8eoWdPwOwzok+Tzg4=;
 b=MOeuW42xf3w0f02RtiD5F2KkrjDHKbniAHcUSCT+Y8GcQAfpyvAeVHMVQ1RjX1xPti
 uRhBxEbbn1Mxkq/YAtgJjK8JUtDZYbMV4ZOmFpDAFSNy4j8yU2Y7V3a64RwmNjA1hcFl
 1BVYFtF6PuFDVT3skukS4j+dUNUeh5FpLUpq5JYYqrd5bQ8Xcux7yLwPIZO8oaxdr9MS
 ksaTewBdYzg8aoIOSmtuKedPd4M3NQuqBquMVBkFQx7UraJroba6PM/vIqGnH3RSag4w
 IZZ/ia4JNkDmwtey/QnR4SilnoQCwUIkBUqNeCs/FGAZV17U2SzB6CFJIkpta6GXcRa7
 cFBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788943374; x=1789548174;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=YGg/RvrSoKzoUlW9nA/79/jfYq8eoWdPwOwzok+Tzg4=;
 b=h61DKXf9jFdGTXJBDYBd2HuJu6Wcxd32CpMGQe5a6uNAjOVmOx5JsMLbuGVjmOnhnZ
 k1R472h9QTFajTXUHRa5gTS9Sgl6uj7+Ga1DIPvi5Y4DUcuiUdTnAiURc8AIH512qehm
 LbHk9nVZu5zWW5MeG1IqfzmOFltayN52WfSQJky4Ytcn00j8rHaVnQsZVhshJ4aAvpM3
 ZWBU3qFetd1r3NohZBS500mnSCdDSAoByg8u05tl7TcGVFSak3NHwEY0hfTsQtIKsJb6
 /9XQ36t0sv+MzkwPUTrzFQ4JHbkT+aAjuV5kYpQ14qNZkQ+sHlVUrBOPfDNJA+qdsMrj
 w92A==
X-Forwarded-Encrypted: i=1;
 AKwUvBzqDFp2A4SEPjDLw17t9V5PpDtmCRyMr4+w6Hpl1iuv5w1evQ+shV00rPkU5RQc8MnODm28nfFns44b@nongnu.org
X-Gm-Message-State: AFuF++mojDRZefUmKV3OiaiGSIEKuu34W8prqFJqeTjV5+JQKjwW3t7S
 KFexhwNrGN4Zavl4+SZp6K84/C5cQattTEiY9j3amD3q0H8Ixay5wVjLE32avX/3npY=
X-Gm-Gg: AYBFou0MP4Q0r6qW28Bc6Gi/z6DAeTSFG/0BxSoO2ixzPcRY98c/fd8iBUasdfz060N
 gYmuQ3esmn79rayZ/EP+il/J7WRNUZRQy/A5ShjF2rQxEAk2fqg2FsIEx1n/S4i9joaI0q+EDL2
 FP1Bd9/qT4zZ6iSxBksmN8OPO9H/K2qGieEJIiL+6FMS2iHzJM+p9CrJZrTUeDlBC0IKH0cZnMY
 /u9xeb4rUwvDACQzRoJUZiHZd9eG+EYcmpQD3Eeo3adJqP31WoyEyqyG/QsXHHEkRGf5++3D1MR
 E4PXFGZNrsycae9xPTZyaxSn9k6FD4dtW2GpvADOGI5y42gpZsKhYwaKSZjx+sKJZT0r+6ru6DY
 zhTKoVaIp0OOXvZUpwe47PDysT/+Dbds5WnQQ4P/wgn29QtRWwIedihOeox6mg7NVNGj4oQyokC
 sjuqf0lrPuNT2zJscmpNA4aj8LGUgMi2uQcO6ZDRzw5pbqZRt83DiXKJD18PmTZ8z6TclsTz3vT
 Wr1Hy1bxpvkcfc9qx2eFHZSJnygE42CiOZvZ+q6wfFRbpyE8dSY4YMJHI1/vkEFc54XoYnT1XM=
X-Received: by 2002:a17:903:1ae3:b0:2d9:54:fc69 with SMTP id
 d9443c01a7336-2db1247f4d0mr487022885ad.7.1788943374212; 
 Wed, 09 Sep 2026 01:42:54 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2db56c2a1f1sm38328225ad.78.2026.09.09.01.42.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2026 01:42:53 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, richard.henderson@linaro.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, Max Chou <max.chou@sifive.com>
Subject: [PATCH 6/6] tests/tcg/riscv64: Add vector segment PMP region spanning
 test
Date: Wed,  9 Sep 2026 16:41:53 +0800
Message-ID: <20260909084154.223529-7-max.chou@sifive.com>
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

A segment load performs nf independent eew-sized accesses, so PMP checks
each field on its own.  Probing the whole nf * eew segment as one range
instead reports a fault whenever a PMP boundary falls inside a segment.

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 tests/tcg/riscv64/Makefile.softmmu-target |  21 +++-
 tests/tcg/riscv64/test-rvv-ldst-seg-pmp.S | 141 ++++++++++++++++++++++
 2 files changed, 160 insertions(+), 2 deletions(-)
 create mode 100644 tests/tcg/riscv64/test-rvv-ldst-seg-pmp.S

diff --git a/tests/tcg/riscv64/Makefile.softmmu-target b/tests/tcg/riscv64/Makefile.softmmu-target
index 93c4e58e0c2..aea1e7fcb15 100644
--- a/tests/tcg/riscv64/Makefile.softmmu-target
+++ b/tests/tcg/riscv64/Makefile.softmmu-target
@@ -87,7 +87,8 @@ test-vle32ff: CFLAGS += -march=rv64gcv
 
 RVV_LDST_MARCH = -march=rv64gcv
 RVV_LDST_TESTS = test-rvv-ldst-ff-pmp test-rvv-ldst-us-pmp \
-	test-rvv-ldst-ff-page
+	test-rvv-ldst-ff-page \
+	test-rvv-ldst-seg-pmp
 CLEANFILES += $(RVV_LDST_TESTS)
 
 $(RVV_LDST_TESTS): %: %.S rvv-ldst.inc $(LINK_SCRIPT)
@@ -95,7 +96,8 @@ $(RVV_LDST_TESTS): %: %.S rvv-ldst.inc $(LINK_SCRIPT)
 	$(LD) $(LDFLAGS) $@.o -o $@
 
 EXTRA_RUNS += run-test-rvv-ldst-ff-pmp run-test-rvv-ldst-us-pmp \
-	run-test-rvv-ldst-ff-page
+	run-test-rvv-ldst-ff-page \
+	run-test-rvv-ldst-seg-pmp
 
 run-test-rvv-ldst-ff-pmp: test-rvv-ldst-ff-pmp
 	$(call run-test, $<, $(QEMU) -cpu rv64$(comma)v=true$(comma)vlen=128$(comma)elen=64$(comma)vext_spec=v1.0$(comma)rvv_ta_all_1s=true$(comma)rvv_ma_all_1s=true $(QEMU_OPTS)$<)
@@ -106,5 +108,20 @@ run-test-rvv-ldst-us-pmp: test-rvv-ldst-us-pmp
 run-test-rvv-ldst-ff-page: test-rvv-ldst-ff-page
 	$(call run-test, $<, $(QEMU) -cpu rv64$(comma)v=true$(comma)vlen=128$(comma)elen=64$(comma)vext_spec=v1.0 $(QEMU_OPTS)$<)
 
+run-test-rvv-ldst-seg-pmp: test-rvv-ldst-seg-pmp
+	$(call run-test, $<, $(QEMU) -cpu rv64$(comma)v=true$(comma)vlen=128$(comma)elen=64$(comma)vext_spec=v1.0 $(QEMU_OPTS)$<)
+
+PMP_TESTS = test-pmp-interior-entry
+CLEANFILES += $(PMP_TESTS)
+
+$(PMP_TESTS): %: %.S rvv-ldst.inc $(LINK_SCRIPT)
+	$(CC) $(CFLAGS) -march=rv64gc_zicboz $< -Wa,--noexecstack -c -o $@.o
+	$(LD) $(LDFLAGS) $@.o -o $@
+
+EXTRA_RUNS += run-test-pmp-interior-entry
+
+run-test-pmp-interior-entry: test-pmp-interior-entry
+	$(call run-test, $<, $(QEMU) -cpu rv64$(comma)zicboz=true$(comma)cboz_blocksize=64 $(QEMU_OPTS)$<)
+
 # We don't currently support the multiarch system tests
 undefine MULTIARCH_TESTS
diff --git a/tests/tcg/riscv64/test-rvv-ldst-seg-pmp.S b/tests/tcg/riscv64/test-rvv-ldst-seg-pmp.S
new file mode 100644
index 00000000000..9b3703ba338
--- /dev/null
+++ b/tests/tcg/riscv64/test-rvv-ldst-seg-pmp.S
@@ -0,0 +1,141 @@
+/*
+ * RISC-V vector segment load spanning two PMP regions
+ *
+ * A segment load performs nf independent eew-sized accesses, so each
+ * field is checked against PMP on its own. A probe that presents the
+ * whole nf * eew segment as one range instead reports a fault whenever
+ * a PMP boundary falls inside the segment, even though every access the
+ * instruction actually performs is permitted.
+ *
+ * PMP layout (locked entries, lowest number wins; everything outside
+ * the test page is unmatched and so fully accessible from M-mode):
+ *   pmp0: NA4   buf+0,     L, R--   field 0 readable
+ *   pmp1: NA4   buf+4,     L, R--   field 1 readable, adjacent to pmp0
+ *   pmp2: NAPOT test page, L, RW-   lower-priority page allow
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+    #include "rvv-ldst.inc"
+
+    .text
+    .global _start
+_start:
+    RVV_ENABLE
+    lla    t0, trap_handler
+    csrw   mtvec, t0
+
+    /*
+     * Trap handler protocol:
+     *   s0: expected mcause (0: no trap expected)
+     *   s1: expected mtval  (-1: any mtval accepted)
+     *   s2: traps taken     s3: vstart seen at last trap
+     *   s4: traps expected  s5: mtval seen at last trap
+     */
+    li      s0, 0
+    li      s1, 0
+    li      s2, 0
+    li      s3, -1
+    li      s4, 0
+
+    /* Program the locked PMP entries; single locking cfg write last. */
+    lla     t0, buf
+    srli    t0, t0, 2
+    csrw    pmpaddr0, t0
+    lla     t0, buf + 4
+    srli    t0, t0, 2
+    csrw    pmpaddr1, t0
+    lla     t0, pmp_page
+    srli    t0, t0, 2
+    ori     t0, t0, 0x1ff
+    csrw    pmpaddr2, t0
+    li      t0, 0x9b9191
+    csrw    pmpcfg0, t0
+
+    /* Case 1: a 4-byte load fully inside pmp0 is granted. */
+    CASE    1
+    lla         t1, buf
+    lw          t0, 0(t1)
+    CHECK_NO_TRAP
+    ASSERT_EQ   t0, 0x00dd0000
+
+    /* Case 2: a 4-byte load fully inside pmp1 is granted. */
+    CASE    2
+    lla         t1, buf
+    lw          t0, 4(t1)
+    CHECK_NO_TRAP
+    ASSERT_EQ   t0, 0x00dd0001
+
+    /*
+     * Case 3: control.  One 8-byte access covers both entries and is
+     * contained by neither, so it must fault however permissive the
+     * two entries are on their own.
+     */
+    CASE    3
+    li          s0, 5
+    lla         s1, buf
+    lla         t1, buf
+    ld          t0, 0(t1)
+    CHECK_TRAP
+
+    /*
+     * Case 4: vlseg2e32.v performs one 4-byte access per field, each
+     * contained by its own entry, so the segment must load.  A probe
+     * covering the whole 8-byte segment reports a load access fault
+     * here instead.
+     */
+    CASE    4
+    PREFILL
+    vsetivli    zero, 1, e32, m1, ta, ma
+    lla         a0, buf
+    vlseg2e32.v v2, (a0)
+    CHECK_NO_TRAP
+    CHECK_VELEM v2, 0, 0x00dd0000
+    CHECK_VELEM v3, 0, 0x00dd0001
+
+    /*
+     * Case 5: the same on the fault-only-first path, which must not
+     * truncate vl either.
+     */
+    CASE    5
+    PREFILL
+    vsetivli    zero, 1, e32, m1, ta, ma
+    lla         a0, buf
+    vlseg2e32ff.v v2, (a0)
+    csrr        t2, vl
+    CHECK_NO_TRAP
+    ASSERT_EQ   t2, 1
+    CHECK_VELEM v2, 0, 0x00dd0000
+    CHECK_VELEM v3, 0, 0x00dd0001
+
+    li    a0, 0
+exit:
+    SEMI_EXIT
+    FAIL
+
+    .balign 4
+trap_handler:
+    csrr    t5, mcause
+    bne     t5, s0, fail
+    csrr    s5, mtval
+    li      t5, -1
+    beq     s1, t5, 1f
+    bne     s5, s1, fail
+1:
+    csrr    s3, vstart
+    addi    s2, s2, 1
+    csrw    vstart, zero
+    csrr    t5, mepc
+    addi    t5, t5, 4
+    csrw    mepc, t5
+    mret
+
+    .data
+    .balign 16
+semiargs: .space 16
+
+    /* One dedicated page governed by the locked NAPOT RW entry. */
+    .balign 4096
+pmp_page:
+buf:
+    .word   0x00dd0000, 0x00dd0001, 0x00dd0002, 0x00dd0003
+    .skip   4080
-- 
2.43.0


