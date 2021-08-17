Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mG6TY-0001PT-KI
	for mharc-qemu-riscv@gnu.org; Tue, 17 Aug 2021 17:18:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mG6TV-0001Es-2K
 for qemu-riscv@nongnu.org; Tue, 17 Aug 2021 17:18:21 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:41901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mG6TT-00016Z-DR
 for qemu-riscv@nongnu.org; Tue, 17 Aug 2021 17:18:20 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 fa24-20020a17090af0d8b0290178bfa69d97so999274pjb.0
 for <qemu-riscv@nongnu.org>; Tue, 17 Aug 2021 14:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FKk3gKLqNs/bvrOCnSxgsN6keLZuijuTaadD/gSjvLU=;
 b=gqPNmcPmI7gEr+l7EkTfYUEQAAmeJVHxdtfhRt1iSk63JYzFszNkICy9csYGfdJztN
 AjV/Wv9I2w0jjzoQx8P8O1FJTHy1NYIjkK5LVD0YE2kJeNeW7Lddwzq2xW2YP/hUgJnN
 ig3oS+KWk9LZc+Jj5GgCDNk+L9YbGNVFLRACf8qQMaKnKEGTLzgdxJgXd0llyLpJOAE/
 hBkj0jtrBFSOxla3hEHs1WMt4BeCIxGLhT6xXVJMTWj6RS5GtjJZ9bQ4sZy88uqhOjD6
 jeq5i4zp478ONztR6Iy4a/01Iq0ImqRuBNOl+gQPmm689rEGjb3o+VPR2wl1KzmjZik4
 BtVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FKk3gKLqNs/bvrOCnSxgsN6keLZuijuTaadD/gSjvLU=;
 b=ApsdPoQpVRvPNYCzeGOlPUWCPwjLNttZBAj6dz/GFcHLntPUUG/prHskqB0F71BYSV
 0XomFg4Q1NynJwo1DsAuQcxyj8DVW4rmU+sQT9lPjQClezS+vHE1yShJag0rHkp3lpNR
 YWfH6tdDQN0Z457UN+mVMpsb+0kNWsfl8N+vQ9DN35kOxqmo4Wdy+ZjJoYLXpipMo6Vu
 EtjqPNBzGTDJt8psSFrNcwLEZC/NyZKCm3kFVDylKupJDIVXBaMUOHlwN3GswaS0TgX5
 ZE66kryzPE1fcU9AjIkJm5bkRLtObaAYzDxpdxM6K+NYyVjUdyPj0usOiHcMDrQCi0Mg
 cAtw==
X-Gm-Message-State: AOAM533Dh8xk93lNgBCr1dst6vVmFuSTwjedSpqFVMq6NfXREw4fKjuP
 auWlaAe4z0oa4zL+VxtwZuUkxA==
X-Google-Smtp-Source: ABdhPJztC1wppeNXHzEnUvt+acAah9Z/oqeMdD71tM4S8I8wsdynEzQ7EbKZUszRB/H5cz0YdT/+Nw==
X-Received: by 2002:a17:90a:74ca:: with SMTP id
 p10mr5492667pjl.0.1629235098020; 
 Tue, 17 Aug 2021 14:18:18 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id q1sm2978637pjl.44.2021.08.17.14.18.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 14:18:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, zhiwei_liu@c-sky.com, Alistair.Francis@wdc.com,
 bin.meng@windriver.com
Subject: [PATCH v2 07/21] target/riscv: Use gen_arith for mulh and mulhu
Date: Tue, 17 Aug 2021 11:17:49 -1000
Message-Id: <20210817211803.283639-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210817211803.283639-1-richard.henderson@linaro.org>
References: <20210817211803.283639-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
X-List-Received-Date: Tue, 17 Aug 2021 21:18:21 -0000

Split out gen_mulh and gen_mulhu and use the common helper.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvm.c.inc | 40 +++++++++++--------------
 1 file changed, 18 insertions(+), 22 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvm.c.inc b/target/riscv/insn_trans/trans_rvm.c.inc
index 3d93b24c25..80552be7a3 100644
--- a/target/riscv/insn_trans/trans_rvm.c.inc
+++ b/target/riscv/insn_trans/trans_rvm.c.inc
@@ -25,20 +25,18 @@ static bool trans_mul(DisasContext *ctx, arg_mul *a)
     return gen_arith(ctx, a, EXT_NONE, tcg_gen_mul_tl);
 }
 
+static void gen_mulh(TCGv ret, TCGv s1, TCGv s2)
+{
+    TCGv discard = tcg_temp_new();
+
+    tcg_gen_muls2_tl(discard, ret, s1, s2);
+    tcg_temp_free(discard);
+}
+
 static bool trans_mulh(DisasContext *ctx, arg_mulh *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    TCGv source1 = tcg_temp_new();
-    TCGv source2 = tcg_temp_new();
-    gen_get_gpr(ctx, source1, a->rs1);
-    gen_get_gpr(ctx, source2, a->rs2);
-
-    tcg_gen_muls2_tl(source2, source1, source1, source2);
-
-    gen_set_gpr(ctx, a->rd, source1);
-    tcg_temp_free(source1);
-    tcg_temp_free(source2);
-    return true;
+    return gen_arith(ctx, a, EXT_NONE, gen_mulh);
 }
 
 static bool trans_mulhsu(DisasContext *ctx, arg_mulhsu *a)
@@ -47,20 +45,18 @@ static bool trans_mulhsu(DisasContext *ctx, arg_mulhsu *a)
     return gen_arith(ctx, a, EXT_NONE, gen_mulhsu);
 }
 
+static void gen_mulhu(TCGv ret, TCGv s1, TCGv s2)
+{
+    TCGv discard = tcg_temp_new();
+
+    tcg_gen_mulu2_tl(discard, ret, s1, s2);
+    tcg_temp_free(discard);
+}
+
 static bool trans_mulhu(DisasContext *ctx, arg_mulhu *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    TCGv source1 = tcg_temp_new();
-    TCGv source2 = tcg_temp_new();
-    gen_get_gpr(ctx, source1, a->rs1);
-    gen_get_gpr(ctx, source2, a->rs2);
-
-    tcg_gen_mulu2_tl(source2, source1, source1, source2);
-
-    gen_set_gpr(ctx, a->rd, source1);
-    tcg_temp_free(source1);
-    tcg_temp_free(source2);
-    return true;
+    return gen_arith(ctx, a, EXT_NONE, gen_mulhu);
 }
 
 static bool trans_div(DisasContext *ctx, arg_div *a)
-- 
2.25.1


