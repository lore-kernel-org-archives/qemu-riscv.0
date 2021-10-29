Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mgNm8-0006cH-5u
	for mharc-qemu-riscv@gnu.org; Fri, 29 Oct 2021 05:02:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNm5-0006Ur-TS
 for qemu-riscv@nongnu.org; Fri, 29 Oct 2021 05:02:09 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:37504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNm2-00068E-Ju
 for qemu-riscv@nongnu.org; Fri, 29 Oct 2021 05:02:08 -0400
Received: by mail-pf1-x42a.google.com with SMTP id v193so8661377pfc.4
 for <qemu-riscv@nongnu.org>; Fri, 29 Oct 2021 02:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hm9hA1hpSmMYal7r+dZevezFaXPFRAzjG1YLEq9RSHI=;
 b=eFPvZO7G9UxbW7WcvvUolJV0rQ6jJf5+0endCsqoy2K/WRFQ19dPrqQozgInzabKuk
 a388w96LgRAJCWYfalMsUl8F70pGtK7oWCphsQryK6K/mu7c5kWO84aqSxRxVrKF3Tnp
 SMVEW6OER4Yjf01/W9z8cifnjLwPmYJco/jYeityHwSEIDKp5axOUZAh2B6l/p7S9sQQ
 vyOALy72AXkdfZqLmiqTt6ZxJK8K+FDy0nykjHuqK6ksoOx7HLSnh1eYWtn+MiVQ0+pG
 Y1SEezirDtPcUUdnpDT3Q2+kDO8f0bSDyjCcVvlaZoSxLImHxwwbU8YjDFBtRGnBTwRw
 JpLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hm9hA1hpSmMYal7r+dZevezFaXPFRAzjG1YLEq9RSHI=;
 b=vmYXKVSfs7ZC5MIId5EpY6ie6QCEj4aZWTwXDouhrDNGNRfVOxXbFa5aR65Ybec4QQ
 4ODMHLvGCI0WEWiQUEtMG2FNuGzmR32pB5c/yUGrUXOU7M4BbDaR90KCJVxng4fKL7ul
 xSHwBdUNbavFCuwmdaxHl6gHCph7FvSJLqGh4mEXKOrtIm062SJ/it+xumY6WBzr1SiR
 xpsA2FbJ8618eyDZW0lxNP8s87rr/qc90KlYdtv9itbTcLwfq6M/GohCIuaH/9aAzaTu
 REujwKh363X9dTL3KgMUQoOLqbuduaMMUvRBxasenEzFVCPnrRcJt/eyCSuNbfq/Vy4f
 MOOA==
X-Gm-Message-State: AOAM531D8q+bvHRhgM0rsOty283U7UxDxwaQUKKea7NIXqZ9mXxc6nev
 WfioYx3hB/NSvA4zv8hXSdoD3w==
X-Google-Smtp-Source: ABdhPJx6Z0sdAVeL71BkwEN158TSWsG0qYQ7B9FJPTz3ukXYDecK0cwG2V8cTYUYIjguBpjQ5ib69Q==
X-Received: by 2002:a63:1950:: with SMTP id 16mr7382229pgz.346.1635498124707; 
 Fri, 29 Oct 2021 02:02:04 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:46b:ce55:983b:6962:38ac:e1b9])
 by smtp.gmail.com with ESMTPSA id t13sm5081477pgn.94.2021.10.29.02.02.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 02:02:04 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v9 40/76] target/riscv: rvv-1.0: integer extension instructions
Date: Fri, 29 Oct 2021 16:58:45 +0800
Message-Id: <20211029085922.255197-41-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029085922.255197-1-frank.chang@sifive.com>
References: <20211029085922.255197-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42a.google.com
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
X-List-Received-Date: Fri, 29 Oct 2021 09:02:10 -0000

From: Frank Chang <frank.chang@sifive.com>

Add the following instructions:

* vzext.vf2
* vzext.vf4
* vzext.vf8
* vsext.vf2
* vsext.vf4
* vsext.vf8

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/helper.h                   | 14 +++++
 target/riscv/insn32.decode              |  8 +++
 target/riscv/insn_trans/trans_rvv.c.inc | 80 +++++++++++++++++++++++++
 target/riscv/vector_helper.c            | 31 ++++++++++
 4 files changed, 133 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index bd0768d048f..878d82caf61 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1072,3 +1072,17 @@ DEF_HELPER_6(vcompress_vm_b, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vcompress_vm_h, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vcompress_vm_w, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vcompress_vm_d, void, ptr, ptr, ptr, ptr, env, i32)
+
+DEF_HELPER_5(vzext_vf2_h, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vzext_vf2_w, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vzext_vf2_d, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vzext_vf4_w, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vzext_vf4_d, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vzext_vf8_d, void, ptr, ptr, ptr, env, i32)
+
+DEF_HELPER_5(vsext_vf2_h, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vsext_vf2_w, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vsext_vf2_d, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vsext_vf4_w, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vsext_vf4_d, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vsext_vf8_d, void, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 06a80763112..a6f9e5dcc66 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -655,6 +655,14 @@ vmv2r_v         100111 1 ..... 00001 011 ..... 1010111 @r2rd
 vmv4r_v         100111 1 ..... 00011 011 ..... 1010111 @r2rd
 vmv8r_v         100111 1 ..... 00111 011 ..... 1010111 @r2rd
 
+# Vector Integer Extension
+vzext_vf2       010010 . ..... 00110 010 ..... 1010111 @r2_vm
+vzext_vf4       010010 . ..... 00100 010 ..... 1010111 @r2_vm
+vzext_vf8       010010 . ..... 00010 010 ..... 1010111 @r2_vm
+vsext_vf2       010010 . ..... 00111 010 ..... 1010111 @r2_vm
+vsext_vf4       010010 . ..... 00101 010 ..... 1010111 @r2_vm
+vsext_vf8       010010 . ..... 00011 010 ..... 1010111 @r2_vm
+
 vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm
 vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
 
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 91e7c14ec44..5285e21cc09 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -3284,3 +3284,83 @@ GEN_VMV_WHOLE_TRANS(vmv1r_v, 1)
 GEN_VMV_WHOLE_TRANS(vmv2r_v, 2)
 GEN_VMV_WHOLE_TRANS(vmv4r_v, 4)
 GEN_VMV_WHOLE_TRANS(vmv8r_v, 8)
+
+static bool int_ext_check(DisasContext *s, arg_rmr *a, uint8_t div)
+{
+    uint8_t from = (s->sew + 3) - div;
+    bool ret = require_rvv(s) &&
+        (from >= 3 && from <= 8) &&
+        (a->rd != a->rs2) &&
+        require_align(a->rd, s->lmul) &&
+        require_align(a->rs2, s->lmul - div) &&
+        require_vm(a->vm, a->rd) &&
+        require_noover(a->rd, s->lmul, a->rs2, s->lmul - div);
+    return ret;
+}
+
+static bool int_ext_op(DisasContext *s, arg_rmr *a, uint8_t seq)
+{
+    uint32_t data = 0;
+    gen_helper_gvec_3_ptr *fn;
+    TCGLabel *over = gen_new_label();
+    tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+
+    static gen_helper_gvec_3_ptr * const fns[6][4] = {
+        {
+            NULL, gen_helper_vzext_vf2_h,
+            gen_helper_vzext_vf2_w, gen_helper_vzext_vf2_d
+        },
+        {
+            NULL, NULL,
+            gen_helper_vzext_vf4_w, gen_helper_vzext_vf4_d,
+        },
+        {
+            NULL, NULL,
+            NULL, gen_helper_vzext_vf8_d
+        },
+        {
+            NULL, gen_helper_vsext_vf2_h,
+            gen_helper_vsext_vf2_w, gen_helper_vsext_vf2_d
+        },
+        {
+            NULL, NULL,
+            gen_helper_vsext_vf4_w, gen_helper_vsext_vf4_d,
+        },
+        {
+            NULL, NULL,
+            NULL, gen_helper_vsext_vf8_d
+        }
+    };
+
+    fn = fns[seq][s->sew];
+    if (fn == NULL) {
+        return false;
+    }
+
+    data = FIELD_DP32(data, VDATA, VM, a->vm);
+
+    tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
+                       vreg_ofs(s, a->rs2), cpu_env,
+                       s->vlen / 8, s->vlen / 8, data, fn);
+
+    mark_vs_dirty(s);
+    gen_set_label(over);
+    return true;
+}
+
+/* Vector Integer Extension */
+#define GEN_INT_EXT_TRANS(NAME, DIV, SEQ)             \
+static bool trans_##NAME(DisasContext *s, arg_rmr *a) \
+{                                                     \
+    if (int_ext_check(s, a, DIV)) {                   \
+        return int_ext_op(s, a, SEQ);                 \
+    }                                                 \
+    return false;                                     \
+}
+
+GEN_INT_EXT_TRANS(vzext_vf2, 1, 0)
+GEN_INT_EXT_TRANS(vzext_vf4, 2, 1)
+GEN_INT_EXT_TRANS(vzext_vf8, 3, 2)
+GEN_INT_EXT_TRANS(vsext_vf2, 1, 3)
+GEN_INT_EXT_TRANS(vsext_vf4, 2, 4)
+GEN_INT_EXT_TRANS(vsext_vf8, 3, 5)
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 86d03d8e395..58ba2a7d99b 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4544,3 +4544,34 @@ GEN_VEXT_VCOMPRESS_VM(vcompress_vm_b, uint8_t,  H1)
 GEN_VEXT_VCOMPRESS_VM(vcompress_vm_h, uint16_t, H2)
 GEN_VEXT_VCOMPRESS_VM(vcompress_vm_w, uint32_t, H4)
 GEN_VEXT_VCOMPRESS_VM(vcompress_vm_d, uint64_t, H8)
+
+/* Vector Integer Extension */
+#define GEN_VEXT_INT_EXT(NAME, ETYPE, DTYPE, HD, HS1)            \
+void HELPER(NAME)(void *vd, void *v0, void *vs2,                 \
+                  CPURISCVState *env, uint32_t desc)             \
+{                                                                \
+    uint32_t vl = env->vl;                                       \
+    uint32_t vm = vext_vm(desc);                                 \
+    uint32_t i;                                                  \
+                                                                 \
+    for (i = 0; i < vl; i++) {                                   \
+        if (!vm && !vext_elem_mask(v0, i)) {                     \
+            continue;                                            \
+        }                                                        \
+        *((ETYPE *)vd + HD(i)) = *((DTYPE *)vs2 + HS1(i));       \
+    }                                                            \
+}
+
+GEN_VEXT_INT_EXT(vzext_vf2_h, uint16_t, uint8_t,  H2, H1)
+GEN_VEXT_INT_EXT(vzext_vf2_w, uint32_t, uint16_t, H4, H2)
+GEN_VEXT_INT_EXT(vzext_vf2_d, uint64_t, uint32_t, H8, H4)
+GEN_VEXT_INT_EXT(vzext_vf4_w, uint32_t, uint8_t,  H4, H1)
+GEN_VEXT_INT_EXT(vzext_vf4_d, uint64_t, uint16_t, H8, H2)
+GEN_VEXT_INT_EXT(vzext_vf8_d, uint64_t, uint8_t,  H8, H1)
+
+GEN_VEXT_INT_EXT(vsext_vf2_h, int16_t, int8_t,  H2, H1)
+GEN_VEXT_INT_EXT(vsext_vf2_w, int32_t, int16_t, H4, H2)
+GEN_VEXT_INT_EXT(vsext_vf2_d, int64_t, int32_t, H8, H4)
+GEN_VEXT_INT_EXT(vsext_vf4_w, int32_t, int8_t,  H4, H1)
+GEN_VEXT_INT_EXT(vsext_vf4_d, int64_t, int16_t, H8, H2)
+GEN_VEXT_INT_EXT(vsext_vf8_d, int64_t, int8_t,  H8, H1)
-- 
2.25.1


