Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lFTiE-0000ly-28
	for mharc-qemu-riscv@gnu.org; Thu, 25 Feb 2021 22:22:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTi5-0000iF-JJ
 for qemu-riscv@nongnu.org; Thu, 25 Feb 2021 22:22:33 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:42649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTi3-0001nD-AE
 for qemu-riscv@nongnu.org; Thu, 25 Feb 2021 22:22:33 -0500
Received: by mail-pg1-x535.google.com with SMTP id o38so5382978pgm.9
 for <qemu-riscv@nongnu.org>; Thu, 25 Feb 2021 19:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=FlPpAl/QVv1RaMjUle4PW0KgGbPoJfejo1FqGxGA4MA=;
 b=GAkkt5DUgKzu28wjDvXMDl717tp5leyVToP1zRHGMELhleiCRhEslZ50aTDNrn3kzI
 97w/XA4xqn36ePfcGecerhEKtr/xPROtEjMtHDneB1h83hSRW2+hvlZxsHRvKV5Mij7c
 IUWxXPPW1HYeWhhARcgSqOfd4m6eEYOkZxNWVPDL0UeCQUKaBry14m+mo+4lzGM6Mq9U
 bLmHVppZ0kQ9FOwDsBXPT0S7GYDPZXWUydfA+PTo1j3lYm66hgM+Y65xYkAfMQvcXFtQ
 dmJ/67kGJDLhONsvKTlVqYpb50ZFiQEDPkn74N6v45cN5mEnBI2ji9GKNHXW/zRySWj1
 JMjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=FlPpAl/QVv1RaMjUle4PW0KgGbPoJfejo1FqGxGA4MA=;
 b=Jq/89bC1bRXUnHBPFBfF9OTmA2VWpUoeF5CzoIrYyONnGfUKfRFUysBcynDFq+JvCS
 PxoQ7Nuu5W31SW16d9cDuV3Dc7SUiapxvu9xhyoolZusGGkBwm+II4Wn5xt+ALkqz6Ya
 GpanppBL9VbpAP53WS1RLRDSmChyxxlpTHab4Z0FWak35bBB3Up9XSWiaaH1tKhKqD9l
 MQKOYrthqLSP7wouGfADE/Q79nK7R8ztupL4sEEoZk/PpWHkqfVpombI8NbfopXgHU6O
 KmE+agqbZqMHU14xkqLTuqFXSu3M3zRg8IZFzYUwWL+uyDRp8JhjiSNNASbbvFEmPsJo
 wHVg==
X-Gm-Message-State: AOAM533Wvp4JHyUm6rNCbqJvx8VK087YrTuzcYEieWmhoeROSu8IWdv4
 n/K8anXeq6QOW4fXi0BFup8zHA==
X-Google-Smtp-Source: ABdhPJxBTDlmpYknu5+FGqxcq8hcfailBbiE0Xfnn7MYBn5HZW1mxCne+uBxiu2ht38c0t5igE6EbQ==
X-Received: by 2002:a05:6a00:2ac:b029:1e9:3cb7:324a with SMTP id
 q12-20020a056a0002acb02901e93cb7324amr1188380pfs.36.1614309749236; 
 Thu, 25 Feb 2021 19:22:29 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id p11sm7083709pjb.31.2021.02.25.19.22.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 19:22:28 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v7 36/75] target/riscv: rvv-1.0: floating-point move
 instruction
Date: Fri, 26 Feb 2021 11:18:20 +0800
Message-Id: <20210226031902.23656-37-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226031902.23656-1-frank.chang@sifive.com>
References: <20210226031902.23656-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 26 Feb 2021 03:22:36 -0000

From: Frank Chang <frank.chang@sifive.com>

NaN-boxed the scalar floating-point register based on RVV 1.0's rules.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 1839fc0a56b..7ac7d6a2b92 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2691,9 +2691,15 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_f *a)
         require_rvf(s) &&
         vext_check_isa_ill(s) &&
         require_align(a->rd, s->lmul)) {
+        TCGv_i64 t1;
+
         if (s->vl_eq_vlmax) {
+            t1 = tcg_temp_new_i64();
+            /* NaN-box f[rs1] */
+            do_nanbox(s, t1, cpu_fpr[a->rs1]);
+
             tcg_gen_gvec_dup_i64(s->sew, vreg_ofs(s, a->rd),
-                                 MAXSZ(s), MAXSZ(s), cpu_fpr[a->rs1]);
+                                 MAXSZ(s), MAXSZ(s), t1);
             mark_vs_dirty(s);
         } else {
             TCGv_ptr dest;
@@ -2707,16 +2713,22 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_f *a)
             TCGLabel *over = gen_new_label();
             tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
 
+            t1 = tcg_temp_new_i64();
+            /* NaN-box f[rs1] */
+            do_nanbox(s, t1, cpu_fpr[a->rs1]);
+
             dest = tcg_temp_new_ptr();
             desc = tcg_const_i32(simd_desc(0, s->vlen / 8, data));
             tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, a->rd));
-            fns[s->sew - 1](dest, cpu_fpr[a->rs1], cpu_env, desc);
+
+            fns[s->sew - 1](dest, t1, cpu_env, desc);
 
             tcg_temp_free_ptr(dest);
             tcg_temp_free_i32(desc);
             mark_vs_dirty(s);
             gen_set_label(over);
         }
+        tcg_temp_free_i64(t1);
         return true;
     }
     return false;
-- 
2.17.1


