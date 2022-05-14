Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nplI1-0007B1-Uw
	for mharc-qemu-riscv@gnu.org; Sat, 14 May 2022 02:30:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1nplHy-000776-DH; Sat, 14 May 2022 02:30:06 -0400
Received: from mail-sender-0.a4lg.com
 ([2401:2500:203:30b:4000:6bfe:4757:0]:48394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1nplHw-0007gw-8m; Sat, 14 May 2022 02:30:06 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by mail-sender-0.a4lg.com (Postfix) with ESMTPSA id EF16730008B;
 Sat, 14 May 2022 06:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irq.a4lg.com;
 s=2017s01; t=1652509802;
 bh=lmO57I3TctRE+SEcYH+HjYkuRszpChWOaCw3cMLhwgo=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 Mime-Version:Content-Transfer-Encoding;
 b=CUDJkr7cQ115iXB6PjiZFEFTKe1enZUMJ7jU8Z6sG/pAGp0y5Qv+xjDV0EXQ2FYwD
 9m0be7RVRVkhulN1LEMzTpioJ9fFqgbbhpVXgD5VhWqW+GduzEUQmSxwMaTjXVno3Z
 L8E+FaYtS+n4nNcDGo+UBWa2N3Puzdf1ogRgpybM=
From: Tsukasa OI <research_trasio@irq.a4lg.com>
To: Tsukasa OI <research_trasio@irq.a4lg.com>,
 Alistair Francis <alistair23@gmail.com>,
 Frank Chang <frank.chang@sifive.com>
Cc: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v2 2/2] hw/riscv: Make CPU config error handling generous
 (sifive_e/u/opentitan)
Date: Sat, 14 May 2022 15:29:41 +0900
Message-Id: <09e61e58a7543da44bdb0e0f5368afc8903b4aa6.1652509778.git.research_trasio@irq.a4lg.com>
In-Reply-To: <cover.1652509778.git.research_trasio@irq.a4lg.com>
References: <cover.1652435235.git.research_trasio@irq.a4lg.com>
 <cover.1652509778.git.research_trasio@irq.a4lg.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:2500:203:30b:4000:6bfe:4757:0;
 envelope-from=research_trasio@irq.a4lg.com; helo=mail-sender-0.a4lg.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Sat, 14 May 2022 06:30:07 -0000

If specified CPU configuration is not valid, not just it prints error
message, it aborts and generates core dumps (depends on the operating
system).  This kind of error handling should be used only when a serious
runtime error occurs.

This commit makes error handling on CPU configuration more generous on
sifive_e/u and opentitan machines.  It now just prints error message and
quits (without coredumps and aborts).

This is separate from spike/virt because it involves different type
(TYPE_RISCV_HART_ARRAY) on sifive_e/u and opentitan machines.

Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
---
 hw/riscv/opentitan.c | 2 +-
 hw/riscv/sifive_e.c  | 2 +-
 hw/riscv/sifive_u.c  | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index 2d401dcb23..4495a2c039 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -142,7 +142,7 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
     object_property_set_int(OBJECT(&s->cpus), "num-harts", ms->smp.cpus,
                             &error_abort);
     object_property_set_int(OBJECT(&s->cpus), "resetvec", 0x8080, &error_abort);
-    sysbus_realize(SYS_BUS_DEVICE(&s->cpus), &error_abort);
+    sysbus_realize(SYS_BUS_DEVICE(&s->cpus), &error_fatal);
 
     /* Boot ROM */
     memory_region_init_rom(&s->rom, OBJECT(dev_soc), "riscv.lowrisc.ibex.rom",
diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index dcb87b6cfd..d65d2fd869 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -195,7 +195,7 @@ static void sifive_e_soc_realize(DeviceState *dev, Error **errp)
 
     object_property_set_str(OBJECT(&s->cpus), "cpu-type", ms->cpu_type,
                             &error_abort);
-    sysbus_realize(SYS_BUS_DEVICE(&s->cpus), &error_abort);
+    sysbus_realize(SYS_BUS_DEVICE(&s->cpus), &error_fatal);
 
     /* Mask ROM */
     memory_region_init_rom(&s->mask_rom, OBJECT(dev), "riscv.sifive.e.mrom",
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index cc8c7637cb..a2495b5ae7 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -830,8 +830,8 @@ static void sifive_u_soc_realize(DeviceState *dev, Error **errp)
     qdev_prop_set_string(DEVICE(&s->u_cpus), "cpu-type", s->cpu_type);
     qdev_prop_set_uint64(DEVICE(&s->u_cpus), "resetvec", 0x1004);
 
-    sysbus_realize(SYS_BUS_DEVICE(&s->e_cpus), &error_abort);
-    sysbus_realize(SYS_BUS_DEVICE(&s->u_cpus), &error_abort);
+    sysbus_realize(SYS_BUS_DEVICE(&s->e_cpus), &error_fatal);
+    sysbus_realize(SYS_BUS_DEVICE(&s->u_cpus), &error_fatal);
     /*
      * The cluster must be realized after the RISC-V hart array container,
      * as the container's CPU object is only created on realize, and the
-- 
2.34.1


