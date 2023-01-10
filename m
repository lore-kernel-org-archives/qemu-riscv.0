Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pFL0r-0003RB-Sq
	for mharc-qemu-riscv@gnu.org; Tue, 10 Jan 2023 15:14:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pFL0m-0003Kk-6x
 for qemu-riscv@nongnu.org; Tue, 10 Jan 2023 15:14:21 -0500
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pFL0k-0000pn-9E
 for qemu-riscv@nongnu.org; Tue, 10 Jan 2023 15:14:19 -0500
Received: by mail-oi1-x230.google.com with SMTP id r132so509607oif.10
 for <qemu-riscv@nongnu.org>; Tue, 10 Jan 2023 12:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W3FF41oQMn8zqiEm/hd7dm9Rda9j4Id6q5Oa/vMVqWY=;
 b=OBA5gO5E1wZY68VhKDrQ4kYaYuRWh9iF/gE1P1erQJ01dCQfUIX+JXK6eiF3KvMl2Q
 iGKXVYZLip1t5RvqjNJ7NxwrGUPA8gS/nlcJ1PiuoL6oLiAARBliErwjauyLu6SRdh3h
 Vdc1UbucqQOfW12vELO3xcENI0Rvsd4kNbzMXl6vKGJS3cMKWA0xD2OdeIVc4Z759jmC
 8wdhmAT5Cs9Isf0LizYKfoLDNIq1As91CCQBDXtjxnjga7dAy0qVe5aSeuztKejhA/wG
 6J4Pr0x2ujXKQXnnzBAY1KJN5Il4/pnyt7qKiKuinJ97VFF4YqbRLIXIlTW7jgCG5sfr
 RlVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W3FF41oQMn8zqiEm/hd7dm9Rda9j4Id6q5Oa/vMVqWY=;
 b=kfPpJ3hHkXOFHsUXNdLDbHbeBwn94lj5HmjeHkVgR1pvByeWHo6fB7oPaXBV0RjJOe
 IUW3FITAy2HfQvf/+ja+JupD7qaIv7zWY+sj3laU17jAU6ckRInXmWFs4y+mIF4Cosbu
 rC/9kiFcd97Gts02Ph9EndyskmSzlysP+x0kyyPjK3uOhGXAGYAH8unWBL2ZEueXgruF
 jzmtwEVxfZKUQQe9ZWko67Ky8Qq6n7cOaORfYH7YjdiN2iT2fy+VBKJDjb7GV+pYthwL
 9d/4ViZamdGHxTlLUf/oBFBb4RfpVIblhN4zlE+ugEFfLQWPMdp7vZ67cQYJbF3yAdaj
 bung==
X-Gm-Message-State: AFqh2kp+q9vDiEqopnBOKEKyWLLoHwFzgMYbw11b3zFehJ6Bj7KYL3Ce
 dNmPsvGsbApvipMRNCqi0vat/riFJuk1+2ZWfFI=
X-Google-Smtp-Source: AMrXdXuh65erJv2FgYlPE7mBVJ7maNxnTaGqo41o+Jr32CeWBdvSAT00420XU4ItGrlW2i/jrh89Vw==
X-Received: by 2002:a05:6808:144c:b0:363:acf6:7843 with SMTP id
 x12-20020a056808144c00b00363acf67843mr27381799oiv.27.1673381654144; 
 Tue, 10 Jan 2023 12:14:14 -0800 (PST)
Received: from grind.. ([152.250.93.24]) by smtp.gmail.com with ESMTPSA id
 l21-20020a9d7a95000000b0067c87f23476sm6453978otn.57.2023.01.10.12.14.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 12:14:13 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 richard.henderson@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 1/2] target/riscv/cpu: set cpu->cfg in register_cpu_props()
Date: Tue, 10 Jan 2023 17:14:04 -0300
Message-Id: <20230110201405.247785-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230110201405.247785-1-dbarboza@ventanamicro.com>
References: <20230110201405.247785-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x230.google.com
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
X-List-Received-Date: Tue, 10 Jan 2023 20:14:21 -0000

There is an informal contract between the cpu_init() functions and
riscv_cpu_realize(): if cpu->env.misa_ext is zero, assume that the
default settings were loaded via register_cpu_props() and do validations
to set env.misa_ext.  If it's not zero, skip this whole process and
assume that the board somehow did everything.

At this moment, all SiFive CPUs are setting a non-zero misa_ext during
their cpu_init() and skipping a good chunk of riscv_cpu_realize().
This causes problems when the code being skipped in riscv_cpu_realize()
contains fixes or assumptions that affects all CPUs, meaning that SiFive
CPUs are missing out.

To allow this code to not be skipped anymore, all the cpu->cfg.ext_* attributes
needs to be set during cpu_init() time. At this moment this is being done in
register_cpu_props(). The SiFive oards are setting their own extensions during
cpu_init() though, meaning that they don't want all the defaults from
register_cpu_props().

Let's move the contract between *_cpu_init() and riscv_cpu_realize() to
register_cpu_props(). Inside this function we'll check if cpu->env.misa_ext
was set and, if that's the case, set all relevant cpu->cfg.ext_*
attributes, and only that. Leave the 'misa_ext' = 0 case as is today,
i.e. loading all the defaults from riscv_cpu_extensions[].

register_cpu_props() can then be called by all the cpu_init() functions,
including the SiFive ones. This will make all CPUs behave more in line
with that riscv_cpu_realize() expects.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 40 ++++++++++++++++++++++++++++++++++++++++
 target/riscv/cpu.h |  4 ++++
 2 files changed, 44 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ee3659cc7e..b8c1edb7c2 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -262,6 +262,7 @@ static void rv64_sifive_u_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
+    register_cpu_props(DEVICE(obj));
     set_priv_version(env, PRIV_VERSION_1_10_0);
 }
 
@@ -271,6 +272,7 @@ static void rv64_sifive_e_cpu_init(Object *obj)
     RISCVCPU *cpu = RISCV_CPU(obj);
 
     set_misa(env, MXL_RV64, RVI | RVM | RVA | RVC | RVU);
+    register_cpu_props(DEVICE(obj));
     set_priv_version(env, PRIV_VERSION_1_10_0);
     cpu->cfg.mmu = false;
 }
@@ -305,6 +307,7 @@ static void rv32_sifive_u_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
+    register_cpu_props(DEVICE(obj));
     set_priv_version(env, PRIV_VERSION_1_10_0);
 }
 
@@ -314,6 +317,7 @@ static void rv32_sifive_e_cpu_init(Object *obj)
     RISCVCPU *cpu = RISCV_CPU(obj);
 
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVC | RVU);
+    register_cpu_props(DEVICE(obj));
     set_priv_version(env, PRIV_VERSION_1_10_0);
     cpu->cfg.mmu = false;
 }
@@ -324,6 +328,7 @@ static void rv32_ibex_cpu_init(Object *obj)
     RISCVCPU *cpu = RISCV_CPU(obj);
 
     set_misa(env, MXL_RV32, RVI | RVM | RVC | RVU);
+    register_cpu_props(DEVICE(obj));
     set_priv_version(env, PRIV_VERSION_1_11_0);
     cpu->cfg.mmu = false;
     cpu->cfg.epmp = true;
@@ -335,6 +340,7 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
     RISCVCPU *cpu = RISCV_CPU(obj);
 
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVC | RVU);
+    register_cpu_props(DEVICE(obj));
     set_priv_version(env, PRIV_VERSION_1_10_0);
     cpu->cfg.mmu = false;
 }
@@ -1139,10 +1145,44 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
+/*
+ * Register CPU props based on env.misa_ext. If a non-zero
+ * value was set, register only the required cpu->cfg.ext_*
+ * properties and leave. env.misa_ext = 0 means that we want
+ * all the default properties to be registered.
+ */
 static void register_cpu_props(DeviceState *dev)
 {
+    RISCVCPU *cpu = RISCV_CPU(OBJECT(dev));
+    uint32_t misa_ext = cpu->env.misa_ext;
     Property *prop;
 
+    /*
+     * If misa_ext is not zero, set cfg properties now to
+     * allow them to be read during riscv_cpu_realize()
+     * later on.
+     */
+    if (cpu->env.misa_ext != 0) {
+        cpu->cfg.ext_i = misa_ext & RVI;
+        cpu->cfg.ext_e = misa_ext & RVE;
+        cpu->cfg.ext_m = misa_ext & RVM;
+        cpu->cfg.ext_a = misa_ext & RVA;
+        cpu->cfg.ext_f = misa_ext & RVF;
+        cpu->cfg.ext_d = misa_ext & RVD;
+        cpu->cfg.ext_v = misa_ext & RVV;
+        cpu->cfg.ext_c = misa_ext & RVC;
+        cpu->cfg.ext_s = misa_ext & RVS;
+        cpu->cfg.ext_u = misa_ext & RVU;
+        cpu->cfg.ext_h = misa_ext & RVH;
+        cpu->cfg.ext_j = misa_ext & RVJ;
+
+        /*
+         * We don't want to set the default riscv_cpu_extensions
+         * in this case.
+         */
+        return;
+    }
+
     for (prop = riscv_cpu_extensions; prop && prop->name; prop++) {
         qdev_property_add_static(dev, prop);
     }
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 0158932dc5..798bd081de 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -63,6 +63,10 @@
 
 #define RV(x) ((target_ulong)1 << (x - 'A'))
 
+/*
+ * Consider updating register_cpu_props() when adding
+ * new MISA bits here.
+ */
 #define RVI RV('I')
 #define RVE RV('E') /* E and I are mutually exclusive */
 #define RVM RV('M')
-- 
2.39.0


