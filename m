Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFBA1EB64D7
	for <qemu-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 09:14:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qFABs-00075a-TR; Fri, 30 Jun 2023 05:13:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1qFABp-00073w-3f
 for qemu-riscv@nongnu.org; Fri, 30 Jun 2023 05:13:17 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1qFABm-0000Ak-LZ
 for qemu-riscv@nongnu.org; Fri, 30 Jun 2023 05:13:16 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-51d93425853so1717901a12.1
 for <qemu-riscv@nongnu.org>; Fri, 30 Jun 2023 02:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull.eu; s=google; t=1688116392; x=1690708392;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=427hG0VZLBAHC0MKH9qijIzaZ3qYnVMMsCFX2foNeKg=;
 b=hQlp5dU31jnGajW1E3kJv7IitGXmtEUIOzW1kn+8qOBaxnNzSo5dtDLIo4k1KTB0vy
 AiHvmZM+zVY4P/5ekHupfOd6lVS9IWUqr5juIPZS+LAyigOKmwVodSABTy56nvyiRWmp
 dIvM5MVYLPQUaIBQiUwcIGeS0/3xGuu9FnXiFU0eXKAsRrgl7AHHI+T3gjvyAqQTpGER
 FBT/NkZG6GvUvRIqNQwJqobCbG/9uQh4/6Zn5oO5wp0fY/fTlUqpnI0Qm/NfVVWGil+q
 ASE7TxVncEXUrRnsp8AZXYk090faXBUO9R7xPBIS4U1O9d+l3II0UD5+Efrw3e05fgYR
 pzyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688116392; x=1690708392;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=427hG0VZLBAHC0MKH9qijIzaZ3qYnVMMsCFX2foNeKg=;
 b=fkM/alC4A4jUDDHFg8/3VDl1RW/6tboaHbygZrKE/9U5tT1+GOZl67xzIFCQyE1geD
 kned1q/Y/Xq1/FcgFjKxx/CSdEr4VUJvPPkVjdsMHNkPxx93U8VOG1iEhLbPfFJe1A5n
 46daFldZX7Y3S3VTs5yTaQLnDVbaPc+41Q2Y7rG4IsJDMnGOVvPg44fBXuFZyuV0kt7G
 8JI5hB0Vs7qf5tUrNFjcTH8ijF4JpgwbniA+UsMIPVFtNZfMhR1lNoB7aBBUlFMZAzBP
 dH2+pugniMDw1wlWbG1dDIr4+5cuTkJdZW2yjuWixe0PsOmY6/GkEiRKEP0Xnf1Qp71z
 +sGA==
X-Gm-Message-State: ABy/qLbupspp/OOWtg0kXmTHR+k2A3eiWcRmB3JojbG/9jZ3GhlgTT+I
 MBY5okNdSvmcfkx4eWV99seSiLdXL0q3LWDRSe0=
X-Google-Smtp-Source: APBJJlGfoCrjhY0Q908NQOP7qVm7zR7qzmpnSc8auUaPWZX66O8tXr+OHqWjOGZu2N//LkuQSSWaJQ==
X-Received: by 2002:aa7:c253:0:b0:51d:a237:d45b with SMTP id
 y19-20020aa7c253000000b0051da237d45bmr1244097edo.36.1688116391763; 
 Fri, 30 Jun 2023 02:13:11 -0700 (PDT)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 lc1-20020a170906f90100b00988e953a586sm7869892ejb.61.2023.06.30.02.13.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jun 2023 02:13:11 -0700 (PDT)
From: Christoph Muellner <christoph.muellner@vrull.eu>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Jeff Law <jeffreyalaw@gmail.com>,
 Tsukasa OI <research_trasio@irq.a4lg.com>, liweiwei@iscas.ac.cn,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Rob Bradford <rbradford@rivosinc.com>
Cc: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>
Subject: [PATCH v4 3/3] DO NOT MERGE: tests/tcg/riscv64: Add test for
 fcvtmod.w.d
Date: Fri, 30 Jun 2023 11:13:03 +0200
Message-ID: <20230630091303.1676486-4-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230630091303.1676486-1-christoph.muellner@vrull.eu>
References: <20230630091303.1676486-1-christoph.muellner@vrull.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Christoph Müllner <christoph.muellner@vrull.eu>

This patch introduces a test for Zfa's fcvtmod.w.d instruction.
The test cases test for correct results and flag behaviour.
Note, that the Zfa specification requires fcvtmod's flag behaviour
to be identical to a fcvt with the same operands (which is also
tested).

DO NOT MERGE!!!
Although this test works just fine, it requires a toolchain
that supports the Zfa extension. Unless this is available
this patch cannot be merged.
DO NOT MERGE!!!

Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
---
 tests/tcg/riscv64/Makefile.target |   6 +
 tests/tcg/riscv64/test-fcvtmod.c  | 354 ++++++++++++++++++++++++++++++
 2 files changed, 360 insertions(+)
 create mode 100644 tests/tcg/riscv64/test-fcvtmod.c

diff --git a/tests/tcg/riscv64/Makefile.target b/tests/tcg/riscv64/Makefile.target
index 9973ba3b5f..54c3d83458 100644
--- a/tests/tcg/riscv64/Makefile.target
+++ b/tests/tcg/riscv64/Makefile.target
@@ -9,3 +9,9 @@ TESTS += noexec
 TESTS += test-noc
 test-noc: LDFLAGS = -nostdlib -static
 run-test-noc: QEMU_OPTS += -cpu rv64,c=false
+
+# Test for fcvtmod
+TESTS += test-fcvtmod
+test-fcvtmod: CFLAGS += -march=rv64imafdc_zfa
+test-fcvtmod: LDFLAGS = -nostdlib -static
+run-test-fcvtmod: QEMU_OPTS += -cpu rv64,d=true,Zfa=true
diff --git a/tests/tcg/riscv64/test-fcvtmod.c b/tests/tcg/riscv64/test-fcvtmod.c
new file mode 100644
index 0000000000..c124459314
--- /dev/null
+++ b/tests/tcg/riscv64/test-fcvtmod.c
@@ -0,0 +1,354 @@
+#include <stdio.h>
+#include <stddef.h>
+#include <stdint.h>
+
+#define FFLAG_NX_POS 0 /* inexact */
+#define FFLAG_UF_POS 1 /* underflow */
+#define FFLAG_OF_POS 2 /* overflow */
+#define FFLAG_DZ_POS 3 /* divide by zero */
+#define FFLAG_NV_POS 4 /* invalid operation */
+#define FFLAG_DN_POS 5 /* input denormal (not defined for RISC-V) */
+
+#define FFLAG_NV (1<<FFLAG_NV_POS)
+#define FFLAG_DZ (1<<FFLAG_DZ_POS)
+#define FFLAG_OF (1<<FFLAG_OF_POS)
+#define FFLAG_UF (1<<FFLAG_UF_POS)
+#define FFLAG_NX (1<<FFLAG_NX_POS)
+#define FFLAG_DN (1<<FFLAG_DN_POS)
+
+typedef struct fp64_fcvt_fcvtmod_testcase {
+    const char* name;
+    union {
+        uint64_t inp_lu;
+        double inp_lf;
+    };
+    uint64_t exp_fcvt;
+    uint8_t exp_fcvt_fflags;
+    uint64_t exp_fcvtmod;
+    uint8_t exp_fcvtmod_fflags;
+} fp64_fcvt_fcvtmod_testcase_t;
+
+void print_fflags(uint8_t fflags)
+{
+    int set = 0;
+
+    if (fflags == 0) {
+        printf("-");
+        return;
+    }
+
+    if (fflags & FFLAG_NV) {
+        printf("%sFFLAG_NV", set ? " | " : "");
+        set = 1;
+    }
+    if (fflags & FFLAG_DZ) {
+        printf("%sFFLAG_DZ", set ? " | " : "");
+        set = 1;
+    }
+    if (fflags & FFLAG_OF) {
+        printf("%sFFLAG_OF", set ? " | " : "");
+        set = 1;
+    }
+    if (fflags & FFLAG_UF) {
+        printf("%sFFLAG_UF", set ? " | " : "");
+        set = 1;
+    }
+    if (fflags & FFLAG_NX) {
+        printf("%sFFLAG_NX", set ? " | " : "");
+        set = 1;
+    }
+    if (fflags & FFLAG_DN) {
+        printf("%sFFLAG_DN", set ? " | " : "");
+        set = 1;
+    }
+}
+
+/* Clear all FP flags. */
+static inline void clear_fflags()
+{
+    __asm__ __volatile__("fsflags zero");
+}
+
+/* Read all FP flags. */
+static inline uint8_t get_fflags()
+{
+    uint64_t v;
+    __asm__ __volatile__("frflags %0" : "=r"(v));
+    return (uint8_t)v;
+}
+
+/* Move input value (without conversations) into an FP register. */
+static inline double do_fmv_d_x(uint64_t inp)
+{
+    double fpr;
+    __asm__ __volatile__("fmv.d.x %0, %1" : "=fp"(fpr) : "r"(inp));
+    return fpr;
+}
+
+static inline uint64_t do_fcvt_w_d(uint64_t inp, uint8_t *fflags)
+{
+    double fpr = do_fmv_d_x(inp);
+
+    clear_fflags();
+
+    uint64_t ret;
+    __asm__ __volatile__("fcvt.w.d %0, %1, rtz"
+                         : "=r"(ret) : "fp"(fpr));
+
+    *fflags = get_fflags();
+
+    return ret;
+}
+
+static inline uint64_t do_fcvtmod_w_d(uint64_t inp, uint8_t *fflags)
+{
+    double fpr = do_fmv_d_x(inp);
+
+    clear_fflags();
+
+    uint64_t ret;
+    __asm__ __volatile__("fcvtmod.w.d %0, %1, rtz"
+                         : "=r"(ret) : "fp"(fpr));
+
+    *fflags = get_fflags();
+
+    return ret;
+}
+
+static const fp64_fcvt_fcvtmod_testcase_t tests[] = {
+    /* Zero (exp=0, frac=0) */
+    { .name = "+0.0",
+      .inp_lf = 0x0p0,
+      .exp_fcvt = 0x0000000000000000,
+      .exp_fcvt_fflags = 0,
+      .exp_fcvtmod = 0x0000000000000000,
+      .exp_fcvtmod_fflags = 0 },
+    { .name = "-0.0",
+      .inp_lf = -0x0p0,
+      .exp_fcvt = 0x0000000000000000,
+      .exp_fcvt_fflags = 0,
+      .exp_fcvtmod = 0x0000000000000000,
+      .exp_fcvtmod_fflags = 0 },
+
+    /* Subnormal: exp=0 frac!=0 */
+    { .name = "Subnormal frac=1",
+      .inp_lu = 0x0000000000000001,
+      .exp_fcvt = 0x0000000000000000,
+      .exp_fcvt_fflags = FFLAG_NX,
+      .exp_fcvtmod = 0,
+      .exp_fcvtmod_fflags = FFLAG_NX },
+    { .name = "Subnormal frac=0xf..f",
+      .inp_lu = 0x0000ffffffffffff,
+      .exp_fcvt = 0x0000000000000000,
+      .exp_fcvt_fflags = FFLAG_NX,
+      .exp_fcvtmod = 0,
+      .exp_fcvtmod_fflags = FFLAG_NX },
+    { .name = "Neg subnormal frac=1",
+      .inp_lu = 0x0000000000000001,
+      .exp_fcvt = 0x0000000000000000,
+      .exp_fcvt_fflags = FFLAG_NX,
+      .exp_fcvtmod = 0,
+      .exp_fcvtmod_fflags = FFLAG_NX },
+    { .name = "Neg subnormal frac=0xf..f",
+      .inp_lu = 0x8000ffffffffffff,
+      .exp_fcvt = 0x0000000000000000,
+      .exp_fcvt_fflags = FFLAG_NX,
+      .exp_fcvtmod = 0,
+      .exp_fcvtmod_fflags = FFLAG_NX },
+
+    /* Infinity: exp=0x7ff, frac=0 */
+    { .name = "+INF",
+      .inp_lu = 0x7ff0000000000000,
+      .exp_fcvt = 0x000000007fffffff, /* int32 max */
+      .exp_fcvt_fflags = FFLAG_NV,
+      .exp_fcvtmod = 0,
+      .exp_fcvtmod_fflags = FFLAG_NV },
+    { .name = "-INF",
+      .inp_lu = 0xfff0000000000000,
+      .exp_fcvt = 0xffffffff80000000, /* int32 min */
+      .exp_fcvt_fflags = FFLAG_NV,
+      .exp_fcvtmod = 0,
+      .exp_fcvtmod_fflags = FFLAG_NV },
+
+    /* NaN: exp=7ff, frac!=0 */
+    { .name = "canonical NaN",
+      .inp_lu = 0x7ff8000000000000,
+      .exp_fcvt = 0x000000007fffffff, /* int32 max */
+      .exp_fcvt_fflags = FFLAG_NV,
+      .exp_fcvtmod = 0,
+      .exp_fcvtmod_fflags = FFLAG_NV },
+    { .name = "non-canonical NaN",
+      .inp_lu = 0x7ff8000000100000,
+      .exp_fcvt = 0x000000007fffffff, /* int32 min */
+      .exp_fcvt_fflags = FFLAG_NV,
+      .exp_fcvtmod = 0,
+      .exp_fcvtmod_fflags = FFLAG_NV },
+
+    /* Normal numbers: exp!=0, exp!=7ff */
+    { .name = "+smallest normal value",
+      .inp_lu = 0x0010000000000000,
+      .exp_fcvt = 0,
+      .exp_fcvt_fflags = FFLAG_NX,
+      .exp_fcvtmod = 0,
+      .exp_fcvtmod_fflags = FFLAG_NX },
+    { .name = "-smallest normal value",
+      .inp_lu = 0x8010000000000000,
+      .exp_fcvt = 0,
+      .exp_fcvt_fflags = FFLAG_NX,
+      .exp_fcvtmod = 0,
+      .exp_fcvtmod_fflags = FFLAG_NX },
+
+    { .name = "+0.5",
+      .inp_lf = 0x1p-1,
+      .exp_fcvt = 0,
+      .exp_fcvt_fflags = FFLAG_NX,
+      .exp_fcvtmod = 0,
+      .exp_fcvtmod_fflags = FFLAG_NX },
+    { .name = "-0.5",
+      .inp_lf = -0x1p-1,
+      .exp_fcvt = 0,
+      .exp_fcvt_fflags = FFLAG_NX,
+      .exp_fcvtmod = 0,
+      .exp_fcvtmod_fflags = FFLAG_NX },
+
+    { .name = "+value just below 1.0",
+      .inp_lu = 0x3fefffffffffffff,
+      .exp_fcvt = 0,
+      .exp_fcvt_fflags = FFLAG_NX,
+      .exp_fcvtmod = 0,
+      .exp_fcvtmod_fflags = FFLAG_NX },
+    { .name = "-value just above -1.0",
+      .inp_lu = 0xbfefffffffffffff,
+      .exp_fcvt = 0,
+      .exp_fcvt_fflags = FFLAG_NX,
+      .exp_fcvtmod = 0,
+      .exp_fcvtmod_fflags = FFLAG_NX },
+
+    { .name = "+1.0",
+      .inp_lf = 0x1p0,
+      .exp_fcvt = 0x0000000000000001,
+      .exp_fcvt_fflags = 0,
+      .exp_fcvtmod = 0x0000000000000001,
+      .exp_fcvtmod_fflags = 0 },
+    { .name = "-1.0",
+      .inp_lf = -0x1p0,
+      .exp_fcvt = 0xffffffffffffffff,
+      .exp_fcvt_fflags = 0,
+      .exp_fcvtmod = 0xffffffffffffffff,
+      .exp_fcvtmod_fflags = 0 },
+
+    { .name = "+1.5",
+      .inp_lu = 0x3ff8000000000000,
+      .exp_fcvt = 1,
+      .exp_fcvt_fflags = FFLAG_NX,
+      .exp_fcvtmod = 1,
+      .exp_fcvtmod_fflags = FFLAG_NX },
+    { .name = "-1.5",
+      .inp_lu = 0xbff8000000000000,
+      .exp_fcvt = 0xffffffffffffffff,
+      .exp_fcvt_fflags = FFLAG_NX,
+      .exp_fcvtmod = 0xffffffffffffffff,
+      .exp_fcvtmod_fflags = FFLAG_NX },
+
+    { .name = "+max int32 (2147483647)",
+      .inp_lu = 0x41dfffffffc00000,
+      .exp_fcvt = 0x000000007fffffff,
+      .exp_fcvt_fflags = 0,
+      .exp_fcvtmod = 0x000000007fffffff,
+      .exp_fcvtmod_fflags = 0 },
+    { .name = "+max int32 +1 (2147483648)",
+      .inp_lf = 0x1p31,
+      .exp_fcvt = 0x000000007fffffff,
+      .exp_fcvt_fflags = FFLAG_NV,
+      .exp_fcvtmod = (uint64_t)-2147483648l, /* int32 min */
+      .exp_fcvtmod_fflags = FFLAG_NV },
+    { .name = "+max int32 +2 (2147483649)",
+      .inp_lu = 0x41e0000000200000,
+      .exp_fcvt = 0x000000007fffffff,
+      .exp_fcvt_fflags = FFLAG_NV,
+      .exp_fcvtmod = (uint64_t)-2147483647l, /* int32 min +1 */
+      .exp_fcvtmod_fflags = FFLAG_NV },
+
+    { .name = "-max int32 (-2147483648)",
+      .inp_lf = -0x1p31,
+      .exp_fcvt = 0xffffffff80000000,
+      .exp_fcvt_fflags = 0,
+      .exp_fcvtmod = 0xffffffff80000000,
+      .exp_fcvtmod_fflags = 0 },
+    { .name = "-max int32 -1 (-2147483649)",
+      .inp_lf = -0x1.00000002p+31,
+      .exp_fcvt = 0xffffffff80000000,
+      .exp_fcvt_fflags = FFLAG_NV,
+      .exp_fcvtmod = 2147483647, /* int32 max */
+      .exp_fcvtmod_fflags = FFLAG_NV },
+    { .name = "-max int32 -2 (-2147483650)",
+      .inp_lf = -0x1.00000004p+31,
+      .exp_fcvt = 0xffffffff80000000,
+      .exp_fcvt_fflags = FFLAG_NV,
+      .exp_fcvtmod = 2147483646, /* int32 max -1 */
+      .exp_fcvtmod_fflags = FFLAG_NV },
+};
+
+int run_fcvtmod_tests()
+{
+    uint64_t act_fcvt;
+    uint8_t act_fcvt_fflags;
+    uint64_t act_fcvtmod;
+    uint8_t act_fcvtmod_fflags;
+
+    for (size_t i = 0; i < sizeof(tests)/sizeof(tests[0]); i++) {
+        const fp64_fcvt_fcvtmod_testcase_t *t = &tests[i];
+	//printf("Test %zu (%s): ", i, t->name);
+
+        act_fcvt = do_fcvt_w_d(t->inp_lu, &act_fcvt_fflags);
+        int fcvt_correct = act_fcvt == t->exp_fcvt &&
+                    act_fcvt_fflags == t->exp_fcvt_fflags;
+        act_fcvtmod = do_fcvtmod_w_d(t->inp_lu, &act_fcvtmod_fflags);
+        int fcvtmod_correct = act_fcvtmod == t->exp_fcvtmod &&
+                       act_fcvtmod_fflags == t->exp_fcvtmod_fflags;
+
+        if (fcvt_correct && fcvtmod_correct) {
+            //printf("pass\n");
+            continue;
+        }
+
+        printf("FAIL\n");
+
+        double fpr = do_fmv_d_x(t->inp_lu);
+        printf("inp_lu: 0x%016lx == %lf\n", t->inp_lu, fpr);
+        printf("inp_lf: %lf\n", t->inp_lf);
+
+        uint32_t sign = (t->inp_lu >> 63);
+        uint32_t exp = (uint32_t)(t->inp_lu >> 52) & 0x7ff;
+        uint64_t frac = t->inp_lu & 0xfffffffffffffull; /* significand */
+        int true_exp = exp - 1023;
+        int shift = true_exp - 52;
+        uint64_t true_frac = frac | 1ull << 52;
+
+        printf("sign=%d, exp=0x%03x, frac=0x%012lx\n", sign, exp, frac);
+        printf("true_exp=%d, shift=%d, true_frac=0x%016lx\n", true_exp, shift, true_frac);
+
+        if (!fcvt_correct) {
+            printf("act_fcvt: 0x%016lx == %li\n", act_fcvt, act_fcvt);
+            printf("exp_fcvt: 0x%016lx == %li\n", t->exp_fcvt, t->exp_fcvt);
+            printf("act_fcvt_fflags: "); print_fflags(act_fcvt_fflags); printf("\n");
+            printf("exp_fcvt_fflags: "); print_fflags(t->exp_fcvt_fflags); printf("\n");
+        }
+
+        if (!fcvtmod_correct) {
+            printf("act_fcvtmod: 0x%016lx == %li\n", act_fcvtmod, act_fcvtmod);
+            printf("exp_fcvtmod: 0x%016lx == %li\n", t->exp_fcvtmod, t->exp_fcvtmod);
+            printf("act_fcvtmod_fflags: "); print_fflags(act_fcvtmod_fflags); printf("\n");
+            printf("exp_fcvtmod_fflags: "); print_fflags(t->exp_fcvtmod_fflags); printf("\n");
+        }
+
+        return 1;
+    }
+
+    return 0;
+}
+
+int main()
+{
+    return run_fcvtmod_tests();
+}
-- 
2.41.0


