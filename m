Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzGDt-0007L9-ME
	for mharc-qemu-riscv@gnu.org; Tue, 12 Jan 2021 04:44:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGDr-0007FW-8i
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:44:19 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:33086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGDo-0008ST-Af
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:44:19 -0500
Received: by mail-pg1-x52a.google.com with SMTP id n25so1101099pgb.0
 for <qemu-riscv@nongnu.org>; Tue, 12 Jan 2021 01:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=cxtPS90g1TNqtT+i/fhh8bp1iFvCkZkvTR85JBscTqQ=;
 b=ahGue6TE5wWFxzj833qG2W27jOnB0P21SFWBVn7tXbIZkqpVxW37Jbuxb5HQ1e96qz
 yK0qx9tg4zVPP/JafDV2EO+Mw44A1CUtCpeHMEQV7Oox30vuAWh0N/OhfuVgq9M1D6Le
 yfY4J63bJA7TZZQ1sTJp5Nuf2LoluX96B044ScCFzI8vbwCy5Q8UNCqybuSUTD9B3wJD
 fT+46qWxPfPFJyVFUd8hYwZ+VSCTqFbTt9TJ+PsCuSMTbTLMdnGsSetM23nUmPn8GB19
 dJc+Ug0JKfMXHOZUazt4XxrVxUVj+Su3wJuIT1a8PHX3VqabRLi6+Nl1x1NN73AY3kYr
 VjWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=cxtPS90g1TNqtT+i/fhh8bp1iFvCkZkvTR85JBscTqQ=;
 b=NcjeefmcumDAyfK4NV0i+Zz7Gqi0FgrAa8c8mN2ZCYlfqdKr5Tz+719X7Z86HVJDqD
 kEGfCqWp7AMd/Hfp6SvCJrGy+f69j4SZLkvCZqnFEoOZKvcCr9QXU19Hwd1x9sFEt1Uy
 tD0g7uKFR2krmTHxA4bzHCbcgKsjb0+FHl2x8UFvjHoDcGxbiInG1IxmOmxQEE/uMbUy
 tNIs4/+gqQdEa0qIEbZt+JDfLBEmcQz/C9FLt+CwutDaHuc47XCgidrchmyUfM+HXXWN
 is9r7kSHN7bVTHVXL0eV6wL3ivX2cmQmL6zxsHOcLwbDFH4ZmlQX+Hglh10ig+1R1Oy2
 MuTQ==
X-Gm-Message-State: AOAM533kmUb+M6Cbm0URiERUxI4/21LFk62dA9SLRmXoFR578xk1ytxu
 W0+6xolo3gE6IKZkO6Z5LNcRsQ==
X-Google-Smtp-Source: ABdhPJxGJ/HsWhUe91vCvaJw/wwHd0pkIZc/ePrEgd3v6czv35fX8ClqO4k12VawUQWo8Uu71b4faw==
X-Received: by 2002:aa7:8d12:0:b029:1ae:4344:3b4f with SMTP id
 j18-20020aa78d120000b02901ae43443b4fmr3772045pfe.16.1610444654236; 
 Tue, 12 Jan 2021 01:44:14 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id h16sm2865664pgd.62.2021.01.12.01.44.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 01:44:13 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [PATCH v6 62/72] target/riscv: add "set round to odd" rounding mode
 helper function
Date: Tue, 12 Jan 2021 17:39:36 +0800
Message-Id: <20210112093950.17530-63-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112093950.17530-1-frank.chang@sifive.com>
References: <20210112093950.17530-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52a.google.com
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
X-List-Received-Date: Tue, 12 Jan 2021 09:44:19 -0000

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
index 511b7b868f5..2c9131271e0 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -30,6 +30,7 @@
 #include "exec/log.h"
 
 #include "instmap.h"
+#include "internals.h"
 
 /* global register indices */
 static TCGv cpu_gpr[32], cpu_pc, cpu_vl;
@@ -584,6 +585,10 @@ static void gen_set_rm(DisasContext *ctx, int rm)
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


