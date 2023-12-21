Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E898C35274
	for <qemu-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 10:45:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rGGUP-0001xF-9r; Thu, 21 Dec 2023 05:41:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1rGGUK-0001JY-0c; Thu, 21 Dec 2023 05:41:12 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1rGGUC-00050l-11; Thu, 21 Dec 2023 05:41:11 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40d3dfcc1a4so4100075e9.2; 
 Thu, 21 Dec 2023 02:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703155260; x=1703760060; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oN1psNxcDgJFhm/E3XNz0g2xCbvEoEyEGFOivuneCyU=;
 b=h74GrxaccqoI5lqxsRJhpvnEMGSuterge5NnO9zo6HFr+1g+l3F+IrAg7g978j2jey
 T1BhLgyngf5VRfBqT9duLB2YlY9d+LjVUrcO2nhwTJIivZ5PwUBFM+vYi1Fx7yuohHpx
 5uHuXOEjUXLJjh1+XHdVleOZr1JlYhu4tz7DyxmzKWey/n5r/rOXe7XusOkn5sh/nCRs
 FxMvOJZS3oA4iOe/D3bdOBPRcPHy734QOzmCr6h2HaNF4QKE3yf6IqgpR6oE+wfBPZF1
 SbraNuaoHQt55JuFGeVyKEdIElyQw8Cr9rCi86qCX31d38lpiiKDRP4Ey+24KnR3zGwV
 ZVsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703155260; x=1703760060;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oN1psNxcDgJFhm/E3XNz0g2xCbvEoEyEGFOivuneCyU=;
 b=LTy5IUJ/l9Cr69UHco739BpF0Y3RyoW4GVblYncACqIpPuTPKtmR+cLBsY9eGuLiia
 l5N8jR7G8T2hE8LT3HrnUn+KlAhkZ5REPixLrLrS/VgfXWQsBipoJb1Fjp7vlxPwXlfr
 mz8KY3ZozTBDq68cd7vUODWhZPH81To67+6xfyUXtJHpXGFVGQrV/QNcmts0Pnf560Lt
 JkOvxvlwTRNUhKH6OM5SVbrwqTnAahsOHW5orxS5IlSydVjAE2q8Bz9aJ0fAhcN56YX8
 tgze94ZY5eERqLk4cz5g2fi2UXoeGhJkw4u+dquHAkrlnxDb+b9nxPpO7sQPorCI5RfI
 S7aQ==
X-Gm-Message-State: AOJu0YwuqUvsxYn42HzUn0V5EStsG9XPpfoGGyf7vltrzlfUaqkUFL73
 QHjckHOJCR62altu8gHFuR4=
X-Google-Smtp-Source: AGHT+IFCRwXxGMNn1v1EJLqFVFBIACOwUkz51HM9xuwyCvCKxTfcAiKXtGR3y8zSF4opYRN7Z/Du1g==
X-Received: by 2002:a05:600c:3c85:b0:40b:5e1e:b3af with SMTP id
 bg5-20020a05600c3c8500b0040b5e1eb3afmr665879wmb.45.1703155260593; 
 Thu, 21 Dec 2023 02:41:00 -0800 (PST)
Received: from freya.midgard (broadband-188-255-126-251.ip.moscow.rt.ru.
 [188.255.126.251]) by smtp.gmail.com with ESMTPSA id
 bh20-20020a05600c3d1400b0040d15dcb77asm10633674wmb.23.2023.12.21.02.40.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Dec 2023 02:40:59 -0800 (PST)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <me@deliversmonkey.space>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com, Alistair.Francis@wdc.com,
 sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Subject: [PATCH 4/6] target/riscv: Add functions to calculate current number
 of masked bits for pointer masking
Date: Thu, 21 Dec 2023 10:40:33 +0000
Message-Id: <20231221104035.1287244-5-me@deliversmonkey.space>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231221104035.1287244-1-me@deliversmonkey.space>
References: <20231221104035.1287244-1-me@deliversmonkey.space>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=baturo.alexey@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

From: Alexey Baturo <baturo.alexey@gmail.com>

Signed-off-by: Alexey Baturo <baturo.alexey@gmail.com>
---
 target/riscv/cpu.h        |  2 ++
 target/riscv/cpu_helper.c | 49 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 51 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 2099168950..9a8e5bc022 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -679,6 +679,8 @@ static inline uint32_t vext_get_vlmax(RISCVCPU *cpu, target_ulong vtype)
 void cpu_get_tb_cpu_state(CPURISCVState *env, vaddr *pc,
                           uint64_t *cs_base, uint32_t *pflags);
 
+void riscv_cpu_update_mask(CPURISCVState *env);
+
 RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
                            target_ulong *ret_value,
                            target_ulong new_value, target_ulong write_mask);
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 79cddbd930..8e2751fef4 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -143,6 +143,55 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, vaddr *pc,
     *pflags = flags;
 }
 
+void riscv_cpu_update_mask(CPURISCVState *env)
+{
+#ifndef CONFIG_USER_ONLY
+    int priv_mode = cpu_address_mode(env);
+    int pmm = 0;
+    int pmlen = 0;
+    int satp_mode = 0;
+    if (riscv_cpu_mxl(env) == MXL_RV32) {
+        satp_mode = get_field(env->satp, SATP32_MODE);
+    } else {
+        satp_mode = get_field(env->satp, SATP64_MODE);
+    }
+    /* Get current PMM field */
+    switch (priv_mode) {
+    case PRV_M:
+        pmm = riscv_cpu_cfg(env)->ext_smmpm ?
+                  get_field(env->mseccfg, MSECCFG_PMM) : PMM_FIELD_DISABLED;
+        break;
+    case PRV_S:
+        pmm = riscv_cpu_cfg(env)->ext_smnpm ?
+                  get_field(env->menvcfg, MENVCFG_PMM) : PMM_FIELD_DISABLED;
+        break;
+    case PRV_U:
+        pmm = riscv_cpu_cfg(env)->ext_ssnpm ?
+                  get_field(env->senvcfg, SENVCFG_PMM) : PMM_FIELD_DISABLED;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    /* Get pmlen from PMM field */
+    switch (pmm) {
+    case PMM_FIELD_DISABLED:
+        pmlen = 0;
+        break;
+    case PMM_FIELD_PMLEN7:
+        pmlen = 7;
+        break;
+    case PMM_FIELD_PMLEN16:
+        pmlen = 16;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    /* in bare mode address is not sign extended */
+    env->pm_signext = (satp_mode != VM_1_10_MBARE);
+    env->pm_pmlen = pmlen;
+#endif
+}
+
 #ifndef CONFIG_USER_ONLY
 
 /*
-- 
2.34.1


