Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p0N7c-0003rJ-4N
	for mharc-qemu-riscv@gnu.org; Wed, 30 Nov 2022 08:27:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0N7S-0003dh-Ds
 for qemu-riscv@nongnu.org; Wed, 30 Nov 2022 08:27:24 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0N7K-0006S6-64
 for qemu-riscv@nongnu.org; Wed, 30 Nov 2022 08:27:18 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 r133-20020a1c448b000000b003d076ee89d6so367242wma.0
 for <qemu-riscv@nongnu.org>; Wed, 30 Nov 2022 05:27:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IcsIpKg4JdA80wVRqIfBoG/l/9s3DGPhsJA/Nzx8myc=;
 b=OBZSEnUcgBwoLJOVg4rWGOhoZciCB0sHzs8zUa41bM36ry6aAdTDhg3l93GxopU3Jc
 +DygEpHkXQXeGpFHGM0UCIbMGXNvMB3lm0M1zZWvFjG4D0/VDMoS3BlMALD8Z2S0pe5M
 L+2ZNKzISpwd8jz6x6xDcJQ7z1nakknssSnOQ0MzHuQ81411Kb20sAN1XdDPIk/4TXez
 lP5oPiOy8Ip4CCpvxeLCglAwN/dN9WX5+BoFBO9JzghwSa2VhNmyArW90KGulikUNHwE
 AiKoEl0eDV26NmINpvP8/Jdy/iif6Xc1m3Y+QaHkQn9Irw1JUjYZNbfe8KGS00dd1O3D
 G1ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IcsIpKg4JdA80wVRqIfBoG/l/9s3DGPhsJA/Nzx8myc=;
 b=kiVBJVLyWv+50/FTixRkXsPa4w7GJj31R6dJTnuYkkNKc0fu9DfHlhOfaLsiCx7S9j
 +S6dwKs3KFg7GxQMzinIqnZnDTosfsxL+tgFqbmFApXC39+JIJfVxAXTuXND9i3aV9FG
 JQhjuvMs3J6/1yFwxq3+guOMpF0kMtW/Sugx+FvfPgKOq38PJs4Q28YNy+uLRvO+qewe
 LzDR9UGFZgO98jAeKGVVZhkLmWQHWGBwxaNM/aLoWwELnZwEi/R0uz9wtJMLp1gPWwPe
 zcxn/1PqZhXTn+Q2uFFOymZZSrrTM/zGc/bjMU6mjIP5ntPltbri8SOZmz7ZdQZ1QVlF
 VdiA==
X-Gm-Message-State: ANoB5pmjAwDXyhjkaAwDzDYEzFQaBmqADFc35lPP/8P+/KSSGFjGBBR5
 EQ1ixpIVvVNJWzeziHD0fDDRL7jXb8oU6Lkr
X-Google-Smtp-Source: AA0mqf4530+Bf0luGY76KolTbj6XxobKiiKyeqcEmRowfs7oaJMErJXhdco++9wKzhDG2sPDx2VBog==
X-Received: by 2002:a05:600c:4fcd:b0:3cf:7514:a80d with SMTP id
 o13-20020a05600c4fcd00b003cf7514a80dmr3043360wmq.0.1669814832657; 
 Wed, 30 Nov 2022 05:27:12 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 g3-20020a5d5543000000b0022cc0a2cbecsm1624393wrw.15.2022.11.30.05.27.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 30 Nov 2022 05:27:12 -0800 (PST)
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
Subject: [PATCH-for-8.0 3/3] tcg: Replace tcg_target_ulong -> uintptr_t
Date: Wed, 30 Nov 2022 14:26:54 +0100
Message-Id: <20221130132654.76369-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221130132654.76369-1-philmd@linaro.org>
References: <20221130132654.76369-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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
X-List-Received-Date: Wed, 30 Nov 2022 13:27:30 -0000

Mechanical transformation using:

 $ sed -e 's/tcg_target_ulong/uintptr_t/g' \
       -e 's/TCG_PRIlx/PRIxPTR/g' \
       -i $(git grep -lE '(tcg_target_ulong|TCG_PRIlx)')

Simplify the check for unsupported TCG_TARGET_REG_BITS
in include/tcg/tcg.h.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/tcg/cputlb.c                    | 40 +++++++++++++--------------
 accel/tcg/translate-all.c             | 12 ++++----
 docs/devel/control-flow-integrity.rst |  2 +-
 include/tcg/tcg-ldst.h                | 40 +++++++++++++--------------
 include/tcg/tcg.h                     | 14 ++--------
 tcg/optimize.c                        |  8 +++---
 tcg/s390x/tcg-target.c.inc            | 12 ++++----
 tcg/sparc64/tcg-target.c.inc          |  2 +-
 tcg/tcg-pool.c.inc                    | 32 ++++++++++-----------
 tcg/tcg.c                             | 16 +++++------
 tcg/tci.c                             | 18 ++++++------
 11 files changed, 94 insertions(+), 102 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 32caf115ed..cc86138e6e 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -2029,8 +2029,8 @@ static uint64_t full_ldub_mmu(CPUArchState *env, target_ulong addr,
     return load_helper(env, addr, oi, retaddr, MO_UB, false, full_ldub_mmu);
 }
 
-tcg_target_ulong helper_ret_ldub_mmu(CPUArchState *env, target_ulong addr,
-                                     MemOpIdx oi, uintptr_t retaddr)
+uintptr_t helper_ret_ldub_mmu(CPUArchState *env, target_ulong addr,
+                              MemOpIdx oi, uintptr_t retaddr)
 {
     return full_ldub_mmu(env, addr, oi, retaddr);
 }
@@ -2043,8 +2043,8 @@ static uint64_t full_le_lduw_mmu(CPUArchState *env, target_ulong addr,
                        full_le_lduw_mmu);
 }
 
-tcg_target_ulong helper_le_lduw_mmu(CPUArchState *env, target_ulong addr,
-                                    MemOpIdx oi, uintptr_t retaddr)
+uintptr_t helper_le_lduw_mmu(CPUArchState *env, target_ulong addr,
+                             MemOpIdx oi, uintptr_t retaddr)
 {
     return full_le_lduw_mmu(env, addr, oi, retaddr);
 }
@@ -2057,8 +2057,8 @@ static uint64_t full_be_lduw_mmu(CPUArchState *env, target_ulong addr,
                        full_be_lduw_mmu);
 }
 
-tcg_target_ulong helper_be_lduw_mmu(CPUArchState *env, target_ulong addr,
-                                    MemOpIdx oi, uintptr_t retaddr)
+uintptr_t helper_be_lduw_mmu(CPUArchState *env, target_ulong addr,
+                             MemOpIdx oi, uintptr_t retaddr)
 {
     return full_be_lduw_mmu(env, addr, oi, retaddr);
 }
@@ -2071,8 +2071,8 @@ static uint64_t full_le_ldul_mmu(CPUArchState *env, target_ulong addr,
                        full_le_ldul_mmu);
 }
 
-tcg_target_ulong helper_le_ldul_mmu(CPUArchState *env, target_ulong addr,
-                                    MemOpIdx oi, uintptr_t retaddr)
+uintptr_t helper_le_ldul_mmu(CPUArchState *env, target_ulong addr,
+                             MemOpIdx oi, uintptr_t retaddr)
 {
     return full_le_ldul_mmu(env, addr, oi, retaddr);
 }
@@ -2085,8 +2085,8 @@ static uint64_t full_be_ldul_mmu(CPUArchState *env, target_ulong addr,
                        full_be_ldul_mmu);
 }
 
-tcg_target_ulong helper_be_ldul_mmu(CPUArchState *env, target_ulong addr,
-                                    MemOpIdx oi, uintptr_t retaddr)
+uintptr_t helper_be_ldul_mmu(CPUArchState *env, target_ulong addr,
+                             MemOpIdx oi, uintptr_t retaddr)
 {
     return full_be_ldul_mmu(env, addr, oi, retaddr);
 }
@@ -2113,32 +2113,32 @@ uint64_t helper_be_ldq_mmu(CPUArchState *env, target_ulong addr,
  */
 
 
-tcg_target_ulong helper_ret_ldsb_mmu(CPUArchState *env, target_ulong addr,
-                                     MemOpIdx oi, uintptr_t retaddr)
+uintptr_t helper_ret_ldsb_mmu(CPUArchState *env, target_ulong addr,
+                              MemOpIdx oi, uintptr_t retaddr)
 {
     return (int8_t)helper_ret_ldub_mmu(env, addr, oi, retaddr);
 }
 
-tcg_target_ulong helper_le_ldsw_mmu(CPUArchState *env, target_ulong addr,
-                                    MemOpIdx oi, uintptr_t retaddr)
+uintptr_t helper_le_ldsw_mmu(CPUArchState *env, target_ulong addr,
+                             MemOpIdx oi, uintptr_t retaddr)
 {
     return (int16_t)helper_le_lduw_mmu(env, addr, oi, retaddr);
 }
 
-tcg_target_ulong helper_be_ldsw_mmu(CPUArchState *env, target_ulong addr,
-                                    MemOpIdx oi, uintptr_t retaddr)
+uintptr_t helper_be_ldsw_mmu(CPUArchState *env, target_ulong addr,
+                             MemOpIdx oi, uintptr_t retaddr)
 {
     return (int16_t)helper_be_lduw_mmu(env, addr, oi, retaddr);
 }
 
-tcg_target_ulong helper_le_ldsl_mmu(CPUArchState *env, target_ulong addr,
-                                    MemOpIdx oi, uintptr_t retaddr)
+uintptr_t helper_le_ldsl_mmu(CPUArchState *env, target_ulong addr,
+                             MemOpIdx oi, uintptr_t retaddr)
 {
     return (int32_t)helper_le_ldul_mmu(env, addr, oi, retaddr);
 }
 
-tcg_target_ulong helper_be_ldsl_mmu(CPUArchState *env, target_ulong addr,
-                                    MemOpIdx oi, uintptr_t retaddr)
+uintptr_t helper_be_ldsl_mmu(CPUArchState *env, target_ulong addr,
+                             MemOpIdx oi, uintptr_t retaddr)
 {
     return (int32_t)helper_be_ldul_mmu(env, addr, oi, retaddr);
 }
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index ac3ee3740c..c1ae6d61f6 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -897,7 +897,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
         FILE *logfile = qemu_log_trylock();
         if (logfile) {
             int code_size, data_size;
-            const tcg_target_ulong *rx_data_gen_ptr;
+            const uintptr_t *rx_data_gen_ptr;
             size_t chunk_start;
             int insn = 0;
 
@@ -946,14 +946,14 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
             if (data_size) {
                 int i;
                 fprintf(logfile, "  data: [size=%d]\n", data_size);
-                for (i = 0; i < data_size / sizeof(tcg_target_ulong); i++) {
-                    if (sizeof(tcg_target_ulong) == 8) {
+                for (i = 0; i < data_size / sizeof(uintptr_t); i++) {
+                    if (sizeof(uintptr_t) == 8) {
                         fprintf(logfile,
-                                "0x%08" PRIxPTR ":  .quad  0x%016" TCG_PRIlx "\n",
+                                "0x%08" PRIxPTR ":  .quad  0x%016" PRIxPTR "\n",
                                 (uintptr_t)&rx_data_gen_ptr[i], rx_data_gen_ptr[i]);
-                    } else if (sizeof(tcg_target_ulong) == 4) {
+                    } else if (sizeof(uintptr_t) == 4) {
                         fprintf(logfile,
-                                "0x%08" PRIxPTR ":  .long  0x%08" TCG_PRIlx "\n",
+                                "0x%08" PRIxPTR ":  .long  0x%08" PRIxPTR "\n",
                                 (uintptr_t)&rx_data_gen_ptr[i], rx_data_gen_ptr[i]);
                     } else {
                         qemu_build_not_reached();
diff --git a/docs/devel/control-flow-integrity.rst b/docs/devel/control-flow-integrity.rst
index e6b73a4fe1..64e77f5ab0 100644
--- a/docs/devel/control-flow-integrity.rst
+++ b/docs/devel/control-flow-integrity.rst
@@ -100,7 +100,7 @@ with CFI. An example of the use of ``QEMU_DISABLE_CFI`` is provided here::
 	 * affect the impact of CFI in environment with high security requirements
 	 */
 	QEMU_DISABLE_CFI
-	static inline tcg_target_ulong cpu_tb_exec(CPUState *cpu, TranslationBlock *itb)
+	static inline uintptr_t cpu_tb_exec(CPUState *cpu, TranslationBlock *itb)
 
 NOTE: CFI needs to be disabled at the **caller** function, (i.e. a compatible
 cfi function that calls a non-compatible one), since the check is performed
diff --git a/include/tcg/tcg-ldst.h b/include/tcg/tcg-ldst.h
index 2ba22bd5fe..f838d0feb2 100644
--- a/include/tcg/tcg-ldst.h
+++ b/include/tcg/tcg-ldst.h
@@ -28,32 +28,32 @@
 #ifdef CONFIG_SOFTMMU
 
 /* Value zero-extended to tcg register size.  */
-tcg_target_ulong helper_ret_ldub_mmu(CPUArchState *env, target_ulong addr,
-                                     MemOpIdx oi, uintptr_t retaddr);
-tcg_target_ulong helper_le_lduw_mmu(CPUArchState *env, target_ulong addr,
-                                    MemOpIdx oi, uintptr_t retaddr);
-tcg_target_ulong helper_le_ldul_mmu(CPUArchState *env, target_ulong addr,
-                                    MemOpIdx oi, uintptr_t retaddr);
+uintptr_t helper_ret_ldub_mmu(CPUArchState *env, target_ulong addr,
+                              MemOpIdx oi, uintptr_t retaddr);
+uintptr_t helper_le_lduw_mmu(CPUArchState *env, target_ulong addr,
+                             MemOpIdx oi, uintptr_t retaddr);
+uintptr_t helper_le_ldul_mmu(CPUArchState *env, target_ulong addr,
+                             MemOpIdx oi, uintptr_t retaddr);
 uint64_t helper_le_ldq_mmu(CPUArchState *env, target_ulong addr,
                            MemOpIdx oi, uintptr_t retaddr);
-tcg_target_ulong helper_be_lduw_mmu(CPUArchState *env, target_ulong addr,
-                                    MemOpIdx oi, uintptr_t retaddr);
-tcg_target_ulong helper_be_ldul_mmu(CPUArchState *env, target_ulong addr,
-                                    MemOpIdx oi, uintptr_t retaddr);
+uintptr_t helper_be_lduw_mmu(CPUArchState *env, target_ulong addr,
+                             MemOpIdx oi, uintptr_t retaddr);
+uintptr_t helper_be_ldul_mmu(CPUArchState *env, target_ulong addr,
+                             MemOpIdx oi, uintptr_t retaddr);
 uint64_t helper_be_ldq_mmu(CPUArchState *env, target_ulong addr,
                            MemOpIdx oi, uintptr_t retaddr);
 
 /* Value sign-extended to tcg register size.  */
-tcg_target_ulong helper_ret_ldsb_mmu(CPUArchState *env, target_ulong addr,
-                                     MemOpIdx oi, uintptr_t retaddr);
-tcg_target_ulong helper_le_ldsw_mmu(CPUArchState *env, target_ulong addr,
-                                    MemOpIdx oi, uintptr_t retaddr);
-tcg_target_ulong helper_le_ldsl_mmu(CPUArchState *env, target_ulong addr,
-                                    MemOpIdx oi, uintptr_t retaddr);
-tcg_target_ulong helper_be_ldsw_mmu(CPUArchState *env, target_ulong addr,
-                                    MemOpIdx oi, uintptr_t retaddr);
-tcg_target_ulong helper_be_ldsl_mmu(CPUArchState *env, target_ulong addr,
-                                    MemOpIdx oi, uintptr_t retaddr);
+uintptr_t helper_ret_ldsb_mmu(CPUArchState *env, target_ulong addr,
+                              MemOpIdx oi, uintptr_t retaddr);
+uintptr_t helper_le_ldsw_mmu(CPUArchState *env, target_ulong addr,
+                             MemOpIdx oi, uintptr_t retaddr);
+uintptr_t helper_le_ldsl_mmu(CPUArchState *env, target_ulong addr,
+                             MemOpIdx oi, uintptr_t retaddr);
+uintptr_t helper_be_ldsw_mmu(CPUArchState *env, target_ulong addr,
+                             MemOpIdx oi, uintptr_t retaddr);
+uintptr_t helper_be_ldsl_mmu(CPUArchState *env, target_ulong addr,
+                             MemOpIdx oi, uintptr_t retaddr);
 
 void helper_ret_stb_mmu(CPUArchState *env, target_ulong addr, uint8_t val,
                         MemOpIdx oi, uintptr_t retaddr);
diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 340ae55c79..f4944680fe 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -64,16 +64,8 @@
 # else
 #  error Unknown pointer size for tcg target
 # endif
-#endif
-
-#if TCG_TARGET_REG_BITS == 32
-typedef uint32_t tcg_target_ulong;
-#define TCG_PRIlx PRIx32
-#elif TCG_TARGET_REG_BITS == 64
-typedef uint64_t tcg_target_ulong;
-#define TCG_PRIlx PRIx64
-#else
-#error unsupported
+#elif !(TCG_TARGET_REG_BITS == 32 || TCG_TARGET_REG_BITS == 64)
+# error unsupported
 #endif
 
 /* Oversized TCG guests make things like MTTCG hard
@@ -341,7 +333,7 @@ static inline unsigned get_alignment_bits(MemOp memop)
     return a;
 }
 
-typedef tcg_target_ulong TCGArg;
+typedef uintptr_t TCGArg;
 
 /* Define type and accessor macros for TCG variables.
 
diff --git a/tcg/optimize.c b/tcg/optimize.c
index ae081ab29c..5939254985 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -590,13 +590,13 @@ static int do_constant_folding_cond2(TCGArg *p1, TCGArg *p2, TCGCond c)
     TCGArg bl = p2[0], bh = p2[1];
 
     if (arg_is_const(bl) && arg_is_const(bh)) {
-        tcg_target_ulong blv = arg_info(bl)->val;
-        tcg_target_ulong bhv = arg_info(bh)->val;
+        uintptr_t blv = arg_info(bl)->val;
+        uintptr_t bhv = arg_info(bh)->val;
         uint64_t b = deposit64(blv, 32, 32, bhv);
 
         if (arg_is_const(al) && arg_is_const(ah)) {
-            tcg_target_ulong alv = arg_info(al)->val;
-            tcg_target_ulong ahv = arg_info(ah)->val;
+            uintptr_t alv = arg_info(al)->val;
+            uintptr_t ahv = arg_info(ah)->val;
             uint64_t a = deposit64(alv, 32, 32, ahv);
             return do_constant_folding_cond_64(a, b, c);
         }
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 94a5fc8cc6..0b9a4f8db8 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -787,7 +787,7 @@ static const S390Opcode lli_insns[4] = {
 static bool maybe_out_small_movi(TCGContext *s, TCGType type,
                                  TCGReg ret, intptr_t sval)
 {
-    tcg_target_ulong uval = sval;
+    uintptr_t uval = sval;
     int i;
 
     if (type == TCG_TYPE_I32) {
@@ -816,7 +816,7 @@ static bool maybe_out_small_movi(TCGContext *s, TCGType type,
 static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
                              intptr_t sval, bool in_prologue)
 {
-    tcg_target_ulong uval;
+    uintptr_t uval;
 
     /* Try all 32-bit insns that can load it in one go.  */
     if (maybe_out_small_movi(s, type, ret, sval)) {
@@ -1221,7 +1221,7 @@ static void tgen_andi(TCGContext *s, TCGType type, TCGReg dest, uint64_t val)
 
     /* Try all 32-bit insns that can perform it in one go.  */
     for (i = 0; i < 4; i++) {
-        tcg_target_ulong mask = ~(0xffffull << i * 16);
+        uintptr_t mask = ~(0xffffull << i * 16);
         if (((val | ~valid) & mask) == mask) {
             tcg_out_insn_RI(s, ni_insns[i], dest, val >> i * 16);
             return;
@@ -1231,7 +1231,7 @@ static void tgen_andi(TCGContext *s, TCGType type, TCGReg dest, uint64_t val)
     /* Try all 48-bit insns that can perform it in one go.  */
     if (HAVE_FACILITY(EXT_IMM)) {
         for (i = 0; i < 2; i++) {
-            tcg_target_ulong mask = ~(0xffffffffull << i * 32);
+            uintptr_t mask = ~(0xffffffffull << i * 32);
             if (((val | ~valid) & mask) == mask) {
                 tcg_out_insn_RIL(s, nif_insns[i], dest, val >> i * 32);
                 return;
@@ -1279,7 +1279,7 @@ static void tgen_ori(TCGContext *s, TCGType type, TCGReg dest, uint64_t val)
 
     /* Try all 32-bit insns that can perform it in one go.  */
     for (i = 0; i < 4; i++) {
-        tcg_target_ulong mask = (0xffffull << i * 16);
+        uintptr_t mask = (0xffffull << i * 16);
         if ((val & mask) != 0 && (val & ~mask) == 0) {
             tcg_out_insn_RI(s, oi_insns[i], dest, val >> i * 16);
             return;
@@ -1289,7 +1289,7 @@ static void tgen_ori(TCGContext *s, TCGType type, TCGReg dest, uint64_t val)
     /* Try all 48-bit insns that can perform it in one go.  */
     if (HAVE_FACILITY(EXT_IMM)) {
         for (i = 0; i < 2; i++) {
-            tcg_target_ulong mask = (0xffffffffull << i * 32);
+            uintptr_t mask = (0xffffffffull << i * 32);
             if ((val & mask) != 0 && (val & ~mask) == 0) {
                 tcg_out_insn_RIL(s, oif_insns[i], dest, val >> i * 32);
                 return;
diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index 46f6e106e6..1d436522b7 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -1104,7 +1104,7 @@ static TCGReg tcg_out_tlb_load(TCGContext *s, TCGReg addr, int mem_index,
     if (a_bits < s_bits) {
         a_bits = s_bits;
     }
-    compare_mask = (tcg_target_ulong)TARGET_PAGE_MASK | ((1 << a_bits) - 1);
+    compare_mask = (uintptr_t)TARGET_PAGE_MASK | ((1 << a_bits) - 1);
     if (check_fit_tl(compare_mask, 13)) {
         tcg_out_arithi(s, r2, addr, compare_mask, ARITH_AND);
     } else {
diff --git a/tcg/tcg-pool.c.inc b/tcg/tcg-pool.c.inc
index 90c2e63b7f..7c47cfe74f 100644
--- a/tcg/tcg-pool.c.inc
+++ b/tcg/tcg-pool.c.inc
@@ -26,7 +26,7 @@ typedef struct TCGLabelPoolData {
     intptr_t addend;
     int rtype;
     unsigned nlong;
-    tcg_target_ulong data[];
+    uintptr_t data[];
 } TCGLabelPoolData;
 
 
@@ -34,7 +34,7 @@ static TCGLabelPoolData *new_pool_alloc(TCGContext *s, int nlong, int rtype,
                                         tcg_insn_unit *label, intptr_t addend)
 {
     TCGLabelPoolData *n = tcg_malloc(sizeof(TCGLabelPoolData)
-                                     + sizeof(tcg_target_ulong) * nlong);
+                                     + sizeof(uintptr_t) * nlong);
 
     n->label = label;
     n->addend = addend;
@@ -56,7 +56,7 @@ static void new_pool_insert(TCGContext *s, TCGLabelPoolData *n)
         if (nlong < i->nlong) {
             continue;
         }
-        if (memcmp(n->data, i->data, sizeof(tcg_target_ulong) * nlong) >= 0) {
+        if (memcmp(n->data, i->data, sizeof(uintptr_t) * nlong) >= 0) {
             break;
         }
     }
@@ -65,7 +65,7 @@ static void new_pool_insert(TCGContext *s, TCGLabelPoolData *n)
 }
 
 /* The "usual" for generic integer code.  */
-static inline void new_pool_label(TCGContext *s, tcg_target_ulong d, int rtype,
+static inline void new_pool_label(TCGContext *s, uintptr_t d, int rtype,
                                   tcg_insn_unit *label, intptr_t addend)
 {
     TCGLabelPoolData *n = new_pool_alloc(s, 1, rtype, label, addend);
@@ -75,8 +75,8 @@ static inline void new_pool_label(TCGContext *s, tcg_target_ulong d, int rtype,
 
 /* For v64 or v128, depending on the host.  */
 static inline void new_pool_l2(TCGContext *s, int rtype, tcg_insn_unit *label,
-                               intptr_t addend, tcg_target_ulong d0,
-                               tcg_target_ulong d1)
+                               intptr_t addend, uintptr_t d0,
+                               uintptr_t d1)
 {
     TCGLabelPoolData *n = new_pool_alloc(s, 2, rtype, label, addend);
     n->data[0] = d0;
@@ -86,9 +86,9 @@ static inline void new_pool_l2(TCGContext *s, int rtype, tcg_insn_unit *label,
 
 /* For v128 or v256, depending on the host.  */
 static inline void new_pool_l4(TCGContext *s, int rtype, tcg_insn_unit *label,
-                               intptr_t addend, tcg_target_ulong d0,
-                               tcg_target_ulong d1, tcg_target_ulong d2,
-                               tcg_target_ulong d3)
+                               intptr_t addend, uintptr_t d0,
+                               uintptr_t d1, uintptr_t d2,
+                               uintptr_t d3)
 {
     TCGLabelPoolData *n = new_pool_alloc(s, 4, rtype, label, addend);
     n->data[0] = d0;
@@ -100,11 +100,11 @@ static inline void new_pool_l4(TCGContext *s, int rtype, tcg_insn_unit *label,
 
 /* For v256, for 32-bit host.  */
 static inline void new_pool_l8(TCGContext *s, int rtype, tcg_insn_unit *label,
-                               intptr_t addend, tcg_target_ulong d0,
-                               tcg_target_ulong d1, tcg_target_ulong d2,
-                               tcg_target_ulong d3, tcg_target_ulong d4,
-                               tcg_target_ulong d5, tcg_target_ulong d6,
-                               tcg_target_ulong d7)
+                               intptr_t addend, uintptr_t d0,
+                               uintptr_t d1, uintptr_t d2,
+                               uintptr_t d3, uintptr_t d4,
+                               uintptr_t d5, uintptr_t d6,
+                               uintptr_t d7)
 {
     TCGLabelPoolData *n = new_pool_alloc(s, 8, rtype, label, addend);
     n->data[0] = d0;
@@ -134,12 +134,12 @@ static int tcg_out_pool_finalize(TCGContext *s)
     /* ??? Round up to qemu_icache_linesize, but then do not round
        again when allocating the next TranslationBlock structure.  */
     a = (void *)ROUND_UP((uintptr_t)s->code_ptr,
-                         sizeof(tcg_target_ulong) * p->nlong);
+                         sizeof(uintptr_t) * p->nlong);
     tcg_out_nop_fill(s->code_ptr, (tcg_insn_unit *)a - s->code_ptr);
     s->data_gen_ptr = a;
 
     for (; p != NULL; p = p->next) {
-        size_t size = sizeof(tcg_target_ulong) * p->nlong;
+        size_t size = sizeof(uintptr_t) * p->nlong;
         uintptr_t value;
 
         if (!l || l->nlong != p->nlong || memcmp(l->data, p->data, size)) {
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 73fae94559..7075f928aa 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -767,8 +767,8 @@ void tcg_prologue_init(TCGContext *s)
 
                 disas(logfile, s->code_gen_ptr, code_size);
 
-                for (i = 0; i < data_size; i += sizeof(tcg_target_ulong)) {
-                    if (sizeof(tcg_target_ulong) == 8) {
+                for (i = 0; i < data_size; i += sizeof(uintptr_t)) {
+                    if (sizeof(uintptr_t) == 8) {
                         fprintf(logfile,
                                 "0x%08" PRIxPTR ":  .quad  0x%016" PRIx64 "\n",
                                 (uintptr_t)s->data_gen_ptr + i,
@@ -1855,7 +1855,7 @@ static void tcg_dump_ops(TCGContext *s, FILE *f, bool have_prefs)
                     && cond_name[op->args[k]]) {
                     col += ne_fprintf(f, ",%s", cond_name[op->args[k++]]);
                 } else {
-                    col += ne_fprintf(f, ",$0x%" TCG_PRIlx, op->args[k++]);
+                    col += ne_fprintf(f, ",$0x%" PRIxPTR, op->args[k++]);
                 }
                 i = 1;
                 break;
@@ -1895,7 +1895,7 @@ static void tcg_dump_ops(TCGContext *s, FILE *f, bool have_prefs)
                     if (name) {
                         col += ne_fprintf(f, ",%s", name);
                     } else {
-                        col += ne_fprintf(f, ",$0x%" TCG_PRIlx, flags);
+                        col += ne_fprintf(f, ",$0x%" PRIxPTR, flags);
                     }
                     i = k = 1;
                 }
@@ -1918,7 +1918,7 @@ static void tcg_dump_ops(TCGContext *s, FILE *f, bool have_prefs)
                 break;
             }
             for (; i < nb_cargs; i++, k++) {
-                col += ne_fprintf(f, "%s$0x%" TCG_PRIlx, k ? "," : "",
+                col += ne_fprintf(f, "%s$0x%" PRIxPTR, k ? "," : "",
                                   op->args[k]);
             }
         }
@@ -3350,7 +3350,7 @@ static void tcg_reg_alloc_cbranch(TCGContext *s, TCGRegSet allocated_regs)
  * Specialized code generation for INDEX_op_mov_* with a constant.
  */
 static void tcg_reg_alloc_do_movi(TCGContext *s, TCGTemp *ots,
-                                  tcg_target_ulong val, TCGLifeData arg_life,
+                                  uintptr_t val, TCGLifeData arg_life,
                                   TCGRegSet preferred_regs)
 {
     /* ENV should not be modified.  */
@@ -3394,7 +3394,7 @@ static void tcg_reg_alloc_mov(TCGContext *s, const TCGOp *op)
 
     if (ts->val_type == TEMP_VAL_CONST) {
         /* propagate constant or generate sti */
-        tcg_target_ulong val = ts->val;
+        uintptr_t val = ts->val;
         if (IS_DEAD_ARG(1)) {
             temp_dead(s, ts);
         }
@@ -3492,7 +3492,7 @@ static void tcg_reg_alloc_dup(TCGContext *s, const TCGOp *op)
 
     if (its->val_type == TEMP_VAL_CONST) {
         /* Propagate constant via movi -> dupi.  */
-        tcg_target_ulong val = its->val;
+        uintptr_t val = its->val;
         if (IS_DEAD_ARG(1)) {
             temp_dead(s, its);
         }
diff --git a/tcg/tci.c b/tcg/tci.c
index bdfac83492..af2e1c9e71 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -38,7 +38,7 @@
 
 __thread uintptr_t tci_tb_ptr;
 
-static void tci_write_reg64(tcg_target_ulong *regs, uint32_t high_index,
+static void tci_write_reg64(uintptr_t *regs, uint32_t high_index,
                             uint32_t low_index, uint64_t value)
 {
     regs[low_index] = (uint32_t)value;
@@ -59,7 +59,7 @@ static uint64_t tci_uint64(uint32_t high, uint32_t low)
  *   b = immediate (bit position)
  *   c = condition (TCGCond)
  *   i = immediate (uint32_t)
- *   I = immediate (tcg_target_ulong)
+ *   I = immediate (uintptr_t)
  *   l = label or pointer
  *   m = immediate (MemOpIdx)
  *   n = immediate (call return length)
@@ -98,7 +98,7 @@ static void tci_args_rr(uint32_t insn, TCGReg *r0, TCGReg *r1)
     *r1 = extract32(insn, 12, 4);
 }
 
-static void tci_args_ri(uint32_t insn, TCGReg *r0, tcg_target_ulong *i1)
+static void tci_args_ri(uint32_t insn, TCGReg *r0, uintptr_t *i1)
 {
     *r0 = extract32(insn, 8, 4);
     *i1 = sextract32(insn, 12, 20);
@@ -468,12 +468,12 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
                                             const void *v_tb_ptr)
 {
     const uint32_t *tb_ptr = v_tb_ptr;
-    tcg_target_ulong regs[TCG_TARGET_NB_REGS];
+    uintptr_t regs[TCG_TARGET_NB_REGS];
     uint64_t stack[(TCG_STATIC_CALL_ARGS_SIZE + TCG_STATIC_FRAME_SIZE)
                    / sizeof(uint64_t)];
     void *call_slots[TCG_STATIC_CALL_ARGS_SIZE / sizeof(uint64_t)];
 
-    regs[TCG_AREG0] = (tcg_target_ulong)env;
+    regs[TCG_AREG0] = (uintptr_t)env;
     regs[TCG_REG_CALL_STACK] = (uintptr_t)stack;
     /* Other call_slots entries initialized at first use (see below). */
     call_slots[0] = NULL;
@@ -483,7 +483,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         uint32_t insn;
         TCGOpcode opc;
         TCGReg r0, r1, r2, r3, r4, r5;
-        tcg_target_ulong t1;
+        uintptr_t t1;
         TCGCond condition;
         target_ulong taddr;
         uint8_t pos, len;
@@ -588,7 +588,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             break;
         case INDEX_op_tci_movl:
             tci_args_rl(insn, tb_ptr, &r0, &ptr);
-            regs[r0] = *(tcg_target_ulong *)ptr;
+            regs[r0] = *(uintptr_t *)ptr;
             break;
 
             /* Load/store operations (32 bit). */
@@ -1153,7 +1153,7 @@ int print_insn_tci(bfd_vma addr, disassemble_info *info)
     uint32_t insn;
     TCGOpcode op;
     TCGReg r0, r1, r2, r3, r4, r5;
-    tcg_target_ulong i1;
+    uintptr_t i1;
     int32_t s2;
     TCGCond c;
     MemOpIdx oi;
@@ -1203,7 +1203,7 @@ int print_insn_tci(bfd_vma addr, disassemble_info *info)
 
     case INDEX_op_tci_movi:
         tci_args_ri(insn, &r0, &i1);
-        info->fprintf_func(info->stream, "%-12s  %s, 0x%" TCG_PRIlx,
+        info->fprintf_func(info->stream, "%-12s  %s, 0x%" PRIxPTR,
                            op_name, str_r(r0), i1);
         break;
 
-- 
2.38.1


