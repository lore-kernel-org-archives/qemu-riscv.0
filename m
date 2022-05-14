Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nplI2-0007Bt-Bh
	for mharc-qemu-riscv@gnu.org; Sat, 14 May 2022 02:30:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1nplHx-00076P-MD; Sat, 14 May 2022 02:30:05 -0400
Received: from mail-sender-0.a4lg.com
 ([2401:2500:203:30b:4000:6bfe:4757:0]:48384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1nplHu-0007fO-H2; Sat, 14 May 2022 02:30:05 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by mail-sender-0.a4lg.com (Postfix) with ESMTPSA id 6B03030008A;
 Sat, 14 May 2022 06:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irq.a4lg.com;
 s=2017s01; t=1652509796;
 bh=rTgW5DKz+aQMVezOvkK97+TFFW6TxR5YDqsChLPjdH0=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 Mime-Version:Content-Transfer-Encoding;
 b=KIpq7RvQIVquFCq+MA43GUxpEs24z3Ok/Zoh6poxi14UEo59xMmSs1hd6orfioyM4
 3xYAqESp9Phk17mS0jHd1cXSV0GgWN4DkBCquEM2qgdWu4b50vVDjcfoO1HvhAcsRt
 R60kxiKR2c0x7KrghXcBtkrRXEwl5fRlMUg+B+VM=
From: Tsukasa OI <research_trasio@irq.a4lg.com>
To: Tsukasa OI <research_trasio@irq.a4lg.com>,
 Alistair Francis <alistair23@gmail.com>,
 Frank Chang <frank.chang@sifive.com>
Cc: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v2 1/2] hw/riscv: Make CPU config error handling generous
 (virt/spike)
Date: Sat, 14 May 2022 15:29:40 +0900
Message-Id: <d17381d3ea4992808cf1894f379ca67220f61b45.1652509778.git.research_trasio@irq.a4lg.com>
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
X-List-Received-Date: Sat, 14 May 2022 06:30:06 -0000

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


