Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m1hLy-00072Q-52
	for mharc-qemu-riscv@gnu.org; Thu, 08 Jul 2021 23:39:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=81790befc=alistair.francis@wdc.com>)
 id 1m1hLv-0006xx-GY; Thu, 08 Jul 2021 23:38:59 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:20853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=81790befc=alistair.francis@wdc.com>)
 id 1m1hLs-0001SI-7E; Thu, 08 Jul 2021 23:38:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1625801935; x=1657337935;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QaqzgnaVW6uASn5j3zCSImC8+y0lEOfimolt1+v71SE=;
 b=E+h8ivue52s3t9Ra8USpsvQiw/BPrRey94E4PLFX7VJd3BUm8wknoOBv
 hd6itXcDXqik6vrYS8vvpb10OZKL0VNEqdB/UVeE+EEkL3QscG1zrBt3n
 EzWF3fevOH2kttfxt9qZ832O3g7zao4DVq9Cwz5Naa1RLDWRgKFMhVZcM
 w+TNaZhpSY7JoxOR+JH5YgRlLdXoQernqjAD93M9RFqtZZqg8sfoJwxDE
 Td+uEvEb7ixwDrs211J7C5IdSIVIlj5A1iWOJyRHPYt69Heplh7/gyyPR
 YSUtllyj5fWd3RIFXegHAtITSjL7glTHFOGMT3IROQSw+h/Ww2njmZOAm A==;
IronPort-SDR: 15B478QQX1JVXFfPWBnyUnAP/hJvO4Tl3iW0R/A+dquM/u9V8PoycFW5Xg7rT579l+HiM+JEi6
 VqrpPCzDQLUrG0Py2bMTO1uJeJ8PkhkDY86h15jYH+sN+G2c+o0wJjN8OYqpc/r7oPJg18CixH
 am6aY6tg4SXDnfQxBSbk/2gC9QzsZz1CqJOEPwtGwvcB3dgUtZmliwtdgb1qQE0eCg2Xrf9rN7
 0ZSdr8CY6CViGbtzfXEsw8bFqmgekb1uhALBqx7Vmjh515BYyhPD7ge4H2bFuK/ZThcdkjMNb3
 jmQ=
X-IronPort-AV: E=Sophos;i="5.84,225,1620662400"; d="scan'208";a="174125684"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 09 Jul 2021 11:38:53 +0800
IronPort-SDR: wZxHNOc4xzvuT55zG6gJA4V845/HFg7PfLNzFaQ8NYFsH/LIUQSLEWVsuTpgULDDTjQkQVJRes
 TcRKbbBMITtM/jvASaIyeLaxDw0ZjXcUTfTGFlHARdp2ZfdXRPorpSIL/X3Mjx4C3fiXK7WL6K
 USeatQv0YvNNU8DOVGq9EN2JM8cviCaYZuLSA4DUnOXvaomYTwgf/Q7aGHtKSSnvDbCOZtwRrp
 5QyFGtnGHNhXjc2zvLod72vhbktk3s3T6JdWxDDvP/OjF9aLBcgKmYS2QE9ef34FStJtY/bF53
 Gi4Tw2KfziBRmblTxY+sFBNN
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2021 20:15:52 -0700
IronPort-SDR: DijFmbzsrPZ8d2P/CkO2U0kyEUMO1f/lRwG6n4fTB/0pViNW5pem6u5J1de7m0BCNGgHkdFM2z
 AkOWy7+SIThYbmi/rg8ZW8u1IpeAgMNKP0HtRZ/LKvjYezfz4Z9Ag9T4SBgti24FEkhozbBJJy
 CMJgaCkbFb7FD0/+bIj+GBeBy81QhESDHpKDDdMTFqesNUQk5ELmA4DJDCS2sf0kigTv35dKqJ
 bZv/CZS/qdjdF5w7L0cPb7GfmnUTw70B7HJuEEjbZhMGLrZEhCYGLQl3NlxWqwnjuygGSW63Lp
 mKw=
WDCIronportException: Internal
Received: from unknown (HELO toolbox.wdc.com) ([10.225.165.107])
 by uls-op-cesaip02.wdc.com with ESMTP; 08 Jul 2021 20:38:50 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v2 3/3] hw/riscv: opentitan: Add the flash alias
Date: Fri,  9 Jul 2021 13:38:48 +1000
Message-Id: <c9cfbd2dd840fd0076877b8ea4d6dcfce60db5e9.1625801868.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1625801868.git.alistair.francis@wdc.com>
References: <cover.1625801868.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=81790befc=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Fri, 09 Jul 2021 03:39:00 -0000

OpenTitan has an alias of flash avaliable which is called virtual flash.
Add support for that in the QEMU model.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/riscv/opentitan.h | 2 ++
 hw/riscv/opentitan.c         | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/include/hw/riscv/opentitan.h b/include/hw/riscv/opentitan.h
index a488f5e8ec..9f93bebdac 100644
--- a/include/hw/riscv/opentitan.h
+++ b/include/hw/riscv/opentitan.h
@@ -40,6 +40,7 @@ struct LowRISCIbexSoCState {
 
     MemoryRegion flash_mem;
     MemoryRegion rom;
+    MemoryRegion flash_alias;
 };
 
 typedef struct OpenTitanState {
@@ -54,6 +55,7 @@ enum {
     IBEX_DEV_ROM,
     IBEX_DEV_RAM,
     IBEX_DEV_FLASH,
+    IBEX_DEV_FLASH_VIRTUAL,
     IBEX_DEV_UART,
     IBEX_DEV_GPIO,
     IBEX_DEV_SPI,
diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index 933c211b11..36a41c8b5b 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -59,6 +59,7 @@ static const MemMapEntry ibex_memmap[] = {
     [IBEX_DEV_NMI_GEN] =        {  0x411c0000,  0x1000  },
     [IBEX_DEV_OTBN] =           {  0x411d0000,  0x10000 },
     [IBEX_DEV_PERI] =           {  0x411f0000,  0x10000 },
+    [IBEX_DEV_FLASH_VIRTUAL] =  {  0x80000000,  0x80000 },
 };
 
 static void opentitan_board_init(MachineState *machine)
@@ -134,8 +135,13 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
     /* Flash memory */
     memory_region_init_rom(&s->flash_mem, OBJECT(dev_soc), "riscv.lowrisc.ibex.flash",
                            memmap[IBEX_DEV_FLASH].size, &error_fatal);
+    memory_region_init_alias(&s->flash_alias, OBJECT(dev_soc),
+                             "riscv.lowrisc.ibex.flash_virtual", &s->flash_mem, 0,
+                             memmap[IBEX_DEV_FLASH_VIRTUAL].size);
     memory_region_add_subregion(sys_mem, memmap[IBEX_DEV_FLASH].base,
                                 &s->flash_mem);
+    memory_region_add_subregion(sys_mem, memmap[IBEX_DEV_FLASH_VIRTUAL].base,
+                                &s->flash_alias);
 
     /* PLIC */
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->plic), errp)) {
-- 
2.31.1


