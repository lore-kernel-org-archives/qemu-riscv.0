Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pFec2-0002i2-JL
	for mharc-qemu-riscv@gnu.org; Wed, 11 Jan 2023 12:10:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pFec0-0002h9-PS
 for qemu-riscv@nongnu.org; Wed, 11 Jan 2023 12:10:04 -0500
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pFeby-00069z-HE
 for qemu-riscv@nongnu.org; Wed, 11 Jan 2023 12:10:03 -0500
Received: by mail-oo1-xc36.google.com with SMTP id
 s10-20020a4aa54a000000b004f240f120b3so380692oom.1
 for <qemu-riscv@nongnu.org>; Wed, 11 Jan 2023 09:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DPONLIzIEy/3UQV9VjMXIl8RnUsRqK9vSoHXVRNeILc=;
 b=o4RMcKEM7PDjq66qO5ILPI4+50kxiFwI1Qe7/NK+PYZwMwomH1BdDsFsViq2FyUc7E
 59G+XFjDpG5hRBhzORLsWsAD/FCVQ4mXTU6yuy/BoiuljzNNLZSfPrJU6FeWoL+MLdqe
 edOkc/X+gDqDkGCoOViLmIHU3k4XDVt01N5GawsbHz6sYp4GkiLrx/k28wd3hd90/+lW
 gGuYrPN4cLBXRfWXnF3zTDH1BiRD3FTrNccU4ucWBUxuu0QLfJvgJpRgpT6qcEaQBtbX
 Bs6WypDDjtA6P0jxh/3F8hFl2KIRhCOoeK13wcycemwIQewBbdjkQO9JBmACeopw4JLi
 Vzuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DPONLIzIEy/3UQV9VjMXIl8RnUsRqK9vSoHXVRNeILc=;
 b=258dPOXBQA/ytUYhOxkU2+9u/LAx1ohbRNTl0TD4fLoZlVQCHlDCDu4/B0l3m7rUwz
 8J8lTRuz2Fm9QZ/mP4rMXHLSGa83iDQImkdA1Iw62UyqnBLpfdH/NiWfKujlqSMYPwNQ
 KWx6PlhL9Xr1MyeYzfrzmTkV2Nn39ziJZKXsvc8tajn/mzuCHAnSTQ38nzxakkm7ib/u
 KvaX9sVC/1Bijpmd4nVJ4th9Ft7V9ZcZcRNlmhZtKuc4PeYYQ2pT/HEnXnY3IiMMMLmx
 avTSJdULCRQ75VAjPqddIp+24TKpflVETdfRHF+gIRouUAoV7Sar6E1MK3Muvj9C3TH5
 AxAw==
X-Gm-Message-State: AFqh2krfx3qxVdRIVRfKuq2NtMJy17fsaH/D1t5IndtHpMSuBPBhJwp2
 Sez/8b0RihjGiDSL/UX7AgTPfUz3jL9YvN3273A=
X-Google-Smtp-Source: AMrXdXtkfl4QADQqITJKwHm1S6GlYPwmAjvPaTnw/pJumAF+OIalE1qpkaIG700gZO40KIBXte7erw==
X-Received: by 2002:a4a:dbd8:0:b0:4a0:bc7f:462c with SMTP id
 t24-20020a4adbd8000000b004a0bc7f462cmr31480242oou.9.1673457001365; 
 Wed, 11 Jan 2023 09:10:01 -0800 (PST)
Received: from grind.. ([191.17.222.2]) by smtp.gmail.com with ESMTPSA id
 x18-20020a4ac592000000b004a3543fbfbbsm7214974oop.14.2023.01.11.09.09.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jan 2023 09:10:00 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 03/10] hw/riscv/sifive_u.c: simplify create_fdt()
Date: Wed, 11 Jan 2023 14:09:41 -0300
Message-Id: <20230111170948.316276-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111170948.316276-1-dbarboza@ventanamicro.com>
References: <20230111170948.316276-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c36;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc36.google.com
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
X-List-Received-Date: Wed, 11 Jan 2023 17:10:05 -0000

'cmdline' isn't being used. Remove it.

A MachineState pointer is being retrieved via a MACHINE() macro calling
qdev_get_machine(). Use MACHINE(s) instead to avoid calling qdev().

 'mem_size' is being set as machine->ram_size by the caller. Retrieve it
via ms->ram_size.

Cc: Palmer Dabbelt <palmer@dabbelt.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/sifive_u.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 9a75d4aa62..ccad386920 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -94,9 +94,10 @@ static const MemMapEntry sifive_u_memmap[] = {
 #define GEM_REVISION        0x10070109
 
 static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
-                       uint64_t mem_size, const char *cmdline, bool is_32_bit)
+                       bool is_32_bit)
 {
-    MachineState *ms = MACHINE(qdev_get_machine());
+    MachineState *ms = MACHINE(s);
+    uint64_t mem_size = ms->ram_size;
     void *fdt;
     int cpu, fdt_size;
     uint32_t *cells;
@@ -560,8 +561,7 @@ static void sifive_u_machine_init(MachineState *machine)
                           qemu_allocate_irq(sifive_u_machine_reset, NULL, 0));
 
     /* create device tree */
-    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
-               riscv_is_32bit(&s->soc.u_cpus));
+    create_fdt(s, memmap, riscv_is_32bit(&s->soc.u_cpus));
 
     if (s->start_in_flash) {
         /*
-- 
2.39.0


