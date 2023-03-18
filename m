Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pdcnP-000507-4P
	for mharc-qemu-riscv@gnu.org; Sat, 18 Mar 2023 16:04:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pdcnN-0004zQ-PA
 for qemu-riscv@nongnu.org; Sat, 18 Mar 2023 16:04:53 -0400
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pdcnM-0006sK-0y
 for qemu-riscv@nongnu.org; Sat, 18 Mar 2023 16:04:53 -0400
Received: by mail-oo1-xc2a.google.com with SMTP id
 x19-20020a4a3953000000b00525191358b6so1313950oog.12
 for <qemu-riscv@nongnu.org>; Sat, 18 Mar 2023 13:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679169891;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y4yZ3wAir0o7gPbOYm0TNhTOmu7uQyMFvLvYKMxOY/Q=;
 b=JHXxwfFdISGmN88zfIlQqIIBLyRzzOn4COQDstaKyyENxVj/XeET0ZvmtPm58y3WQl
 czn+pu/vNknNeAgYngluA6oGEET0SJww28wPXjNrMPO+CKk2en5a62iwk/Muataq92Jx
 iL0UFyTeUk77O4tuKFkgAp9qXb6duO3iMXpWMd0nBskb/xdwt6Fu02KORN5KkMySSMkq
 UJDzngDA8r4YB7Db6xhpMv6NTOkV5GEzPr9+y+ZlVLgDAOSig3OkMRTti5V2dXIVDzwD
 JI6sx3pcQKOJFx5CgBBxyD0Zk1I7WP35ZfJHQoBGexHpYeaEke+dKbduP0kWAPXGVDJv
 3b2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679169891;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y4yZ3wAir0o7gPbOYm0TNhTOmu7uQyMFvLvYKMxOY/Q=;
 b=OOiSr2FwAMT6JlcC2bvVA8BYxK3ezQkmXjPm374EVqYvR+dsM/d5FPC43av7X68rKR
 0xL38lF6rBu22HdXO+xqKKlN3+rCoARe7hH5zIPnOPcAzIwBehbGZxl6MUpjwq+IxCKa
 Ay06xLht0be1fFce1RzHKa1WdSn+q9RpZP34G8QA6bjkPNWB1hw4K7EUnLHp0/GT2Z23
 uUzciveK6FSXf/kfLxH6wSkzYz/vrOU5iuUo+1MivM/8bc1KfAm2mogcwmTyLa0/nEO2
 NxEa2hCeqOSoO//QijSNM/S26kAP34RJXQUGB2C4nFc+6HvDWSNo2HaOfXB8ShFyX76Z
 XA+A==
X-Gm-Message-State: AO0yUKUwalwH6Q4l33bcze56wzIDKpSImWNqVfIJwDe2OgOe3oolOBXi
 cAb1UTZUcQciGSC9XpETZ8wr+w==
X-Google-Smtp-Source: AK7set9yv2apBXVLffXYemSooXH+fz/i0UuySHOUrRjyAu5XW3kuwNBh/ieX/ILFj0GVaLP4OX/ccA==
X-Received: by 2002:a4a:378e:0:b0:525:36b1:86dd with SMTP id
 r136-20020a4a378e000000b0052536b186ddmr1423612oor.7.1679169890956; 
 Sat, 18 Mar 2023 13:04:50 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 f69-20020a4a5848000000b004a3d98b2ccdsm2122219oob.42.2023.03.18.13.04.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Mar 2023 13:04:50 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v3 03/26] target/riscv/cpu.c: remove set_priv_version()
Date: Sat, 18 Mar 2023 17:04:13 -0300
Message-Id: <20230318200436.299464-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318200436.299464-1-dbarboza@ventanamicro.com>
References: <20230318200436.299464-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc2a.google.com
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
X-List-Received-Date: Sat, 18 Mar 2023 20:04:54 -0000

The setter is doing nothing special. Just set env->priv_ver directly.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 30 +++++++++++++-----------------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 2752efe1eb..18032dfd4e 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -240,11 +240,6 @@ static void set_misa(CPURISCVState *env, RISCVMXL mxl, uint32_t ext)
     env->misa_ext_mask = env->misa_ext = ext;
 }
 
-static void set_priv_version(CPURISCVState *env, int priv_ver)
-{
-    env->priv_ver = priv_ver;
-}
-
 #ifndef CONFIG_USER_ONLY
 static uint8_t satp_mode_from_str(const char *satp_mode_str)
 {
@@ -343,7 +338,7 @@ static void riscv_any_cpu_init(Object *obj)
                                     VM_1_10_SV32 : VM_1_10_SV57);
 #endif
 
-    set_priv_version(env, PRIV_VERSION_1_12_0);
+    env->priv_ver = PRIV_VERSION_1_12_0;
     register_cpu_props(obj);
 }
 
@@ -355,7 +350,7 @@ static void rv64_base_cpu_init(Object *obj)
     set_misa(env, MXL_RV64, 0);
     register_cpu_props(obj);
     /* Set latest version of privileged specification */
-    set_priv_version(env, PRIV_VERSION_1_12_0);
+    env->priv_ver = PRIV_VERSION_1_12_0;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV57);
 #endif
@@ -366,7 +361,7 @@ static void rv64_sifive_u_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
     register_cpu_props(obj);
-    set_priv_version(env, PRIV_VERSION_1_10_0);
+    env->priv_ver = PRIV_VERSION_1_10_0;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV39);
 #endif
@@ -379,7 +374,7 @@ static void rv64_sifive_e_cpu_init(Object *obj)
 
     set_misa(env, MXL_RV64, RVI | RVM | RVA | RVC | RVU);
     register_cpu_props(obj);
-    set_priv_version(env, PRIV_VERSION_1_10_0);
+    env->priv_ver = PRIV_VERSION_1_10_0;
     cpu->cfg.mmu = false;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
@@ -392,7 +387,7 @@ static void rv64_thead_c906_cpu_init(Object *obj)
     RISCVCPU *cpu = RISCV_CPU(obj);
 
     set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
-    set_priv_version(env, PRIV_VERSION_1_11_0);
+    env->priv_ver = PRIV_VERSION_1_11_0;
 
     cpu->cfg.ext_g = true;
     cpu->cfg.ext_c = true;
@@ -431,7 +426,7 @@ static void rv128_base_cpu_init(Object *obj)
     set_misa(env, MXL_RV128, 0);
     register_cpu_props(obj);
     /* Set latest version of privileged specification */
-    set_priv_version(env, PRIV_VERSION_1_12_0);
+    env->priv_ver = PRIV_VERSION_1_12_0;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV57);
 #endif
@@ -444,7 +439,7 @@ static void rv32_base_cpu_init(Object *obj)
     set_misa(env, MXL_RV32, 0);
     register_cpu_props(obj);
     /* Set latest version of privileged specification */
-    set_priv_version(env, PRIV_VERSION_1_12_0);
+    env->priv_ver = PRIV_VERSION_1_12_0;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV32);
 #endif
@@ -454,8 +449,9 @@ static void rv32_sifive_u_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
+
     register_cpu_props(obj);
-    set_priv_version(env, PRIV_VERSION_1_10_0);
+    env->priv_ver = PRIV_VERSION_1_10_0;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV32);
 #endif
@@ -468,7 +464,7 @@ static void rv32_sifive_e_cpu_init(Object *obj)
 
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVC | RVU);
     register_cpu_props(obj);
-    set_priv_version(env, PRIV_VERSION_1_10_0);
+    env->priv_ver = PRIV_VERSION_1_10_0;
     cpu->cfg.mmu = false;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
@@ -482,7 +478,7 @@ static void rv32_ibex_cpu_init(Object *obj)
 
     set_misa(env, MXL_RV32, RVI | RVM | RVC | RVU);
     register_cpu_props(obj);
-    set_priv_version(env, PRIV_VERSION_1_11_0);
+    env->priv_ver = PRIV_VERSION_1_11_0;
     cpu->cfg.mmu = false;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
@@ -497,7 +493,7 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
 
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVC | RVU);
     register_cpu_props(obj);
-    set_priv_version(env, PRIV_VERSION_1_10_0);
+    env->priv_ver = PRIV_VERSION_1_10_0;
     cpu->cfg.mmu = false;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
@@ -1160,7 +1156,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     }
 
     if (priv_version >= PRIV_VERSION_1_10_0) {
-        set_priv_version(env, priv_version);
+        env->priv_ver = priv_version;
     }
 
     /* Force disable extensions if priv spec version does not match */
-- 
2.39.2


