Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvapV-0000Tc-Jb
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 03:00:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvapT-0000PS-RW
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 03:00:31 -0500
Received: from [2607:f8b0:4864:20::1034] (port=52139
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvapP-0007Di-Qq
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 03:00:31 -0500
Received: by mail-pj1-x1034.google.com with SMTP id gt5so6286064pjb.1
 for <qemu-riscv@nongnu.org>; Fri, 10 Dec 2021 00:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PnwL/2jgt1YeEAzmE3IWDAOh3e1JQ+9h1JQkXqOV7NI=;
 b=V5lGPDVtPHFAmqRbi7c0nT1uN4IQh2nxFUdgf2Ahd3lPqlxubsXyA3cOY3/Qre6szX
 kZsypYC8DwyaxnyDGknrTnsb8jb4kLGUmBebAsQqKlU99S3/2HwZgJPQxRZWK1gt8tBF
 lb4r0ZjqQwvzXoeOS3htIu+rn08eMc1aUC+z2RXp9HDfNoz1MhPioHfSGaBgGZ5eLj9M
 6kwQz1BiJww6jF18LAIlDov0kg8AmnC6mw8rQVM7wp7Tdv+Ax5q04gkzX1PT0Jehy6Uj
 Wo1VVfwLjp5v8/LNhmcAXvhPgM3oqjnm+4hHDFdldR8SvXkk6kYiEBWxmjPzv9gWAFoW
 Sevg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PnwL/2jgt1YeEAzmE3IWDAOh3e1JQ+9h1JQkXqOV7NI=;
 b=R3fkozi63l5Z8Fx1v114dKkifWXny1WCr2NVBNfCeQ0C56351QYpndzOBQaTQnStoR
 eKwfwdMlQU4U8BpTpqmv2OiEMaWGB9YhcGPOjUSN7v5oWGLxwEoFUmMmxK4vb/YyLwVl
 h7tuMETNSfO4N7ig1GpQZ1w7Jd2BEbKhR4KBJm7275KmETT0hqYp3RiWofxH07EU1R1Y
 mq1wyAt4mBmYeTRfMW5E8aghQqsis5UrBoLJ4OoDsNoKFRZfR4exF2xqjqnavHbd0Mmp
 WVM286vPuh8KRs5n9XFp3OC63qSVAwfyYOkO0kb1c/mg9dfFB5abWWv+Y2UgHpGX0ocF
 zfhw==
X-Gm-Message-State: AOAM533xJr1k01H92URQ2+hSdNOUXoBK5nBVLECFWhb1bhUoNruOlg63
 66+Gd02U90tEXHTohyzBE4bMKQ==
X-Google-Smtp-Source: ABdhPJyFor6GmGQSTUTpfJGXd9V2ySY7cCpQrShm6vFC7CTgawa9CBG+HJzhGb6EnzPuBhlcIdKv7w==
X-Received: by 2002:a17:902:6506:b0:143:84c4:6555 with SMTP id
 b6-20020a170902650600b0014384c46555mr73427787plk.8.1639123226010; 
 Fri, 10 Dec 2021 00:00:26 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id f4sm2087955pfg.34.2021.12.10.00.00.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 00:00:25 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v11 66/77] target/riscv: rvv-1.0: implement vstart CSR
Date: Fri, 10 Dec 2021 15:56:52 +0800
Message-Id: <20211210075704.23951-67-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210075704.23951-1-frank.chang@sifive.com>
References: <20211210075704.23951-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 10 Dec 2021 08:00:32 -0000

From: Frank Chang <frank.chang@sifive.com>

* Update and check vstart value for vector instructions.
* Add whole register move instruction helper functions as we have to
  call helper function for case where vstart is not zero.
* Remove probe_pages() calls in vector load/store instructions
  (except fault-only-first loads) to raise the memory access exception
  at the exact processed vector element.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c                      |   6 +-
 target/riscv/helper.h                   |   5 +
 target/riscv/insn_trans/trans_rvv.c.inc |  75 ++++++---
 target/riscv/translate.c                |   6 +-
 target/riscv/vector_helper.c            | 210 +++++++++++++++---------
 5 files changed, 199 insertions(+), 103 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 3dfbc17738..146447eac5 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -343,7 +343,11 @@ static RISCVException write_vstart(CPURISCVState *env, int csrno,
 #if !defined(CONFIG_USER_ONLY)
     env->mstatus |= MSTATUS_VS;
 #endif
-    env->vstart = val;
+    /*
+     * The vstart CSR is defined to have only enough writable bits
+     * to hold the largest element index, i.e. lg2(VLEN) bits.
+     */
+    env->vstart = val & ~(~0ULL << ctzl(env_archcpu(env)->cfg.vlen));
     return RISCV_EXCP_NONE;
 }
 
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 1a0d817f0f..a717a87a0e 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1073,6 +1073,11 @@ DEF_HELPER_6(vcompress_vm_h, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vcompress_vm_w, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vcompress_vm_d, void, ptr, ptr, ptr, ptr, env, i32)
 
+DEF_HELPER_4(vmv1r_v, void, ptr, ptr, env, i32)
+DEF_HELPER_4(vmv2r_v, void, ptr, ptr, env, i32)
+DEF_HELPER_4(vmv4r_v, void, ptr, ptr, env, i32)
+DEF_HELPER_4(vmv8r_v, void, ptr, ptr, env, i32)
+
 DEF_HELPER_5(vzext_vf2_h, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vzext_vf2_w, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vzext_vf2_d, void, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index be3f9f1327..7589c8ce32 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -490,7 +490,7 @@ static bool vext_check_sds(DisasContext *s, int vd, int vs1, int vs2, int vm)
  */
 static bool vext_check_reduction(DisasContext *s, int vs2)
 {
-    return require_align(vs2, s->lmul);
+    return require_align(vs2, s->lmul) && (s->vstart == 0);
 }
 
 /*
@@ -2786,7 +2786,8 @@ GEN_MM_TRANS(vmxnor_mm)
 static bool trans_vcpop_m(DisasContext *s, arg_rmr *a)
 {
     if (require_rvv(s) &&
-        vext_check_isa_ill(s)) {
+        vext_check_isa_ill(s) &&
+        s->vstart == 0) {
         TCGv_ptr src2, mask;
         TCGv dst;
         TCGv_i32 desc;
@@ -2817,7 +2818,8 @@ static bool trans_vcpop_m(DisasContext *s, arg_rmr *a)
 static bool trans_vfirst_m(DisasContext *s, arg_rmr *a)
 {
     if (require_rvv(s) &&
-        vext_check_isa_ill(s)) {
+        vext_check_isa_ill(s) &&
+        s->vstart == 0) {
         TCGv_ptr src2, mask;
         TCGv dst;
         TCGv_i32 desc;
@@ -2852,7 +2854,8 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
     if (require_rvv(s) &&                                          \
         vext_check_isa_ill(s) &&                                   \
         require_vm(a->vm, a->rd) &&                                \
-        (a->rd != a->rs2)) {                                       \
+        (a->rd != a->rs2) &&                                       \
+        (s->vstart == 0)) {                                        \
         uint32_t data = 0;                                         \
         gen_helper_gvec_3_ptr *fn = gen_helper_##NAME;             \
         TCGLabel *over = gen_new_label();                          \
@@ -2888,7 +2891,8 @@ static bool trans_viota_m(DisasContext *s, arg_viota_m *a)
         vext_check_isa_ill(s) &&
         !is_overlapped(a->rd, 1 << MAX(s->lmul, 0), a->rs2, 1) &&
         require_vm(a->vm, a->rd) &&
-        require_align(a->rd, s->lmul)) {
+        require_align(a->rd, s->lmul) &&
+        (s->vstart == 0)) {
         uint32_t data = 0;
         TCGLabel *over = gen_new_label();
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
@@ -3109,6 +3113,7 @@ static bool trans_vmv_s_x(DisasContext *s, arg_vmv_s_x *a)
         TCGLabel *over = gen_new_label();
 
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
 
         t1 = tcg_temp_new_i64();
 
@@ -3161,8 +3166,9 @@ static bool trans_vfmv_s_f(DisasContext *s, arg_vfmv_s_f *a)
         TCGv_i64 t1;
         TCGLabel *over = gen_new_label();
 
-        /* if vl == 0, skip vector register write back */
+        /* if vl == 0 or vstart >= vl, skip vector register write back */
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
 
         /* NaN-box f[rs1] */
         t1 = tcg_temp_new_i64();
@@ -3333,7 +3339,8 @@ static bool vcompress_vm_check(DisasContext *s, arg_r *a)
            require_align(a->rd, s->lmul) &&
            require_align(a->rs2, s->lmul) &&
            (a->rd != a->rs2) &&
-           !is_overlapped(a->rd, 1 << MAX(s->lmul, 0), a->rs1, 1);
+           !is_overlapped(a->rd, 1 << MAX(s->lmul, 0), a->rs1, 1) &&
+           (s->vstart == 0);
 }
 
 static bool trans_vcompress_vm(DisasContext *s, arg_r *a)
@@ -3363,26 +3370,40 @@ static bool trans_vcompress_vm(DisasContext *s, arg_r *a)
  * Whole Vector Register Move Instructions ignore vtype and vl setting.
  * Thus, we don't need to check vill bit. (Section 16.6)
  */
-#define GEN_VMV_WHOLE_TRANS(NAME, LEN)                          \
-static bool trans_##NAME(DisasContext *s, arg_##NAME * a)       \
-{                                                               \
-    if (require_rvv(s) &&                                       \
-        QEMU_IS_ALIGNED(a->rd, LEN) &&                          \
-        QEMU_IS_ALIGNED(a->rs2, LEN)) {                         \
-        /* EEW = 8 */                                           \
-        tcg_gen_gvec_mov(MO_8, vreg_ofs(s, a->rd),              \
-                         vreg_ofs(s, a->rs2),                   \
-                         s->vlen / 8 * LEN, s->vlen / 8 * LEN); \
-        mark_vs_dirty(s);                                       \
-        return true;                                            \
-    }                                                           \
-    return false;                                               \
-}
-
-GEN_VMV_WHOLE_TRANS(vmv1r_v, 1)
-GEN_VMV_WHOLE_TRANS(vmv2r_v, 2)
-GEN_VMV_WHOLE_TRANS(vmv4r_v, 4)
-GEN_VMV_WHOLE_TRANS(vmv8r_v, 8)
+#define GEN_VMV_WHOLE_TRANS(NAME, LEN, SEQ)                             \
+static bool trans_##NAME(DisasContext *s, arg_##NAME * a)               \
+{                                                                       \
+    if (require_rvv(s) &&                                               \
+        QEMU_IS_ALIGNED(a->rd, LEN) &&                                  \
+        QEMU_IS_ALIGNED(a->rs2, LEN)) {                                 \
+        uint32_t maxsz = (s->vlen >> 3) * LEN;                          \
+        if (s->vstart == 0) {                                           \
+            /* EEW = 8 */                                               \
+            tcg_gen_gvec_mov(MO_8, vreg_ofs(s, a->rd),                  \
+                             vreg_ofs(s, a->rs2), maxsz, maxsz);        \
+            mark_vs_dirty(s);                                           \
+        } else {                                                        \
+            TCGLabel *over = gen_new_label();                           \
+            tcg_gen_brcondi_tl(TCG_COND_GEU, cpu_vstart, maxsz, over);  \
+                                                                        \
+            static gen_helper_gvec_2_ptr * const fns[4] = {             \
+                gen_helper_vmv1r_v, gen_helper_vmv2r_v,                 \
+                gen_helper_vmv4r_v, gen_helper_vmv8r_v,                 \
+            };                                                          \
+            tcg_gen_gvec_2_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, a->rs2), \
+                               cpu_env, maxsz, maxsz, 0, fns[SEQ]);     \
+            mark_vs_dirty(s);                                           \
+            gen_set_label(over);                                        \
+        }                                                               \
+        return true;                                                    \
+    }                                                                   \
+    return false;                                                       \
+}
+
+GEN_VMV_WHOLE_TRANS(vmv1r_v, 1, 0)
+GEN_VMV_WHOLE_TRANS(vmv2r_v, 2, 1)
+GEN_VMV_WHOLE_TRANS(vmv4r_v, 4, 2)
+GEN_VMV_WHOLE_TRANS(vmv8r_v, 8, 3)
 
 static bool int_ext_check(DisasContext *s, arg_rmr *a, uint8_t div)
 {
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index b4df21bda3..68edaaf6ac 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -33,7 +33,7 @@
 #include "internals.h"
 
 /* global register indices */
-static TCGv cpu_gpr[32], cpu_pc, cpu_vl;
+static TCGv cpu_gpr[32], cpu_pc, cpu_vl, cpu_vstart;
 static TCGv_i64 cpu_fpr[32]; /* assume F and D extensions */
 static TCGv load_res;
 static TCGv load_val;
@@ -96,6 +96,7 @@ typedef struct DisasContext {
     int8_t lmul;
     uint8_t sew;
     uint16_t vlen;
+    target_ulong vstart;
     bool vl_eq_vlmax;
     uint8_t ntemp;
     CPUState *cs;
@@ -710,6 +711,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->vill = FIELD_EX32(tb_flags, TB_FLAGS, VILL);
     ctx->sew = FIELD_EX32(tb_flags, TB_FLAGS, SEW);
     ctx->lmul = sextract32(FIELD_EX32(tb_flags, TB_FLAGS, LMUL), 0, 3);
+    ctx->vstart = env->vstart;
     ctx->vl_eq_vlmax = FIELD_EX32(tb_flags, TB_FLAGS, VL_EQ_VLMAX);
     ctx->xl = FIELD_EX32(tb_flags, TB_FLAGS, XL);
     ctx->cs = cs;
@@ -828,6 +830,8 @@ void riscv_translate_init(void)
 
     cpu_pc = tcg_global_mem_new(cpu_env, offsetof(CPURISCVState, pc), "pc");
     cpu_vl = tcg_global_mem_new(cpu_env, offsetof(CPURISCVState, vl), "vl");
+    cpu_vstart = tcg_global_mem_new(cpu_env, offsetof(CPURISCVState, vstart),
+                            "vstart");
     load_res = tcg_global_mem_new(cpu_env, offsetof(CPURISCVState, load_res),
                              "load_res");
     load_val = tcg_global_mem_new(cpu_env, offsetof(CPURISCVState, load_val),
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index e61c873142..22848d6b68 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -226,25 +226,19 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base,
     uint32_t nf = vext_nf(desc);
     uint32_t max_elems = vext_max_elems(desc, esz);
 
-    /* probe every access*/
-    for (i = 0; i < env->vl; i++) {
+    for (i = env->vstart; i < env->vl; i++, env->vstart++) {
         if (!vm && !vext_elem_mask(v0, i)) {
             continue;
         }
-        probe_pages(env, base + stride * i, nf << esz, ra, access_type);
-    }
-    /* do real access */
-    for (i = 0; i < env->vl; i++) {
+
         k = 0;
-        if (!vm && !vext_elem_mask(v0, i)) {
-            continue;
-        }
         while (k < nf) {
             target_ulong addr = base + stride * i + (k << esz);
             ldst_elem(env, addr, i + k * max_elems, vd, ra);
             k++;
         }
     }
+    env->vstart = 0;
 }
 
 #define GEN_VEXT_LD_STRIDE(NAME, ETYPE, LOAD_FN)                        \
@@ -291,10 +285,8 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
     uint32_t nf = vext_nf(desc);
     uint32_t max_elems = vext_max_elems(desc, esz);
 
-    /* probe every access */
-    probe_pages(env, base, env->vl * (nf << esz), ra, access_type);
     /* load bytes from guest memory */
-    for (i = 0; i < env->vl; i++) {
+    for (i = env->vstart; i < env->vl; i++, env->vstart++) {
         k = 0;
         while (k < nf) {
             target_ulong addr = base + ((i * nf + k) << esz);
@@ -302,6 +294,7 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
             k++;
         }
     }
+    env->vstart = 0;
 }
 
 /*
@@ -381,26 +374,20 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
     uint32_t vm = vext_vm(desc);
     uint32_t max_elems = vext_max_elems(desc, esz);
 
-    /* probe every access*/
-    for (i = 0; i < env->vl; i++) {
-        if (!vm && !vext_elem_mask(v0, i)) {
-            continue;
-        }
-        probe_pages(env, get_index_addr(base, i, vs2), nf << esz, ra,
-                    access_type);
-    }
     /* load bytes from guest memory */
-    for (i = 0; i < env->vl; i++) {
-        k = 0;
+    for (i = env->vstart; i < env->vl; i++, env->vstart++) {
         if (!vm && !vext_elem_mask(v0, i)) {
             continue;
         }
+
+        k = 0;
         while (k < nf) {
             abi_ptr addr = get_index_addr(base, i, vs2) + (k << esz);
             ldst_elem(env, addr, i + k * max_elems, vd, ra);
             k++;
         }
     }
+    env->vstart = 0;
 }
 
 #define GEN_VEXT_LD_INDEX(NAME, ETYPE, INDEX_FN, LOAD_FN)                  \
@@ -471,7 +458,7 @@ vext_ldff(void *vd, void *v0, target_ulong base,
     target_ulong addr, offset, remain;
 
     /* probe every access*/
-    for (i = 0; i < env->vl; i++) {
+    for (i = env->vstart; i < env->vl; i++) {
         if (!vm && !vext_elem_mask(v0, i)) {
             continue;
         }
@@ -511,7 +498,7 @@ ProbeSuccess:
     if (vl != 0) {
         env->vl = vl;
     }
-    for (i = 0; i < env->vl; i++) {
+    for (i = env->vstart; i < env->vl; i++) {
         k = 0;
         if (!vm && !vext_elem_mask(v0, i)) {
             continue;
@@ -522,6 +509,7 @@ ProbeSuccess:
             k++;
         }
     }
+    env->vstart = 0;
 }
 
 #define GEN_VEXT_LDFF(NAME, ETYPE, LOAD_FN)               \
@@ -559,21 +547,32 @@ vext_ldst_whole(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
                 vext_ldst_elem_fn *ldst_elem, uint32_t esz, uintptr_t ra,
                 MMUAccessType access_type)
 {
-    uint32_t i, k;
+    uint32_t i, k, off, pos;
     uint32_t nf = vext_nf(desc);
     uint32_t vlenb = env_archcpu(env)->cfg.vlen >> 3;
     uint32_t max_elems = vlenb >> esz;
 
-    /* probe every access */
-    probe_pages(env, base, vlenb * nf, ra, access_type);
+    k = env->vstart / max_elems;
+    off = env->vstart % max_elems;
 
-    /* load bytes from guest memory */
-    for (k = 0; k < nf; k++) {
-        for (i = 0; i < max_elems; i++) {
+    if (off) {
+        /* load/store rest of elements of current segment pointed by vstart */
+        for (pos = off; pos < max_elems; pos++, env->vstart++) {
+            target_ulong addr = base + ((pos + k * max_elems) << esz);
+            ldst_elem(env, addr, pos + k * max_elems, vd, ra);
+        }
+        k++;
+    }
+
+    /* load/store elements for rest of segments */
+    for (; k < nf; k++) {
+        for (i = 0; i < max_elems; i++, env->vstart++) {
             target_ulong addr = base + ((i + k * max_elems) << esz);
             ldst_elem(env, addr, i + k * max_elems, vd, ra);
         }
     }
+
+    env->vstart = 0;
 }
 
 #define GEN_VEXT_LD_WHOLE(NAME, ETYPE, LOAD_FN)      \
@@ -686,12 +685,13 @@ static void do_vext_vv(void *vd, void *v0, void *vs1, void *vs2,
     uint32_t vl = env->vl;
     uint32_t i;
 
-    for (i = 0; i < vl; i++) {
+    for (i = env->vstart; i < vl; i++) {
         if (!vm && !vext_elem_mask(v0, i)) {
             continue;
         }
         fn(vd, vs1, vs2, i);
     }
+    env->vstart = 0;
 }
 
 /* generate the helpers for OPIVV */
@@ -748,12 +748,13 @@ static void do_vext_vx(void *vd, void *v0, target_long s1, void *vs2,
     uint32_t vl = env->vl;
     uint32_t i;
 
-    for (i = 0; i < vl; i++) {
+    for (i = env->vstart; i < vl; i++) {
         if (!vm && !vext_elem_mask(v0, i)) {
             continue;
         }
         fn(vd, s1, vs2, i);
     }
+    env->vstart = 0;
 }
 
 /* generate the helpers for OPIVX */
@@ -941,13 +942,14 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
     uint32_t vl = env->vl;                                    \
     uint32_t i;                                               \
                                                               \
-    for (i = 0; i < vl; i++) {                                \
+    for (i = env->vstart; i < vl; i++) {                      \
         ETYPE s1 = *((ETYPE *)vs1 + H(i));                    \
         ETYPE s2 = *((ETYPE *)vs2 + H(i));                    \
         ETYPE carry = vext_elem_mask(v0, i);                  \
                                                               \
         *((ETYPE *)vd + H(i)) = DO_OP(s2, s1, carry);         \
     }                                                         \
+    env->vstart = 0;                                          \
 }
 
 GEN_VEXT_VADC_VVM(vadc_vvm_b, uint8_t,  H1, DO_VADC)
@@ -967,12 +969,13 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,        \
     uint32_t vl = env->vl;                                               \
     uint32_t i;                                                          \
                                                                          \
-    for (i = 0; i < vl; i++) {                                           \
+    for (i = env->vstart; i < vl; i++) {                                 \
         ETYPE s2 = *((ETYPE *)vs2 + H(i));                               \
         ETYPE carry = vext_elem_mask(v0, i);                             \
                                                                          \
         *((ETYPE *)vd + H(i)) = DO_OP(s2, (ETYPE)(target_long)s1, carry);\
     }                                                                    \
+    env->vstart = 0;                                          \
 }
 
 GEN_VEXT_VADC_VXM(vadc_vxm_b, uint8_t,  H1, DO_VADC)
@@ -997,12 +1000,13 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
     uint32_t vm = vext_vm(desc);                              \
     uint32_t i;                                               \
                                                               \
-    for (i = 0; i < vl; i++) {                                \
+    for (i = env->vstart; i < vl; i++) {                      \
         ETYPE s1 = *((ETYPE *)vs1 + H(i));                    \
         ETYPE s2 = *((ETYPE *)vs2 + H(i));                    \
         ETYPE carry = !vm && vext_elem_mask(v0, i);           \
         vext_set_elem_mask(vd, i, DO_OP(s2, s1, carry));      \
     }                                                         \
+    env->vstart = 0;                                          \
 }
 
 GEN_VEXT_VMADC_VVM(vmadc_vvm_b, uint8_t,  H1, DO_MADC)
@@ -1023,12 +1027,13 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1,          \
     uint32_t vm = vext_vm(desc);                                \
     uint32_t i;                                                 \
                                                                 \
-    for (i = 0; i < vl; i++) {                                  \
+    for (i = env->vstart; i < vl; i++) {                        \
         ETYPE s2 = *((ETYPE *)vs2 + H(i));                      \
         ETYPE carry = !vm && vext_elem_mask(v0, i);             \
         vext_set_elem_mask(vd, i,                               \
                 DO_OP(s2, (ETYPE)(target_long)s1, carry));      \
     }                                                           \
+    env->vstart = 0;                                            \
 }
 
 GEN_VEXT_VMADC_VXM(vmadc_vxm_b, uint8_t,  H1, DO_MADC)
@@ -1105,7 +1110,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,                          \
     uint32_t vl = env->vl;                                                \
     uint32_t i;                                                           \
                                                                           \
-    for (i = 0; i < vl; i++) {                                            \
+    for (i = env->vstart; i < vl; i++) {                                  \
         if (!vm && !vext_elem_mask(v0, i)) {                              \
             continue;                                                     \
         }                                                                 \
@@ -1113,6 +1118,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,                          \
         TS2 s2 = *((TS2 *)vs2 + HS2(i));                                  \
         *((TS1 *)vd + HS1(i)) = OP(s2, s1 & MASK);                        \
     }                                                                     \
+    env->vstart = 0;                                                      \
 }
 
 GEN_VEXT_SHIFT_VV(vsll_vv_b, uint8_t,  uint8_t, H1, H1, DO_SLL, 0x7)
@@ -1139,13 +1145,14 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1,      \
     uint32_t vl = env->vl;                                  \
     uint32_t i;                                             \
                                                             \
-    for (i = 0; i < vl; i++) {                              \
+    for (i = env->vstart; i < vl; i++) {                    \
         if (!vm && !vext_elem_mask(v0, i)) {                \
             continue;                                       \
         }                                                   \
         TS2 s2 = *((TS2 *)vs2 + HS2(i));                    \
         *((TD *)vd + HD(i)) = OP(s2, s1 & MASK);            \
     }                                                       \
+    env->vstart = 0;                                        \
 }
 
 GEN_VEXT_SHIFT_VX(vsll_vx_b, uint8_t, int8_t, H1, H1, DO_SLL, 0x7)
@@ -1192,7 +1199,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
     uint32_t vl = env->vl;                                    \
     uint32_t i;                                               \
                                                               \
-    for (i = 0; i < vl; i++) {                                \
+    for (i = env->vstart; i < vl; i++) {                      \
         ETYPE s1 = *((ETYPE *)vs1 + H(i));                    \
         ETYPE s2 = *((ETYPE *)vs2 + H(i));                    \
         if (!vm && !vext_elem_mask(v0, i)) {                  \
@@ -1200,6 +1207,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
         }                                                     \
         vext_set_elem_mask(vd, i, DO_OP(s2, s1));             \
     }                                                         \
+    env->vstart = 0;                                          \
 }
 
 GEN_VEXT_CMP_VV(vmseq_vv_b, uint8_t,  H1, DO_MSEQ)
@@ -1240,7 +1248,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,   \
     uint32_t vl = env->vl;                                          \
     uint32_t i;                                                     \
                                                                     \
-    for (i = 0; i < vl; i++) {                                      \
+    for (i = env->vstart; i < vl; i++) {                            \
         ETYPE s2 = *((ETYPE *)vs2 + H(i));                          \
         if (!vm && !vext_elem_mask(v0, i)) {                        \
             continue;                                               \
@@ -1248,6 +1256,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,   \
         vext_set_elem_mask(vd, i,                                   \
                 DO_OP(s2, (ETYPE)(target_long)s1));                 \
     }                                                               \
+    env->vstart = 0;                                                \
 }
 
 GEN_VEXT_CMP_VX(vmseq_vx_b, uint8_t,  H1, DO_MSEQ)
@@ -1770,10 +1779,11 @@ void HELPER(NAME)(void *vd, void *vs1, CPURISCVState *env,           \
     uint32_t vl = env->vl;                                           \
     uint32_t i;                                                      \
                                                                      \
-    for (i = 0; i < vl; i++) {                                       \
+    for (i = env->vstart; i < vl; i++) {                             \
         ETYPE s1 = *((ETYPE *)vs1 + H(i));                           \
         *((ETYPE *)vd + H(i)) = s1;                                  \
     }                                                                \
+    env->vstart = 0;                                                 \
 }
 
 GEN_VEXT_VMV_VV(vmv_v_v_b, int8_t,  H1)
@@ -1788,9 +1798,10 @@ void HELPER(NAME)(void *vd, uint64_t s1, CPURISCVState *env,         \
     uint32_t vl = env->vl;                                           \
     uint32_t i;                                                      \
                                                                      \
-    for (i = 0; i < vl; i++) {                                       \
+    for (i = env->vstart; i < vl; i++) {                             \
         *((ETYPE *)vd + H(i)) = (ETYPE)s1;                           \
     }                                                                \
+    env->vstart = 0;                                                 \
 }
 
 GEN_VEXT_VMV_VX(vmv_v_x_b, int8_t,  H1)
@@ -1805,10 +1816,11 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,          \
     uint32_t vl = env->vl;                                           \
     uint32_t i;                                                      \
                                                                      \
-    for (i = 0; i < vl; i++) {                                       \
+    for (i = env->vstart; i < vl; i++) {                             \
         ETYPE *vt = (!vext_elem_mask(v0, i) ? vs2 : vs1);            \
         *((ETYPE *)vd + H(i)) = *(vt + H(i));                        \
     }                                                                \
+    env->vstart = 0;                                                 \
 }
 
 GEN_VEXT_VMERGE_VV(vmerge_vvm_b, int8_t,  H1)
@@ -1823,12 +1835,13 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1,               \
     uint32_t vl = env->vl;                                           \
     uint32_t i;                                                      \
                                                                      \
-    for (i = 0; i < vl; i++) {                                       \
+    for (i = env->vstart; i < vl; i++) {                             \
         ETYPE s2 = *((ETYPE *)vs2 + H(i));                           \
         ETYPE d = (!vext_elem_mask(v0, i) ? s2 :                     \
                    (ETYPE)(target_long)s1);                          \
         *((ETYPE *)vd + H(i)) = d;                                   \
     }                                                                \
+    env->vstart = 0;                                                 \
 }
 
 GEN_VEXT_VMERGE_VX(vmerge_vxm_b, int8_t,  H1)
@@ -1865,12 +1878,13 @@ vext_vv_rm_1(void *vd, void *v0, void *vs1, void *vs2,
              uint32_t vl, uint32_t vm, int vxrm,
              opivv2_rm_fn *fn)
 {
-    for (uint32_t i = 0; i < vl; i++) {
+    for (uint32_t i = env->vstart; i < vl; i++) {
         if (!vm && !vext_elem_mask(v0, i)) {
             continue;
         }
         fn(vd, vs1, vs2, i, env, vxrm);
     }
+    env->vstart = 0;
 }
 
 static inline void
@@ -1981,12 +1995,13 @@ vext_vx_rm_1(void *vd, void *v0, target_long s1, void *vs2,
              uint32_t vl, uint32_t vm, int vxrm,
              opivx2_rm_fn *fn)
 {
-    for (uint32_t i = 0; i < vl; i++) {
+    for (uint32_t i = env->vstart; i < vl; i++) {
         if (!vm && !vext_elem_mask(v0, i)) {
             continue;
         }
         fn(vd, s1, vs2, i, env, vxrm);
     }
+    env->vstart = 0;
 }
 
 static inline void
@@ -2768,12 +2783,13 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
     uint32_t vl = env->vl;                                \
     uint32_t i;                                           \
                                                           \
-    for (i = 0; i < vl; i++) {                            \
+    for (i = env->vstart; i < vl; i++) {                  \
         if (!vm && !vext_elem_mask(v0, i)) {              \
             continue;                                     \
         }                                                 \
         do_##NAME(vd, vs1, vs2, i, env);                  \
     }                                                     \
+    env->vstart = 0;                                      \
 }
 
 RVVCALL(OPFVV2, vfadd_vv_h, OP_UUU_H, H2, H2, H2, float16_add)
@@ -2800,12 +2816,13 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1,        \
     uint32_t vl = env->vl;                                \
     uint32_t i;                                           \
                                                           \
-    for (i = 0; i < vl; i++) {                            \
+    for (i = env->vstart; i < vl; i++) {                  \
         if (!vm && !vext_elem_mask(v0, i)) {              \
             continue;                                     \
         }                                                 \
         do_##NAME(vd, s1, vs2, i, env);                   \
     }                                                     \
+    env->vstart = 0;                                      \
 }
 
 RVVCALL(OPFVF2, vfadd_vf_h, OP_UUU_H, H2, H2, float16_add)
@@ -3371,12 +3388,13 @@ void HELPER(NAME)(void *vd, void *v0, void *vs2,       \
     if (vl == 0) {                                     \
         return;                                        \
     }                                                  \
-    for (i = 0; i < vl; i++) {                         \
+    for (i = env->vstart; i < vl; i++) {               \
         if (!vm && !vext_elem_mask(v0, i)) {           \
             continue;                                  \
         }                                              \
         do_##NAME(vd, vs2, i, env);                    \
     }                                                  \
+    env->vstart = 0;                                   \
 }
 
 RVVCALL(OPFVV1, vfsqrt_v_h, OP_UU_H, H2, H2, float16_sqrt)
@@ -3507,7 +3525,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
     uint32_t vl = env->vl;                                    \
     uint32_t i;                                               \
                                                               \
-    for (i = 0; i < vl; i++) {                                \
+    for (i = env->vstart; i < vl; i++) {                      \
         ETYPE s1 = *((ETYPE *)vs1 + H(i));                    \
         ETYPE s2 = *((ETYPE *)vs2 + H(i));                    \
         if (!vm && !vext_elem_mask(v0, i)) {                  \
@@ -3516,6 +3534,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
         vext_set_elem_mask(vd, i,                             \
                            DO_OP(s2, s1, &env->fp_status));   \
     }                                                         \
+    env->vstart = 0;                                          \
 }
 
 GEN_VEXT_CMP_VV_ENV(vmfeq_vv_h, uint16_t, H2, float16_eq_quiet)
@@ -3530,7 +3549,7 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1, void *vs2,       \
     uint32_t vl = env->vl;                                          \
     uint32_t i;                                                     \
                                                                     \
-    for (i = 0; i < vl; i++) {                                      \
+    for (i = env->vstart; i < vl; i++) {                            \
         ETYPE s2 = *((ETYPE *)vs2 + H(i));                          \
         if (!vm && !vext_elem_mask(v0, i)) {                        \
             continue;                                               \
@@ -3538,6 +3557,7 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1, void *vs2,       \
         vext_set_elem_mask(vd, i,                                   \
                            DO_OP(s2, (ETYPE)s1, &env->fp_status));  \
     }                                                               \
+    env->vstart = 0;                                                \
 }
 
 GEN_VEXT_CMP_VF(vmfeq_vf_h, uint16_t, H2, float16_eq_quiet)
@@ -3646,12 +3666,13 @@ void HELPER(NAME)(void *vd, void *v0, void *vs2,       \
     uint32_t vl = env->vl;                             \
     uint32_t i;                                        \
                                                        \
-    for (i = 0; i < vl; i++) {                         \
+    for (i = env->vstart; i < vl; i++) {               \
         if (!vm && !vext_elem_mask(v0, i)) {           \
             continue;                                  \
         }                                              \
         do_##NAME(vd, vs2, i);                         \
     }                                                  \
+    env->vstart = 0;                                   \
 }
 
 target_ulong fclass_h(uint64_t frs1)
@@ -3727,11 +3748,12 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1, void *vs2, \
     uint32_t vl = env->vl;                                    \
     uint32_t i;                                               \
                                                               \
-    for (i = 0; i < vl; i++) {                                \
+    for (i = env->vstart; i < vl; i++) {                      \
         ETYPE s2 = *((ETYPE *)vs2 + H(i));                    \
         *((ETYPE *)vd + H(i))                                 \
           = (!vm && !vext_elem_mask(v0, i) ? s2 : s1);        \
     }                                                         \
+    env->vstart = 0;                                          \
 }
 
 GEN_VFMERGE_VF(vfmerge_vfm_h, int16_t, H2)
@@ -3875,7 +3897,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
     uint32_t i;                                           \
     TD s1 =  *((TD *)vs1 + HD(0));                        \
                                                           \
-    for (i = 0; i < vl; i++) {                            \
+    for (i = env->vstart; i < vl; i++) {                  \
         TS2 s2 = *((TS2 *)vs2 + HS2(i));                  \
         if (!vm && !vext_elem_mask(v0, i)) {              \
             continue;                                     \
@@ -3883,6 +3905,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
         s1 = OP(s1, (TD)s2);                              \
     }                                                     \
     *((TD *)vd + HD(0)) = s1;                             \
+    env->vstart = 0;                                      \
 }
 
 /* vd[0] = sum(vs1[0], vs2[*]) */
@@ -3955,7 +3978,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,           \
     uint32_t i;                                            \
     TD s1 =  *((TD *)vs1 + HD(0));                         \
                                                            \
-    for (i = 0; i < vl; i++) {                             \
+    for (i = env->vstart; i < vl; i++) {                   \
         TS2 s2 = *((TS2 *)vs2 + HS2(i));                   \
         if (!vm && !vext_elem_mask(v0, i)) {               \
             continue;                                      \
@@ -3963,6 +3986,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,           \
         s1 = OP(s1, (TD)s2, &env->fp_status);              \
     }                                                      \
     *((TD *)vd + HD(0)) = s1;                              \
+    env->vstart = 0;                                       \
 }
 
 /* Unordered sum */
@@ -3990,7 +4014,7 @@ void HELPER(vfwredsum_vs_h)(void *vd, void *v0, void *vs1,
     uint32_t i;
     uint32_t s1 =  *((uint32_t *)vs1 + H4(0));
 
-    for (i = 0; i < vl; i++) {
+    for (i = env->vstart; i < vl; i++) {
         uint16_t s2 = *((uint16_t *)vs2 + H2(i));
         if (!vm && !vext_elem_mask(v0, i)) {
             continue;
@@ -3999,6 +4023,7 @@ void HELPER(vfwredsum_vs_h)(void *vd, void *v0, void *vs1,
                          &env->fp_status);
     }
     *((uint32_t *)vd + H4(0)) = s1;
+    env->vstart = 0;
 }
 
 void HELPER(vfwredsum_vs_w)(void *vd, void *v0, void *vs1,
@@ -4009,7 +4034,7 @@ void HELPER(vfwredsum_vs_w)(void *vd, void *v0, void *vs1,
     uint32_t i;
     uint64_t s1 =  *((uint64_t *)vs1);
 
-    for (i = 0; i < vl; i++) {
+    for (i = env->vstart; i < vl; i++) {
         uint32_t s2 = *((uint32_t *)vs2 + H4(i));
         if (!vm && !vext_elem_mask(v0, i)) {
             continue;
@@ -4018,6 +4043,7 @@ void HELPER(vfwredsum_vs_w)(void *vd, void *v0, void *vs1,
                          &env->fp_status);
     }
     *((uint64_t *)vd) = s1;
+    env->vstart = 0;
 }
 
 /*
@@ -4033,11 +4059,12 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
     uint32_t i;                                           \
     int a, b;                                             \
                                                           \
-    for (i = 0; i < vl; i++) {                            \
+    for (i = env->vstart; i < vl; i++) {                  \
         a = vext_elem_mask(vs1, i);                       \
         b = vext_elem_mask(vs2, i);                       \
         vext_set_elem_mask(vd, i, OP(b, a));              \
     }                                                     \
+    env->vstart = 0;                                      \
 }
 
 #define DO_NAND(N, M)  (!(N & M))
@@ -4064,13 +4091,14 @@ target_ulong HELPER(vcpop_m)(void *v0, void *vs2, CPURISCVState *env,
     uint32_t vl = env->vl;
     int i;
 
-    for (i = 0; i < vl; i++) {
+    for (i = env->vstart; i < vl; i++) {
         if (vm || vext_elem_mask(v0, i)) {
             if (vext_elem_mask(vs2, i)) {
                 cnt++;
             }
         }
     }
+    env->vstart = 0;
     return cnt;
 }
 
@@ -4082,13 +4110,14 @@ target_ulong HELPER(vfirst_m)(void *v0, void *vs2, CPURISCVState *env,
     uint32_t vl = env->vl;
     int i;
 
-    for (i = 0; i < vl; i++) {
+    for (i = env->vstart; i < vl; i++) {
         if (vm || vext_elem_mask(v0, i)) {
             if (vext_elem_mask(vs2, i)) {
                 return i;
             }
         }
     }
+    env->vstart = 0;
     return -1LL;
 }
 
@@ -4106,7 +4135,7 @@ static void vmsetm(void *vd, void *v0, void *vs2, CPURISCVState *env,
     int i;
     bool first_mask_bit = false;
 
-    for (i = 0; i < vl; i++) {
+    for (i = env->vstart; i < vl; i++) {
         if (!vm && !vext_elem_mask(v0, i)) {
             continue;
         }
@@ -4130,6 +4159,7 @@ static void vmsetm(void *vd, void *v0, void *vs2, CPURISCVState *env,
             }
         }
     }
+    env->vstart = 0;
 }
 
 void HELPER(vmsbf_m)(void *vd, void *v0, void *vs2, CPURISCVState *env,
@@ -4160,7 +4190,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs2, CPURISCVState *env,      \
     uint32_t sum = 0;                                                     \
     int i;                                                                \
                                                                           \
-    for (i = 0; i < vl; i++) {                                            \
+    for (i = env->vstart; i < vl; i++) {                                  \
         if (!vm && !vext_elem_mask(v0, i)) {                              \
             continue;                                                     \
         }                                                                 \
@@ -4169,6 +4199,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs2, CPURISCVState *env,      \
             sum++;                                                        \
         }                                                                 \
     }                                                                     \
+    env->vstart = 0;                                                      \
 }
 
 GEN_VEXT_VIOTA_M(viota_m_b, uint8_t,  H1)
@@ -4184,12 +4215,13 @@ void HELPER(NAME)(void *vd, void *v0, CPURISCVState *env, uint32_t desc)  \
     uint32_t vl = env->vl;                                                \
     int i;                                                                \
                                                                           \
-    for (i = 0; i < vl; i++) {                                            \
+    for (i = env->vstart; i < vl; i++) {                                  \
         if (!vm && !vext_elem_mask(v0, i)) {                              \
             continue;                                                     \
         }                                                                 \
         *((ETYPE *)vd + H(i)) = i;                                        \
     }                                                                     \
+    env->vstart = 0;                                                      \
 }
 
 GEN_VEXT_VID_V(vid_v_b, uint8_t,  H1)
@@ -4208,9 +4240,10 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
 {                                                                         \
     uint32_t vm = vext_vm(desc);                                          \
     uint32_t vl = env->vl;                                                \
-    target_ulong offset = s1, i;                                          \
+    target_ulong offset = s1, i_min, i;                                   \
                                                                           \
-    for (i = offset; i < vl; i++) {                                       \
+    i_min = MAX(env->vstart, offset);                                     \
+    for (i = i_min; i < vl; i++) {                                        \
         if (!vm && !vext_elem_mask(v0, i)) {                              \
             continue;                                                     \
         }                                                                 \
@@ -4233,8 +4266,8 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
     uint32_t vl = env->vl;                                                \
     target_ulong i_max, i;                                                \
                                                                           \
-    i_max = MIN(s1 < vlmax ? vlmax - s1 : 0, vl);                         \
-    for (i = 0; i < i_max; ++i) {                                         \
+    i_max = MAX(MIN(s1 < vlmax ? vlmax - s1 : 0, vl), env->vstart);       \
+    for (i = env->vstart; i < i_max; ++i) {                               \
         if (vm || vext_elem_mask(v0, i)) {                                \
             *((ETYPE *)vd + H(i)) = *((ETYPE *)vs2 + H(i + s1));          \
         }                                                                 \
@@ -4245,6 +4278,8 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
             *((ETYPE *)vd + H(i)) = 0;                                    \
         }                                                                 \
     }                                                                     \
+                                                                          \
+    env->vstart = 0;                                                      \
 }
 
 /* vslidedown.vx vd, vs2, rs1, vm # vd[i] = vs2[i+rs1] */
@@ -4262,7 +4297,7 @@ static void vslide1up_##ESZ(void *vd, void *v0, target_ulong s1, void *vs2, \
     uint32_t vl = env->vl;                                                  \
     uint32_t i;                                                             \
                                                                             \
-    for (i = 0; i < vl; i++) {                                              \
+    for (i = env->vstart; i < vl; i++) {                                    \
         if (!vm && !vext_elem_mask(v0, i)) {                                \
             continue;                                                       \
         }                                                                   \
@@ -4272,6 +4307,7 @@ static void vslide1up_##ESZ(void *vd, void *v0, target_ulong s1, void *vs2, \
             *((ETYPE *)vd + H(i)) = *((ETYPE *)vs2 + H(i - 1));             \
         }                                                                   \
     }                                                                       \
+    env->vstart = 0;                                                        \
 }
 
 GEN_VEXT_VSLIE1UP(8,  H1)
@@ -4301,7 +4337,7 @@ static void vslide1down_##ESZ(void *vd, void *v0, target_ulong s1, void *vs2, \
     uint32_t vl = env->vl;                                                    \
     uint32_t i;                                                               \
                                                                               \
-    for (i = 0; i < vl; i++) {                                                \
+    for (i = env->vstart; i < vl; i++) {                                      \
         if (!vm && !vext_elem_mask(v0, i)) {                                  \
             continue;                                                         \
         }                                                                     \
@@ -4311,6 +4347,7 @@ static void vslide1down_##ESZ(void *vd, void *v0, target_ulong s1, void *vs2, \
             *((ETYPE *)vd + H(i)) = *((ETYPE *)vs2 + H(i + 1));               \
         }                                                                     \
     }                                                                         \
+    env->vstart = 0;                                                          \
 }
 
 GEN_VEXT_VSLIDE1DOWN(8,  H1)
@@ -4361,13 +4398,13 @@ GEN_VEXT_VFSLIDE1DOWN_VF(vfslide1down_vf_d, 64)
 void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,               \
                   CPURISCVState *env, uint32_t desc)                      \
 {                                                                         \
-    uint32_t vlmax = vext_max_elems(desc, ctzl(sizeof(TS1)));             \
+    uint32_t vlmax = vext_max_elems(desc, ctzl(sizeof(TS2)));             \
     uint32_t vm = vext_vm(desc);                                          \
     uint32_t vl = env->vl;                                                \
     uint64_t index;                                                       \
     uint32_t i;                                                           \
                                                                           \
-    for (i = 0; i < vl; i++) {                                            \
+    for (i = env->vstart; i < vl; i++) {                                  \
         if (!vm && !vext_elem_mask(v0, i)) {                              \
             continue;                                                     \
         }                                                                 \
@@ -4378,6 +4415,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,               \
             *((TS2 *)vd + HS2(i)) = *((TS2 *)vs2 + HS2(index));           \
         }                                                                 \
     }                                                                     \
+    env->vstart = 0;                                                      \
 }
 
 /* vd[i] = (vs1[i] >= VLMAX) ? 0 : vs2[vs1[i]]; */
@@ -4401,7 +4439,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
     uint64_t index = s1;                                                  \
     uint32_t i;                                                           \
                                                                           \
-    for (i = 0; i < vl; i++) {                                            \
+    for (i = env->vstart; i < vl; i++) {                                  \
         if (!vm && !vext_elem_mask(v0, i)) {                              \
             continue;                                                     \
         }                                                                 \
@@ -4411,6 +4449,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
             *((ETYPE *)vd + H(i)) = *((ETYPE *)vs2 + H(index));           \
         }                                                                 \
     }                                                                     \
+    env->vstart = 0;                                                      \
 }
 
 /* vd[i] = (x[rs1] >= VLMAX) ? 0 : vs2[rs1] */
@@ -4427,13 +4466,14 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,               \
     uint32_t vl = env->vl;                                                \
     uint32_t num = 0, i;                                                  \
                                                                           \
-    for (i = 0; i < vl; i++) {                                            \
+    for (i = env->vstart; i < vl; i++) {                                  \
         if (!vext_elem_mask(vs1, i)) {                                    \
             continue;                                                     \
         }                                                                 \
         *((ETYPE *)vd + H(num)) = *((ETYPE *)vs2 + H(i));                 \
         num++;                                                            \
     }                                                                     \
+    env->vstart = 0;                                                      \
 }
 
 /* Compress into vd elements of vs2 where vs1 is enabled */
@@ -4442,6 +4482,27 @@ GEN_VEXT_VCOMPRESS_VM(vcompress_vm_h, uint16_t, H2)
 GEN_VEXT_VCOMPRESS_VM(vcompress_vm_w, uint32_t, H4)
 GEN_VEXT_VCOMPRESS_VM(vcompress_vm_d, uint64_t, H8)
 
+/* Vector Whole Register Move */
+#define GEN_VEXT_VMV_WHOLE(NAME, LEN)                      \
+void HELPER(NAME)(void *vd, void *vs2, CPURISCVState *env, \
+                  uint32_t desc)                           \
+{                                                          \
+    /* EEW = 8 */                                          \
+    uint32_t maxsz = simd_maxsz(desc);                     \
+    uint32_t i = env->vstart;                              \
+                                                           \
+    memcpy((uint8_t *)vd + H1(i),                          \
+           (uint8_t *)vs2 + H1(i),                         \
+           maxsz - env->vstart);                           \
+                                                           \
+    env->vstart = 0;                                       \
+}
+
+GEN_VEXT_VMV_WHOLE(vmv1r_v, 1)
+GEN_VEXT_VMV_WHOLE(vmv2r_v, 2)
+GEN_VEXT_VMV_WHOLE(vmv4r_v, 4)
+GEN_VEXT_VMV_WHOLE(vmv8r_v, 8)
+
 /* Vector Integer Extension */
 #define GEN_VEXT_INT_EXT(NAME, ETYPE, DTYPE, HD, HS1)            \
 void HELPER(NAME)(void *vd, void *v0, void *vs2,                 \
@@ -4451,12 +4512,13 @@ void HELPER(NAME)(void *vd, void *v0, void *vs2,                 \
     uint32_t vm = vext_vm(desc);                                 \
     uint32_t i;                                                  \
                                                                  \
-    for (i = 0; i < vl; i++) {                                   \
+    for (i = env->vstart; i < vl; i++) {                         \
         if (!vm && !vext_elem_mask(v0, i)) {                     \
             continue;                                            \
         }                                                        \
         *((ETYPE *)vd + HD(i)) = *((DTYPE *)vs2 + HS1(i));       \
     }                                                            \
+    env->vstart = 0;                                             \
 }
 
 GEN_VEXT_INT_EXT(vzext_vf2_h, uint16_t, uint8_t,  H2, H1)
-- 
2.31.1


