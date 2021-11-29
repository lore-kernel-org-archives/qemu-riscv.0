Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mrWyb-0001bV-0P
	for mharc-qemu-riscv@gnu.org; Sun, 28 Nov 2021 22:05:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrWyX-0001X2-4x
 for qemu-riscv@nongnu.org; Sun, 28 Nov 2021 22:05:06 -0500
Received: from [2607:f8b0:4864:20::1033] (port=40947
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrWyU-00004x-Df
 for qemu-riscv@nongnu.org; Sun, 28 Nov 2021 22:05:04 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 gf14-20020a17090ac7ce00b001a7a2a0b5c3so14320991pjb.5
 for <qemu-riscv@nongnu.org>; Sun, 28 Nov 2021 19:05:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UuHNpuuvenRB0lpb7qiWwBNdMSBwJhbiU5uEpMv2qBU=;
 b=XdbT2xGvwiyfMP4ilfRG8ckhI33KKfVdOsM2ZAOE4NsGt73e+yCloGYxe43rGy7f/M
 NC6tMlw84eEceuJbaE5yTaMzyAkWXDtWKjdCLzUhj4GjFcO7Oxk5ejLlh2YbiRAqFjH2
 eN3sM7ht/lCef9q6KF8vc00pEBHiwpvkp4xQDzMQMbWWQGELO9RBbl6USvXVntGmmhPs
 qmKE2qJQGuJLXfJo9hlh3q8gVgSL5kNnLyWQl/g+pgbEap08qz8C+v5EAxU8M6NY092b
 dAzadeSREXnf+JcdAV1C7SSeio5akDfCOyBu90SnjKTCNKWT0t4vINpx7d4VMhB8YjZA
 dxFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UuHNpuuvenRB0lpb7qiWwBNdMSBwJhbiU5uEpMv2qBU=;
 b=yfUeBdFKvWpNHu2rIOQtwAwVWZtzUI4Cp5i5Qap43T7Or21flBowCSX0HhX9zqQWsc
 9mXxZIv8DA9NNQRSSgmhUmbdbvUTAZdf7tZt7g7pYXo/vTTmzYrTLO7aiePrsMkfmFn6
 qNt5gyVwKHsr19kQtps8f4JkE8lpEpYDYbfMgFYiELHkZ/aDBv//xFaKq6B/T+PhIJoW
 WxE4HBtG2r1VEW8osvpJ76J2N5kd4iQLhYvfduFetVbSWMHOVCADyUZnyj2SbjNIyU02
 j9Jkgn+dGGXeUZHJ5BS+MTYmISTaqC2DmYokkLu62XzNeYp57IyaWXzX5DedDqfaJhFW
 o9Pg==
X-Gm-Message-State: AOAM531tf90v+aeDomzSajB1iIpxV8tBO0tCLGdRGw7cbYoAKMWX/YN5
 GLsbUNrOA9shEBtRgclHRkbSeA==
X-Google-Smtp-Source: ABdhPJysxuuJFp1+JV+SZelcZ8KSO24qMeFGg6oIbsd5riixU6xjVCTtCeFvwiC/AMmjOcM47rk2Iw==
X-Received: by 2002:a17:902:be12:b0:142:431f:3d1c with SMTP id
 r18-20020a170902be1200b00142431f3d1cmr56840954pls.32.1638155101137; 
 Sun, 28 Nov 2021 19:05:01 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id oj11sm17904040pjb.46.2021.11.28.19.04.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 19:05:00 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v10 17/77] target/riscv: rvv:1.0: add translation-time nan-box
 helper function
Date: Mon, 29 Nov 2021 11:02:37 +0800
Message-Id: <20211129030340.429689-18-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129030340.429689-1-frank.chang@sifive.com>
References: <20211129030340.429689-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 29 Nov 2021 03:05:06 -0000

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


