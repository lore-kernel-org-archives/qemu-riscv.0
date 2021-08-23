Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mIG33-0006kP-5V
	for mharc-qemu-riscv@gnu.org; Mon, 23 Aug 2021 15:55:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIG30-0006av-PP
 for qemu-riscv@nongnu.org; Mon, 23 Aug 2021 15:55:54 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:38606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIG2o-000391-5E
 for qemu-riscv@nongnu.org; Mon, 23 Aug 2021 15:55:54 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 om1-20020a17090b3a8100b0017941c44ce4so215577pjb.3
 for <qemu-riscv@nongnu.org>; Mon, 23 Aug 2021 12:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=40H5/R04EummmzhsS/xa91Ypx0fRpPh7Qw4dLzf/bOY=;
 b=IOLviqNLR/HtSko6IvikFv0I+2vNcAX6zuI4bLbcDaxLZOYRhyzfjv6spgR2qwqnUr
 gWYFg15T+ycaaP6sZZqm0TSwgOjwYicZfzrX/zwkcYRDnj8/i63m+cdPHfCXJHiv6ToV
 0MWqQR+qLV4penTWjFXydhgEciwm70ub5dk/kv8CySNQ8LWlJq518mJwGMVhfkljmwJU
 Sq9u0srUbx5G97CRFucRog2f0VXvW+OEGxZajnnIhWH9jM0H+H7UmMa7UmDcCOH4pbff
 2bPNsEuHgrPReVwbt/4HuC3feBlNu0DLgPaAU6Zbij/9M8dtxn5cWGOoHOlmXlAL2Eiz
 5yfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=40H5/R04EummmzhsS/xa91Ypx0fRpPh7Qw4dLzf/bOY=;
 b=cmmWYbAvVn1yVfihNI7UIs23Cy/WDUA6nH2HB5HzT8x6/OMw9MDBeCYlCopaAJp94k
 b7IQwDA8S+xLlcMGLNi2YMW169Qd1ne5h8as9K8cz56fgo7Moxv+JdNiLrysOHs9J914
 9QoOaJKZxpCP5fgNuvSGq0iQ/U5pQ4EXTl8pi02zd6vtjkt5xN4p4jgjqrCDAvYGkTXf
 iJ3nAucvH231oHOiqAO0AqpkpXb6WQQvzkTn5yU+Iq+GfECHqGwDEEchPQNU8UrW+xpZ
 TPQlOt63XAOLYF9zI9wP4M5sZE35yzcCHNUwI1Kxg+6HiD7Bnm5CHxdiJH1UVKNRmTOx
 LIKQ==
X-Gm-Message-State: AOAM531N7x9cAx02U56M5xkAzmzeQso6cfoaZ0IiEIEtDNHKmHy+BRKD
 v6wkBiOC4zFp2MFgIuUY+5C/xg==
X-Google-Smtp-Source: ABdhPJwUt5l8uX58STD19ZyRw5IB1KYn8l9TAm2c1YxSR0SwCgN+INP7ygaM0dZDJ1rnJr5t3f8Ufg==
X-Received: by 2002:a17:90a:a104:: with SMTP id
 s4mr248034pjp.184.1629748540646; 
 Mon, 23 Aug 2021 12:55:40 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id v15sm16685078pff.105.2021.08.23.12.55.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 12:55:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	bin.meng@windriver.com,
	alistair.francis@wdc.com
Subject: [PATCH v5 13/24] target/riscv: Use extracts for sraiw and srliw
Date: Mon, 23 Aug 2021 12:55:18 -0700
Message-Id: <20210823195529.560295-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210823195529.560295-1-richard.henderson@linaro.org>
References: <20210823195529.560295-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
X-List-Received-Date: Mon, 23 Aug 2021 19:55:55 -0000

These operations can be done in one instruction on some hosts.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvi.c.inc | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index e4726e618c..9e8d99be51 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -347,18 +347,28 @@ static bool trans_slliw(DisasContext *ctx, arg_slliw *a)
     return gen_shift_imm_fn(ctx, a, EXT_NONE, tcg_gen_shli_tl);
 }
 
+static void gen_srliw(TCGv dst, TCGv src, target_long shamt)
+{
+    tcg_gen_extract_tl(dst, src, shamt, 32 - shamt);
+}
+
 static bool trans_srliw(DisasContext *ctx, arg_srliw *a)
 {
     REQUIRE_64BIT(ctx);
     ctx->w = true;
-    return gen_shift_imm_fn(ctx, a, EXT_ZERO, tcg_gen_shri_tl);
+    return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_srliw);
+}
+
+static void gen_sraiw(TCGv dst, TCGv src, target_long shamt)
+{
+    tcg_gen_sextract_tl(dst, src, shamt, 32 - shamt);
 }
 
 static bool trans_sraiw(DisasContext *ctx, arg_sraiw *a)
 {
     REQUIRE_64BIT(ctx);
     ctx->w = true;
-    return gen_shift_imm_fn(ctx, a, EXT_SIGN, tcg_gen_sari_tl);
+    return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_sraiw);
 }
 
 static bool trans_addw(DisasContext *ctx, arg_addw *a)
-- 
2.25.1


