Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pFWdr-0004gM-C6
	for mharc-qemu-riscv@gnu.org; Wed, 11 Jan 2023 03:39:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFWdq-0004f5-JH
 for qemu-riscv@nongnu.org; Wed, 11 Jan 2023 03:39:26 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFWdm-0005RX-HB
 for qemu-riscv@nongnu.org; Wed, 11 Jan 2023 03:39:26 -0500
Received: by mail-wm1-x334.google.com with SMTP id o15so10547127wmr.4
 for <qemu-riscv@nongnu.org>; Wed, 11 Jan 2023 00:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ORcIO3Q16LO89LF5It+n7AHGZNSc9obPcjCMBZ5jUj4=;
 b=CZy+OweFvz0BKtJ56abiVfIZIslTJJA9ISlamm3fNkKjpXJe6j/QtpzmKWRCuwLDJV
 efX+wSEy3zS5m+X579ik8edNWGRD53VnCdmyb5mzRucPSntB6HAC9fp6GKBtpW8EQtO2
 gTQ2KFaW7mUNFsjPqEK/JT68iMzmZn+XyYwyW2rXFYQhxGcSSSqwqWrE3KB4SWAbwKhW
 oaEHlXskdVb8K6M4hPfJrkymL631hhPCjIZrW3vRQoIenQWUkkZi/ModowptsK2P7JW0
 KaKU86FoHaU+zFtnfR+U37XEUf0CJ1br4WolRq2Fikqt1kNSBIxCuaQgKupjpzJMVRU+
 nC3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ORcIO3Q16LO89LF5It+n7AHGZNSc9obPcjCMBZ5jUj4=;
 b=oqcdV0oVPzb+aG0WhCywNQip6hPTApGTl0nQJiLag41K+W9POFOgxJI5NezHQ/MV+N
 v3Cs6Abz80J3NDjMDKbE9saxAGpo+I2Dp4AEKFXIBwBNpI30C4N1cFGUfSFdm763T6KK
 3tcmQWgAktwSgzw0m6pqEBsHMjaxRtS/ihfoYyWUuGt9hBXB6TwoB+jfCks/Zzqp3V4I
 3CwFHPbGgmalhjDhAkal9NFKi7oVPR+SnTliQHzTRVDMGs2cjfYXnMLbwSrE7cgiGh4l
 OnQOnMzDnI2BETkT6eyHWBxxJZV1VwgDSgCb9ZPV1CV/ZwC1OMJvRoRg6gvW18YBcZ4I
 +5qg==
X-Gm-Message-State: AFqh2kpWUMSsbgb9bwG1llJuBTuK6ZhJv+TlFnTi3Fws/X0S2SMV0Hla
 WAbAAAqRewDlurI6TVbn+/MAyWimgohrPn1Y
X-Google-Smtp-Source: AMrXdXsK2zJdXbJ9zuXgMsxqeDvbLXTxzP94s4tNE9+ZpZEuzzL15GgXdCzWJg8DY158E44KtpTQAg==
X-Received: by 2002:a05:600c:3b1c:b0:3d9:f0da:542c with SMTP id
 m28-20020a05600c3b1c00b003d9f0da542cmr7660227wms.28.1673426361111; 
 Wed, 11 Jan 2023 00:39:21 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 i5-20020a5d55c5000000b002a6f329203esm13275728wrw.61.2023.01.11.00.39.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 11 Jan 2023 00:39:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 2/4] bulk: Coding style fixes
Date: Wed, 11 Jan 2023 09:39:07 +0100
Message-Id: <20230111083909.42624-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230111083909.42624-1-philmd@linaro.org>
References: <20230111083909.42624-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 11 Jan 2023 08:39:26 -0000

Fix the following checkpatch.pl violation on lines using the
TARGET_FMT_plx definition to avoid:

  WARNING: line over 80 characters

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/block/pflash_cfi01.c       |  5 +++--
 hw/char/digic-uart.c          |  8 ++++----
 hw/core/sysbus.c              |  3 ++-
 hw/dma/pl330.c                | 16 +++++++++-------
 hw/i386/multiboot.c           |  3 ++-
 hw/i386/xen/xen-hvm.c         |  3 ++-
 hw/i386/xen/xen-mapcache.c    | 13 ++++++++-----
 hw/intc/exynos4210_combiner.c | 20 ++++++++++----------
 hw/misc/auxbus.c              |  3 ++-
 hw/net/allwinner_emac.c       |  8 ++++----
 hw/timer/digic-timer.c        |  8 ++++----
 hw/timer/etraxfs_timer.c      |  3 +--
 softmmu/memory.c              |  3 ++-
 target/ppc/mmu-hash32.c       | 10 ++++++----
 target/ppc/mmu_common.c       |  8 +++++---
 target/sparc/mmu_helper.c     |  5 +++--
 16 files changed, 67 insertions(+), 52 deletions(-)

diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index 0cbc2fb4cb..951419b2ed 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -645,8 +645,9 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
 
  error_flash:
     qemu_log_mask(LOG_UNIMP, "%s: Unimplemented flash cmd sequence "
-                  "(offset " TARGET_FMT_plx ", wcycle 0x%x cmd 0x%x value 0x%x)"
-                  "\n", __func__, offset, pfl->wcycle, pfl->cmd, value);
+                             "(offset " TARGET_FMT_plx
+                             ", wcycle 0x%x cmd 0x%x value 0x%x)\n",
+                  __func__, offset, pfl->wcycle, pfl->cmd, value);
 
  mode_read_array:
     trace_pflash_mode_read_array(pfl->name);
diff --git a/hw/char/digic-uart.c b/hw/char/digic-uart.c
index 00e5df5517..3bbc43193b 100644
--- a/hw/char/digic-uart.c
+++ b/hw/char/digic-uart.c
@@ -62,8 +62,8 @@ static uint64_t digic_uart_read(void *opaque, hwaddr addr,
 
     default:
         qemu_log_mask(LOG_UNIMP,
-                      "digic-uart: read access to unknown register 0x"
-                      TARGET_FMT_plx "\n", addr << 2);
+                      "digic-uart: read access to unknown register"
+                      " 0x" TARGET_FMT_plx "\n", addr << 2);
     }
 
     return ret;
@@ -100,8 +100,8 @@ static void digic_uart_write(void *opaque, hwaddr addr, uint64_t value,
 
     default:
         qemu_log_mask(LOG_UNIMP,
-                      "digic-uart: write access to unknown register 0x"
-                      TARGET_FMT_plx "\n", addr << 2);
+                      "digic-uart: write access to unknown register"
+                      " 0x" TARGET_FMT_plx "\n", addr << 2);
     }
 }
 
diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
index 05c1da3d31..e8b31683e7 100644
--- a/hw/core/sysbus.c
+++ b/hw/core/sysbus.c
@@ -269,7 +269,8 @@ static void sysbus_dev_print(Monitor *mon, DeviceState *dev, int indent)
 
     for (i = 0; i < s->num_mmio; i++) {
         size = memory_region_size(s->mmio[i].memory);
-        monitor_printf(mon, "%*smmio " TARGET_FMT_plx "/" TARGET_FMT_plx "\n",
+        monitor_printf(mon,
+                       "%*smmio " TARGET_FMT_plx "/" TARGET_FMT_plx "\n",
                        indent, "", s->mmio[i].addr, size);
     }
 }
diff --git a/hw/dma/pl330.c b/hw/dma/pl330.c
index e5d521c329..60ce65c2a7 100644
--- a/hw/dma/pl330.c
+++ b/hw/dma/pl330.c
@@ -1337,8 +1337,8 @@ static void pl330_debug_exec(PL330State *s)
     }
     if (ch->stall) {
         trace_pl330_debug_exec_stall();
-        qemu_log_mask(LOG_UNIMP, "pl330: stall of debug instruction not "
-                      "implemented\n");
+        qemu_log_mask(LOG_UNIMP,
+                      "pl330: stall of debug instruction not implemented\n");
     }
     s->debug_status = 0;
 }
@@ -1372,9 +1372,10 @@ static void pl330_iomem_write(void *opaque, hwaddr offset,
             pl330_debug_exec(s);
             pl330_exec(s);
         } else {
-            qemu_log_mask(LOG_GUEST_ERROR, "pl330: write of illegal value %u "
-                          "for offset " TARGET_FMT_plx "\n", (unsigned)value,
-                          offset);
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "pl330: write of illegal value %u"
+                          " for offset " TARGET_FMT_plx "\n",
+                          (unsigned)value, offset);
         }
         break;
     case PL330_REG_DBGINST0:
@@ -1384,8 +1385,9 @@ static void pl330_iomem_write(void *opaque, hwaddr offset,
         s->dbg[1] = value;
         break;
     default:
-        qemu_log_mask(LOG_GUEST_ERROR, "pl330: bad write offset " TARGET_FMT_plx
-                      "\n", offset);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "pl330: bad write offset " TARGET_FMT_plx "\n",
+                      offset);
         break;
     }
 }
diff --git a/hw/i386/multiboot.c b/hw/i386/multiboot.c
index 963e29362e..ec747245c2 100644
--- a/hw/i386/multiboot.c
+++ b/hw/i386/multiboot.c
@@ -353,7 +353,8 @@ int load_multiboot(X86MachineState *x86ms,
             mb_add_mod(&mbs, mbs.mb_buf_phys + offs,
                        mbs.mb_buf_phys + offs + mb_mod_length, c);
 
-            mb_debug("mod_start: %p\nmod_end:   %p\n  cmdline: "TARGET_FMT_plx,
+            mb_debug("mod_start: %p\nmod_end:   %p\n"
+                     "  cmdline: "TARGET_FMT_plx,
                      (char *)mbs.mb_buf + offs,
                      (char *)mbs.mb_buf + offs + mb_mod_length, c);
             g_free(one_file);
diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index e4293d6d66..67d250ab54 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -522,7 +522,8 @@ static void xen_set_memory(struct MemoryListener *listener,
         }
     } else {
         if (xen_remove_from_physmap(state, start_addr, size) < 0) {
-            DPRINTF("physmapping does not exist at "TARGET_FMT_plx"\n", start_addr);
+            DPRINTF("physmapping does not exist at "TARGET_FMT_plx"\n",
+                    start_addr);
         }
     }
 }
diff --git a/hw/i386/xen/xen-mapcache.c b/hw/i386/xen/xen-mapcache.c
index a2f93096e7..491320e24a 100644
--- a/hw/i386/xen/xen-mapcache.c
+++ b/hw/i386/xen/xen-mapcache.c
@@ -357,7 +357,8 @@ tryagain:
         entry->lock++;
         if (entry->lock == 0) {
             fprintf(stderr,
-                    "mapcache entry lock overflow: "TARGET_FMT_plx" -> %p\n",
+                    "mapcache entry lock overflow: "
+                    TARGET_FMT_plx" -> %p\n",
                     entry->paddr_index, entry->vaddr_base);
             abort();
         }
@@ -404,8 +405,8 @@ ram_addr_t xen_ram_addr_from_mapcache(void *ptr)
     if (!found) {
         fprintf(stderr, "%s, could not find %p\n", __func__, ptr);
         QTAILQ_FOREACH(reventry, &mapcache->locked_entries, next) {
-            DPRINTF("   "TARGET_FMT_plx" -> %p is present\n", reventry->paddr_index,
-                    reventry->vaddr_req);
+            DPRINTF("   "TARGET_FMT_plx" -> %p is present\n",
+                    reventry->paddr_index, reventry->vaddr_req);
         }
         abort();
         return 0;
@@ -445,7 +446,8 @@ static void xen_invalidate_map_cache_entry_unlocked(uint8_t *buffer)
     if (!found) {
         DPRINTF("%s, could not find %p\n", __func__, buffer);
         QTAILQ_FOREACH(reventry, &mapcache->locked_entries, next) {
-            DPRINTF("   "TARGET_FMT_plx" -> %p is present\n", reventry->paddr_index, reventry->vaddr_req);
+            DPRINTF("   "TARGET_FMT_plx" -> %p is present\n",
+                    reventry->paddr_index, reventry->vaddr_req);
         }
         return;
     }
@@ -578,7 +580,8 @@ static uint8_t *xen_replace_cache_entry_unlocked(hwaddr old_phys_addr,
     if (!test_bits(address_offset >> XC_PAGE_SHIFT,
                 test_bit_size >> XC_PAGE_SHIFT,
                 entry->valid_mapping)) {
-        DPRINTF("Unable to update a mapcache entry for "TARGET_FMT_plx"!\n",
+        DPRINTF("Unable to update a mapcache entry for "
+                TARGET_FMT_plx "!\n",
                 old_phys_addr);
         return NULL;
     }
diff --git a/hw/intc/exynos4210_combiner.c b/hw/intc/exynos4210_combiner.c
index a289510bdb..44810bb63a 100644
--- a/hw/intc/exynos4210_combiner.c
+++ b/hw/intc/exynos4210_combiner.c
@@ -119,8 +119,8 @@ exynos4210_combiner_read(void *opaque, hwaddr offset, unsigned size)
         break;
     default:
         if (offset >> 2 >= IIC_REGSET_SIZE) {
-            hw_error("exynos4210.combiner: overflow of reg_set by 0x"
-                    TARGET_FMT_plx "offset\n", offset);
+            hw_error("exynos4210.combiner: overflow of reg_set by"
+                     " 0x" TARGET_FMT_plx "offset\n", offset);
         }
         val = s->reg_set[offset >> 2];
     }
@@ -183,20 +183,20 @@ static void exynos4210_combiner_write(void *opaque, hwaddr offset,
     reg_n = (offset - (req_quad_base_n << 4)) >> 2;
 
     if (req_quad_base_n >= IIC_NGRP) {
-        hw_error("exynos4210.combiner: unallowed write access at offset 0x"
-                TARGET_FMT_plx "\n", offset);
+        hw_error("exynos4210.combiner: unallowed write access at offset"
+                 " 0x" TARGET_FMT_plx "\n", offset);
         return;
     }
 
     if (reg_n > 1) {
-        hw_error("exynos4210.combiner: unallowed write access at offset 0x"
-                TARGET_FMT_plx "\n", offset);
+        hw_error("exynos4210.combiner: unallowed write access at offset"
+                 " 0x" TARGET_FMT_plx "\n", offset);
         return;
     }
 
     if (offset >> 2 >= IIC_REGSET_SIZE) {
-        hw_error("exynos4210.combiner: overflow of reg_set by 0x"
-                TARGET_FMT_plx "offset\n", offset);
+        hw_error("exynos4210.combiner: overflow of reg_set by"
+                 " 0x" TARGET_FMT_plx "offset\n", offset);
     }
     s->reg_set[offset >> 2] = val;
 
@@ -245,8 +245,8 @@ static void exynos4210_combiner_write(void *opaque, hwaddr offset,
         exynos4210_combiner_update(s, grp_quad_base_n + 3);
         break;
     default:
-        hw_error("exynos4210.combiner: unallowed write access at offset 0x"
-                TARGET_FMT_plx "\n", offset);
+        hw_error("exynos4210.combiner: unallowed write access at offset"
+                 " 0x" TARGET_FMT_plx "\n", offset);
         break;
     }
 }
diff --git a/hw/misc/auxbus.c b/hw/misc/auxbus.c
index 8a8012f5f0..a2a0f88836 100644
--- a/hw/misc/auxbus.c
+++ b/hw/misc/auxbus.c
@@ -299,7 +299,8 @@ static void aux_slave_dev_print(Monitor *mon, DeviceState *dev, int indent)
 
     s = AUX_SLAVE(dev);
 
-    monitor_printf(mon, "%*smemory " TARGET_FMT_plx "/" TARGET_FMT_plx "\n",
+    monitor_printf(mon,
+                   "%*smemory " TARGET_FMT_plx "/" TARGET_FMT_plx "\n",
                    indent, "",
                    object_property_get_uint(OBJECT(s->mmio), "addr", NULL),
                    memory_region_size(s->mmio));
diff --git a/hw/net/allwinner_emac.c b/hw/net/allwinner_emac.c
index ddddf35c45..53412c23e4 100644
--- a/hw/net/allwinner_emac.c
+++ b/hw/net/allwinner_emac.c
@@ -303,8 +303,8 @@ static uint64_t aw_emac_read(void *opaque, hwaddr offset, unsigned size)
                                    extract32(s->phy_target, PHY_REG_SHIFT, 8));
     default:
         qemu_log_mask(LOG_UNIMP,
-                      "allwinner_emac: read access to unknown register 0x"
-                      TARGET_FMT_plx "\n", offset);
+                      "allwinner_emac: read access to unknown register"
+                      " 0x" TARGET_FMT_plx "\n", offset);
         ret = 0;
     }
 
@@ -406,8 +406,8 @@ static void aw_emac_write(void *opaque, hwaddr offset, uint64_t value,
         break;
     default:
         qemu_log_mask(LOG_UNIMP,
-                      "allwinner_emac: write access to unknown register 0x"
-                      TARGET_FMT_plx "\n", offset);
+                      "allwinner_emac: write access to unknown register"
+                      " 0x" TARGET_FMT_plx "\n", offset);
     }
 }
 
diff --git a/hw/timer/digic-timer.c b/hw/timer/digic-timer.c
index d5186f4454..d324b5e698 100644
--- a/hw/timer/digic-timer.c
+++ b/hw/timer/digic-timer.c
@@ -75,8 +75,8 @@ static uint64_t digic_timer_read(void *opaque, hwaddr offset, unsigned size)
         break;
     default:
         qemu_log_mask(LOG_UNIMP,
-                      "digic-timer: read access to unknown register 0x"
-                      TARGET_FMT_plx "\n", offset);
+                      "digic-timer: read access to unknown register"
+                      " 0x" TARGET_FMT_plx "\n", offset);
     }
 
     return ret;
@@ -115,8 +115,8 @@ static void digic_timer_write(void *opaque, hwaddr offset,
 
     default:
         qemu_log_mask(LOG_UNIMP,
-                      "digic-timer: read access to unknown register 0x"
-                      TARGET_FMT_plx "\n", offset);
+                      "digic-timer: read access to unknown register"
+                      " 0x" TARGET_FMT_plx "\n", offset);
     }
 }
 
diff --git a/hw/timer/etraxfs_timer.c b/hw/timer/etraxfs_timer.c
index ecc2831baf..993df3557d 100644
--- a/hw/timer/etraxfs_timer.c
+++ b/hw/timer/etraxfs_timer.c
@@ -324,8 +324,7 @@ timer_write(void *opaque, hwaddr addr,
             t->rw_ack_intr = 0;
             break;
         default:
-            printf ("%s " TARGET_FMT_plx " %x\n",
-                __func__, addr, value);
+            printf("%s " TARGET_FMT_plx " %x\n", __func__, addr, value);
             break;
     }
 }
diff --git a/softmmu/memory.c b/softmmu/memory.c
index e05332d07f..e8c1f73312 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1290,7 +1290,8 @@ static void unassigned_mem_write(void *opaque, hwaddr addr,
                                  uint64_t val, unsigned size)
 {
 #ifdef DEBUG_UNASSIGNED
-    printf("Unassigned mem write " TARGET_FMT_plx " = 0x%"PRIx64"\n", addr, val);
+    printf("Unassigned mem write " TARGET_FMT_plx " = 0x%"PRIx64"\n",
+           addr, val);
 #endif
 }
 
diff --git a/target/ppc/mmu-hash32.c b/target/ppc/mmu-hash32.c
index cc091c3e62..ad353a86bc 100644
--- a/target/ppc/mmu-hash32.c
+++ b/target/ppc/mmu-hash32.c
@@ -361,10 +361,12 @@ static hwaddr ppc_hash32_htab_lookup(PowerPCCPU *cpu,
     pte_offset = ppc_hash32_pteg_search(cpu, pteg_off, 0, ptem, pte);
     if (pte_offset == -1) {
         /* Secondary PTEG lookup */
-        qemu_log_mask(CPU_LOG_MMU, "1 htab=" TARGET_FMT_plx "/" TARGET_FMT_plx
-                " vsid=%" PRIx32 " api=%" PRIx32
-                " hash=" TARGET_FMT_plx "\n", ppc_hash32_hpt_base(cpu),
-                ppc_hash32_hpt_mask(cpu), vsid, ptem, ~hash);
+        qemu_log_mask(CPU_LOG_MMU,
+                      "1 htab=" TARGET_FMT_plx "/" TARGET_FMT_plx
+                      " vsid=%" PRIx32 " api=%" PRIx32
+                      " hash=" TARGET_FMT_plx "\n",
+                      ppc_hash32_hpt_base(cpu),
+                      ppc_hash32_hpt_mask(cpu), vsid, ptem, ~hash);
         pteg_off = get_pteg_offset32(cpu, ~hash);
         pte_offset = ppc_hash32_pteg_search(cpu, pteg_off, 1, ptem, pte);
     }
diff --git a/target/ppc/mmu_common.c b/target/ppc/mmu_common.c
index 8901f4d134..94cbb8b6a0 100644
--- a/target/ppc/mmu_common.c
+++ b/target/ppc/mmu_common.c
@@ -328,7 +328,8 @@ static int get_bat_6xx_tlb(CPUPPCState *env, mmu_ctx_t *ctx,
                 ctx->prot = prot;
                 ret = check_prot(ctx->prot, access_type);
                 if (ret == 0) {
-                    qemu_log_mask(CPU_LOG_MMU, "BAT %d match: r " TARGET_FMT_plx
+                    qemu_log_mask(CPU_LOG_MMU,
+                                  "BAT %d match: r " TARGET_FMT_plx
                                   " prot=%c%c\n", i, ctx->raddr,
                                   ctx->prot & PAGE_READ ? 'R' : '-',
                                   ctx->prot & PAGE_WRITE ? 'W' : '-');
@@ -420,8 +421,9 @@ static int get_segment_6xx_tlb(CPUPPCState *env, mmu_ctx_t *ctx,
                 hwaddr curaddr;
                 uint32_t a0, a1, a2, a3;
 
-                qemu_log("Page table: " TARGET_FMT_plx " len " TARGET_FMT_plx
-                         "\n", ppc_hash32_hpt_base(cpu),
+                qemu_log("Page table: " TARGET_FMT_plx
+                         " len " TARGET_FMT_plx "\n",
+                         ppc_hash32_hpt_base(cpu),
                          ppc_hash32_hpt_mask(cpu) + 0x80);
                 for (curaddr = ppc_hash32_hpt_base(cpu);
                      curaddr < (ppc_hash32_hpt_base(cpu)
diff --git a/target/sparc/mmu_helper.c b/target/sparc/mmu_helper.c
index 919448a494..e3bdb6c3b8 100644
--- a/target/sparc/mmu_helper.c
+++ b/target/sparc/mmu_helper.c
@@ -368,8 +368,9 @@ void dump_mmu(CPUSPARCState *env)
                 pde = mmu_probe(env, va1, 1);
                 if (pde) {
                     pa = cpu_get_phys_page_debug(cs, va1);
-                    qemu_printf(" VA: " TARGET_FMT_lx ", PA: "
-                                TARGET_FMT_plx " PDE: " TARGET_FMT_lx "\n",
+                    qemu_printf(" VA: " TARGET_FMT_lx
+                                ", PA: " TARGET_FMT_plx
+                                " PDE: " TARGET_FMT_lx "\n",
                                 va1, pa, pde);
                     for (o = 0, va2 = va1; o < 64; o++, va2 += 4 * 1024) {
                         pde = mmu_probe(env, va2, 0);
-- 
2.38.1


