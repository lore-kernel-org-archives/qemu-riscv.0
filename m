Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jtscn-0006YA-F9
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jul 2020 08:59:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqfD-000605-CK
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:53:55 -0400
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:32865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqfB-0006wp-Ms
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:53:55 -0400
Received: by mail-pj1-x1042.google.com with SMTP id gc15so4424766pjb.0
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2020 03:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=EmjSuzx85cSvrK8QLftoQBD3joP+WMRu0V7hzKLsOtM=;
 b=AWVsaqT8uuqMekSaBfOqGUG7RhBp5yd09+GzNaCfCJGW9Bha3GhkmpFNZNKqflV+Ck
 tB7EVX90SnkRRwAjcKezq4xYgXpo+jycv0cNF8JNkZ5nnULDdmER+DunmjnjH4lzlS5U
 YDtqcz1uz83kReXd3LSx4WeBvhVr9xpB4LqJJalZjM8FFGVE4+SrVAaGYC4rKpFtC09n
 QWZFVSmeURpD0BJExUjr4AKSeHjSKdny/nQQ3faQUoyi/48hsJDXHNG8O7Gviu5lwNQQ
 7enc5FT94zu+gOMvxgpYqL8G1TgQ8ze1uxTn29qEaKSVUtom+Y/CayQJKSWmrrdZkdkv
 NV6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=EmjSuzx85cSvrK8QLftoQBD3joP+WMRu0V7hzKLsOtM=;
 b=Dx0CrEE65YQ2QPCyEKxZg4q2U/ugXBPmGokI+TOOiv/0UO51L5dYLwDpe/aLgSDpqr
 OCI87fB6O2Cuost42O+93lYDVA9z/KSPSIkQH92yqlrzoW6oGv2r6k4ACfcQA5zm68E7
 MrAz+e+11HVjyLLb07ZTVezFlsWI1ayk0/gZdkAiJDBUFSJaDWms7aeQRIZe/bkg39qQ
 zmGvInx9kWmlK3mbnxDyb7eUBOizU5vv5L9RFv/L1ZHb9Kon+IugCFcBCgy9aWMhciKY
 5xBSbgCqJE7vLqgP/Lqwu3NqAxBlhokRhUZ8a/TQCJVI91XRC397Soo5jBCobUzh6WrI
 yMiQ==
X-Gm-Message-State: AOAM533MjNeG4Z6MqNx+gambhOMrAbk9EyPXfE2EikGYz+uy55jq5WE+
 Y5TtTHRO4mRbPfqh6q0RWpv1HQ==
X-Google-Smtp-Source: ABdhPJzin3myzTkXflH1OYV3qhFZhCkCf5N5qYokn6krMzB8NOBVZoblGkgperoRXkVw860Tvpab8g==
X-Received: by 2002:a17:90a:ba05:: with SMTP id
 s5mr4676947pjr.132.1594378432542; 
 Fri, 10 Jul 2020 03:53:52 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id r191sm5519406pfr.181.2020.07.10.03.53.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 03:53:52 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC 49/65] target/riscv: rvv-0.9: floating-point move instructions
Date: Fri, 10 Jul 2020 18:49:03 +0800
Message-Id: <20200710104920.13550-50-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200710104920.13550-1-frank.chang@sifive.com>
References: <20200710104920.13550-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1042;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1042.google.com
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
X-Mailman-Approved-At: Fri, 10 Jul 2020 08:59:04 -0400
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
X-List-Received-Date: Fri, 10 Jul 2020 10:53:55 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.inc.c | 57 ++++++++++++-------------
 1 file changed, 28 insertions(+), 29 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 986f62dabc..264cd6509f 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -2600,37 +2600,36 @@ GEN_OPFVF_TRANS(vfmerge_vfm,  opfvf_check)
 
 static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_f *a)
 {
-    if (vext_check_isa_ill(s) &&
-        vext_check_reg(s, a->rd, false) &&
-        (s->sew != 0)) {
+    REQUIRE_RVV;
+    VEXT_CHECK_ISA_ILL(s);
+    require_align(a->rd, s->flmul);
+    require(s->sew != 0);
 
-        if (s->vl_eq_vlmax) {
-            tcg_gen_gvec_dup_i64(s->sew, vreg_ofs(s, a->rd),
-                                 MAXSZ(s), MAXSZ(s), cpu_fpr[a->rs1]);
-        } else {
-            TCGv_ptr dest;
-            TCGv_i32 desc;
-            uint32_t data = FIELD_DP32(0, VDATA, LMUL, s->lmul);
-            static gen_helper_vmv_vx * const fns[3] = {
-                gen_helper_vmv_v_x_h,
-                gen_helper_vmv_v_x_w,
-                gen_helper_vmv_v_x_d,
-            };
-            TCGLabel *over = gen_new_label();
-            tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
-
-            dest = tcg_temp_new_ptr();
-            desc = tcg_const_i32(simd_desc(0, s->vlen / 8, data));
-            tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, a->rd));
-            fns[s->sew - 1](dest, cpu_fpr[a->rs1], cpu_env, desc);
-
-            tcg_temp_free_ptr(dest);
-            tcg_temp_free_i32(desc);
-            gen_set_label(over);
-        }
-        return true;
+    if (s->vl_eq_vlmax) {
+        tcg_gen_gvec_dup_i64(s->sew, vreg_ofs(s, a->rd),
+                             MAXSZ(s), MAXSZ(s), cpu_fpr[a->rs1]);
+    } else {
+        TCGv_ptr dest;
+        TCGv_i32 desc;
+        uint32_t data = FIELD_DP32(0, VDATA, LMUL, s->lmul);
+        static gen_helper_vmv_vx * const fns[3] = {
+            gen_helper_vmv_v_x_h,
+            gen_helper_vmv_v_x_w,
+            gen_helper_vmv_v_x_d,
+        };
+        TCGLabel *over = gen_new_label();
+        tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+
+        dest = tcg_temp_new_ptr();
+        desc = tcg_const_i32(simd_desc(0, s->vlen / 8, data));
+        tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, a->rd));
+        fns[s->sew - 1](dest, cpu_fpr[a->rs1], cpu_env, desc);
+
+        tcg_temp_free_ptr(dest);
+        tcg_temp_free_i32(desc);
+        gen_set_label(over);
     }
-    return false;
+    return true;
 }
 
 /* Single-Width Floating-Point/Integer Type-Convert Instructions */
-- 
2.17.1


