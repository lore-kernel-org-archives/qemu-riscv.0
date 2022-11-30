Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p0N7O-0003YD-2e
	for mharc-qemu-riscv@gnu.org; Wed, 30 Nov 2022 08:27:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0N7J-0003SA-QI
 for qemu-riscv@nongnu.org; Wed, 30 Nov 2022 08:27:14 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0N7E-0006NL-S9
 for qemu-riscv@nongnu.org; Wed, 30 Nov 2022 08:27:13 -0500
Received: by mail-wr1-x430.google.com with SMTP id d1so27087831wrs.12
 for <qemu-riscv@nongnu.org>; Wed, 30 Nov 2022 05:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mre2VFptmO/A+bk2cFTVdvr5YJL0eSfNnAl8Jkgmml4=;
 b=fSNFtNU0voQwuAiwCv9Pf2cxmf4nDfPiu4qcj2sj9OTjeAgPh3y9yd/kMWBPe01wC7
 UpLXqgAovXchc20jM+AfDQNSUJXx6r9Pfg3u5bFvSBU/R9oxxdGj6R34a44fT8tA6bE3
 bqrXiR3Tx0GtbJCWzKLFaGm/HzsYx7xccztKj4T5wmEbZla9V8nC5XQuf7mSnt/OoGcG
 u/6rJS9OkI/5HbHour8stnHuQsb8czT7wE7HZxVBiJ2WRKjmG7nVF4Y3iBbyqvWem4SA
 TUul9BYe4NlSzNcxcJxnGyUyF8Rfr/nehpeT5/ybfFzN0JkddZHHH4nG53dZxheNf6/o
 lKMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Mre2VFptmO/A+bk2cFTVdvr5YJL0eSfNnAl8Jkgmml4=;
 b=K5WDvKW84l94ZzrTX69ZAY4sz5wBwGNx4oHzPH/BUQVSGx8pZaINuB3l4rF+WfNYH3
 PQx80Il5Hez/YMHv5r+BCUVgTFJTQpDWsstHNx8qdzaCpp6h9EB0jr4KzwQGmkU0m70x
 q/hqpQC6PdiCiRsA2vjweRPi+T/RrX7PLAYsARny3F+QbLlRVBgrmMCxSl3PRzipHoSP
 UyDL8JLjSSzPbOKsHRuXn9D8t5xs7rSJolHJwy4M3LK3dKN+md7+mGwDFmkIV6Db6gvP
 mDbQC6sD17QY+XlgPrO83lxklN30YKZaETKQ/Zgx1CHnOdyP6s42p56lrrA+HCJf/2Ak
 Golg==
X-Gm-Message-State: ANoB5plrjYDLcwambzWxDsvrTIKsSBpqJJHqEoQdbexQtrWPMbGfszrp
 ZCr0r9clgTeyiX1+sRunPF4gPA==
X-Google-Smtp-Source: AA0mqf4+ea9m7OXtsDVMhMbGaNZE1kPir62ILO5gN4Ftp0He+emWQwavFHvT7k2X0giFfZcRsLN5Cw==
X-Received: by 2002:adf:e7ce:0:b0:22e:4864:ee11 with SMTP id
 e14-20020adfe7ce000000b0022e4864ee11mr25606307wrn.488.1669814827159; 
 Wed, 30 Nov 2022 05:27:07 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 i1-20020adfaac1000000b002238ea5750csm1985552wrc.72.2022.11.30.05.27.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 30 Nov 2022 05:27:06 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, Thomas Huth <thuth@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, qemu-riscv@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, WANG Xuerui <git@xen0n.name>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-s390x@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-arm@nongnu.org
Subject: [PATCH-for-8.0 2/3] tcg: Replace tcg_target_long -> intptr_t
Date: Wed, 30 Nov 2022 14:26:53 +0100
Message-Id: <20221130132654.76369-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221130132654.76369-1-philmd@linaro.org>
References: <20221130132654.76369-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 30 Nov 2022 13:27:14 -0000

Mechanical transformation using:

 $ sed -e 's/tcg_target_long/intptr_t/g' \
       -i $(git grep -l tcg_target_long)

Note, the TCG_PRIld format was not used; simply remove it.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/tcg/cputlb.c               |  4 +--
 include/tcg/tcg-op.h             | 62 ++++++++++++++++----------------
 include/tcg/tcg.h                |  4 ---
 tcg/aarch64/tcg-target.c.inc     | 16 ++++-----
 tcg/arm/tcg-target.c.inc         |  4 +--
 tcg/i386/tcg-target.c.inc        | 16 ++++-----
 tcg/loongarch64/tcg-target.c.inc | 30 ++++++++--------
 tcg/mips/tcg-target.c.inc        |  4 +--
 tcg/ppc/tcg-target.c.inc         | 16 ++++-----
 tcg/riscv/tcg-target.c.inc       | 18 +++++-----
 tcg/s390x/tcg-target.c.inc       | 20 +++++------
 tcg/sparc64/tcg-target.c.inc     | 12 +++----
 tcg/tcg-op-vec.c                 |  2 +-
 tcg/tcg-op.c                     | 16 ++++-----
 tcg/tcg.c                        |  8 ++---
 tcg/tci/tcg-target.c.inc         |  2 +-
 16 files changed, 115 insertions(+), 119 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 6f1c00682b..32caf115ed 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -2015,8 +2015,8 @@ load_helper(CPUArchState *env, target_ulong addr, MemOpIdx oi,
 /*
  * For the benefit of TCG generated code, we want to avoid the
  * complication of ABI-specific return type promotion and always
- * return a value extended to the register size of the host. This is
- * tcg_target_long, except in the case of a 32-bit host and 64-bit
+ * return a value extended to the register size of the host. This
+ * is intptr_t, except in the case of a 32-bit host and 64-bit
  * data, and for that we always have uint64_t.
  *
  * We don't bother with this widened value for SOFTMMU_CODE_ACCESS.
diff --git a/include/tcg/tcg-op.h b/include/tcg/tcg-op.h
index 209e168305..d6c6ced6d9 100644
--- a/include/tcg/tcg-op.h
+++ b/include/tcg/tcg-op.h
@@ -355,49 +355,49 @@ static inline void tcg_gen_mov_i32(TCGv_i32 ret, TCGv_i32 arg)
 }
 
 static inline void tcg_gen_ld8u_i32(TCGv_i32 ret, TCGv_ptr arg2,
-                                    tcg_target_long offset)
+                                    intptr_t offset)
 {
     tcg_gen_ldst_op_i32(INDEX_op_ld8u_i32, ret, arg2, offset);
 }
 
 static inline void tcg_gen_ld8s_i32(TCGv_i32 ret, TCGv_ptr arg2,
-                                    tcg_target_long offset)
+                                    intptr_t offset)
 {
     tcg_gen_ldst_op_i32(INDEX_op_ld8s_i32, ret, arg2, offset);
 }
 
 static inline void tcg_gen_ld16u_i32(TCGv_i32 ret, TCGv_ptr arg2,
-                                     tcg_target_long offset)
+                                     intptr_t offset)
 {
     tcg_gen_ldst_op_i32(INDEX_op_ld16u_i32, ret, arg2, offset);
 }
 
 static inline void tcg_gen_ld16s_i32(TCGv_i32 ret, TCGv_ptr arg2,
-                                     tcg_target_long offset)
+                                     intptr_t offset)
 {
     tcg_gen_ldst_op_i32(INDEX_op_ld16s_i32, ret, arg2, offset);
 }
 
 static inline void tcg_gen_ld_i32(TCGv_i32 ret, TCGv_ptr arg2,
-                                  tcg_target_long offset)
+                                  intptr_t offset)
 {
     tcg_gen_ldst_op_i32(INDEX_op_ld_i32, ret, arg2, offset);
 }
 
 static inline void tcg_gen_st8_i32(TCGv_i32 arg1, TCGv_ptr arg2,
-                                   tcg_target_long offset)
+                                   intptr_t offset)
 {
     tcg_gen_ldst_op_i32(INDEX_op_st8_i32, arg1, arg2, offset);
 }
 
 static inline void tcg_gen_st16_i32(TCGv_i32 arg1, TCGv_ptr arg2,
-                                    tcg_target_long offset)
+                                    intptr_t offset)
 {
     tcg_gen_ldst_op_i32(INDEX_op_st16_i32, arg1, arg2, offset);
 }
 
 static inline void tcg_gen_st_i32(TCGv_i32 arg1, TCGv_ptr arg2,
-                                  tcg_target_long offset)
+                                  intptr_t offset)
 {
     tcg_gen_ldst_op_i32(INDEX_op_st_i32, arg1, arg2, offset);
 }
@@ -557,67 +557,67 @@ static inline void tcg_gen_mov_i64(TCGv_i64 ret, TCGv_i64 arg)
 }
 
 static inline void tcg_gen_ld8u_i64(TCGv_i64 ret, TCGv_ptr arg2,
-                                    tcg_target_long offset)
+                                    intptr_t offset)
 {
     tcg_gen_ldst_op_i64(INDEX_op_ld8u_i64, ret, arg2, offset);
 }
 
 static inline void tcg_gen_ld8s_i64(TCGv_i64 ret, TCGv_ptr arg2,
-                                    tcg_target_long offset)
+                                    intptr_t offset)
 {
     tcg_gen_ldst_op_i64(INDEX_op_ld8s_i64, ret, arg2, offset);
 }
 
 static inline void tcg_gen_ld16u_i64(TCGv_i64 ret, TCGv_ptr arg2,
-                                     tcg_target_long offset)
+                                     intptr_t offset)
 {
     tcg_gen_ldst_op_i64(INDEX_op_ld16u_i64, ret, arg2, offset);
 }
 
 static inline void tcg_gen_ld16s_i64(TCGv_i64 ret, TCGv_ptr arg2,
-                                     tcg_target_long offset)
+                                     intptr_t offset)
 {
     tcg_gen_ldst_op_i64(INDEX_op_ld16s_i64, ret, arg2, offset);
 }
 
 static inline void tcg_gen_ld32u_i64(TCGv_i64 ret, TCGv_ptr arg2,
-                                     tcg_target_long offset)
+                                     intptr_t offset)
 {
     tcg_gen_ldst_op_i64(INDEX_op_ld32u_i64, ret, arg2, offset);
 }
 
 static inline void tcg_gen_ld32s_i64(TCGv_i64 ret, TCGv_ptr arg2,
-                                     tcg_target_long offset)
+                                     intptr_t offset)
 {
     tcg_gen_ldst_op_i64(INDEX_op_ld32s_i64, ret, arg2, offset);
 }
 
 static inline void tcg_gen_ld_i64(TCGv_i64 ret, TCGv_ptr arg2,
-                                  tcg_target_long offset)
+                                  intptr_t offset)
 {
     tcg_gen_ldst_op_i64(INDEX_op_ld_i64, ret, arg2, offset);
 }
 
 static inline void tcg_gen_st8_i64(TCGv_i64 arg1, TCGv_ptr arg2,
-                                   tcg_target_long offset)
+                                   intptr_t offset)
 {
     tcg_gen_ldst_op_i64(INDEX_op_st8_i64, arg1, arg2, offset);
 }
 
 static inline void tcg_gen_st16_i64(TCGv_i64 arg1, TCGv_ptr arg2,
-                                    tcg_target_long offset)
+                                    intptr_t offset)
 {
     tcg_gen_ldst_op_i64(INDEX_op_st16_i64, arg1, arg2, offset);
 }
 
 static inline void tcg_gen_st32_i64(TCGv_i64 arg1, TCGv_ptr arg2,
-                                    tcg_target_long offset)
+                                    intptr_t offset)
 {
     tcg_gen_ldst_op_i64(INDEX_op_st32_i64, arg1, arg2, offset);
 }
 
 static inline void tcg_gen_st_i64(TCGv_i64 arg1, TCGv_ptr arg2,
-                                  tcg_target_long offset)
+                                  intptr_t offset)
 {
     tcg_gen_ldst_op_i64(INDEX_op_st_i64, arg1, arg2, offset);
 }
@@ -668,19 +668,19 @@ static inline void tcg_gen_mul_i64(TCGv_i64 ret, TCGv_i64 arg1, TCGv_i64 arg2)
 }
 #else /* TCG_TARGET_REG_BITS == 32 */
 static inline void tcg_gen_st8_i64(TCGv_i64 arg1, TCGv_ptr arg2,
-                                   tcg_target_long offset)
+                                   intptr_t offset)
 {
     tcg_gen_st8_i32(TCGV_LOW(arg1), arg2, offset);
 }
 
 static inline void tcg_gen_st16_i64(TCGv_i64 arg1, TCGv_ptr arg2,
-                                    tcg_target_long offset)
+                                    intptr_t offset)
 {
     tcg_gen_st16_i32(TCGV_LOW(arg1), arg2, offset);
 }
 
 static inline void tcg_gen_st32_i64(TCGv_i64 arg1, TCGv_ptr arg2,
-                                    tcg_target_long offset)
+                                    intptr_t offset)
 {
     tcg_gen_st_i32(TCGV_LOW(arg1), arg2, offset);
 }
@@ -699,14 +699,14 @@ static inline void tcg_gen_sub_i64(TCGv_i64 ret, TCGv_i64 arg1, TCGv_i64 arg2)
 
 void tcg_gen_discard_i64(TCGv_i64 arg);
 void tcg_gen_mov_i64(TCGv_i64 ret, TCGv_i64 arg);
-void tcg_gen_ld8u_i64(TCGv_i64 ret, TCGv_ptr arg2, tcg_target_long offset);
-void tcg_gen_ld8s_i64(TCGv_i64 ret, TCGv_ptr arg2, tcg_target_long offset);
-void tcg_gen_ld16u_i64(TCGv_i64 ret, TCGv_ptr arg2, tcg_target_long offset);
-void tcg_gen_ld16s_i64(TCGv_i64 ret, TCGv_ptr arg2, tcg_target_long offset);
-void tcg_gen_ld32u_i64(TCGv_i64 ret, TCGv_ptr arg2, tcg_target_long offset);
-void tcg_gen_ld32s_i64(TCGv_i64 ret, TCGv_ptr arg2, tcg_target_long offset);
-void tcg_gen_ld_i64(TCGv_i64 ret, TCGv_ptr arg2, tcg_target_long offset);
-void tcg_gen_st_i64(TCGv_i64 arg1, TCGv_ptr arg2, tcg_target_long offset);
+void tcg_gen_ld8u_i64(TCGv_i64 ret, TCGv_ptr arg2, intptr_t offset);
+void tcg_gen_ld8s_i64(TCGv_i64 ret, TCGv_ptr arg2, intptr_t offset);
+void tcg_gen_ld16u_i64(TCGv_i64 ret, TCGv_ptr arg2, intptr_t offset);
+void tcg_gen_ld16s_i64(TCGv_i64 ret, TCGv_ptr arg2, intptr_t offset);
+void tcg_gen_ld32u_i64(TCGv_i64 ret, TCGv_ptr arg2, intptr_t offset);
+void tcg_gen_ld32s_i64(TCGv_i64 ret, TCGv_ptr arg2, intptr_t offset);
+void tcg_gen_ld_i64(TCGv_i64 ret, TCGv_ptr arg2, intptr_t offset);
+void tcg_gen_st_i64(TCGv_i64 arg1, TCGv_ptr arg2, intptr_t offset);
 void tcg_gen_and_i64(TCGv_i64 ret, TCGv_i64 arg1, TCGv_i64 arg2);
 void tcg_gen_or_i64(TCGv_i64 ret, TCGv_i64 arg1, TCGv_i64 arg2);
 void tcg_gen_xor_i64(TCGv_i64 ret, TCGv_i64 arg1, TCGv_i64 arg2);
@@ -965,7 +965,7 @@ void tcg_gen_atomic_umax_fetch_i64(TCGv_i64, TCGv, TCGv_i64, TCGArg, MemOp);
 void tcg_gen_mov_vec(TCGv_vec, TCGv_vec);
 void tcg_gen_dup_i32_vec(unsigned vece, TCGv_vec, TCGv_i32);
 void tcg_gen_dup_i64_vec(unsigned vece, TCGv_vec, TCGv_i64);
-void tcg_gen_dup_mem_vec(unsigned vece, TCGv_vec, TCGv_ptr, tcg_target_long);
+void tcg_gen_dup_mem_vec(unsigned vece, TCGv_vec, TCGv_ptr, intptr_t);
 void tcg_gen_dupi_vec(unsigned vece, TCGv_vec, uint64_t);
 void tcg_gen_add_vec(unsigned vece, TCGv_vec r, TCGv_vec a, TCGv_vec b);
 void tcg_gen_sub_vec(unsigned vece, TCGv_vec r, TCGv_vec a, TCGv_vec b);
diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index d84bae6e3f..340ae55c79 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -67,15 +67,11 @@
 #endif
 
 #if TCG_TARGET_REG_BITS == 32
-typedef int32_t tcg_target_long;
 typedef uint32_t tcg_target_ulong;
 #define TCG_PRIlx PRIx32
-#define TCG_PRIld PRId32
 #elif TCG_TARGET_REG_BITS == 64
-typedef int64_t tcg_target_long;
 typedef uint64_t tcg_target_ulong;
 #define TCG_PRIlx PRIx64
-#define TCG_PRIld PRId64
 #else
 #error unsupported
 #endif
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 344b63e20f..851eb696e2 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -649,7 +649,7 @@ static void tcg_out_insn_3207(TCGContext *s, AArch64Insn insn, TCGReg rn)
 
 static void tcg_out_insn_3314(TCGContext *s, AArch64Insn insn,
                               TCGReg r1, TCGReg r2, TCGReg rn,
-                              tcg_target_long ofs, bool pre, bool w)
+                              intptr_t ofs, bool pre, bool w)
 {
     insn |= 1u << 31; /* ext */
     insn |= pre << 24;
@@ -1012,11 +1012,11 @@ static bool tcg_out_dupm_vec(TCGContext *s, TCGType type, unsigned vece,
 }
 
 static void tcg_out_movi(TCGContext *s, TCGType type, TCGReg rd,
-                         tcg_target_long value)
+                         intptr_t value)
 {
-    tcg_target_long svalue = value;
-    tcg_target_long ivalue = ~value;
-    tcg_target_long t0, t1, t2;
+    intptr_t svalue = value;
+    intptr_t ivalue = ~value;
+    intptr_t t0, t1, t2;
     int s0, s1;
     AArch64Insn opc;
 
@@ -1062,7 +1062,7 @@ static void tcg_out_movi(TCGContext *s, TCGType type, TCGReg rd,
        often when loading pointers to QEMU's own data structures.  */
     if (type == TCG_TYPE_I64) {
         intptr_t src_rx = (intptr_t)tcg_splitwx_to_rx(s->code_ptr);
-        tcg_target_long disp = value - src_rx;
+        intptr_t disp = value - src_rx;
         if (disp == sextract64(disp, 0, 21)) {
             tcg_out_insn(s, 3406, ADR, rd, disp);
             return;
@@ -1302,7 +1302,7 @@ static inline void tcg_out_dep(TCGContext *s, TCGType ext, TCGReg rd,
 }
 
 static void tcg_out_cmp(TCGContext *s, TCGType ext, TCGReg a,
-                        tcg_target_long b, bool const_b)
+                        intptr_t b, bool const_b)
 {
     if (const_b) {
         /* Using CMP or CMN aliases.  */
@@ -1453,7 +1453,7 @@ static void tcg_out_addsubi(TCGContext *s, int ext, TCGReg rd,
 
 static void tcg_out_addsub2(TCGContext *s, TCGType ext, TCGReg rl,
                             TCGReg rh, TCGReg al, TCGReg ah,
-                            tcg_target_long bl, tcg_target_long bh,
+                            intptr_t bl, intptr_t bh,
                             bool const_bl, bool const_bh, bool sub)
 {
     TCGReg orig_rl = rl;
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 2c6c353eea..8edca05972 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -2527,7 +2527,7 @@ static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg)
 }
 
 static void tcg_out_movi(TCGContext *s, TCGType type,
-                         TCGReg ret, tcg_target_long arg)
+                         TCGReg ret, intptr_t arg)
 {
     tcg_debug_assert(type == TCG_TYPE_I32);
     tcg_debug_assert(ret < TCG_REG_Q0);
@@ -3032,7 +3032,7 @@ static void tcg_out_nop_fill(tcg_insn_unit *p, int count)
 /* Compute frame size via macros, to share between tcg_target_qemu_prologue
    and tcg_register_jit.  */
 
-#define PUSH_SIZE  ((11 - 4 + 1 + 1) * sizeof(tcg_target_long))
+#define PUSH_SIZE  ((11 - 4 + 1 + 1) * sizeof(intptr_t))
 
 #define FRAME_SIZE \
     ((PUSH_SIZE \
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index cb04e4b3ad..728080486a 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -997,7 +997,7 @@ static void tcg_out_dupi_vec(TCGContext *s, TCGType type, unsigned vece,
 }
 
 static void tcg_out_movi_vec(TCGContext *s, TCGType type,
-                             TCGReg ret, tcg_target_long arg)
+                             TCGReg ret, intptr_t arg)
 {
     if (arg == 0) {
         tcg_out_vex_modrm(s, OPC_PXOR, ret, ret, ret);
@@ -1018,9 +1018,9 @@ static void tcg_out_movi_vec(TCGContext *s, TCGType type,
 }
 
 static void tcg_out_movi_int(TCGContext *s, TCGType type,
-                             TCGReg ret, tcg_target_long arg)
+                             TCGReg ret, intptr_t arg)
 {
-    tcg_target_long diff;
+    intptr_t diff;
 
     if (arg == 0) {
         tgen_arithr(s, ARITH_XOR, ret, ret);
@@ -1051,7 +1051,7 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type,
 }
 
 static void tcg_out_movi(TCGContext *s, TCGType type,
-                         TCGReg ret, tcg_target_long arg)
+                         TCGReg ret, intptr_t arg)
 {
     switch (type) {
     case TCG_TYPE_I32:
@@ -1069,7 +1069,7 @@ static void tcg_out_movi(TCGContext *s, TCGType type,
     }
 }
 
-static inline void tcg_out_pushi(TCGContext *s, tcg_target_long val)
+static inline void tcg_out_pushi(TCGContext *s, intptr_t val)
 {
     if (val == (int8_t)val) {
         tcg_out_opc(s, OPC_PUSH_Ib, 0, 0, 0);
@@ -1278,7 +1278,7 @@ static inline void tcg_out_bswap64(TCGContext *s, int reg)
 }
 
 static void tgen_arithi(TCGContext *s, int c, int r0,
-                        tcg_target_long val, int cf)
+                        intptr_t val, int cf)
 {
     int rexw = 0;
 
@@ -1338,7 +1338,7 @@ static void tgen_arithi(TCGContext *s, int c, int r0,
     tcg_abort();
 }
 
-static void tcg_out_addi(TCGContext *s, int reg, tcg_target_long val)
+static void tcg_out_addi(TCGContext *s, int reg, intptr_t val)
 {
     if (val != 0) {
         tgen_arithi(s, ARITH_ADD + P_REXW, reg, val, 0);
@@ -1902,7 +1902,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 #endif
     case MO_UB:
     case MO_UW:
-        /* Note that the helpers have zero-extended to tcg_target_long.  */
+        /* Note that the helpers have zero-extended to intptr_t.  */
     case MO_UL:
         tcg_out_mov(s, TCG_TYPE_I32, data_reg, TCG_REG_EAX);
         break;
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index d326e28740..9e0d819eb3 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -144,7 +144,7 @@ static const int tcg_target_call_oarg_regs[] = {
 #endif
 
 
-static inline tcg_target_long sextreg(tcg_target_long val, int pos, int len)
+static inline intptr_t sextreg(intptr_t val, int pos, int len)
 {
     return sextract64(val, pos, len);
 }
@@ -275,7 +275,7 @@ static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg)
 }
 
 static bool imm_part_needs_loading(bool high_bits_are_ones,
-                                   tcg_target_long part)
+                                   intptr_t part)
 {
     if (high_bits_are_ones) {
         return part != -1;
@@ -287,8 +287,8 @@ static bool imm_part_needs_loading(bool high_bits_are_ones,
 /* Loads a 32-bit immediate into rd, sign-extended.  */
 static void tcg_out_movi_i32(TCGContext *s, TCGReg rd, int32_t val)
 {
-    tcg_target_long lo = sextreg(val, 0, 12);
-    tcg_target_long hi12 = sextreg(val, 12, 20);
+    intptr_t lo = sextreg(val, 0, 12);
+    intptr_t hi12 = sextreg(val, 12, 20);
 
     /* Single-instruction cases.  */
     if (lo == val) {
@@ -310,7 +310,7 @@ static void tcg_out_movi_i32(TCGContext *s, TCGReg rd, int32_t val)
 }
 
 static void tcg_out_movi(TCGContext *s, TCGType type, TCGReg rd,
-                         tcg_target_long val)
+                         intptr_t val)
 {
     /*
      * LoongArch conventionally loads 64-bit immediates in at most 4 steps,
@@ -333,8 +333,8 @@ static void tcg_out_movi(TCGContext *s, TCGType type, TCGReg rd,
      */
 
     intptr_t pc_offset;
-    tcg_target_long val_lo, val_hi, pc_hi, offset_hi;
-    tcg_target_long hi32, hi52;
+    intptr_t val_lo, val_hi, pc_hi, offset_hi;
+    intptr_t hi32, hi52;
     bool rd_high_bits_are_ones;
 
     /* Value fits in signed i32.  */
@@ -554,14 +554,14 @@ static void tcg_out_call_int(TCGContext *s, const tcg_insn_unit *arg, bool tail)
         }
     } else if (offset == sextreg(offset, 0, 38)) {
         /* long jump: +/- 256GiB */
-        tcg_target_long lo = sextreg(offset, 0, 18);
-        tcg_target_long hi = offset - lo;
+        intptr_t lo = sextreg(offset, 0, 18);
+        intptr_t hi = offset - lo;
         tcg_out_opc_pcaddu18i(s, TCG_REG_TMP0, hi >> 18);
         tcg_out_opc_jirl(s, link, TCG_REG_TMP0, lo >> 2);
     } else {
         /* far jump: 64-bit */
-        tcg_target_long lo = sextreg((tcg_target_long)arg, 0, 18);
-        tcg_target_long hi = (tcg_target_long)arg - lo;
+        intptr_t lo = sextreg((intptr_t)arg, 0, 18);
+        intptr_t hi = (intptr_t)arg - lo;
         tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_TMP0, hi);
         tcg_out_opc_jirl(s, link, TCG_REG_TMP0, lo >> 2);
     }
@@ -687,7 +687,7 @@ static void tcg_out_tlb_load(TCGContext *s, TCGReg addrl, MemOpIdx oi,
     MemOp opc = get_memop(oi);
     unsigned s_bits = opc & MO_SIZE;
     unsigned a_bits = get_alignment_bits(opc);
-    tcg_target_long compare_mask;
+    intptr_t compare_mask;
     int mem_index = get_mmuidx(oi);
     int fast_ofs = TLB_MASK_TABLE_OFS(mem_index);
     int mask_ofs = fast_ofs + offsetof(CPUTLBDescFast, mask);
@@ -713,7 +713,7 @@ static void tcg_out_tlb_load(TCGContext *s, TCGReg addrl, MemOpIdx oi,
         a_bits = s_bits;
     }
     /* Clear the non-page, non-alignment bits from the address.  */
-    compare_mask = (tcg_target_long)TARGET_PAGE_MASK | ((1 << a_bits) - 1);
+    compare_mask = (intptr_t)TARGET_PAGE_MASK | ((1 << a_bits) - 1);
     tcg_out_movi(s, TCG_TYPE_TL, TCG_REG_TMP1, compare_mask);
     tcg_out_opc_and(s, TCG_REG_TMP1, TCG_REG_TMP1, addrl);
 
@@ -758,7 +758,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_A0, TCG_AREG0);
     tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_A1, l->addrlo_reg);
     tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_A2, oi);
-    tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_A3, (tcg_target_long)l->raddr);
+    tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_A3, (intptr_t)l->raddr);
 
     tcg_out_call(s, qemu_ld_helpers[size]);
 
@@ -819,7 +819,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
         break;
     }
     tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_A3, oi);
-    tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_A4, (tcg_target_long)l->raddr);
+    tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_A4, (intptr_t)l->raddr);
 
     tcg_out_call(s, qemu_st_helpers[size]);
 
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index bd76f0c97f..817ec8f232 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -189,7 +189,7 @@ static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
 #endif
 
 
-static bool is_p2m1(tcg_target_long val)
+static bool is_p2m1(intptr_t val)
 {
     return val && ((val + 1) & val) == 0;
 }
@@ -520,7 +520,7 @@ static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg)
 }
 
 static void tcg_out_movi(TCGContext *s, TCGType type,
-                         TCGReg ret, tcg_target_long arg)
+                         TCGReg ret, intptr_t arg)
 {
     if (TCG_TARGET_REG_BITS == 64 && type == TCG_TYPE_I32) {
         arg = (int32_t)arg;
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index e3dba47697..aaa5b29d2a 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -208,7 +208,7 @@ static const int tcg_target_callee_save_regs[] = {
     TCG_REG_R31
 };
 
-static inline bool in_range_b(tcg_target_long target)
+static inline bool in_range_b(intptr_t target)
 {
     return target == sextract64(target, 0, 26);
 }
@@ -701,7 +701,7 @@ static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
 }
 
 static void tcg_out_mem_long(TCGContext *s, int opi, int opx, TCGReg rt,
-                             TCGReg base, tcg_target_long offset);
+                             TCGReg base, intptr_t offset);
 
 static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg)
 {
@@ -924,7 +924,7 @@ static void tcg_out_bswap64(TCGContext *s, TCGReg dst, TCGReg src)
 }
 
 /* Emit a move into ret of arg, if it can be done in one insn.  */
-static bool tcg_out_movi_one(TCGContext *s, TCGReg ret, tcg_target_long arg)
+static bool tcg_out_movi_one(TCGContext *s, TCGReg ret, intptr_t arg)
 {
     if (arg == (int16_t)arg) {
         tcg_out32(s, ADDI | TAI(ret, 0, arg));
@@ -938,10 +938,10 @@ static bool tcg_out_movi_one(TCGContext *s, TCGReg ret, tcg_target_long arg)
 }
 
 static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
-                             tcg_target_long arg, bool in_prologue)
+                             intptr_t arg, bool in_prologue)
 {
     intptr_t tb_diff;
-    tcg_target_long tmp;
+    intptr_t tmp;
     int shift;
 
     tcg_debug_assert(TCG_TARGET_REG_BITS == 64 || type == TCG_TYPE_I32);
@@ -1104,7 +1104,7 @@ static void tcg_out_dupi_vec(TCGContext *s, TCGType type, unsigned vece,
 }
 
 static void tcg_out_movi(TCGContext *s, TCGType type, TCGReg ret,
-                         tcg_target_long arg)
+                         intptr_t arg)
 {
     switch (type) {
     case TCG_TYPE_I32:
@@ -1243,9 +1243,9 @@ static void tcg_out_b(TCGContext *s, int mask, const tcg_insn_unit *target)
 }
 
 static void tcg_out_mem_long(TCGContext *s, int opi, int opx, TCGReg rt,
-                             TCGReg base, tcg_target_long offset)
+                             TCGReg base, intptr_t offset)
 {
-    tcg_target_long orig = offset, l0, l1, extra = 0, align = 0;
+    intptr_t orig = offset, l0, l1, extra = 0, align = 0;
     bool is_int_store = false;
     TCGReg rs = TCG_REG_TMP1;
 
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 81a83e45b1..0c0f54dc1b 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -136,7 +136,7 @@ static const int tcg_target_call_oarg_regs[] = {
 #endif
 
 
-static inline tcg_target_long sextreg(tcg_target_long val, int pos, int len)
+static inline intptr_t sextreg(intptr_t val, int pos, int len)
 {
     if (TCG_TARGET_REG_BITS == 32) {
         return sextract32(val, pos, len);
@@ -479,9 +479,9 @@ static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg)
 }
 
 static void tcg_out_movi(TCGContext *s, TCGType type, TCGReg rd,
-                         tcg_target_long val)
+                         intptr_t val)
 {
-    tcg_target_long lo, hi, tmp;
+    intptr_t lo, hi, tmp;
     int shift, ret;
 
     if (TCG_TARGET_REG_BITS == 64 && type == TCG_TYPE_I32) {
@@ -810,8 +810,8 @@ static void tcg_out_call_int(TCGContext *s, const tcg_insn_unit *arg, bool tail)
         tcg_debug_assert(ret == true);
     } else if (TCG_TARGET_REG_BITS == 64) {
         /* far jump: 64-bit */
-        tcg_target_long imm = sextreg((tcg_target_long)arg, 0, 12);
-        tcg_target_long base = (tcg_target_long)arg - imm;
+        intptr_t imm = sextreg((intptr_t)arg, 0, 12);
+        intptr_t base = (intptr_t)arg - imm;
         tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_TMP0, base);
         tcg_out_opc_imm(s, OPC_JALR, link, TCG_REG_TMP0, imm);
     } else {
@@ -911,7 +911,7 @@ static void tcg_out_tlb_load(TCGContext *s, TCGReg addrl,
     MemOp opc = get_memop(oi);
     unsigned s_bits = opc & MO_SIZE;
     unsigned a_bits = get_alignment_bits(opc);
-    tcg_target_long compare_mask;
+    intptr_t compare_mask;
     int mem_index = get_mmuidx(oi);
     int fast_ofs = TLB_MASK_TABLE_OFS(mem_index);
     int mask_ofs = fast_ofs + offsetof(CPUTLBDescFast, mask);
@@ -938,7 +938,7 @@ static void tcg_out_tlb_load(TCGContext *s, TCGReg addrl,
         a_bits = s_bits;
     }
     /* Clear the non-page, non-alignment bits from the address.  */
-    compare_mask = (tcg_target_long)TARGET_PAGE_MASK | ((1 << a_bits) - 1);
+    compare_mask = (intptr_t)TARGET_PAGE_MASK | ((1 << a_bits) - 1);
     if (compare_mask == sextreg(compare_mask, 0, 12)) {
         tcg_out_opc_imm(s, OPC_ANDI, TCG_REG_TMP1, addrl, compare_mask);
     } else {
@@ -1000,7 +1000,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     tcg_out_mov(s, TCG_TYPE_PTR, a0, TCG_AREG0);
     tcg_out_mov(s, TCG_TYPE_PTR, a1, l->addrlo_reg);
     tcg_out_movi(s, TCG_TYPE_PTR, a2, oi);
-    tcg_out_movi(s, TCG_TYPE_PTR, a3, (tcg_target_long)l->raddr);
+    tcg_out_movi(s, TCG_TYPE_PTR, a3, (intptr_t)l->raddr);
 
     tcg_out_call(s, qemu_ld_helpers[opc & MO_SSIZE]);
     tcg_out_mov(s, (opc & MO_SIZE) == MO_64, l->datalo_reg, a0);
@@ -1045,7 +1045,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
         break;
     }
     tcg_out_movi(s, TCG_TYPE_PTR, a3, oi);
-    tcg_out_movi(s, TCG_TYPE_PTR, a4, (tcg_target_long)l->raddr);
+    tcg_out_movi(s, TCG_TYPE_PTR, a4, (intptr_t)l->raddr);
 
     tcg_out_call(s, qemu_st_helpers[opc & MO_SIZE]);
 
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index f1d3907cd8..94a5fc8cc6 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -785,7 +785,7 @@ static const S390Opcode lli_insns[4] = {
 };
 
 static bool maybe_out_small_movi(TCGContext *s, TCGType type,
-                                 TCGReg ret, tcg_target_long sval)
+                                 TCGReg ret, intptr_t sval)
 {
     tcg_target_ulong uval = sval;
     int i;
@@ -802,7 +802,7 @@ static bool maybe_out_small_movi(TCGContext *s, TCGType type,
     }
 
     for (i = 0; i < 4; i++) {
-        tcg_target_long mask = 0xffffull << i * 16;
+        intptr_t mask = 0xffffull << i * 16;
         if ((uval & mask) == uval) {
             tcg_out_insn_RI(s, lli_insns[i], ret, uval >> i * 16);
             return true;
@@ -814,7 +814,7 @@ static bool maybe_out_small_movi(TCGContext *s, TCGType type,
 
 /* load a register with an immediate value */
 static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
-                             tcg_target_long sval, bool in_prologue)
+                             intptr_t sval, bool in_prologue)
 {
     tcg_target_ulong uval;
 
@@ -889,7 +889,7 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
 }
 
 static void tcg_out_movi(TCGContext *s, TCGType type,
-                         TCGReg ret, tcg_target_long sval)
+                         TCGReg ret, intptr_t sval)
 {
     tcg_out_movi_int(s, type, ret, sval, false);
 }
@@ -902,12 +902,12 @@ static void tcg_out_movi(TCGContext *s, TCGType type,
 
 static void tcg_out_mem(TCGContext *s, S390Opcode opc_rx, S390Opcode opc_rxy,
                         TCGReg data, TCGReg base, TCGReg index,
-                        tcg_target_long ofs)
+                        intptr_t ofs)
 {
     if (ofs < -0x80000 || ofs >= 0x80000) {
         /* Combine the low 20 bits of the offset with the actual load insn;
            the high 44 bits must come from an immediate load.  */
-        tcg_target_long low = ((ofs & 0xfffff) ^ 0x80000) - 0x80000;
+        intptr_t low = ((ofs & 0xfffff) ^ 0x80000) - 0x80000;
         tcg_out_movi(s, TCG_TYPE_PTR, TCG_TMP0, ofs - low);
         ofs = low;
 
@@ -927,7 +927,7 @@ static void tcg_out_mem(TCGContext *s, S390Opcode opc_rx, S390Opcode opc_rxy,
 
 static void tcg_out_vrx_mem(TCGContext *s, S390Opcode opc_vrx,
                             TCGReg data, TCGReg base, TCGReg index,
-                            tcg_target_long ofs, int m3)
+                            intptr_t ofs, int m3)
 {
     if (ofs < 0 || ofs >= 0x1000) {
         if (ofs >= -0x80000 && ofs < 0x80000) {
@@ -1992,7 +1992,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 }
 
 static void tcg_prepare_user_ldst(TCGContext *s, TCGReg *addr_reg,
-                                  TCGReg *index_reg, tcg_target_long *disp)
+                                  TCGReg *index_reg, intptr_t *disp)
 {
     if (TARGET_LONG_BITS == 32) {
         tgen_ext32u(s, TCG_TMP0, *addr_reg);
@@ -2028,7 +2028,7 @@ static void tcg_out_qemu_ld(TCGContext* s, TCGReg data_reg, TCGReg addr_reg,
     add_qemu_ldst_label(s, 1, oi, data_reg, addr_reg, s->code_ptr, label_ptr);
 #else
     TCGReg index_reg;
-    tcg_target_long disp;
+    intptr_t disp;
     unsigned a_bits = get_alignment_bits(opc);
 
     if (a_bits) {
@@ -2059,7 +2059,7 @@ static void tcg_out_qemu_st(TCGContext* s, TCGReg data_reg, TCGReg addr_reg,
     add_qemu_ldst_label(s, 0, oi, data_reg, addr_reg, s->code_ptr, label_ptr);
 #else
     TCGReg index_reg;
-    tcg_target_long disp;
+    intptr_t disp;
     unsigned a_bits = get_alignment_bits(opc);
 
     if (a_bits) {
diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index cb9453efdd..46f6e106e6 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -420,11 +420,11 @@ static void tcg_out_movi_imm32(TCGContext *s, TCGReg ret, int32_t arg)
 }
 
 static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
-                             tcg_target_long arg, bool in_prologue,
+                             intptr_t arg, bool in_prologue,
                              TCGReg scratch)
 {
-    tcg_target_long hi, lo = (int32_t)arg;
-    tcg_target_long test, lsb;
+    intptr_t hi, lo = (int32_t)arg;
+    intptr_t test, lsb;
 
     /* A 32-bit constant, or 32-bit zero-extended to 64-bits.  */
     if (type == TCG_TYPE_I32 || arg == (uint32_t)arg) {
@@ -456,7 +456,7 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
 
     /* A 32-bit constant, shifted.  */
     lsb = ctz64(arg);
-    test = (tcg_target_long)arg >> lsb;
+    test = (intptr_t)arg >> lsb;
     if (lsb > 10 && test == extract64(test, 0, 21)) {
         tcg_out_sethi(s, ret, test << 10);
         tcg_out_arithi(s, ret, ret, lsb - 10, SHIFT_SLLX);
@@ -491,7 +491,7 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
 }
 
 static void tcg_out_movi(TCGContext *s, TCGType type,
-                         TCGReg ret, tcg_target_long arg)
+                         TCGReg ret, intptr_t arg)
 {
     tcg_debug_assert(ret != TCG_REG_T2);
     tcg_out_movi_int(s, type, ret, arg, false, TCG_REG_T2);
@@ -1081,7 +1081,7 @@ static TCGReg tcg_out_tlb_load(TCGContext *s, TCGReg addr, int mem_index,
     const TCGReg r2 = TCG_REG_O2;
     unsigned s_bits = opc & MO_SIZE;
     unsigned a_bits = get_alignment_bits(opc);
-    tcg_target_long compare_mask;
+    intptr_t compare_mask;
 
     /* Load tlb_mask[mmu_idx] and tlb_table[mmu_idx].  */
     tcg_out_ld(s, TCG_TYPE_PTR, r0, TCG_AREG0, mask_off);
diff --git a/tcg/tcg-op-vec.c b/tcg/tcg-op-vec.c
index 463dabf515..818c401f0f 100644
--- a/tcg/tcg-op-vec.c
+++ b/tcg/tcg-op-vec.c
@@ -288,7 +288,7 @@ void tcg_gen_dup_i32_vec(unsigned vece, TCGv_vec r, TCGv_i32 a)
 }
 
 void tcg_gen_dup_mem_vec(unsigned vece, TCGv_vec r, TCGv_ptr b,
-                         tcg_target_long ofs)
+                         intptr_t ofs)
 {
     TCGArg ri = tcgv_vec_arg(r);
     TCGArg bi = tcgv_ptr_arg(b);
diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index 019fab00cc..9055cd28c2 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -1122,43 +1122,43 @@ void tcg_gen_movi_i64(TCGv_i64 ret, int64_t arg)
     tcg_gen_movi_i32(TCGV_HIGH(ret), arg >> 32);
 }
 
-void tcg_gen_ld8u_i64(TCGv_i64 ret, TCGv_ptr arg2, tcg_target_long offset)
+void tcg_gen_ld8u_i64(TCGv_i64 ret, TCGv_ptr arg2, intptr_t offset)
 {
     tcg_gen_ld8u_i32(TCGV_LOW(ret), arg2, offset);
     tcg_gen_movi_i32(TCGV_HIGH(ret), 0);
 }
 
-void tcg_gen_ld8s_i64(TCGv_i64 ret, TCGv_ptr arg2, tcg_target_long offset)
+void tcg_gen_ld8s_i64(TCGv_i64 ret, TCGv_ptr arg2, intptr_t offset)
 {
     tcg_gen_ld8s_i32(TCGV_LOW(ret), arg2, offset);
     tcg_gen_sari_i32(TCGV_HIGH(ret), TCGV_LOW(ret), 31);
 }
 
-void tcg_gen_ld16u_i64(TCGv_i64 ret, TCGv_ptr arg2, tcg_target_long offset)
+void tcg_gen_ld16u_i64(TCGv_i64 ret, TCGv_ptr arg2, intptr_t offset)
 {
     tcg_gen_ld16u_i32(TCGV_LOW(ret), arg2, offset);
     tcg_gen_movi_i32(TCGV_HIGH(ret), 0);
 }
 
-void tcg_gen_ld16s_i64(TCGv_i64 ret, TCGv_ptr arg2, tcg_target_long offset)
+void tcg_gen_ld16s_i64(TCGv_i64 ret, TCGv_ptr arg2, intptr_t offset)
 {
     tcg_gen_ld16s_i32(TCGV_LOW(ret), arg2, offset);
     tcg_gen_sari_i32(TCGV_HIGH(ret), TCGV_LOW(ret), 31);
 }
 
-void tcg_gen_ld32u_i64(TCGv_i64 ret, TCGv_ptr arg2, tcg_target_long offset)
+void tcg_gen_ld32u_i64(TCGv_i64 ret, TCGv_ptr arg2, intptr_t offset)
 {
     tcg_gen_ld_i32(TCGV_LOW(ret), arg2, offset);
     tcg_gen_movi_i32(TCGV_HIGH(ret), 0);
 }
 
-void tcg_gen_ld32s_i64(TCGv_i64 ret, TCGv_ptr arg2, tcg_target_long offset)
+void tcg_gen_ld32s_i64(TCGv_i64 ret, TCGv_ptr arg2, intptr_t offset)
 {
     tcg_gen_ld_i32(TCGV_LOW(ret), arg2, offset);
     tcg_gen_sari_i32(TCGV_HIGH(ret), TCGV_LOW(ret), 31);
 }
 
-void tcg_gen_ld_i64(TCGv_i64 ret, TCGv_ptr arg2, tcg_target_long offset)
+void tcg_gen_ld_i64(TCGv_i64 ret, TCGv_ptr arg2, intptr_t offset)
 {
     /* Since arg2 and ret have different types,
        they cannot be the same temporary */
@@ -1171,7 +1171,7 @@ void tcg_gen_ld_i64(TCGv_i64 ret, TCGv_ptr arg2, tcg_target_long offset)
 #endif
 }
 
-void tcg_gen_st_i64(TCGv_i64 arg1, TCGv_ptr arg2, tcg_target_long offset)
+void tcg_gen_st_i64(TCGv_i64 arg1, TCGv_ptr arg2, intptr_t offset)
 {
 #if HOST_BIG_ENDIAN
     tcg_gen_st_i32(TCGV_HIGH(arg1), arg2, offset);
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 436fcf6ebd..73fae94559 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -106,7 +106,7 @@ static void tcg_out_ld(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg1,
                        intptr_t arg2);
 static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg);
 static void tcg_out_movi(TCGContext *s, TCGType type,
-                         TCGReg ret, tcg_target_long arg);
+                         TCGReg ret, intptr_t arg);
 static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                        const TCGArg args[TCG_MAX_OP_ARGS],
                        const int const_args[TCG_MAX_OP_ARGS]);
@@ -3888,7 +3888,7 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
     }
 
     /* assign stack slots first */
-    call_stack_size = (nb_iargs - nb_regs) * sizeof(tcg_target_long);
+    call_stack_size = (nb_iargs - nb_regs) * sizeof(intptr_t);
     call_stack_size = (call_stack_size + TCG_TARGET_STACK_ALIGN - 1) & 
         ~(TCG_TARGET_STACK_ALIGN - 1);
     allocate_args = (call_stack_size > TCG_STATIC_CALL_ARGS_SIZE);
@@ -3902,7 +3902,7 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
     for (i = nb_regs; i < nb_iargs; i++) {
         arg = op->args[nb_oargs + i];
 #ifdef TCG_TARGET_STACK_GROWSUP
-        stack_offset -= sizeof(tcg_target_long);
+        stack_offset -= sizeof(intptr_t);
 #endif
         if (arg != TCG_CALL_DUMMY_ARG) {
             ts = arg_temp(arg);
@@ -3911,7 +3911,7 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
             tcg_out_st(s, ts->type, ts->reg, TCG_REG_CALL_STACK, stack_offset);
         }
 #ifndef TCG_TARGET_STACK_GROWSUP
-        stack_offset += sizeof(tcg_target_long);
+        stack_offset += sizeof(intptr_t);
 #endif
     }
     
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index f3d7441e06..39f2eb7075 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -535,7 +535,7 @@ static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg)
 }
 
 static void tcg_out_movi(TCGContext *s, TCGType type,
-                         TCGReg ret, tcg_target_long arg)
+                         TCGReg ret, intptr_t arg)
 {
     switch (type) {
     case TCG_TYPE_I32:
-- 
2.38.1


