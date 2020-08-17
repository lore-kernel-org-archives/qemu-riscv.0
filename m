Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k7at2-0002fc-5Q
	for mharc-qemu-riscv@gnu.org; Mon, 17 Aug 2020 04:53:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k7asy-0002Y6-QD
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2020 04:52:57 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:45486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k7asv-0005J1-TA
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2020 04:52:56 -0400
Received: by mail-pg1-x535.google.com with SMTP id x6so7782896pgx.12
 for <qemu-riscv@nongnu.org>; Mon, 17 Aug 2020 01:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=8m4F6haOmD/DOXIRL1Nw+gnodIBy7pX1UCJixTvPsus=;
 b=O1aIIWDLLd42RDoje7i6wA3IgqQEF9LeErCHMPh20seTioh9kXruW3hYpwf+pPLCAv
 VJFZBCHwavMmpCu3BDu3EM3h7FobYnocb7He5Of8dpyWfOcGc1Rh2CiysPSJhHhQzsaA
 y0JU6J/RLIChmGH5ufQd6nIlhfw/08gUb2c4+B/Ko/f6tfeuSbm1dVuXOZoRExkGdb+m
 umX0AYMKoDXBUgpZXAGUeM6QctP8c56kuhY7lTeHyawuPqSPlgsoJk0gbpvyqnOMqzGw
 /jbcC56CfGgHZf2BPjUbfDlIcNFzVeP5wyAc3Wz3gwZ66L2wlyeMoGE2KhsZ68xOeiTT
 IvuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=8m4F6haOmD/DOXIRL1Nw+gnodIBy7pX1UCJixTvPsus=;
 b=FBtFczlOh+wSg3I69tL9r53Nas0OFZUgZFROPLI6E+PG10Dhy2LOrhqoNprVB6bL9E
 cMnKmi5X4wV3RBUWYFpBYNkxYG9bSyNq9eTnU2xQ2DlDO8FmnUwsZ/y8luZUKOzlsaYW
 +1Izt8NsDAPlK6m2qpGVqs+YRU48VNIHNwsE/NA2LjBrzhIxCQI3jOWeI08uHGZRYx0Z
 mrbnmA3q4bsJqZZGGbbd2DmXR1DFyJdak0XO2gdKPgv6f16roPoy1CtlcvyjWc++W2CV
 f/CNhCSYNn7WoQEymTlH/+ukznqT7RV1gFrkY4An1eKO5R7MfbS150VKek2K+3OMckY5
 dixw==
X-Gm-Message-State: AOAM530QnE2K2gQGue7hMbGSbE3k85xwB+V2Y2TlxuD98GRci3BXr7lo
 v4QWjzTAevUdTqW5bBTlD/Au7w==
X-Google-Smtp-Source: ABdhPJy7wt46HxcnRtuNg8/9WYEqTgjpf4QHHt/7ACWtafYtz7/wmGA5c0mw8SXzIanwt8lTbbrbhA==
X-Received: by 2002:aa7:9ec4:: with SMTP id r4mr10903079pfq.48.1597654372662; 
 Mon, 17 Aug 2020 01:52:52 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id d9sm16478588pgv.45.2020.08.17.01.52.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:52:52 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v4 60/70] target/riscv: rvv-1.0: remove integer extract
 instruction
Date: Mon, 17 Aug 2020 16:49:45 +0800
Message-Id: <20200817084955.28793-61-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817084955.28793-1-frank.chang@sifive.com>
References: <20200817084955.28793-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x535.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 17 Aug 2020 08:52:57 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn32.decode              |  1 -
 target/riscv/insn_trans/trans_rvv.inc.c | 23 -----------------------
 2 files changed, 24 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 994ef3031b5..425cfd7cb32 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -603,7 +603,6 @@ viota_m         010100 . ..... 10000 010 ..... 1010111 @r2_vm
 vid_v           010100 . 00000 10001 010 ..... 1010111 @r1_vm
 vmv_x_s         010000 1 ..... 00000 010 ..... 1010111 @r2rd
 vmv_s_x         010000 1 00000 ..... 110 ..... 1010111 @r2
-vext_x_v        001100 1 ..... ..... 010 ..... 1010111 @r
 vfmv_f_s        010000 1 ..... 00000 001 ..... 1010111 @r2rd
 vfmv_s_f        010000 1 00000 ..... 101 ..... 1010111 @r2
 vslideup_vx     001110 . ..... ..... 100 ..... 1010111 @r_vm
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index a1d6f7a844b..4f33c42990e 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -3158,8 +3158,6 @@ static bool trans_vid_v(DisasContext *s, arg_vid_v *a)
  *** Vector Permutation Instructions
  */
 
-/* Integer Extract Instruction */
-
 static void load_element(TCGv_i64 dest, TCGv_ptr base,
                          int ofs, int sew, bool sign)
 {
@@ -3261,27 +3259,6 @@ static void vec_element_loadi(DisasContext *s, TCGv_i64 dest,
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


