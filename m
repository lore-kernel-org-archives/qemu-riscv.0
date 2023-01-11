Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pFWe3-0004oE-7S
	for mharc-qemu-riscv@gnu.org; Wed, 11 Jan 2023 03:39:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFWe1-0004nD-5F
 for qemu-riscv@nongnu.org; Wed, 11 Jan 2023 03:39:37 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFWdw-0005RX-Qs
 for qemu-riscv@nongnu.org; Wed, 11 Jan 2023 03:39:36 -0500
Received: by mail-wm1-x334.google.com with SMTP id o15so10547388wmr.4
 for <qemu-riscv@nongnu.org>; Wed, 11 Jan 2023 00:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xLgpRn0OlX81ngTVyJ9922oKfdiIZ+hS5xrYm8FJoVU=;
 b=jxcWKf033L5XB8aa/3ATNAXkGwcscp2zTXF3kUtlpKxYH6+RLwjCnwfrIDBDpIrFeK
 XGxypfnslxbLcyy81OD8buWrhVJOWVogSc8UggcGnU5XcPqdakuy85ZccKIV64Y0k4US
 WsiCHhYJ3/EldzJhiBwiOzbl2ZDb8YA1fW6HbOu2TyzmtN+EPWMmj15n5HS9otBS+03b
 hcUYVNS1U2SICbz8nau/fbwFv/LLLSOItoaRQxfcWjwkzq1MzjGZRev8xTX7FV6xs4Ti
 ZntD0Gkwq5Eo21aVdPRsDgm3gXNUZMVLB5tuLeOkqxDg04tvLBOj5wCfSFJ0DdsFHDdD
 1NEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xLgpRn0OlX81ngTVyJ9922oKfdiIZ+hS5xrYm8FJoVU=;
 b=SgD6tH76jbI1gTIF246891lemSnWYJF0yBc+jGlK4r6aa5MtpiUPs2KdKcRLj3nP1P
 dAki1MUQ71Yio/veFshshu7lys8ruIfIQN5fOyEkSVRa3Xeb992v9yHU+ieUxLAXG2Ls
 wi83ouQh6ZovT/HhyuHeQPxCv7N3mOlzBH8+YQzWeUCOO30NBRYT607th0xox6w1S22G
 s1cuIGjwKh85nx6HSd0UCldj3u5Kaa6T8XQoSRBkFbKTkRARK+n9tbfGdjyc6G3TmNed
 4HT3BMLvA0I4eMLGWIkN4s+mT3mWOVb1r56GfKTpS+4riYErY7tPbrcZ+lVxiY9phQvm
 OPYQ==
X-Gm-Message-State: AFqh2kpR9jWV/hiMcfcEv1Tra1pxylkQMIN11TpyFROg80ThvSboCGL5
 gwkBCumuIgBVPzpSMhmS/UJIZg==
X-Google-Smtp-Source: AMrXdXsqj217KvOPvXfq4i1JjH/O9NsWbfzHMhVfzapAUrcn+w2rvOzj1X+jp3hjD3In3Y1l4nsGdA==
X-Received: by 2002:a05:600c:3b0a:b0:3d9:91cb:bbff with SMTP id
 m10-20020a05600c3b0a00b003d991cbbbffmr36887642wms.26.1673426371711; 
 Wed, 11 Jan 2023 00:39:31 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 p21-20020a7bcc95000000b003c65c9a36dfsm17082738wma.48.2023.01.11.00.39.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 11 Jan 2023 00:39:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH v2 4/4] bulk: Prefix '0x' to hex values displayed with
 HWADDR_PRIx format
Date: Wed, 11 Jan 2023 09:39:09 +0100
Message-Id: <20230111083909.42624-5-philmd@linaro.org>
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
X-List-Received-Date: Wed, 11 Jan 2023 08:39:37 -0000

Automatic change running:

  $ sed -i -E \
      's/([^0][^x])%016" HWADDR_PRIx/\10x%016" HWADDR_PRIx/g' \
      $(git grep -l -F '%016" HWADDR_PRIx')

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
RFC: Maybe some non-0x prefix are justified in some cases,
     i.e. 'info mtree' output, or generically in monitor output?
     (see the few monitor_printf calls).
---
 hw/block/pflash_cfi01.c             |  2 +-
 hw/char/etraxfs_ser.c               |  4 ++--
 hw/core/loader.c                    |  4 ++--
 hw/core/sysbus.c                    |  4 ++--
 hw/display/g364fb.c                 |  4 ++--
 hw/dma/etraxfs_dma.c                | 14 +++++++-------
 hw/dma/pl330.c                      | 14 +++++++-------
 hw/dma/xilinx_axidma.c              |  4 ++--
 hw/dma/xlnx_csu_dma.c               |  4 ++--
 hw/i2c/mpc_i2c.c                    |  4 ++--
 hw/i386/multiboot.c                 |  8 ++++----
 hw/i386/xen/xen-hvm.c               |  4 ++--
 hw/i386/xen/xen-mapcache.c          | 16 ++++++++--------
 hw/intc/arm_gicv3_dist.c            |  8 ++++----
 hw/intc/arm_gicv3_its.c             | 14 +++++++-------
 hw/intc/arm_gicv3_redist.c          |  8 ++++----
 hw/misc/auxbus.c                    |  2 +-
 hw/misc/ivshmem.c                   |  6 +++---
 hw/net/rocker/rocker.c              |  6 +++---
 hw/net/xilinx_axienet.c             |  4 ++--
 hw/net/xilinx_ethlite.c             |  6 +++---
 hw/pci-bridge/pci_expander_bridge.c |  2 +-
 hw/pci-host/bonito.c                | 12 ++++++------
 hw/pci-host/ppce500.c               |  4 ++--
 hw/pci/pci_host.c                   |  4 ++--
 hw/ppc/ppc4xx_sdram.c               |  2 +-
 hw/rtc/exynos4210_rtc.c             |  4 ++--
 hw/ssi/xilinx_spi.c                 |  4 ++--
 hw/ssi/xilinx_spips.c               |  8 ++++----
 hw/timer/etraxfs_timer.c            |  2 +-
 hw/timer/exynos4210_mct.c           |  2 +-
 hw/timer/exynos4210_pwm.c           |  4 ++--
 hw/virtio/virtio-mmio.c             |  4 ++--
 monitor/misc.c                      |  2 +-
 softmmu/memory.c                    | 18 +++++++++---------
 softmmu/memory_mapping.c            |  4 ++--
 softmmu/physmem.c                   | 10 +++++-----
 target/i386/monitor.c               |  6 +++---
 target/loongarch/tlb_helper.c       |  2 +-
 target/mips/tcg/sysemu/tlb_helper.c |  2 +-
 target/ppc/mmu-hash32.c             | 14 +++++++-------
 target/ppc/mmu-hash64.c             | 12 ++++++------
 target/ppc/mmu_common.c             | 28 ++++++++++++++--------------
 target/ppc/mmu_helper.c             |  4 ++--
 target/riscv/cpu_helper.c           | 10 +++++-----
 target/riscv/monitor.c              |  2 +-
 target/sparc/ldst_helper.c          |  6 +++---
 target/sparc/mmu_helper.c           | 10 +++++-----
 target/tricore/helper.c             |  2 +-
 49 files changed, 162 insertions(+), 162 deletions(-)

diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index 20624e3176..ee63c9fa5b 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -645,7 +645,7 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
 
  error_flash:
     qemu_log_mask(LOG_UNIMP, "%s: Unimplemented flash cmd sequence "
-                             "(offset %016" HWADDR_PRIx
+                             "(offset 0x%016" HWADDR_PRIx
                              ", wcycle 0x%x cmd 0x%x value 0x%x)\n",
                   __func__, offset, pfl->wcycle, pfl->cmd, value);
 
diff --git a/hw/char/etraxfs_ser.c b/hw/char/etraxfs_ser.c
index d79a5b1bf1..407c56c826 100644
--- a/hw/char/etraxfs_ser.c
+++ b/hw/char/etraxfs_ser.c
@@ -113,7 +113,7 @@ ser_read(void *opaque, hwaddr addr, unsigned int size)
             break;
         default:
             r = s->regs[addr];
-            D(qemu_log("%s %016" HWADDR_PRIx "=%x\n", __func__, addr, r));
+            D(qemu_log("%s 0x%016" HWADDR_PRIx "=%x\n", __func__, addr, r));
             break;
     }
     return r;
@@ -127,7 +127,7 @@ ser_write(void *opaque, hwaddr addr,
     uint32_t value = val64;
     unsigned char ch = val64;
 
-    D(qemu_log("%s %016" HWADDR_PRIx "=%x\n",  __func__, addr, value));
+    D(qemu_log("%s 0x%016" HWADDR_PRIx "=%x\n",  __func__, addr, value));
     addr >>= 2;
     switch (addr)
     {
diff --git a/hw/core/loader.c b/hw/core/loader.c
index e9cc5a60e8..98eada1e6f 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -1054,7 +1054,7 @@ ssize_t rom_add_file(const char *file, const char *fw_dir,
             rom->mr = mr;
             snprintf(devpath, sizeof(devpath), "/rom@%s", file);
         } else {
-            snprintf(devpath, sizeof(devpath), "/rom@%016" HWADDR_PRIx, addr);
+            snprintf(devpath, sizeof(devpath), "/rom@0x%016" HWADDR_PRIx, addr);
         }
     }
 
@@ -1595,7 +1595,7 @@ HumanReadableText *qmp_x_query_roms(Error **errp)
                                    rom->romsize,
                                    rom->name);
         } else if (!rom->fw_file) {
-            g_string_append_printf(buf, "addr=%016" HWADDR_PRIx
+            g_string_append_printf(buf, "addr=0x%016" HWADDR_PRIx
                                    " size=0x%06zx mem=%s name=\"%s\"\n",
                                    rom->addr, rom->romsize,
                                    rom->isrom ? "rom" : "ram",
diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
index 5c0099c5eb..a698db3590 100644
--- a/hw/core/sysbus.c
+++ b/hw/core/sysbus.c
@@ -270,7 +270,7 @@ static void sysbus_dev_print(Monitor *mon, DeviceState *dev, int indent)
     for (i = 0; i < s->num_mmio; i++) {
         size = memory_region_size(s->mmio[i].memory);
         monitor_printf(mon,
-                       "%*smmio %016" HWADDR_PRIx "/%016" HWADDR_PRIx "\n",
+                       "%*smmio 0x%016" HWADDR_PRIx "/0x%016" HWADDR_PRIx "\n",
                        indent, "", s->mmio[i].addr, size);
     }
 }
@@ -290,7 +290,7 @@ static char *sysbus_get_fw_dev_path(DeviceState *dev)
         }
     }
     if (s->num_mmio) {
-        return g_strdup_printf("%s@%016" HWADDR_PRIx, qdev_fw_name(dev),
+        return g_strdup_printf("%s@0x%016" HWADDR_PRIx, qdev_fw_name(dev),
                                s->mmio[0].addr);
     }
     if (s->num_pio) {
diff --git a/hw/display/g364fb.c b/hw/display/g364fb.c
index 7a3065d696..f9f76bb962 100644
--- a/hw/display/g364fb.c
+++ b/hw/display/g364fb.c
@@ -320,7 +320,7 @@ static uint64_t g364fb_ctrl_read(void *opaque,
                 break;
             default:
             {
-                error_report("g364: invalid read at [%016" HWADDR_PRIx "]",
+                error_report("g364: invalid read at [0x%016" HWADDR_PRIx "]",
                              addr);
                 val = 0;
                 break;
@@ -424,7 +424,7 @@ static void g364fb_ctrl_write(void *opaque,
             break;
         default:
             error_report("g364: invalid write of 0x%" PRIx64
-                         " at [%016" HWADDR_PRIx "]", val, addr);
+                         " at [0x%016" HWADDR_PRIx "]", val, addr);
             break;
         }
     }
diff --git a/hw/dma/etraxfs_dma.c b/hw/dma/etraxfs_dma.c
index f69da09143..935bb16dcd 100644
--- a/hw/dma/etraxfs_dma.c
+++ b/hw/dma/etraxfs_dma.c
@@ -272,7 +272,7 @@ static void channel_load_d(struct fs_dma_ctrl *ctrl, int c)
     hwaddr addr = channel_reg(ctrl, c, RW_SAVED_DATA);
 
     /* Load and decode. FIXME: handle endianness.  */
-    D(printf("%s ch=%d addr=%016" HWADDR_PRIx "\n", __func__, c, addr));
+    D(printf("%s ch=%d addr=0x%016" HWADDR_PRIx "\n", __func__, c, addr));
     cpu_physical_memory_read(addr, &ctrl->channels[c].current_d,
                              sizeof(ctrl->channels[c].current_d));
 
@@ -285,7 +285,7 @@ static void channel_store_c(struct fs_dma_ctrl *ctrl, int c)
     hwaddr addr = channel_reg(ctrl, c, RW_GROUP_DOWN);
 
     /* Encode and store. FIXME: handle endianness.  */
-    D(printf("%s ch=%d addr=%016" HWADDR_PRIx "\n", __func__, c, addr));
+    D(printf("%s ch=%d addr=0x%016" HWADDR_PRIx "\n", __func__, c, addr));
     D(dump_d(c, &ctrl->channels[c].current_d));
     cpu_physical_memory_write(addr, &ctrl->channels[c].current_c,
                               sizeof(ctrl->channels[c].current_c));
@@ -296,7 +296,7 @@ static void channel_store_d(struct fs_dma_ctrl *ctrl, int c)
     hwaddr addr = channel_reg(ctrl, c, RW_SAVED_DATA);
 
     /* Encode and store. FIXME: handle endianness.  */
-    D(printf("%s ch=%d addr=%016" HWADDR_PRIx "\n", __func__, c, addr));
+    D(printf("%s ch=%d addr=0x%016" HWADDR_PRIx "\n", __func__, c, addr));
     cpu_physical_memory_write(addr, &ctrl->channels[c].current_d,
                               sizeof(ctrl->channels[c].current_d));
 }
@@ -574,7 +574,7 @@ static inline int channel_in_run(struct fs_dma_ctrl *ctrl, int c)
 
 static uint32_t dma_rinvalid (void *opaque, hwaddr addr)
 {
-    hw_error("Unsupported short raccess. reg=%016" HWADDR_PRIx "\n", addr);
+    hw_error("Unsupported short raccess. reg=0x%016" HWADDR_PRIx "\n", addr);
     return 0;
 }
 
@@ -601,7 +601,7 @@ static uint64_t dma_read(void *opaque, hwaddr addr, unsigned int size)
 
     default:
         r = ctrl->channels[c].regs[addr];
-        D(printf("%s c=%d addr=%016" HWADDR_PRIx "\n", __func__, c, addr));
+        D(printf("%s c=%d addr=0x%016" HWADDR_PRIx "\n", __func__, c, addr));
         break;
     }
     return r;
@@ -610,7 +610,7 @@ static uint64_t dma_read(void *opaque, hwaddr addr, unsigned int size)
 static void
 dma_winvalid (void *opaque, hwaddr addr, uint32_t value)
 {
-    hw_error("Unsupported short waccess. reg=%016" HWADDR_PRIx "\n", addr);
+    hw_error("Unsupported short waccess. reg=0x%016" HWADDR_PRIx "\n", addr);
 }
 
 static void
@@ -681,7 +681,7 @@ static void dma_write(void *opaque, hwaddr addr, uint64_t val64,
         break;
 
     default:
-        D(printf("%s c=%d %016" HWADDR_PRIx "\n", __func__, c, addr));
+        D(printf("%s c=%d 0x%016" HWADDR_PRIx "\n", __func__, c, addr));
         break;
     }
 }
diff --git a/hw/dma/pl330.c b/hw/dma/pl330.c
index ba72343c20..90ff54ea34 100644
--- a/hw/dma/pl330.c
+++ b/hw/dma/pl330.c
@@ -1374,7 +1374,7 @@ static void pl330_iomem_write(void *opaque, hwaddr offset,
         } else {
             qemu_log_mask(LOG_GUEST_ERROR,
                           "pl330: write of illegal value %u"
-                          " for offset %016" HWADDR_PRIx "\n",
+                          " for offset 0x%016" HWADDR_PRIx "\n",
                           (unsigned)value, offset);
         }
         break;
@@ -1386,7 +1386,7 @@ static void pl330_iomem_write(void *opaque, hwaddr offset,
         break;
     default:
         qemu_log_mask(LOG_GUEST_ERROR,
-                      "pl330: bad write offset %016" HWADDR_PRIx "\n",
+                      "pl330: bad write offset 0x%016" HWADDR_PRIx "\n",
                       offset);
         break;
     }
@@ -1411,7 +1411,7 @@ static inline uint32_t pl330_iomem_read_imp(void *opaque,
         chan_id = offset >> 5;
         if (chan_id >= s->num_chnls) {
             qemu_log_mask(LOG_GUEST_ERROR, "pl330: bad read offset "
-                          "%016" HWADDR_PRIx "\n", offset);
+                          "0x%016" HWADDR_PRIx "\n", offset);
             return 0;
         }
         switch (offset & 0x1f) {
@@ -1427,7 +1427,7 @@ static inline uint32_t pl330_iomem_read_imp(void *opaque,
             return s->chan[chan_id].lc[1];
         default:
             qemu_log_mask(LOG_GUEST_ERROR, "pl330: bad read offset "
-                          "%016" HWADDR_PRIx "\n", offset);
+                          "0x%016" HWADDR_PRIx "\n", offset);
             return 0;
         }
     }
@@ -1436,7 +1436,7 @@ static inline uint32_t pl330_iomem_read_imp(void *opaque,
         chan_id = offset >> 3;
         if (chan_id >= s->num_chnls) {
             qemu_log_mask(LOG_GUEST_ERROR, "pl330: bad read offset "
-                          "%016" HWADDR_PRIx "\n", offset);
+                          "0x%016" HWADDR_PRIx "\n", offset);
             return 0;
         }
         switch ((offset >> 2) & 1) {
@@ -1458,7 +1458,7 @@ static inline uint32_t pl330_iomem_read_imp(void *opaque,
         chan_id = offset >> 2;
         if (chan_id >= s->num_chnls) {
             qemu_log_mask(LOG_GUEST_ERROR, "pl330: bad read offset "
-                          "%016" HWADDR_PRIx "\n", offset);
+                          "0x%016" HWADDR_PRIx "\n", offset);
             return 0;
         }
         return s->chan[chan_id].fault_type;
@@ -1497,7 +1497,7 @@ static inline uint32_t pl330_iomem_read_imp(void *opaque,
         return s->debug_status;
     default:
         qemu_log_mask(LOG_GUEST_ERROR, "pl330: bad read offset "
-                      "%016" HWADDR_PRIx "\n", offset);
+                      "0x%016" HWADDR_PRIx "\n", offset);
     }
     return 0;
 }
diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
index 74ff5ba842..b9081d1fa9 100644
--- a/hw/dma/xilinx_axidma.c
+++ b/hw/dma/xilinx_axidma.c
@@ -456,7 +456,7 @@ static uint64_t axidma_read(void *opaque, hwaddr addr,
             break;
         default:
             r = s->regs[addr];
-            D(qemu_log("%s ch=%d addr=%016" HWADDR_PRIx " v=%x\n",
+            D(qemu_log("%s ch=%d addr=0x%016" HWADDR_PRIx " v=%x\n",
                            __func__, sid, addr * 4, r));
             break;
     }
@@ -509,7 +509,7 @@ static void axidma_write(void *opaque, hwaddr addr,
             }
             break;
         default:
-            D(qemu_log("%s: ch=%d addr=%016" HWADDR_PRIx " v=%x\n",
+            D(qemu_log("%s: ch=%d addr=0x%016" HWADDR_PRIx " v=%x\n",
                   __func__, sid, addr * 4, (unsigned)value));
             s->regs[addr] = value;
             break;
diff --git a/hw/dma/xlnx_csu_dma.c b/hw/dma/xlnx_csu_dma.c
index e2ef8139fc..c590a1f678 100644
--- a/hw/dma/xlnx_csu_dma.c
+++ b/hw/dma/xlnx_csu_dma.c
@@ -211,7 +211,7 @@ static uint32_t xlnx_csu_dma_read(XlnxCSUDMA *s, uint8_t *buf, uint32_t len)
     if (result == MEMTX_OK) {
         xlnx_csu_dma_data_process(s, buf, len);
     } else {
-        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad address %016" HWADDR_PRIx
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad address 0x%016" HWADDR_PRIx
                       " for mem read", __func__, addr);
         s->regs[R_INT_STATUS] |= R_INT_STATUS_AXI_BRESP_ERR_MASK;
         xlnx_csu_dma_update_irq(s);
@@ -241,7 +241,7 @@ static uint32_t xlnx_csu_dma_write(XlnxCSUDMA *s, uint8_t *buf, uint32_t len)
     }
 
     if (result != MEMTX_OK) {
-        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad address %016" HWADDR_PRIx
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad address 0x%016" HWADDR_PRIx
                       " for mem write", __func__, addr);
         s->regs[R_INT_STATUS] |= R_INT_STATUS_AXI_BRESP_ERR_MASK;
         xlnx_csu_dma_update_irq(s);
diff --git a/hw/i2c/mpc_i2c.c b/hw/i2c/mpc_i2c.c
index 3e4e185083..4f90b606b5 100644
--- a/hw/i2c/mpc_i2c.c
+++ b/hw/i2c/mpc_i2c.c
@@ -224,7 +224,7 @@ static uint64_t mpc_i2c_read(void *opaque, hwaddr addr, unsigned size)
         break;
     }
 
-    DPRINTF("%s: addr %016" HWADDR_PRIx " %02" PRIx32 "\n", __func__,
+    DPRINTF("%s: addr 0x%016" HWADDR_PRIx " %02" PRIx32 "\n", __func__,
                                          addr, value);
     return (uint64_t)value;
 }
@@ -234,7 +234,7 @@ static void mpc_i2c_write(void *opaque, hwaddr addr,
 {
     MPCI2CState *s = opaque;
 
-    DPRINTF("%s: addr %016" HWADDR_PRIx " val %08" PRIx64 "\n", __func__,
+    DPRINTF("%s: addr 0x%016" HWADDR_PRIx " val %08" PRIx64 "\n", __func__,
                                              addr, value);
     switch (addr) {
     case MPC_I2C_ADR:
diff --git a/hw/i386/multiboot.c b/hw/i386/multiboot.c
index 31b9abb81b..4ff2179aa4 100644
--- a/hw/i386/multiboot.c
+++ b/hw/i386/multiboot.c
@@ -137,7 +137,7 @@ static void mb_add_mod(MultibootState *s,
     stl_p(p + MB_MOD_END,     end);
     stl_p(p + MB_MOD_CMDLINE, cmdline_phys);
 
-    mb_debug("mod%02d: %016" HWADDR_PRIx " - %016" HWADDR_PRIx,
+    mb_debug("mod%02d: 0x%016" HWADDR_PRIx " - 0x%016" HWADDR_PRIx,
              s->mb_mods_count, start, end);
 
     s->mb_mods_count++;
@@ -354,7 +354,7 @@ int load_multiboot(X86MachineState *x86ms,
                        mbs.mb_buf_phys + offs + mb_mod_length, c);
 
             mb_debug("mod_start: %p\nmod_end:   %p\n"
-                     "  cmdline: %016" HWADDR_PRIx,
+                     "  cmdline: 0x%016" HWADDR_PRIx,
                      (char *)mbs.mb_buf + offs,
                      (char *)mbs.mb_buf + offs + mb_mod_length, c);
             g_free(one_file);
@@ -383,8 +383,8 @@ int load_multiboot(X86MachineState *x86ms,
     stl_p(bootinfo + MBI_MMAP_ADDR,   ADDR_E820_MAP);
 
     mb_debug("multiboot: entry_addr = %#x", mh_entry_addr);
-    mb_debug("           mb_buf_phys   = %016" HWADDR_PRIx, mbs.mb_buf_phys);
-    mb_debug("           mod_start     = %016" HWADDR_PRIx,
+    mb_debug("           mb_buf_phys   = 0x%016" HWADDR_PRIx, mbs.mb_buf_phys);
+    mb_debug("           mod_start     = 0x%016" HWADDR_PRIx,
              mbs.mb_buf_phys + mbs.offset_mods);
     mb_debug("           mb_mods_count = %d", mbs.mb_mods_count);
 
diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index 08c44fcd35..e5dc348a9b 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -516,13 +516,13 @@ static void xen_set_memory(struct MemoryListener *listener,
             if (xen_set_mem_type(xen_domid, mem_type,
                                  start_addr >> TARGET_PAGE_BITS,
                                  size >> TARGET_PAGE_BITS)) {
-                DPRINTF("xen_set_mem_type error, addr: %016" HWADDR_PRIx "\n",
+                DPRINTF("xen_set_mem_type error, addr: 0x%016" HWADDR_PRIx "\n",
                         start_addr);
             }
         }
     } else {
         if (xen_remove_from_physmap(state, start_addr, size) < 0) {
-            DPRINTF("physmapping does not exist at %016" HWADDR_PRIx "\n",
+            DPRINTF("physmapping does not exist at 0x%016" HWADDR_PRIx "\n",
                     start_addr);
         }
     }
diff --git a/hw/i386/xen/xen-mapcache.c b/hw/i386/xen/xen-mapcache.c
index abac16a66a..e8576ad0a6 100644
--- a/hw/i386/xen/xen-mapcache.c
+++ b/hw/i386/xen/xen-mapcache.c
@@ -358,7 +358,7 @@ tryagain:
         if (entry->lock == 0) {
             fprintf(stderr,
                     "mapcache entry lock overflow: "
-                    "%016" HWADDR_PRIx " -> %p\n",
+                    "0x%016" HWADDR_PRIx " -> %p\n",
                     entry->paddr_index, entry->vaddr_base);
             abort();
         }
@@ -405,7 +405,7 @@ ram_addr_t xen_ram_addr_from_mapcache(void *ptr)
     if (!found) {
         fprintf(stderr, "%s, could not find %p\n", __func__, ptr);
         QTAILQ_FOREACH(reventry, &mapcache->locked_entries, next) {
-            DPRINTF("   %016" HWADDR_PRIx " -> %p is present\n",
+            DPRINTF("   0x%016" HWADDR_PRIx " -> %p is present\n",
                     reventry->paddr_index, reventry->vaddr_req);
         }
         abort();
@@ -446,7 +446,7 @@ static void xen_invalidate_map_cache_entry_unlocked(uint8_t *buffer)
     if (!found) {
         DPRINTF("%s, could not find %p\n", __func__, buffer);
         QTAILQ_FOREACH(reventry, &mapcache->locked_entries, next) {
-            DPRINTF("   %016" HWADDR_PRIx " -> %p is present\n",
+            DPRINTF("   0x%016" HWADDR_PRIx " -> %p is present\n",
                     reventry->paddr_index, reventry->vaddr_req);
         }
         return;
@@ -505,7 +505,7 @@ void xen_invalidate_map_cache(void)
             continue;
         }
         fprintf(stderr, "Locked DMA mapping while invalidating mapcache!"
-                " %016" HWADDR_PRIx " -> %p is present\n",
+                " 0x%016" HWADDR_PRIx " -> %p is present\n",
                 reventry->paddr_index, reventry->vaddr_req);
     }
 
@@ -564,7 +564,7 @@ static uint8_t *xen_replace_cache_entry_unlocked(hwaddr old_phys_addr,
         entry = entry->next;
     }
     if (!entry) {
-        DPRINTF("Trying to update an entry for %016" HWADDR_PRIx \
+        DPRINTF("Trying to update an entry for 0x%016" HWADDR_PRIx \
                 "that is not in the mapcache!\n", old_phys_addr);
         return NULL;
     }
@@ -572,8 +572,8 @@ static uint8_t *xen_replace_cache_entry_unlocked(hwaddr old_phys_addr,
     address_index  = new_phys_addr >> MCACHE_BUCKET_SHIFT;
     address_offset = new_phys_addr & (MCACHE_BUCKET_SIZE - 1);
 
-    fprintf(stderr, "Replacing a dummy mapcache entry for %016" HWADDR_PRIx \
-            " with %016" HWADDR_PRIx "\n", old_phys_addr, new_phys_addr);
+    fprintf(stderr, "Replacing a dummy mapcache entry for 0x%016" HWADDR_PRIx \
+            " with 0x%016" HWADDR_PRIx "\n", old_phys_addr, new_phys_addr);
 
     xen_remap_bucket(entry, entry->vaddr_base,
                      cache_size, address_index, false);
@@ -581,7 +581,7 @@ static uint8_t *xen_replace_cache_entry_unlocked(hwaddr old_phys_addr,
                 test_bit_size >> XC_PAGE_SHIFT,
                 entry->valid_mapping)) {
         DPRINTF("Unable to update a mapcache entry for "
-                "%016" HWADDR_PRIx "!\n",
+                "0x%016" HWADDR_PRIx "!\n",
                 old_phys_addr);
         return NULL;
     }
diff --git a/hw/intc/arm_gicv3_dist.c b/hw/intc/arm_gicv3_dist.c
index d827f08bcf..9e43e35120 100644
--- a/hw/intc/arm_gicv3_dist.c
+++ b/hw/intc/arm_gicv3_dist.c
@@ -564,7 +564,7 @@ static bool gicd_readl(GICv3State *s, hwaddr offset,
         /* WO registers, return unknown value */
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid guest read from WO register at offset "
-                      "%016" HWADDR_PRIx "\n", __func__, offset);
+                      "0x%016" HWADDR_PRIx "\n", __func__, offset);
         *data = 0;
         return true;
     default:
@@ -773,7 +773,7 @@ static bool gicd_writel(GICv3State *s, hwaddr offset,
         /* RO registers, ignore the write */
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid guest write to RO register at offset "
-                      "%016" HWADDR_PRIx "\n", __func__, offset);
+                      "0x%016" HWADDR_PRIx "\n", __func__, offset);
         return true;
     default:
         return false;
@@ -838,7 +838,7 @@ MemTxResult gicv3_dist_read(void *opaque, hwaddr offset, uint64_t *data,
 
     if (!r) {
         qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: invalid guest read at offset %016" HWADDR_PRIx
+                      "%s: invalid guest read at offset 0x%016" HWADDR_PRIx
                       " size %u\n", __func__, offset, size);
         trace_gicv3_dist_badread(offset, size, attrs.secure);
         /* The spec requires that reserved registers are RAZ/WI;
@@ -879,7 +879,7 @@ MemTxResult gicv3_dist_write(void *opaque, hwaddr offset, uint64_t data,
 
     if (!r) {
         qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: invalid guest write at offset %016" HWADDR_PRIx
+                      "%s: invalid guest write at offset 0x%016" HWADDR_PRIx
                       " size %u\n", __func__, offset, size);
         trace_gicv3_dist_badwrite(offset, data, size, attrs.secure);
         /* The spec requires that reserved registers are RAZ/WI;
diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index ec398b5eb1..0a7f3a318e 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -1633,7 +1633,7 @@ static bool its_writel(GICv3ITSState *s, hwaddr offset,
             /* RO register, ignore the write */
             qemu_log_mask(LOG_GUEST_ERROR,
                           "%s: invalid guest write to RO register at offset "
-                          "%016" HWADDR_PRIx "\n", __func__, offset);
+                          "0x%016" HWADDR_PRIx "\n", __func__, offset);
         }
         break;
     case GITS_CREADR + 4:
@@ -1643,7 +1643,7 @@ static bool its_writel(GICv3ITSState *s, hwaddr offset,
             /* RO register, ignore the write */
             qemu_log_mask(LOG_GUEST_ERROR,
                           "%s: invalid guest write to RO register at offset "
-                          "%016" HWADDR_PRIx "\n", __func__, offset);
+                          "0x%016" HWADDR_PRIx "\n", __func__, offset);
         }
         break;
     case GITS_BASER ... GITS_BASER + 0x3f:
@@ -1675,7 +1675,7 @@ static bool its_writel(GICv3ITSState *s, hwaddr offset,
         /* RO registers, ignore the write */
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid guest write to RO register at offset "
-                      "%016" HWADDR_PRIx "\n", __func__, offset);
+                      "0x%016" HWADDR_PRIx "\n", __func__, offset);
         break;
     default:
         result = false;
@@ -1785,14 +1785,14 @@ static bool its_writell(GICv3ITSState *s, hwaddr offset,
             /* RO register, ignore the write */
             qemu_log_mask(LOG_GUEST_ERROR,
                           "%s: invalid guest write to RO register at offset "
-                          "%016" HWADDR_PRIx "\n", __func__, offset);
+                          "0x%016" HWADDR_PRIx "\n", __func__, offset);
         }
         break;
     case GITS_TYPER:
         /* RO registers, ignore the write */
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid guest write to RO register at offset "
-                      "%016" HWADDR_PRIx "\n", __func__, offset);
+                      "0x%016" HWADDR_PRIx "\n", __func__, offset);
         break;
     default:
         result = false;
@@ -1851,7 +1851,7 @@ static MemTxResult gicv3_its_read(void *opaque, hwaddr offset, uint64_t *data,
 
     if (!result) {
         qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: invalid guest read at offset %016" HWADDR_PRIx
+                      "%s: invalid guest read at offset 0x%016" HWADDR_PRIx
                       " size %u\n", __func__, offset, size);
         trace_gicv3_its_badread(offset, size);
         /*
@@ -1887,7 +1887,7 @@ static MemTxResult gicv3_its_write(void *opaque, hwaddr offset, uint64_t data,
 
     if (!result) {
         qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: invalid guest write at offset %016" HWADDR_PRIx
+                      "%s: invalid guest write at offset 0x%016" HWADDR_PRIx
                       " size %u\n", __func__, offset, size);
         trace_gicv3_its_badwrite(offset, data, size);
         /*
diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index b59171735c..d889472db1 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -601,7 +601,7 @@ static MemTxResult gicr_writel(GICv3CPUState *cs, hwaddr offset,
         /* RO registers, ignore the write */
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid guest write to RO register at offset "
-                      "%016" HWADDR_PRIx "\n", __func__, offset);
+                      "0x%016" HWADDR_PRIx "\n", __func__, offset);
         return MEMTX_OK;
         /*
          * VLPI frame registers. We don't need a version check for
@@ -668,7 +668,7 @@ static MemTxResult gicr_writell(GICv3CPUState *cs, hwaddr offset,
         /* RO register, ignore the write */
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid guest write to RO register at offset "
-                      "%016" HWADDR_PRIx "\n", __func__, offset);
+                      "0x%016" HWADDR_PRIx "\n", __func__, offset);
         return MEMTX_OK;
         /*
          * VLPI frame registers. We don't need a version check for
@@ -727,7 +727,7 @@ MemTxResult gicv3_redist_read(void *opaque, hwaddr offset, uint64_t *data,
 
     if (r != MEMTX_OK) {
         qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: invalid guest read at offset %016" HWADDR_PRIx
+                      "%s: invalid guest read at offset 0x%016" HWADDR_PRIx
                       " size %u\n", __func__, offset, size);
         trace_gicv3_redist_badread(gicv3_redist_affid(cs), offset,
                                    size, attrs.secure);
@@ -786,7 +786,7 @@ MemTxResult gicv3_redist_write(void *opaque, hwaddr offset, uint64_t data,
 
     if (r != MEMTX_OK) {
         qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: invalid guest write at offset %016" HWADDR_PRIx
+                      "%s: invalid guest write at offset 0x%016" HWADDR_PRIx
                       " size %u\n", __func__, offset, size);
         trace_gicv3_redist_badwrite(gicv3_redist_affid(cs), offset, data,
                                     size, attrs.secure);
diff --git a/hw/misc/auxbus.c b/hw/misc/auxbus.c
index 014a30f5a1..f075593666 100644
--- a/hw/misc/auxbus.c
+++ b/hw/misc/auxbus.c
@@ -300,7 +300,7 @@ static void aux_slave_dev_print(Monitor *mon, DeviceState *dev, int indent)
     s = AUX_SLAVE(dev);
 
     monitor_printf(mon,
-                   "%*smemory %016" HWADDR_PRIx "/%016" HWADDR_PRIx "\n",
+                   "%*smemory 0x%016" HWADDR_PRIx "/0x%016" HWADDR_PRIx "\n",
                    indent, "",
                    object_property_get_uint(OBJECT(s->mmio), "addr", NULL),
                    memory_region_size(s->mmio));
diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c
index ee41b90018..2ea2fca362 100644
--- a/hw/misc/ivshmem.c
+++ b/hw/misc/ivshmem.c
@@ -179,7 +179,7 @@ static void ivshmem_io_write(void *opaque, hwaddr addr,
 
     addr &= 0xfc;
 
-    IVSHMEM_DPRINTF("writing to addr %016" HWADDR_PRIx "\n", addr);
+    IVSHMEM_DPRINTF("writing to addr 0x%016" HWADDR_PRIx "\n", addr);
     switch (addr)
     {
         case INTRMASK:
@@ -207,7 +207,7 @@ static void ivshmem_io_write(void *opaque, hwaddr addr,
             }
             break;
         default:
-            IVSHMEM_DPRINTF("Unhandled write %016" HWADDR_PRIx "\n", addr);
+            IVSHMEM_DPRINTF("Unhandled write 0x%016" HWADDR_PRIx "\n", addr);
     }
 }
 
@@ -233,7 +233,7 @@ static uint64_t ivshmem_io_read(void *opaque, hwaddr addr,
             break;
 
         default:
-            IVSHMEM_DPRINTF("why are we reading %016" HWADDR_PRIx "\n", addr);
+            IVSHMEM_DPRINTF("why are we reading 0x%016" HWADDR_PRIx "\n", addr);
             ret = 0;
     }
 
diff --git a/hw/net/rocker/rocker.c b/hw/net/rocker/rocker.c
index 0d41dd52a2..f88b74bb8a 100644
--- a/hw/net/rocker/rocker.c
+++ b/hw/net/rocker/rocker.c
@@ -987,8 +987,8 @@ static const char *rocker_reg_name(void *opaque, hwaddr addr)
 static void rocker_mmio_write(void *opaque, hwaddr addr, uint64_t val,
                               unsigned size)
 {
-    DPRINTF("Write %s addr %016" HWADDR_PRIx
-            ", size %u, val %016" HWADDR_PRIx "\n",
+    DPRINTF("Write %s addr 0x%016" HWADDR_PRIx
+            ", size %u, val 0x%016" HWADDR_PRIx "\n",
             rocker_reg_name(opaque, addr), addr, size, val);
 
     switch (size) {
@@ -1174,7 +1174,7 @@ static uint64_t rocker_io_readq(void *opaque, hwaddr addr)
 
 static uint64_t rocker_mmio_read(void *opaque, hwaddr addr, unsigned size)
 {
-    DPRINTF("Read %s addr %016" HWADDR_PRIx ", size %u\n",
+    DPRINTF("Read %s addr 0x%016" HWADDR_PRIx ", size %u\n",
             rocker_reg_name(opaque, addr), addr, size);
 
     switch (size) {
diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c
index 814b71a93c..54b37b9e67 100644
--- a/hw/net/xilinx_axienet.c
+++ b/hw/net/xilinx_axienet.c
@@ -524,7 +524,7 @@ static uint64_t enet_read(void *opaque, hwaddr addr, unsigned size)
             if (addr < ARRAY_SIZE(s->regs)) {
                 r = s->regs[addr];
             }
-            DENET(qemu_log("%s addr=%016" HWADDR_PRIx " v=%x\n",
+            DENET(qemu_log("%s addr=0x%016" HWADDR_PRIx " v=%x\n",
                             __func__, addr * 4, r));
             break;
     }
@@ -630,7 +630,7 @@ static void enet_write(void *opaque, hwaddr addr,
             break;
 
         default:
-            DENET(qemu_log("%s addr=%016" HWADDR_PRIx " v=%x\n",
+            DENET(qemu_log("%s addr=0x%016" HWADDR_PRIx " v=%x\n",
                            __func__, addr * 4, (unsigned)value));
             if (addr < ARRAY_SIZE(s->regs)) {
                 s->regs[addr] = value;
diff --git a/hw/net/xilinx_ethlite.c b/hw/net/xilinx_ethlite.c
index 150248e543..7347e36ed8 100644
--- a/hw/net/xilinx_ethlite.c
+++ b/hw/net/xilinx_ethlite.c
@@ -99,7 +99,7 @@ eth_read(void *opaque, hwaddr addr, unsigned int size)
         case R_RX_CTRL1:
         case R_RX_CTRL0:
             r = s->regs[addr];
-            D(qemu_log("%s %016" HWADDR_PRIx "=%x\n", __func__, addr * 4, r));
+            D(qemu_log("%s 0x%016" HWADDR_PRIx "=%x\n", __func__, addr * 4, r));
             break;
 
         default:
@@ -125,7 +125,7 @@ eth_write(void *opaque, hwaddr addr,
             if (addr == R_TX_CTRL1)
                 base = 0x800 / 4;
 
-            D(qemu_log("%s addr=%016" HWADDR_PRIx " val=%x\n",
+            D(qemu_log("%s addr=0x%016" HWADDR_PRIx " val=%x\n",
                        __func__, addr * 4, value));
             if ((value & (CTRL_P | CTRL_S)) == CTRL_S) {
                 qemu_send_packet(qemu_get_queue(s->nic),
@@ -155,7 +155,7 @@ eth_write(void *opaque, hwaddr addr,
         case R_TX_LEN0:
         case R_TX_LEN1:
         case R_TX_GIE0:
-            D(qemu_log("%s addr=%016" HWADDR_PRIx " val=%x\n",
+            D(qemu_log("%s addr=0x%016" HWADDR_PRIx " val=%x\n",
                        __func__, addr * 4, value));
             s->regs[addr] = value;
             break;
diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
index 16b427d3c1..9b535d4843 100644
--- a/hw/pci-bridge/pci_expander_bridge.c
+++ b/hw/pci-bridge/pci_expander_bridge.c
@@ -155,7 +155,7 @@ static char *pxb_host_ofw_unit_address(const SysBusDevice *dev)
     main_host_sbd = SYS_BUS_DEVICE(main_host);
 
     if (main_host_sbd->num_mmio > 0) {
-        return g_strdup_printf("%016" HWADDR_PRIx ",%x",
+        return g_strdup_printf("0x%016" HWADDR_PRIx ",%x",
                                main_host_sbd->mmio[0].addr, position + 1);
     }
     if (main_host_sbd->num_pio > 0) {
diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
index 2d54435f74..42312cde8f 100644
--- a/hw/pci-host/bonito.c
+++ b/hw/pci-host/bonito.c
@@ -254,7 +254,7 @@ static void bonito_writel(void *opaque, hwaddr addr,
 
     saddr = addr >> 2;
 
-    DPRINTF("bonito_writel %016" HWADDR_PRIx " val %lx saddr %x\n",
+    DPRINTF("bonito_writel 0x%016" HWADDR_PRIx " val %lx saddr %x\n",
             addr, val, saddr);
     switch (saddr) {
     case BONITO_BONPONCFG:
@@ -317,7 +317,7 @@ static uint64_t bonito_readl(void *opaque, hwaddr addr,
 
     saddr = addr >> 2;
 
-    DPRINTF("bonito_readl %016" HWADDR_PRIx "\n", addr);
+    DPRINTF("bonito_readl 0x%016" HWADDR_PRIx "\n", addr);
     switch (saddr) {
     case BONITO_INTISR:
         return s->regs[saddr];
@@ -342,7 +342,7 @@ static void bonito_pciconf_writel(void *opaque, hwaddr addr,
     PCIBonitoState *s = opaque;
     PCIDevice *d = PCI_DEVICE(s);
 
-    DPRINTF("bonito_pciconf_writel %016" HWADDR_PRIx " val %lx\n", addr, val);
+    DPRINTF("bonito_pciconf_writel 0x%016" HWADDR_PRIx " val %lx\n", addr, val);
     d->config_write(d, addr, val, 4);
 }
 
@@ -353,7 +353,7 @@ static uint64_t bonito_pciconf_readl(void *opaque, hwaddr addr,
     PCIBonitoState *s = opaque;
     PCIDevice *d = PCI_DEVICE(s);
 
-    DPRINTF("bonito_pciconf_readl %016" HWADDR_PRIx "\n", addr);
+    DPRINTF("bonito_pciconf_readl 0x%016" HWADDR_PRIx "\n", addr);
     return d->config_read(d, addr, 4);
 }
 
@@ -489,7 +489,7 @@ static void bonito_spciconf_write(void *opaque, hwaddr addr, uint64_t val,
     uint32_t pciaddr;
     uint16_t status;
 
-    DPRINTF("bonito_spciconf_write %016" HWADDR_PRIx " size %d val %lx\n",
+    DPRINTF("bonito_spciconf_write 0x%016" HWADDR_PRIx " size %d val %lx\n",
             addr, size, val);
 
     pciaddr = bonito_sbridge_pciaddr(s, addr);
@@ -519,7 +519,7 @@ static uint64_t bonito_spciconf_read(void *opaque, hwaddr addr, unsigned size)
     uint32_t pciaddr;
     uint16_t status;
 
-    DPRINTF("bonito_spciconf_read %016" HWADDR_PRIx " size %d\n", addr, size);
+    DPRINTF("bonito_spciconf_read 0x%016" HWADDR_PRIx " size %d\n", addr, size);
 
     pciaddr = bonito_sbridge_pciaddr(s, addr);
 
diff --git a/hw/pci-host/ppce500.c b/hw/pci-host/ppce500.c
index b522da730c..e68e72d76b 100644
--- a/hw/pci-host/ppce500.c
+++ b/hw/pci-host/ppce500.c
@@ -189,7 +189,7 @@ static uint64_t pci_reg_read4(void *opaque, hwaddr addr,
         break;
     }
 
-    pci_debug("%s: win:%lx(addr:%016" HWADDR_PRIx ") -> value:%x\n", __func__,
+    pci_debug("%s: win:%lx(addr:0x%016" HWADDR_PRIx ") -> value:%x\n", __func__,
               win, addr, value);
     return value;
 }
@@ -268,7 +268,7 @@ static void pci_reg_write4(void *opaque, hwaddr addr,
 
     win = addr & 0xfe0;
 
-    pci_debug("%s: value:%x -> win:%lx(addr:%016" HWADDR_PRIx ")\n",
+    pci_debug("%s: value:%x -> win:%lx(addr:0x%016" HWADDR_PRIx ")\n",
               __func__, (unsigned)value, win, addr);
 
     switch (win) {
diff --git a/hw/pci/pci_host.c b/hw/pci/pci_host.c
index efb1a9d901..870cb0f935 100644
--- a/hw/pci/pci_host.c
+++ b/hw/pci/pci_host.c
@@ -143,7 +143,7 @@ static void pci_host_config_write(void *opaque, hwaddr addr,
 {
     PCIHostState *s = opaque;
 
-    PCI_DPRINTF("%s addr %016" HWADDR_PRIx " len %d val %"PRIx64"\n",
+    PCI_DPRINTF("%s addr 0x%016" HWADDR_PRIx " len %d val %"PRIx64"\n",
                 __func__, addr, len, val);
     if (addr != 0 || len != 4) {
         return;
@@ -157,7 +157,7 @@ static uint64_t pci_host_config_read(void *opaque, hwaddr addr,
     PCIHostState *s = opaque;
     uint32_t val = s->config_reg;
 
-    PCI_DPRINTF("%s addr %016" HWADDR_PRIx " len %d val %"PRIx32"\n",
+    PCI_DPRINTF("%s addr 0x%016" HWADDR_PRIx " len %d val %"PRIx32"\n",
                 __func__, addr, len, val);
     return val;
 }
diff --git a/hw/ppc/ppc4xx_sdram.c b/hw/ppc/ppc4xx_sdram.c
index b306683cfb..a42d72cddd 100644
--- a/hw/ppc/ppc4xx_sdram.c
+++ b/hw/ppc/ppc4xx_sdram.c
@@ -500,7 +500,7 @@ static uint32_t sdram_ddr2_bcr(hwaddr ram_base, hwaddr ram_size)
         bcr = 0x8000;
         break;
     default:
-        error_report("invalid RAM size %016" HWADDR_PRIx, ram_size);
+        error_report("invalid RAM size 0x%016" HWADDR_PRIx, ram_size);
         return 0;
     }
     bcr |= ram_base >> 2 & 0xffe00000;
diff --git a/hw/rtc/exynos4210_rtc.c b/hw/rtc/exynos4210_rtc.c
index 1ec3b20501..c25beba5ba 100644
--- a/hw/rtc/exynos4210_rtc.c
+++ b/hw/rtc/exynos4210_rtc.c
@@ -374,7 +374,7 @@ static uint64_t exynos4210_rtc_read(void *opaque, hwaddr offset,
 
     default:
         qemu_log_mask(LOG_GUEST_ERROR,
-                      "exynos4210.rtc: bad read offset %016" HWADDR_PRIx,
+                      "exynos4210.rtc: bad read offset 0x%016" HWADDR_PRIx,
                       offset);
         break;
     }
@@ -508,7 +508,7 @@ static void exynos4210_rtc_write(void *opaque, hwaddr offset,
 
     default:
         qemu_log_mask(LOG_GUEST_ERROR,
-                      "exynos4210.rtc: bad write offset %016" HWADDR_PRIx,
+                      "exynos4210.rtc: bad write offset 0x%016" HWADDR_PRIx,
                       offset);
         break;
 
diff --git a/hw/ssi/xilinx_spi.c b/hw/ssi/xilinx_spi.c
index be4a40f0ca..b5db70daad 100644
--- a/hw/ssi/xilinx_spi.c
+++ b/hw/ssi/xilinx_spi.c
@@ -232,7 +232,7 @@ spi_read(void *opaque, hwaddr addr, unsigned int size)
         break;
 
     }
-    DB_PRINT("addr=%016" HWADDR_PRIx " = %x\n", addr * 4, r);
+    DB_PRINT("addr=0x%016" HWADDR_PRIx " = %x\n", addr * 4, r);
     xlx_spi_update_irq(s);
     return r;
 }
@@ -244,7 +244,7 @@ spi_write(void *opaque, hwaddr addr,
     XilinxSPI *s = opaque;
     uint32_t value = val64;
 
-    DB_PRINT("addr=%016" HWADDR_PRIx " = %x\n", addr, value);
+    DB_PRINT("addr=0x%016" HWADDR_PRIx " = %x\n", addr, value);
     addr >>= 2;
     switch (addr) {
     case R_SRR:
diff --git a/hw/ssi/xilinx_spips.c b/hw/ssi/xilinx_spips.c
index 8b7e715c74..4fa7d25eb0 100644
--- a/hw/ssi/xilinx_spips.c
+++ b/hw/ssi/xilinx_spips.c
@@ -887,7 +887,7 @@ static uint64_t xilinx_spips_read(void *opaque, hwaddr addr,
     case R_INTR_STATUS:
         ret = s->regs[addr] & IXR_ALL;
         s->regs[addr] = 0;
-        DB_PRINT_L(0, "addr=%016" HWADDR_PRIx " = %x\n", addr * 4, ret);
+        DB_PRINT_L(0, "addr=0x%016" HWADDR_PRIx " = %x\n", addr * 4, ret);
         xilinx_spips_update_ixr(s);
         return ret;
     case R_INTR_MASK:
@@ -916,12 +916,12 @@ static uint64_t xilinx_spips_read(void *opaque, hwaddr addr,
         if (!(s->regs[R_CONFIG] & R_CONFIG_ENDIAN)) {
             ret <<= 8 * shortfall;
         }
-        DB_PRINT_L(0, "addr=%016" HWADDR_PRIx " = %x\n", addr * 4, ret);
+        DB_PRINT_L(0, "addr=0x%016" HWADDR_PRIx " = %x\n", addr * 4, ret);
         xilinx_spips_check_flush(s);
         xilinx_spips_update_ixr(s);
         return ret;
     }
-    DB_PRINT_L(0, "addr=%016" HWADDR_PRIx " = %x\n", addr * 4,
+    DB_PRINT_L(0, "addr=0x%016" HWADDR_PRIx " = %x\n", addr * 4,
                s->regs[addr] & mask);
     return s->regs[addr] & mask;
 
@@ -971,7 +971,7 @@ static void xilinx_spips_write(void *opaque, hwaddr addr,
     XilinxSPIPS *s = opaque;
     bool try_flush = true;
 
-    DB_PRINT_L(0, "addr=%016" HWADDR_PRIx " = %x\n", addr, (unsigned)value);
+    DB_PRINT_L(0, "addr=0x%016" HWADDR_PRIx " = %x\n", addr, (unsigned)value);
     addr >>= 2;
     switch (addr) {
     case R_CONFIG:
diff --git a/hw/timer/etraxfs_timer.c b/hw/timer/etraxfs_timer.c
index 782a370159..324e2d1a0c 100644
--- a/hw/timer/etraxfs_timer.c
+++ b/hw/timer/etraxfs_timer.c
@@ -324,7 +324,7 @@ timer_write(void *opaque, hwaddr addr,
             t->rw_ack_intr = 0;
             break;
         default:
-            printf("%s %016" HWADDR_PRIx " %x\n", __func__, addr, value);
+            printf("%s 0x%016" HWADDR_PRIx " %x\n", __func__, addr, value);
             break;
     }
 }
diff --git a/hw/timer/exynos4210_mct.c b/hw/timer/exynos4210_mct.c
index 5f5d53c009..4a86c89310 100644
--- a/hw/timer/exynos4210_mct.c
+++ b/hw/timer/exynos4210_mct.c
@@ -1445,7 +1445,7 @@ static void exynos4210_mct_write(void *opaque, hwaddr offset,
     case L0_ICNTO: case L1_ICNTO:
     case L0_FRCNTO: case L1_FRCNTO:
         qemu_log_mask(LOG_GUEST_ERROR,
-                      "exynos4210.mct: write to RO register %016" HWADDR_PRIx,
+                      "exynos4210.mct: write to RO register 0x%016" HWADDR_PRIx,
                       offset);
         break;
 
diff --git a/hw/timer/exynos4210_pwm.c b/hw/timer/exynos4210_pwm.c
index a4ac44e150..cfdf93949d 100644
--- a/hw/timer/exynos4210_pwm.c
+++ b/hw/timer/exynos4210_pwm.c
@@ -257,7 +257,7 @@ static uint64_t exynos4210_pwm_read(void *opaque, hwaddr offset,
 
     default:
         qemu_log_mask(LOG_GUEST_ERROR,
-                      "exynos4210.pwm: bad read offset %016" HWADDR_PRIx,
+                      "exynos4210.pwm: bad read offset 0x%016" HWADDR_PRIx,
                       offset);
         break;
     }
@@ -352,7 +352,7 @@ static void exynos4210_pwm_write(void *opaque, hwaddr offset,
 
     default:
         qemu_log_mask(LOG_GUEST_ERROR,
-                      "exynos4210.pwm: bad write offset %016" HWADDR_PRIx,
+                      "exynos4210.pwm: bad write offset 0x%016" HWADDR_PRIx,
                       offset);
         break;
 
diff --git a/hw/virtio/virtio-mmio.c b/hw/virtio/virtio-mmio.c
index c90f620802..9040ce5bef 100644
--- a/hw/virtio/virtio-mmio.c
+++ b/hw/virtio/virtio-mmio.c
@@ -829,10 +829,10 @@ static char *virtio_mmio_bus_get_dev_path(DeviceState *dev)
     assert(section.mr);
 
     if (proxy_path) {
-        path = g_strdup_printf("%s/virtio-mmio@%016" HWADDR_PRIx, proxy_path,
+        path = g_strdup_printf("%s/virtio-mmio@0x%016" HWADDR_PRIx, proxy_path,
                                section.offset_within_address_space);
     } else {
-        path = g_strdup_printf("virtio-mmio@%016" HWADDR_PRIx,
+        path = g_strdup_printf("virtio-mmio@0x%016" HWADDR_PRIx,
                                section.offset_within_address_space);
     }
     memory_region_unref(section.mr);
diff --git a/monitor/misc.c b/monitor/misc.c
index 9861ec2905..96370900db 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -566,7 +566,7 @@ static void memory_dump(Monitor *mon, int count, int format, int wsize,
 
     while (len > 0) {
         if (is_physical) {
-            monitor_printf(mon, "%016" HWADDR_PRIx ":", addr);
+            monitor_printf(mon, "0x%016" HWADDR_PRIx ":", addr);
         } else {
             monitor_printf(mon, TARGET_FMT_lx ":", (target_ulong)addr);
         }
diff --git a/softmmu/memory.c b/softmmu/memory.c
index 14850d4d3c..3c91e98df8 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1281,7 +1281,7 @@ static uint64_t unassigned_mem_read(void *opaque, hwaddr addr,
                                     unsigned size)
 {
 #ifdef DEBUG_UNASSIGNED
-    printf("Unassigned mem read %016" HWADDR_PRIx "\n", addr);
+    printf("Unassigned mem read 0x%016" HWADDR_PRIx "\n", addr);
 #endif
     return 0;
 }
@@ -1290,7 +1290,7 @@ static void unassigned_mem_write(void *opaque, hwaddr addr,
                                  uint64_t val, unsigned size)
 {
 #ifdef DEBUG_UNASSIGNED
-    printf("Unassigned mem write %016" HWADDR_PRIx " = 0x%"PRIx64"\n",
+    printf("Unassigned mem write 0x%016" HWADDR_PRIx " = 0x%"PRIx64"\n",
            addr, val);
 #endif
 }
@@ -3221,9 +3221,9 @@ static void mtree_print_mr(const MemoryRegion *mr, unsigned int level,
             for (i = 0; i < level; i++) {
                 qemu_printf(MTREE_INDENT);
             }
-            qemu_printf("%016" HWADDR_PRIx "-%016" HWADDR_PRIx
-                        " (prio %d, %s%s): alias %s @%s %016" HWADDR_PRIx
-                        "-%016" HWADDR_PRIx "%s",
+            qemu_printf("0x%016" HWADDR_PRIx "-0x%016" HWADDR_PRIx
+                        " (prio %d, %s%s): alias %s @%s 0x%016" HWADDR_PRIx
+                        "-0x%016" HWADDR_PRIx "%s",
                         cur_start, cur_end,
                         mr->priority,
                         mr->nonvolatile ? "nv-" : "",
@@ -3243,7 +3243,7 @@ static void mtree_print_mr(const MemoryRegion *mr, unsigned int level,
             for (i = 0; i < level; i++) {
                 qemu_printf(MTREE_INDENT);
             }
-            qemu_printf("%016" HWADDR_PRIx "-%016" HWADDR_PRIx
+            qemu_printf("0x%016" HWADDR_PRIx "-0x%016" HWADDR_PRIx
                         " (prio %d, %s%s): %s%s",
                         cur_start, cur_end,
                         mr->priority,
@@ -3330,8 +3330,8 @@ static void mtree_print_flatview(gpointer key, gpointer value,
     while (n--) {
         mr = range->mr;
         if (range->offset_in_region) {
-            qemu_printf(MTREE_INDENT "%016" HWADDR_PRIx "-%016" HWADDR_PRIx
-                        " (prio %d, %s%s): %s @%016" HWADDR_PRIx,
+            qemu_printf(MTREE_INDENT "0x%016" HWADDR_PRIx "-0x%016" HWADDR_PRIx
+                        " (prio %d, %s%s): %s @0x%016" HWADDR_PRIx,
                         int128_get64(range->addr.start),
                         int128_get64(range->addr.start)
                         + MR_SIZE(range->addr.size),
@@ -3341,7 +3341,7 @@ static void mtree_print_flatview(gpointer key, gpointer value,
                         memory_region_name(mr),
                         range->offset_in_region);
         } else {
-            qemu_printf(MTREE_INDENT "%016" HWADDR_PRIx "-%016" HWADDR_PRIx
+            qemu_printf(MTREE_INDENT "0x%016" HWADDR_PRIx "-0x%016" HWADDR_PRIx
                         " (prio %d, %s%s): %s",
                         int128_get64(range->addr.start),
                         int128_get64(range->addr.start)
diff --git a/softmmu/memory_mapping.c b/softmmu/memory_mapping.c
index c82c896a68..413b013c47 100644
--- a/softmmu/memory_mapping.c
+++ b/softmmu/memory_mapping.c
@@ -241,8 +241,8 @@ static void guest_phys_block_add_section(GuestPhysListener *g,
     }
 
 #ifdef DEBUG_GUEST_PHYS_REGION_ADD
-    fprintf(stderr, "%s: target_start=%016" HWADDR_PRIx " target_end="
-            "%016" HWADDR_PRIx ": %s (count: %u)\n", __func__, target_start,
+    fprintf(stderr, "%s: target_start=0x%016" HWADDR_PRIx " target_end="
+            "0x%016" HWADDR_PRIx ": %s (count: %u)\n", __func__, target_start,
             target_end, predecessor ? "joined" : "added", g->list->num);
 #endif
 }
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index f8e094dfef..b85b0037be 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -2475,7 +2475,7 @@ static MemTxResult subpage_read(void *opaque, hwaddr addr, uint64_t *data,
     MemTxResult res;
 
 #if defined(DEBUG_SUBPAGE)
-    printf("%s: subpage %p len %u addr %016" HWADDR_PRIx "\n", __func__,
+    printf("%s: subpage %p len %u addr 0x%016" HWADDR_PRIx "\n", __func__,
            subpage, len, addr);
 #endif
     res = flatview_read(subpage->fv, addr + subpage->base, attrs, buf, len);
@@ -2493,7 +2493,7 @@ static MemTxResult subpage_write(void *opaque, hwaddr addr,
     uint8_t buf[8];
 
 #if defined(DEBUG_SUBPAGE)
-    printf("%s: subpage %p len %u addr %016" HWADDR_PRIx
+    printf("%s: subpage %p len %u addr 0x%016" HWADDR_PRIx
            " value %"PRIx64"\n",
            __func__, subpage, len, addr, value);
 #endif
@@ -2507,7 +2507,7 @@ static bool subpage_accepts(void *opaque, hwaddr addr,
 {
     subpage_t *subpage = opaque;
 #if defined(DEBUG_SUBPAGE)
-    printf("%s: subpage %p %c len %u addr %016" HWADDR_PRIx "\n",
+    printf("%s: subpage %p %c len %u addr 0x%016" HWADDR_PRIx "\n",
            __func__, subpage, is_write ? 'w' : 'r', len, addr);
 #endif
 
@@ -2558,7 +2558,7 @@ static subpage_t *subpage_init(FlatView *fv, hwaddr base)
                           NULL, TARGET_PAGE_SIZE);
     mmio->iomem.subpage = true;
 #if defined(DEBUG_SUBPAGE)
-    printf("%s: %p base %016" HWADDR_PRIx " len %08x\n", __func__,
+    printf("%s: %p base 0x%016" HWADDR_PRIx " len %08x\n", __func__,
            mmio, base, TARGET_PAGE_SIZE);
 #endif
 
@@ -3703,7 +3703,7 @@ void mtree_print_dispatch(AddressSpaceDispatch *d, MemoryRegion *root)
         const char *names[] = { " [unassigned]", " [not dirty]",
                                 " [ROM]", " [watch]" };
 
-        qemu_printf("      #%d @%016" HWADDR_PRIx "..%016" HWADDR_PRIx
+        qemu_printf("      #%d @0x%016" HWADDR_PRIx "..0x%016" HWADDR_PRIx
                     " %s%s%s%s%s",
             i,
             s->offset_within_address_space,
diff --git a/target/i386/monitor.c b/target/i386/monitor.c
index 59b7a814ea..d8e7af89f8 100644
--- a/target/i386/monitor.c
+++ b/target/i386/monitor.c
@@ -57,7 +57,7 @@ static void print_pte(Monitor *mon, CPUArchState *env, hwaddr addr,
 {
     addr = addr_canonical(env, addr);
 
-    monitor_printf(mon, "%016" HWADDR_PRIx ": %016" HWADDR_PRIx
+    monitor_printf(mon, "0x%016" HWADDR_PRIx ": 0x%016" HWADDR_PRIx
                    " %c%c%c%c%c%c%c%c%c\n",
                    addr,
                    pte & mask,
@@ -258,8 +258,8 @@ static void mem_print(Monitor *mon, CPUArchState *env,
     prot1 = *plast_prot;
     if (prot != prot1) {
         if (*pstart != -1) {
-            monitor_printf(mon, "%016" HWADDR_PRIx "-%016" HWADDR_PRIx " "
-                           "%016" HWADDR_PRIx " %c%c%c\n",
+            monitor_printf(mon, "0x%016" HWADDR_PRIx "-0x%016" HWADDR_PRIx " "
+                           "0x%016" HWADDR_PRIx " %c%c%c\n",
                            addr_canonical(env, *pstart),
                            addr_canonical(env, end),
                            addr_canonical(env, end - *pstart),
diff --git a/target/loongarch/tlb_helper.c b/target/loongarch/tlb_helper.c
index e143936ebd..9ccc2fa667 100644
--- a/target/loongarch/tlb_helper.c
+++ b/target/loongarch/tlb_helper.c
@@ -655,7 +655,7 @@ bool loongarch_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                      physical & TARGET_PAGE_MASK, prot,
                      mmu_idx, TARGET_PAGE_SIZE);
         qemu_log_mask(CPU_LOG_MMU,
-                      "%s address=%" VADDR_PRIx " physical %016" HWADDR_PRIx
+                      "%s address=%" VADDR_PRIx " physical 0x%016" HWADDR_PRIx
                       " prot %d\n", __func__, address, physical, prot);
         return true;
     } else {
diff --git a/target/mips/tcg/sysemu/tlb_helper.c b/target/mips/tcg/sysemu/tlb_helper.c
index 1f572be2b3..5cbf73940a 100644
--- a/target/mips/tcg/sysemu/tlb_helper.c
+++ b/target/mips/tcg/sysemu/tlb_helper.c
@@ -924,7 +924,7 @@ bool mips_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     switch (ret) {
     case TLBRET_MATCH:
         qemu_log_mask(CPU_LOG_MMU,
-                      "%s address=%" VADDR_PRIx " physical %016" HWADDR_PRIx
+                      "%s address=%" VADDR_PRIx " physical 0x%016" HWADDR_PRIx
                       " prot %d\n", __func__, address, physical, prot);
         break;
     default:
diff --git a/target/ppc/mmu-hash32.c b/target/ppc/mmu-hash32.c
index 0641b93963..09166b8e03 100644
--- a/target/ppc/mmu-hash32.c
+++ b/target/ppc/mmu-hash32.c
@@ -346,15 +346,15 @@ static hwaddr ppc_hash32_htab_lookup(PowerPCCPU *cpu,
     ptem = (vsid << 7) | (pgidx >> 10);
 
     /* Page address translation */
-    qemu_log_mask(CPU_LOG_MMU, "htab_base %016" HWADDR_PRIx
-            " htab_mask %016" HWADDR_PRIx
-            " hash %016" HWADDR_PRIx "\n",
+    qemu_log_mask(CPU_LOG_MMU, "htab_base 0x%016" HWADDR_PRIx
+            " htab_mask 0x%016" HWADDR_PRIx
+            " hash 0x%016" HWADDR_PRIx "\n",
             ppc_hash32_hpt_base(cpu), ppc_hash32_hpt_mask(cpu), hash);
 
     /* Primary PTEG lookup */
-    qemu_log_mask(CPU_LOG_MMU, "0 htab=%016" HWADDR_PRIx "/%016" HWADDR_PRIx
+    qemu_log_mask(CPU_LOG_MMU, "0 htab=0x%016" HWADDR_PRIx "/0x%016" HWADDR_PRIx
             " vsid=%" PRIx32 " ptem=%" PRIx32
-            " hash=%016" HWADDR_PRIx "\n",
+            " hash=0x%016" HWADDR_PRIx "\n",
             ppc_hash32_hpt_base(cpu), ppc_hash32_hpt_mask(cpu),
             vsid, ptem, hash);
     pteg_off = get_pteg_offset32(cpu, hash);
@@ -362,9 +362,9 @@ static hwaddr ppc_hash32_htab_lookup(PowerPCCPU *cpu,
     if (pte_offset == -1) {
         /* Secondary PTEG lookup */
         qemu_log_mask(CPU_LOG_MMU,
-                      "1 htab=%016" HWADDR_PRIx "/%016" HWADDR_PRIx
+                      "1 htab=0x%016" HWADDR_PRIx "/0x%016" HWADDR_PRIx
                       " vsid=%" PRIx32 " api=%" PRIx32
-                      " hash=%016" HWADDR_PRIx "\n",
+                      " hash=0x%016" HWADDR_PRIx "\n",
                       ppc_hash32_hpt_base(cpu),
                       ppc_hash32_hpt_mask(cpu), vsid, ptem, ~hash);
         pteg_off = get_pteg_offset32(cpu, ~hash);
diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
index 3e4b006d4a..8d3394890b 100644
--- a/target/ppc/mmu-hash64.c
+++ b/target/ppc/mmu-hash64.c
@@ -697,15 +697,15 @@ static hwaddr ppc_hash64_htab_lookup(PowerPCCPU *cpu,
 
     /* Page address translation */
     qemu_log_mask(CPU_LOG_MMU,
-            "htab_base %016" HWADDR_PRIx " htab_mask %016" HWADDR_PRIx
-            " hash %016" HWADDR_PRIx "\n",
+            "htab_base 0x%016" HWADDR_PRIx " htab_mask 0x%016" HWADDR_PRIx
+            " hash 0x%016" HWADDR_PRIx "\n",
             ppc_hash64_hpt_base(cpu), ppc_hash64_hpt_mask(cpu), hash);
 
     /* Primary PTEG lookup */
     qemu_log_mask(CPU_LOG_MMU,
-            "0 htab=%016" HWADDR_PRIx "/%016" HWADDR_PRIx
+            "0 htab=0x%016" HWADDR_PRIx "/0x%016" HWADDR_PRIx
             " vsid=" TARGET_FMT_lx " ptem=" TARGET_FMT_lx
-            " hash=%016" HWADDR_PRIx "\n",
+            " hash=0x%016" HWADDR_PRIx "\n",
             ppc_hash64_hpt_base(cpu), ppc_hash64_hpt_mask(cpu),
             vsid, ptem,  hash);
     ptex = ppc_hash64_pteg_search(cpu, hash, sps, ptem, pte, pshift);
@@ -714,9 +714,9 @@ static hwaddr ppc_hash64_htab_lookup(PowerPCCPU *cpu,
         /* Secondary PTEG lookup */
         ptem |= HPTE64_V_SECONDARY;
         qemu_log_mask(CPU_LOG_MMU,
-                "1 htab=%016" HWADDR_PRIx "/%016" HWADDR_PRIx
+                "1 htab=0x%016" HWADDR_PRIx "/0x%016" HWADDR_PRIx
                 " vsid=" TARGET_FMT_lx " api=" TARGET_FMT_lx
-                " hash=%016" HWADDR_PRIx "\n", ppc_hash64_hpt_base(cpu),
+                " hash=0x%016" HWADDR_PRIx "\n", ppc_hash64_hpt_base(cpu),
                 ppc_hash64_hpt_mask(cpu), vsid, ptem, ~hash);
 
         ptex = ppc_hash64_pteg_search(cpu, ~hash, sps, ptem, pte, pshift);
diff --git a/target/ppc/mmu_common.c b/target/ppc/mmu_common.c
index e9d469adeb..bbde3ec41f 100644
--- a/target/ppc/mmu_common.c
+++ b/target/ppc/mmu_common.c
@@ -252,7 +252,7 @@ static int ppc6xx_tlb_check(CPUPPCState *env, mmu_ctx_t *ctx,
     }
     if (best != -1) {
     done:
-        qemu_log_mask(CPU_LOG_MMU, "found TLB at addr %016" HWADDR_PRIx
+        qemu_log_mask(CPU_LOG_MMU, "found TLB at addr 0x%016" HWADDR_PRIx
                       " prot=%01x ret=%d\n",
                       ctx->raddr & TARGET_PAGE_MASK, ctx->prot, ret);
         /* Update page flags */
@@ -329,7 +329,7 @@ static int get_bat_6xx_tlb(CPUPPCState *env, mmu_ctx_t *ctx,
                 ret = check_prot(ctx->prot, access_type);
                 if (ret == 0) {
                     qemu_log_mask(CPU_LOG_MMU,
-                                  "BAT %d match: r %016" HWADDR_PRIx
+                                  "BAT %d match: r 0x%016" HWADDR_PRIx
                                   " prot=%c%c\n", i, ctx->raddr,
                                   ctx->prot & PAGE_READ ? 'R' : '-',
                                   ctx->prot & PAGE_WRITE ? 'W' : '-');
@@ -404,9 +404,9 @@ static int get_segment_6xx_tlb(CPUPPCState *env, mmu_ctx_t *ctx,
         /* Check if instruction fetch is allowed, if needed */
         if (type != ACCESS_CODE || ctx->nx == 0) {
             /* Page address translation */
-            qemu_log_mask(CPU_LOG_MMU, "htab_base %016" HWADDR_PRIx
-                    " htab_mask %016" HWADDR_PRIx
-                    " hash %016" HWADDR_PRIx "\n",
+            qemu_log_mask(CPU_LOG_MMU, "htab_base 0x%016" HWADDR_PRIx
+                    " htab_mask 0x%016" HWADDR_PRIx
+                    " hash 0x%016" HWADDR_PRIx "\n",
                     ppc_hash32_hpt_base(cpu), ppc_hash32_hpt_mask(cpu), hash);
             ctx->hash[0] = hash;
             ctx->hash[1] = ~hash;
@@ -421,8 +421,8 @@ static int get_segment_6xx_tlb(CPUPPCState *env, mmu_ctx_t *ctx,
                 hwaddr curaddr;
                 uint32_t a0, a1, a2, a3;
 
-                qemu_log("Page table: %016" HWADDR_PRIx
-                         " len %016" HWADDR_PRIx "\n",
+                qemu_log("Page table: 0x%016" HWADDR_PRIx
+                         " len 0x%016" HWADDR_PRIx "\n",
                          ppc_hash32_hpt_base(cpu),
                          ppc_hash32_hpt_mask(cpu) + 0x80);
                 for (curaddr = ppc_hash32_hpt_base(cpu);
@@ -434,7 +434,7 @@ static int get_segment_6xx_tlb(CPUPPCState *env, mmu_ctx_t *ctx,
                     a2 = ldl_phys(cs->as, curaddr + 8);
                     a3 = ldl_phys(cs->as, curaddr + 12);
                     if (a0 != 0 || a1 != 0 || a2 != 0 || a3 != 0) {
-                        qemu_log("%016" HWADDR_PRIx ": %08x %08x %08x %08x\n",
+                        qemu_log("0x%016" HWADDR_PRIx ": %08x %08x %08x %08x\n",
                                  curaddr, a0, a1, a2, a3);
                     }
                 }
@@ -580,14 +580,14 @@ static int mmu40x_get_physical_address(CPUPPCState *env, mmu_ctx_t *ctx,
         if (ret >= 0) {
             ctx->raddr = raddr;
             qemu_log_mask(CPU_LOG_MMU, "%s: access granted " TARGET_FMT_lx
-                          " => %016" HWADDR_PRIx
+                          " => 0x%016" HWADDR_PRIx
                           " %d %d\n", __func__, address, ctx->raddr, ctx->prot,
                           ret);
             return 0;
         }
     }
      qemu_log_mask(CPU_LOG_MMU, "%s: access refused " TARGET_FMT_lx
-                   " => %016" HWADDR_PRIx
+                   " => 0x%016" HWADDR_PRIx
                    " %d %d\n", __func__, address, raddr, ctx->prot, ret);
 
     return ret;
@@ -668,11 +668,11 @@ static int mmubooke_get_physical_address(CPUPPCState *env, mmu_ctx_t *ctx,
     if (ret >= 0) {
         ctx->raddr = raddr;
         qemu_log_mask(CPU_LOG_MMU, "%s: access granted " TARGET_FMT_lx
-                      " => %016" HWADDR_PRIx " %d %d\n", __func__,
+                      " => 0x%016" HWADDR_PRIx " %d %d\n", __func__,
                       address, ctx->raddr, ctx->prot, ret);
     } else {
          qemu_log_mask(CPU_LOG_MMU, "%s: access refused " TARGET_FMT_lx
-                       " => %016" HWADDR_PRIx " %d %d\n", __func__,
+                       " => 0x%016" HWADDR_PRIx " %d %d\n", __func__,
                        address, raddr, ctx->prot, ret);
     }
 
@@ -896,11 +896,11 @@ found_tlb:
     if (ret >= 0) {
         ctx->raddr = raddr;
          qemu_log_mask(CPU_LOG_MMU, "%s: access granted " TARGET_FMT_lx
-                       " => %016" HWADDR_PRIx " %d %d\n", __func__, address,
+                       " => 0x%016" HWADDR_PRIx " %d %d\n", __func__, address,
                        ctx->raddr, ctx->prot, ret);
     } else {
          qemu_log_mask(CPU_LOG_MMU, "%s: access refused " TARGET_FMT_lx
-                       " => %016" HWADDR_PRIx " %d %d\n", __func__, address,
+                       " => 0x%016" HWADDR_PRIx " %d %d\n", __func__, address,
                        raddr, ctx->prot, ret);
     }
 
diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index 3b1230d270..ab1a4eb7e6 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -826,7 +826,7 @@ void helper_4xx_tlbwe_hi(CPUPPCState *env, target_ulong entry,
         tlb->prot &= ~PAGE_VALID;
     }
     tlb->PID = env->spr[SPR_40x_PID]; /* PID */
-    qemu_log_mask(CPU_LOG_MMU, "%s: set up TLB %d RPN %016" HWADDR_PRIx
+    qemu_log_mask(CPU_LOG_MMU, "%s: set up TLB %d RPN 0x%016" HWADDR_PRIx
                   " EPN " TARGET_FMT_lx " size " TARGET_FMT_lx
                   " prot %c%c%c%c PID %d\n", __func__,
                   (int)entry, tlb->RPN, tlb->EPN, tlb->size,
@@ -864,7 +864,7 @@ void helper_4xx_tlbwe_lo(CPUPPCState *env, target_ulong entry,
     if (val & PPC4XX_TLBLO_WR) {
         tlb->prot |= PAGE_WRITE;
     }
-    qemu_log_mask(CPU_LOG_MMU, "%s: set up TLB %d RPN %016" HWADDR_PRIx
+    qemu_log_mask(CPU_LOG_MMU, "%s: set up TLB %d RPN 0x%016" HWADDR_PRIx
                   " EPN " TARGET_FMT_lx
                   " size " TARGET_FMT_lx " prot %c%c%c%c PID %d\n", __func__,
                   (int)entry, tlb->RPN, tlb->EPN, tlb->size,
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 5c45e92b9f..51033e2ee8 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -1272,7 +1272,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 
         qemu_log_mask(CPU_LOG_MMU,
                       "%s 1st-stage address=%" VADDR_PRIx " ret %d physical "
-                      "%016" HWADDR_PRIx " prot %d\n",
+                      "0x%016" HWADDR_PRIx " prot %d\n",
                       __func__, address, ret, pa, prot);
 
         if (ret == TRANSLATE_SUCCESS) {
@@ -1285,7 +1285,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 
             qemu_log_mask(CPU_LOG_MMU,
                     "%s 2nd-stage address=%" VADDR_PRIx " ret %d physical "
-                    "%016" HWADDR_PRIx " prot %d\n",
+                    "0x%016" HWADDR_PRIx " prot %d\n",
                     __func__, im_address, ret, pa, prot2);
 
             prot &= prot2;
@@ -1295,7 +1295,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                                                size, access_type, mode);
 
                 qemu_log_mask(CPU_LOG_MMU,
-                              "%s PMP address=%016" HWADDR_PRIx " ret %d prot"
+                              "%s PMP address=0x%016" HWADDR_PRIx " ret %d prot"
                               " %d tlb_size " TARGET_FMT_lu "\n",
                               __func__, pa, ret, prot_pmp, tlb_size);
 
@@ -1320,7 +1320,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 
         qemu_log_mask(CPU_LOG_MMU,
                       "%s address=%" VADDR_PRIx " ret %d physical "
-                      "%016" HWADDR_PRIx " prot %d\n",
+                      "0x%016" HWADDR_PRIx " prot %d\n",
                       __func__, address, ret, pa, prot);
 
         if (ret == TRANSLATE_SUCCESS) {
@@ -1328,7 +1328,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                                            size, access_type, mode);
 
             qemu_log_mask(CPU_LOG_MMU,
-                          "%s PMP address=%016" HWADDR_PRIx " ret %d prot"
+                          "%s PMP address=0x%016" HWADDR_PRIx " ret %d prot"
                           " %d tlb_size " TARGET_FMT_lu "\n",
                           __func__, pa, ret, prot_pmp, tlb_size);
 
diff --git a/target/riscv/monitor.c b/target/riscv/monitor.c
index 81125886fe..60b5b1027f 100644
--- a/target/riscv/monitor.c
+++ b/target/riscv/monitor.c
@@ -64,7 +64,7 @@ static void print_pte(Monitor *mon, int va_bits, target_ulong vaddr,
         return;
     }
 
-    monitor_printf(mon, TARGET_FMT_lx " %016" HWADDR_PRIx " " TARGET_FMT_lx
+    monitor_printf(mon, TARGET_FMT_lx " 0x%016" HWADDR_PRIx " " TARGET_FMT_lx
                    " %c%c%c%c%c%c%c\n",
                    addr_canonical(va_bits, vaddr),
                    paddr, size,
diff --git a/target/sparc/ldst_helper.c b/target/sparc/ldst_helper.c
index 91bfb4490e..3c772a0677 100644
--- a/target/sparc/ldst_helper.c
+++ b/target/sparc/ldst_helper.c
@@ -430,12 +430,12 @@ static void sparc_raise_mmu_fault(CPUState *cs, hwaddr addr,
 
 #ifdef DEBUG_UNASSIGNED
     if (is_asi) {
-        printf("Unassigned mem %s access of %d byte%s to %016" HWADDR_PRIx
+        printf("Unassigned mem %s access of %d byte%s to 0x%016" HWADDR_PRIx
                " asi 0x%02x from " TARGET_FMT_lx "\n",
                is_exec ? "exec" : is_write ? "write" : "read", size,
                size == 1 ? "" : "s", addr, is_asi, env->pc);
     } else {
-        printf("Unassigned mem %s access of %d byte%s to %016" HWADDR_PRIx
+        printf("Unassigned mem %s access of %d byte%s to 0x%016" HWADDR_PRIx
                " from " TARGET_FMT_lx "\n",
                is_exec ? "exec" : is_write ? "write" : "read", size,
                size == 1 ? "" : "s", addr, env->pc);
@@ -490,7 +490,7 @@ static void sparc_raise_mmu_fault(CPUState *cs, hwaddr addr,
     CPUSPARCState *env = &cpu->env;
 
 #ifdef DEBUG_UNASSIGNED
-    printf("Unassigned mem access to %016" HWADDR_PRIx " from " TARGET_FMT_lx
+    printf("Unassigned mem access to 0x%016" HWADDR_PRIx " from " TARGET_FMT_lx
            "\n", addr, env->pc);
 #endif
 
diff --git a/target/sparc/mmu_helper.c b/target/sparc/mmu_helper.c
index 3ded8ff30e..4f79a09d8b 100644
--- a/target/sparc/mmu_helper.c
+++ b/target/sparc/mmu_helper.c
@@ -230,7 +230,7 @@ bool sparc_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     if (likely(error_code == 0)) {
         qemu_log_mask(CPU_LOG_MMU,
                       "Translate at %" VADDR_PRIx " -> "
-                      "%016" HWADDR_PRIx ", vaddr " TARGET_FMT_lx "\n",
+                      "0x%016" HWADDR_PRIx ", vaddr " TARGET_FMT_lx "\n",
                       address, paddr, vaddr);
         tlb_set_page(cs, vaddr, paddr, prot, mmu_idx, page_size);
         return true;
@@ -356,20 +356,20 @@ void dump_mmu(CPUSPARCState *env)
     hwaddr pa;
     uint32_t pde;
 
-    qemu_printf("Root ptr: %016" HWADDR_PRIx ", ctx: %d\n",
+    qemu_printf("Root ptr: 0x%016" HWADDR_PRIx ", ctx: %d\n",
                 (hwaddr)env->mmuregs[1] << 4, env->mmuregs[2]);
     for (n = 0, va = 0; n < 256; n++, va += 16 * 1024 * 1024) {
         pde = mmu_probe(env, va, 2);
         if (pde) {
             pa = cpu_get_phys_page_debug(cs, va);
-            qemu_printf("VA: " TARGET_FMT_lx ", PA: %016" HWADDR_PRIx
+            qemu_printf("VA: " TARGET_FMT_lx ", PA: 0x%016" HWADDR_PRIx
                         " PDE: " TARGET_FMT_lx "\n", va, pa, pde);
             for (m = 0, va1 = va; m < 64; m++, va1 += 256 * 1024) {
                 pde = mmu_probe(env, va1, 1);
                 if (pde) {
                     pa = cpu_get_phys_page_debug(cs, va1);
                     qemu_printf(" VA: " TARGET_FMT_lx
-                                ", PA: %016" HWADDR_PRIx
+                                ", PA: 0x%016" HWADDR_PRIx
                                 " PDE: " TARGET_FMT_lx "\n",
                                 va1, pa, pde);
                     for (o = 0, va2 = va1; o < 64; o++, va2 += 4 * 1024) {
@@ -377,7 +377,7 @@ void dump_mmu(CPUSPARCState *env)
                         if (pde) {
                             pa = cpu_get_phys_page_debug(cs, va2);
                             qemu_printf("  VA: " TARGET_FMT_lx ", PA: "
-                                        "%016" HWADDR_PRIx " PTE: "
+                                        "0x%016" HWADDR_PRIx " PTE: "
                                         TARGET_FMT_lx "\n",
                                         va2, pa, pde);
                         }
diff --git a/target/tricore/helper.c b/target/tricore/helper.c
index 55a1d780cf..9c96c14ddb 100644
--- a/target/tricore/helper.c
+++ b/target/tricore/helper.c
@@ -79,7 +79,7 @@ bool tricore_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                                address, rw, mmu_idx);
 
     qemu_log_mask(CPU_LOG_MMU, "%s address=" TARGET_FMT_lx " ret %d physical "
-                  "%016" HWADDR_PRIx " prot %d\n",
+                  "0x%016" HWADDR_PRIx " prot %d\n",
                   __func__, (target_ulong)address, ret, physical, prot);
 
     if (ret == TLBRET_MATCH) {
-- 
2.38.1


