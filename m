Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mrX1u-0002QU-01
	for mharc-qemu-riscv@gnu.org; Sun, 28 Nov 2021 22:08:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrX1r-0002Hq-DZ
 for qemu-riscv@nongnu.org; Sun, 28 Nov 2021 22:08:31 -0500
Received: from [2607:f8b0:4864:20::102f] (port=40954
 helo=mail-pj1-x102f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrX1p-0000mD-5l
 for qemu-riscv@nongnu.org; Sun, 28 Nov 2021 22:08:31 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 gf14-20020a17090ac7ce00b001a7a2a0b5c3so14326796pjb.5
 for <qemu-riscv@nongnu.org>; Sun, 28 Nov 2021 19:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ftvjvCQfoklWOqLL2y7YTSZ6nmoxZ3vi2iOlXpfe2XA=;
 b=b66up7l21u7cwawFzJ9xXMZZuKXpnyakQ+ejUdYVu8gKeR2E+gXVBWTNmX9U9YSvpA
 qQLokK37e2opThwHW7iZhKvi7kim61Je9cfxLfMYCmTinJ1q7wOqKKAhNIL1b/rjZe8d
 THLp9sYxDBOBkkqAg8+owj0M/WnyY4hgdohXkVeZSiLkvD9DpvJLPEIiRwNnHogR6+52
 ihYhPRKyD16Pv5rB9LC1VaM1gskMqMDaYvCfKh5taOt/XcZCG0KzbfC60UM0cHZGOp8h
 G1c9GTcqbHg4tMWXwwpySq2TpWa5+zIss33zOsdsLX6BilZkrkWWhdd29Mq4ERuHbZJt
 sYKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ftvjvCQfoklWOqLL2y7YTSZ6nmoxZ3vi2iOlXpfe2XA=;
 b=aX530Umw1EnxzofUvH8PA0c8uQipDk9sKu/7hwdJ1NCzBO2jRWxV4WJYZzS0TSh6Gk
 UeYwG2pj+64a+2IEfqW3IsoUPtPT019KrCyGuI3HDMdnCHODYQV9rR+NlYh+OiPv2GCf
 vDRktMb8tgUA8lYmFyE8dNA8Wr/y4dtvj0Eaqjg0IZNgtKAunwovtQrZ8BEeUBuexPTM
 0RcCSkUcOqXhK7gexYABcgEeUOs23lRWCg/pecOd3Wcx3ut/ExB1tynWYbAcRmYmULOx
 M0LNLf6RXK+oR/K2vm0YHEDzA7af3RPTm+aXEPlm+zM0jZSyeVY4CTJxxn16D0v9PWMC
 KjDg==
X-Gm-Message-State: AOAM531LpIn6GQjSmGclADLPQheYofkpiZkIvLb6lROfKCJ8RJe3HfsD
 64nExWrRl8VR3lvwp8/O7dgQLw==
X-Google-Smtp-Source: ABdhPJxBUw/mRaQQufKL+VPayq8O4dU/J/q+5JABkMOrV+FucAQHadG3SscyPnEHgLRqgaxqI9Q8JA==
X-Received: by 2002:a17:90a:ac0b:: with SMTP id
 o11mr34573111pjq.143.1638155308073; 
 Sun, 28 Nov 2021 19:08:28 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id oj11sm17904040pjb.46.2021.11.28.19.08.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 19:08:27 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v10 58/77] target/riscv: rvv-1.0: remove integer extract
 instruction
Date: Mon, 29 Nov 2021 11:03:18 +0800
Message-Id: <20211129030340.429689-59-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129030340.429689-1-frank.chang@sifive.com>
References: <20211129030340.429689-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102f.google.com
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
X-List-Received-Date: Mon, 29 Nov 2021 03:08:31 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn32.decode              |  1 -
 target/riscv/insn_trans/trans_rvv.c.inc | 23 -----------------------
 2 files changed, 24 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 82484fda751..20b3095f56c 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -632,7 +632,6 @@ viota_m         010100 . ..... 10000 010 ..... 1010111 @r2_vm
 vid_v           010100 . 00000 10001 010 ..... 1010111 @r1_vm
 vmv_x_s         010000 1 ..... 00000 010 ..... 1010111 @r2rd
 vmv_s_x         010000 1 00000 ..... 110 ..... 1010111 @r2
-vext_x_v        001100 1 ..... ..... 010 ..... 1010111 @r
 vfmv_f_s        010000 1 ..... 00000 001 ..... 1010111 @r2rd
 vfmv_s_f        010000 1 00000 ..... 101 ..... 1010111 @r2
 vslideup_vx     001110 . ..... ..... 100 ..... 1010111 @r_vm
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 4c5f813ccf9..1ce5a10b6a8 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2840,8 +2840,6 @@ static bool trans_vid_v(DisasContext *s, arg_vid_v *a)
  *** Vector Permutation Instructions
  */
 
-/* Integer Extract Instruction */
-
 static void load_element(TCGv_i64 dest, TCGv_ptr base,
                          int ofs, int sew, bool sign)
 {
@@ -2941,27 +2939,6 @@ static void vec_element_loadi(DisasContext *s, TCGv_i64 dest,
     load_element(dest, cpu_env, endian_ofs(s, vreg, idx), s->sew, sign);
 }
 
-static bool trans_vext_x_v(DisasContext *s, arg_r *a)
-{
-    TCGv_i64 tmp = tcg_temp_new_i64();
-    TCGv dest = dest_gpr(s, a->rd);
-
-    if (a->rs1 == 0) {
-        /* Special case vmv.x.s rd, vs2. */
-        vec_element_loadi(s, tmp, a->rs2, 0, false);
-    } else {
-        /* This instruction ignores LMUL and vector register groups */
-        int vlmax = s->vlen >> (3 + s->sew);
-        vec_element_loadx(s, tmp, a->rs2, cpu_gpr[a->rs1], vlmax);
-    }
-
-    tcg_gen_trunc_i64_tl(dest, tmp);
-    gen_set_gpr(s, a->rd, dest);
-
-    tcg_temp_free_i64(tmp);
-    return true;
-}
-
 /* Integer Scalar Move Instruction */
 
 static void store_element(TCGv_i64 val, TCGv_ptr base,
-- 
2.25.1


