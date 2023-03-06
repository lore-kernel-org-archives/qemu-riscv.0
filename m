Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pZIwg-0006bC-Hj
	for mharc-qemu-riscv@gnu.org; Mon, 06 Mar 2023 17:04:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pZIwc-0006Uc-Ug
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 17:04:34 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pZIwb-0006pz-2y
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 17:04:34 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 x20-20020a17090a8a9400b00233ba727724so196600pjn.1
 for <qemu-riscv@nongnu.org>; Mon, 06 Mar 2023 14:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678140271;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mbqFcrDJKQyMd5mS2b0pUWsHV6dPfEh5r93Laun+DQc=;
 b=SCBt6FqDujAydx5nRG0uohOYNxI+QmURBeowSsrRd0awl2yXPEsyCGzqWaDpw/j7UO
 CYAAOgd5V1Mv06MGxu4YcinYZ6Gt2yM6xNfXEXQWosJJZmqbQgSArnv0s+n0F4yJqjxm
 1MJOeLjt0K3yRkssxVMrrfqafaMfY+HIrjQWiKr4tRbqzgPFxW6+fa4DgdJv5SlEMsfg
 mXpCG+GcuRu0LrO9rnS4j+oUWQJyXiqscJdltQ5CzVM4mpBWJ00PRU1+TmimjNhX4acr
 GDqe5ggRYEcNRi0uqAyTyPLE6NFpf8UBt4olx6cO4Vsy8lR3xaIgZzGXkrU7DM4346cs
 SEDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678140271;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mbqFcrDJKQyMd5mS2b0pUWsHV6dPfEh5r93Laun+DQc=;
 b=lJyedX/B7OcNe9QOqGac6eths5rtQ/hiKyybCiAI9/eK+BCI8mHZWr1jjY9y6ds9ku
 MEQJBNOUqmUxYVXSM+HtMzZsm488RchRhZdZ2ESnXvw8KBkLPDfKQelxxi7XCsXLVi6O
 lrrkGnUoommtJ0aJDOS6mXqSRPqLlIppewBBL3IQwkB7Dx0th0bGbEzZIpQSBAcmZB7c
 juG2l4Ntvepiw2A5DiMT4NV40EDV4L9DI6gsV74pe/yMlJAFqY4hipOj4e4IuMR+UBKI
 a/EcPLKExYYi12vEXlQ9nb1XcXq4Rp8O7dGKo7ytlFOd+lsnr0T2T3Dm9JKzJpyK5fUl
 n76g==
X-Gm-Message-State: AO0yUKVN5Vr/v0Xl9S/3L4oD/Q4Q5jpip8Z8QZs9pGYof870VIqBWjZv
 X/tnFslNl+QMInBS7nS256cTRMMwXTy+Dyuvhh4=
X-Google-Smtp-Source: AK7set+k0rcnVkX/AnahiQH5ck9EzFxz4qWwnAUxGlkugTuam6WXVIVOFHjkU0U0WGxOdJyL3J5syw==
X-Received: by 2002:a17:90b:1c87:b0:234:d78:9b4c with SMTP id
 oo7-20020a17090b1c8700b002340d789b4cmr12700523pjb.18.1678140271427; 
 Mon, 06 Mar 2023 14:04:31 -0800 (PST)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 y31-20020a63181f000000b004f27761a9e7sm6438336pgl.12.2023.03.06.14.04.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 14:04:31 -0800 (PST)
Subject: [PULL 07/22] hw: intc: Use cpu_by_arch_id to fetch CPU state
Date: Mon,  6 Mar 2023 14:02:44 -0800
Message-Id: <20230306220259.7748-8-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230306220259.7748-1-palmer@rivosinc.com>
References: <20230306220259.7748-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Mayuresh Chitale <mchitale@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=palmer@rivosinc.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 06 Mar 2023 22:04:35 -0000

From: Mayuresh Chitale <mchitale@ventanamicro.com>

Qemu_get_cpu uses the logical CPU id assigned during init to fetch the
CPU state. However APLIC, IMSIC and ACLINT contain registers and states
which are specific to physical hart Ids. The hart Ids in any given system
might be sparse and hence calls to qemu_get_cpu need to be replaced by
cpu_by_arch_id which performs lookup based on the sparse physical hart IDs.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-ID: <20230303065055.915652-3-mchitale@ventanamicro.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 hw/intc/riscv_aclint.c | 16 ++++++++--------
 hw/intc/riscv_aplic.c  |  4 ++--
 hw/intc/riscv_imsic.c  |  6 +++---
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
index eee04643cb..b466a6abaf 100644
--- a/hw/intc/riscv_aclint.c
+++ b/hw/intc/riscv_aclint.c
@@ -130,7 +130,7 @@ static uint64_t riscv_aclint_mtimer_read(void *opaque, hwaddr addr,
         addr < (mtimer->timecmp_base + (mtimer->num_harts << 3))) {
         size_t hartid = mtimer->hartid_base +
                         ((addr - mtimer->timecmp_base) >> 3);
-        CPUState *cpu = qemu_get_cpu(hartid);
+        CPUState *cpu = cpu_by_arch_id(hartid);
         CPURISCVState *env = cpu ? cpu->env_ptr : NULL;
         if (!env) {
             qemu_log_mask(LOG_GUEST_ERROR,
@@ -173,7 +173,7 @@ static void riscv_aclint_mtimer_write(void *opaque, hwaddr addr,
         addr < (mtimer->timecmp_base + (mtimer->num_harts << 3))) {
         size_t hartid = mtimer->hartid_base +
                         ((addr - mtimer->timecmp_base) >> 3);
-        CPUState *cpu = qemu_get_cpu(hartid);
+        CPUState *cpu = cpu_by_arch_id(hartid);
         CPURISCVState *env = cpu ? cpu->env_ptr : NULL;
         if (!env) {
             qemu_log_mask(LOG_GUEST_ERROR,
@@ -231,7 +231,7 @@ static void riscv_aclint_mtimer_write(void *opaque, hwaddr addr,
 
         /* Check if timer interrupt is triggered for each hart. */
         for (i = 0; i < mtimer->num_harts; i++) {
-            CPUState *cpu = qemu_get_cpu(mtimer->hartid_base + i);
+            CPUState *cpu = cpu_by_arch_id(mtimer->hartid_base + i);
             CPURISCVState *env = cpu ? cpu->env_ptr : NULL;
             if (!env) {
                 continue;
@@ -292,7 +292,7 @@ static void riscv_aclint_mtimer_realize(DeviceState *dev, Error **errp)
     s->timecmp = g_new0(uint64_t, s->num_harts);
     /* Claim timer interrupt bits */
     for (i = 0; i < s->num_harts; i++) {
-        RISCVCPU *cpu = RISCV_CPU(qemu_get_cpu(s->hartid_base + i));
+        RISCVCPU *cpu = RISCV_CPU(cpu_by_arch_id(s->hartid_base + i));
         if (riscv_cpu_claim_interrupts(cpu, MIP_MTIP) < 0) {
             error_report("MTIP already claimed");
             exit(1);
@@ -372,7 +372,7 @@ DeviceState *riscv_aclint_mtimer_create(hwaddr addr, hwaddr size,
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
 
     for (i = 0; i < num_harts; i++) {
-        CPUState *cpu = qemu_get_cpu(hartid_base + i);
+        CPUState *cpu = cpu_by_arch_id(hartid_base + i);
         RISCVCPU *rvcpu = RISCV_CPU(cpu);
         CPURISCVState *env = cpu ? cpu->env_ptr : NULL;
         riscv_aclint_mtimer_callback *cb =
@@ -407,7 +407,7 @@ static uint64_t riscv_aclint_swi_read(void *opaque, hwaddr addr,
 
     if (addr < (swi->num_harts << 2)) {
         size_t hartid = swi->hartid_base + (addr >> 2);
-        CPUState *cpu = qemu_get_cpu(hartid);
+        CPUState *cpu = cpu_by_arch_id(hartid);
         CPURISCVState *env = cpu ? cpu->env_ptr : NULL;
         if (!env) {
             qemu_log_mask(LOG_GUEST_ERROR,
@@ -430,7 +430,7 @@ static void riscv_aclint_swi_write(void *opaque, hwaddr addr, uint64_t value,
 
     if (addr < (swi->num_harts << 2)) {
         size_t hartid = swi->hartid_base + (addr >> 2);
-        CPUState *cpu = qemu_get_cpu(hartid);
+        CPUState *cpu = cpu_by_arch_id(hartid);
         CPURISCVState *env = cpu ? cpu->env_ptr : NULL;
         if (!env) {
             qemu_log_mask(LOG_GUEST_ERROR,
@@ -545,7 +545,7 @@ DeviceState *riscv_aclint_swi_create(hwaddr addr, uint32_t hartid_base,
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
 
     for (i = 0; i < num_harts; i++) {
-        CPUState *cpu = qemu_get_cpu(hartid_base + i);
+        CPUState *cpu = cpu_by_arch_id(hartid_base + i);
         RISCVCPU *rvcpu = RISCV_CPU(cpu);
 
         qdev_connect_gpio_out(dev, i,
diff --git a/hw/intc/riscv_aplic.c b/hw/intc/riscv_aplic.c
index cfd007e629..cd7efc4ad4 100644
--- a/hw/intc/riscv_aplic.c
+++ b/hw/intc/riscv_aplic.c
@@ -833,7 +833,7 @@ static void riscv_aplic_realize(DeviceState *dev, Error **errp)
 
         /* Claim the CPU interrupt to be triggered by this APLIC */
         for (i = 0; i < aplic->num_harts; i++) {
-            RISCVCPU *cpu = RISCV_CPU(qemu_get_cpu(aplic->hartid_base + i));
+            RISCVCPU *cpu = RISCV_CPU(cpu_by_arch_id(aplic->hartid_base + i));
             if (riscv_cpu_claim_interrupts(cpu,
                 (aplic->mmode) ? MIP_MEIP : MIP_SEIP) < 0) {
                 error_report("%s already claimed",
@@ -966,7 +966,7 @@ DeviceState *riscv_aplic_create(hwaddr addr, hwaddr size,
 
     if (!msimode) {
         for (i = 0; i < num_harts; i++) {
-            CPUState *cpu = qemu_get_cpu(hartid_base + i);
+            CPUState *cpu = cpu_by_arch_id(hartid_base + i);
 
             qdev_connect_gpio_out_named(dev, NULL, i,
                                         qdev_get_gpio_in(DEVICE(cpu),
diff --git a/hw/intc/riscv_imsic.c b/hw/intc/riscv_imsic.c
index 4d4d5b50ca..fea3385b51 100644
--- a/hw/intc/riscv_imsic.c
+++ b/hw/intc/riscv_imsic.c
@@ -316,8 +316,8 @@ static const MemoryRegionOps riscv_imsic_ops = {
 static void riscv_imsic_realize(DeviceState *dev, Error **errp)
 {
     RISCVIMSICState *imsic = RISCV_IMSIC(dev);
-    RISCVCPU *rcpu = RISCV_CPU(qemu_get_cpu(imsic->hartid));
-    CPUState *cpu = qemu_get_cpu(imsic->hartid);
+    RISCVCPU *rcpu = RISCV_CPU(cpu_by_arch_id(imsic->hartid));
+    CPUState *cpu = cpu_by_arch_id(imsic->hartid);
     CPURISCVState *env = cpu ? cpu->env_ptr : NULL;
 
     imsic->num_eistate = imsic->num_pages * imsic->num_irqs;
@@ -413,7 +413,7 @@ DeviceState *riscv_imsic_create(hwaddr addr, uint32_t hartid, bool mmode,
                                 uint32_t num_pages, uint32_t num_ids)
 {
     DeviceState *dev = qdev_new(TYPE_RISCV_IMSIC);
-    CPUState *cpu = qemu_get_cpu(hartid);
+    CPUState *cpu = cpu_by_arch_id(hartid);
     uint32_t i;
 
     assert(!(addr & (IMSIC_MMIO_PAGE_SZ - 1)));
-- 
2.39.2


