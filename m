Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C849C001DC
	for <qemu-riscv@archiver.kernel.org>; Thu, 27 Jul 2023 22:31:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qP9BH-0001Ns-DQ; Thu, 27 Jul 2023 18:09:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qP9BG-0001NZ-DW
 for qemu-riscv@nongnu.org; Thu, 27 Jul 2023 18:09:58 -0400
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qP9BE-0004w4-TK
 for qemu-riscv@nongnu.org; Thu, 27 Jul 2023 18:09:58 -0400
Received: by mail-oo1-xc2b.google.com with SMTP id
 006d021491bc7-5657d8ecdd3so1026660eaf.1
 for <qemu-riscv@nongnu.org>; Thu, 27 Jul 2023 15:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1690495795; x=1691100595;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qRCR9Mf5plbjelwhDbaxnwtPLp8voenW02dvjtM3a34=;
 b=CWpmXPPsJxpIaoNoWN7lKrw5wmn7Co1oza0s07Vis/FlpHQ4XR8i6zShgjMIj3NxCH
 RqmPdo/AnHqmqaMuS0CAy4xFNrIcjehhb17SeYpMXPMyOkU4m2fsH/xlBeI4TBLEQMXD
 IQ+D2jDK0/pDwIUCEqon4fgQ6FIuQiJnWcC/tQhQrCJ8MR/dFToXlOQirtXXH3JRo++a
 R5QonwXp31CyPmZzv6CJRHJOuAIcL27NWqh/zOXJ9Iyg7qVTo2rQH12tVPIiajZSW522
 uJCxiazQ19TPv7QMQKwWXS1JmJ4uGNW9mNAQ3Nuzt22xmIGJnmB5f86wleaDlVO6IUHk
 ML6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690495795; x=1691100595;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qRCR9Mf5plbjelwhDbaxnwtPLp8voenW02dvjtM3a34=;
 b=kxxrYhnRYDdHicHQZfe8YX5uz+euEdZTj4qCVXjXb+y9gRoGhb9femfezTA4kK+lF1
 7V+/JJbqKY+39NbKJY9bVU7jlQywv3cXfMK5TIRKtcY0pHWBigeWblQwjk/1e0Ojq69E
 ANWgAmh9z7mjVq+FaznBqgG1iKf59IfPvziR9ao3Zenk0l1vBuhPCIMB2aKdzgipnCV5
 A/nRESDM2bs2EaoDWsU622Omt+OEuNTVdEAp7j23pLxMxhWiE/jt4G5/m3BZEYmOIwSc
 MNs9euoSbkhM9/J4q3eTE3GmoZrFkfy0+sY92KDoPTh/N1fgAbhV/pdGapbITaFWlkeE
 Egcg==
X-Gm-Message-State: ABy/qLa0gyUyzHCmbfIC6DDCbXQUfy12/Z0gQoL0Z419uV1+w7oMiPrP
 Div+76XeeEHrNmKq8HhKHTmxwQ==
X-Google-Smtp-Source: APBJJlGflDNeHSvQTDLU8AJSYQ3P+mxwnDkw41RnthKSK57DAhU49E3nV7VUyMjlyPZuEo2dRcYMTg==
X-Received: by 2002:a4a:760a:0:b0:566:f69c:a6e4 with SMTP id
 t10-20020a4a760a000000b00566f69ca6e4mr757943ooc.9.1690495795751; 
 Thu, 27 Jul 2023 15:09:55 -0700 (PDT)
Received: from grind.. (201-69-66-36.dial-up.telesp.net.br. [201.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 y136-20020a4a458e000000b0051134f333d3sm1070471ooa.16.2023.07.27.15.09.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 15:09:55 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v6 09/12] target/riscv/cpu.c: limit cfg->vext_spec log message
Date: Thu, 27 Jul 2023 19:09:24 -0300
Message-ID: <20230727220927.62950-10-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230727220927.62950-1-dbarboza@ventanamicro.com>
References: <20230727220927.62950-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc2b.google.com
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

Inside riscv_cpu_validate_v() we're always throwing a log message if the
user didn't set a vector version via 'vext_spec'.

We're going to include one case with the 'max' CPU where env->vext_ver
will be set in the cpu_init(). But that alone will not stop the "vector
version is not specified" message from appearing. The usefulness of this
log message is debatable for the generic CPUs, but for a 'max' CPU type,
where we are supposed to deliver a CPU model with all features possible,
it's strange to force users to set 'vext_spec' to get rid of this
message.

Change riscv_cpu_validate_v() to not throw this log message if
env->vext_ver is already set.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 08f61ed051..01b0d228f5 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -939,8 +939,6 @@ static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
 static void riscv_cpu_validate_v(CPURISCVState *env, RISCVCPUConfig *cfg,
                                  Error **errp)
 {
-    int vext_version = VEXT_VERSION_1_00_0;
-
     if (!is_power_of_2(cfg->vlen)) {
         error_setg(errp, "Vector extension VLEN must be power of 2");
         return;
@@ -963,17 +961,18 @@ static void riscv_cpu_validate_v(CPURISCVState *env, RISCVCPUConfig *cfg,
     }
     if (cfg->vext_spec) {
         if (!g_strcmp0(cfg->vext_spec, "v1.0")) {
-            vext_version = VEXT_VERSION_1_00_0;
+            env->vext_ver = VEXT_VERSION_1_00_0;
         } else {
             error_setg(errp, "Unsupported vector spec version '%s'",
                        cfg->vext_spec);
             return;
         }
-    } else {
+    } else if (env->vext_ver == 0) {
         qemu_log("vector version is not specified, "
                  "use the default value v1.0\n");
+
+        env->vext_ver = VEXT_VERSION_1_00_0;
     }
-    env->vext_ver = vext_version;
 }
 
 static void riscv_cpu_validate_priv_spec(RISCVCPU *cpu, Error **errp)
-- 
2.41.0


