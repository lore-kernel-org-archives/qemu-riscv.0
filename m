Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ppqnc-0001J6-Cj
	for mharc-qemu-riscv@gnu.org; Fri, 21 Apr 2023 09:27:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ppqna-0001Ht-IA
 for qemu-riscv@nongnu.org; Fri, 21 Apr 2023 09:27:38 -0400
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ppqnY-0003oS-Rc
 for qemu-riscv@nongnu.org; Fri, 21 Apr 2023 09:27:38 -0400
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-38e692c0918so1207314b6e.1
 for <qemu-riscv@nongnu.org>; Fri, 21 Apr 2023 06:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1682083655; x=1684675655;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P7xzMVD+0CBLNj31VHPyt0b4kweWZ6J3mzAMMEwrf1A=;
 b=X9DZKgyLEeNKwdewXsb+a5yViClyAa3n8NQKtstb3pDEUTAaJ8tnwC5A+A8DnzLB8T
 hC5RoMBr6y6LioZVNsjVLcr7htu2KVX55CjppCVvXm6i+Aqai0/2J7+VgSRV5nDlfyTS
 Iho0kYuVh5RSOfKC3fcjhIOt/UJmQcwF+RH2RRgNVuQYhySVHcENiedaEWMSHGbm0Etn
 7/00UOrK/Lq3RmXVxd2ay4Sp3dLDF3NkuovOICDfPD2StRdYvnO5kKaSOmFyD1MDTlnB
 EaXGRWWtIw2jEftNLPJPpnsvqXsbPrARyFZqaro74ikgVC01IDLmh0zYt1f+uiklikAT
 IliQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682083655; x=1684675655;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P7xzMVD+0CBLNj31VHPyt0b4kweWZ6J3mzAMMEwrf1A=;
 b=gx4A0yCzJpkiWyGRn80bA7gnie7sT/UqR6anPRWKj4QGhV7FmjCTO8ITmFdf+hOoIl
 AYTmn5TGMH2D4/pYG/BC8et1viN9XCx+UwSoKB2MotraR6m8NpTIQBw10e/OG6XeqCS/
 BoaLgpfoLh/bu75vZX1buJZX1vlvjCpVIxVPI/rsHiksq+eB2wZL6pc5SUAWp3VWYacT
 25XpaEbbqc79chYBYjsWD0CCtzgsc8ZcFcyNmTn6dnc7ImY0e/N0TQfTnMHQ519d+/S6
 Py3I6h/QQOi36t45eErGC4IMMNLNUHwYuhjQ2QY2s+h9ygloYbpyNHrnJUrcvpDbOjuQ
 kBwA==
X-Gm-Message-State: AAQBX9f4YBeFKn4M3rbVR0N8ime5I2KO5YqTXqoJ51sQOQJ37HkDpasT
 H/c725b//5OLerWA4YhX5em4MQ==
X-Google-Smtp-Source: AKy350aw8HuC9RGfv2UeVeMxPYKp9iCSXjswgnci7wqPOj2u+WAorvFr8JrZL9OVokVUIEs/jhHwKg==
X-Received: by 2002:aca:583:0:b0:387:2075:59b with SMTP id
 125-20020aca0583000000b003872075059bmr2583497oif.24.1682083655782; 
 Fri, 21 Apr 2023 06:27:35 -0700 (PDT)
Received: from grind.. ([191.255.108.232]) by smtp.gmail.com with ESMTPSA id
 r84-20020acada57000000b003895430852dsm1623359oig.54.2023.04.21.06.27.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 06:27:35 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v8 01/11] target/riscv/cpu.c: add riscv_cpu_validate_v()
Date: Fri, 21 Apr 2023 10:27:17 -0300
Message-Id: <20230421132727.121462-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421132727.121462-1-dbarboza@ventanamicro.com>
References: <20230421132727.121462-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22e.google.com
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
X-List-Received-Date: Fri, 21 Apr 2023 13:27:38 -0000

The RVV verification will error out if fails and it's being done at the
end of riscv_cpu_validate_set_extensions(), after we've already set some
extensions that are dependent on RVV.  Let's put it in its own function
and do it earlier.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 89 +++++++++++++++++++++++++---------------------
 1 file changed, 48 insertions(+), 41 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index befa64528f..feca13aefb 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -797,6 +797,46 @@ static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
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
  * cpu->cfg accordingly.
@@ -804,6 +844,7 @@ static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
 static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
 {
     CPURISCVState *env = &cpu->env;
+    Error *local_err = NULL;
 
     /* Do some ISA extension error checking */
     if (riscv_has_ext(env, RVG) &&
@@ -872,8 +913,14 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
-    /* The V vector extension depends on the Zve64d extension */
     if (riscv_has_ext(env, RVV)) {
+        riscv_cpu_validate_v(env, &cpu->cfg, &local_err);
+        if (local_err != NULL) {
+            error_propagate(errp, local_err);
+            return;
+        }
+
+        /* The V vector extension depends on the Zve64d extension */
         cpu->cfg.ext_zve64d = true;
     }
 
@@ -1008,46 +1055,6 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         cpu->cfg.ext_zksed = true;
         cpu->cfg.ext_zksh = true;
     }
-
-    if (riscv_has_ext(env, RVV)) {
-        int vext_version = VEXT_VERSION_1_00_0;
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
-    }
 }
 
 #ifndef CONFIG_USER_ONLY
-- 
2.40.0


