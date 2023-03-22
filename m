Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pf70N-0006wC-LR
	for mharc-qemu-riscv@gnu.org; Wed, 22 Mar 2023 18:32:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf70M-0006w3-BO
 for qemu-riscv@nongnu.org; Wed, 22 Mar 2023 18:32:26 -0400
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf70A-0007LH-Bu
 for qemu-riscv@nongnu.org; Wed, 22 Mar 2023 18:32:26 -0400
Received: by mail-vs1-xe29.google.com with SMTP id h15so6258959vsh.0
 for <qemu-riscv@nongnu.org>; Wed, 22 Mar 2023 15:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679524300;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k0FXi0eyw+Va+BGFQKhZGPZaxrdiLszrUzjwuQqzCKk=;
 b=cd0iIaoi0sMRts91ivvEnbuZFNgwyucgFjoLyLyv6+ZdGaSwefdsQo11WIWK6EuWS3
 kSK1GkhylKU81DIJiq9izaOLMr+QLjfXb/fqdnzS9eMKC7tKMLlNloBQWCt7co8CLQ5O
 fuon9MRnLprEszRtePjRDQW5WU3NO+xlXKVnyxpBaCB+PbhiIKPVfRTWFNFR81Vnn/tf
 ukqLdkNXhhVMqBXm5r0S2qafCZZegGN9TUOPLddTg3r9UYxdp7ggF/Fs6cqBoByIOHSS
 KNwiNdUth1KPLOKs1XXRyvheGUDyX6rT3RFoloJRamID3wnn6SyKLkQ2M6d7gsdsKjMp
 +MDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679524300;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k0FXi0eyw+Va+BGFQKhZGPZaxrdiLszrUzjwuQqzCKk=;
 b=7hP8aXAMVEIUYur9sCGwdxR5Z1wCAickAxjVwKwu28nkimfRP8seuDGwBRmxGf0vpf
 JiniGdu7BdAfgkFNGiU4L24Jsytd3T4DouOvhN9sOH+Wy9Mc3WCnGb45Isu1beGLXYX4
 4OUX4dOZyLDsnLSZ2QzeBP5eljB98+jTYgopo0e7lMD3FBYcSRWOUvGg42HHBIpgTxJB
 EyOCYi1vQBFCy1II8sikXRugoX5Io+A6pJDJqAR5T8Bz1AGbeWOnm5611bPmO136Cub8
 7T6IycQGRecwvaEPhjLzc4DLuFscD5Rhgrp0A2dVseIHjOrwKL7YyV8Vjh66Bm0wU96m
 HnkA==
X-Gm-Message-State: AO0yUKXqQRPP9G3BeIdT+G8edIl0FdpkOY4Jxe7MN1KEJpZS1c4O3lau
 tdpBftcHvkANB9oAW2CAebrCdzDBTTrzSemha9E=
X-Google-Smtp-Source: AK7set8cBE45KvXXKfkGVFFCCQ3Xg1BdaDXigpBJUiMmmc3mpDGj6220tqdQnAFdi9bSjMAyOsBT3w==
X-Received: by 2002:a05:6870:ec89:b0:17a:f5ef:f668 with SMTP id
 eo9-20020a056870ec8900b0017af5eff668mr796713oab.27.1679523675056; 
 Wed, 22 Mar 2023 15:21:15 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 ax35-20020a05687c022300b0017243edbe5bsm5586817oac.58.2023.03.22.15.21.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 15:21:14 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v4 17/25] target/riscv: move riscv_cpu_validate_v() to
 validate_misa_ext()
Date: Wed, 22 Mar 2023 19:19:56 -0300
Message-Id: <20230322222004.357013-18-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322222004.357013-1-dbarboza@ventanamicro.com>
References: <20230322222004.357013-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e29;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-vs1-xe29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 22 Mar 2023 22:32:26 -0000

riscv_cpu_validate_v() consists of checking RVV related attributes, such
as vlen and elen, and setting env->vext_spec.

This can be done during riscv_cpu_validate_misa_ext() time, allowing us
to fail earlier if RVV constrains are not met.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index f9710dd786..399f63b42f 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1018,6 +1018,9 @@ static void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu)
 
 static void riscv_cpu_validate_misa_ext(RISCVCPU *cpu, Error **errp)
 {
+    CPURISCVState *env = &cpu->env;
+    Error *local_err = NULL;
+
     if (cpu->cfg.ext_i && cpu->cfg.ext_e) {
         error_setg(errp,
                    "I and E extensions are incompatible");
@@ -1051,6 +1054,14 @@ static void riscv_cpu_validate_misa_ext(RISCVCPU *cpu, Error **errp)
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
@@ -1088,7 +1099,6 @@ static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
 static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
 {
     CPURISCVState *env = &cpu->env;
-    Error *local_err = NULL;
     uint32_t ext = 0;
 
     if (cpu->cfg.epmp && !cpu->cfg.pmp) {
@@ -1179,14 +1189,6 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
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


