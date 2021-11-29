Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mrX31-0004Sb-Iu
	for mharc-qemu-riscv@gnu.org; Sun, 28 Nov 2021 22:09:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrX30-0004N8-BJ
 for qemu-riscv@nongnu.org; Sun, 28 Nov 2021 22:09:42 -0500
Received: from [2607:f8b0:4864:20::632] (port=35672
 helo=mail-pl1-x632.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrX2y-0000sw-D9
 for qemu-riscv@nongnu.org; Sun, 28 Nov 2021 22:09:42 -0500
Received: by mail-pl1-x632.google.com with SMTP id b13so11015210plg.2
 for <qemu-riscv@nongnu.org>; Sun, 28 Nov 2021 19:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wlXrtit4IGqo48Buh8dDpEUHuRV/jAo210kJk8OMXEc=;
 b=deQkEf0TZEEglCYRXbHgrVn7w6lU9DpwRy/tDrbgP90qhHECHwgpjqJP0hXBVEJvzg
 kRcqwWcHSbnjSPQXYlhS/nHymlScpibSjnHT95rgg1NgwL+F/UUOCibyfo05PYYbOsWt
 yrDAOgGSXJA+0ygRbSWDmI12XBZvIPYqNgAl0RNcdqzhIdwV263MCLfO8n6EGrgxHmPn
 64++VK1Hbm4B8OT5PVSMkLr8FmAXDMoZYHGlViHwn/uPDiVuGohKlLi+lFIe7hz6tYOH
 Tnd0dXN2HwGtA/XYHizjj7UybjjF+foFwbKbbUVj6zkATOP5ve7mYKQu+zf10VbU+2+W
 mR1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wlXrtit4IGqo48Buh8dDpEUHuRV/jAo210kJk8OMXEc=;
 b=VkaD+ti68qCvgMndor3EN/c+ya5S0wc4nmPQzICOorHNmVNpclOzpLm7ug6Ds1y4nB
 6w08UP9SKVnkeYyi7F7GmUOhHFVSXGjut4pmi8IKOtYexLO0QAsSMLXyz67GX+hYvVHf
 7SKigEkT41a3QlExEaPTGJu6V0TcTiXe3LJHqvbnlndlsfR7mMuEYhrhveUmMeN9N7fr
 fkstJEKx5yp3oHrt66wdKeRKLZQc2cAluloDbio7gKAAgpIPH19U0V+azZ/wnmhCIfCm
 sXX1hDgLN+V1yC7ewklKjw6C6TP8WTDrha9wRh6wV7ZR91iOcw0ac7pJVi/pSS7xDy2S
 Ko5Q==
X-Gm-Message-State: AOAM531sFhyTKCeORFYVxz13U09adPqZ4n6FA65+GhpVYGLcrmuqmEZb
 QLo84Wx2met0m4Mgt0RljCkguQ==
X-Google-Smtp-Source: ABdhPJzYP6tlIAlNVOAis5X/PP+FJgBlGncBa3wzNTQDyo89FFEfDuJdKGwIK28oqirC40ktbu8+QQ==
X-Received: by 2002:a17:90b:4a05:: with SMTP id
 kk5mr35312032pjb.232.1638155379184; 
 Sun, 28 Nov 2021 19:09:39 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id oj11sm17904040pjb.46.2021.11.28.19.09.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 19:09:38 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v10 63/77] target/riscv: add "set round to odd" rounding mode
 helper function
Date: Mon, 29 Nov 2021 11:03:23 +0800
Message-Id: <20211129030340.429689-64-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129030340.429689-1-frank.chang@sifive.com>
References: <20211129030340.429689-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::632
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x632.google.com
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
X-List-Received-Date: Mon, 29 Nov 2021 03:09:42 -0000

From: Frank Chang <frank.chang@sifive.com>

helper_set_rounding_mode() is responsible for SIGILL, and "round to odd"
should be an interface private to translation, so add a new independent
helper_set_rod_rounding_mode().

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/fpu_helper.c | 5 +++++
 target/riscv/helper.h     | 1 +
 target/riscv/internals.h  | 1 +
 target/riscv/translate.c  | 7 +++++++
 4 files changed, 14 insertions(+)

diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
index dec39d4a9ed..4a5982d5945 100644
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
 static uint64_t do_fmadd_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2,
                            uint64_t rs3, int flags)
 {
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 53cf88cd402..606bf72d5cb 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -3,6 +3,7 @@ DEF_HELPER_2(raise_exception, noreturn, env, i32)
 
 /* Floating Point - rounding mode */
 DEF_HELPER_FLAGS_2(set_rounding_mode, TCG_CALL_NO_WG, void, env, i32)
+DEF_HELPER_FLAGS_1(set_rod_rounding_mode, TCG_CALL_NO_WG, void, env)
 
 /* Floating Point - fused */
 DEF_HELPER_FLAGS_4(fmadd_s, TCG_CALL_NO_RWG, i64, env, i64, i64, i64)
diff --git a/target/riscv/internals.h b/target/riscv/internals.h
index db105d4d640..065e8162a2f 100644
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
index 3688e80d03e..b4df21bda3c 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -30,6 +30,7 @@
 #include "exec/log.h"
 
 #include "instmap.h"
+#include "internals.h"
 
 /* global register indices */
 static TCGv cpu_gpr[32], cpu_pc, cpu_vl;
@@ -403,6 +404,12 @@ static void gen_set_rm(DisasContext *ctx, int rm)
         return;
     }
     ctx->frm = rm;
+
+    if (rm == RISCV_FRM_ROD) {
+        gen_helper_set_rod_rounding_mode(cpu_env);
+        return;
+    }
+
     gen_helper_set_rounding_mode(cpu_env, tcg_constant_i32(rm));
 }
 
-- 
2.25.1


