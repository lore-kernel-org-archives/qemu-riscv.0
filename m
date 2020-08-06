Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k3dTN-0004tk-2I
	for mharc-qemu-riscv@gnu.org; Thu, 06 Aug 2020 06:50:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dTK-0004od-MH
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:50:06 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:45115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dTI-00086v-7B
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:50:06 -0400
Received: by mail-pg1-x535.google.com with SMTP id x6so11304582pgx.12
 for <qemu-riscv@nongnu.org>; Thu, 06 Aug 2020 03:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=xeEh/f2ZKgHJdknnEM1RcRJ+0UpSQKEnSalo08uLJKI=;
 b=Dv9PN9rNQsUwDo8hsLGW8yOJDtDeZU6TUIgR32F48gnNkDKqdx3Nt27AJWgWcb1Yua
 nznPMppc7FAkztmhrx6ovJ3OjUhGHPIPACLyvhyys1o/f8oLgQLX3sk0t5V3IleN0CZc
 IihMYdILK6MVNM2seK+VffLsjAx0q2MEN2qm8w2fvVwDPlNNaYYKUZN0y28D483skJMO
 xRSkFZGhTG/hPTOYzslHBF1MfyDLvSgWy8krQi9IeWWgot8jtXsi64kowXbAB/l+OG8Z
 6EAlRCe4ddKYxV64gtHwtEMMtMF158GWchlL9DZ3H7rgEdsWITFZDEJFeyJvMKsEpb2M
 b6Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=xeEh/f2ZKgHJdknnEM1RcRJ+0UpSQKEnSalo08uLJKI=;
 b=d+aTlvH7MmcD3d3RZxm/EYwrdUZs770BGr20909OWH7xOI2oHRwUu5gitwt6eN6AaS
 cQOWevJwPUT/gKDjzBnER0/+RIGJ9SCCdayYqa5Tra5wDs1oY0YjSlzo9KOBY27GbIDG
 LCiOttYvdVO02jPJ04ofa6fEijWFVacWryYybpRiwFU/0QB5Vk1fuKsrkzVmQCexFdEP
 Si8s4HgpC7k4PLvJ0JoXTrDIEVye172Nahuggb2WhqtrbwWxKgRNOj7w64loT6mjX9yU
 JlCYxHCKTWBZnd8+kD5Hd+O5IydSLOHnPeWKIOyRVQRsDultFRxnYhDdFBffTn5xUdb8
 7N0Q==
X-Gm-Message-State: AOAM531irsuNPOU9v4LFI/B+0c7iprjXySWLVGGLJAjk285XmLEZQO6w
 0gMvEET5RJ95MU4ACM38wFv1Dg==
X-Google-Smtp-Source: ABdhPJyJc/V0X5Uzl09/ll+wQsS/nyyC9BcNDo8agEIU7zZnu8u27XrEmLMyU0HlCigNpL43zWz1pg==
X-Received: by 2002:a62:d10a:: with SMTP id z10mr8018029pfg.7.1596711002848;
 Thu, 06 Aug 2020 03:50:02 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id f18sm6567309pgv.84.2020.08.06.03.50.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2020 03:50:02 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v3 67/71] target/riscv: add "set round to odd" rounding mode
 helper function
Date: Thu,  6 Aug 2020 18:47:04 +0800
Message-Id: <20200806104709.13235-68-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200806104709.13235-1-frank.chang@sifive.com>
References: <20200806104709.13235-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x535.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 06 Aug 2020 10:50:07 -0000

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
index 92e076c6ed8..a01b8eab0b3 100644
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
index 7539b4a5004..b128610978d 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -3,6 +3,7 @@ DEF_HELPER_2(raise_exception, noreturn, env, i32)
 
 /* Floating Point - rounding mode */
 DEF_HELPER_FLAGS_2(set_rounding_mode, TCG_CALL_NO_WG, void, env, i32)
+DEF_HELPER_FLAGS_1(set_rod_rounding_mode, TCG_CALL_NO_WG, void, env)
 
 /* Floating Point - fused */
 DEF_HELPER_FLAGS_4(fmadd_s, TCG_CALL_NO_RWG, i64, env, i64, i64, i64)
diff --git a/target/riscv/internals.h b/target/riscv/internals.h
index 97f023361a9..785fa211955 100644
--- a/target/riscv/internals.h
+++ b/target/riscv/internals.h
@@ -45,6 +45,7 @@ enum {
     FRM_RUP = 3,    /* Round Up */
     FRM_RMM = 4,    /* Round to Nearest, ties to Max Magnitude */
     FRM_DYN = 7,    /* Dynamic rounding mode */
+    FRM_ROD = 8,    /* Round to Odd */
 };
 
 static inline uint64_t nanbox_s(float32 f)
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 3869389fe02..e1811c19792 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -30,6 +30,7 @@
 #include "exec/log.h"
 
 #include "instmap.h"
+#include "internals.h"
 
 /* global register indices */
 static TCGv cpu_gpr[32], cpu_pc, cpu_vl;
@@ -573,6 +574,10 @@ static void gen_set_rm(DisasContext *ctx, int rm)
         return;
     }
     ctx->frm = rm;
+    if (rm == FRM_ROD) {
+        gen_helper_set_rod_rounding_mode(cpu_env);
+        return;
+    }
     t0 = tcg_const_i32(rm);
     gen_helper_set_rounding_mode(cpu_env, t0);
     tcg_temp_free_i32(t0);
-- 
2.17.1


