Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzaML-00075C-PE
	for mharc-qemu-riscv@gnu.org; Wed, 13 Jan 2021 02:14:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzaMI-00072S-7E
 for qemu-riscv@nongnu.org; Wed, 13 Jan 2021 02:14:22 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:55786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzaMF-0003sG-UU
 for qemu-riscv@nongnu.org; Wed, 13 Jan 2021 02:14:21 -0500
Received: by mail-pj1-x1032.google.com with SMTP id p12so555584pju.5
 for <qemu-riscv@nongnu.org>; Tue, 12 Jan 2021 23:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=VCtK6MeJWrRcE924S2JR9pxGgosMYU4dcOsKsyLoLCo=;
 b=hy+tDcv8WRwYExW69P6jDROsVcpLqTtTaE9fKJaX4B8VaRfoNww942qjbDi2hWFhlt
 1bLh4o+EIbvyOjLuGVHs8ySVbe6R1zI4opZomh2Tcsg1nZU3MkQSZM3dbb8BCoi4DolC
 fD7PWHREK1Lj36KNBO0K8iK5yylXDAnoPBtMyTJdUzhctLg572TYPY5rpJ1/xUtiweFi
 kKxSDFZymv75EzNHxekISz58ldsGv9FtAUe84MtXBxyZDSRyS0UBSx4T9/r9O+RlF8Rj
 5Lmp0pkpf8tGWag8ZqSgz9Y7b0k1H9owDzoxtSau9oCK069O0K/q2oR7QGGmtej8RlLS
 8KAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=VCtK6MeJWrRcE924S2JR9pxGgosMYU4dcOsKsyLoLCo=;
 b=Ff7Hu9gU/KELPQG5sY8WPt+LhGBflzkdpKVwS5rPrvuT8KiPdou6uryX9jujfYjdWt
 IDBod2prIMQ9o00gLVdP7WvJ5EUlZaOKUuq7l5aFq5Gm8fA/nX3BHpDoJwbes7DTAxdk
 oc2dd/Urkoc5BuIPBAegi1zPE94rlxcGPdUVjhNsBDF68rdAI5OMUfzbWvwQJUIIg/O1
 cxrIn3/6Vp0jt2tG1BeSUFYUfplqi0Kr8v6E2EQcBHrrkXqHRjsfOkMO0Jww7FiShRsF
 132ZqrXRJ96XZk+WNJtNZyfbGtviLxPZDeSL7rXmsjbYVCzbrWkzg6pe31JirM67ZJVU
 y5Yg==
X-Gm-Message-State: AOAM531utld6VPE2CLmKlp8Uz4DLxFcn8e+/yJunAKj/v+OZSa2CdieR
 i4UCaUzEjhOQb5tAkuMPnemgdQ==
X-Google-Smtp-Source: ABdhPJylVSqMQF3JHqZxPPlNh67nKKiXAGneLBscsFmZ8bZpgeQes2yaGfIEhx5zRgzYiZmmyVokUw==
X-Received: by 2002:a17:90a:4893:: with SMTP id
 b19mr808207pjh.193.1610522058667; 
 Tue, 12 Jan 2021 23:14:18 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id l7sm1361888pjy.29.2021.01.12.23.14.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 23:14:18 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Kito Cheng <kito.cheng@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC v4 04/16] target/riscv: rvb: logic-with-negate
Date: Wed, 13 Jan 2021 15:13:36 +0800
Message-Id: <20210113071350.24852-5-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210113071350.24852-1-frank.chang@sifive.com>
References: <20210113071350.24852-1-frank.chang@sifive.com>
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
X-List-Received-Date: Wed, 13 Jan 2021 07:14:22 -0000

From: Kito Cheng <kito.cheng@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn32.decode              |  4 ++++
 target/riscv/insn_trans/trans_rvb.c.inc | 18 ++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 0e321da37f4..d0b3f109b4e 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -598,3 +598,7 @@ vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
 clz        011000 000000 ..... 001 ..... 0010011 @r2
 ctz        011000 000001 ..... 001 ..... 0010011 @r2
 cpop       011000 000010 ..... 001 ..... 0010011 @r2
+
+andn       0100000 .......... 111 ..... 0110011 @r
+orn        0100000 .......... 110 ..... 0110011 @r
+xnor       0100000 .......... 100 ..... 0110011 @r
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index dbbd94e1015..73c4693a263 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -35,6 +35,24 @@ static bool trans_cpop(DisasContext *ctx, arg_cpop *a)
     return gen_unary(ctx, a, tcg_gen_ctpop_tl);
 }
 
+static bool trans_andn(DisasContext *ctx, arg_andn *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, tcg_gen_andc_tl);
+}
+
+static bool trans_orn(DisasContext *ctx, arg_orn *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, tcg_gen_orc_tl);
+}
+
+static bool trans_xnor(DisasContext *ctx, arg_xnor *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, tcg_gen_eqv_tl);
+}
+
 /* RV64-only instructions */
 #ifdef TARGET_RISCV64
 
-- 
2.17.1


