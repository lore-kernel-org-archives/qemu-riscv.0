Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kMq8g-0003m3-6P
	for mharc-qemu-riscv@gnu.org; Mon, 28 Sep 2020 06:12:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <green.wan@sifive.com>)
 id 1kMq8d-0003fG-FT
 for qemu-riscv@nongnu.org; Mon, 28 Sep 2020 06:12:07 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:41130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <green.wan@sifive.com>)
 id 1kMq8Y-0001RV-FG
 for qemu-riscv@nongnu.org; Mon, 28 Sep 2020 06:12:07 -0400
Received: by mail-pg1-x542.google.com with SMTP id 197so431349pge.8
 for <qemu-riscv@nongnu.org>; Mon, 28 Sep 2020 03:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=nN8OUO8G/I5uJu9MqGsHVSz2gMnkdh9PLBBCTFybCKs=;
 b=aboCT2ArQYYDhf782qD0kk00pyozozQtQ2IR0olfKL4JReuQDZ5ntreBB8IFxArOEO
 xq2IhLlpTLCN92TP9cAzK1DCHCKrnsH+N42lqgKBjeaSzdTP3XoGLNflxcD6gx2fka57
 3Z6Igdj9sWAZE+BN1KC++V+a0hoTtZjrlS9Ms4TsJVxnRKW3g7P9d0PXvMKG5AN0eigg
 xN6Hs/sIW/asTHGHgeIUNtCF9bXzbqr9QDVJ81eGt3fssClwyp4bGWZxdL8J7igUpFdK
 LENFXn9NRgI/u1tq6bbZvHtF1FZDG5CLRvPRjTpMBDyPp8FT9G+J0Cd4RWUPv1xwyBs5
 3JsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=nN8OUO8G/I5uJu9MqGsHVSz2gMnkdh9PLBBCTFybCKs=;
 b=UexYs4ojoIjWZVHgkeDWmmN1atlIlduxeKzMt66B1KiRui6Vp/KFJSNtEDTvrU06l6
 J4vdsDl3S15epImwVNT53w2r+3B8+tWvKFRP3KYb5nFHo+wZIBaEHiexq1L41r+YFgJe
 VaaRzXbFjN7TWh+sdv9UTqHYJaX+AwdElv+xjrDCgPehpjU6Y/kO9ue0p8WPD1LkiEjY
 jxcbb5mPD7T/j1/AnLkqK/tAEIRAckVrgwbxXOm/7aBKO7Ck49FmTBEYh5onmtdgu3Ds
 Gpd/PZWSkW52F3jh830bXIrHgm8HbRWhQs13zpFprrVlqsVxLODVxw4aL7zTtS34Px+v
 dZRQ==
X-Gm-Message-State: AOAM5322v/Y9nfj/1aAqApwD7sjdM2Luz77Gfqv0RL6DjrWgWZ1qgMN1
 2Swn7U5ZVk54pYIRF6rR80yGuQ==
X-Google-Smtp-Source: ABdhPJz+VEMYAFr2ORSEiTPliIuseVDH3qacbT7EQWzjsw6BB6tDucwMcj2OGrTHzNo6S8vwF/2iVQ==
X-Received: by 2002:a17:902:c394:b029:d2:4ca:2e22 with SMTP id
 g20-20020a170902c394b02900d204ca2e22mr883726plg.77.1601287920409; 
 Mon, 28 Sep 2020 03:12:00 -0700 (PDT)
Received: from localhost.localdomain (111-241-115-7.dynamic-ip.hinet.net.
 [111.241.115.7])
 by smtp.gmail.com with ESMTPSA id u2sm814747pji.50.2020.09.28.03.11.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2020 03:12:00 -0700 (PDT)
From: Green Wan <green.wan@sifive.com>
To: 
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, bmeng.cn@gmail.com,
 alistair23@gmail.com, Green Wan <green.wan@sifive.com>
Subject: [RFC PATCH v6 1/2] hw/misc/sifive_u_otp: Add write function and
 write-once protection
Date: Mon, 28 Sep 2020 18:11:45 +0800
Message-Id: <20200928101146.12786-2-green.wan@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200928101146.12786-1-green.wan@sifive.com>
References: <20200928101146.12786-1-green.wan@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::542;
 envelope-from=green.wan@sifive.com; helo=mail-pg1-x542.google.com
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
X-List-Received-Date: Mon, 28 Sep 2020 10:12:07 -0000

 - Add write operation to update fuse data bit when PWE bit is on.
 - Add array, fuse_wo, to store the 'written' status for all bits
   of OTP to block the write operation.

Signed-off-by: Green Wan <green.wan@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/misc/sifive_u_otp.c         | 30 +++++++++++++++++++++++++++++-
 include/hw/misc/sifive_u_otp.h |  3 +++
 2 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/hw/misc/sifive_u_otp.c b/hw/misc/sifive_u_otp.c
index c2f3c8e129..685c1f8e07 100644
--- a/hw/misc/sifive_u_otp.c
+++ b/hw/misc/sifive_u_otp.c
@@ -25,6 +25,14 @@
 #include "qemu/module.h"
 #include "hw/misc/sifive_u_otp.h"
 
+#define WRITTEN_BIT_ON 0x1
+
+#define SET_FUSEARRAY_BIT(map, i, off, bit)    \
+    map[i] = bit ? (map[i] | bit << off) : (map[i] & ~(bit << off))
+
+#define GET_FUSEARRAY_BIT(map, i, off)    \
+    ((map[i] >> off) & 0x1)
+
 static uint64_t sifive_u_otp_read(void *opaque, hwaddr addr, unsigned int size)
 {
     SiFiveUOTPState *s = opaque;
@@ -123,7 +131,24 @@ static void sifive_u_otp_write(void *opaque, hwaddr addr,
         s->ptrim = val32;
         break;
     case SIFIVE_U_OTP_PWE:
-        s->pwe = val32;
+        s->pwe = val32 & SIFIVE_U_OTP_PWE_EN;
+
+        /* PWE is enabled. Ignore PAS=1 (no redundancy cell) */
+        if (s->pwe && !s->pas) {
+            if (GET_FUSEARRAY_BIT(s->fuse_wo, s->pa, s->paio)) {
+                qemu_log_mask(LOG_GUEST_ERROR,
+                              "Error: write idx<%u>, bit<%u>\n",
+                              s->pa, s->paio);
+                break;
+            }
+
+            /* write bit data */
+            SET_FUSEARRAY_BIT(s->fuse, s->pa, s->paio, s->pdin);
+
+            /* update written bit */
+            SET_FUSEARRAY_BIT(s->fuse_wo, s->pa, s->paio, WRITTEN_BIT_ON);
+        }
+
         break;
     default:
         qemu_log_mask(LOG_GUEST_ERROR, "%s: bad write: addr=0x%" HWADDR_PRIx
@@ -165,6 +190,9 @@ static void sifive_u_otp_reset(DeviceState *dev)
     /* Make a valid content of serial number */
     s->fuse[SIFIVE_U_OTP_SERIAL_ADDR] = s->serial;
     s->fuse[SIFIVE_U_OTP_SERIAL_ADDR + 1] = ~(s->serial);
+
+    /* Initialize write-once map */
+    memset(s->fuse_wo, 0x00, sizeof(s->fuse_wo));
 }
 
 static void sifive_u_otp_class_init(ObjectClass *klass, void *data)
diff --git a/include/hw/misc/sifive_u_otp.h b/include/hw/misc/sifive_u_otp.h
index 82c9176c8f..ebffbc1fa5 100644
--- a/include/hw/misc/sifive_u_otp.h
+++ b/include/hw/misc/sifive_u_otp.h
@@ -36,6 +36,8 @@
 #define SIFIVE_U_OTP_PTRIM      0x34
 #define SIFIVE_U_OTP_PWE        0x38
 
+#define SIFIVE_U_OTP_PWE_EN     (1 << 0)
+
 #define SIFIVE_U_OTP_PCE_EN     (1 << 0)
 
 #define SIFIVE_U_OTP_PDSTB_EN   (1 << 0)
@@ -75,6 +77,7 @@ struct SiFiveUOTPState {
     uint32_t ptrim;
     uint32_t pwe;
     uint32_t fuse[SIFIVE_U_OTP_NUM_FUSES];
+    uint32_t fuse_wo[SIFIVE_U_OTP_NUM_FUSES];
     /* config */
     uint32_t serial;
 };
-- 
2.17.1


