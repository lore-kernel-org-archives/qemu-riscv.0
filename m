Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h6EUJ-0007vZ-J5
	for mharc-qemu-riscv@gnu.org; Tue, 19 Mar 2019 09:09:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45307)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h6EUD-0007Uw-9p
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 09:09:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h6EGL-0004lZ-0d
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 08:54:38 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:46592)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h6EGK-0004kf-OO
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 08:54:36 -0400
Received: by mail-pg1-x52d.google.com with SMTP id a22so13755128pgg.13
	for <qemu-riscv@nongnu.org>; Tue, 19 Mar 2019 05:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding:cc:from:to;
	bh=PD+oR9vnDvPRduOmoTFQmsAhAi7d9fxAMz4/Wjoq+qE=;
	b=jnYO+FSSm45A7H7mG/PiALqLCyp94gAWSUCuB/uy12fBAw4hFlfvI5oKEVTkpgPc9a
	XtNU/hifNvq4TT78wM4bxZBMsQ0B8O1VL1SmajCBerqdru3jAMud6j4k7iOQYQ/qNydT
	G5zStpiEBLMKt3FFdYpocY8ErEoic54CeCC/L53Efi7e+HlojUeoN7zdUSpUO/Ql20NX
	GwliJXTnfMyppP9e7ECevnpXb67LHkFuTf60Nff+yZHCr83t00rXFUbmFDbAvMo6Hxn+
	yIQQuxJBxfCoprj+QnjOVI4iwv7kjBUm2qEkKdU+3GYbAKew0k99ERrgQY7cD9yPL6vo
	MPrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=PD+oR9vnDvPRduOmoTFQmsAhAi7d9fxAMz4/Wjoq+qE=;
	b=mXwEJsZhUwCD9MTi0hFtso6bVYTvY1lBeCcqruEK1s2+XhPWo3IwvKFg7h7eCcH9f8
	+4koZ51cSSQIB8ttM3toFAj8me1dgVwshrma4cCsf1XhTvvTPW0ghrzNeCIpeVXeiXBc
	6/dXar1NjQ877t8ckpklTD/AtMorlmQyVEWyxs8DJXWY8tPvkn8BavmjQY9MGTr7b9kY
	Ewd57JiGuwtlWBigSp6Syt7tdOhRHX2Lr1edg0m8ljdn/iu4J4szLu4goLlFdEokLfQX
	LIyXlL4fUhONAjtZvgHNH9GS0Wnlz6CiVVGfUXJ8qKrue+LfVbCl9FnNE9sVGpLX2xWX
	/EOg==
X-Gm-Message-State: APjAAAW++5oX9eYbAF4QUSPZbg/LYA4jY6+ahjOTZKrwDq+CgdU7PxnR
	2vHR1KLEF4agKAwSId1B83TvcbRv5vmtG3L0
X-Google-Smtp-Source: APXvYqzQgtUnZ1fmpTkZSBX+0g1Lwf5RS0MbYtUyIqxUCgFmKP4NAbuvclbNNmDT7bOvYZQZxVbmdQ==
X-Received: by 2002:a63:5659:: with SMTP id g25mr1363781pgm.436.1553000075614; 
	Tue, 19 Mar 2019 05:54:35 -0700 (PDT)
Received: from localhost
	(2001-b011-7001-1cad-363a-ebbe-dac8-3f4c.dynamic-ip6.hinet.net.
	[2001:b011:7001:1cad:363a:ebbe:dac8:3f4c])
	by smtp.gmail.com with ESMTPSA id
	20sm26847266pfs.182.2019.03.19.05.54.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Mar 2019 05:54:34 -0700 (PDT)
Date: Tue, 19 Mar 2019 05:47:52 -0700
Message-Id: <20190319124803.13826-9-palmer@sifive.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190319124803.13826-1-palmer@sifive.com>
References: <20190319124803.13826-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
	Michael Clark <mjc@sifive.com>, Palmer Dabbelt <palmer@sifive.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
	Alistair Francis <Alistair.Francis@wdc.com>,
	Alistair Francis <alistair.francis@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::52d
Subject: [Qemu-riscv] [PULL 08/19] RISC-V: Allow interrupt controllers to
 claim interrupts
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Mar 2019 13:09:00 -0000

From: Michael Clark <mjc@sifive.com>

We can't allow the supervisor to control SEIP as this would allow the
supervisor to clear a pending external interrupt which will result in
lost a interrupt in the case a PLIC is attached. The SEIP bit must be
hardware controlled when a PLIC is attached.

This logic was previously hard-coded so SEIP was always masked even
if no PLIC was attached. This patch adds riscv_cpu_claim_interrupts
so that the PLIC can register control of SEIP. In the case of models
without a PLIC (spike), the SEIP bit remains software controlled.

This interface allows for hardware control of supervisor timer and
software interrupts by other interrupt controller models.

Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Cc: Alistair Francis <Alistair.Francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/sifive_plic.c    | 15 +++++++++++++++
 target/riscv/cpu.h        |  2 ++
 target/riscv/cpu_helper.c | 11 +++++++++++
 target/riscv/csr.c        | 10 ++--------
 4 files changed, 30 insertions(+), 8 deletions(-)

diff --git a/hw/riscv/sifive_plic.c b/hw/riscv/sifive_plic.c
index b859f919a71d..1c703e1a376a 100644
--- a/hw/riscv/sifive_plic.c
+++ b/hw/riscv/sifive_plic.c
@@ -23,6 +23,7 @@
 #include "qemu/error-report.h"
 #include "hw/sysbus.h"
 #include "target/riscv/cpu.h"
+#include "sysemu/sysemu.h"
 #include "hw/riscv/sifive_plic.h"
 
 #define RISCV_DEBUG_PLIC 0
@@ -431,6 +432,7 @@ static void sifive_plic_irq_request(void *opaque, int irq, int level)
 static void sifive_plic_realize(DeviceState *dev, Error **errp)
 {
     SiFivePLICState *plic = SIFIVE_PLIC(dev);
+    int i;
 
     memory_region_init_io(&plic->mmio, OBJECT(dev), &sifive_plic_ops, plic,
                           TYPE_SIFIVE_PLIC, plic->aperture_size);
@@ -443,6 +445,19 @@ static void sifive_plic_realize(DeviceState *dev, Error **errp)
     plic->enable = g_new0(uint32_t, plic->bitfield_words * plic->num_addrs);
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &plic->mmio);
     qdev_init_gpio_in(dev, sifive_plic_irq_request, plic->num_sources);
+
+    /* We can't allow the supervisor to control SEIP as this would allow the
+     * supervisor to clear a pending external interrupt which will result in
+     * lost a interrupt in the case a PLIC is attached. The SEIP bit must be
+     * hardware controlled when a PLIC is attached.
+     */
+    for (i = 0; i < smp_cpus; i++) {
+        RISCVCPU *cpu = RISCV_CPU(qemu_get_cpu(i));
+        if (riscv_cpu_claim_interrupts(cpu, MIP_SEIP) < 0) {
+            error_report("SEIP already claimed");
+            exit(1);
+        }
+    }
 }
 
 static void sifive_plic_class_init(ObjectClass *klass, void *data)
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 9b673de23e90..df43a0898d65 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -140,6 +140,7 @@ struct CPURISCVState {
      * mip is 32-bits to allow atomic_read on 32-bit hosts.
      */
     uint32_t mip;
+    uint32_t miclaim;
 
     target_ulong mie;
     target_ulong mideleg;
@@ -266,6 +267,7 @@ void riscv_cpu_list(FILE *f, fprintf_function cpu_fprintf);
 #define cpu_mmu_index riscv_cpu_mmu_index
 
 #ifndef CONFIG_USER_ONLY
+int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint32_t interrupts);
 uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_t mask, uint32_t value);
 #define BOOL_TO_MASK(x) (-!!(x)) /* helper for riscv_cpu_update_mip value */
 #endif
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index f49e98ed594b..555756d40cfb 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -72,6 +72,17 @@ bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 
 #if !defined(CONFIG_USER_ONLY)
 
+int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint32_t interrupts)
+{
+    CPURISCVState *env = &cpu->env;
+    if (env->miclaim & interrupts) {
+        return -1;
+    } else {
+        env->miclaim |= interrupts;
+        return 0;
+    }
+}
+
 /* iothread_mutex must be held */
 uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_t mask, uint32_t value)
 {
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 9a40b4c7baed..385bb38768d0 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -550,16 +550,10 @@ static int rmw_mip(CPURISCVState *env, int csrno, target_ulong *ret_value,
                    target_ulong new_value, target_ulong write_mask)
 {
     RISCVCPU *cpu = riscv_env_get_cpu(env);
-    target_ulong mask = write_mask & delegable_ints;
+    /* Allow software control of delegable interrupts not claimed by hardware */
+    target_ulong mask = write_mask & delegable_ints & ~env->miclaim;
     uint32_t old_mip;
 
-    /* We can't allow the supervisor to control SEIP as this would allow the
-     * supervisor to clear a pending external interrupt which will result in
-     * lost a interrupt in the case a PLIC is attached. The SEIP bit must be
-     * hardware controlled when a PLIC is attached. This should be an option
-     * for CPUs with software-delegated Supervisor External Interrupts. */
-    mask &= ~MIP_SEIP;
-
     if (mask) {
         qemu_mutex_lock_iothread();
         old_mip = riscv_cpu_update_mip(cpu, mask, (new_value & mask));
-- 
2.19.2


