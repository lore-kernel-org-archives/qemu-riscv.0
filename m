Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pdcnJ-0004xz-9R
	for mharc-qemu-riscv@gnu.org; Sat, 18 Mar 2023 16:04:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pdcnH-0004xe-V6
 for qemu-riscv@nongnu.org; Sat, 18 Mar 2023 16:04:48 -0400
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pdcnG-0006qU-4p
 for qemu-riscv@nongnu.org; Sat, 18 Mar 2023 16:04:47 -0400
Received: by mail-ot1-x32a.google.com with SMTP id
 w21-20020a9d6755000000b00698853a52c7so4706772otm.11
 for <qemu-riscv@nongnu.org>; Sat, 18 Mar 2023 13:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679169885;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NyW3QIKPbWEcW/stEjEFae0dbXr8H0CnZzp+jGMhTkc=;
 b=G8ExofvWDhtyXrbAoz1uAtVwL+icirHm8bCabNE+JWHPLXluA91ce4+wd2ytneG36q
 iJ9Hi3O6k07oUo+mxMty5D34ZUhmP704y3m6iPQAnOg3Z+jWGPDGyTb4mC2RR8i9uis/
 oT/vJnZwwazNbHtxERoLav3WjC9FaiDilEJKOAGhnvvu4lONHeRWj9eomPDQoLJNygtE
 xW/mMJHXNUIWAgMppqGu077v9c+rZWEKLhCJOuJDoRB7UzzPlEEb2AIZNwC1pMPyF26Y
 M81vnCQSjZFj9cYqcPBIcAjw7ItKXN7zkZ8LmCVTBB1wRHj+bZzORcV1I9hz00j4wVHU
 Ty+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679169885;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NyW3QIKPbWEcW/stEjEFae0dbXr8H0CnZzp+jGMhTkc=;
 b=NnRwDcNpd8XcI3Ph6azpCUGnvPXr3ncnJBILKKITAizre0IwbQJLV3MUgVxmvaawgn
 u0YrGvDJCDV1Lzem9FgU8jY2hm8cyKf3Tfy4EOFqR2duVGyRNK3V01rvJvwUO5BWUtc8
 PkG84OpM9u/5rOaDqsIM3MhaMdAUrDmPngx73Qp3pLeC6lHU5CyF2erXi3dzPPOFau4O
 8US+FOuVtptgo6sMCWIPkR/mjb52EimPACjoJXddGQTO9TrNWoZaeBS87Qr/azt03T40
 CxUblLxSF6kT0cZJhvGEJi1FesYx66Kch7EUUSqrwCssVB9dlO90DckhjD0QWHuIEv/V
 NIdg==
X-Gm-Message-State: AO0yUKWu0PavJN9WpLCz0QHwJY5dm12aQ0fdzEVqjaCbAxECiPlLH3Jo
 iyS1SpAeJiLRDT81qOhuP6hbqw==
X-Google-Smtp-Source: AK7set9eymZLw0/gOoPqYZL3KgCBxbvTYd4yzZEq3m5Amja4UDwF1HDZjfUtjqWt85TrTbswgRj7iw==
X-Received: by 2002:a9d:1b5:0:b0:69b:1665:8fb3 with SMTP id
 e50-20020a9d01b5000000b0069b16658fb3mr1295790ote.15.1679169885232; 
 Sat, 18 Mar 2023 13:04:45 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 f69-20020a4a5848000000b004a3d98b2ccdsm2122219oob.42.2023.03.18.13.04.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Mar 2023 13:04:44 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v3 01/26] target/riscv/cpu.c: add
 riscv_cpu_validate_v()
Date: Sat, 18 Mar 2023 17:04:11 -0300
Message-Id: <20230318200436.299464-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318200436.299464-1-dbarboza@ventanamicro.com>
References: <20230318200436.299464-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32a.google.com
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
X-List-Received-Date: Sat, 18 Mar 2023 20:04:48 -0000

The RVV verification will error out if fails and it's being done at the
end of riscv_cpu_validate_set_extensions(). Let's put it in its own
function and do it earlier.

We'll move it out of riscv_cpu_validate_set_extensions() in the near future,
but for now this is enough to clean the code a bit.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 86 ++++++++++++++++++++++++++--------------------
 1 file changed, 49 insertions(+), 37 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1e97473af2..18591aa53a 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -802,6 +802,46 @@ static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
     }
 }
 
+static void riscv_cpu_validate_v(CPURISCVState *env, RISCVCPUConfig *cfg,
+                                 Error **errp)
+{
+    int vext_version = VEXT_VERSION_1_00_0;
+
+    if (!is_power_of_2(cfg->vlen)) {
+        error_setg(errp, "Vector extension VLEN must be power of 2");
+        return;
+    }
+    if (cfg->vlen > RV_VLEN_MAX || cfg->vlen < 128) {
+        error_setg(errp,
+                   "Vector extension implementation only supports VLEN "
+                   "in the range [128, %d]", RV_VLEN_MAX);
+        return;
+    }
+    if (!is_power_of_2(cfg->elen)) {
+        error_setg(errp, "Vector extension ELEN must be power of 2");
+        return;
+    }
+    if (cfg->elen > 64 || cfg->elen < 8) {
+        error_setg(errp,
+                   "Vector extension implementation only supports ELEN "
+                   "in the range [8, 64]");
+        return;
+    }
+    if (cfg->vext_spec) {
+        if (!g_strcmp0(cfg->vext_spec, "v1.0")) {
+            vext_version = VEXT_VERSION_1_00_0;
+        } else {
+            error_setg(errp, "Unsupported vector spec version '%s'",
+                       cfg->vext_spec);
+            return;
+        }
+    } else {
+        qemu_log("vector version is not specified, "
+                 "use the default value v1.0\n");
+    }
+    set_vext_version(env, vext_version);
+}
+
 /*
  * Check consistency between chosen extensions while setting
  * cpu->cfg accordingly, doing a set_misa() in the end.
@@ -809,6 +849,7 @@ static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
 static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
 {
     CPURISCVState *env = &cpu->env;
+    Error *local_err = NULL;
     uint32_t ext = 0;
 
     /* Do some ISA extension error checking */
@@ -939,6 +980,14 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         }
     }
 
+    if (cpu->cfg.ext_v) {
+        riscv_cpu_validate_v(env, &cpu->cfg, &local_err);
+        if (local_err != NULL) {
+            error_propagate(errp, local_err);
+            return;
+        }
+    }
+
     if (cpu->cfg.ext_zk) {
         cpu->cfg.ext_zkn = true;
         cpu->cfg.ext_zkr = true;
@@ -993,44 +1042,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         ext |= RVH;
     }
     if (cpu->cfg.ext_v) {
-        int vext_version = VEXT_VERSION_1_00_0;
         ext |= RVV;
-        if (!is_power_of_2(cpu->cfg.vlen)) {
-            error_setg(errp,
-                       "Vector extension VLEN must be power of 2");
-            return;
-        }
-        if (cpu->cfg.vlen > RV_VLEN_MAX || cpu->cfg.vlen < 128) {
-            error_setg(errp,
-                       "Vector extension implementation only supports VLEN "
-                       "in the range [128, %d]", RV_VLEN_MAX);
-            return;
-        }
-        if (!is_power_of_2(cpu->cfg.elen)) {
-            error_setg(errp,
-                       "Vector extension ELEN must be power of 2");
-            return;
-        }
-        if (cpu->cfg.elen > 64 || cpu->cfg.elen < 8) {
-            error_setg(errp,
-                       "Vector extension implementation only supports ELEN "
-                       "in the range [8, 64]");
-            return;
-        }
-        if (cpu->cfg.vext_spec) {
-            if (!g_strcmp0(cpu->cfg.vext_spec, "v1.0")) {
-                vext_version = VEXT_VERSION_1_00_0;
-            } else {
-                error_setg(errp,
-                           "Unsupported vector spec version '%s'",
-                           cpu->cfg.vext_spec);
-                return;
-            }
-        } else {
-            qemu_log("vector version is not specified, "
-                     "use the default value v1.0\n");
-        }
-        set_vext_version(env, vext_version);
     }
     if (cpu->cfg.ext_j) {
         ext |= RVJ;
-- 
2.39.2


