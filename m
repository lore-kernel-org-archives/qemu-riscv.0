Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE336C6FA8F
	for <qemu-riscv@archiver.kernel.org>; Thu, 24 Aug 2023 22:15:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qZIcB-0008EJ-4N; Thu, 24 Aug 2023 18:15:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qZIcA-0008Db-G0
 for qemu-riscv@nongnu.org; Thu, 24 Aug 2023 18:15:42 -0400
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qZIc8-0006PD-9l
 for qemu-riscv@nongnu.org; Thu, 24 Aug 2023 18:15:42 -0400
Received: by mail-oo1-xc30.google.com with SMTP id
 006d021491bc7-5717f7b932aso242491eaf.0
 for <qemu-riscv@nongnu.org>; Thu, 24 Aug 2023 15:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1692915339; x=1693520139;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cspFA5PPCZYU+Zq3meKgQwzcujnBqn/XCZwRJ+ak9SY=;
 b=Kszg73MME3mS48mfaD/KXM+CRYhL6DBXp/iAquu95tT8nJuaK2DakKPjUMZymjQEgH
 g0tIPmDqxTaZM+mRAgtcJB18yWPlwXC+KXqBoq3WYRXFvzk+AXK536L4ZZR5ivacnQET
 +yY/lloq6LMEcKv5TjW1dJ5PhUAPsG5DsgEko69c2jdycdLEtPoRrERE4OZmlyrPmPnP
 hXdO3T+Y5S6xMq5leDJp8o451Abc4CJmr3PbangtxXmxiYJuvXO7NBiK/AKR7k424YnF
 jMi1H+vjNX+LVP1TPAdnZJxxhpgWdNcZDDZQKvdRGOoMdwNQr+RfO526dZjt4NTBNGN4
 8OGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692915339; x=1693520139;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cspFA5PPCZYU+Zq3meKgQwzcujnBqn/XCZwRJ+ak9SY=;
 b=W7MHUI5WOD/o6IRAJ8qGbkUsoYxJLd0oCUhKzTD3S28fahaoneQ/D15BFMRFeqhNiD
 QCkeUVC+iWjML+BjMe82dgZUJE/WV9gdDDf5cHf0/clwwq08CT9sN+CwXOTclWYwt3RY
 +lXkeXe4M3yxoUXWhoSd4sri6SmsT3AmhxbSgHJvNBx8SJY4GvFlWNfQ2fHBQAYxA5Al
 BCriStXvZa6MEvC5PIwCNBt4lw5+05FihcpJYW1INRHW5VCY/K4SVwhGGsu/ee7NNZsD
 h0PjTGXW6Pi4aYZ6I/cRQqEWjuyqhRON1fER+V8G46iGkolgQ9hqcqqcdCA/CzliNSe5
 sH0g==
X-Gm-Message-State: AOJu0YwRTHxaqAPNWP+NjtiBiE6xaxMGbptWTSJ1yjJ/QFExAhi0oSHE
 bzhgCEGCEY0oVsyFGlM6tAbwNA==
X-Google-Smtp-Source: AGHT+IG33cexRX2eUtfHWPl4ADheRL3kyqyFVfdL/nUKsH5kkoZoTo2+WjSXPwauv9uhazXatxh66g==
X-Received: by 2002:a4a:92d5:0:b0:566:f8ee:fa67 with SMTP id
 j21-20020a4a92d5000000b00566f8eefa67mr3667082ooh.0.1692915339264; 
 Thu, 24 Aug 2023 15:15:39 -0700 (PDT)
Received: from grind.. ([179.93.21.19]) by smtp.gmail.com with ESMTPSA id
 o129-20020a4a4487000000b00565fcfabab8sm256338ooa.21.2023.08.24.15.15.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Aug 2023 15:15:39 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH RESEND v8 20/20] target/riscv/cpu.c: consider user option with
 RVG
Date: Thu, 24 Aug 2023 19:14:40 -0300
Message-ID: <20230824221440.484675-21-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230824221440.484675-1-dbarboza@ventanamicro.com>
References: <20230824221440.484675-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c30;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Enabling RVG will enable a set of extensions that we're not checking if
the user was okay enabling or not. And in this case we want to error
out, instead of ignoring, otherwise we will be inconsistent enabling RVG
without all its extensions.

After this patch, disabling ifencei or icsr while enabling RVG will
result in error:

$ ./build/qemu-system-riscv64 -M virt -cpu rv64,g=true,Zifencei=false --nographic
qemu-system-riscv64: warning: Setting G will also set IMAFD_Zicsr_Zifencei
qemu-system-riscv64: RVG requires Zifencei but user set Zifencei to false

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index e07b2c73e7..21ebdbf084 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1155,8 +1155,22 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
           riscv_has_ext(env, RVD) &&
           cpu->cfg.ext_icsr && cpu->cfg.ext_ifencei)) {
         warn_report("Setting G will also set IMAFD_Zicsr_Zifencei");
-        cpu->cfg.ext_icsr = true;
-        cpu->cfg.ext_ifencei = true;
+
+        if (cpu_cfg_ext_is_user_set(CPU_CFG_OFFSET(ext_icsr)) &&
+            !cpu->cfg.ext_icsr) {
+            error_setg(errp, "RVG requires Zicsr but user set Zicsr to false");
+            return;
+        }
+
+        if (cpu_cfg_ext_is_user_set(CPU_CFG_OFFSET(ext_ifencei)) &&
+            !cpu->cfg.ext_ifencei) {
+            error_setg(errp, "RVG requires Zifencei but user set "
+                       "Zifencei to false");
+            return;
+        }
+
+        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_icsr), true);
+        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_ifencei), true);
 
         env->misa_ext |= RVI | RVM | RVA | RVF | RVD;
         env->misa_ext_mask |= RVI | RVM | RVA | RVF | RVD;
-- 
2.41.0


