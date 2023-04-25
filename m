Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1prORX-0005G7-Tn
	for mharc-qemu-riscv@gnu.org; Tue, 25 Apr 2023 15:35:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOR0-0003zJ-Pc
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 15:34:45 -0400
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOQs-0004x0-Az
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 15:34:42 -0400
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2a8ba693f69so59528101fa.0
 for <qemu-riscv@nongnu.org>; Tue, 25 Apr 2023 12:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682451273; x=1685043273;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=knj9vLRVgMuHbxUsbTpxPOOdPonmqcw2C7rsb1Cv/YA=;
 b=MtkJwE475/S4xmtvoKag7BeexsnqmP6eCYFvkzc4s9eWv8duFfAIE8PChhEgGXH7Mz
 JZplUYUyGVorFRxgyKNfaMEqtVTtwQRY+SkWSYwazGhubc9MnDG0QYNcN69t7UDP/eHC
 D1hoQZ0QYlbsMt5HV703uboV5tx3lTXb1Wiy9QC//dVhTt9UhA6AMJ+oDBwtqrsmy0Pv
 0BTajOW1HItSCTdbEOnFG2e1aENDyNdxaZYMA6RJpz4HyUTihOe4dK3A57RXori1dhAx
 DqdyhkflaqIjmSWAVfX50ib+dR4HedCINF3oXCgjvOZoEH34VkYOVFNIt923B0OJMP+G
 bBaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682451273; x=1685043273;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=knj9vLRVgMuHbxUsbTpxPOOdPonmqcw2C7rsb1Cv/YA=;
 b=UbWaSo6opLamtsQ8sakwMz0XC/JTV5kevFdkxPgflNrWMZW/HOZLFLObEmpoC4y+eP
 Q/h8kiqyHlXfaoYGw2YDpDcryjkTKKrm5iU1dDKS2DOQkjMviJ+0Rq2nGi6tc3PC0L6q
 Bh2ogJBfcc9k/Yyah0etnlwrXy3mf3/AQV/GUcp0luk6fo0CCq+TloWU72caoyefh8bv
 eVeGZJIBLhPA7DtO9+bvNA3c7nuz//VXWEJkMzDNlo8md4C/PiJ95oioYeH9GkuzyvPk
 TCVeY+gPpQNVj/Kf+Nm+6CuZkC5MOwMoHZavAROCrVce/Y2zYe6A7H5BeMNN3Fmyh5Mk
 6Q9A==
X-Gm-Message-State: AAQBX9dLbiE3sGVnB8PXdp2wYqZH33l6/6PO+XntKTFGIrZa1esCfdi7
 4iwSSbXObGjjbn3SgbAp8QqsiA==
X-Google-Smtp-Source: AKy350ZQkbncBghDnG8J73dGScZtN2WLD27KV3Vec/mZx5xTEeJyrUTX5izxjU50W4MvyllrPmlpuw==
X-Received: by 2002:ac2:5230:0:b0:4ed:c893:adf5 with SMTP id
 i16-20020ac25230000000b004edc893adf5mr4804098lfl.40.1682451272822; 
 Tue, 25 Apr 2023 12:34:32 -0700 (PDT)
Received: from stoup.. ([91.209.212.61]) by smtp.gmail.com with ESMTPSA id
 z23-20020a2e8857000000b002a8c271de33sm2160484ljj.67.2023.04.25.12.34.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 12:34:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 philmd@linaro.org
Subject: [PATCH v3 26/57] tcg/arm: Adjust constraints on qemu_ld/st
Date: Tue, 25 Apr 2023 20:31:15 +0100
Message-Id: <20230425193146.2106111-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425193146.2106111-1-richard.henderson@linaro.org>
References: <20230425193146.2106111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=richard.henderson@linaro.org; helo=mail-lj1-x22c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 25 Apr 2023 19:34:45 -0000

Always reserve r3 for tlb softmmu lookup.  Fix a bug in user-only
ALL_QLDST_REGS, in that r14 is clobbered by the BLNE that leads
to the misaligned trap.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target-con-set.h | 16 ++++++++--------
 tcg/arm/tcg-target-con-str.h |  5 ++---
 tcg/arm/tcg-target.c.inc     | 23 ++++++++---------------
 3 files changed, 18 insertions(+), 26 deletions(-)

diff --git a/tcg/arm/tcg-target-con-set.h b/tcg/arm/tcg-target-con-set.h
index b8849b2478..229ae258ac 100644
--- a/tcg/arm/tcg-target-con-set.h
+++ b/tcg/arm/tcg-target-con-set.h
@@ -12,19 +12,19 @@
 C_O0_I1(r)
 C_O0_I2(r, r)
 C_O0_I2(r, rIN)
-C_O0_I2(s, s)
+C_O0_I2(q, q)
 C_O0_I2(w, r)
-C_O0_I3(s, s, s)
-C_O0_I3(S, p, s)
+C_O0_I3(q, q, q)
+C_O0_I3(Q, p, q)
 C_O0_I4(r, r, rI, rI)
-C_O0_I4(S, p, s, s)
-C_O1_I1(r, l)
+C_O0_I4(Q, p, q, q)
+C_O1_I1(r, q)
 C_O1_I1(r, r)
 C_O1_I1(w, r)
 C_O1_I1(w, w)
 C_O1_I1(w, wr)
 C_O1_I2(r, 0, rZ)
-C_O1_I2(r, l, l)
+C_O1_I2(r, q, q)
 C_O1_I2(r, r, r)
 C_O1_I2(r, r, rI)
 C_O1_I2(r, r, rIK)
@@ -39,8 +39,8 @@ C_O1_I2(w, w, wZ)
 C_O1_I3(w, w, w, w)
 C_O1_I4(r, r, r, rI, rI)
 C_O1_I4(r, r, rIN, rIK, 0)
-C_O2_I1(e, p, l)
-C_O2_I2(e, p, l, l)
+C_O2_I1(e, p, q)
+C_O2_I2(e, p, q, q)
 C_O2_I2(r, r, r, r)
 C_O2_I4(r, r, r, r, rIN, rIK)
 C_O2_I4(r, r, rI, rI, rIN, rIK)
diff --git a/tcg/arm/tcg-target-con-str.h b/tcg/arm/tcg-target-con-str.h
index 24b4b59feb..f83f1d3919 100644
--- a/tcg/arm/tcg-target-con-str.h
+++ b/tcg/arm/tcg-target-con-str.h
@@ -10,9 +10,8 @@
  */
 REGS('e', ALL_GENERAL_REGS & 0x5555) /* even regs */
 REGS('r', ALL_GENERAL_REGS)
-REGS('l', ALL_QLOAD_REGS)
-REGS('s', ALL_QSTORE_REGS)
-REGS('S', ALL_QSTORE_REGS & 0x5555)  /* even qstore */
+REGS('q', ALL_QLDST_REGS)
+REGS('Q', ALL_QLDST_REGS & 0x5555)   /* even qldst */
 REGS('w', ALL_VECTOR_REGS)
 
 /*
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 8b0d526659..a02804dd69 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -353,23 +353,16 @@ static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
 #define ALL_VECTOR_REGS   0xffff0000u
 
 /*
- * r0-r2 will be overwritten when reading the tlb entry (softmmu only)
- * and r0-r1 doing the byte swapping, so don't use these.
- * r3 is removed for softmmu to avoid clashes with helper arguments.
+ * r0-r3 will be overwritten when reading the tlb entry (softmmu only);
+ * r14 will be overwritten by the BLNE branching to the slow path.
  */
 #ifdef CONFIG_SOFTMMU
-#define ALL_QLOAD_REGS \
+#define ALL_QLDST_REGS \
     (ALL_GENERAL_REGS & ~((1 << TCG_REG_R0) | (1 << TCG_REG_R1) | \
                           (1 << TCG_REG_R2) | (1 << TCG_REG_R3) | \
                           (1 << TCG_REG_R14)))
-#define ALL_QSTORE_REGS \
-    (ALL_GENERAL_REGS & ~((1 << TCG_REG_R0) | (1 << TCG_REG_R1) | \
-                          (1 << TCG_REG_R2) | (1 << TCG_REG_R14) | \
-                          ((TARGET_LONG_BITS == 64) << TCG_REG_R3)))
 #else
-#define ALL_QLOAD_REGS   ALL_GENERAL_REGS
-#define ALL_QSTORE_REGS \
-    (ALL_GENERAL_REGS & ~((1 << TCG_REG_R0) | (1 << TCG_REG_R1)))
+#define ALL_QLDST_REGS   (ALL_GENERAL_REGS & ~(1 << TCG_REG_R14))
 #endif
 
 /*
@@ -2203,13 +2196,13 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
         return C_O1_I4(r, r, r, rI, rI);
 
     case INDEX_op_qemu_ld_i32:
-        return TARGET_LONG_BITS == 32 ? C_O1_I1(r, l) : C_O1_I2(r, l, l);
+        return TARGET_LONG_BITS == 32 ? C_O1_I1(r, q) : C_O1_I2(r, q, q);
     case INDEX_op_qemu_ld_i64:
-        return TARGET_LONG_BITS == 32 ? C_O2_I1(e, p, l) : C_O2_I2(e, p, l, l);
+        return TARGET_LONG_BITS == 32 ? C_O2_I1(e, p, q) : C_O2_I2(e, p, q, q);
     case INDEX_op_qemu_st_i32:
-        return TARGET_LONG_BITS == 32 ? C_O0_I2(s, s) : C_O0_I3(s, s, s);
+        return TARGET_LONG_BITS == 32 ? C_O0_I2(q, q) : C_O0_I3(q, q, q);
     case INDEX_op_qemu_st_i64:
-        return TARGET_LONG_BITS == 32 ? C_O0_I3(S, p, s) : C_O0_I4(S, p, s, s);
+        return TARGET_LONG_BITS == 32 ? C_O0_I3(Q, p, q) : C_O0_I4(Q, p, q, q);
 
     case INDEX_op_st_vec:
         return C_O0_I2(w, r);
-- 
2.34.1


