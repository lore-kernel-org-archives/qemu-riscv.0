Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jtscl-0006Tc-Oe
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jul 2020 08:59:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqd9-0005FM-F5
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:51:47 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:45698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqd7-0006bq-Dl
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:51:47 -0400
Received: by mail-pl1-x636.google.com with SMTP id k4so2086168pld.12
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2020 03:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=+iRPmbuMdHobYwBjPg2b0Sm7HMs4t/YW9apRnR/5t8o=;
 b=CsuAOc7xk4yxCD5LA1pkrcOUS7WccygzGsuvv5jv8UlV5Sfo1jH4ImDYrUVt/QvCR6
 sug543m8rc60/9kDnrXdS063yWWcsLBwCiNxGZQbPTf8ID18fye7ItIiafIIIG0Unnh5
 ML0xu1IatfcOWCm4z7F0NU/ZzKE3V+JgdXjsPVVREo9ZaRfRjGCiHb6+ryAaB9Gpfklr
 Veo4dO5EgpBpdDlfVUzbWLa+AlcfNGeJkupzws7gNgBnpnhn+c7K3nHdDapAkfbh3Ukp
 0WQ9CR7FCtsAie7q3H1glBS4GhRUpeuQBuEDLYaabxikiyKcCLnU/aMwVJsaec3vvFPC
 pzTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=+iRPmbuMdHobYwBjPg2b0Sm7HMs4t/YW9apRnR/5t8o=;
 b=P3xfdFqdFRtd54NBNliomAr1MNB2ue3KuKjfS1R4C/c9FtVdCwmva5m/J/dMCMp/eC
 XUrpUPYe4btSEduCMQ3K70kN63rpJuSIJApqWNAMp8NkuCAag7mITTVf+8uZT/Co3rll
 /uq3I1tpLuj/KfaY8LK34Vvws6GMMUdI+TiUWYuNqQviOaXI2JJ5z87/lIUR6sBVlxww
 zM4vecE3favO9g7kFd3lYCVbfqe58InUYdoNdAjpvYxmZE/sxIjqAMSzhELzN5g3JY/j
 36ZtRae3HxIy7Sn4eNb/oQ5xkUFviYUg9B59COcFLwWlVVmMcamLlMJCDIPBfOOgmCp6
 Piag==
X-Gm-Message-State: AOAM532AnvzeiFZ+HD4QEgOq9G3UzjWLjACU/eFkNklyxkl0QHssbP88
 RLLGwoq5bB+gAGBHkhpYcR6OuQ==
X-Google-Smtp-Source: ABdhPJzUKKaQP0qcurt2PTKPaLO9e5SLsuP7veEcYmF+FxSm6osEv2DUPJ2ishmw5AqeskX/U3GSQg==
X-Received: by 2002:a17:902:7807:: with SMTP id
 p7mr59943994pll.242.1594378304044; 
 Fri, 10 Jul 2020 03:51:44 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id r191sm5519406pfr.181.2020.07.10.03.51.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 03:51:43 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC 17/65] target/riscv: rvv-0.9: fault-only-first unit stride load
Date: Fri, 10 Jul 2020 18:48:31 +0800
Message-Id: <20200710104920.13550-18-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200710104920.13550-1-frank.chang@sifive.com>
References: <20200710104920.13550-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x636.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 10 Jul 2020 08:58:58 -0400
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
X-List-Received-Date: Fri, 10 Jul 2020 10:51:47 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/helper.h                   | 27 +++---------
 target/riscv/insn32.decode              | 14 +++----
 target/riscv/insn_trans/trans_rvv.inc.c | 31 ++++----------
 target/riscv/vector_helper.c            | 56 +++++++++----------------
 4 files changed, 38 insertions(+), 90 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 99ea68b0b9..d83d1def4e 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -140,28 +140,11 @@ DEF_HELPER_6(vsxei64_8_v, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vsxei64_16_v, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vsxei64_32_v, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vsxei64_64_v, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_5(vlbff_v_b, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlbff_v_h, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlbff_v_w, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlbff_v_d, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlhff_v_h, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlhff_v_w, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlhff_v_d, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlwff_v_w, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlwff_v_d, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vleff_v_b, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vleff_v_h, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vleff_v_w, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vleff_v_d, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlbuff_v_b, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlbuff_v_h, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlbuff_v_w, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlbuff_v_d, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlhuff_v_h, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlhuff_v_w, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlhuff_v_d, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlwuff_v_w, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlwuff_v_d, void, ptr, ptr, tl, env, i32)
+DEF_HELPER_5(vle8ff_v, void, ptr, ptr, tl, env, i32)
+DEF_HELPER_5(vle16ff_v, void, ptr, ptr, tl, env, i32)
+DEF_HELPER_5(vle32ff_v, void, ptr, ptr, tl, env, i32)
+DEF_HELPER_5(vle64ff_v, void, ptr, ptr, tl, env, i32)
+
 #ifdef TARGET_RISCV64
 DEF_HELPER_6(vamoswapw_v_d, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vamoswapd_v_d, void, ptr, ptr, tl, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 46542d162e..b0aaa186b8 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -249,14 +249,6 @@ vsse16_v    ... 010 . ..... ..... 101 ..... 0100111 @r_nfvm
 vsse32_v    ... 010 . ..... ..... 110 ..... 0100111 @r_nfvm
 vsse64_v    ... 010 . ..... ..... 111 ..... 0100111 @r_nfvm
 
-vlbff_v    ... 100 . 10000 ..... 000 ..... 0000111 @r2_nfvm
-vlhff_v    ... 100 . 10000 ..... 101 ..... 0000111 @r2_nfvm
-vlwff_v    ... 100 . 10000 ..... 110 ..... 0000111 @r2_nfvm
-vleff_v    ... 000 . 10000 ..... 111 ..... 0000111 @r2_nfvm
-vlbuff_v   ... 000 . 10000 ..... 000 ..... 0000111 @r2_nfvm
-vlhuff_v   ... 000 . 10000 ..... 101 ..... 0000111 @r2_nfvm
-vlwuff_v   ... 000 . 10000 ..... 110 ..... 0000111 @r2_nfvm
-
 # Vector indexed load insns.
 vlxei8_v      ... 011 . ..... ..... 000 ..... 0000111 @r_nfvm
 vlxei16_v     ... 011 . ..... ..... 101 ..... 0000111 @r_nfvm
@@ -269,6 +261,12 @@ vsxei16_v     ... 0-1 . ..... ..... 101 ..... 0100111 @r_nfvm
 vsxei32_v     ... 0-1 . ..... ..... 110 ..... 0100111 @r_nfvm
 vsxei64_v     ... 0-1 . ..... ..... 111 ..... 0100111 @r_nfvm
 
+# Vector unit-stride fault-only-first load insns.
+vle8ff_v      ... 000 . 10000 ..... 000 ..... 0000111 @r2_nfvm
+vle16ff_v     ... 000 . 10000 ..... 101 ..... 0000111 @r2_nfvm
+vle32ff_v     ... 000 . 10000 ..... 110 ..... 0000111 @r2_nfvm
+vle64ff_v     ... 000 . 10000 ..... 111 ..... 0000111 @r2_nfvm
+
 #*** Vector AMO operations are encoded under the standard AMO major opcode ***
 vamoswapw_v     00001 . . ..... ..... 110 ..... 0101111 @r_wdvm
 vamoaddw_v      00000 . . ..... ..... 110 ..... 0101111 @r_wdvm
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 417edbe5a1..d8fea3af4c 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -771,25 +771,13 @@ static bool ldff_op(DisasContext *s, arg_r2nfvm *a, uint8_t seq)
 {
     uint32_t data = 0;
     gen_helper_ldst_us *fn;
-    static gen_helper_ldst_us * const fns[7][4] = {
-        { gen_helper_vlbff_v_b,  gen_helper_vlbff_v_h,
-          gen_helper_vlbff_v_w,  gen_helper_vlbff_v_d },
-        { NULL,                  gen_helper_vlhff_v_h,
-          gen_helper_vlhff_v_w,  gen_helper_vlhff_v_d },
-        { NULL,                  NULL,
-          gen_helper_vlwff_v_w,  gen_helper_vlwff_v_d },
-        { gen_helper_vleff_v_b,  gen_helper_vleff_v_h,
-          gen_helper_vleff_v_w,  gen_helper_vleff_v_d },
-        { gen_helper_vlbuff_v_b, gen_helper_vlbuff_v_h,
-          gen_helper_vlbuff_v_w, gen_helper_vlbuff_v_d },
-        { NULL,                  gen_helper_vlhuff_v_h,
-          gen_helper_vlhuff_v_w, gen_helper_vlhuff_v_d },
-        { NULL,                  NULL,
-          gen_helper_vlwuff_v_w, gen_helper_vlwuff_v_d }
+    static gen_helper_ldst_us * const fns[4] = {
+        gen_helper_vle8ff_v, gen_helper_vle16ff_v,
+        gen_helper_vle32ff_v, gen_helper_vle64ff_v
     };
     bool ret;
 
-    fn =  fns[seq][s->sew];
+    fn = fns[seq];
     if (fn == NULL) {
         return false;
     }
@@ -805,13 +793,10 @@ static bool ldff_op(DisasContext *s, arg_r2nfvm *a, uint8_t seq)
     return ret;
 }
 
-GEN_VEXT_TRANS(vlbff_v, 0, r2nfvm, ldff_op, ld_us_check)
-GEN_VEXT_TRANS(vlhff_v, 1, r2nfvm, ldff_op, ld_us_check)
-GEN_VEXT_TRANS(vlwff_v, 2, r2nfvm, ldff_op, ld_us_check)
-GEN_VEXT_TRANS(vleff_v, 3, r2nfvm, ldff_op, ld_us_check)
-GEN_VEXT_TRANS(vlbuff_v, 4, r2nfvm, ldff_op, ld_us_check)
-GEN_VEXT_TRANS(vlhuff_v, 5, r2nfvm, ldff_op, ld_us_check)
-GEN_VEXT_TRANS(vlwuff_v, 6, r2nfvm, ldff_op, ld_us_check)
+GEN_VEXT_TRANS(vle8ff_v,  8,  0, r2nfvm, ldff_op, ld_us_check)
+GEN_VEXT_TRANS(vle16ff_v, 16, 1, r2nfvm, ldff_op, ld_us_check)
+GEN_VEXT_TRANS(vle32ff_v, 32, 2, r2nfvm, ldff_op, ld_us_check)
+GEN_VEXT_TRANS(vle64ff_v, 64, 3, r2nfvm, ldff_op, ld_us_check)
 
 /*
  *** vector atomic operation
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 3ec56bb6fc..86d01a96a3 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -564,7 +564,7 @@ vext_ldff(void *vd, void *v0, target_ulong base,
           CPURISCVState *env, uint32_t desc,
           vext_ldst_elem_fn *ldst_elem,
           clear_fn *clear_elem,
-          uint32_t esz, uint32_t msz, uintptr_t ra)
+          uint32_t esz, uintptr_t ra)
 {
     void *host;
     uint32_t i, k, vl = 0;
@@ -579,24 +579,24 @@ vext_ldff(void *vd, void *v0, target_ulong base,
         if (!vm && !vext_elem_mask(v0, i)) {
             continue;
         }
-        addr = base + nf * i * msz;
+        addr = base + nf * i * esz;
         if (i == 0) {
-            probe_pages(env, addr, nf * msz, ra, MMU_DATA_LOAD);
+            probe_pages(env, addr, nf * esz, ra, MMU_DATA_LOAD);
         } else {
             /* if it triggers an exception, no need to check watchpoint */
-            remain = nf * msz;
+            remain = nf * esz;
             while (remain > 0) {
                 offset = -(addr | TARGET_PAGE_MASK);
                 host = tlb_vaddr_to_host(env, addr, MMU_DATA_LOAD,
                                          cpu_mmu_index(env, false));
                 if (host) {
 #ifdef CONFIG_USER_ONLY
-                    if (page_check_range(addr, nf * msz, PAGE_READ) < 0) {
+                    if (page_check_range(addr, nf * esz, PAGE_READ) < 0) {
                         vl = i;
                         goto ProbeSuccess;
                     }
 #else
-                    probe_pages(env, addr, nf * msz, ra, MMU_DATA_LOAD);
+                    probe_pages(env, addr, nf * esz, ra, MMU_DATA_LOAD);
 #endif
                 } else {
                     vl = i;
@@ -621,7 +621,7 @@ ProbeSuccess:
             continue;
         }
         while (k < nf) {
-            target_ulong addr = base + (i * nf + k) * msz;
+            target_ulong addr = base + (i * nf + k) * esz;
             ldst_elem(env, addr, i + k * vlmax, vd, ra);
             k++;
         }
@@ -636,36 +636,18 @@ ProbeSuccess:
     }
 }
 
-#define GEN_VEXT_LDFF(NAME, MTYPE, ETYPE, LOAD_FN, CLEAR_FN)     \
-void HELPER(NAME)(void *vd, void *v0, target_ulong base,         \
-                  CPURISCVState *env, uint32_t desc)             \
-{                                                                \
-    vext_ldff(vd, v0, base, env, desc, LOAD_FN, CLEAR_FN,        \
-              sizeof(ETYPE), sizeof(MTYPE), GETPC());            \
-}
-
-GEN_VEXT_LDFF(vlbff_v_b,  int8_t,   int8_t,   ldb_b,  clearb)
-GEN_VEXT_LDFF(vlbff_v_h,  int8_t,   int16_t,  ldb_h,  clearh)
-GEN_VEXT_LDFF(vlbff_v_w,  int8_t,   int32_t,  ldb_w,  clearl)
-GEN_VEXT_LDFF(vlbff_v_d,  int8_t,   int64_t,  ldb_d,  clearq)
-GEN_VEXT_LDFF(vlhff_v_h,  int16_t,  int16_t,  ldh_h,  clearh)
-GEN_VEXT_LDFF(vlhff_v_w,  int16_t,  int32_t,  ldh_w,  clearl)
-GEN_VEXT_LDFF(vlhff_v_d,  int16_t,  int64_t,  ldh_d,  clearq)
-GEN_VEXT_LDFF(vlwff_v_w,  int32_t,  int32_t,  ldw_w,  clearl)
-GEN_VEXT_LDFF(vlwff_v_d,  int32_t,  int64_t,  ldw_d,  clearq)
-GEN_VEXT_LDFF(vleff_v_b,  int8_t,   int8_t,   lde_b,  clearb)
-GEN_VEXT_LDFF(vleff_v_h,  int16_t,  int16_t,  lde_h,  clearh)
-GEN_VEXT_LDFF(vleff_v_w,  int32_t,  int32_t,  lde_w,  clearl)
-GEN_VEXT_LDFF(vleff_v_d,  int64_t,  int64_t,  lde_d,  clearq)
-GEN_VEXT_LDFF(vlbuff_v_b, uint8_t,  uint8_t,  ldbu_b, clearb)
-GEN_VEXT_LDFF(vlbuff_v_h, uint8_t,  uint16_t, ldbu_h, clearh)
-GEN_VEXT_LDFF(vlbuff_v_w, uint8_t,  uint32_t, ldbu_w, clearl)
-GEN_VEXT_LDFF(vlbuff_v_d, uint8_t,  uint64_t, ldbu_d, clearq)
-GEN_VEXT_LDFF(vlhuff_v_h, uint16_t, uint16_t, ldhu_h, clearh)
-GEN_VEXT_LDFF(vlhuff_v_w, uint16_t, uint32_t, ldhu_w, clearl)
-GEN_VEXT_LDFF(vlhuff_v_d, uint16_t, uint64_t, ldhu_d, clearq)
-GEN_VEXT_LDFF(vlwuff_v_w, uint32_t, uint32_t, ldwu_w, clearl)
-GEN_VEXT_LDFF(vlwuff_v_d, uint32_t, uint64_t, ldwu_d, clearq)
+#define GEN_VEXT_LDFF(NAME, ETYPE, LOAD_FN, CLEAR_FN)     \
+void HELPER(NAME)(void *vd, void *v0, target_ulong base,  \
+                  CPURISCVState *env, uint32_t desc)      \
+{                                                         \
+    vext_ldff(vd, v0, base, env, desc, LOAD_FN, CLEAR_FN, \
+              sizeof(ETYPE), GETPC());                    \
+}
+
+GEN_VEXT_LDFF(vle8ff_v,  int8_t,  lde_b, clearb)
+GEN_VEXT_LDFF(vle16ff_v, int16_t, lde_h, clearh)
+GEN_VEXT_LDFF(vle32ff_v, int32_t, lde_w, clearl)
+GEN_VEXT_LDFF(vle64ff_v, int64_t, lde_d, clearq)
 
 /*
  *** Vector AMO Operations (Zvamo)
-- 
2.17.1


