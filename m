Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pAp45-0008Cc-Az
	for mharc-qemu-riscv@gnu.org; Thu, 29 Dec 2022 04:19:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1pAp43-0008Bj-4u; Thu, 29 Dec 2022 04:19:03 -0500
Received: from bg4.exmail.qq.com ([43.155.65.254])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1pAp41-00078A-1Q; Thu, 29 Dec 2022 04:19:02 -0500
X-QQ-mid: bizesmtp73t1672305519tyghhks4
Received: from ubuntu.. ( [111.196.135.79]) by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 29 Dec 2022 17:18:38 +0800 (CST)
X-QQ-SSF: 01200000000000C0C000000A0000000
X-QQ-FEAT: zX46NWeZQGEQzNy9OYEEUi6HdoGPcqEsSi/HYEU6gYrNVrGL9hP7947HYUhnn
 HIfZxifnDFSzSu9ziUy6UI4N43xoudHuVU+LpN2rywCW0XgH7m+VxVqCpw/G2QjVUAd+uB0
 FRqpIctmNPULtMJ7XP/n+wsHDA664aN4i1zRd2aBriEocapqSsmHi4ZjyA/p2E84jiDMpB2
 ha+JDNI/1rsu8h8666bh1KP6fMK05LeOwLwGXEXrPxGgcg8MMXi8l+u6iNqhGnCI/8bPmDa
 fLFz9X3y+/cP5oTBxoH0L26JY3WwtFGKXjgGzzLgIg7vn3v1R0ytKgUokFOPa1gzwAuu1Ag
 xYmwVbzuOnCMZilp1zkgY7nRUHtkTCKiy0g8c/C
X-QQ-GoodBg: 0
From: Bin Meng <bmeng@tinylab.org>
To: Alistair Francis <Alistair.Francis@wdc.com>,
	qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v2 03/12] hw/char: riscv_htif: Drop useless assignment of
 memory region
Date: Thu, 29 Dec 2022 17:18:19 +0800
Message-Id: <20221229091828.1945072-4-bmeng@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221229091828.1945072-1-bmeng@tinylab.org>
References: <20221229091828.1945072-1-bmeng@tinylab.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvr:qybglogicsvr3
Received-SPF: pass client-ip=43.155.65.254; envelope-from=bmeng@tinylab.org;
 helo=bg4.exmail.qq.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 29 Dec 2022 09:19:03 -0000

struct HTIFState has 3 members for address space and memory region,
and are initialized during htif_mm_init(). But they are actually
useless. Drop them.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---

(no changes since v1)

 include/hw/char/riscv_htif.h | 7 ++-----
 hw/char/riscv_htif.c         | 7 ++-----
 hw/riscv/spike.c             | 5 ++---
 3 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/include/hw/char/riscv_htif.h b/include/hw/char/riscv_htif.h
index 3eccc1914f..6d172ebd6d 100644
--- a/include/hw/char/riscv_htif.h
+++ b/include/hw/char/riscv_htif.h
@@ -34,9 +34,6 @@ typedef struct HTIFState {
     hwaddr tohost_offset;
     hwaddr fromhost_offset;
     MemoryRegion mmio;
-    MemoryRegion *address_space;
-    MemoryRegion *main_mem;
-    void *main_mem_ram_ptr;
 
     CPURISCVState *env;
     CharBackend chr;
@@ -54,7 +51,7 @@ void htif_symbol_callback(const char *st_name, int st_info, uint64_t st_value,
 bool htif_uses_elf_symbols(void);
 
 /* legacy pre qom */
-HTIFState *htif_mm_init(MemoryRegion *address_space, MemoryRegion *main_mem,
-    CPURISCVState *env, Chardev *chr, uint64_t nonelf_base);
+HTIFState *htif_mm_init(MemoryRegion *address_space, CPURISCVState *env,
+                        Chardev *chr, uint64_t nonelf_base);
 
 #endif
diff --git a/hw/char/riscv_htif.c b/hw/char/riscv_htif.c
index 088556bb04..e7e319ca1d 100644
--- a/hw/char/riscv_htif.c
+++ b/hw/char/riscv_htif.c
@@ -265,8 +265,8 @@ bool htif_uses_elf_symbols(void)
     return (address_symbol_set == 3) ? true : false;
 }
 
-HTIFState *htif_mm_init(MemoryRegion *address_space, MemoryRegion *main_mem,
-    CPURISCVState *env, Chardev *chr, uint64_t nonelf_base)
+HTIFState *htif_mm_init(MemoryRegion *address_space, CPURISCVState *env,
+                        Chardev *chr, uint64_t nonelf_base)
 {
     uint64_t base, size, tohost_offset, fromhost_offset;
 
@@ -281,9 +281,6 @@ HTIFState *htif_mm_init(MemoryRegion *address_space, MemoryRegion *main_mem,
     fromhost_offset = fromhost_addr - base;
 
     HTIFState *s = g_new0(HTIFState, 1);
-    s->address_space = address_space;
-    s->main_mem = main_mem;
-    s->main_mem_ram_ptr = memory_region_get_ram_ptr(main_mem);
     s->env = env;
     s->tohost_offset = tohost_offset;
     s->fromhost_offset = fromhost_offset;
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 1e1d752c00..82cf41ac27 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -317,9 +317,8 @@ static void spike_board_init(MachineState *machine)
                               fdt_load_addr);
 
     /* initialize HTIF using symbols found in load_kernel */
-    htif_mm_init(system_memory, mask_rom,
-                 &s->soc[0].harts[0].env, serial_hd(0),
-                 memmap[SPIKE_HTIF].base);
+    htif_mm_init(system_memory, &s->soc[0].harts[0].env,
+                 serial_hd(0), memmap[SPIKE_HTIF].base);
 }
 
 static void spike_machine_instance_init(Object *obj)
-- 
2.34.1


