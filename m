Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kSufZ-0006QV-7I
	for mharc-qemu-riscv@gnu.org; Thu, 15 Oct 2020 00:15:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <green.wan@sifive.com>)
 id 1kSufY-0006Pl-Ku
 for qemu-riscv@nongnu.org; Thu, 15 Oct 2020 00:15:12 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:41923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <green.wan@sifive.com>)
 id 1kSufW-0006qr-Oc
 for qemu-riscv@nongnu.org; Thu, 15 Oct 2020 00:15:12 -0400
Received: by mail-pl1-x642.google.com with SMTP id w11so875457pll.8
 for <qemu-riscv@nongnu.org>; Wed, 14 Oct 2020 21:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Myh7Dd5z2mGss0YsPVlt5evO4Y/LpepbnGUctO4JuYM=;
 b=LVtCCRMAZqIecrEqZgZ1EktivdetoMS/Z+bLQLbXTZSlA3uG32w0DaevvSphuo4HgZ
 z43Rg683UB+eqfj3AAc2lxnbCkhgq58ZUIFlCUsMhq0l7o7ZCXxYEVHqCozdqdF9tX4G
 LCF79TE04pidE56xzfj1aoYT2UfiikpGfzsv8Y32pSOxgqlQtCcft0mYUOdktW5sj94s
 DMH/arrKQZZ9pvnnCRXYckLANs4sdVus+zShJq69NtRcZc59hkO8qFmgLu+skhzsWmDH
 UqlBicXrqBn9RWt4+s5DP4jUmZrzWxSRKIyJah0cZlOT7i2FkPptLt2HUg//mpfJRuM3
 +X8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Myh7Dd5z2mGss0YsPVlt5evO4Y/LpepbnGUctO4JuYM=;
 b=mkgujfNakKp+GrY/ny/iynhbCi1YsIwNkVsZ0EAC5SkcrY7bIUN9RgegVsf9XUnY3O
 YDSiJuYnaEdRElBDdXcXdW0Il9ZciaBnX3KB8udKJpnKqRTtYst5g5/dbml+k0z53Etl
 bp01COA1vLIXvkYzR+Xylvmul0XpMGnsW0mUjp6xs+SHw0Fof7EStiZMnIPgOWLuSWMk
 nJoDjZXpAmPcju3lVxLAx1eLz9lvhP46iRj9CGPBAHE2E1SB0mYihPh4AL23Yls7kIYe
 dpx8P24wFHu/4HJ0CSZ5W3mrhm17CTDOuk20erQiJicVHHZvOubYytH9Ai5GUtbTN/A8
 P9/Q==
X-Gm-Message-State: AOAM532TIvbzBvt3UQGPQgbrARVTrLQJ+Pv7SS+JWHygwEec1V2SzJ3r
 ODLgR6D+q3m8K/jL59zQGIgdJw==
X-Google-Smtp-Source: ABdhPJzXTq5mCD/BmO881fQL8B/KUZghMESgXLWFzvUwRUcv/gV5jWxojfYdgJMv4EptH+Ka32HQ/A==
X-Received: by 2002:a17:90a:f683:: with SMTP id
 cl3mr2488782pjb.84.1602735309109; 
 Wed, 14 Oct 2020 21:15:09 -0700 (PDT)
Received: from localhost.localdomain (111-241-103-134.dynamic-ip.hinet.net.
 [111.241.103.134])
 by smtp.gmail.com with ESMTPSA id gd14sm1250191pjb.31.2020.10.14.21.15.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2020 21:15:08 -0700 (PDT)
From: Green Wan <green.wan@sifive.com>
To: 
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, bmeng.cn@gmail.com,
 alistair23@gmail.com, green.wan@sifive.com
Subject: [RFC PATCH v7 1/2] hw/misc/sifive_u_otp: Add write function and
 write-once protection
Date: Thu, 15 Oct 2020 12:14:23 +0800
Message-Id: <20201015041424.23090-2-green.wan@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201015041424.23090-1-green.wan@sifive.com>
References: <20201015041424.23090-1-green.wan@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::642;
 envelope-from=green.wan@sifive.com; helo=mail-pl1-x642.google.com
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
X-List-Received-Date: Thu, 15 Oct 2020 04:15:12 -0000

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
index c2f3c8e129..565eec082f 100644
--- a/hw/misc/sifive_u_otp.c
+++ b/hw/misc/sifive_u_otp.c
@@ -25,6 +25,14 @@
 #include "qemu/module.h"
 #include "hw/misc/sifive_u_otp.h"
 
+#define WRITTEN_BIT_ON 0x1
+
+#define SET_FUSEARRAY_BIT(map, i, off, bit)    \
+    map[i] = bit ? (map[i] | bit << off) : (map[i] & ~(0x1 << off))
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


