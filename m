Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iP7Pg-0005Pz-AN
	for mharc-qemu-riscv@gnu.org; Mon, 28 Oct 2019 11:58:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34711)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@sifive.com>) id 1iP7Pc-0005Iu-K6
 for qemu-riscv@nongnu.org; Mon, 28 Oct 2019 11:58:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@sifive.com>) id 1iP7Pb-0003rq-7m
 for qemu-riscv@nongnu.org; Mon, 28 Oct 2019 11:58:32 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:45109)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@sifive.com>) id 1iP7Pb-0003rK-2G
 for qemu-riscv@nongnu.org; Mon, 28 Oct 2019 11:58:31 -0400
Received: by mail-pg1-x544.google.com with SMTP id r1so7137657pgj.12
 for <qemu-riscv@nongnu.org>; Mon, 28 Oct 2019 08:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=e7M7/g3Lxi9UwHK1x9XgkX5SPo7otVzIHSY4iLY4NQw=;
 b=WMzbUqIEG28xpHs6tMe/y+DW0zlwaXdKlHfXv8sJZowe0ki4eerPCVb9XTQ7tLIHkc
 dKBAl0vhKTr1y9PdXHjbNdwv3ShMUm0sfs80hvbBPjSulHo05HjyTIWDZFVdHEZFtfrB
 CAznVIdGtvpjNFoMuivYUgEJl1/srbvvZ7VPpKOZfkYRxV8LRknUKbAqLAVOuVCAY/g1
 o1dctuHostUthxAHDH6pTqo6x6rggjXXYTYyq3/JmXJvXojWVfMxYCeyrtFIloHtTWsP
 8MCDLIjY+wWhpYW29sQ7kupqFh2EVtHB+X2UhCIf8lWcykAztCCT9FU1l56qW6Mm87m+
 Fitw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=e7M7/g3Lxi9UwHK1x9XgkX5SPo7otVzIHSY4iLY4NQw=;
 b=dlBXorkJbVsG1xFkJqwGzgZuS6Zx2ntv05XlqUJa/YJOCGyRt+5efTTa100AZXOKq9
 eqLcpCCIEQIbjdwocpOu7Duf/yYpxTavBOFfW8G9EnAASTEX8i4m2oRUxAPDoYNUEw68
 X+UH8TSbhC6hJtgEok7pBgYK7Wct9EtRHsyaTma6I6wuDW3+owtPazYOKvivavl6Ntdy
 jeweFJie2ZteUgwI6Xa1fNwXsGuBvDZA60vhlQedP0Fef1qcMfjAK1hTwBtZ99fa7NoT
 7TWLvJZMbChfiIhzDIJC+Ct6Tbjag7j4fq5K41MOLQWH2Gk6gl3m2Y5/Enbph5a3CaZ9
 c0mw==
X-Gm-Message-State: APjAAAXg02EQTcS2QVHJXEQD811PrR5//Svhsvw0KNdMVdTki02moMsa
 UnaIkU2LC2DlT8L6VEqMciMRHQ==
X-Google-Smtp-Source: APXvYqzHLJyhtdaSgzal0XpUko9I7J+6wasJrNFWVDwB0l7HmdoDXXNpG8+uLNIOO3QLOsZkAm4Omg==
X-Received: by 2002:a63:9543:: with SMTP id t3mr21805496pgn.350.1572278310012; 
 Mon, 28 Oct 2019 08:58:30 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id l11sm12942229pgf.73.2019.10.28.08.58.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 08:58:29 -0700 (PDT)
Subject: [PULL 08/18] riscv/sifive_u: Add QSPI memory region
Date: Mon, 28 Oct 2019 08:48:52 -0700
Message-Id: <20191028154902.32491-9-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191028154902.32491-1-palmer@sifive.com>
References: <20191028154902.32491-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
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
X-List-Received-Date: Mon, 28 Oct 2019 15:58:35 -0000

From: Alistair Francis <alistair.francis@wdc.com>

The HiFive Unleashed uses is25wp256 SPI NOR flash. There is currently no
model of this in QEMU, so to allow boot firmware developers to use QEMU
to target the Unleashed let's add a chunk of memory to represent the QSPI0
memory mapped flash. This can be targeted using QEMU's -device loader
command line option.

In the future we can look at adding a model for the is25wp256 flash.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/sifive_u.c         | 8 ++++++++
 include/hw/riscv/sifive_u.h | 1 +
 2 files changed, 9 insertions(+)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index fbaa3a234e..a32d6773a8 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -71,6 +71,7 @@ static const struct MemmapEntry {
     [SIFIVE_U_UART0] =    { 0x10010000,     0x1000 },
     [SIFIVE_U_UART1] =    { 0x10011000,     0x1000 },
     [SIFIVE_U_OTP] =      { 0x10070000,     0x1000 },
+    [SIFIVE_U_FLASH0] =   { 0x20000000, 0x10000000 },
     [SIFIVE_U_DRAM] =     { 0x80000000,        0x0 },
     [SIFIVE_U_GEM] =      { 0x10090000,     0x2000 },
     [SIFIVE_U_GEM_MGMT] = { 0x100a0000,     0x1000 },
@@ -314,6 +315,7 @@ static void riscv_sifive_u_init(MachineState *machine)
     SiFiveUState *s = g_new0(SiFiveUState, 1);
     MemoryRegion *system_memory = get_system_memory();
     MemoryRegion *main_mem = g_new(MemoryRegion, 1);
+    MemoryRegion *flash0 = g_new(MemoryRegion, 1);
     int i;
 
     /* Initialize SoC */
@@ -329,6 +331,12 @@ static void riscv_sifive_u_init(MachineState *machine)
     memory_region_add_subregion(system_memory, memmap[SIFIVE_U_DRAM].base,
                                 main_mem);
 
+    /* register QSPI0 Flash */
+    memory_region_init_ram(flash0, NULL, "riscv.sifive.u.flash0",
+                           memmap[SIFIVE_U_FLASH0].size, &error_fatal);
+    memory_region_add_subregion(system_memory, memmap[SIFIVE_U_FLASH0].base,
+                                flash0);
+
     /* create device tree */
     create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline);
 
diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
index 66ee76a780..0062276190 100644
--- a/include/hw/riscv/sifive_u.h
+++ b/include/hw/riscv/sifive_u.h
@@ -64,6 +64,7 @@ enum {
     SIFIVE_U_UART0,
     SIFIVE_U_UART1,
     SIFIVE_U_OTP,
+    SIFIVE_U_FLASH0,
     SIFIVE_U_DRAM,
     SIFIVE_U_GEM,
     SIFIVE_U_GEM_MGMT
-- 
2.21.0


