Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kC2cY-0000aM-Fx
	for mharc-qemu-riscv@gnu.org; Sat, 29 Aug 2020 11:18:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kC2cW-0000WL-HR; Sat, 29 Aug 2020 11:18:20 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:33937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kC2cU-0005Ao-Kn; Sat, 29 Aug 2020 11:18:20 -0400
Received: by mail-ot1-x344.google.com with SMTP id k20so1813118otr.1;
 Sat, 29 Aug 2020 08:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=zgCVaaWE4wk8cZqJM0imGhea+11Dl7ZU43jjVLpIW3Y=;
 b=KkCUfUHCsqxrOmPMBXOxbkX3ZDNUuF3myBA+U5iBJ39jcAIAVKGaBQeOzF15TmFTwO
 Z9Zz7EBoMdYQ0Q2V4cnfmskMh4XHNQ5mkci2JNTwdqebgu9tfFapjEYDx8WG0+FT+TuW
 ugfps76shGev45DXDAg4gEnuQPhXhSMBPsldlJ/CDQzIwNDWDLFUmMO4Wbe2Z6P13Pjr
 tLxMAm0F8p7I6TJCMMYItnQCwF0LW8L7Nb7wi7elt4EdG/RJW2tDHBJD3R8Yu8cRlfJy
 5O5VeT2WOLuYY+MpmNXO5AjeJQFxjQxIMOiJ0SyDT5wQ8dDQBKh81z729yK26WJmxzVe
 0K6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=zgCVaaWE4wk8cZqJM0imGhea+11Dl7ZU43jjVLpIW3Y=;
 b=QL4rRGuAemYMYhrIEEk4pF2D8DnKMBIfrrWhRvb2oez/otnoyPlK1MYhvUX11wU1pA
 RvqYKcnCWcEojiXSoBeEWjVzcV4WTadr6dIgGJB6mofB7XW7W83OIIhD9oa4iKwzL3Ug
 hNUmzmsPI4SPehmDfAPHcrdTH5jTCdDmlRr8n5+MCB2/mXeBWArT4byTLH3zFAERG1aA
 /Z2g/1JTm0t0oIym58YrWJMA901K6A50OTbjDGL+nQTf4lTK86DUZfAMRNcmQxfvNT0r
 KniwjY9oBCeQUUnn5gKbIoeowquHZBHwyZYkQR+HLcu2w1uI7NNwMItuZfnSf3Yjn7rf
 py8g==
X-Gm-Message-State: AOAM5334SzjXa7VnHs2vT096EnKIsNKQVMXAPGzPZ0+x0qz6vYXItQEs
 3Q7eSrGUh4jpMKVfYsncZQY=
X-Google-Smtp-Source: ABdhPJzwu6v/EwmbkZWpOoIwyhnMavvDhy17msHPtkVQtnnZqfOrceJxS6LbuarDATXm1goaDmtX8w==
X-Received: by 2002:a9d:ea3:: with SMTP id 32mr2458116otj.75.1598714297190;
 Sat, 29 Aug 2020 08:18:17 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com (unknown-146-144.windriver.com.
 [147.11.146.144])
 by smtp.gmail.com with ESMTPSA id f50sm58181otf.47.2020.08.29.08.18.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 29 Aug 2020 08:18:16 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Subject: [PATCH v2 03/16] target/riscv: cpu: Set reset vector based on the
 configured property value
Date: Sat, 29 Aug 2020 23:17:27 +0800
Message-Id: <1598714261-8320-4-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1598714261-8320-1-git-send-email-bmeng.cn@gmail.com>
References: <1598714261-8320-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ot1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 29 Aug 2020 15:18:20 -0000

From: Bin Meng <bin.meng@windriver.com>

Now that we have the newly introduced 'resetvec' property in the
RISC-V CPU and HART, instead of hard-coding the reset vector addr
in the CPU's instance_init(), move that to riscv_cpu_realize()
based on the configured property value from the RISC-V machines.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---

(no changes since v1)

 hw/riscv/opentitan.c | 1 +
 hw/riscv/sifive_e.c  | 1 +
 hw/riscv/sifive_u.c  | 2 ++
 target/riscv/cpu.c   | 7 ++-----
 4 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index 23ba3b4..0531bd8 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -111,6 +111,7 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
                             &error_abort);
     object_property_set_int(OBJECT(&s->cpus), "num-harts", ms->smp.cpus,
                             &error_abort);
+    object_property_set_int(OBJECT(&s->cpus), "resetvec", 0x8090, &error_abort);
     sysbus_realize(SYS_BUS_DEVICE(&s->cpus), &error_abort);
 
     /* Boot ROM */
diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index ca55cc4..cd7560d 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -177,6 +177,7 @@ static void sifive_e_soc_init(Object *obj)
     object_initialize_child(obj, "cpus", &s->cpus, TYPE_RISCV_HART_ARRAY);
     object_property_set_int(OBJECT(&s->cpus), "num-harts", ms->smp.cpus,
                             &error_abort);
+    object_property_set_int(OBJECT(&s->cpus), "resetvec", 0x1004, &error_abort);
     object_initialize_child(obj, "riscv.sifive.e.gpio0", &s->gpio,
                             TYPE_SIFIVE_GPIO);
 }
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index a48046c..404d5e6 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -611,6 +611,7 @@ static void sifive_u_soc_instance_init(Object *obj)
     qdev_prop_set_uint32(DEVICE(&s->e_cpus), "num-harts", 1);
     qdev_prop_set_uint32(DEVICE(&s->e_cpus), "hartid-base", 0);
     qdev_prop_set_string(DEVICE(&s->e_cpus), "cpu-type", SIFIVE_E_CPU);
+    qdev_prop_set_uint64(DEVICE(&s->e_cpus), "resetvec", 0x1004);
 
     object_initialize_child(obj, "u-cluster", &s->u_cluster, TYPE_CPU_CLUSTER);
     qdev_prop_set_uint32(DEVICE(&s->u_cluster), "cluster-id", 1);
@@ -620,6 +621,7 @@ static void sifive_u_soc_instance_init(Object *obj)
     qdev_prop_set_uint32(DEVICE(&s->u_cpus), "num-harts", ms->smp.cpus - 1);
     qdev_prop_set_uint32(DEVICE(&s->u_cpus), "hartid-base", 1);
     qdev_prop_set_string(DEVICE(&s->u_cpus), "cpu-type", SIFIVE_U_CPU);
+    qdev_prop_set_uint64(DEVICE(&s->u_cpus), "resetvec", 0x1004);
 
     object_initialize_child(obj, "prci", &s->prci, TYPE_SIFIVE_U_PRCI);
     object_initialize_child(obj, "otp", &s->otp, TYPE_SIFIVE_U_OTP);
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 8067a26..bd41286 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -128,7 +128,6 @@ static void riscv_any_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     set_misa(env, RVXLEN | RVI | RVM | RVA | RVF | RVD | RVC | RVU);
     set_priv_version(env, PRIV_VERSION_1_11_0);
-    set_resetvec(env, DEFAULT_RSTVEC);
 }
 
 static void riscv_base_cpu_init(Object *obj)
@@ -136,7 +135,6 @@ static void riscv_base_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     /* We set this in the realise function */
     set_misa(env, 0);
-    set_resetvec(env, DEFAULT_RSTVEC);
 }
 
 static void rvxx_sifive_u_cpu_init(Object *obj)
@@ -144,7 +142,6 @@ static void rvxx_sifive_u_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     set_misa(env, RVXLEN | RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
     set_priv_version(env, PRIV_VERSION_1_10_0);
-    set_resetvec(env, 0x1004);
 }
 
 static void rvxx_sifive_e_cpu_init(Object *obj)
@@ -152,7 +149,6 @@ static void rvxx_sifive_e_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     set_misa(env, RVXLEN | RVI | RVM | RVA | RVC | RVU);
     set_priv_version(env, PRIV_VERSION_1_10_0);
-    set_resetvec(env, 0x1004);
     qdev_prop_set_bit(DEVICE(obj), "mmu", false);
 }
 
@@ -163,7 +159,6 @@ static void rv32_ibex_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     set_misa(env, RV32 | RVI | RVM | RVC | RVU);
     set_priv_version(env, PRIV_VERSION_1_10_0);
-    set_resetvec(env, 0x8090);
     qdev_prop_set_bit(DEVICE(obj), "mmu", false);
 }
 
@@ -373,6 +368,8 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         set_feature(env, RISCV_FEATURE_PMP);
     }
 
+    set_resetvec(env, cpu->cfg.resetvec);
+
     /* If misa isn't set (rv32 and rv64 machines) set it here */
     if (!env->misa) {
         /* Do some ISA extension error checking */
-- 
2.7.4


