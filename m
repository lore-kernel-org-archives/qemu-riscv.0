Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pa0GB-00082P-4z
	for mharc-qemu-riscv@gnu.org; Wed, 08 Mar 2023 15:19:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pa0GA-000828-CT
 for qemu-riscv@nongnu.org; Wed, 08 Mar 2023 15:19:38 -0500
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pa0G8-0002SA-MP
 for qemu-riscv@nongnu.org; Wed, 08 Mar 2023 15:19:38 -0500
Received: by mail-oi1-x22f.google.com with SMTP id bk32so13099168oib.10
 for <qemu-riscv@nongnu.org>; Wed, 08 Mar 2023 12:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1678306775;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h0P1UnDjGy/z/U1aQi6eJShdM9aLBbZfiZBKn3C8EKc=;
 b=S5UztB6HOpAE75hStorc8hS8RBX+AyVbDp8ygLc3fHWFEnaG4R7KvtYWetr9KyARFn
 K0bgz4zvJimiC9bRwtTJYtUYrqajA87HJNWF0QxrqSg20U7qm7/yHe+Tj2on7zYiZv4N
 xtSE8JVUUG6fQXdu7siEQb5YL2UHldz1sVPO6KEEw0lU71RyzZbSyPT5WDs7GVkLYw2y
 bq8SZAxE9LaWbk4SYrUeNHUmqFvsm5myqXBj3O0Q3C1suFkeuZOQe5f6WSs573rSaBLI
 vHjcvSqHACX8eObX7bsgJ8g9o7o31itPQ668jX8wr5APlY/zKe42c//x/foywukZf5W4
 lMPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678306775;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h0P1UnDjGy/z/U1aQi6eJShdM9aLBbZfiZBKn3C8EKc=;
 b=Rhj6sNUnHgewhWbJ4i1jO3QiZOMh5e54lY37gXwW4JlUjVKTSD43M9nMzi1av2fZ+I
 YsbUh69xNAF17rMLVXtQw6720X4EdtsAn8F3Wc+PhsEJtej0VompD+w8PdbSgkZEZpHk
 QTvOGq3TBYM+Y3Rr0CODs0/wHvcF39fl3zapCcPuaiVE+kj6PrhqopA1bfU1zcyq6l9A
 L3IbMZWZ3c4vGyWluAuUoZa4DJ8EQ8JB1RXqLfvVjoxjgIuDHv5n/RSjLPcy4pwlkVLf
 FbRHWw05IEh97kR0GgoxmjeAwJmcNsojUOEpBWZXOpO4rF4ZxMhgERl4320qXWrZMNR2
 vsnw==
X-Gm-Message-State: AO0yUKU6APsLSdNfO6iT7Gu+8/sxvHqisrWt4Qz1hxkxOgZagfWZ/5Ux
 HjhkrHYBPCogrMFfm3D5DIyQaQ==
X-Google-Smtp-Source: AK7set8pZ5HYEkcxDHCTqvxnTmKWOK3KOP/vhuBGikudeCR/iWUWL4qIdUbMTNxsPITTXWuZTOywBA==
X-Received: by 2002:a05:6808:344:b0:384:6ae4:afe8 with SMTP id
 j4-20020a056808034400b003846ae4afe8mr9004426oie.47.1678306775420; 
 Wed, 08 Mar 2023 12:19:35 -0800 (PST)
Received: from grind.. ([177.189.53.31]) by smtp.gmail.com with ESMTPSA id
 i66-20020aca3b45000000b00383e9fa1eaasm6705790oia.43.2023.03.08.12.19.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 12:19:35 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 01/17] target/riscv/cpu.c: add riscv_cpu_validate_v()
Date: Wed,  8 Mar 2023 17:19:09 -0300
Message-Id: <20230308201925.258223-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230308201925.258223-1-dbarboza@ventanamicro.com>
References: <20230308201925.258223-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22f.google.com
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
X-List-Received-Date: Wed, 08 Mar 2023 20:19:38 -0000

The code that validates ext_v in riscv_cpu_validate_set_extensions() is
not properly indented - we're missing an extra indent level right after
the first check that uses cfg->elen.

In the end the 'v' verification is a bit too large in comparison with
the others, and can be put in a separated function to enhance the
readability of riscv_cpu_validate_set_extensions().

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 83 ++++++++++++++++++++++++++--------------------
 1 file changed, 47 insertions(+), 36 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1e97473af2..5060a98b6d 100644
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
@@ -993,44 +1033,15 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         ext |= RVH;
     }
     if (cpu->cfg.ext_v) {
-        int vext_version = VEXT_VERSION_1_00_0;
-        ext |= RVV;
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
+        Error *local_err = NULL;
+
+        riscv_cpu_validate_v(env, &cpu->cfg, &local_err);
+        if (local_err != NULL) {
+            error_propagate(errp, local_err);
             return;
         }
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
+
+        ext |= RVV;
     }
     if (cpu->cfg.ext_j) {
         ext |= RVJ;
-- 
2.39.2


