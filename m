Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k7ar2-0007A8-4M
	for mharc-qemu-riscv@gnu.org; Mon, 17 Aug 2020 04:50:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k7ar0-00075x-Pn
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2020 04:50:54 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:55793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k7aqy-0004xI-OI
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2020 04:50:54 -0400
Received: by mail-pj1-x1035.google.com with SMTP id 2so7474447pjx.5
 for <qemu-riscv@nongnu.org>; Mon, 17 Aug 2020 01:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=VLZnBxT2g7CE2cLsr6cNBvAHsI2zUW95KdIURRcdPFY=;
 b=hZNDah7CL4BBQkRs2ZpNa/zPpfHx4EDyJpZD7LPU5OkLcQZO2m1Oyfr/4OwTI6mOoe
 DWO0MKrNC/m+7j9ejGbVhparuVt8TlAp4HCFCX8kw1ceQ8gIfZ5YJCJdpbneEluzokzG
 NqSzPhuVw4ylg9ZW3poPgFpxmwM2eIgKu/GntUwZS0IGABP0BxTygEQo51XOa1apPNzH
 FBLpE4s35E1EROyfBv5C1G5a7u/46s/K9E7N+SdsncqJwl1bBAiuGaW7aE9YXzSwBj4W
 wnYPRFSm2wA7imTJn76Vtu8yCJeQeHIJSa6V0JRDJMjmUT9DHyxNf8Ae0ZzCcCR5WkGd
 YtEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=VLZnBxT2g7CE2cLsr6cNBvAHsI2zUW95KdIURRcdPFY=;
 b=o29AMxeeqGbWMq5BSiuj/YgMPR/keQxUdX/3U8iyyGfvd7OCRDY4VJw59cU/N4nqfc
 gYSiPvlaANRyha/sMsnZ23F2jZDzVMDzWIA2Yk1Okq9iZ6KVr/y80Lhkvg1vBuMNbu/D
 64pfqBp1l7jhwbt1AhVWnWYQ7KWvswJT7FKlMoH5fhG9hQZp8CaCCnfbl9HD2U5dsUTH
 nEvqf4Xis4CVAJ2RpIIyQ5UiUykox0SuqwwBB6I03USkDR2nzROaXEK0K4r98dHu/9YO
 Jso+uDmP7qb9OLQwHcFQZfYTDHXQstqJ9JRXZJGBHbOq3SNuXOMG0+39H8UQsOOrwze3
 4iOg==
X-Gm-Message-State: AOAM532+CSjEkJt02iwyONloHXL9KCutoLRqrCE8VkidsEOfj6ed+EnF
 3rRXMtAVfTkN9GGQpSah8METsw==
X-Google-Smtp-Source: ABdhPJz+JBIM7kggLQw1akhycrTjN0Lv8233Q1iNNYj8w+ExcIC1W0Q0AbA+WnmyzL7ZwQ8OBs0G+A==
X-Received: by 2002:a17:90a:aa8e:: with SMTP id
 l14mr12580035pjq.67.1597654251455; 
 Mon, 17 Aug 2020 01:50:51 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id d9sm16478588pgv.45.2020.08.17.01.50.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:50:51 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v4 16/70] target/riscv: rvv:1.0: add translation-time nan-box
 helper function
Date: Mon, 17 Aug 2020 16:49:01 +0800
Message-Id: <20200817084955.28793-17-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817084955.28793-1-frank.chang@sifive.com>
References: <20200817084955.28793-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1035.google.com
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
X-List-Received-Date: Mon, 17 Aug 2020 08:50:55 -0000

From: Frank Chang <frank.chang@sifive.com>

* Add fp16 nan-box check generator function, if a 16-bit input is not
  properly nanboxed, then the input is replaced with the default qnan.
* Add do_nanbox() helper function to utilize gen_check_nanbox_X() to
  generate the NaN-boxed floating-point values based on SEW setting.
* Apply nanbox helper in opfvf_trans

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.inc.c | 35 ++++++++++++++++++++++++-
 target/riscv/translate.c                | 10 +++++++
 2 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index daaa47ac9c3..4b8ae5470c3 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -2076,6 +2076,33 @@ GEN_OPIVI_NARROW_TRANS(vnclip_vi, IMM_ZX, vnclip_vx)
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
@@ -2128,6 +2155,7 @@ static bool opfvf_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
 {
     TCGv_ptr dest, src2, mask;
     TCGv_i32 desc;
+    TCGv_i64 t1;
 
     TCGLabel *over = gen_new_label();
     tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
@@ -2141,12 +2169,17 @@ static bool opfvf_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
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
index 10ef55bbeb7..0b3f5f1b4ba 100644
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


