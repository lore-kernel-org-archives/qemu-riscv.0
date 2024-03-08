Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD801C5475B
	for <qemu-riscv@archiver.kernel.org>; Fri,  8 Mar 2024 08:12:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1riVLN-00021B-Ml; Fri, 08 Mar 2024 03:12:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1riVLF-0001x0-OD
 for qemu-riscv@nongnu.org; Fri, 08 Mar 2024 03:12:35 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1riVLC-0005nD-Hm
 for qemu-riscv@nongnu.org; Fri, 08 Mar 2024 03:12:33 -0500
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-33e1878e357so1186105f8f.3
 for <qemu-riscv@nongnu.org>; Fri, 08 Mar 2024 00:12:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1709885546; x=1710490346; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=t8cr82d7ZviMlINNX8rDDi9qfCPM32LiUykyiDy6hAc=;
 b=cwd1B7BPl9OOF5Brfhw44x4GEyggPO+Isb/Lf9K/78gzv9Iq3ahe+i/pS5OMEOds5e
 fVz8bBMGbgZBsuHLVIoJ/GKvbWQFUzSZg4IEprXbUq0B3W6M9moyP5cmLKHEuue0dEIJ
 8kxVHOaTPN1AJ2S/K2LfO0JpwqG/ivimT0DGTjcAsS9xlcIWZgIprZqj9wzVXouIyyUY
 Cg0RphI3ZJqVaEFzdv0ub9cp2/ZI74PhRPPb0TEG+XT16G5tTsktYdN7/cTz1LnwFWqL
 gtRiN8eKNJ974yPHVNVDmfc06VFF1hGe8JeyU7A3rGnHdw3jIJsdFoO4mPyprnCveRY5
 3CuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709885546; x=1710490346;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=t8cr82d7ZviMlINNX8rDDi9qfCPM32LiUykyiDy6hAc=;
 b=jOc3YQbarKDbCajEiYz5zjFoNRCa36gRyKXieCtOr7WcT2pRlTT2MoluE9pSYrZcUd
 Q+KeYiOyGDlQZlHBT3CTdFj5MELpWL9L4qKJ51srIFUwd3unOUIiT2iG0btN2Ur25eX7
 1KKYnca7OGULEwQoagSft5NYOMnTCQYuFuQ44wM9c4RcBWp+nCUSJZS5+GQjEZSl8KT4
 94BoeQA0HtOHiWGB8lcZ+GXL2ehffgjzXx4ECkx3GwhK6PnI/Czz1nhCJaa6/EhmNDDd
 UDx8romuK03052wen78aTmAGtqHa2MqHv4ITYDvqh8NOl82m4i1d0B0dQ+Oyxb4ygmcS
 Vmrg==
X-Gm-Message-State: AOJu0YwIvZJSdym6TaWP2X8MOHbY/3fSYB2+H6mZts2whKdg+nCsv/Do
 /pLdJVnLiapC12jC/X1a+lpCx5n8tM7axlu6Fx04rEGZlafajcduYbAYsmrmhi8W5u+ZqK2oO+9
 E
X-Google-Smtp-Source: AGHT+IEDvX/1+2ufAUP43jNymvQC1OV9phh0hSRl+naGr09404qvAHI1QWeq9L6el41yp4YbTQeueQ==
X-Received: by 2002:a5d:5692:0:b0:33e:7979:edc6 with SMTP id
 f18-20020a5d5692000000b0033e7979edc6mr192108wrv.15.1709885545665; 
 Fri, 08 Mar 2024 00:12:25 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 u4-20020a056000038400b0033e456f6e7csm10810731wrf.1.2024.03.08.00.12.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Mar 2024 00:12:25 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: qemu-riscv@nongnu.org
Cc: christoph.muellner@vrull.eu, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com
Subject: [PATCH] target/riscv: Raise exceptions on wrs.nto
Date: Fri,  8 Mar 2024 09:12:20 +0100
Message-ID: <20240308081219.8061-2-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=ajones@ventanamicro.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Implementing wrs.nto to always just return is consistent with the
specification, as the instruction is permitted to terminate the
stall for any reason, but it's not useful for virtualization, where
we'd like the guest to trap to the hypervisor in order to allow
scheduling of the lock holding VCPU. Change to always immediately
raise exceptions when the appropriate conditions are present,
otherwise continue to just return. Note, immediately raising
exceptions is also consistent with the specification since the
time limit that should expire prior to the exception is
implementation-specific.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/helper.h                       |  1 +
 target/riscv/insn_trans/trans_rvzawrs.c.inc | 27 ++++++++++++++-------
 target/riscv/op_helper.c                    | 11 +++++++++
 3 files changed, 30 insertions(+), 9 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 8a635238514d..451261ce5a4f 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -132,6 +132,7 @@ DEF_HELPER_6(csrrw_i128, tl, env, int, tl, tl, tl, tl)
 DEF_HELPER_1(sret, tl, env)
 DEF_HELPER_1(mret, tl, env)
 DEF_HELPER_1(wfi, void, env)
+DEF_HELPER_1(wrs_nto, void, env)
 DEF_HELPER_1(tlb_flush, void, env)
 DEF_HELPER_1(tlb_flush_all, void, env)
 /* Native Debug */
diff --git a/target/riscv/insn_trans/trans_rvzawrs.c.inc b/target/riscv/insn_trans/trans_rvzawrs.c.inc
index 32efbff4d5a5..5dfc3a943fde 100644
--- a/target/riscv/insn_trans/trans_rvzawrs.c.inc
+++ b/target/riscv/insn_trans/trans_rvzawrs.c.inc
@@ -16,7 +16,7 @@
  * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
-static bool trans_wrs(DisasContext *ctx)
+static bool trans_wrs_sto(DisasContext *ctx, arg_wrs_sto *a)
 {
     if (!ctx->cfg_ptr->ext_zawrs) {
         return false;
@@ -40,12 +40,21 @@ static bool trans_wrs(DisasContext *ctx)
     return true;
 }
 
-#define GEN_TRANS_WRS(insn)                                     \
-static bool trans_ ## insn(DisasContext *ctx, arg_ ## insn *a)  \
-{                                                               \
-    (void)a;                                                    \
-    return trans_wrs(ctx);                                      \
-}
+static bool trans_wrs_nto(DisasContext *ctx, arg_wrs_nto *a)
+{
+    if (!ctx->cfg_ptr->ext_zawrs) {
+        return false;
+    }
 
-GEN_TRANS_WRS(wrs_nto)
-GEN_TRANS_WRS(wrs_sto)
+    /*
+     * Depending on the mode of execution, mstatus.TW and hstatus.VTW, wrs.nto
+     * should raise an exception when the implementation-specific bounded time
+     * limit has expired. Our time limit is zero, so we either return
+     * immediately, as does our implementation of wrs.sto, or raise an
+     * exception, as handled by the wrs.nto helper.
+     */
+    gen_helper_wrs_nto(tcg_env);
+
+    /* We only get here when helper_wrs_nto() doesn't raise an exception. */
+    return trans_wrs_sto(ctx, NULL);
+}
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index f414aaebdbab..2baf5bc3ca19 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -380,6 +380,17 @@ void helper_wfi(CPURISCVState *env)
     }
 }
 
+void helper_wrs_nto(CPURISCVState *env)
+{
+    if (env->virt_enabled && (env->priv == PRV_S || env->priv == PRV_U) &&
+        get_field(env->hstatus, HSTATUS_VTW) &&
+        !get_field(env->mstatus, MSTATUS_TW)) {
+        riscv_raise_exception(env, RISCV_EXCP_VIRT_INSTRUCTION_FAULT, GETPC());
+    } else if (env->priv != PRV_M && get_field(env->mstatus, MSTATUS_TW)) {
+        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
+    }
+}
+
 void helper_tlb_flush(CPURISCVState *env)
 {
     CPUState *cs = env_cpu(env);
-- 
2.44.0


