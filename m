Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kpM8t-0006JW-9d
	for mharc-qemu-riscv@gnu.org; Tue, 15 Dec 2020 21:02:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kpM8r-0006HE-Ur
 for qemu-riscv@nongnu.org; Tue, 15 Dec 2020 21:02:13 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:52035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kpM8q-0000tL-6I
 for qemu-riscv@nongnu.org; Tue, 15 Dec 2020 21:02:13 -0500
Received: by mail-pj1-x1034.google.com with SMTP id z12so637214pjn.1
 for <qemu-riscv@nongnu.org>; Tue, 15 Dec 2020 18:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=C+m9b7S/HCNQYgThPYEjzhjEhXwRJWLTbzb6xEyvAbI=;
 b=lKKHXWGMrVCd6hlYYBH/zRPIXEe8nNcH3e9K27v0pGXQly2wgrCy6iw901VUjuLqRX
 XiWpYoqPK3RNoqGJl5e/NfDIdYYgJmSR+BDopexdRXtEwkVl3kYEdOZ4kGu9oKBFbimO
 N2wMS5R3ZDqxjeW/nQXjbqLJkU9Nr2RpgNHohYtI80kjX0HbyoQY0QoL5YcCBRKKdcRM
 8T2eO377z+vSMB04++5zfZBbC3QqAgRLj3gA4dN19xTUs5BeI1y9aA9c7PKlDYc4PMCm
 8+HY7wuAHtJAzpwsuBhGG6X+o6MgnCGrygPb5K95Zkky6bwDcg9ALEEqSspzWW0VGy3c
 pN/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=C+m9b7S/HCNQYgThPYEjzhjEhXwRJWLTbzb6xEyvAbI=;
 b=GaqRIW9NVXy7YYtIpf77AuRY+IuBc65gOSxF+JiDL3fl6dmP3DHzb0QVAFf7HNU2td
 fghnUgYeM9LlsvAq+jacstXiamtAfka1l4p/cR8/CxkfQNwxP76KGkbKzQBxgNjub4gi
 Kg9g2K7N0sXcSmjy41FKXDfhTWYDxL/bXthjMGXny4sHMXV9/JIro4CXt8NAtaguNHjJ
 L88e22ixe15+MAxUEAQXFqb6q8Z2VGmYQcjjJeJoBgUVi9sBmKLhUunL+4x3rZEldh1z
 ZlGuGIwKf3BkQNsaBaSLZXVBTSSdKiXsOKeqas2FLSQKgwrCD75nF0YG6yTMQjH1m6T6
 Caug==
X-Gm-Message-State: AOAM531AUK/jjVBfkyb21uFqdJPi+LAlEMFPdLopa4uTUcjDzVhowZgv
 JWz1ZQP4MbYw/rqq5Fy/j0B+yQ==
X-Google-Smtp-Source: ABdhPJywkLYd073lwUMTYs5G+eYp4NFcIfQbPY8+tnnwMOSkrPTs1j7JQXlJKPkfC9lMGET2QXpuKQ==
X-Received: by 2002:a17:902:6803:b029:da:1469:8945 with SMTP id
 h3-20020a1709026803b02900da14698945mr29402845plk.15.1608084130860; 
 Tue, 15 Dec 2020 18:02:10 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id a13sm289150pfr.59.2020.12.15.18.02.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 18:02:10 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Kito Cheng <kito.cheng@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v2 03/15] target/riscv: rvb: count bits set
Date: Wed, 16 Dec 2020 10:01:28 +0800
Message-Id: <20201216020150.3157-4-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201216020150.3157-1-frank.chang@sifive.com>
References: <20201216020150.3157-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1034.google.com
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
X-List-Received-Date: Wed, 16 Dec 2020 02:02:14 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn32-64.decode           |  1 +
 target/riscv/insn32.decode              |  1 +
 target/riscv/insn_trans/trans_rvb.c.inc | 12 ++++++++++++
 target/riscv/translate.c                |  6 ++++++
 4 files changed, 20 insertions(+)

diff --git a/target/riscv/insn32-64.decode b/target/riscv/insn32-64.decode
index f4c42720fc7..00c56a93151 100644
--- a/target/riscv/insn32-64.decode
+++ b/target/riscv/insn32-64.decode
@@ -90,3 +90,4 @@ hsv_d     0110111  .....   ..... 100 00000 1110011 @r2_s
 # *** RV64B Standard Extension (in addition to RV32B) ***
 clzw       0110000 00000 ..... 001 ..... 0011011 @r2
 ctzw       0110000 00001 ..... 001 ..... 0011011 @r2
+pcntw      0110000 00010 ..... 001 ..... 0011011 @r2
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 8fe838cf0d0..ac4d8395a45 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -597,3 +597,4 @@ vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
 # *** RV32B Standard Extension ***
 clz        011000 000000 ..... 001 ..... 0010011 @r2
 ctz        011000 000001 ..... 001 ..... 0010011 @r2
+pcnt       011000 000010 ..... 001 ..... 0010011 @r2
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index fb6e16143db..f5930f2ad53 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -29,6 +29,12 @@ static bool trans_ctz(DisasContext *ctx, arg_ctz *a)
     return gen_unary(ctx, a, &gen_ctz);
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
     return gen_unary(ctx, a, &gen_ctzw);
 }
 
+static bool trans_pcntw(DisasContext *ctx, arg_pcntw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_unary(ctx, a, &gen_pcntw);
+}
+
 #endif
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 398d4502a96..4c9eb86e630 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -726,6 +726,12 @@ static void gen_clzw(TCGv ret, TCGv arg1)
     tcg_gen_subi_i64(ret, ret, 32);
 }
 
+static void gen_pcntw(TCGv ret, TCGv arg1)
+{
+    tcg_gen_ext32u_tl(arg1, arg1);
+    tcg_gen_ctpop_tl(ret, arg1);
+}
+
 #endif
 
 static bool gen_arith(DisasContext *ctx, arg_r *a,
-- 
2.17.1


