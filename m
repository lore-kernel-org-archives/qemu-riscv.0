Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D99C4706C
	for <qemu-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 12:25:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rGeYI-0001XX-Lg; Fri, 22 Dec 2023 07:22:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rGeYG-0001Wk-Fq
 for qemu-riscv@nongnu.org; Fri, 22 Dec 2023 07:22:52 -0500
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rGeYE-0005v6-Tb
 for qemu-riscv@nongnu.org; Fri, 22 Dec 2023 07:22:52 -0500
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-7b7f93eb935so76328339f.1
 for <qemu-riscv@nongnu.org>; Fri, 22 Dec 2023 04:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1703247770; x=1703852570; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Oagcc2Zv4k0si9dN/lqEsLqexrn9/qqPDiS/g5OohqM=;
 b=Pj9AhRxY43NMKAwMnp0mppNeOvbNuc+vvntrrVk7Khxs1udLlFYOmymoX0wGqEj80T
 bPPc6n1NLvF4DBSit8r3pNoPjMvZAJVK+9g+GIT0h1GmHpJq/KaHACAmDbAI+u4KqQM1
 Yo25FOQlUWeZyQFxxT+Wp7sc1q+JXs28KAC613f2RGc0tOZv7XZ3le5UKdnTU1GNdK5P
 OsE0KzWJo1+vOoKZ4pL/rSEq17Hdb5KTtKxo3yPFRERQxJ1kJQFV4Hl4QIPTSJUAgwCN
 9KIkmyHAayEUBN/FcRaTDsvEPkpC+ScMc0S2HDXxny3On0T/ACL2b9JTxEvfv/rwwxBd
 HmaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703247770; x=1703852570;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Oagcc2Zv4k0si9dN/lqEsLqexrn9/qqPDiS/g5OohqM=;
 b=WSDlTlsPJEhriOFxRtEGpe9xnf+K9WLWMeWwjcNZVqkAAL5s5mlYfJ2cgLjXBkTd3o
 I4jDp8Ox5IIcdUURUMzUEAsqxAQTRwpIhb/z3BD+9L4V+2WesSxeVyEkCqW9kxqTCLqP
 +UQS3sutvc9P8PYxMazrdtpfxwXAogv2CfO2SNb31d1QK94iPW7kJgO9MndTYsDvr1mz
 u9MhlwuaghddW7ys4uZiGhaF2rHkWoZtnwvYSiERWA1FCEa9dTmsWEjFl416uv+9U9Ep
 U8QRS6NrI24YB0Fv3/yeJQQbs+tW+nhFNzgJEcyetjD0MYTQctmYmNWeCmf5H9tlMscO
 KC/A==
X-Gm-Message-State: AOJu0Yx6G0bBaMQZl8367fwkk8RBCd4Rv2MINe1H3HpG0YQQtnlBwP/M
 /b1WnGyrHsgm0CR/aWkGGkF1NCgeYKpT8A==
X-Google-Smtp-Source: AGHT+IGGxm2zC4frts7y71/3cieGAzfB5JBJqX9EODDYa40UrW3bqCKYvm+O8BYa+KmDGdlewxyhJQ==
X-Received: by 2002:a05:6602:50:b0:7b7:abba:a0d0 with SMTP id
 z16-20020a056602005000b007b7abbaa0d0mr1204134ioz.43.1703247769819; 
 Fri, 22 Dec 2023 04:22:49 -0800 (PST)
Received: from grind.dc1.ventanamicro.com (201-69-66-51.dial-up.telesp.net.br.
 [201.69.66.51]) by smtp.gmail.com with ESMTPSA id
 g14-20020aa7874e000000b006ce7ad8c14esm3274901pfo.164.2023.12.22.04.22.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 04:22:49 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 03/16] target/riscv: make riscv_cpu_is_generic() public
Date: Fri, 22 Dec 2023 09:22:22 -0300
Message-ID: <20231222122235.545235-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231222122235.545235-1-dbarboza@ventanamicro.com>
References: <20231222122235.545235-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d30;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-io1-xd30.google.com
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

We'll use this function in target/riscv/cpu.c to implement setters that
won't allow vendor CPU options to be changed.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c         | 5 +++++
 target/riscv/cpu.h         | 1 +
 target/riscv/tcg/tcg-cpu.c | 5 -----
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 34f7616258..fb3d23b047 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -183,6 +183,11 @@ void isa_ext_update_enabled(RISCVCPU *cpu, uint32_t ext_offset, bool en)
     *ext_enabled = en;
 }
 
+bool riscv_cpu_is_generic(Object *cpu_obj)
+{
+    return object_dynamic_cast(cpu_obj, TYPE_RISCV_DYNAMIC_CPU) != NULL;
+}
+
 const char * const riscv_int_regnames[] = {
     "x0/zero", "x1/ra",  "x2/sp",  "x3/gp",  "x4/tp",  "x5/t0",   "x6/t1",
     "x7/t2",   "x8/s0",  "x9/s1",  "x10/a0", "x11/a1", "x12/a2",  "x13/a3",
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index d74b361be6..cfe965e512 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -757,6 +757,7 @@ enum riscv_pmu_event_idx {
 void isa_ext_update_enabled(RISCVCPU *cpu, uint32_t ext_offset, bool en);
 bool isa_ext_is_enabled(RISCVCPU *cpu, uint32_t ext_offset);
 void riscv_cpu_set_misa(CPURISCVState *env, RISCVMXL mxl, uint32_t ext);
+bool riscv_cpu_is_generic(Object *cpu_obj);
 
 typedef struct RISCVCPUMultiExtConfig {
     const char *name;
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 8a35683a34..a09300e908 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -658,11 +658,6 @@ bool riscv_cpu_tcg_compatible(RISCVCPU *cpu)
     return object_dynamic_cast(OBJECT(cpu), TYPE_RISCV_CPU_HOST) == NULL;
 }
 
-static bool riscv_cpu_is_generic(Object *cpu_obj)
-{
-    return object_dynamic_cast(cpu_obj, TYPE_RISCV_DYNAMIC_CPU) != NULL;
-}
-
 /*
  * We'll get here via the following path:
  *
-- 
2.43.0


