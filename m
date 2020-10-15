Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kSufd-0006Y1-Dh
	for mharc-qemu-riscv@gnu.org; Thu, 15 Oct 2020 00:15:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <green.wan@sifive.com>)
 id 1kSufb-0006VF-Pl
 for qemu-riscv@nongnu.org; Thu, 15 Oct 2020 00:15:15 -0400
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:39577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <green.wan@sifive.com>)
 id 1kSufY-0006s1-OF
 for qemu-riscv@nongnu.org; Thu, 15 Oct 2020 00:15:15 -0400
Received: by mail-pj1-x1044.google.com with SMTP id gv6so1119147pjb.4
 for <qemu-riscv@nongnu.org>; Wed, 14 Oct 2020 21:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Htn/B8k+1/JpRIVNx3cFS6HMpNPM26t880PCz9769ik=;
 b=jt1v3hzmh7qtX18sJtd3U6q6TydqJqpR94Fdubg03KVkWeboDwNN+ccek3O0EUSSJQ
 K8SrqSRpRPLF1YcejX96j4zkxcetrc4WGmeTaeoIQkyNqiL0gBjFBiAgkAm3P3z+Ytnk
 CXJFbd7Lg3vKUctmE7tt7fagqEotnqfTlSH1DGsBZkmAFbpazlZkzXLrB47T0fkk/CFI
 4TA5lssF4MBDFzlnQatduttUpnWT/tFoabSSqi70uzoS4BMG7B4LHF9UtSMO1Ihp8Yry
 0Rm3TesT08sVZEI/Q0KKtnirtnlzZ89jTSB7QqstCvPP4+7EhYBLGRZgeFGj+XvNcRhy
 Ts6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Htn/B8k+1/JpRIVNx3cFS6HMpNPM26t880PCz9769ik=;
 b=k/PL6o5QDtECS2m/d+pstjM5HPCRBY9g61/A9K9lUc5oXSxfJSR6hBJ8clu82bsH+X
 aAc6P9exw6mzhYLZs7UewqSjOGY/uBErQPGWGGVWtuQQX9Kt/QWrM6m0QyjYwCeKcKt3
 zoLwcOLMtqZX676QRxEKv01fdlWk33iWRSaWq3Fs9DDaav1lSx5Jm/4z04LYLfqNpsH7
 U6w1atnxH/MzxqS5VkkSyNqNUtHeuhqZ8MULEb3wkIjoXBC8VX6ZTRgV6P7zqmj20TYP
 Ef3AKsJmyBaYjGr8VAhb9rbQmV7PK+t2jwtYF60q1Z/UKLXXxUfMdmobZoZeBMNfXkBU
 D9pw==
X-Gm-Message-State: AOAM530A+aya6iQbIl6UiV7/VqSIjD4lDlPxAd2hXkLadOmgF4yPybOm
 oACkxoaMIhHDhZQ/jwOO7vajQg==
X-Google-Smtp-Source: ABdhPJxZKLyd6nBG7vk+OLdDnl7AH1knA36A4fllD6CbW9htrJRBXszIRALJerV9pj3DgQdW+vYL2g==
X-Received: by 2002:a17:90b:30d2:: with SMTP id
 hi18mr2552799pjb.86.1602735311314; 
 Wed, 14 Oct 2020 21:15:11 -0700 (PDT)
Received: from localhost.localdomain (111-241-103-134.dynamic-ip.hinet.net.
 [111.241.103.134])
 by smtp.gmail.com with ESMTPSA id gd14sm1250191pjb.31.2020.10.14.21.15.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2020 21:15:10 -0700 (PDT)
From: Green Wan <green.wan@sifive.com>
To: 
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, bmeng.cn@gmail.com,
 alistair23@gmail.com, green.wan@sifive.com
Subject: [RFC PATCH v7 2/2] hw/misc/sifive_u_otp: Add backend drive support
Date: Thu, 15 Oct 2020 12:14:24 +0800
Message-Id: <20201015041424.23090-3-green.wan@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201015041424.23090-1-green.wan@sifive.com>
References: <20201015041424.23090-1-green.wan@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1044;
 envelope-from=green.wan@sifive.com; helo=mail-pj1-x1044.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 15 Oct 2020 04:15:16 -0000

Add '-drive' support to OTP device. Allow users to assign a raw file
as OTP image.

test commands for 16k otp.img filled with zero:

$ dd if=/dev/zero of=./otp.img bs=1k count=16
$ ./qemu-system-riscv64 -M sifive_u -m 256M -nographic -bios none \
-kernel ../opensbi/build/platform/sifive/fu540/firmware/fw_payload.elf \
-d guest_errors -drive if=none,format=raw,file=otp.img

Signed-off-by: Green Wan <green.wan@sifive.com>
---
 hw/misc/sifive_u_otp.c         | 67 +++++++++++++++++++++++++++++++++-
 include/hw/misc/sifive_u_otp.h |  2 +
 2 files changed, 68 insertions(+), 1 deletion(-)

diff --git a/hw/misc/sifive_u_otp.c b/hw/misc/sifive_u_otp.c
index 565eec082f..60066375ab 100644
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
@@ -137,7 +150,7 @@ static void sifive_u_otp_write(void *opaque, hwaddr addr,
         if (s->pwe && !s->pas) {
             if (GET_FUSEARRAY_BIT(s->fuse_wo, s->pa, s->paio)) {
                 qemu_log_mask(LOG_GUEST_ERROR,
-                              "Error: write idx<%u>, bit<%u>\n",
+                              "write once error: idx<%u>, bit<%u>\n",
                               s->pa, s->paio);
                 break;
             }
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


