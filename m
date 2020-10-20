Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kUiTF-00018b-NZ
	for mharc-qemu-riscv@gnu.org; Mon, 19 Oct 2020 23:37:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <green.wan@sifive.com>)
 id 1kUiTD-00014y-Jr
 for qemu-riscv@nongnu.org; Mon, 19 Oct 2020 23:37:55 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:46068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <green.wan@sifive.com>)
 id 1kUiTB-0005t2-GG
 for qemu-riscv@nongnu.org; Mon, 19 Oct 2020 23:37:55 -0400
Received: by mail-pf1-x442.google.com with SMTP id e7so350057pfn.12
 for <qemu-riscv@nongnu.org>; Mon, 19 Oct 2020 20:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=2MdD/KbFj2F6biIth4mJLK1dPZwo6x43Ryr4hb6E+0Y=;
 b=FbQbmWaIvlyV1c3cFa2LvPBbDB7Ij3YfNd5sPSj7oS4PxJfcVEG6HYoqaCMmL4UZaU
 LmXs3PGgQQaUG4RLdZCWFQpoU1Du2CZ4EmfheakFP8ehlBxrbY+qnHudpjWx+obA2zvH
 uAqMHskkk6P94xWXBqWAr8DjrTrMdFjjTtVjqty/8wIBrZBZqMdssGRSRAP4/zwlPxBJ
 HqtKHHedow2tovVpuIMP5aF/gYvCe/QmHtvicCwBuS1UyBsZlyyeGRRizDG9LxySsTmu
 u/dDPtx+Xh5YyQ3N4PZtkQ/cMf/8cAnnynigsvO7V7WvBGn1eAI7ROVEuCqofRdFC9Qd
 HwUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=2MdD/KbFj2F6biIth4mJLK1dPZwo6x43Ryr4hb6E+0Y=;
 b=OKMPJn4i23+U4N4BN2n8e/PUcUB8DQ0aVlCCIrlOzWgTdJFOS+ByWtwt8uJOFtJ2Ka
 VFALS0fpk68wZBWXTvs6O+MHxEK5gdLUksHMOImBOPtK1SJfR+nhW4mKRLu3kVqyPSrP
 T1cPIcCT5QvR2OxNzWpOgx271Bib9kyK+Ra9nf61VXuqfMnixMY/NX8hVZokqmsgPPL5
 jjD/7i1mAJoigwZt9bUQk/PcmSvjg1eu3OHvx+a+8rgibJBwF6n//S3ZjTpHqjpygMuh
 w2TdBjlh1KavCXq2oeOI5bAPSlEszKA/KoGB6PwvL5PfzKOHOmlnOR4/dgbAbPFpXjNr
 d3ag==
X-Gm-Message-State: AOAM530fF4vpbo9rLqtgA71D1nsVA1f8v44VTtSVMvBrA6IE2LrYr4Rm
 fZNXl4PUP51ByJwnnSH1yVhFqA==
X-Google-Smtp-Source: ABdhPJyEWAVl1KS37uCM0+gxs2GmfvvR7feWHKVQgUA9GoAONc8B/YC/YZePSBwQ6ljt44g+Pz6jFw==
X-Received: by 2002:a63:1b44:: with SMTP id b4mr947926pgm.175.1603165071532;
 Mon, 19 Oct 2020 20:37:51 -0700 (PDT)
Received: from localhost.localdomain (111-243-184-51.dynamic-ip.hinet.net.
 [111.243.184.51])
 by smtp.gmail.com with ESMTPSA id gd14sm260489pjb.31.2020.10.19.20.37.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 20:37:51 -0700 (PDT)
From: Green Wan <green.wan@sifive.com>
To: 
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, bmeng.cn@gmail.com,
 alistair23@gmail.com, green.wan@sifive.com
Subject: [PATCH v8 2/2] hw/misc/sifive_u_otp: Add backend drive support
Date: Tue, 20 Oct 2020 11:37:32 +0800
Message-Id: <20201020033732.12921-3-green.wan@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201020033732.12921-1-green.wan@sifive.com>
References: <20201020033732.12921-1-green.wan@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=green.wan@sifive.com; helo=mail-pf1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 20 Oct 2020 03:37:56 -0000

Add '-drive' support to OTP device. Allow users to assign a raw file
as OTP image.

test commands for 16k otp.img filled with zero:

$ dd if=/dev/zero of=./otp.img bs=1k count=16
$ ./qemu-system-riscv64 -M sifive_u -m 256M -nographic -bios none \
-kernel ../opensbi/build/platform/sifive/fu540/firmware/fw_payload.elf \
-d guest_errors -drive if=none,format=raw,file=otp.img

Signed-off-by: Green Wan <green.wan@sifive.com>
Reviewed-by: Bin Meng <bin.meng@windriver.com>
Tested-by: Bin Meng <bin.meng@windriver.com>
---
 hw/misc/sifive_u_otp.c         | 65 ++++++++++++++++++++++++++++++++++
 include/hw/misc/sifive_u_otp.h |  2 ++
 2 files changed, 67 insertions(+)

diff --git a/hw/misc/sifive_u_otp.c b/hw/misc/sifive_u_otp.c
index b9238d64cb..60066375ab 100644
--- a/hw/misc/sifive_u_otp.c
+++ b/hw/misc/sifive_u_otp.c
@@ -19,11 +19,14 @@
  */
 
 #include "qemu/osdep.h"
+#include "qapi/error.h"
 #include "hw/qdev-properties.h"
 #include "hw/sysbus.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
 #include "hw/misc/sifive_u_otp.h"
+#include "sysemu/blockdev.h"
+#include "sysemu/block-backend.h"
 
 #define WRITTEN_BIT_ON 0x1
 
@@ -54,6 +57,16 @@ static uint64_t sifive_u_otp_read(void *opaque, hwaddr addr, unsigned int size)
         if ((s->pce & SIFIVE_U_OTP_PCE_EN) &&
             (s->pdstb & SIFIVE_U_OTP_PDSTB_EN) &&
             (s->ptrim & SIFIVE_U_OTP_PTRIM_EN)) {
+
+            /* read from backend */
+            if (s->blk) {
+                int32_t buf;
+
+                blk_pread(s->blk, s->pa * SIFIVE_U_OTP_FUSE_WORD, &buf,
+                          SIFIVE_U_OTP_FUSE_WORD);
+                return buf;
+            }
+
             return s->fuse[s->pa & SIFIVE_U_OTP_PA_MASK];
         } else {
             return 0xff;
@@ -145,6 +158,12 @@ static void sifive_u_otp_write(void *opaque, hwaddr addr,
             /* write bit data */
             SET_FUSEARRAY_BIT(s->fuse, s->pa, s->paio, s->pdin);
 
+            /* write to backend */
+            if (s->blk) {
+                blk_pwrite(s->blk, s->pa * SIFIVE_U_OTP_FUSE_WORD,
+                           &s->fuse[s->pa], SIFIVE_U_OTP_FUSE_WORD, 0);
+            }
+
             /* update written bit */
             SET_FUSEARRAY_BIT(s->fuse_wo, s->pa, s->paio, WRITTEN_BIT_ON);
         }
@@ -168,16 +187,48 @@ static const MemoryRegionOps sifive_u_otp_ops = {
 
 static Property sifive_u_otp_properties[] = {
     DEFINE_PROP_UINT32("serial", SiFiveUOTPState, serial, 0),
+    DEFINE_PROP_DRIVE("drive", SiFiveUOTPState, blk),
     DEFINE_PROP_END_OF_LIST(),
 };
 
 static void sifive_u_otp_realize(DeviceState *dev, Error **errp)
 {
     SiFiveUOTPState *s = SIFIVE_U_OTP(dev);
+    DriveInfo *dinfo;
 
     memory_region_init_io(&s->mmio, OBJECT(dev), &sifive_u_otp_ops, s,
                           TYPE_SIFIVE_U_OTP, SIFIVE_U_OTP_REG_SIZE);
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->mmio);
+
+    dinfo = drive_get_next(IF_NONE);
+    if (dinfo) {
+        int ret;
+        uint64_t perm;
+        int filesize;
+        BlockBackend *blk;
+
+        blk = blk_by_legacy_dinfo(dinfo);
+        filesize = SIFIVE_U_OTP_NUM_FUSES * SIFIVE_U_OTP_FUSE_WORD;
+        if (blk_getlength(blk) < filesize) {
+            error_setg(errp, "OTP drive size < 16K");
+            return;
+        }
+
+        qdev_prop_set_drive_err(dev, "drive", blk, errp);
+
+        if (s->blk) {
+            perm = BLK_PERM_CONSISTENT_READ |
+                   (blk_is_read_only(s->blk) ? 0 : BLK_PERM_WRITE);
+            ret = blk_set_perm(s->blk, perm, BLK_PERM_ALL, errp);
+            if (ret < 0) {
+                return;
+            }
+
+            if (blk_pread(s->blk, 0, s->fuse, filesize) != filesize) {
+                error_setg(errp, "failed to read the initial flash content");
+            }
+        }
+    }
 }
 
 static void sifive_u_otp_reset(DeviceState *dev)
@@ -191,6 +242,20 @@ static void sifive_u_otp_reset(DeviceState *dev)
     s->fuse[SIFIVE_U_OTP_SERIAL_ADDR] = s->serial;
     s->fuse[SIFIVE_U_OTP_SERIAL_ADDR + 1] = ~(s->serial);
 
+    if (s->blk) {
+        /* Put serial number to backend as well*/
+        uint32_t serial_data;
+        int index = SIFIVE_U_OTP_SERIAL_ADDR;
+
+        serial_data = s->serial;
+        blk_pwrite(s->blk, index * SIFIVE_U_OTP_FUSE_WORD,
+                   &serial_data, SIFIVE_U_OTP_FUSE_WORD, 0);
+
+        serial_data = ~(s->serial);
+        blk_pwrite(s->blk, (index + 1) * SIFIVE_U_OTP_FUSE_WORD,
+                   &serial_data, SIFIVE_U_OTP_FUSE_WORD, 0);
+    }
+
     /* Initialize write-once map */
     memset(s->fuse_wo, 0x00, sizeof(s->fuse_wo));
 }
diff --git a/include/hw/misc/sifive_u_otp.h b/include/hw/misc/sifive_u_otp.h
index ebffbc1fa5..5d0d7df455 100644
--- a/include/hw/misc/sifive_u_otp.h
+++ b/include/hw/misc/sifive_u_otp.h
@@ -46,6 +46,7 @@
 
 #define SIFIVE_U_OTP_PA_MASK        0xfff
 #define SIFIVE_U_OTP_NUM_FUSES      0x1000
+#define SIFIVE_U_OTP_FUSE_WORD      4
 #define SIFIVE_U_OTP_SERIAL_ADDR    0xfc
 
 #define SIFIVE_U_OTP_REG_SIZE       0x1000
@@ -80,6 +81,7 @@ struct SiFiveUOTPState {
     uint32_t fuse_wo[SIFIVE_U_OTP_NUM_FUSES];
     /* config */
     uint32_t serial;
+    BlockBackend *blk;
 };
 
 #endif /* HW_SIFIVE_U_OTP_H */
-- 
2.17.1


