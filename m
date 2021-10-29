Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mgNkh-0005bL-1D
	for mharc-qemu-riscv@gnu.org; Fri, 29 Oct 2021 05:00:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNkb-0005SM-Ap
 for qemu-riscv@nongnu.org; Fri, 29 Oct 2021 05:00:37 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:33732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNkZ-0005Hi-QG
 for qemu-riscv@nongnu.org; Fri, 29 Oct 2021 05:00:37 -0400
Received: by mail-pf1-x431.google.com with SMTP id t184so8709164pfd.0
 for <qemu-riscv@nongnu.org>; Fri, 29 Oct 2021 02:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UuHNpuuvenRB0lpb7qiWwBNdMSBwJhbiU5uEpMv2qBU=;
 b=YAZy6Ef3wvDdVFlA2szmyKruoUVUoeAhWEzACLuNfXuhBzj4jD62q4XWbV3+poeOj5
 77/P8O1DjpY/do3PHYgl/EzEtvrFuf0fx2voFVvYZizlGMtAI2kcdSdiqHitGibmH8BW
 ck8XzLBIFTa0IgmfCA46PEwGRQ7aL/EoG+y8UY9J/009xUwkbVh3RIomhh9u1jDMzi3D
 llbtip17VGwd/HZodMmj2OrBFpe8tUt9tDKuwCUtyKIuxpLWcDBotPDCJIEBtA5oFzR7
 jHBnr9+4sLjFDwbvhgS4u9xCJUK84qXNAzeVBPS+AAfgRw7oym+rEaESGNWNmq+jmEDI
 0VVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UuHNpuuvenRB0lpb7qiWwBNdMSBwJhbiU5uEpMv2qBU=;
 b=hCUFAXhsXGS5C8cSex49vi5rhLO0ZkXObbUvxZr3iMfuohw/QegC0j8X3KiXvGzIqh
 XCm5K0hjjuXNi3nMFpp0RtRk9k/Bjgu5pgOTA8Q9NTATxWW6B4f1L5cwqEty8q5HbEv+
 Zi+lwMwK3QpjMWPW+8I/schDmrltZVDHxhqjEihGeKYxTHvBkUsMW1FpJxqA5BKcTp0u
 kc78rMmYiMIfwfNnerfdy71gph8RWCnNB8yUmysEV6QKGZtKwNQxK3U//fH/+22mayEE
 Gn8N1MENiNotF6LVV3Op+e+8m8C/3e+AlbPKH83t+sR7s5lihmyKrlykE3f8EOldixis
 4etA==
X-Gm-Message-State: AOAM533OzCB/P+hmKQI0Xs+YVu+K/xx/8ja9JIxsRc6deqMrHAzQBCWx
 5iTiocv+90VmHzpf7vqQp4OyKw==
X-Google-Smtp-Source: ABdhPJxjz8jqwwKwU6kT16A8Yl0/TWminfq2dOUazPPa6gHiwYsu6jdMObLol2zw0+lgj1dKHvhc/A==
X-Received: by 2002:a62:2c82:0:b0:44d:71c3:8a3 with SMTP id
 s124-20020a622c82000000b0044d71c308a3mr9646245pfs.84.1635498033127; 
 Fri, 29 Oct 2021 02:00:33 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:46b:ce55:983b:6962:38ac:e1b9])
 by smtp.gmail.com with ESMTPSA id t13sm5081477pgn.94.2021.10.29.02.00.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 02:00:32 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v9 17/76] target/riscv: rvv:1.0: add translation-time nan-box
 helper function
Date: Fri, 29 Oct 2021 16:58:22 +0800
Message-Id: <20211029085922.255197-18-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029085922.255197-1-frank.chang@sifive.com>
References: <20211029085922.255197-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x431.google.com
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
X-List-Received-Date: Fri, 29 Oct 2021 09:00:39 -0000

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
index 66273afb537..f9ace6ae412 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2098,6 +2098,33 @@ GEN_OPIVI_NARROW_TRANS(vnclip_vi, IMM_ZX, vnclip_vx)
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
@@ -2151,6 +2178,7 @@ static bool opfvf_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
 {
     TCGv_ptr dest, src2, mask;
     TCGv_i32 desc;
+    TCGv_i64 t1;
 
     TCGLabel *over = gen_new_label();
     tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
@@ -2164,11 +2192,16 @@ static bool opfvf_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
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


