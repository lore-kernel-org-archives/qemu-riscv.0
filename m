Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvane-0005TV-T5
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 02:58:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvanZ-0005Bk-3o
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:58:33 -0500
Received: from [2607:f8b0:4864:20::529] (port=43947
 helo=mail-pg1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvanV-0006oH-Vc
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:58:32 -0500
Received: by mail-pg1-x529.google.com with SMTP id q16so7362452pgq.10
 for <qemu-riscv@nongnu.org>; Thu, 09 Dec 2021 23:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1clXaQmZVTriovWzf4OAENiF94j+GpT3GlJC5ZJ6wxI=;
 b=A/5Q+R0scSP//wFE+bA9lI6mkBuVQo5kU0OlP19d+n+A7iJ71Dh9QOxCCG8sJMvzRX
 Vv97YIv42ZnjDToy7w9yZl3E+/g3jalkl+sHyng/Hs5pvvthIpArq8E+4Nv+UbrRSR7A
 9ToIE459MW3QcLyY5zoaJKjOq1QUxlQiIh1Br3voRvDNFdwuMk4E4Aqq00WEhXDA3KDS
 5A9s0942Vdyd8cgSBreI9/IVNC0T497tyWgIEKhlL41AmyinJVEEOUHB/IOShyHIaXSF
 riBFeAYwDRpZDBvqjGh5wPcLxU6MgUyojuqX7lxqLKLRwfi4ex/F+cAVh10xc4QHnpim
 Ibcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1clXaQmZVTriovWzf4OAENiF94j+GpT3GlJC5ZJ6wxI=;
 b=ZzGkc5Kzw48gZtkZAvlxCG58S01FsCH8NaRNiFHkNyWpI+p4Xstyni4x32n2tbWvsy
 iP9Fxch9OIOaaNwkMzmrhXQpGgHlIvOHgH14g+mGGjyDA3td2Yn6NWGpiBrjibijl9sy
 A3QdLjDIH9eAun6lCqK6iDz5+lCmoRdH868FrMADzmRI0JxlrP/gToj4OFPg9BC+TOOW
 IukROG0Lu+6BQz1ZaavG7HvSJt7fuphYK39BW2NSKqlg7ANlGYj/LPl1s/o5p+srZXiO
 jCF8fkKArk9V8My9IOrC7c0dpHiK8pCHj5f4JPogL4VQujergYC7jXILt/5L3dqPEDCV
 TbRA==
X-Gm-Message-State: AOAM532ZKFvLSMn9qwgmWYpObAeDabZWD7/tnOA7aGFI2OUDOZddXLNg
 yKMOFOqOdBrXhx6PXP/NY8dk1w==
X-Google-Smtp-Source: ABdhPJwClFQtjIljQFV7D3iYT/9AjPmcFHcOxrjUSU/oD0vpX9BWX89s2Q8pn+FWPxXO5sCexW/Rjg==
X-Received: by 2002:a05:6a00:1ad3:b0:4a0:36d:d067 with SMTP id
 f19-20020a056a001ad300b004a0036dd067mr16449984pfv.19.1639123108684; 
 Thu, 09 Dec 2021 23:58:28 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id f4sm2087955pfg.34.2021.12.09.23.58.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 23:58:28 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v11 23/77] target/riscv: rvv-1.0: fault-only-first unit stride
 load
Date: Fri, 10 Dec 2021 15:56:09 +0800
Message-Id: <20211210075704.23951-24-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210075704.23951-1-frank.chang@sifive.com>
References: <20211210075704.23951-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::529
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x529.google.com
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
X-List-Received-Date: Fri, 10 Dec 2021 07:58:33 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h                   | 26 ++-------
 target/riscv/insn32.decode              | 14 ++---
 target/riscv/insn_trans/trans_rvv.c.inc | 33 +++--------
 target/riscv/vector_helper.c            | 74 +++++++------------------
 4 files changed, 38 insertions(+), 109 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 1beca6dc0d..57560b8c04 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -168,28 +168,10 @@ DEF_HELPER_6(vsxei64_8_v, void, ptr, ptr, tl, ptr, env, i32)
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
 
 DEF_HELPER_6(vadd_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vadd_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index f34194d31c..180d97ecba 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -314,14 +314,6 @@ vsse16_v    ... 010 . ..... ..... 101 ..... 0100111 @r_nfvm
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
 # Vector ordered-indexed and unordered-indexed load insns.
 vlxei8_v      ... 0-1 . ..... ..... 000 ..... 0000111 @r_nfvm
 vlxei16_v     ... 0-1 . ..... ..... 101 ..... 0000111 @r_nfvm
@@ -334,6 +326,12 @@ vsxei16_v     ... 0-1 . ..... ..... 101 ..... 0100111 @r_nfvm
 vsxei32_v     ... 0-1 . ..... ..... 110 ..... 0100111 @r_nfvm
 vsxei64_v     ... 0-1 . ..... ..... 111 ..... 0100111 @r_nfvm
 
+# Vector unit-stride fault-only-first load insns.
+vle8ff_v      ... 000 . 10000 ..... 000 ..... 0000111 @r2_nfvm
+vle16ff_v     ... 000 . 10000 ..... 101 ..... 0000111 @r2_nfvm
+vle32ff_v     ... 000 . 10000 ..... 110 ..... 0000111 @r2_nfvm
+vle64ff_v     ... 000 . 10000 ..... 111 ..... 0000111 @r2_nfvm
+
 # *** new major opcode OP-V ***
 vadd_vv         000000 . ..... ..... 000 ..... 1010111 @r_vm
 vadd_vx         000000 . ..... ..... 100 ..... 1010111 @r_vm
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 6946d03340..5b5285b33f 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -935,28 +935,16 @@ static bool ldff_trans(uint32_t vd, uint32_t rs1, uint32_t data,
     return true;
 }
 
-static bool ldff_op(DisasContext *s, arg_r2nfvm *a, uint8_t seq)
+static bool ldff_op(DisasContext *s, arg_r2nfvm *a, uint8_t eew)
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
 
-    fn =  fns[seq][s->sew];
+    fn = fns[eew];
     if (fn == NULL) {
         return false;
     }
@@ -967,13 +955,10 @@ static bool ldff_op(DisasContext *s, arg_r2nfvm *a, uint8_t seq)
     return ldff_trans(a->rd, a->rs1, data, fn, s);
 }
 
-GEN_VEXT_TRANS(vlbff_v, 0, r2nfvm, ldff_op, ld_us_check)
-GEN_VEXT_TRANS(vlhff_v, 1, r2nfvm, ldff_op, ld_us_check)
-GEN_VEXT_TRANS(vlwff_v, 2, r2nfvm, ldff_op, ld_us_check)
-GEN_VEXT_TRANS(vleff_v, 3, r2nfvm, ldff_op, ld_us_check)
-GEN_VEXT_TRANS(vlbuff_v, 4, r2nfvm, ldff_op, ld_us_check)
-GEN_VEXT_TRANS(vlhuff_v, 5, r2nfvm, ldff_op, ld_us_check)
-GEN_VEXT_TRANS(vlwuff_v, 6, r2nfvm, ldff_op, ld_us_check)
+GEN_VEXT_TRANS(vle8ff_v,  MO_8,  r2nfvm, ldff_op, ld_us_check)
+GEN_VEXT_TRANS(vle16ff_v, MO_16, r2nfvm, ldff_op, ld_us_check)
+GEN_VEXT_TRANS(vle32ff_v, MO_32, r2nfvm, ldff_op, ld_us_check)
+GEN_VEXT_TRANS(vle64ff_v, MO_64, r2nfvm, ldff_op, ld_us_check)
 
 /*
  *** Vector Integer Arithmetic Instructions
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 3da4f3b1e6..0e7bf5d27f 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -186,28 +186,10 @@ static void NAME(CPURISCVState *env, abi_ptr addr,         \
     *cur = cpu_##LDSUF##_data_ra(env, addr, retaddr);      \
 }                                                          \
 
-GEN_VEXT_LD_ELEM(ldb_b, int8_t,  H1, ldsb)
-GEN_VEXT_LD_ELEM(ldb_h, int16_t, H2, ldsb)
-GEN_VEXT_LD_ELEM(ldb_w, int32_t, H4, ldsb)
-GEN_VEXT_LD_ELEM(ldb_d, int64_t, H8, ldsb)
-GEN_VEXT_LD_ELEM(ldh_h, int16_t, H2, ldsw)
-GEN_VEXT_LD_ELEM(ldh_w, int32_t, H4, ldsw)
-GEN_VEXT_LD_ELEM(ldh_d, int64_t, H8, ldsw)
-GEN_VEXT_LD_ELEM(ldw_w, int32_t, H4, ldl)
-GEN_VEXT_LD_ELEM(ldw_d, int64_t, H8, ldl)
 GEN_VEXT_LD_ELEM(lde_b, int8_t,  H1, ldsb)
 GEN_VEXT_LD_ELEM(lde_h, int16_t, H2, ldsw)
 GEN_VEXT_LD_ELEM(lde_w, int32_t, H4, ldl)
 GEN_VEXT_LD_ELEM(lde_d, int64_t, H8, ldq)
-GEN_VEXT_LD_ELEM(ldbu_b, uint8_t,  H1, ldub)
-GEN_VEXT_LD_ELEM(ldbu_h, uint16_t, H2, ldub)
-GEN_VEXT_LD_ELEM(ldbu_w, uint32_t, H4, ldub)
-GEN_VEXT_LD_ELEM(ldbu_d, uint64_t, H8, ldub)
-GEN_VEXT_LD_ELEM(ldhu_h, uint16_t, H2, lduw)
-GEN_VEXT_LD_ELEM(ldhu_w, uint32_t, H4, lduw)
-GEN_VEXT_LD_ELEM(ldhu_d, uint64_t, H8, lduw)
-GEN_VEXT_LD_ELEM(ldwu_w, uint32_t, H4, ldl)
-GEN_VEXT_LD_ELEM(ldwu_d, uint64_t, H8, ldl)
 
 #define GEN_VEXT_ST_ELEM(NAME, ETYPE, H, STSUF)            \
 static void NAME(CPURISCVState *env, abi_ptr addr,         \
@@ -471,7 +453,7 @@ static inline void
 vext_ldff(void *vd, void *v0, target_ulong base,
           CPURISCVState *env, uint32_t desc,
           vext_ldst_elem_fn *ldst_elem,
-          uint32_t esz, uint32_t msz, uintptr_t ra)
+          uint32_t esz, uintptr_t ra)
 {
     void *host;
     uint32_t i, k, vl = 0;
@@ -485,24 +467,24 @@ vext_ldff(void *vd, void *v0, target_ulong base,
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
@@ -527,43 +509,25 @@ ProbeSuccess:
             continue;
         }
         while (k < nf) {
-            target_ulong addr = base + (i * nf + k) * msz;
+            target_ulong addr = base + (i * nf + k) * esz;
             ldst_elem(env, addr, i + k * vlmax, vd, ra);
             k++;
         }
     }
 }
 
-#define GEN_VEXT_LDFF(NAME, MTYPE, ETYPE, LOAD_FN)               \
-void HELPER(NAME)(void *vd, void *v0, target_ulong base,         \
-                  CPURISCVState *env, uint32_t desc)             \
-{                                                                \
-    vext_ldff(vd, v0, base, env, desc, LOAD_FN,                  \
-              sizeof(ETYPE), sizeof(MTYPE), GETPC());            \
-}
-
-GEN_VEXT_LDFF(vlbff_v_b,  int8_t,   int8_t,   ldb_b)
-GEN_VEXT_LDFF(vlbff_v_h,  int8_t,   int16_t,  ldb_h)
-GEN_VEXT_LDFF(vlbff_v_w,  int8_t,   int32_t,  ldb_w)
-GEN_VEXT_LDFF(vlbff_v_d,  int8_t,   int64_t,  ldb_d)
-GEN_VEXT_LDFF(vlhff_v_h,  int16_t,  int16_t,  ldh_h)
-GEN_VEXT_LDFF(vlhff_v_w,  int16_t,  int32_t,  ldh_w)
-GEN_VEXT_LDFF(vlhff_v_d,  int16_t,  int64_t,  ldh_d)
-GEN_VEXT_LDFF(vlwff_v_w,  int32_t,  int32_t,  ldw_w)
-GEN_VEXT_LDFF(vlwff_v_d,  int32_t,  int64_t,  ldw_d)
-GEN_VEXT_LDFF(vleff_v_b,  int8_t,   int8_t,   lde_b)
-GEN_VEXT_LDFF(vleff_v_h,  int16_t,  int16_t,  lde_h)
-GEN_VEXT_LDFF(vleff_v_w,  int32_t,  int32_t,  lde_w)
-GEN_VEXT_LDFF(vleff_v_d,  int64_t,  int64_t,  lde_d)
-GEN_VEXT_LDFF(vlbuff_v_b, uint8_t,  uint8_t,  ldbu_b)
-GEN_VEXT_LDFF(vlbuff_v_h, uint8_t,  uint16_t, ldbu_h)
-GEN_VEXT_LDFF(vlbuff_v_w, uint8_t,  uint32_t, ldbu_w)
-GEN_VEXT_LDFF(vlbuff_v_d, uint8_t,  uint64_t, ldbu_d)
-GEN_VEXT_LDFF(vlhuff_v_h, uint16_t, uint16_t, ldhu_h)
-GEN_VEXT_LDFF(vlhuff_v_w, uint16_t, uint32_t, ldhu_w)
-GEN_VEXT_LDFF(vlhuff_v_d, uint16_t, uint64_t, ldhu_d)
-GEN_VEXT_LDFF(vlwuff_v_w, uint32_t, uint32_t, ldwu_w)
-GEN_VEXT_LDFF(vlwuff_v_d, uint32_t, uint64_t, ldwu_d)
+#define GEN_VEXT_LDFF(NAME, ETYPE, LOAD_FN)               \
+void HELPER(NAME)(void *vd, void *v0, target_ulong base,  \
+                  CPURISCVState *env, uint32_t desc)      \
+{                                                         \
+    vext_ldff(vd, v0, base, env, desc, LOAD_FN,           \
+              sizeof(ETYPE), GETPC());                    \
+}
+
+GEN_VEXT_LDFF(vle8ff_v,  int8_t,  lde_b)
+GEN_VEXT_LDFF(vle16ff_v, int16_t, lde_h)
+GEN_VEXT_LDFF(vle32ff_v, int32_t, lde_w)
+GEN_VEXT_LDFF(vle64ff_v, int64_t, lde_d)
 
 #define DO_SWAP(N, M) (M)
 #define DO_AND(N, M)  (N & M)
-- 
2.31.1


