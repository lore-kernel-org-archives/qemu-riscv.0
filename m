Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p83kp-0008Ne-DF
	for mharc-qemu-riscv@gnu.org; Wed, 21 Dec 2022 13:23:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1p83ko-0008NE-NH
 for qemu-riscv@nongnu.org; Wed, 21 Dec 2022 13:23:46 -0500
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1p83kn-0007po-8a
 for qemu-riscv@nongnu.org; Wed, 21 Dec 2022 13:23:46 -0500
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-1447c7aa004so20107888fac.11
 for <qemu-riscv@nongnu.org>; Wed, 21 Dec 2022 10:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YCZj+C44vgbv4KDySdgyMP5uDwH1vphijk3niATbpoQ=;
 b=WkvVSKzWE336zqZ/chyAS51w1iSguphdkXkpjQruZvv6x1zLqrCOXuVvOuSuqWHBTj
 UCDefVmfmS1ThfrlWmPk8NIvr7FVTP5oFkuWeiDukks1srjSoWdBhJlT5VXF/0aSHdS8
 Ea3vSQ/bfBVpQHanSrBJfqsYQHFFTMssEJwCW/iNqALsY0IHy7xOB9w8qfz1s9pZv3GH
 Pv2bJRqyIFPew18NIeo+UBPu9YjGbkqN/7QbR4InL1WNQ8J85w+jXKX5fcWHc09AbUvZ
 DoYc7fYIbDTRRgRyTe08u8GTAQzHOz5LPLI4Z5CcQKJRpK/XPEfKkx8JC4pzCSfbAPXt
 JTTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YCZj+C44vgbv4KDySdgyMP5uDwH1vphijk3niATbpoQ=;
 b=TkS983/p0mUGLhPGQ/bK0Bv03oKKdoD3ZQy9f85wMhWSh4wVh7jpr+h51Nx/EjAgX4
 JghFXfzvTgWQigurc0FsAesjZXt/80JuzkDu84WzX8TtJTJFsN50MVHI+AY5WNgnzQzI
 9J2PSmhhtEV6MykgW8fqBY7fAuzaJNmb4DQhIZgmwTIVSLyVaTi8CMUvMpkp09zkrHAZ
 0BCNQ/hNRV6xTbUFE7G6v5e0RFR9cQu1vk3lvvlnQhqzcq8JsN2/GN8FOtB3ZMb/aSef
 g/9kanNRF9Tv/GRURPHjZFHu4oKuOQ7v1El8PsYfmf0xm+fU5+XxZ/rywYk8+k2ZznHB
 0ryA==
X-Gm-Message-State: AFqh2koV5cZx+l+3UMZz+LosTq3HOEx/FKXHktV/yvihQXaNP8a9sn24
 FkP+PwI8SU7DDdVajJXwTJkvgd7ID/fWjO/J
X-Google-Smtp-Source: AMrXdXt+DZVgK/eIrczVphW5HIcxoEzN7aQ8NTKrNmEhLUv2HKvRRTESLkmXm6GwYItGrVcnADhpdA==
X-Received: by 2002:a05:6871:894:b0:148:53c7:bf30 with SMTP id
 r20-20020a056871089400b0014853c7bf30mr1534337oaq.48.1671647024715; 
 Wed, 21 Dec 2022 10:23:44 -0800 (PST)
Received: from fedora.. (201-43-103-101.dsl.telesp.net.br. [201.43.103.101])
 by smtp.gmail.com with ESMTPSA id
 w8-20020a056871060800b0014c8685f229sm514577oan.10.2022.12.21.10.23.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 10:23:44 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 13/15] hw/riscv/spike.c: simplify create_fdt()
Date: Wed, 21 Dec 2022 15:22:58 -0300
Message-Id: <20221221182300.307900-14-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221221182300.307900-1-dbarboza@ventanamicro.com>
References: <20221221182300.307900-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x30.google.com
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
X-List-Received-Date: Wed, 21 Dec 2022 18:23:46 -0000

'mem_size' and 'cmdline' aren't being used and the MachineState pointer
is being retrieved via a MACHINE() macro.

Remove 'mem_size' and 'cmdline' and add MachineState as a parameter.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/spike.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 2b9af5689e..181bf394a0 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -48,15 +48,14 @@ static const MemMapEntry spike_memmap[] = {
     [SPIKE_DRAM] =     { 0x80000000,        0x0 },
 };
 
-static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
-                       uint64_t mem_size, const char *cmdline, bool is_32_bit)
+static void create_fdt(MachineState *mc, SpikeState *s,
+                       const MemMapEntry *memmap, bool is_32_bit)
 {
     void *fdt;
     int fdt_size;
     uint64_t addr, size;
     unsigned long clint_addr;
     int cpu, socket;
-    MachineState *mc = MACHINE(s);
     uint32_t *clint_cells;
     uint32_t cpu_phandle, intc_phandle, phandle = 1;
     char *name, *mem_name, *clint_name, *clust_name;
@@ -254,8 +253,7 @@ static void spike_board_init(MachineState *machine)
                                 mask_rom);
 
     /* Create device tree */
-    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
-               riscv_is_32bit(&s->soc[0]));
+    create_fdt(machine, s, memmap, riscv_is_32bit(&s->soc[0]));
 
     /*
      * Not like other RISC-V machines that use plain binary bios images,
-- 
2.38.1


