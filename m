Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1npRtZ-0007oH-9I
	for mharc-qemu-riscv@gnu.org; Fri, 13 May 2022 05:47:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1npRtW-0007hR-Vd; Fri, 13 May 2022 05:47:34 -0400
Received: from mail-sender-0.a4lg.com
 ([2401:2500:203:30b:4000:6bfe:4757:0]:48332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1npRtV-00054x-1R; Fri, 13 May 2022 05:47:34 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by mail-sender-0.a4lg.com (Postfix) with ESMTPSA id CE21D300089;
 Fri, 13 May 2022 09:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irq.a4lg.com;
 s=2017s01; t=1652435250;
 bh=rTgW5DKz+aQMVezOvkK97+TFFW6TxR5YDqsChLPjdH0=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 Mime-Version:Content-Transfer-Encoding;
 b=MIsiRIUYRtSlXDvWFsrqsXMtFhhzHzDRWoUYR0SZ6cs3mb0GkjBOAexQXwwhF2rtZ
 jh1UjdWSbIctLATVepZ1uPVTVoEElmDp7cjTOrJQn3wuBpVDgMrx20nfF17OpT/y5p
 vr9rHdmqyUZz23kV6poZpL8DmJgLWGUEwfEWFqQk=
From: Tsukasa OI <research_trasio@irq.a4lg.com>
To: Tsukasa OI <research_trasio@irq.a4lg.com>,
 Alistair Francis <alistair23@gmail.com>,
 Frank Chang <frank.chang@sifive.com>
Cc: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH 1/2] target/riscv: Make CPU config error handling generous
 (virt/spike)
Date: Fri, 13 May 2022 18:47:18 +0900
Message-Id: <a4641902664ac04020cd1e1273385ed578d8a7c7.1652435235.git.research_trasio@irq.a4lg.com>
In-Reply-To: <cover.1652435235.git.research_trasio@irq.a4lg.com>
References: <cover.1652435235.git.research_trasio@irq.a4lg.com>
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
X-List-Received-Date: Fri, 13 May 2022 09:47:35 -0000

If specified CPU configuration is not valid, not just it prints error
message, it aborts and generates core dumps (depends on the operating
system).  This kind of error handling should be used only when a serious
runtime error occurs.

This commit makes error handling on CPU configuration more generous on
virt/spike machines.  It now just prints error message and quits (without
coredumps and aborts).

Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
---
 hw/riscv/spike.c | 2 +-
 hw/riscv/virt.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 068ba3493e..e41b6aa9f0 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -230,7 +230,7 @@ static void spike_board_init(MachineState *machine)
                                 base_hartid, &error_abort);
         object_property_set_int(OBJECT(&s->soc[i]), "num-harts",
                                 hart_count, &error_abort);
-        sysbus_realize(SYS_BUS_DEVICE(&s->soc[i]), &error_abort);
+        sysbus_realize(SYS_BUS_DEVICE(&s->soc[i]), &error_fatal);
 
         /* Core Local Interruptor (timer and IPI) for each socket */
         riscv_aclint_swi_create(
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 3326f4db96..244d6408b5 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1351,7 +1351,7 @@ static void virt_machine_init(MachineState *machine)
                                 base_hartid, &error_abort);
         object_property_set_int(OBJECT(&s->soc[i]), "num-harts",
                                 hart_count, &error_abort);
-        sysbus_realize(SYS_BUS_DEVICE(&s->soc[i]), &error_abort);
+        sysbus_realize(SYS_BUS_DEVICE(&s->soc[i]), &error_fatal);
 
         if (!kvm_enabled()) {
             if (s->have_aclint) {
-- 
2.34.1


