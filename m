Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB40ECA0ED3
	for <qemu-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 13:27:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qg3Ow-00049V-Uu; Tue, 12 Sep 2023 09:25:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qg3Ou-00042p-QC
 for qemu-riscv@nongnu.org; Tue, 12 Sep 2023 09:25:56 -0400
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qg3Of-0003yx-CP
 for qemu-riscv@nongnu.org; Tue, 12 Sep 2023 09:25:56 -0400
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-6c0b40a13ebso2853110a34.0
 for <qemu-riscv@nongnu.org>; Tue, 12 Sep 2023 06:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1694525140; x=1695129940; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b6iO2bfUgyZtWhxauloKtcvAGEb6vGPXh6RDEUPqof0=;
 b=V9+GzsNCOeVb6MUL3zSVjreRfvfQqk+ce4eeLOlVA0l79yfM2jph+kRXws/uK+7EEf
 KiCRKQx3+rykI0FkLnEf9Dz+v44TXjmloSsgB8RAb/dOwOZo8EsHqEWayv905k5xQBRk
 KzznQp0eCP9DkEmHwvrxXTYXaF9yELHLUHKdZ9HneCUFBB2FVN1TNLVexUo/7A4MtoHu
 fG+JR+03mXO+nqmSNBmIb24u1+PIlrriMnQOEECQLScRUnjjn9L+dzbF9ZxEfav2lRO5
 K0hXZZa+IlW45I5Kng0/UrNcd75ExUjNsCzItA/s5tqSIq9LpO2QrgUYsEKwL2FE9tZW
 w0KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694525140; x=1695129940;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b6iO2bfUgyZtWhxauloKtcvAGEb6vGPXh6RDEUPqof0=;
 b=axZPjI3W3GUHski1hgNmzYIMR4g2kWy5L1z2MhzFHBoVAjFilqbYoNR5JRS07pkVAv
 YKj2bozHScozrpQDJlmjgAY865auMVZtn1PDhP7haCNsOMZ3mfLos6mUhemrEFMTbP/+
 v41NunwShjP67iH3nnXYxnkF7fj4QjSMaLlg3oH0BlI2U9wUoE1QKAGSNDqHKNZ/2oeq
 EIbmf3qKtrrhKAaYH9YUnp11HZZzSPbNZNwuUwco3/JPyFMM+u4MgTDzEJLT8h/0BVYw
 uu70rHY3VE9z4n1nNxsIRqC0uAFxZWjdkdY726NxWEa8YwqMmgU7xuQcvila5XT0MCrp
 NJzg==
X-Gm-Message-State: AOJu0YzAZqSMS58zQ4cM/fr7vAZWs6jM0CIx8WIWa0aKgKWHN9CFk4ZK
 Ux8DPfY4UyenSXy5LxaEAGEkvQ==
X-Google-Smtp-Source: AGHT+IF4JSmx+ozfKtiRFMjbJNbIbmpMGphRK01mXXOyJ4lnfl8TJPyHQ1boBgYzfu8nr1ejOcxdgA==
X-Received: by 2002:a05:6830:4126:b0:6be:f8b8:5945 with SMTP id
 w38-20020a056830412600b006bef8b85945mr1471401ott.19.1694525140130; 
 Tue, 12 Sep 2023 06:25:40 -0700 (PDT)
Received: from grind.. ([177.9.182.82]) by smtp.gmail.com with ESMTPSA id
 p15-20020a0568301d4f00b006af9d8af435sm3991255oth.50.2023.09.12.06.25.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Sep 2023 06:25:39 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com, philmd@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v10 20/20] target/riscv/cpu.c: consider user option with RVG
Date: Tue, 12 Sep 2023 10:24:23 -0300
Message-ID: <20230912132423.268494-21-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230912132423.268494-1-dbarboza@ventanamicro.com>
References: <20230912132423.268494-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
qemu-system-riscv64: RVG requires Zifencei but user set Zifencei to false

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/cpu.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index fb8e4d6a8f..2644638b11 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1153,9 +1153,23 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
           riscv_has_ext(env, RVA) && riscv_has_ext(env, RVF) &&
           riscv_has_ext(env, RVD) &&
           cpu->cfg.ext_icsr && cpu->cfg.ext_ifencei)) {
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
         warn_report("Setting G will also set IMAFD_Zicsr_Zifencei");
-        cpu->cfg.ext_icsr = true;
-        cpu->cfg.ext_ifencei = true;
+        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_icsr), true);
+        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_ifencei), true);
 
         env->misa_ext |= RVI | RVM | RVA | RVF | RVD;
         env->misa_ext_mask |= RVI | RVM | RVA | RVF | RVD;
-- 
2.41.0


