Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mgNnX-0000Iv-TS
	for mharc-qemu-riscv@gnu.org; Fri, 29 Oct 2021 05:03:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNnW-0000Eh-8O
 for qemu-riscv@nongnu.org; Fri, 29 Oct 2021 05:03:38 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:40940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNnU-0006ho-Js
 for qemu-riscv@nongnu.org; Fri, 29 Oct 2021 05:03:37 -0400
Received: by mail-pf1-x433.google.com with SMTP id x7so3664935pfh.7
 for <qemu-riscv@nongnu.org>; Fri, 29 Oct 2021 02:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wlXrtit4IGqo48Buh8dDpEUHuRV/jAo210kJk8OMXEc=;
 b=mXU+J0p0xZwYBd0jGhW4iVQBrpURB6S3X5wi8/RqC0wlmK/X08sbIcXb0al7nqtvWC
 P4E2aRHbfPdGxZsIinN0pKHnM5SYvPF96PbjVlodcdXFg1py5JQRnMo64KVVbA0/1aCD
 T9EpnDGbUW2fEJE0kGlvyhSur9chLgWIwXim07DTZ9Eii6uovdLbkdtZO/W1Wve4fWDT
 nME7Eh17vP7gOijh1BV3y0Td+oEjLQHIEKob30wE8pFVM2E5Y3pLWqMDotIs/cB8G06J
 ZrY+sZ3sBcj3oEhWZgri5K381wJfR6zMqS2dx15Pnp5FHQOiY5jvYVe9Qo6b7rVfUokR
 42Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wlXrtit4IGqo48Buh8dDpEUHuRV/jAo210kJk8OMXEc=;
 b=5rJoH03vL7nzY+9TwIaTwTd7btOpyF4wMnoAh59VC+tnESruT8CRVxR+5+3TZ0OEuL
 Evc90ZijhhIQM9ItMw52tbg8pn+4tGpoLK4eAriE7eJhxIKgVO/0b7t4mdWwzat9J+8B
 /7w1yAYS7zv82nkQVvodHYakQFUQn0vDirFMmpS3JOFm1UWvuO4scvnIpbZz8WBP6HVI
 U7ZGQsH1oYAwXFXekIRVBPEtAl+qPZm7C5KIzDDtHAqZ5mha3d9n6Z+9dxGa31T//2q4
 TuFc86A6zMq9hdhjEkFamD4z7A9oEW8cD1fybagTJ0MPLK3SjWw/ohR0df0WpLgWZShz
 kotA==
X-Gm-Message-State: AOAM532LCJKFX12Ceu+E9MCSvlb5ZE09FG175UF2kfD+IaXxFjVsutCV
 ApsepBeUPUiYpiZQ6Pb9sR9S3Q==
X-Google-Smtp-Source: ABdhPJwiQYgQujxSFde4x4Yp7V+wk123TiU0W9azyCd7VA7r3NCNTRy1aZZWLRsEPXy457aKi1dM6Q==
X-Received: by 2002:a05:6a00:10c5:b0:47c:1d9a:c1d with SMTP id
 d5-20020a056a0010c500b0047c1d9a0c1dmr9552217pfu.75.1635498215432; 
 Fri, 29 Oct 2021 02:03:35 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:46b:ce55:983b:6962:38ac:e1b9])
 by smtp.gmail.com with ESMTPSA id t13sm5081477pgn.94.2021.10.29.02.03.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 02:03:35 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v9 63/76] target/riscv: add "set round to odd" rounding mode
 helper function
Date: Fri, 29 Oct 2021 16:59:08 +0800
Message-Id: <20211029085922.255197-64-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029085922.255197-1-frank.chang@sifive.com>
References: <20211029085922.255197-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x433.google.com
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
X-List-Received-Date: Fri, 29 Oct 2021 09:03:38 -0000

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


