Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l8tOq-0007WO-0r
	for mharc-qemu-riscv@gnu.org; Sun, 07 Feb 2021 18:23:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l8tOm-0007Ty-ME; Sun, 07 Feb 2021 18:23:24 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:43382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l8tOk-000170-Aw; Sun, 07 Feb 2021 18:23:24 -0500
Received: by mail-wr1-x42c.google.com with SMTP id z6so15071266wrq.10;
 Sun, 07 Feb 2021 15:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1+/tMS8+lcjG3CT8AZjxjSJSDoUQYqmsaNIWbdboyjk=;
 b=vOlG7yWldhqlrtKrJfzP0hjuA5oP71mJ6EJAmU6JbUk7Z4lDJnb5g7LiFU+pAPvthi
 ZdazYD9bB8KU1rXgjVvOu9rqQeKV1/BWD3/QsMMjWjiTtgZ6elHTz/pk2BwUg27OX9hz
 3RaiXXvoyxFMG59IV2vevS+Tm60pdCJ+jcXw14Rm+UJE+UtVoFL3emfk+3GpGa1P7Z1S
 ME8NNd4KSdHsyJYScmCZzxM8hzmJE4/rcjOJPCgrUn/LWlGsURUIioX6/vVJoqiqbPG0
 RKshuDXC9apbZJEG2lLTT2XpbAAqJ/j2xyji0EmYdQPFxR+1cZ0OsNkGI417IkqvMBvR
 ruWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=1+/tMS8+lcjG3CT8AZjxjSJSDoUQYqmsaNIWbdboyjk=;
 b=J3zlMeRSNaM832Vnu3K/zsix6S3G7zu4hltO+LQbabfDCTcC9PKnOHTB1vrm/nHw+q
 cXoynoztJ6eQvqqmxwe4yILm5P1JliqvCWa7z6H2F+PoZmLJNJp7DZnHTRNLG/0qpvVe
 UeBkcnX0ap2ovPWG0QFFxkY8Af9+2ZmcTXp88uYmP6RUe2pKgp9qjg1gRDYV+/yQ5SLa
 VnescLtsgDA0awfX6eyXByxojDHvf43uIyyh6uDLyJ1DaFFyrrAzqvPv5WO90nZF/avV
 qi7d0Oe+eCjcxAIZm46op/cyO4AoZLpz5el/yF/oN5hfpzz3loOitucAiQP/Jbdf4x73
 LWtw==
X-Gm-Message-State: AOAM531cga+gaZNYwh8GbUFsls3xYyZ9XL9n9UW4hdaN6rDdr0xbBPnW
 7iabyp/RShr2E1hTbxYLaIjQWrM55lI=
X-Google-Smtp-Source: ABdhPJwS3bInnfNiklbTXweoQsYPzIE0S7UPU9PuK4/kWIUr24hZAgrdKcbBbH0d5SE+snNrk7S1mQ==
X-Received: by 2002:adf:f508:: with SMTP id q8mr17031679wro.291.1612740198745; 
 Sun, 07 Feb 2021 15:23:18 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id g1sm24266272wrq.30.2021.02.07.15.23.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 15:23:18 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-riscv@nongnu.org
Subject: [RFC PATCH v2 1/6] target: Replace tcg_debug_assert() by assert()
Date: Mon,  8 Feb 2021 00:23:05 +0100
Message-Id: <20210207232310.2505283-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210207232310.2505283-1-f4bug@amsat.org>
References: <20210207232310.2505283-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sun, 07 Feb 2021 23:23:26 -0000

Since commit 262a69f4282 ("osdep.h: Prohibit disabling assert()
in supported builds") we can not build QEMU with assert() disabled.

tcg_debug_assert() does nothing until QEMU is configured with
--enable-debug-tcg.

Since there is no obvious logic whether to use tcg_debug_assert()
or assert() for files under target/, simplify by using plain
assert() everywhere. Keep tcg_debug_assert() for the tcg/ and
accel/ directories.

Patch created mechanically using:

  $ sed -i s/tcg_debug_assert/assert/ \
      $(git grep -l tcg_debug_assert target/)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
If there is a logic, we should document it, and include "tcg/tcg.h"
in these files.
---
 target/arm/translate.h                  |  4 +--
 target/arm/mte_helper.c                 |  4 +--
 target/arm/sve_helper.c                 |  8 +++---
 target/arm/translate-a64.c              | 12 ++++-----
 target/arm/translate-sve.c              |  4 +--
 target/arm/translate.c                  | 36 ++++++++++++-------------
 target/hppa/translate.c                 |  4 +--
 target/rx/op_helper.c                   |  6 ++---
 target/rx/translate.c                   | 14 +++++-----
 target/sh4/translate.c                  |  4 +--
 target/riscv/insn_trans/trans_rvv.c.inc |  2 +-
 11 files changed, 49 insertions(+), 49 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index 423b0e08df0..e2ddf87629c 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -220,7 +220,7 @@ static inline void set_pstate_bits(uint32_t bits)
 {
     TCGv_i32 p = tcg_temp_new_i32();
 
-    tcg_debug_assert(!(bits & CACHED_PSTATE_BITS));
+    assert(!(bits & CACHED_PSTATE_BITS));
 
     tcg_gen_ld_i32(p, cpu_env, offsetof(CPUARMState, pstate));
     tcg_gen_ori_i32(p, p, bits);
@@ -233,7 +233,7 @@ static inline void clear_pstate_bits(uint32_t bits)
 {
     TCGv_i32 p = tcg_temp_new_i32();
 
-    tcg_debug_assert(!(bits & CACHED_PSTATE_BITS));
+    assert(!(bits & CACHED_PSTATE_BITS));
 
     tcg_gen_ld_i32(p, cpu_env, offsetof(CPUARMState, pstate));
     tcg_gen_andi_i32(p, p, ~bits);
diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index 153bd1e9df8..6cea9d1b506 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -166,8 +166,8 @@ static uint8_t *allocation_tag_mem(CPUARMState *env, int ptr_mmu_idx,
      * not set in the cputlb lookup above.
      */
     mr = memory_region_from_host(host, &ptr_ra);
-    tcg_debug_assert(mr != NULL);
-    tcg_debug_assert(memory_region_is_ram(mr));
+    assert(mr != NULL);
+    assert(memory_region_is_ram(mr));
     ptr_paddr = ptr_ra;
     do {
         ptr_paddr += mr->addr;
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 844db08bd57..c8cdf7618eb 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -4030,7 +4030,7 @@ static intptr_t find_next_active(uint64_t *vg, intptr_t reg_off,
     reg_off += ctz64(pg);
 
     /* We should never see an out of range predicate bit set.  */
-    tcg_debug_assert(reg_off < reg_max);
+    assert(reg_off < reg_max);
     return reg_off;
 }
 
@@ -4186,7 +4186,7 @@ static bool sve_cont_ldst_elements(SVEContLdSt *info, target_ulong addr,
         /* No active elements, no pages touched. */
         return false;
     }
-    tcg_debug_assert(reg_off_last >= 0 && reg_off_last < reg_max);
+    assert(reg_off_last >= 0 && reg_off_last < reg_max);
 
     info->reg_off_first[0] = reg_off_first;
     info->mem_off_first[0] = (reg_off_first >> esz) * msize;
@@ -4235,7 +4235,7 @@ static bool sve_cont_ldst_elements(SVEContLdSt *info, target_ulong addr,
      * this may affect the address reported in an exception.
      */
     reg_off_split = find_next_active(vg, reg_off_split, reg_max, esz);
-    tcg_debug_assert(reg_off_split <= reg_off_last);
+    assert(reg_off_split <= reg_off_last);
     info->reg_off_first[1] = reg_off_split;
     info->mem_off_first[1] = (reg_off_split >> esz) * msize;
     info->reg_off_last[1] = reg_off_last;
@@ -4794,7 +4794,7 @@ void sve_ldnfff1_r(CPUARMState *env, void *vg, const target_ulong addr,
     /* Probe the page(s). */
     if (!sve_cont_ldst_pages(&info, fault, env, addr, MMU_DATA_LOAD, retaddr)) {
         /* Fault on first element. */
-        tcg_debug_assert(fault == FAULT_NO);
+        assert(fault == FAULT_NO);
         memset(vd, 0, reg_max);
         goto do_fault;
     }
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index ffc060e5d70..f570506133c 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -144,7 +144,7 @@ static void set_btype(DisasContext *s, int val)
     TCGv_i32 tcg_val;
 
     /* BTYPE is a 2-bit field, and 0 should be done with reset_btype.  */
-    tcg_debug_assert(val >= 1 && val <= 3);
+    assert(val >= 1 && val <= 3);
 
     tcg_val = tcg_const_i32(val);
     tcg_gen_st_i32(tcg_val, cpu_env, offsetof(CPUARMState, btype));
@@ -10659,7 +10659,7 @@ static void handle_vec_simd_shri(DisasContext *s, bool is_q, bool is_u,
         unallocated_encoding(s);
         return;
     }
-    tcg_debug_assert(size <= 3);
+    assert(size <= 3);
 
     if (!fp_access_check(s)) {
         return;
@@ -12812,7 +12812,7 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
         /* Coverity claims (size == 3 && !is_q) has been eliminated
          * from all paths leading to here.
          */
-        tcg_debug_assert(is_q);
+        assert(is_q);
         for (pass = 0; pass < 2; pass++) {
             TCGv_i64 tcg_op = tcg_temp_new_i64();
             TCGv_i64 tcg_res = tcg_temp_new_i64();
@@ -14615,7 +14615,7 @@ static void disas_a64_insn(CPUARMState *env, DisasContext *s)
             s->guarded_page = is_guarded_page(env, s);
 
             /* First insn can have btype set to non-zero.  */
-            tcg_debug_assert(s->btype >= 0);
+            assert(s->btype >= 0);
 
             /*
              * Note that the Branch Target Exception has fairly high
@@ -14633,7 +14633,7 @@ static void disas_a64_insn(CPUARMState *env, DisasContext *s)
             }
         } else {
             /* Not the first insn: btype must be 0.  */
-            tcg_debug_assert(s->btype == 0);
+            assert(s->btype == 0);
         }
     }
 
@@ -14733,7 +14733,7 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
 
 #ifdef CONFIG_USER_ONLY
     /* In sve_probe_page, we assume TBI is enabled. */
-    tcg_debug_assert(dc->tbid & 1);
+    assert(dc->tbid & 1);
 #endif
 
     /* Single step state. The code-generation logic here is:
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 27402af23c0..a1e327f863e 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3938,8 +3938,8 @@ static bool trans_FCMLA_zzxz(DisasContext *s, arg_FCMLA_zzxz *a)
         gen_helper_gvec_fcmlas_idx,
     };
 
-    tcg_debug_assert(a->esz == 1 || a->esz == 2);
-    tcg_debug_assert(a->rd == a->ra);
+    assert(a->esz == 1 || a->esz == 2);
+    assert(a->rd == a->ra);
     if (sve_access_check(s)) {
         unsigned vsz = vec_full_reg_size(s);
         TCGv_ptr status = fpstatus_ptr(a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 1653cca1aaa..04ebfcc0d6d 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -2972,7 +2972,7 @@ void gen_gvec_sqrdmlah_qc(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
     static gen_helper_gvec_3_ptr * const fns[2] = {
         gen_helper_gvec_qrdmlah_s16, gen_helper_gvec_qrdmlah_s32
     };
-    tcg_debug_assert(vece >= 1 && vece <= 2);
+    assert(vece >= 1 && vece <= 2);
     gen_gvec_fn3_qc(rd_ofs, rn_ofs, rm_ofs, opr_sz, max_sz, fns[vece - 1]);
 }
 
@@ -2982,7 +2982,7 @@ void gen_gvec_sqrdmlsh_qc(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
     static gen_helper_gvec_3_ptr * const fns[2] = {
         gen_helper_gvec_qrdmlsh_s16, gen_helper_gvec_qrdmlsh_s32
     };
-    tcg_debug_assert(vece >= 1 && vece <= 2);
+    assert(vece >= 1 && vece <= 2);
     gen_gvec_fn3_qc(rd_ofs, rn_ofs, rm_ofs, opr_sz, max_sz, fns[vece - 1]);
 }
 
@@ -3105,8 +3105,8 @@ void gen_gvec_ssra(unsigned vece, uint32_t rd_ofs, uint32_t rm_ofs,
     };
 
     /* tszimm encoding produces immediates in the range [1..esize]. */
-    tcg_debug_assert(shift > 0);
-    tcg_debug_assert(shift <= (8 << vece));
+    assert(shift > 0);
+    assert(shift <= (8 << vece));
 
     /*
      * Shifts larger than the element size are architecturally valid.
@@ -3181,8 +3181,8 @@ void gen_gvec_usra(unsigned vece, uint32_t rd_ofs, uint32_t rm_ofs,
     };
 
     /* tszimm encoding produces immediates in the range [1..esize]. */
-    tcg_debug_assert(shift > 0);
-    tcg_debug_assert(shift <= (8 << vece));
+    assert(shift > 0);
+    assert(shift <= (8 << vece));
 
     /*
      * Shifts larger than the element size are architecturally valid.
@@ -3290,8 +3290,8 @@ void gen_gvec_srshr(unsigned vece, uint32_t rd_ofs, uint32_t rm_ofs,
     };
 
     /* tszimm encoding produces immediates in the range [1..esize] */
-    tcg_debug_assert(shift > 0);
-    tcg_debug_assert(shift <= (8 << vece));
+    assert(shift > 0);
+    assert(shift <= (8 << vece));
 
     if (shift == (8 << vece)) {
         /*
@@ -3386,8 +3386,8 @@ void gen_gvec_srsra(unsigned vece, uint32_t rd_ofs, uint32_t rm_ofs,
     };
 
     /* tszimm encoding produces immediates in the range [1..esize] */
-    tcg_debug_assert(shift > 0);
-    tcg_debug_assert(shift <= (8 << vece));
+    assert(shift > 0);
+    assert(shift <= (8 << vece));
 
     /*
      * Shifts larger than the element size are architecturally valid.
@@ -3491,8 +3491,8 @@ void gen_gvec_urshr(unsigned vece, uint32_t rd_ofs, uint32_t rm_ofs,
     };
 
     /* tszimm encoding produces immediates in the range [1..esize] */
-    tcg_debug_assert(shift > 0);
-    tcg_debug_assert(shift <= (8 << vece));
+    assert(shift > 0);
+    assert(shift <= (8 << vece));
 
     if (shift == (8 << vece)) {
         /*
@@ -3606,8 +3606,8 @@ void gen_gvec_ursra(unsigned vece, uint32_t rd_ofs, uint32_t rm_ofs,
     };
 
     /* tszimm encoding produces immediates in the range [1..esize] */
-    tcg_debug_assert(shift > 0);
-    tcg_debug_assert(shift <= (8 << vece));
+    assert(shift > 0);
+    assert(shift <= (8 << vece));
 
     tcg_gen_gvec_2i(rd_ofs, rm_ofs, opr_sz, max_sz, shift, &ops[vece]);
 }
@@ -3695,8 +3695,8 @@ void gen_gvec_sri(unsigned vece, uint32_t rd_ofs, uint32_t rm_ofs,
     };
 
     /* tszimm encoding produces immediates in the range [1..esize]. */
-    tcg_debug_assert(shift > 0);
-    tcg_debug_assert(shift <= (8 << vece));
+    assert(shift > 0);
+    assert(shift <= (8 << vece));
 
     /* Shift of esize leaves destination unchanged. */
     if (shift < (8 << vece)) {
@@ -3788,8 +3788,8 @@ void gen_gvec_sli(unsigned vece, uint32_t rd_ofs, uint32_t rm_ofs,
     };
 
     /* tszimm encoding produces immediates in the range [0..esize-1]. */
-    tcg_debug_assert(shift >= 0);
-    tcg_debug_assert(shift < (8 << vece));
+    assert(shift >= 0);
+    assert(shift < (8 << vece));
 
     if (shift == 0) {
         tcg_gen_gvec_mov(vece, rd_ofs, rm_ofs, opr_sz, max_sz);
diff --git a/target/hppa/translate.c b/target/hppa/translate.c
index 64af1e0d5cc..ceb3bacc7dd 100644
--- a/target/hppa/translate.c
+++ b/target/hppa/translate.c
@@ -1945,8 +1945,8 @@ static bool do_ibranch(DisasContext *ctx, TCGv_reg dest,
            for the indirect branch consumes no special resources, we
            can (conditionally) skip B and continue execution.  */
         /* The use_nullify_skip test implies we have a known control path.  */
-        tcg_debug_assert(ctx->iaoq_b != -1);
-        tcg_debug_assert(ctx->iaoq_n != -1);
+        assert(ctx->iaoq_b != -1);
+        assert(ctx->iaoq_n != -1);
 
         /* We do have to handle the non-local temporary, DEST, before
            branching.  Since IOAQ_F is not really live at this point, we
diff --git a/target/rx/op_helper.c b/target/rx/op_helper.c
index 4d315b44492..03d285fbafe 100644
--- a/target/rx/op_helper.c
+++ b/target/rx/op_helper.c
@@ -234,7 +234,7 @@ static void (* const cpu_stfn[])(CPUArchState *env,
 
 void helper_sstr(CPURXState *env, uint32_t sz)
 {
-    tcg_debug_assert(sz < 3);
+    assert(sz < 3);
     while (env->regs[3] != 0) {
         cpu_stfn[sz](env, env->regs[1], env->regs[2], GETPC());
         env->regs[1] += 1 << sz;
@@ -283,7 +283,7 @@ void helper_smovb(CPURXState *env)
 void helper_suntil(CPURXState *env, uint32_t sz)
 {
     uint32_t tmp;
-    tcg_debug_assert(sz < 3);
+    assert(sz < 3);
     if (env->regs[3] == 0) {
         return ;
     }
@@ -302,7 +302,7 @@ void helper_suntil(CPURXState *env, uint32_t sz)
 void helper_swhile(CPURXState *env, uint32_t sz)
 {
     uint32_t tmp;
-    tcg_debug_assert(sz < 3);
+    assert(sz < 3);
     if (env->regs[3] == 0) {
         return ;
     }
diff --git a/target/rx/translate.c b/target/rx/translate.c
index 9ea941c6302..ff12af4f7f8 100644
--- a/target/rx/translate.c
+++ b/target/rx/translate.c
@@ -87,7 +87,7 @@ static uint32_t li(DisasContext *ctx, int sz)
     CPURXState *env = ctx->env;
     addr = ctx->base.pc_next;
 
-    tcg_debug_assert(sz < 4);
+    assert(sz < 4);
     switch (sz) {
     case 1:
         ctx->base.pc_next += 1;
@@ -201,7 +201,7 @@ static inline TCGv rx_index_addr(DisasContext *ctx, TCGv mem,
 {
     uint32_t dsp;
 
-    tcg_debug_assert(ld < 3);
+    assert(ld < 3);
     switch (ld) {
     case 0:
         return cpu_regs[reg];
@@ -222,7 +222,7 @@ static inline TCGv rx_index_addr(DisasContext *ctx, TCGv mem,
 static inline MemOp mi_to_mop(unsigned mi)
 {
     static const MemOp mop[5] = { MO_SB, MO_SW, MO_UL, MO_UW, MO_UB };
-    tcg_debug_assert(mi < 5);
+    assert(mi < 5);
     return mop[mi];
 }
 
@@ -258,7 +258,7 @@ static int is_privileged(DisasContext *ctx, int is_exception)
 /* generate QEMU condition */
 static void psw_cond(DisasCompare *dc, uint32_t cond)
 {
-    tcg_debug_assert(cond < 16);
+    assert(cond < 16);
     switch (cond) {
     case 0: /* z */
         dc->cond = TCG_COND_EQ;
@@ -1401,7 +1401,7 @@ static inline void shiftr_imm(uint32_t rd, uint32_t rs, uint32_t imm,
     static void (* const gen_sXri[])(TCGv ret, TCGv arg1, int arg2) = {
         tcg_gen_shri_i32, tcg_gen_sari_i32,
     };
-    tcg_debug_assert(alith < 2);
+    assert(alith < 2);
     if (imm) {
         gen_sXri[alith](cpu_regs[rd], cpu_regs[rs], imm - 1);
         tcg_gen_andi_i32(cpu_psw_c, cpu_regs[rd], 0x00000001);
@@ -1425,7 +1425,7 @@ static inline void shiftr_reg(uint32_t rd, uint32_t rs, unsigned int alith)
     static void (* const gen_sXr[])(TCGv ret, TCGv arg1, TCGv arg2) = {
         tcg_gen_shr_i32, tcg_gen_sar_i32,
     };
-    tcg_debug_assert(alith < 2);
+    assert(alith < 2);
     noshift = gen_new_label();
     done = gen_new_label();
     count = tcg_temp_new();
@@ -2282,7 +2282,7 @@ static bool trans_INT(DisasContext *ctx, arg_INT *a)
 {
     TCGv vec;
 
-    tcg_debug_assert(a->imm < 0x100);
+    assert(a->imm < 0x100);
     vec = tcg_const_i32(a->imm);
     tcg_gen_movi_i32(cpu_pc, ctx->base.pc_next);
     gen_helper_rxint(cpu_env, vec);
diff --git a/target/sh4/translate.c b/target/sh4/translate.c
index 93127906237..f12cc0830bf 100644
--- a/target/sh4/translate.c
+++ b/target/sh4/translate.c
@@ -339,7 +339,7 @@ static void gen_delayed_conditional_jump(DisasContext * ctx)
 static inline void gen_load_fpr64(DisasContext *ctx, TCGv_i64 t, int reg)
 {
     /* We have already signaled illegal instruction for odd Dr.  */
-    tcg_debug_assert((reg & 1) == 0);
+    assert((reg & 1) == 0);
     reg ^= ctx->fbank;
     tcg_gen_concat_i32_i64(t, cpu_fregs[reg + 1], cpu_fregs[reg]);
 }
@@ -347,7 +347,7 @@ static inline void gen_load_fpr64(DisasContext *ctx, TCGv_i64 t, int reg)
 static inline void gen_store_fpr64(DisasContext *ctx, TCGv_i64 t, int reg)
 {
     /* We have already signaled illegal instruction for odd Dr.  */
-    tcg_debug_assert((reg & 1) == 0);
+    assert((reg & 1) == 0);
     reg ^= ctx->fbank;
     tcg_gen_extr_i64_i32(cpu_fregs[reg + 1], cpu_fregs[reg], t);
 }
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 887c6b88831..f0e6e844f5f 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -992,7 +992,7 @@ static void tcg_gen_gvec_rsubs(unsigned vece, uint32_t dofs, uint32_t aofs,
           .vece = MO_64 },
     };
 
-    tcg_debug_assert(vece <= MO_64);
+    assert(vece <= MO_64);
     tcg_gen_gvec_2s(dofs, aofs, oprsz, maxsz, c, &rsub_op[vece]);
 }
 
-- 
2.26.2


