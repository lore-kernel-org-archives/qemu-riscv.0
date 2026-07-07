Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AB74C43602
	for <qemu-riscv@archiver.kernel.org>; Tue,  7 Jul 2026 09:12:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wh1pb-0003Zo-Bb; Tue, 07 Jul 2026 05:11:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1wh1pa-0003ZM-4d
 for qemu-riscv@nongnu.org; Tue, 07 Jul 2026 05:11:06 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1wh1pX-0002H8-5k
 for qemu-riscv@nongnu.org; Tue, 07 Jul 2026 05:11:05 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-493c1950518so2546145e9.1
 for <qemu-riscv@nongnu.org>; Tue, 07 Jul 2026 02:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1783415462; x=1784020262; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PD6VgqLxjb6wWjSJyDflTN+LGJInBMBFIIvd/XvIVpw=;
 b=EhpN+Qjdz6HR1fEaQRbc2Rgnz9Cxriqx8iCpRU6HfdPq47TzArB/AHb+CySForyXip
 tmtDa/f6O0t9mw9N2N7iTYB19F7ULtoH8dVOyO01wOuMr+FQ0XyYVDgzPkbElsfSiXgW
 PNNWItkIHlWGy8qJ3UXEUg3Fn2X6twST6lZv4/i3pQGdntRSe37dvrGiORtVsSHUA0yE
 FHHvKj8vEOiWX1jhZCP7NmjONPQk0G9QLv/ksKaals1gpADV2+mT49tQM09juYr+ZFWQ
 htGQA1FJ/5iJQVkTld2bFzKRhBSh5BV1tIWUA12SImDewt7G+nAHEMp1rLFl3dyZUZdC
 gMKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783415462; x=1784020262;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=PD6VgqLxjb6wWjSJyDflTN+LGJInBMBFIIvd/XvIVpw=;
 b=tAbP5peOZx0HcRWLe959RWrY7azrxYlNet8nB4I7D7p/BqKWr9wyXarhlVzeWXTQ36
 1LpS9y++mXV8OIEsTodecBHPeGa4U6nPlCEYMq1GWkOsezVyp1c1PSr+jKBk3lYV7xLS
 o3fQtrrwIttOsLwcw2jJYTc4oFVqY1vF+ZDjGUkdiBNnK/cAx9cRVovDijEZE8phlBHx
 wUpoZl+QFAvtXWOhHfw/gQq0529xqa2e62Nfd80JWqvLJVEL+q4/ZqzbF/o52ghmkz4g
 ygV112X5RIV3EHj7NveJyogaLYEvUV40Ajdrj+RCZuru5UanS2T67TurBKTI/pDpMxoX
 gazA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp2cAUvPSYRYuaumdAIaPplBZfbuvFI96S8QhA+JXcsRIfu8XVa0KDbIceuY35C0N+46e59iAKtS4uN@nongnu.org
X-Gm-Message-State: AOJu0YworFveaJkDfGw6ZqOI5hYFKlTEvIS1MQF73TGqN6dWJBXdHQWo
 RGPVro/SXgJkKLQL6+4T7Asq2Ek8NNlfifyDTo/IIYJTbQ33J+skRS1IHS57TEfLbGg=
X-Gm-Gg: AfdE7ckiWrq29tT1ZP+YGIQ5PhjTL3AxxPYHXbqRjo1VLoxW0kU0E1tr0M3S5bcVQiZ
 Jb/Xz56ArA8S2bzu4KkObx1mJ/CPsAQLdGx+XgTSeXo1uXyjebPDZNdt5D7jKu2jieAhCf22C3i
 VUhpup7W+WYic4NBDo4/W/N1oZGodnoiELGDoo1ur9ydR7eT9lV+uU+q3dngMFuwjwkN03kS8PE
 v33LKVfIwxkdeJ8XZg6S7memC++f1QJSC83vmlnMH6Y5zOrC7/HuxBo0j/lv9cPsHVngZtaXKds
 WtWmebZOfxcv04xdDHJUZGFHrXk5NaqE992xcr3vjwhvkoMFao3WSJTD6SLvFdvkTJ5DDos/SYU
 t0D1J7nOMbqemUiLVK+3TkiZ8n0RJgYqt/lrgQAog0CmbgsuTLZLNCGOaXOu1DcmPmOP/64vPsR
 DehgiAYBnrhT0bYTyYBSTldus79Pq1Ra+MQwYRK7w=
X-Received: by 2002:a05:600c:37c3:b0:493:bee0:4360 with SMTP id
 5b1f17b1804b1-493e10217d6mr18064775e9.17.1783415461540; 
 Tue, 07 Jul 2026 02:11:01 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493e0f32660sm41004665e9.2.2026.07.07.02.10.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2026 02:11:01 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>,
 qemu-riscv@nongnu.org (open list:SiFive Machines),
 Frank Chang <frank.chang@sifive.com>, Max Chou <max.chou@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v4 3/6] target/riscv: Support raising misaligned exceptions
 for vector loads/stores
Date: Tue,  7 Jul 2026 17:10:36 +0800
Message-ID: <20260707091039.2574638-4-frank.chang@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707091039.2574638-1-frank.chang@sifive.com>
References: <20260707091039.2574638-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=frank.chang@sifive.com; helo=mail-wm1-x32b.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

From: Frank Chang <frank.chang@sifive.com>

When the Zicclsm extension is not enabled, raise misaligned load/store
exceptions for misaligned accesses from vector load/store instructions.

We will skip the host fast-path and fall back to the slow TLB-path to
raise misaligned load/store exceptions for the misaligned accesses when
Zicclsm extension is disabled.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Max Chou <max.chou@sifive.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 18 +++++--
 target/riscv/vector_helper.c            | 65 +++++++++++++++++++------
 2 files changed, 65 insertions(+), 18 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 23262b1d036..a22e2cae6ce 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1191,26 +1191,38 @@ static bool ldst_whole_trans(uint32_t vd, uint32_t rs1, uint32_t nf,
      * Use the helper function if either:
      * - vstart is not 0.
      */
-
     bool use_helper_fn = !s->vstart_eq_zero;
 
     if (!use_helper_fn) {
         uint32_t size = s->cfg_ptr->vlenb * nf;
         TCGv_i64 t8 = tcg_temp_new_i64();
         MemOp atomicity = MO_ATOM_NONE;
+        MemOp alignment = MO_UNALN;
+
+        /*
+         * If Zicclsm is disabled, require alignment based on element size.
+         * Use MO_ALIGN_* based on log2_esz (0 = MO_UNALN, 1 = MO_ALIGN_2, etc).
+         */
+        if (!s->cfg_ptr->ext_zicclsm) {
+            alignment = log2_esz << MO_ASHIFT;
+        }
+
         if (log2_esz == 0) {
             atomicity = MO_ATOM_NONE;
         } else {
             atomicity = MO_ATOM_IFALIGN_PAIR;
         }
+
         for (int i = 0; i < size; i += 8) {
             TCGv addr = get_address(s, rs1, i);
             if (is_load) {
-                tcg_gen_qemu_ld_i64(t8, addr, s->mem_idx, MO_LEUQ | atomicity);
+                tcg_gen_qemu_ld_i64(t8, addr, s->mem_idx,
+                                    MO_LEUQ | atomicity | alignment);
                 tcg_gen_st_i64(t8, tcg_env, vreg_ofs(s, vd) + i);
             } else {
                 tcg_gen_ld_i64(t8, tcg_env, vreg_ofs(s, vd) + i);
-                tcg_gen_qemu_st_i64(t8, addr, s->mem_idx, MO_LEUQ | atomicity);
+                tcg_gen_qemu_st_i64(t8, addr, s->mem_idx,
+                                    MO_LEUQ | atomicity | alignment);
             }
             if (i == size - 8) {
                 tcg_gen_movi_i32(cpu_vstart, 0);
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index e321ca26161..e28d8a3d9fd 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -199,20 +199,34 @@ static inline void vext_set_elem_mask(void *v0, int index,
     ((uint64_t *)v0)[idx] = deposit64(old, pos, 1, value);
 }
 
+static inline MemOpIdx vext_make_memop_idx(CPURISCVState *env, size_t size)
+{
+    int mmu_idx = riscv_env_mmu_index(env, false);
+    MemOp memop = size_memop(size) | mo_endian_env(env);
+
+    if (!riscv_cpu_cfg(env)->ext_zicclsm) {
+        memop |= MO_ALIGN;
+    }
+
+    return make_memop_idx(memop, mmu_idx);
+}
+
 /* elements operations for load and store */
 typedef void vext_ldst_elem_fn_tlb(CPURISCVState *env, abi_ptr addr,
                                    uint32_t idx, void *vd, uintptr_t retaddr);
 typedef void vext_ldst_elem_fn_host(void *vd, uint32_t idx, void *host);
 
-#define GEN_VEXT_LD_ELEM(NAME, ETYPE, H, LDSUF)             \
+#define GEN_VEXT_TLB_LD_ELEM(NAME, ETYPE, H, LDSUF)         \
 static inline QEMU_ALWAYS_INLINE                            \
 void NAME##_tlb(CPURISCVState *env, abi_ptr addr,           \
                 uint32_t idx, void *vd, uintptr_t retaddr)  \
 {                                                           \
     ETYPE *cur = ((ETYPE *)vd + H(idx));                    \
-    *cur = cpu_##LDSUF##_data_ra(env, addr, retaddr);       \
+    MemOpIdx oi = vext_make_memop_idx(env, sizeof(ETYPE));  \
+    *cur = cpu_##LDSUF##_mmu(env, addr, oi, retaddr);       \
 }                                                           \
-                                                            \
+
+#define GEN_VEXT_HOST_LD_ELEM(NAME, ETYPE, H, LDSUF)        \
 static inline QEMU_ALWAYS_INLINE                            \
 void NAME##_host(void *vd, uint32_t idx, void *host)        \
 {                                                           \
@@ -220,20 +234,27 @@ void NAME##_host(void *vd, uint32_t idx, void *host)        \
     *cur = (ETYPE)LDSUF##_p(host);                          \
 }
 
-GEN_VEXT_LD_ELEM(lde_b, uint8_t,  H1, ldub)
-GEN_VEXT_LD_ELEM(lde_h, uint16_t, H2, lduw_le)
-GEN_VEXT_LD_ELEM(lde_w, uint32_t, H4, ldl_le)
-GEN_VEXT_LD_ELEM(lde_d, uint64_t, H8, ldq_le)
+GEN_VEXT_TLB_LD_ELEM(lde_b, uint8_t,  H1, ldb)
+GEN_VEXT_TLB_LD_ELEM(lde_h, uint16_t, H2, ldw)
+GEN_VEXT_TLB_LD_ELEM(lde_w, uint32_t, H4, ldl)
+GEN_VEXT_TLB_LD_ELEM(lde_d, uint64_t, H8, ldq)
 
-#define GEN_VEXT_ST_ELEM(NAME, ETYPE, H, STSUF)             \
+GEN_VEXT_HOST_LD_ELEM(lde_b, uint8_t,  H1, ldub)
+GEN_VEXT_HOST_LD_ELEM(lde_h, uint16_t, H2, lduw_le)
+GEN_VEXT_HOST_LD_ELEM(lde_w, uint32_t, H4, ldl_le)
+GEN_VEXT_HOST_LD_ELEM(lde_d, uint64_t, H8, ldq_le)
+
+#define GEN_VEXT_TLB_ST_ELEM(NAME, ETYPE, H, STSUF)         \
 static inline QEMU_ALWAYS_INLINE                            \
 void NAME##_tlb(CPURISCVState *env, abi_ptr addr,           \
                 uint32_t idx, void *vd, uintptr_t retaddr)  \
 {                                                           \
     ETYPE data = *((ETYPE *)vd + H(idx));                   \
-    cpu_##STSUF##_data_ra(env, addr, data, retaddr);        \
+    MemOpIdx oi = vext_make_memop_idx(env, sizeof(ETYPE));  \
+    cpu_##STSUF##_mmu(env, addr, data, oi, retaddr);        \
 }                                                           \
-                                                            \
+
+#define GEN_VEXT_HOST_ST_ELEM(NAME, ETYPE, H, STSUF)        \
 static inline QEMU_ALWAYS_INLINE                            \
 void NAME##_host(void *vd, uint32_t idx, void *host)        \
 {                                                           \
@@ -241,10 +262,15 @@ void NAME##_host(void *vd, uint32_t idx, void *host)        \
     STSUF##_p(host, data);                                  \
 }
 
-GEN_VEXT_ST_ELEM(ste_b, uint8_t,  H1, stb)
-GEN_VEXT_ST_ELEM(ste_h, uint16_t, H2, stw_le)
-GEN_VEXT_ST_ELEM(ste_w, uint32_t, H4, stl_le)
-GEN_VEXT_ST_ELEM(ste_d, uint64_t, H8, stq_le)
+GEN_VEXT_TLB_ST_ELEM(ste_b, uint8_t,  H1, stb)
+GEN_VEXT_TLB_ST_ELEM(ste_h, uint16_t, H2, stw)
+GEN_VEXT_TLB_ST_ELEM(ste_w, uint32_t, H4, stl)
+GEN_VEXT_TLB_ST_ELEM(ste_d, uint64_t, H8, stq)
+
+GEN_VEXT_HOST_ST_ELEM(ste_b, uint8_t,  H1, stb)
+GEN_VEXT_HOST_ST_ELEM(ste_h, uint16_t, H2, stw_le)
+GEN_VEXT_HOST_ST_ELEM(ste_w, uint32_t, H4, stl_le)
+GEN_VEXT_HOST_ST_ELEM(ste_d, uint64_t, H8, stq_le)
 
 static inline QEMU_ALWAYS_INLINE void
 vext_continuous_ldst_tlb(CPURISCVState *env, vext_ldst_elem_fn_tlb *ldst_tlb,
@@ -398,7 +424,16 @@ vext_page_ldst_us(CPURISCVState *env, void *vd, target_ulong addr,
     probe_pages(env, addr, size, ra, access_type, mmu_index, &host, &flags,
                 true);
 
-    if (flags == 0) {
+    bool misaligned = addr & (esz - 1);
+
+    /*
+     * Allow the host fast-pash when:
+     *   1. Page permission/pmp/watchpoint are checked and we have a contigous
+     *      host mapping.
+     *   2. Zicclsm is enabled or load/store is not a misaligned access.
+     * Otherwise, we will fall back to the slow TLB-path.
+     */
+    if (flags == 0 && (riscv_cpu_cfg(env)->ext_zicclsm || !misaligned)) {
         if (nf == 1) {
             vext_continuous_ldst_host(env, ldst_host, vd, evl, env->vstart,
                                       host, esz, is_load);
-- 
2.43.0


