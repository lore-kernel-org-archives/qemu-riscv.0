Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pdcoE-0005VX-24
	for mharc-qemu-riscv@gnu.org; Sat, 18 Mar 2023 16:05:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pdco1-0005Kd-Hw
 for qemu-riscv@nongnu.org; Sat, 18 Mar 2023 16:05:34 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pdcnz-0007Bd-EX
 for qemu-riscv@nongnu.org; Sat, 18 Mar 2023 16:05:32 -0400
Received: by mail-oi1-x22a.google.com with SMTP id t10so2437768oiw.4
 for <qemu-riscv@nongnu.org>; Sat, 18 Mar 2023 13:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679169930;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jJI1LTNEi5JDEtIjvTg/4fJy3Lb5havlDQtBmIy6/Rw=;
 b=FagsUicAxTHIo/ffncRUMea8dn4sYWigY/Cjx85yJp8JlzweAcJGbtN8UQWBs9n8RK
 pRLK9StqniffKCCsPz6b4UG27kbTY6yFBVR+FoAvPrxRrYY7JVw8LTO9x0wGra5JMJJb
 GJW156PoGso7z+xdCy8Rp7BKlpzdICwoa2sjvOBqnA43+TkUWPcGMDlYJJBlAhrVJSmO
 G206+dBNIdbtcx783RJB2o3mn5NKckFUicJrOCt06a1jIRGiUAhMF1+pjtCCVhS/4R7v
 41o71MGs/5e0JOfPjzBo9vyDuqC0fyG1gC/O291p1RnZS27FUjpJLA7pMs1xt2/dXSaM
 9doA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679169930;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jJI1LTNEi5JDEtIjvTg/4fJy3Lb5havlDQtBmIy6/Rw=;
 b=glD9TMySfqP/HXXDINaA8O1ZG592LX3aT4xzWUNCqZatLJitHwdt2SM2c3UBgxAqb1
 dggI+4ONwGrTqd8Jr6c4E8HRVEbAojY0gLOkV7EV+SOBkyQvvBnVTWVoiwjnsAnWCQ/H
 R8dhYw/P39OvI3BfvCH9Y5HOQ8vq1jP1tnfnAz5UsM2KgpAhKvHWtVOzLKc03++AS5bQ
 jI4S2+JaWZoE9bMhUC5GkGYXY2QOaG59my5AUGnnJCkZgIZigo9hRUxBLCzDNvD0t3Ug
 TiknQPDm+TFdzgquEBw9nBZxNzS04LoIY2KY7Fie7wzZE76N/IIF6OVbWTwt2pzWmxrV
 xfBw==
X-Gm-Message-State: AO0yUKVDvLikxwUwL7MMjKp06o5IBZSuuQf8P3C7wVd9RE6jlWHrZ7Q8
 Ua6MRKERAxR9fJnCYZp6Ub/RSw==
X-Google-Smtp-Source: AK7set8utNVRU5XWAsrmxGtvHMv59DBC769Wz7P4cjAhOd315davIaTPyLDmf2+37Mrur/urOECZLg==
X-Received: by 2002:aca:1a09:0:b0:386:c625:5cd7 with SMTP id
 a9-20020aca1a09000000b00386c6255cd7mr3801721oia.24.1679169930514; 
 Sat, 18 Mar 2023 13:05:30 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 f69-20020a4a5848000000b004a3d98b2ccdsm2122219oob.42.2023.03.18.13.05.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Mar 2023 13:05:30 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v3 17/26] target/riscv: move riscv_cpu_validate_v() to
 validate_misa_ext()
Date: Sat, 18 Mar 2023 17:04:27 -0300
Message-Id: <20230318200436.299464-18-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318200436.299464-1-dbarboza@ventanamicro.com>
References: <20230318200436.299464-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22a.google.com
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
X-List-Received-Date: Sat, 18 Mar 2023 20:05:34 -0000

riscv_cpu_validate_v() consists of checking RVV related attributes, such
as vlen and elen, and setting env->vext_spec.

This can be done during riscv_cpu_validate_misa_ext() time, allowing us
to fail earlier if RVV constrains are not met.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index c7b05d7c4e..1116686cd1 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1027,6 +1027,9 @@ static void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu)
 
 static void riscv_cpu_validate_misa_ext(RISCVCPU *cpu, Error **errp)
 {
+    CPURISCVState *env = &cpu->env;
+    Error *local_err = NULL;
+
     if (cpu->cfg.ext_i && cpu->cfg.ext_e) {
         error_setg(errp,
                    "I and E extensions are incompatible");
@@ -1060,6 +1063,14 @@ static void riscv_cpu_validate_misa_ext(RISCVCPU *cpu, Error **errp)
         error_setg(errp, "D extension requires F extension");
         return;
     }
+
+    if (cpu->cfg.ext_v) {
+        riscv_cpu_validate_v(env, &cpu->cfg, &local_err);
+        if (local_err != NULL) {
+            error_propagate(errp, local_err);
+            return;
+        }
+    }
 }
 
 static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
@@ -1097,7 +1108,6 @@ static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
 static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
 {
     CPURISCVState *env = &cpu->env;
-    Error *local_err = NULL;
     uint32_t ext = 0;
 
     if (cpu->cfg.epmp && !cpu->cfg.pmp) {
@@ -1188,14 +1198,6 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         }
     }
 
-    if (cpu->cfg.ext_v) {
-        riscv_cpu_validate_v(env, &cpu->cfg, &local_err);
-        if (local_err != NULL) {
-            error_propagate(errp, local_err);
-            return;
-        }
-    }
-
     if (cpu->cfg.ext_zk) {
         cpu->cfg.ext_zkn = true;
         cpu->cfg.ext_zkr = true;
-- 
2.39.2


