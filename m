Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kfIt9-0000qf-R5
	for mharc-qemu-riscv@gnu.org; Wed, 18 Nov 2020 03:32:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kfIt7-0000lJ-Ts
 for qemu-riscv@nongnu.org; Wed, 18 Nov 2020 03:32:25 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:35765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kfIt5-0004mS-Nb
 for qemu-riscv@nongnu.org; Wed, 18 Nov 2020 03:32:25 -0500
Received: by mail-pj1-x1029.google.com with SMTP id b12so717552pjl.0
 for <qemu-riscv@nongnu.org>; Wed, 18 Nov 2020 00:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=SyUPWoPookn1xs0zcbONOqD2RtSxLPKpiKQrXTOCNis=;
 b=OBmW90com4bUi632AZX06eiOrTEnf+CkLixd2dC0FdpR2+4gnaYbMNJ+BlrnNAj3cT
 DGuDrCt2p4AxvvLgX/On6aktCOOQl42RHvNFQ0hDoC7Dsz0NYu3Ei55PJ21RfHw09+tz
 eHG6zeBTztsC7JiQAMa4CfVeHS+Z/8yGV6VFzFzPD3BluDSMALj5wIMqEjKXzuszjUmQ
 FoTOwTsHdUzvGyudfFYXkD27k+OvN+b+sFNBPL/hKa52Yelm2vOBFhGdn/dyM1ytwFc+
 bvs/ByaGgCzNfWCirY41GItArMy0J1eXkHI8pVPgqmsb0ez9zBshvzqdlHfhizh3rMWD
 xgxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=SyUPWoPookn1xs0zcbONOqD2RtSxLPKpiKQrXTOCNis=;
 b=e/nGP9XFENWxmL44b/zODoHkJBZAnVVkBy3RYKzv+3fP1Jkq00BZXgvsvtloeNbmS9
 c/SwIJjVWIQi+okwvpmsMMhadtyPtScigCXzF5H4iKjA+Z5PjEnAmq89ua+7ieL5amLr
 YeNwWp+mqTclwEMYFelUW+rSqHLRVz+hIyycbcYny28GTEp0cGfZDw70LIKONP5ZmIpI
 eVuhNDEVffbiUK/E7NFgyKfHDBZEGk9RsVFssO0dI+s5kBdVrZHl3/qIuUYajG920RAT
 HNRNzX/59qUnGAxbieMBDBAs1WNTCIKTKXVDByEK6eTIOq1EKeDs91dw0tUqdX+YiTj6
 ccDw==
X-Gm-Message-State: AOAM533/pJbLfJlceBGqeQ4v6OPvlsTj5mRhYTY5xDUW8BP5VyB3Wpv1
 wFBP6ZmoMAiGV9wJR7pxSJAYzg==
X-Google-Smtp-Source: ABdhPJydZMNZfyDq63401Gmt9qetLik6PnLrLecfR4coUkjYCMYkCEF3bLoicY+JZiPbIOhZHdk2XA==
X-Received: by 2002:a17:90a:b28d:: with SMTP id
 c13mr3258253pjr.206.1605688342481; 
 Wed, 18 Nov 2020 00:32:22 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id y10sm1618407pjm.34.2020.11.18.00.32.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 00:32:22 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Kito Cheng <kito.cheng@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Frank Chang <frank.chang@sifive.com>
Subject: [RFC 03/15] target/riscv: rvb: count bits set
Date: Wed, 18 Nov 2020 16:29:41 +0800
Message-Id: <20201118083044.13992-4-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201118083044.13992-1-frank.chang@sifive.com>
References: <20201118083044.13992-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1029.google.com
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
X-List-Received-Date: Wed, 18 Nov 2020 08:32:26 -0000

From: Kito Cheng <kito.cheng@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
---
 target/riscv/insn32-64.decode           |  1 +
 target/riscv/insn32.decode              |  1 +
 target/riscv/insn_trans/trans_rvb.c.inc | 12 ++++++++++++
 target/riscv/translate.c                | 21 +++++++++++++++++++++
 4 files changed, 35 insertions(+)

diff --git a/target/riscv/insn32-64.decode b/target/riscv/insn32-64.decode
index 250279e62ea..d5bea5af273 100644
--- a/target/riscv/insn32-64.decode
+++ b/target/riscv/insn32-64.decode
@@ -90,3 +90,4 @@ hsv_d     0110111  .....   ..... 100 00000 1110011 @r2_s
 # *** RV64B Standard Extension (in addition to RV32B) ***
 clzw       011000000000 ..... 001 ..... 0011011 @r2
 ctzw       011000000001 ..... 001 ..... 0011011 @r2
+pcntw      011000000010 ..... 001 ..... 0011011 @r2
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 884ed2a42fa..9e70a85d6f0 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -597,3 +597,4 @@ vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
 # *** RV32B Standard Extension ***
 clz        011000000000 ..... 001 ..... 0010011 @r2
 ctz        011000000001 ..... 001 ..... 0010011 @r2
+pcnt       011000000010 ..... 001 ..... 0010011 @r2
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 1f02cb91a0a..6f1054e3908 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -29,6 +29,12 @@ static bool trans_ctz(DisasContext *ctx, arg_ctz *a)
     return gen_cxz(ctx, a, &tcg_gen_ctzi_tl);
 }
 
+static bool trans_pcnt(DisasContext *ctx, arg_pcnt *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_unary(ctx, a, &tcg_gen_ctpop_tl);
+}
+
 /* RV64-only instructions */
 #ifdef TARGET_RISCV64
 
@@ -44,4 +50,10 @@ static bool trans_ctzw(DisasContext *ctx, arg_ctzw *a)
     return gen_cxzw(ctx, a, &tcg_gen_ctzi_i32);
 }
 
+static bool trans_pcntw(DisasContext *ctx, arg_pcntw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_unary(ctx, a, &gen_pcntw);
+}
+
 #endif
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 20b47f7a660..97e5899750e 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -736,6 +736,12 @@ static bool gen_cxzw(DisasContext *ctx, arg_r2 *a,
     return true;
 }
 
+static void gen_pcntw(TCGv ret, TCGv arg1)
+{
+    tcg_gen_ext32u_tl(arg1, arg1);
+    tcg_gen_ctpop_tl(ret, arg1);
+}
+
 #endif
 
 static bool gen_arith(DisasContext *ctx, arg_r *a,
@@ -793,6 +799,21 @@ static bool gen_cxz(DisasContext *ctx, arg_r2 *a,
     return true;
 }
 
+static bool gen_unary(DisasContext *ctx, arg_r2 *a,
+                      void(*func)(TCGv, TCGv))
+{
+    TCGv source;
+    source = tcg_temp_new();
+
+    gen_get_gpr(source, a->rs1);
+
+    (*func)(source, source);
+
+    gen_set_gpr(a->rd, source);
+    tcg_temp_free(source);
+    return true;
+}
+
 /* Include insn module translation function */
 #include "insn_trans/trans_rvi.c.inc"
 #include "insn_trans/trans_rvm.c.inc"
-- 
2.17.1


