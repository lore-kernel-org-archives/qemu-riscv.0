Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AFB6C47077
	for <qemu-riscv@archiver.kernel.org>; Tue, 16 Jan 2024 21:03:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rPqWd-0004my-1p; Tue, 16 Jan 2024 15:59:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rPqWb-0004lN-1p
 for qemu-riscv@nongnu.org; Tue, 16 Jan 2024 15:59:09 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rPqWZ-0007fC-Dd
 for qemu-riscv@nongnu.org; Tue, 16 Jan 2024 15:59:08 -0500
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1d629b4d91fso4353055ad.3
 for <qemu-riscv@nongnu.org>; Tue, 16 Jan 2024 12:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1705438746; x=1706043546; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ygFdb2B+NmJYKIgwPtLhSQiOrB7mTdyTNFjb3DCS7mI=;
 b=ISv9jZyOmLJ8Ip4EXiuMMGPPJCAyJOHx4ym4ENogznNI7rB5h8puYRGjMcuf36hs+4
 aM4mswVeaG1vlXi8fIIqpAoCsjI0HuTm5oqagm+LB6Cs7gcQBth34u22GncrSWsR1XYw
 +/A7X9etRqUmPqjfYFhI5zUY4TrCGLBWdFQYEjlXzmzmP7hqd003414FeUlkyU3BvvYR
 EWfdi9AJX8Nvuec/lxAqGlvhaI+3pMx4OYNWJSicP7H/bwnQks/OOmuekbmkDB5FrNeX
 +Bs8unLRsVo9vaKKrMO0OHbkN/W/5c7+PZvEU9LZFTwQejVVdEOpqCLBZuXG/1Ud+TpH
 mNdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705438746; x=1706043546;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ygFdb2B+NmJYKIgwPtLhSQiOrB7mTdyTNFjb3DCS7mI=;
 b=sbQCrBm4L9Gd0P6ybDwNlU3+T/iE1JV+0oFU5zAozyiTTMB7FUv+WA7cPjVrAIw6W2
 9RieRZ9QBa817Vl4QlWSelQi8g9vwIbuWpYVyJJC5AApgjAfQq2Fh8SQtxWUMf2MJnBV
 t5BamgghAT17fej9Kwqjy0TWMOH03v/XniHVTsujTx39dlRCErlyy+x2/fI1w/tEWS5u
 H/fdUUlkU6t0Gx8+KiobH7a2vtoK/Q6TZkBTrFpM1o+0npeF01/XopObT1y32yaC/7MG
 SKOJRuNUm5+S94DM/3ub9Jmr2a3Pab4I9H/2NqeYM4yLIOvBYhrk5kUvoiX7V0P9FyCz
 r2Jw==
X-Gm-Message-State: AOJu0Yzbqbf7mrdkTdizmU9ze2ioFTw3G9hqKzKKtBsdF+qCfGkZiAkL
 I91r74lYu0ISAaw/pLt7DIioLuBrOWbnGA==
X-Google-Smtp-Source: AGHT+IFPLDZS+VhTXdNNVDin8A5JRzY9S+fnx5A3qB7d0A9+2rFYFm25MpRHvcbfETdD6enbxtNbKQ==
X-Received: by 2002:a17:90a:aa17:b0:28d:530c:6e65 with SMTP id
 k23-20020a17090aaa1700b0028d530c6e65mr4130327pjq.68.1705438746175; 
 Tue, 16 Jan 2024 12:59:06 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([152.234.123.64])
 by smtp.gmail.com with ESMTPSA id
 sh2-20020a17090b524200b0028df5c748e4sm11326949pjb.44.2024.01.16.12.59.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jan 2024 12:59:05 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org, max.chou@sifive.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 13/13] target/riscv/cpu.c: remove cpu->cfg.vlen
Date: Tue, 16 Jan 2024 17:58:17 -0300
Message-ID: <20240116205817.344178-14-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240116205817.344178-1-dbarboza@ventanamicro.com>
References: <20240116205817.344178-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x630.google.com
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

There is no need to keep both 'vlen' and 'vlenb'. All existing code
that requires 'vlen' is retrieving it via 'vlenb << 3'.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu.c         | 8 +++-----
 target/riscv/cpu_cfg.h     | 1 -
 target/riscv/tcg/tcg-cpu.c | 4 +++-
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index f4261d2ffc..7b3f69d3fb 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1313,7 +1313,6 @@ static void riscv_cpu_init(Object *obj)
 
     /* Default values for non-bool cpu properties */
     cpu->cfg.pmu_mask = MAKE_64BIT_MASK(3, 16);
-    cpu->cfg.vlen = 128;
     cpu->cfg.vlenb = 128 >> 3;
     cpu->cfg.elen = 64;
     cpu->env.vext_ver = VEXT_VERSION_1_00_0;
@@ -1802,22 +1801,21 @@ static void prop_vlen_set(Object *obj, Visitor *v, const char *name,
         return;
     }
 
-    if (value != cpu->cfg.vlen && riscv_cpu_is_vendor(obj)) {
+    if (value != cpu->cfg.vlenb && riscv_cpu_is_vendor(obj)) {
         cpu_set_prop_err(cpu, name, errp);
         error_append_hint(errp, "Current '%s' val: %u\n",
-                          name, cpu->cfg.vlen);
+                          name, cpu->cfg.vlenb << 3);
         return;
     }
 
     cpu_option_add_user_setting(name, value);
-    cpu->cfg.vlen = value;
     cpu->cfg.vlenb = value >> 3;
 }
 
 static void prop_vlen_get(Object *obj, Visitor *v, const char *name,
                          void *opaque, Error **errp)
 {
-    uint16_t value = RISCV_CPU(obj)->cfg.vlen;
+    uint16_t value = RISCV_CPU(obj)->cfg.vlenb << 3;
 
     visit_type_uint16(v, name, &value, errp);
 }
diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index 50479dd72f..e241922f89 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -139,7 +139,6 @@ struct RISCVCPUConfig {
     bool ext_XVentanaCondOps;
 
     uint32_t pmu_mask;
-    uint16_t vlen;
     uint16_t vlenb;
     uint16_t elen;
     uint16_t cbom_blocksize;
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index daff0b8f60..667421b0b7 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -298,7 +298,9 @@ static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
 static void riscv_cpu_validate_v(CPURISCVState *env, RISCVCPUConfig *cfg,
                                  Error **errp)
 {
-    if (cfg->vlen > RV_VLEN_MAX || cfg->vlen < 128) {
+    uint32_t vlen = cfg->vlenb << 3;
+
+    if (vlen > RV_VLEN_MAX || vlen < 128) {
         error_setg(errp,
                    "Vector extension implementation only supports VLEN "
                    "in the range [128, %d]", RV_VLEN_MAX);
-- 
2.43.0


