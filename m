Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kNKx5-0003qK-51
	for mharc-qemu-riscv@gnu.org; Tue, 29 Sep 2020 15:06:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kNKx3-0003nQ-QF
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2020 15:06:13 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:44285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kNKx1-000212-6K
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2020 15:06:13 -0400
Received: by mail-pf1-x442.google.com with SMTP id o20so5512071pfp.11
 for <qemu-riscv@nongnu.org>; Tue, 29 Sep 2020 12:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=mYsNRzBja9wi6R3wGGFfDuBgDU0yq0FoEjL3w6eA9o8=;
 b=Rmx/FdeUdwAZCDB7QtGZ0fRhviWRrzGFQ2TFumPHpXyOVATjNOOkgXDI0GffSrcPdd
 XAv5kL57dkmK9gAKC0eS2rcT9HZzFud0Z26EFOtA2WRv60A2rlvT51RunOWakA3xpFeq
 yAYucMgFQpJv+hN8LqkKSI4ZtPRARfsy3NLxFuQlF5U7VkeKVHQdTqzGJi071Vb6WZdq
 ssY2BZL8Jio2LH28TlCxFGhcKj7eWSQDcBe5+vryxUXoUju3weBZIY0q1xjCfAwLuzd2
 CWn6BRVyS45/trY1CNAw79UOj4drePa3slELKVqZLB83nFjZMIOgjlsvU4u4XPjH9b4w
 mXpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=mYsNRzBja9wi6R3wGGFfDuBgDU0yq0FoEjL3w6eA9o8=;
 b=c84K3O8IScByRPruFfm358jt2UkcvVXLuQm+DdUEwoGOzvhmRYCWO1fOD1F9CBovGL
 752+XNN9D8eT9tyinDBjrvTJhQBDBpu0ch9uF7jRNDKvzUQSvj2tN7w9HJkFu2p+7zV6
 GCXTSJBc0g/PECQfyOjbUlZkjxlDu7JLJseo2lHY1znzMSYL5hK7NcesTIdW5RqR5oQY
 Zthg5Vl6L0ZFosoWTcxLV6p6wd3CYKs4u+HSbJ5M9U7ieexUA6nfBTKXxAfJqhXbWBHS
 6kvL7Ns0nygEYXCgTA+LSe8yCSFyYgEc/mBJBTrg7RFijqaMfi56V9dpunNH5PjxjDeA
 YefA==
X-Gm-Message-State: AOAM530AFoA08+DQkG8CssbJYtoPn1CsQtIHrGWz3xIefd9XDrE+C117
 bZCFAOYnIMTLx6OIMntwi3D2TA==
X-Google-Smtp-Source: ABdhPJxNiSmc/nnudljLvSK8q8nQkMSc1XssZQVyGG4gW+/qNWS9Mh6KtPTv6OuJCBAtzXJYFs2vnQ==
X-Received: by 2002:aa7:9dd2:0:b029:13e:d13d:a109 with SMTP id
 g18-20020aa79dd20000b029013ed13da109mr5230805pfq.37.1601406369943; 
 Tue, 29 Sep 2020 12:06:09 -0700 (PDT)
Received: from localhost.localdomain (122-116-72-36.HINET-IP.hinet.net.
 [122.116.72.36])
 by smtp.gmail.com with ESMTPSA id v8sm6003950pgg.58.2020.09.29.12.06.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 12:06:09 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [RFC v5 16/68] target/riscv: rvv:1.0: add translation-time nan-box
 helper function
Date: Wed, 30 Sep 2020 03:03:51 +0800
Message-Id: <20200929190448.31116-17-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200929190448.31116-1-frank.chang@sifive.com>
References: <20200929190448.31116-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-List-Received-Date: Tue, 29 Sep 2020 19:06:14 -0000

From: Frank Chang <frank.chang@sifive.com>

* Add fp16 nan-box check generator function, if a 16-bit input is not
  properly nanboxed, then the input is replaced with the default qnan.
* Add do_nanbox() helper function to utilize gen_check_nanbox_X() to
  generate the NaN-boxed floating-point values based on SEW setting.
* Apply nanbox helper in opfvf_trans().

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 35 ++++++++++++++++++++++++-
 target/riscv/translate.c                | 10 +++++++
 2 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index ee84fa9585..5ade7adc83 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2101,6 +2101,33 @@ GEN_OPIVI_NARROW_TRANS(vnclip_vi, IMM_ZX, vnclip_vx)
 /*
  *** Vector Float Point Arithmetic Instructions
  */
+
+/*
+ * As RVF-only cpus always have values NaN-boxed to 64-bits,
+ * RVF and RVD can be treated equally.
+ * We don't have to deal with the cases of: SEW > FLEN.
+ *
+ * If SEW < FLEN, check whether input fp register is a valid
+ * NaN-boxed value, in which case the least-significant SEW bits
+ * of the f regsiter are used, else the canonical NaN value is used.
+ */
+static void do_nanbox(DisasContext *s, TCGv_i64 out, TCGv_i64 in)
+{
+    switch (s->sew) {
+    case 1:
+        gen_check_nanbox_h(out, in);
+        break;
+    case 2:
+        gen_check_nanbox_s(out, in);
+        break;
+    case 3:
+        tcg_gen_mov_i64(out, in);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
 /* Vector Single-Width Floating-Point Add/Subtract Instructions */
 
 /*
@@ -2153,6 +2180,7 @@ static bool opfvf_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
 {
     TCGv_ptr dest, src2, mask;
     TCGv_i32 desc;
+    TCGv_i64 t1;
 
     TCGLabel *over = gen_new_label();
     tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
@@ -2166,12 +2194,17 @@ static bool opfvf_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
     tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, vs2));
     tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
 
-    fn(dest, mask, cpu_fpr[rs1], src2, cpu_env, desc);
+    /* NaN-box f[rs1] */
+    t1 = tcg_temp_new_i64();
+    do_nanbox(s, t1, cpu_fpr[rs1]);
+
+    fn(dest, mask, t1, src2, cpu_env, desc);
 
     tcg_temp_free_ptr(dest);
     tcg_temp_free_ptr(mask);
     tcg_temp_free_ptr(src2);
     tcg_temp_free_i32(desc);
+    tcg_temp_free_i64(t1);
     mark_vs_dirty(s);
     gen_set_label(over);
     return true;
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index b54952c688..2d12b8adc4 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -121,6 +121,16 @@ static void gen_nanbox_s(TCGv_i64 out, TCGv_i64 in)
  *
  * Here, the result is always nan-boxed, even the canonical nan.
  */
+static void gen_check_nanbox_h(TCGv_i64 out, TCGv_i64 in)
+{
+    TCGv_i64 t_max = tcg_const_i64(0xffffffffffff0000ull);
+    TCGv_i64 t_nan = tcg_const_i64(0xffffffffffff7e00ull);
+
+    tcg_gen_movcond_i64(TCG_COND_GEU, out, in, t_max, in, t_nan);
+    tcg_temp_free_i64(t_max);
+    tcg_temp_free_i64(t_nan);
+}
+
 static void gen_check_nanbox_s(TCGv_i64 out, TCGv_i64 in)
 {
     TCGv_i64 t_max = tcg_const_i64(0xffffffff00000000ull);
-- 
2.17.1


