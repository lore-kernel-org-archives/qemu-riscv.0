Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lFTkm-0003BV-R5
	for mharc-qemu-riscv@gnu.org; Thu, 25 Feb 2021 22:25:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTkh-000388-4h
 for qemu-riscv@nongnu.org; Thu, 25 Feb 2021 22:25:16 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:36822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTkc-0002rK-PC
 for qemu-riscv@nongnu.org; Thu, 25 Feb 2021 22:25:14 -0500
Received: by mail-pf1-x42f.google.com with SMTP id l7so1122228pfd.3
 for <qemu-riscv@nongnu.org>; Thu, 25 Feb 2021 19:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=1K63dT0Tzdrjase8N2euXunPRGBjKAQzEzf7DeO2+d8=;
 b=aJF4UHKwOgKUdbPfjg0e2zm+un6zwqRncRfxpp1WkTvXbTFnb83Uv9vh0PdrR7TfH+
 ppP+HeCge+k+AKJodO/Xsxctw17ets4xj/YwImNAS62fitYFh+XLOU/szr0a62r8QNhn
 rGtJ2nydgTluMi4BV6U7sgcDHx0wAC2M8c6hJPCo28wyaEe3H8TWGL+ZVDzInO3Oa4FH
 LMl3XHugiqLfDcw0mMseNzlf3XCSu1RD6IfEnKyBYE4Vg3/oM+KqzcggrSCIBfiuMvt6
 nhd82LBOG6mgX2FLRK4KbNf+fyW7yO4er99lADotit0djv2B0UN3UDLA2ehOFUqJC0HL
 jEDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=1K63dT0Tzdrjase8N2euXunPRGBjKAQzEzf7DeO2+d8=;
 b=SEVl9bOXk4Zd92c/QlokuafV3ZNbh6oMFyZSStEU3rnOvST6i+ckLNDfO3KBebU9Ib
 WiR7GevWPBlspbuy0ohhHT9D7oiNEll36AofYrix24ec13x//1y7BTuXepigqpRuRB1H
 6I3Igoam0l4G5s/i+92QzQfNR99GBjlOtUpkHqHI7/BRAOm7UMZ31hUwjcuV6O6oroW4
 ExjDv6Ztz2DORnwBWFqAHWZ0vEos/OQG/fggbHOhTflA1KZHmY5whehs5JEfsjp4XYz1
 bgFnW4A9rsZuvqGmPFr2uiQ8MFXVTjBL7oUFEe9latjT4R4Hga9AEThb7G54Y/2uN6w7
 ZGpg==
X-Gm-Message-State: AOAM5337eyvOMP5VYWPlcykhdJ4wseEfqpEArDU162eJsRZEqYfV+2XZ
 OO8wsQPdPXW3y5pf3562BytvKw==
X-Google-Smtp-Source: ABdhPJyYwwFESwuuP+RtXJwkTVyD1rHwClYBVfz/nJpzwuD1Rens/Ij1/C2+H9ACGcRAgT6qdqa1TQ==
X-Received: by 2002:a63:d144:: with SMTP id c4mr1020250pgj.196.1614309908001; 
 Thu, 25 Feb 2021 19:25:08 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id p11sm7083709pjb.31.2021.02.25.19.25.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 19:25:07 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [PATCH v7 62/75] target/riscv: add "set round to odd" rounding mode
 helper function
Date: Fri, 26 Feb 2021 11:18:46 +0800
Message-Id: <20210226031902.23656-63-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226031902.23656-1-frank.chang@sifive.com>
References: <20210226031902.23656-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42f.google.com
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
X-List-Received-Date: Fri, 26 Feb 2021 03:25:16 -0000

From: Frank Chang <frank.chang@sifive.com>

helper_set_rounding_mode() is responsible for SIGILL, and "round to odd"
should be an interface private to translation, so add a new independent
helper_set_rod_rounding_mode().

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/fpu_helper.c | 5 +++++
 target/riscv/helper.h     | 1 +
 target/riscv/internals.h  | 1 +
 target/riscv/translate.c  | 5 +++++
 4 files changed, 12 insertions(+)

diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
index ad84aeebc1c..ac3e7b4d08f 100644
--- a/target/riscv/fpu_helper.c
+++ b/target/riscv/fpu_helper.c
@@ -81,6 +81,11 @@ void helper_set_rounding_mode(CPURISCVState *env, uint32_t rm)
     set_float_rounding_mode(softrm, &env->fp_status);
 }
 
+void helper_set_rod_rounding_mode(CPURISCVState *env)
+{
+    set_float_rounding_mode(float_round_to_odd, &env->fp_status);
+}
+
 static uint64_t do_fmadd_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2,
                            uint64_t rs3, int flags)
 {
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index e11cce3e8ea..1d52936c399 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -3,6 +3,7 @@ DEF_HELPER_2(raise_exception, noreturn, env, i32)
 
 /* Floating Point - rounding mode */
 DEF_HELPER_FLAGS_2(set_rounding_mode, TCG_CALL_NO_WG, void, env, i32)
+DEF_HELPER_FLAGS_1(set_rod_rounding_mode, TCG_CALL_NO_WG, void, env)
 
 /* Floating Point - fused */
 DEF_HELPER_FLAGS_4(fmadd_s, TCG_CALL_NO_RWG, i64, env, i64, i64, i64)
diff --git a/target/riscv/internals.h b/target/riscv/internals.h
index 469cc418c4e..6a80c067706 100644
--- a/target/riscv/internals.h
+++ b/target/riscv/internals.h
@@ -43,6 +43,7 @@ enum {
     RISCV_FRM_RUP = 3,  /* Round Up */
     RISCV_FRM_RMM = 4,  /* Round to Nearest, ties to Max Magnitude */
     RISCV_FRM_DYN = 7,  /* Dynamic rounding mode */
+    RISCV_FRM_ROD = 8,  /* Round to Odd */
 };
 
 static inline uint64_t nanbox_s(float32 f)
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index d9a794d71e8..b9da55c75a8 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -30,6 +30,7 @@
 #include "exec/log.h"
 
 #include "instmap.h"
+#include "internals.h"
 
 /* global register indices */
 static TCGv cpu_gpr[32], cpu_pc, cpu_vl;
@@ -585,6 +586,10 @@ static void gen_set_rm(DisasContext *ctx, int rm)
         return;
     }
     ctx->frm = rm;
+    if (rm == RISCV_FRM_ROD) {
+        gen_helper_set_rod_rounding_mode(cpu_env);
+        return;
+    }
     t0 = tcg_const_i32(rm);
     gen_helper_set_rounding_mode(cpu_env, t0);
     tcg_temp_free_i32(t0);
-- 
2.17.1


