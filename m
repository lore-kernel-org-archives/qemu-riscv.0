Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pc7rl-0006xF-4B
	for mharc-qemu-riscv@gnu.org; Tue, 14 Mar 2023 12:51:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pc7rd-0006sF-1H
 for qemu-riscv@nongnu.org; Tue, 14 Mar 2023 12:51:05 -0400
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pc7rZ-00035C-0H
 for qemu-riscv@nongnu.org; Tue, 14 Mar 2023 12:51:03 -0400
Received: by mail-ot1-x32b.google.com with SMTP id
 e9-20020a056830200900b00694651d19f6so8721180otp.12
 for <qemu-riscv@nongnu.org>; Tue, 14 Mar 2023 09:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1678812659;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bXu2RGXcq0gqBcM4NKB9bkqVmtqDPomsLl3SXZ2K35Q=;
 b=PQ3hO1ERfXi4oqM5jrxnmbhLOPVaj5/jixoxdXjuzvQk7CNcfjjjy5vGEWEx9xnQ1I
 EZwqWqHGCCdAY5rzZ0ZFCwlm797CxHKf53LSlgluHVoywLk2QbgA7ZnQJEQunSJ6YiBo
 1mfgATjyaSsl/HM/omNrlTvi3dmZJHKkhThRPsiSj0DSi96e4l8sh+edwLlD1AH9euFQ
 QH71Dg0zxQUBJikXY9MdVYOhCnaUWBOGPphb1FtJQTIGg0W58IyK4p4Nvg5Sq+yUFyMd
 Mg3gAJozJPQSd7YZvQ41xmwRS1h3oWBNncm+ibuwUnRnnV7zYNHYq1t/WgRY+Qj7xmNZ
 DsVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678812659;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bXu2RGXcq0gqBcM4NKB9bkqVmtqDPomsLl3SXZ2K35Q=;
 b=cOUO7UyqbYZ54Vdct+fY/t7Er+AcOtIQuY9Ktbif58AREyFr3oAe2maLX3J96JmXas
 X5YuLixYYVrvngypMIeaqQDbSgRENEBrdU644I03PrcZSyGwUjI8HLxjQFI6nXy4RkUT
 +1D8Nz6/BWKvB914Nq3JuzCg9UDBs9C3r/nmzX7/S7TYWIXiaH7VcRZMaRIFDNZSaFlf
 kuLql93KjRreQdheax3K5229DBsTko7nRleWIkQF9Rr4PCdXHzH9TkenkkywAjLaUxSw
 IBOYnEi+j9pPHk992bEK5oHVOJRjPfS53jwqpeX+ORsUwmd23jmSrnEmyA52DVOkqBk9
 68Ow==
X-Gm-Message-State: AO0yUKUt9TsGMXij28dg3XF/yTRTWaGGEq3ZtobOw7G4Q0RliKXC0gHo
 9r3vhdV6KsQ2irpnRD/VEz6tBg==
X-Google-Smtp-Source: AK7set+ZToiZ5QLpLcS4kPyCr8Pt43Rz6k+XSG9bLmkfEoOLwtC+CbanSBIeGILWJbmaIzFhZaQmPA==
X-Received: by 2002:a9d:5f8a:0:b0:694:331d:8501 with SMTP id
 g10-20020a9d5f8a000000b00694331d8501mr19075057oti.21.1678812658936; 
 Tue, 14 Mar 2023 09:50:58 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 96-20020a9d04e9000000b0069451a9274bsm348689otm.28.2023.03.14.09.50.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 09:50:58 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v2 21/26] target/riscv: validate_misa_ext() now
 validates a misa_ext val
Date: Tue, 14 Mar 2023 13:49:43 -0300
Message-Id: <20230314164948.539135-22-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230314164948.539135-1-dbarboza@ventanamicro.com>
References: <20230314164948.539135-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32b.google.com
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
X-List-Received-Date: Tue, 14 Mar 2023 16:51:06 -0000

We have all MISA specific validations in riscv_cpu_validate_misa_ext(),
and we have a guarantee that env->misa_ext will always be in sync with
cpu->cfg at this point during realize time, so let's convert it to use a
'misa_ext' parameter instead of reading cpu->cfg.

This will prepare the function to be used in write_misa() where we won't
have an updated cpu->cfg object to work with. riscv_cpu_validate_v() is
changed to receive a const pointer to the cpu->cfg object via
riscv_cpu_cfg().

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 0d8524d0d9..f8f416d6dd 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -939,7 +939,8 @@ static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
     }
 }
 
-static void riscv_cpu_validate_v(CPURISCVState *env, RISCVCPUConfig *cfg,
+static void riscv_cpu_validate_v(CPURISCVState *env,
+                                 const RISCVCPUConfig *cfg,
                                  Error **errp)
 {
     int vext_version = VEXT_VERSION_1_00_0;
@@ -1025,46 +1026,48 @@ static void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu)
     }
 }
 
-static void riscv_cpu_validate_misa_ext(RISCVCPU *cpu, Error **errp)
+
+static void riscv_cpu_validate_misa_ext(CPURISCVState *env,
+                                        uint32_t misa_ext,
+                                        Error **errp)
 {
-    CPURISCVState *env = &cpu->env;
     Error *local_err = NULL;
 
-    if (cpu->cfg.ext_i && cpu->cfg.ext_e) {
+    if (misa_ext & RVI && misa_ext & RVE) {
         error_setg(errp,
                    "I and E extensions are incompatible");
         return;
     }
 
-    if (!cpu->cfg.ext_i && !cpu->cfg.ext_e) {
+    if (!(misa_ext & RVI) && !(misa_ext & RVE)) {
         error_setg(errp,
                    "Either I or E extension must be set");
         return;
     }
 
-    if (cpu->cfg.ext_s && !cpu->cfg.ext_u) {
+    if (misa_ext & RVS && !(misa_ext & RVU)) {
         error_setg(errp,
                    "Setting S extension without U extension is illegal");
         return;
     }
 
-    if (cpu->cfg.ext_h && !cpu->cfg.ext_i) {
+    if (misa_ext & RVH && !(misa_ext & RVI)) {
         error_setg(errp,
                    "H depends on an I base integer ISA with 32 x registers");
         return;
     }
 
-    if (cpu->cfg.ext_h && !cpu->cfg.ext_s) {
+    if (misa_ext & RVH && !(misa_ext & RVS)) {
         error_setg(errp, "H extension implicitly requires S-mode");
         return;
     }
 
-    if (cpu->cfg.ext_d && !cpu->cfg.ext_f) {
+    if (misa_ext & RVD && !(misa_ext & RVF)) {
         error_setg(errp, "D extension requires F extension");
         return;
     }
 
-    if (cpu->cfg.ext_v) {
+    if (misa_ext & RVV) {
         /*
          * V depends on Zve64d, which requires D. It also
          * depends on Zve64f, which depends on Zve32f,
@@ -1072,12 +1075,12 @@ static void riscv_cpu_validate_misa_ext(RISCVCPU *cpu, Error **errp)
          *
          * This means that V depends on both D and F.
          */
-        if (!(cpu->cfg.ext_d && cpu->cfg.ext_f)) {
+        if (!(misa_ext & RVD && misa_ext & RVF)) {
             error_setg(errp, "V extension requires D and F extensions");
             return;
         }
 
-        riscv_cpu_validate_v(env, &cpu->cfg, &local_err);
+        riscv_cpu_validate_v(env, riscv_cpu_cfg(env), &local_err);
         if (local_err != NULL) {
             error_propagate(errp, local_err);
             return;
@@ -1331,6 +1334,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     CPUState *cs = CPU(dev);
     RISCVCPU *cpu = RISCV_CPU(dev);
     RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
+    CPURISCVState *env = &cpu->env;
     Error *local_err = NULL;
 
     cpu_exec_realizefn(cs, &local_err);
@@ -1355,7 +1359,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         riscv_set_G_virt_ext(cpu);
     }
 
-    riscv_cpu_validate_misa_ext(cpu, &local_err);
+    riscv_cpu_validate_misa_ext(env, env->misa_ext, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
         return;
-- 
2.39.2


