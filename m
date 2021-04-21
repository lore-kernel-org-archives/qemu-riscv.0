Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lZ4G3-0006xF-Ev
	for mharc-qemu-riscv@gnu.org; Wed, 21 Apr 2021 00:14:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lZ4G1-0006vH-CK
 for qemu-riscv@nongnu.org; Wed, 21 Apr 2021 00:14:33 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:38697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lZ4Ft-00032W-Tn
 for qemu-riscv@nongnu.org; Wed, 21 Apr 2021 00:14:32 -0400
Received: by mail-pl1-x636.google.com with SMTP id o16so7291300plg.5
 for <qemu-riscv@nongnu.org>; Tue, 20 Apr 2021 21:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=RraFfTNt+SH5tIi672hGt9gZVL+nLzbf3TvbyQmG2ss=;
 b=a95mQtW1NeSrbiNnKNHnX63jx/h41efO2pSlOVTT/BzN5MNk+TgIMJtmg2DTOZLAU3
 su/O+UW19Ap+amybAAuplXruv83MPceAW6S9WGzBMNB8x/uQMbJqkDGUYZRcKuqXla0A
 aMbuOZmXGM2aqtOEMX/Zn8t0KDatRne1ZunlnbJVUDxOyDElh6q7S5zPe05in3vgvohS
 jARGuiHtDIT49r7CGDlIhcHnqfAvwFnbqXKrhf8BlZMZ4w8kxQ2lcXxl+GYlXtbapVTo
 TI5lrV3zOjZe05zHcx8PBgCDTcrddJWmAKcQQlkWfB7GnyWf7LntWyYiUAtgTxlUdFop
 Y0+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=RraFfTNt+SH5tIi672hGt9gZVL+nLzbf3TvbyQmG2ss=;
 b=jfSKG+zT93nHZH3yjJkd1HIi17/ZLN+6koIsbVj+MvFIM7RDz+NbrEVY/cnByo9XCl
 xa9s6xUuZ3U8qGb+EjW5u3GARicTL2R984oOSVWo0Rrb4rIa8ONLmPrfXbwbsebu5RxM
 7UVep1P2B0CcpJCpNjYkv7U1EhDc/yqr7Wp9AkXyhcngnwE7P3oFY83swmx2PezYd6zz
 aj7sMQI1MvqhzGhLhr0aEXNx88IOx4wMLpibEGk39Yuiw7q+cn6XhcjT22D86PJQaZcf
 6BN0Hgx/XuZxiEGgYFTjKYoIRR5cjdvDdygJ/hARZxqFp2yjRZyJPAtDPLyzkwJLzpDH
 lDGg==
X-Gm-Message-State: AOAM530VwLnjKeEPYstj50DB/pY6YDDqHXUD7Uyjzbfgt+q3KPOwKRFx
 MrVmmXOx5RUPw3b9Ap5UbFtfaA==
X-Google-Smtp-Source: ABdhPJymu6hCdw1w62+OSUDKadqsRnmLIo7uQhxJJ1p24xjp79gwpmo5d2WASW+6gYCov1w5pTFIpA==
X-Received: by 2002:a17:902:d4d0:b029:eb:59ea:2f32 with SMTP id
 o16-20020a170902d4d0b02900eb59ea2f32mr32154881plg.58.1618978464665; 
 Tue, 20 Apr 2021 21:14:24 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id jx20sm551465pjb.41.2021.04.20.21.14.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 21:14:24 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Kito Cheng <kito.cheng@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v5 06/17] target/riscv: rvb: min/max instructions
Date: Wed, 21 Apr 2021 12:13:48 +0800
Message-Id: <20210421041400.22243-7-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210421041400.22243-1-frank.chang@sifive.com>
References: <20210421041400.22243-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x636.google.com
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
X-List-Received-Date: Wed, 21 Apr 2021 04:14:33 -0000

From: Kito Cheng <kito.cheng@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn32.decode              |  4 ++++
 target/riscv/insn_trans/trans_rvb.c.inc | 24 ++++++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 7f32b8c6d15..d64326fd864 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -605,3 +605,7 @@ xnor       0100000 .......... 100 ..... 0110011 @r
 pack       0000100 .......... 100 ..... 0110011 @r
 packu      0100100 .......... 100 ..... 0110011 @r
 packh      0000100 .......... 111 ..... 0110011 @r
+min        0000101 .......... 100 ..... 0110011 @r
+minu       0000101 .......... 101 ..... 0110011 @r
+max        0000101 .......... 110 ..... 0110011 @r
+maxu       0000101 .......... 111 ..... 0110011 @r
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 2d24dafac09..2aa4515fe31 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -71,6 +71,30 @@ static bool trans_packh(DisasContext *ctx, arg_packh *a)
     return gen_arith(ctx, a, gen_packh);
 }
 
+static bool trans_min(DisasContext *ctx, arg_min *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, tcg_gen_smin_tl);
+}
+
+static bool trans_max(DisasContext *ctx, arg_max *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, tcg_gen_smax_tl);
+}
+
+static bool trans_minu(DisasContext *ctx, arg_minu *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, tcg_gen_umin_tl);
+}
+
+static bool trans_maxu(DisasContext *ctx, arg_maxu *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, tcg_gen_umax_tl);
+}
+
 /* RV64-only instructions */
 #ifdef TARGET_RISCV64
 
-- 
2.17.1


