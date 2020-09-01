Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kD8Vc-0002E9-HL
	for mharc-qemu-riscv@gnu.org; Tue, 01 Sep 2020 11:47:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <green.wan@sifive.com>)
 id 1kD8Va-00029o-Ph
 for qemu-riscv@nongnu.org; Tue, 01 Sep 2020 11:47:42 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:44812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <green.wan@sifive.com>)
 id 1kD8VY-00026S-Vp
 for qemu-riscv@nongnu.org; Tue, 01 Sep 2020 11:47:42 -0400
Received: by mail-pl1-x644.google.com with SMTP id q3so718754pls.11
 for <qemu-riscv@nongnu.org>; Tue, 01 Sep 2020 08:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=0/OBga6Pud+l6WfxON34v/AXQ0F318WR/QNf6Dv2RV0=;
 b=ks019DCLRzqaulhwBcSJ9GCTtLQ4eU9e+7whdEyDyeGwMMzphHoZGmyoI1sKxVc9va
 Rb+Mqwe2S1hRgBLvXHBJwAps1i+Cb/DsHMFAsA1WrJvkxNKfGasN5JCIwhxuFYA+DQKk
 8NsU5vjr/oaW+GzT4cEbFDUFD5XFKjuufQ5ygyWiPnU2YbzTXDgFd6uIcP7AN/9Uy8tG
 1lvPvY4r0Q15UUxjogWsmXTBJSRFuDdrEAmfTqVr9RlhU47Se43Iu6rcHFUrso/JARVj
 r1hGnGLUO2VpTOy7To72XxS+/YV4QSwNwTzyorwgwqeX357KZA86AmyZolgBEm6RyZXa
 AiMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=0/OBga6Pud+l6WfxON34v/AXQ0F318WR/QNf6Dv2RV0=;
 b=q1WwCLviSRq/z7eiLTM6hQZxyupru5dpDdLc4Q4P54BFK257IAvQjQzYOMwbDYVmaU
 begqaFdtvuIkn9QYNaYFunyR+LPdtkjTyy4mgFKT8Kx0D7bhkYNwqiTkNFTSAXBREcfm
 iApjBS86gQlhXspGixUjchqTBNLBWQSTn5gVqa5vzMNhnIK5ojwYWBzjBrnQBXIotbfj
 /F+Be2f4P6z78oRbXsWSk30cUR3F5V8QIDJQhkNdu+ESOI+7qvXEAVdSIw5rbHN3XPFU
 oMvTIgA1sVhGwY5GkP+Er+/gwIZwXvSDoG+SBgzVE5GquUjGoAFFxGs3Sg0EVE2i0+7f
 AmGQ==
X-Gm-Message-State: AOAM532z/GIzk9Fqs5hwdkzK+fpa4Mrpj8cUjZiqEJ6/sCY/owHiU9c2
 6b9eEtidDfQiq1keDu4ePSF+XQ==
X-Google-Smtp-Source: ABdhPJxvyq1BEE9pLCJUhcLnbrHVLg4cZTaAXYJCjO+xxS5aJ0qqfhc89fGfUOOxnDvl0/kun1E0bQ==
X-Received: by 2002:a17:90a:fb52:: with SMTP id
 iq18mr2140544pjb.207.1598975259698; 
 Tue, 01 Sep 2020 08:47:39 -0700 (PDT)
Received: from localhost.localdomain (111-241-104-82.dynamic-ip.hinet.net.
 [111.241.104.82])
 by smtp.gmail.com with ESMTPSA id e17sm2485344pfm.60.2020.09.01.08.47.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 08:47:39 -0700 (PDT)
From: Green Wan <green.wan@sifive.com>
To: 
Cc: bmeng.cn@gmail.com, Green Wan <green.wan@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Subject: [RFC PATCH v5 1/2] hw/riscv: sifive_u: Add write operation and
 write-once protection
Date: Tue,  1 Sep 2020 23:47:10 +0800
Message-Id: <20200901154711.18457-2-green.wan@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200901154711.18457-1-green.wan@sifive.com>
References: <20200901154711.18457-1-green.wan@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=green.wan@sifive.com; helo=mail-pl1-x644.google.com
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
X-List-Received-Date: Tue, 01 Sep 2020 15:47:43 -0000

 - Add write operation to update fuse data bit when PWE bit is on.
 - Add array, fuse_wo, to store the 'written' status for all bits
   of OTP to block the write operation.

Signed-off-by: Green Wan <green.wan@sifive.com>
---
 hw/riscv/sifive_u_otp.c         | 30 +++++++++++++++++++++++++++++-
 include/hw/riscv/sifive_u_otp.h |  3 +++
 2 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/sifive_u_otp.c b/hw/riscv/sifive_u_otp.c
index f6ecbaa2ca..b8369e9035 100644
--- a/hw/riscv/sifive_u_otp.c
+++ b/hw/riscv/sifive_u_otp.c
@@ -25,6 +25,14 @@
 #include "qemu/module.h"
 #include "hw/riscv/sifive_u_otp.h"
 
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
diff --git a/include/hw/riscv/sifive_u_otp.h b/include/hw/riscv/sifive_u_otp.h
index 639297564a..4a5a0acf48 100644
--- a/include/hw/riscv/sifive_u_otp.h
+++ b/include/hw/riscv/sifive_u_otp.h
@@ -35,6 +35,8 @@
 #define SIFIVE_U_OTP_PTRIM      0x34
 #define SIFIVE_U_OTP_PWE        0x38
 
+#define SIFIVE_U_OTP_PWE_EN     (1 << 0)
+
 #define SIFIVE_U_OTP_PCE_EN     (1 << 0)
 
 #define SIFIVE_U_OTP_PDSTB_EN   (1 << 0)
@@ -73,6 +75,7 @@ typedef struct SiFiveUOTPState {
     uint32_t ptrim;
     uint32_t pwe;
     uint32_t fuse[SIFIVE_U_OTP_NUM_FUSES];
+    uint32_t fuse_wo[SIFIVE_U_OTP_NUM_FUSES];
     /* config */
     uint32_t serial;
 } SiFiveUOTPState;
-- 
2.17.1


