Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzGDs-0007Gm-0X
	for mharc-qemu-riscv@gnu.org; Tue, 12 Jan 2021 04:44:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGDn-00079N-Gj
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:44:15 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:38574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGDT-0008Od-V5
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:44:08 -0500
Received: by mail-pg1-x52b.google.com with SMTP id q7so1085836pgm.5
 for <qemu-riscv@nongnu.org>; Tue, 12 Jan 2021 01:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=+KA4+ewdFZ3b2AL2Ptyq+JJl2LWRu7NSTTd3bhaGg8E=;
 b=M+nxVC+VmkjsiuUKQygK0FDZCyGJ0fikUm713ZyCquJPsaOHDzjvFHr9bEAamhJH5n
 NOmPI4rbQwY5TZeB51AoO3Z32cdGsoaG4vBn5Ixfps1LsMjVgmzuJudvDZ6hPeKYR3cE
 sSRaCBGZSonFpb4YthMkwuPOHOFL3f+T4XGbDq+SY2ZX6hgcmxozr0jp6qscxPQStyQv
 JQl/5H0rdOa810gbbRW6HjGkRwSMXTB5kfjjcecnDo0xto309JZFjoH7lr8Zj0r1out7
 T1XDFq6R3Dh6dQb03DUJj1z/0uZ3BLAnOJaVPrV3J+fuGXWx5bs0MeHQEEWx7w+0T2Rk
 Fp5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=+KA4+ewdFZ3b2AL2Ptyq+JJl2LWRu7NSTTd3bhaGg8E=;
 b=guQRSgpMMLT4PqPz4weH4DyR1kfhPzGZFWVpG/PeHyMuim2KuuteL4Oq5yoKDaMBGv
 9ZyhrVDAiz31RinU4o0XBKaeHPHUjDKcdH7eZGojsEJDhzFuFbdIS7e5jaeQ2RJq+7NY
 sMRUFXd7bAIxLZT1ojo0QPOQ2D3ywy8zrrhh3vybMjsaOQVY1RuuCvhj+ppHIzqKTOjl
 AVNbRZ460td+S76YmKIXD6MCH0E+BISfdESRT0Iike4x7p8zzxNTzvnR1aEWdvd2Jf90
 tyaDDSByVOMoSAvnyr2tlrImPx6ZPemk0jMT+wjHEKUy/Wg2P3XnUwKUy7LWwRy8lLCo
 /2CQ==
X-Gm-Message-State: AOAM533zLVz9lh6QIIY8jAsCcmce6+RUFUPzSvubtQ5L/zx6i8QrQW/n
 5yt7oWLR3TKOJsoGJNKrAA73KlJR+lmiW6rm
X-Google-Smtp-Source: ABdhPJwX8ywOo5AtQoESrY4YO8MlrxQzU/Si815+e5lQ7iGZ2xI6jWkj2ztk974eMmlLmfWZ0llt4w==
X-Received: by 2002:a63:50a:: with SMTP id 10mr3927427pgf.273.1610444634783;
 Tue, 12 Jan 2021 01:43:54 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id h16sm2865664pgd.62.2021.01.12.01.43.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 01:43:54 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v6 57/72] target/riscv: rvv-1.0: remove integer extract
 instruction
Date: Tue, 12 Jan 2021 17:39:31 +0800
Message-Id: <20210112093950.17530-58-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112093950.17530-1-frank.chang@sifive.com>
References: <20210112093950.17530-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52b.google.com
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
X-List-Received-Date: Tue, 12 Jan 2021 09:44:16 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn32.decode              |  1 -
 target/riscv/insn_trans/trans_rvv.c.inc | 23 -----------------------
 2 files changed, 24 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 2d96c53d066..0d29ac2b2a1 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -607,7 +607,6 @@ viota_m         010100 . ..... 10000 010 ..... 1010111 @r2_vm
 vid_v           010100 . 00000 10001 010 ..... 1010111 @r1_vm
 vmv_x_s         010000 1 ..... 00000 010 ..... 1010111 @r2rd
 vmv_s_x         010000 1 00000 ..... 110 ..... 1010111 @r2
-vext_x_v        001100 1 ..... ..... 010 ..... 1010111 @r
 vfmv_f_s        010000 1 ..... 00000 001 ..... 1010111 @r2rd
 vfmv_s_f        010000 1 00000 ..... 101 ..... 1010111 @r2
 vslideup_vx     001110 . ..... ..... 100 ..... 1010111 @r_vm
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index c3ec88e238c..de7152dc323 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -3071,8 +3071,6 @@ static bool trans_vid_v(DisasContext *s, arg_vid_v *a)
  *** Vector Permutation Instructions
  */
 
-/* Integer Extract Instruction */
-
 static void load_element(TCGv_i64 dest, TCGv_ptr base,
                          int ofs, int sew, bool sign)
 {
@@ -3174,27 +3172,6 @@ static void vec_element_loadi(DisasContext *s, TCGv_i64 dest,
     load_element(dest, cpu_env, endian_ofs(s, vreg, idx), s->sew, sign);
 }
 
-static bool trans_vext_x_v(DisasContext *s, arg_r *a)
-{
-    TCGv_i64 tmp = tcg_temp_new_i64();
-    TCGv dest = tcg_temp_new();
-
-    if (a->rs1 == 0) {
-        /* Special case vmv.x.s rd, vs2. */
-        vec_element_loadi(s, tmp, a->rs2, 0, false);
-    } else {
-        /* This instruction ignores LMUL and vector register groups */
-        int vlmax = s->vlen >> (3 + s->sew);
-        vec_element_loadx(s, tmp, a->rs2, cpu_gpr[a->rs1], vlmax);
-    }
-    tcg_gen_trunc_i64_tl(dest, tmp);
-    gen_set_gpr(a->rd, dest);
-
-    tcg_temp_free(dest);
-    tcg_temp_free_i64(tmp);
-    return true;
-}
-
 /* Integer Scalar Move Instruction */
 
 static void store_element(TCGv_i64 val, TCGv_ptr base,
-- 
2.17.1


