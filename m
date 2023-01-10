Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pFL0y-0003Sx-GD
	for mharc-qemu-riscv@gnu.org; Tue, 10 Jan 2023 15:14:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pFL0o-0003OD-5G
 for qemu-riscv@nongnu.org; Tue, 10 Jan 2023 15:14:23 -0500
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pFL0k-0000q5-8b
 for qemu-riscv@nongnu.org; Tue, 10 Jan 2023 15:14:21 -0500
Received: by mail-ot1-x32c.google.com with SMTP id
 k7-20020a056830168700b0067832816190so7663419otr.1
 for <qemu-riscv@nongnu.org>; Tue, 10 Jan 2023 12:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EUfZtab7ItHi76p6G7etytF2gLMXOVfh6cZM4zDyA+o=;
 b=EVAqj53DJCHmN+azr7GDjAh+IWeksVHmwJR+hgUdEf88ikQVV6CW9ssQzjW40XKqgf
 xCsB0KdsG5d4xUVfg3MO0LYEXbj05xLSMzrHpm2131ioCAonsUNcbabJCE1EnG6kz115
 cUgKErY0ypktYIE8glq93/Yaih+f9HhMYsghA0ge94+IErrZA+8BpejYI9LoMzjU1nUf
 bTsn+ADr16TYPeQxrOg7umAJYtSLEhuFId+fJl8fyJdH7Vq1KfiQvQ4y09Xd4BHMxJU0
 zDEf8oTh+cSd0qwvvF+F/+KzBcIhtDu6wBEvoL2O/yG3t3hpqyFy7ig+8RVZsNyNcIK5
 /1dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EUfZtab7ItHi76p6G7etytF2gLMXOVfh6cZM4zDyA+o=;
 b=Xdk0DGWknUa0WE2FfPwgFv26GHJ3CyVSLe8gYeuVVWOlgwVEfrZoOZvC8afr91eaj0
 PzdvgU0fTVpdZ0MK/diEIxWkK4pNq5VM4pXXPZz6MuzLl+TNYZzjJSeGRCTcAe8keVrJ
 fjhZ1qpK2yKRVRBKxQBOX22LFFxashELXBUCjv1OXrKSmJPXQhwT7ol4rS04hK4HoJyS
 bLgV4w7mzbhsoTughqvGXt956G17OX4yIbBBTJvFVI6WCwj+PKno14nKH9v/dNoGx54x
 TBC5rbDLSEpvF8a+qeOYzYwlzhUsAQvZhP4i4HsJ/u855NZwml1MxgnbitP0bfYUQTuw
 zQjw==
X-Gm-Message-State: AFqh2kq07H201A/DdgfnCrF4PSpUTNfy/xb9qMDrdldUpah5opi2g3fy
 vM0pdyrLLnYZg/RzDPRFyxDR+A==
X-Google-Smtp-Source: AMrXdXvWFnFYRTcT8IvBX+R578K2qTe9KKbtdGKXgtbtP7X78kW4Vd1aGjqik8S3omTeAKmCGolvZw==
X-Received: by 2002:a9d:4685:0:b0:66e:c096:126c with SMTP id
 z5-20020a9d4685000000b0066ec096126cmr36461010ote.29.1673381656770; 
 Tue, 10 Jan 2023 12:14:16 -0800 (PST)
Received: from grind.. ([152.250.93.24]) by smtp.gmail.com with ESMTPSA id
 l21-20020a9d7a95000000b0067c87f23476sm6453978otn.57.2023.01.10.12.14.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 12:14:16 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 richard.henderson@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 2/2] target/riscv/cpu.c: do not skip misa logic in
 riscv_cpu_realize()
Date: Tue, 10 Jan 2023 17:14:05 -0300
Message-Id: <20230110201405.247785-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230110201405.247785-1-dbarboza@ventanamicro.com>
References: <20230110201405.247785-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32c.google.com
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
X-List-Received-Date: Tue, 10 Jan 2023 20:14:25 -0000

All RISCV CPUs are setting cpu->cfg during their cpu_init() functions,
meaning that there's no reason to skip all the misa validation and setup
if misa_ext was set beforehand - especially since we're setting an
updated value in set_misa() in the end.

Put this code chunk into a new riscv_cpu_validate_set_extensions()
helper and always execute it regardless of what the board set in
env->misa_ext.

This will put more responsibility in how each board is going to init
their attributes and extensions if they're not using the defaults.
It'll also allow realize() to do its job looking only at the extensions
enabled per se, not corner cases that some CPUs might have, and we won't
have to change multiple code paths to fix or change how extensions work.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 485 +++++++++++++++++++++++----------------------
 1 file changed, 248 insertions(+), 237 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index b8c1edb7c2..33ed59a1b6 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -631,6 +631,250 @@ static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
     }
 }
 
+/*
+ * Check consistency between chosen extensions while setting
+ * cpu->cfg accordingly, doing a set_misa() in the end.
+ */
+static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
+{
+    CPURISCVState *env = &cpu->env;
+    uint32_t ext = 0;
+
+    /* Do some ISA extension error checking */
+    if (cpu->cfg.ext_g && !(cpu->cfg.ext_i && cpu->cfg.ext_m &&
+                            cpu->cfg.ext_a && cpu->cfg.ext_f &&
+                            cpu->cfg.ext_d &&
+                            cpu->cfg.ext_icsr && cpu->cfg.ext_ifencei)) {
+        warn_report("Setting G will also set IMAFD_Zicsr_Zifencei");
+        cpu->cfg.ext_i = true;
+        cpu->cfg.ext_m = true;
+        cpu->cfg.ext_a = true;
+        cpu->cfg.ext_f = true;
+        cpu->cfg.ext_d = true;
+        cpu->cfg.ext_icsr = true;
+        cpu->cfg.ext_ifencei = true;
+    }
+
+    if (cpu->cfg.ext_i && cpu->cfg.ext_e) {
+        error_setg(errp,
+                   "I and E extensions are incompatible");
+        return;
+    }
+
+    if (!cpu->cfg.ext_i && !cpu->cfg.ext_e) {
+        error_setg(errp,
+                   "Either I or E extension must be set");
+        return;
+    }
+
+    if (cpu->cfg.ext_s && !cpu->cfg.ext_u) {
+        error_setg(errp,
+                   "Setting S extension without U extension is illegal");
+        return;
+    }
+
+    if (cpu->cfg.ext_h && !cpu->cfg.ext_i) {
+        error_setg(errp,
+                   "H depends on an I base integer ISA with 32 x registers");
+        return;
+    }
+
+    if (cpu->cfg.ext_h && !cpu->cfg.ext_s) {
+        error_setg(errp, "H extension implicitly requires S-mode");
+        return;
+    }
+
+    if (cpu->cfg.ext_f && !cpu->cfg.ext_icsr) {
+        error_setg(errp, "F extension requires Zicsr");
+        return;
+    }
+
+    if ((cpu->cfg.ext_zawrs) && !cpu->cfg.ext_a) {
+        error_setg(errp, "Zawrs extension requires A extension");
+        return;
+    }
+
+    if ((cpu->cfg.ext_zfh || cpu->cfg.ext_zfhmin) && !cpu->cfg.ext_f) {
+        error_setg(errp, "Zfh/Zfhmin extensions require F extension");
+        return;
+    }
+
+    if (cpu->cfg.ext_d && !cpu->cfg.ext_f) {
+        error_setg(errp, "D extension requires F extension");
+        return;
+    }
+
+    if (cpu->cfg.ext_v && !cpu->cfg.ext_d) {
+        error_setg(errp, "V extension requires D extension");
+        return;
+    }
+
+    if ((cpu->cfg.ext_zve32f || cpu->cfg.ext_zve64f) && !cpu->cfg.ext_f) {
+        error_setg(errp, "Zve32f/Zve64f extensions require F extension");
+        return;
+    }
+
+    /* Set the ISA extensions, checks should have happened above */
+    if (cpu->cfg.ext_zdinx || cpu->cfg.ext_zhinx ||
+        cpu->cfg.ext_zhinxmin) {
+        cpu->cfg.ext_zfinx = true;
+    }
+
+    if (cpu->cfg.ext_zfinx) {
+        if (!cpu->cfg.ext_icsr) {
+            error_setg(errp, "Zfinx extension requires Zicsr");
+            return;
+        }
+        if (cpu->cfg.ext_f) {
+            error_setg(errp,
+                "Zfinx cannot be supported together with F extension");
+            return;
+        }
+    }
+
+    if (cpu->cfg.ext_c) {
+        cpu->cfg.ext_zca = true;
+        if (cpu->cfg.ext_f && env->misa_mxl_max == MXL_RV32) {
+            cpu->cfg.ext_zcf = true;
+        }
+        if (cpu->cfg.ext_d) {
+            cpu->cfg.ext_zcd = true;
+        }
+    }
+
+    if (env->misa_mxl_max != MXL_RV32 && cpu->cfg.ext_zcf) {
+        error_setg(errp, "Zcf extension is only relevant to RV32");
+        return;
+    }
+
+    if (!cpu->cfg.ext_f && cpu->cfg.ext_zcf) {
+        error_setg(errp, "Zcf extension requires F extension");
+        return;
+    }
+
+    if (!cpu->cfg.ext_d && cpu->cfg.ext_zcd) {
+        error_setg(errp, "Zcd extension requires D extension");
+        return;
+    }
+
+    if ((cpu->cfg.ext_zcf || cpu->cfg.ext_zcd || cpu->cfg.ext_zcb ||
+         cpu->cfg.ext_zcmp || cpu->cfg.ext_zcmt) && !cpu->cfg.ext_zca) {
+        error_setg(errp, "Zcf/Zcd/Zcb/Zcmp/Zcmt extensions require Zca "
+                         "extension");
+        return;
+    }
+
+    if (cpu->cfg.ext_zcd && (cpu->cfg.ext_zcmp || cpu->cfg.ext_zcmt)) {
+        error_setg(errp, "Zcmp/Zcmt extensions are incompatible with "
+                         "Zcd extension");
+        return;
+    }
+
+    if (cpu->cfg.ext_zcmt && !cpu->cfg.ext_icsr) {
+        error_setg(errp, "Zcmt extension requires Zicsr extension");
+        return;
+    }
+
+    if (cpu->cfg.ext_zk) {
+        cpu->cfg.ext_zkn = true;
+        cpu->cfg.ext_zkr = true;
+        cpu->cfg.ext_zkt = true;
+    }
+
+    if (cpu->cfg.ext_zkn) {
+        cpu->cfg.ext_zbkb = true;
+        cpu->cfg.ext_zbkc = true;
+        cpu->cfg.ext_zbkx = true;
+        cpu->cfg.ext_zkne = true;
+        cpu->cfg.ext_zknd = true;
+        cpu->cfg.ext_zknh = true;
+    }
+
+    if (cpu->cfg.ext_zks) {
+        cpu->cfg.ext_zbkb = true;
+        cpu->cfg.ext_zbkc = true;
+        cpu->cfg.ext_zbkx = true;
+        cpu->cfg.ext_zksed = true;
+        cpu->cfg.ext_zksh = true;
+    }
+
+    if (cpu->cfg.ext_i) {
+        ext |= RVI;
+    }
+    if (cpu->cfg.ext_e) {
+        ext |= RVE;
+    }
+    if (cpu->cfg.ext_m) {
+        ext |= RVM;
+    }
+    if (cpu->cfg.ext_a) {
+        ext |= RVA;
+    }
+    if (cpu->cfg.ext_f) {
+        ext |= RVF;
+    }
+    if (cpu->cfg.ext_d) {
+        ext |= RVD;
+    }
+    if (cpu->cfg.ext_c) {
+        ext |= RVC;
+    }
+    if (cpu->cfg.ext_s) {
+        ext |= RVS;
+    }
+    if (cpu->cfg.ext_u) {
+        ext |= RVU;
+    }
+    if (cpu->cfg.ext_h) {
+        ext |= RVH;
+    }
+    if (cpu->cfg.ext_v) {
+        int vext_version = VEXT_VERSION_1_00_0;
+        ext |= RVV;
+        if (!is_power_of_2(cpu->cfg.vlen)) {
+            error_setg(errp,
+                    "Vector extension VLEN must be power of 2");
+            return;
+        }
+        if (cpu->cfg.vlen > RV_VLEN_MAX || cpu->cfg.vlen < 128) {
+            error_setg(errp,
+                    "Vector extension implementation only supports VLEN "
+                    "in the range [128, %d]", RV_VLEN_MAX);
+            return;
+        }
+        if (!is_power_of_2(cpu->cfg.elen)) {
+            error_setg(errp,
+                    "Vector extension ELEN must be power of 2");
+            return;
+        }
+    if (cpu->cfg.elen > 64 || cpu->cfg.elen < 8) {
+        error_setg(errp,
+                "Vector extension implementation only supports ELEN "
+                "in the range [8, 64]");
+        return;
+    }
+    if (cpu->cfg.vext_spec) {
+        if (!g_strcmp0(cpu->cfg.vext_spec, "v1.0")) {
+            vext_version = VEXT_VERSION_1_00_0;
+        } else {
+            error_setg(errp,
+                   "Unsupported vector spec version '%s'",
+                   cpu->cfg.vext_spec);
+            return;
+        }
+    } else {
+        qemu_log("vector version is not specified, "
+                 "use the default value v1.0\n");
+    }
+    set_vext_version(env, vext_version);
+    }
+    if (cpu->cfg.ext_j) {
+        ext |= RVJ;
+    }
+
+    set_misa(env, env->misa_mxl, ext);
+}
+
 static void riscv_cpu_realize(DeviceState *dev, Error **errp)
 {
     CPUState *cs = CPU(dev);
@@ -726,243 +970,10 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     }
     assert(env->misa_mxl_max == env->misa_mxl);
 
-    /* If only MISA_EXT is unset for misa, then set it from properties */
-    if (env->misa_ext == 0) {
-        uint32_t ext = 0;
-
-        /* Do some ISA extension error checking */
-        if (cpu->cfg.ext_g && !(cpu->cfg.ext_i && cpu->cfg.ext_m &&
-                                cpu->cfg.ext_a && cpu->cfg.ext_f &&
-                                cpu->cfg.ext_d &&
-                                cpu->cfg.ext_icsr && cpu->cfg.ext_ifencei)) {
-            warn_report("Setting G will also set IMAFD_Zicsr_Zifencei");
-            cpu->cfg.ext_i = true;
-            cpu->cfg.ext_m = true;
-            cpu->cfg.ext_a = true;
-            cpu->cfg.ext_f = true;
-            cpu->cfg.ext_d = true;
-            cpu->cfg.ext_icsr = true;
-            cpu->cfg.ext_ifencei = true;
-        }
-
-        if (cpu->cfg.ext_i && cpu->cfg.ext_e) {
-            error_setg(errp,
-                       "I and E extensions are incompatible");
-            return;
-        }
-
-        if (!cpu->cfg.ext_i && !cpu->cfg.ext_e) {
-            error_setg(errp,
-                       "Either I or E extension must be set");
-            return;
-        }
-
-        if (cpu->cfg.ext_s && !cpu->cfg.ext_u) {
-            error_setg(errp,
-                       "Setting S extension without U extension is illegal");
-            return;
-        }
-
-        if (cpu->cfg.ext_h && !cpu->cfg.ext_i) {
-            error_setg(errp,
-                       "H depends on an I base integer ISA with 32 x registers");
-            return;
-        }
-
-        if (cpu->cfg.ext_h && !cpu->cfg.ext_s) {
-            error_setg(errp, "H extension implicitly requires S-mode");
-            return;
-        }
-
-        if (cpu->cfg.ext_f && !cpu->cfg.ext_icsr) {
-            error_setg(errp, "F extension requires Zicsr");
-            return;
-        }
-
-        if ((cpu->cfg.ext_zawrs) && !cpu->cfg.ext_a) {
-            error_setg(errp, "Zawrs extension requires A extension");
-            return;
-        }
-
-        if ((cpu->cfg.ext_zfh || cpu->cfg.ext_zfhmin) && !cpu->cfg.ext_f) {
-            error_setg(errp, "Zfh/Zfhmin extensions require F extension");
-            return;
-        }
-
-        if (cpu->cfg.ext_d && !cpu->cfg.ext_f) {
-            error_setg(errp, "D extension requires F extension");
-            return;
-        }
-
-        if (cpu->cfg.ext_v && !cpu->cfg.ext_d) {
-            error_setg(errp, "V extension requires D extension");
-            return;
-        }
-
-        if ((cpu->cfg.ext_zve32f || cpu->cfg.ext_zve64f) && !cpu->cfg.ext_f) {
-            error_setg(errp, "Zve32f/Zve64f extensions require F extension");
-            return;
-        }
-
-        /* Set the ISA extensions, checks should have happened above */
-        if (cpu->cfg.ext_zdinx || cpu->cfg.ext_zhinx ||
-            cpu->cfg.ext_zhinxmin) {
-            cpu->cfg.ext_zfinx = true;
-        }
-
-        if (cpu->cfg.ext_zfinx) {
-            if (!cpu->cfg.ext_icsr) {
-                error_setg(errp, "Zfinx extension requires Zicsr");
-                return;
-            }
-            if (cpu->cfg.ext_f) {
-                error_setg(errp,
-                    "Zfinx cannot be supported together with F extension");
-                return;
-            }
-        }
-
-        if (cpu->cfg.ext_c) {
-            cpu->cfg.ext_zca = true;
-            if (cpu->cfg.ext_f && env->misa_mxl_max == MXL_RV32) {
-                cpu->cfg.ext_zcf = true;
-            }
-            if (cpu->cfg.ext_d) {
-                cpu->cfg.ext_zcd = true;
-            }
-        }
-
-        if (env->misa_mxl_max != MXL_RV32 && cpu->cfg.ext_zcf) {
-            error_setg(errp, "Zcf extension is only relevant to RV32");
-            return;
-        }
-
-        if (!cpu->cfg.ext_f && cpu->cfg.ext_zcf) {
-            error_setg(errp, "Zcf extension requires F extension");
-            return;
-        }
-
-        if (!cpu->cfg.ext_d && cpu->cfg.ext_zcd) {
-            error_setg(errp, "Zcd extension requires D extension");
-            return;
-        }
-
-        if ((cpu->cfg.ext_zcf || cpu->cfg.ext_zcd || cpu->cfg.ext_zcb ||
-             cpu->cfg.ext_zcmp || cpu->cfg.ext_zcmt) && !cpu->cfg.ext_zca) {
-            error_setg(errp, "Zcf/Zcd/Zcb/Zcmp/Zcmt extensions require Zca "
-                             "extension");
-            return;
-        }
-
-        if (cpu->cfg.ext_zcd && (cpu->cfg.ext_zcmp || cpu->cfg.ext_zcmt)) {
-            error_setg(errp, "Zcmp/Zcmt extensions are incompatible with "
-                             "Zcd extension");
-            return;
-        }
-
-        if (cpu->cfg.ext_zcmt && !cpu->cfg.ext_icsr) {
-            error_setg(errp, "Zcmt extension requires Zicsr extension");
-            return;
-        }
-
-        if (cpu->cfg.ext_zk) {
-            cpu->cfg.ext_zkn = true;
-            cpu->cfg.ext_zkr = true;
-            cpu->cfg.ext_zkt = true;
-        }
-
-        if (cpu->cfg.ext_zkn) {
-            cpu->cfg.ext_zbkb = true;
-            cpu->cfg.ext_zbkc = true;
-            cpu->cfg.ext_zbkx = true;
-            cpu->cfg.ext_zkne = true;
-            cpu->cfg.ext_zknd = true;
-            cpu->cfg.ext_zknh = true;
-        }
-
-        if (cpu->cfg.ext_zks) {
-            cpu->cfg.ext_zbkb = true;
-            cpu->cfg.ext_zbkc = true;
-            cpu->cfg.ext_zbkx = true;
-            cpu->cfg.ext_zksed = true;
-            cpu->cfg.ext_zksh = true;
-        }
-
-        if (cpu->cfg.ext_i) {
-            ext |= RVI;
-        }
-        if (cpu->cfg.ext_e) {
-            ext |= RVE;
-        }
-        if (cpu->cfg.ext_m) {
-            ext |= RVM;
-        }
-        if (cpu->cfg.ext_a) {
-            ext |= RVA;
-        }
-        if (cpu->cfg.ext_f) {
-            ext |= RVF;
-        }
-        if (cpu->cfg.ext_d) {
-            ext |= RVD;
-        }
-        if (cpu->cfg.ext_c) {
-            ext |= RVC;
-        }
-        if (cpu->cfg.ext_s) {
-            ext |= RVS;
-        }
-        if (cpu->cfg.ext_u) {
-            ext |= RVU;
-        }
-        if (cpu->cfg.ext_h) {
-            ext |= RVH;
-        }
-        if (cpu->cfg.ext_v) {
-            int vext_version = VEXT_VERSION_1_00_0;
-            ext |= RVV;
-            if (!is_power_of_2(cpu->cfg.vlen)) {
-                error_setg(errp,
-                        "Vector extension VLEN must be power of 2");
-                return;
-            }
-            if (cpu->cfg.vlen > RV_VLEN_MAX || cpu->cfg.vlen < 128) {
-                error_setg(errp,
-                        "Vector extension implementation only supports VLEN "
-                        "in the range [128, %d]", RV_VLEN_MAX);
-                return;
-            }
-            if (!is_power_of_2(cpu->cfg.elen)) {
-                error_setg(errp,
-                        "Vector extension ELEN must be power of 2");
-                return;
-            }
-            if (cpu->cfg.elen > 64 || cpu->cfg.elen < 8) {
-                error_setg(errp,
-                        "Vector extension implementation only supports ELEN "
-                        "in the range [8, 64]");
-                return;
-            }
-            if (cpu->cfg.vext_spec) {
-                if (!g_strcmp0(cpu->cfg.vext_spec, "v1.0")) {
-                    vext_version = VEXT_VERSION_1_00_0;
-                } else {
-                    error_setg(errp,
-                           "Unsupported vector spec version '%s'",
-                           cpu->cfg.vext_spec);
-                    return;
-                }
-            } else {
-                qemu_log("vector version is not specified, "
-                         "use the default value v1.0\n");
-            }
-            set_vext_version(env, vext_version);
-        }
-        if (cpu->cfg.ext_j) {
-            ext |= RVJ;
-        }
-
-        set_misa(env, env->misa_mxl, ext);
+    riscv_cpu_validate_set_extensions(cpu, &local_err);
+    if (local_err != NULL) {
+        error_propagate(errp, local_err);
+        return;
     }
 
 #ifndef CONFIG_USER_ONLY
-- 
2.39.0


