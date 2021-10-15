Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbHwV-0006aL-Jh
	for mharc-qemu-riscv@gnu.org; Fri, 15 Oct 2021 03:47:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHwL-0006Tu-5H
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 03:47:42 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:52935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHwJ-0002Zb-JS
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 03:47:40 -0400
Received: by mail-pj1-x1032.google.com with SMTP id oa4so6668751pjb.2
 for <qemu-riscv@nongnu.org>; Fri, 15 Oct 2021 00:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JMDze/JBPMoIhv5ZVdEvZ0xn9fZ9ju1fZm+NuuRvt0I=;
 b=IdBKVAjpW3NkFn64Ksr7wdY3N+wPqNHKzztpNWliOTXKgoTarrgEXdfahoUlhs71mn
 Fq3xauTjqjNcQMahrsgGzPvMPagb84kLdGiay98aolx5XqW60H5cE0PAqdTxlGysxGwk
 alyc/jo+tXzA2swl0J48nak4gNl/0KZ76igo9yVa9nim2H7p8Xvuc+RBbEcpo/XvuNES
 wwuSVwJ5udfLPeUeVPEri3VZgutTybUqCKiMhc9l+B5epXWcXfIQib6c47iQWOujZmYq
 iP9OK6hFV5Oe3gxHQcTZDLci9bQ+AJd90C95elZrdVcVv2Wf9kRZL/g2mqrGVCssAbKM
 FiVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JMDze/JBPMoIhv5ZVdEvZ0xn9fZ9ju1fZm+NuuRvt0I=;
 b=PfrlBmywmkBNk5eBy5eT073O2G0wuo+ay8y8pX+1glL6QdqcJSiyyBFmGdbIZ/PHf8
 xljrjpH98dTuQOrxAMcltb+uVZpbDUy0RQetl36QyT75NdH2tL9W+xzxLZgfIdPhtIXq
 5JVsE4EpkN6kfMVyC6RsthRM71JyH1LfchiIXSmXDKXP0VInk4XktROty3IGA/PHXDGz
 Jl3d6U07sluKZT7JADayhPRRA4K1lpOnWLHQSHTl+x4DOvLjhH4rLdVJATkefenWfH9Q
 cklaILRnttKcb3qeGjCvwtbFkvPCrDHbKE+mldbFUxQrcxViSvcuWNPVWCDOWPQ1wFy1
 kfgw==
X-Gm-Message-State: AOAM531EE258awHJJZNeqfDR+ypAidaeDEbmBVRxYU8BW1I7ulWYlSmE
 CKge9YKen0z6II7RIyQkK0hDM+VcVBeh7jVI
X-Google-Smtp-Source: ABdhPJy2eQdSJk6UbKnOz+Xzv8gq3G86TFPYNroRDNK318s4AIEBCJzwdBaU4KNck4lXq8ZMF6APXQ==
X-Received: by 2002:a17:90b:4a07:: with SMTP id
 kk7mr11756787pjb.37.1634284058231; 
 Fri, 15 Oct 2021 00:47:38 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id z13sm4271680pfq.130.2021.10.15.00.47.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 00:47:37 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v8 17/78] target/riscv: rvv:1.0: add translation-time nan-box
 helper function
Date: Fri, 15 Oct 2021 15:45:18 +0800
Message-Id: <20211015074627.3957162-18-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015074627.3957162-1-frank.chang@sifive.com>
References: <20211015074627.3957162-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1032.google.com
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
X-List-Received-Date: Fri, 15 Oct 2021 07:47:42 -0000

From: Frank Chang <frank.chang@sifive.com>

* Add fp16 nan-box check generator function, if a 16-bit input is not
  properly nanboxed, then the input is replaced with the default qnan.
* Add do_nanbox() helper function to utilize gen_check_nanbox_X() to
  generate the NaN-boxed floating-point values based on SEW setting.
* Apply nanbox helper in opfvf_trans().

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 35 ++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index c33ded385d7..50834bb8a39 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2094,6 +2094,33 @@ GEN_OPIVI_NARROW_TRANS(vnclip_vi, IMM_ZX, vnclip_vx)
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
@@ -2147,6 +2174,7 @@ static bool opfvf_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
 {
     TCGv_ptr dest, src2, mask;
     TCGv_i32 desc;
+    TCGv_i64 t1;
 
     TCGLabel *over = gen_new_label();
     tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
@@ -2160,11 +2188,16 @@ static bool opfvf_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
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
+    tcg_temp_free_i64(t1);
     mark_vs_dirty(s);
     gen_set_label(over);
     return true;
-- 
2.25.1


