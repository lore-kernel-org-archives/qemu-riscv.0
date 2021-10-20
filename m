Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1md26a-0007Cn-Dt
	for mharc-qemu-riscv@gnu.org; Tue, 19 Oct 2021 23:17:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1md26Y-00073Y-3K
 for qemu-riscv@nongnu.org; Tue, 19 Oct 2021 23:17:26 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:41709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1md26R-00014L-D4
 for qemu-riscv@nongnu.org; Tue, 19 Oct 2021 23:17:25 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 na16-20020a17090b4c1000b0019f5bb661f9so1476004pjb.0
 for <qemu-riscv@nongnu.org>; Tue, 19 Oct 2021 20:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rsNq0xlR7HN/ajZ2yGfZB2/qqFUmURGu/dng6McMdV4=;
 b=jFg9QEvNaYETsAajZqmvF2EoIF2huhUEkQDM9ohHhoXgQ0bFzWfS248lyM264++3YI
 4EGjfbMtL1V8iQqTUgSrTQ9kUtuKZeWCYknMUh900qzb3W9c71SVCpXtcpK+G9oNYDcy
 hfut32TJBpZOs8/JbfdgBw/+ejTrMjsawaxBAg4VRdWhcKwVFjGFlFhpAEk43aCiN/mq
 iGtzuEd3CIdHvhjrBhxLFrIuKxHcSAVPMvjKKQtyaIZAopS2wNvSxQ2obYATOC7e7n7e
 lRk/RPTtV1Z+0BrE7Z3Hl3k8zPqb6K571Eqf9pgKWaqSKvTCGeS1ySDnWl/AggbJkNoX
 Zujg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rsNq0xlR7HN/ajZ2yGfZB2/qqFUmURGu/dng6McMdV4=;
 b=w2WloQzmT6/YASYae5hpiWD0si9mdVvIbVVX/YcPqfpLpIttkxt/wVDezSDj1xATpd
 GySmLAZvRCAVkfn8E7iCSEXI274uYul+dLHUMZtUGrcqMpUEPHxqRRkyW9peXUvfWrI3
 wgZkmshqzntXirzEokNntlMKsuqqvsQU6jj9V56qkyKYL6nt+deKEpqyTMqFib6yoi4A
 LlVjZ9PlwR9NfJcK6AZEC/t0EWmDDIEFjwpl1rX4RQrlTmDvTs80bk2a8Rru3KtcB031
 ylvzjsq2gsF0S2UXQHdVEZgYnLEfEQKgfdpGUBvWlNGeWoHxdZRZ4RZG8MABpsBot9WM
 kSaQ==
X-Gm-Message-State: AOAM532N3Mr4zBnmsboyk5CFRTIsMdI7C2sWPyIuQ8CLOXBFFC1AsO7O
 68GW4CLXaMF3JNgCw/NwMrksxAnY1aOcaQ==
X-Google-Smtp-Source: ABdhPJxS8KFzOTDGcSpoSfLoo/m9KZhj/qNjdYrisY/DxcikB+TgRs5RDVmaK1TV/TF+SXOoP3Jvdw==
X-Received: by 2002:a17:90b:33c8:: with SMTP id
 lk8mr4425603pjb.106.1634699837930; 
 Tue, 19 Oct 2021 20:17:17 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id c8sm505364pjr.38.2021.10.19.20.17.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 20:17:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	alistair.francis@wdc.com,
	zhiwei_liu@c-sky.com
Subject: [PATCH v6 10/15] target/riscv: Use gen_arith_per_ol for RVM
Date: Tue, 19 Oct 2021 20:17:04 -0700
Message-Id: <20211020031709.359469-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211020031709.359469-1-richard.henderson@linaro.org>
References: <20211020031709.359469-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
X-List-Received-Date: Wed, 20 Oct 2021 03:17:26 -0000

The multiply high-part instructions require a separate
implementation for RV32 when TARGET_LONG_BITS == 64.

Reviewed-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c                | 16 +++++++++++++++
 target/riscv/insn_trans/trans_rvm.c.inc | 26 ++++++++++++++++++++++---
 2 files changed, 39 insertions(+), 3 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 172eea3935..8f5f39d143 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -428,6 +428,22 @@ static bool gen_arith(DisasContext *ctx, arg_r *a, DisasExtend ext,
     return true;
 }
 
+static bool gen_arith_per_ol(DisasContext *ctx, arg_r *a, DisasExtend ext,
+                             void (*f_tl)(TCGv, TCGv, TCGv),
+                             void (*f_32)(TCGv, TCGv, TCGv))
+{
+    int olen = get_olen(ctx);
+
+    if (olen != TARGET_LONG_BITS) {
+        if (olen == 32) {
+            f_tl = f_32;
+        } else {
+            g_assert_not_reached();
+        }
+    }
+    return gen_arith(ctx, a, ext, f_tl);
+}
+
 static bool gen_shift_imm_fn(DisasContext *ctx, arg_shift *a, DisasExtend ext,
                              void (*func)(TCGv, TCGv, target_long))
 {
diff --git a/target/riscv/insn_trans/trans_rvm.c.inc b/target/riscv/insn_trans/trans_rvm.c.inc
index 9a1fe3c799..2af0e5c139 100644
--- a/target/riscv/insn_trans/trans_rvm.c.inc
+++ b/target/riscv/insn_trans/trans_rvm.c.inc
@@ -33,10 +33,16 @@ static void gen_mulh(TCGv ret, TCGv s1, TCGv s2)
     tcg_temp_free(discard);
 }
 
+static void gen_mulh_w(TCGv ret, TCGv s1, TCGv s2)
+{
+    tcg_gen_mul_tl(ret, s1, s2);
+    tcg_gen_sari_tl(ret, ret, 32);
+}
+
 static bool trans_mulh(DisasContext *ctx, arg_mulh *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return gen_arith(ctx, a, EXT_NONE, gen_mulh);
+    return gen_arith_per_ol(ctx, a, EXT_SIGN, gen_mulh, gen_mulh_w);
 }
 
 static void gen_mulhsu(TCGv ret, TCGv arg1, TCGv arg2)
@@ -54,10 +60,23 @@ static void gen_mulhsu(TCGv ret, TCGv arg1, TCGv arg2)
     tcg_temp_free(rh);
 }
 
+static void gen_mulhsu_w(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv t1 = tcg_temp_new();
+    TCGv t2 = tcg_temp_new();
+
+    tcg_gen_ext32s_tl(t1, arg1);
+    tcg_gen_ext32u_tl(t2, arg2);
+    tcg_gen_mul_tl(ret, t1, t2);
+    tcg_temp_free(t1);
+    tcg_temp_free(t2);
+    tcg_gen_sari_tl(ret, ret, 32);
+}
+
 static bool trans_mulhsu(DisasContext *ctx, arg_mulhsu *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return gen_arith(ctx, a, EXT_NONE, gen_mulhsu);
+    return gen_arith_per_ol(ctx, a, EXT_NONE, gen_mulhsu, gen_mulhsu_w);
 }
 
 static void gen_mulhu(TCGv ret, TCGv s1, TCGv s2)
@@ -71,7 +90,8 @@ static void gen_mulhu(TCGv ret, TCGv s1, TCGv s2)
 static bool trans_mulhu(DisasContext *ctx, arg_mulhu *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return gen_arith(ctx, a, EXT_NONE, gen_mulhu);
+    /* gen_mulh_w works for either sign as input. */
+    return gen_arith_per_ol(ctx, a, EXT_ZERO, gen_mulhu, gen_mulh_w);
 }
 
 static void gen_div(TCGv ret, TCGv source1, TCGv source2)
-- 
2.25.1


