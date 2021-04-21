Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lZ4GA-000790-Pk
	for mharc-qemu-riscv@gnu.org; Wed, 21 Apr 2021 00:14:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lZ4G3-0006wy-6u
 for qemu-riscv@nongnu.org; Wed, 21 Apr 2021 00:14:35 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:41836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lZ4G1-00037F-C1
 for qemu-riscv@nongnu.org; Wed, 21 Apr 2021 00:14:34 -0400
Received: by mail-pf1-x434.google.com with SMTP id w6so12910692pfc.8
 for <qemu-riscv@nongnu.org>; Tue, 20 Apr 2021 21:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=42KWzCC8CFFh/Kemo2PX17aSJD67rAM/tWgccuVGlL8=;
 b=NZgRQmLHAHFSAZ4hWLlBLHkTf+tV/QWHObFojtJfv+kOvawGv2rZFJvBwcDjqWT6Ab
 6sJq//3D4w7bevcWtv+Q4T/1qUeZMbeH7cHQhz4M9DmWSVhEublEn67ZKfKALHiK5GG2
 HvCRcqCYBSNbW2jYSOyR6qfIasVWZu7m1EUfIGiMzFVEZ1mCQ9SdBk9acC4ONIAlwPbi
 VVzmYE2iUCac1Us7UfjPSXkfq3W+1UL1Xe0ps+rnSQzbCUV/o0a2t9RwRPafhfA694+6
 htZ9z+tmGRj/fxb7PrNj/GJOpLVIqEcQqCOuATCWCMOGfBkJFTfchEsCmpJs6koHDGta
 T8/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=42KWzCC8CFFh/Kemo2PX17aSJD67rAM/tWgccuVGlL8=;
 b=o/HyhiITeptsukq0PowmuvWf09XAWJUG7mDiSdxZZWC7U/jXZEoQt9aYHK6ymh6s0z
 IwvvY0s7IP3V9krwM7y8QOO+b8vj4ZSThgvHPE78bgDbUDrG5Svqd3s4lF0cYR8r/76t
 K5YM9VxOE9KeWoPW8+8wgKQgMoKDaPVI1/fTETtu9pTah0A1hweRzmb9z7QyGsnU5Mx+
 iJKFtOnYsgCYiXf7+tuP9nhNA0DlXfOhVvam2WokEY9smykeZcyw/z9xLnfhNUInxE2z
 lytAFEFWsThyizFItD9bdh/uzUQgq+93Fh4KLpaK/gVOWfI4N9dp7eSfHGE3xnhdcsFD
 mQlw==
X-Gm-Message-State: AOAM531ETXr4IoLk9FCrbVLfRTVAfw0hzPU/tVdHznaVRm7SZDUW4mwS
 FEJAOH7GYw5kJJ9a6+COYhpFmw==
X-Google-Smtp-Source: ABdhPJyEvVt2gvK4aLpuODr5rKnDGcQxTIA77eSD5aGalfIAAFqRlbfE/2Zr3I54SuGxCvaBf7hlDw==
X-Received: by 2002:a17:90a:b794:: with SMTP id
 m20mr8564361pjr.152.1618978472128; 
 Tue, 20 Apr 2021 21:14:32 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id jx20sm551465pjb.41.2021.04.20.21.14.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 21:14:31 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v5 08/17] target/riscv: add gen_shifti() and gen_shiftiw()
 helper functions
Date: Wed, 21 Apr 2021 12:13:50 +0800
Message-Id: <20210421041400.22243-9-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210421041400.22243-1-frank.chang@sifive.com>
References: <20210421041400.22243-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Apr 2021 04:14:36 -0000

From: Frank Chang <frank.chang@sifive.com>

Add gen_shifti() and gen_shiftiw() helper functions to reuse the same
interfaces for immediate shift instructions.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvi.c.inc | 54 ++-----------------------
 target/riscv/translate.c                | 43 ++++++++++++++++++++
 2 files changed, 47 insertions(+), 50 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index d04ca0394cf..7b894201840 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -261,54 +261,17 @@ static bool trans_andi(DisasContext *ctx, arg_andi *a)
 }
 static bool trans_slli(DisasContext *ctx, arg_slli *a)
 {
-    if (a->shamt >= TARGET_LONG_BITS) {
-        return false;
-    }
-
-    if (a->rd != 0) {
-        TCGv t = tcg_temp_new();
-        gen_get_gpr(t, a->rs1);
-
-        tcg_gen_shli_tl(t, t, a->shamt);
-
-        gen_set_gpr(a->rd, t);
-        tcg_temp_free(t);
-    } /* NOP otherwise */
-    return true;
+    return gen_shifti(ctx, a, tcg_gen_shl_tl);
 }
 
 static bool trans_srli(DisasContext *ctx, arg_srli *a)
 {
-    if (a->shamt >= TARGET_LONG_BITS) {
-        return false;
-    }
-
-    if (a->rd != 0) {
-        TCGv t = tcg_temp_new();
-        gen_get_gpr(t, a->rs1);
-
-        tcg_gen_shri_tl(t, t, a->shamt);
-        gen_set_gpr(a->rd, t);
-        tcg_temp_free(t);
-    } /* NOP otherwise */
-    return true;
+    return gen_shifti(ctx, a, tcg_gen_shr_tl);
 }
 
 static bool trans_srai(DisasContext *ctx, arg_srai *a)
 {
-    if (a->shamt >= TARGET_LONG_BITS) {
-        return false;
-    }
-
-    if (a->rd != 0) {
-        TCGv t = tcg_temp_new();
-        gen_get_gpr(t, a->rs1);
-
-        tcg_gen_sari_tl(t, t, a->shamt);
-        gen_set_gpr(a->rd, t);
-        tcg_temp_free(t);
-    } /* NOP otherwise */
-    return true;
+    return gen_shifti(ctx, a, tcg_gen_sar_tl);
 }
 
 static bool trans_add(DisasContext *ctx, arg_add *a)
@@ -369,16 +332,7 @@ static bool trans_addiw(DisasContext *ctx, arg_addiw *a)
 
 static bool trans_slliw(DisasContext *ctx, arg_slliw *a)
 {
-    TCGv source1;
-    source1 = tcg_temp_new();
-    gen_get_gpr(source1, a->rs1);
-
-    tcg_gen_shli_tl(source1, source1, a->shamt);
-    tcg_gen_ext32s_tl(source1, source1);
-    gen_set_gpr(a->rd, source1);
-
-    tcg_temp_free(source1);
-    return true;
+    return gen_shiftiw(ctx, a, tcg_gen_shl_tl);
 }
 
 static bool trans_srliw(DisasContext *ctx, arg_srliw *a)
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 4333207aeff..f8a2a137f27 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -644,6 +644,49 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
     return cpu_ldl_code(env, pc);
 }
 
+static bool gen_shifti(DisasContext *ctx, arg_shift *a,
+                       void(*func)(TCGv, TCGv, TCGv))
+{
+    if (a->shamt >= TARGET_LONG_BITS) {
+        return false;
+    }
+
+    TCGv source1 = tcg_temp_new();
+    TCGv source2 = tcg_temp_new();
+
+    gen_get_gpr(source1, a->rs1);
+
+    tcg_gen_movi_tl(source2, a->shamt);
+    (*func)(source1, source1, source2);
+
+    gen_set_gpr(a->rd, source1);
+    tcg_temp_free(source1);
+    tcg_temp_free(source2);
+    return true;
+}
+
+#ifdef TARGET_RISCV64
+
+static bool gen_shiftiw(DisasContext *ctx, arg_shift *a,
+                        void(*func)(TCGv, TCGv, TCGv))
+{
+    TCGv source1 = tcg_temp_new();
+    TCGv source2 = tcg_temp_new();
+
+    gen_get_gpr(source1, a->rs1);
+    tcg_gen_movi_tl(source2, a->shamt);
+
+    (*func)(source1, source1, source2);
+    tcg_gen_ext32s_tl(source1, source1);
+
+    gen_set_gpr(a->rd, source1);
+    tcg_temp_free(source1);
+    tcg_temp_free(source2);
+    return true;
+}
+
+#endif
+
 static void gen_ctz(TCGv ret, TCGv arg1)
 {
     tcg_gen_ctzi_tl(ret, arg1, TARGET_LONG_BITS);
-- 
2.17.1


