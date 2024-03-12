Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D687C54E5D
	for <qemu-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 15:29:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rk43x-0001GY-Io; Tue, 12 Mar 2024 11:29:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1rk43u-0001G0-Vv
 for qemu-riscv@nongnu.org; Tue, 12 Mar 2024 11:29:07 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1rk43t-0008Lv-2O
 for qemu-riscv@nongnu.org; Tue, 12 Mar 2024 11:29:06 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4132fbac6faso707615e9.1
 for <qemu-riscv@nongnu.org>; Tue, 12 Mar 2024 08:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1710257343; x=1710862143; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fdfyoaX7BzI6JZxjSvwGwOuDcn7YwD2XjL8BY9gz39w=;
 b=UC5MH2621W4vOfmaJrgmuFZwehshuroCsoZwUgwcur6LdaXgDkXlUTDqIZajnHU/wv
 snXb6ClxMtnT6UK9PX+2hACEsGzXbXES18h6wuJ6adnFmuORw/9MuQbj7gjJUkZyuFX8
 lDwhP2PosenPbHY78+lEnuUgvdhtqbYH6btgk+jwyGp0FsiGUdJhHp4WucqEKRGC4Kdy
 oi9ABPZ9ouaHL02hE5bdnCObE+C8Xrx9mkRnpPZPZifv3n7IvPCSLrAycvaWmsSkHpNW
 k3TFVhmUzzqo3tuULKR8NwSwzHzLZYJV097fLnCOD3Q2Y7fXLtRue0VClS0miyKBRwHG
 DTfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710257343; x=1710862143;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fdfyoaX7BzI6JZxjSvwGwOuDcn7YwD2XjL8BY9gz39w=;
 b=H5hOpy8221iDAubZcOK/88fHxNyUjCzb5EEDlDb++dE5yQU6ytHsKc+QrJsZc07iG7
 d9p5LhQ/CC4pcIERFg6YmL0hoEOrcV/KMojbAjkdFYHaG9iLpt/IA/xyoMgRRtFnHRO8
 0BqcGoWvscqCSk9PGgsHecHWOoi14uiELpb1ziD1vA8SPK6eqMf5e2Vzh7vLlyrcQY++
 FbZdnSLFpFN7sRW3ozWiRotXGqv8LOWXXkggeY6QA2AFWW2gs4hXuU6KqQmlVm9sTV2A
 JIERmTB6KkmqlEavbcuwnMSKf26O8wAdVTQTQ316wNA8v3G39hwirKoqs7AlfXyCUgHM
 v0hg==
X-Gm-Message-State: AOJu0YxYFLAw1a3Sd3xW7QDNBg1kb/Wmj/7s8/EPr0zMEi1l1kakVzGK
 3Fb9SutSjUP6dIqtgxa4qHgkpQNp13Dqshb1iUW6xoXMo9uMMEXXF5Vsnn0H6cbEyOxH6QVVEOW
 D
X-Google-Smtp-Source: AGHT+IEMVvBG1trq4oHGwz3n/eCRKW3FlzlK2ZesFAVbFksLLliAoZa2Ek7Nmx9UHnXWfcPiRvk6Cg==
X-Received: by 2002:a05:600c:5013:b0:413:335a:aed1 with SMTP id
 n19-20020a05600c501300b00413335aaed1mr399177wmr.23.1710257342955; 
 Tue, 12 Mar 2024 08:29:02 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 jg4-20020a05600ca00400b004134540ae3asm1968327wmb.3.2024.03.12.08.29.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Mar 2024 08:29:02 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: qemu-riscv@nongnu.org
Cc: christoph.muellner@vrull.eu, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com
Subject: [PATCH v2] target/riscv: Raise exceptions on wrs.nto
Date: Tue, 12 Mar 2024 16:29:02 +0100
Message-ID: <20240312152901.512001-2-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reviewed-by: Christoph Müllner <christoph.muellner@vrull.eu>
---
v2:
 - Added #ifndef CONFIG_USER_ONLY around helper call

 target/riscv/helper.h                       |  1 +
 target/riscv/insn_trans/trans_rvzawrs.c.inc | 29 ++++++++++++++-------
 target/riscv/op_helper.c                    | 11 ++++++++
 3 files changed, 32 insertions(+), 9 deletions(-)

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
index 32efbff4d5a5..0eef03383889 100644
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
@@ -40,12 +40,23 @@ static bool trans_wrs(DisasContext *ctx)
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
+#ifndef CONFIG_USER_ONLY
+    gen_helper_wrs_nto(tcg_env);
+#endif
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


