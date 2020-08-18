Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k856y-0006dV-BS
	for mharc-qemu-riscv@gnu.org; Tue, 18 Aug 2020 13:09:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <green.wan@sifive.com>)
 id 1k856w-0006bN-94
 for qemu-riscv@nongnu.org; Tue, 18 Aug 2020 13:09:22 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:41729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <green.wan@sifive.com>)
 id 1k856u-00031G-MP
 for qemu-riscv@nongnu.org; Tue, 18 Aug 2020 13:09:21 -0400
Received: by mail-pl1-x641.google.com with SMTP id f10so9500208plj.8
 for <qemu-riscv@nongnu.org>; Tue, 18 Aug 2020 10:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=7Qs2rtxT3/R6MXxuyS8SeDFTvt7qJW/PWlDHxREUlis=;
 b=IJ6wvDCaYyYTd8iJBQmGXJen7uE0lCKJb82qNKLRSnR0uLgVUPAlKLOPm4qNkMysb+
 W8y2RWutT5Rjat0lFAJhQxbbeSfrkiNO1lfa6HaOuQoiH9f1gQNFVADIi8eRBHJIUcQN
 KWmPWP4fURUqXVFAX/73z1pJSMxNmkTTYWlVS/ySo5jfzENtiNPCwpg8wFWQQMvSgbsT
 x8neLqoS/XVHDEyF97ugKOCoMQpomrmqar+ufbKF4DzFPkzS7BmE9k/Cszo/GJ8QP9YX
 Dwo1haTDiOsW+WzPZsd8twYQrbusqsq2U6md4HLw3U7x0eob10AD3G3ABUAIQeYZ8Zbq
 6ZMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=7Qs2rtxT3/R6MXxuyS8SeDFTvt7qJW/PWlDHxREUlis=;
 b=DWAshg5IyMXe9f4xBRmM+yyEstKLf+vyiFWbbkflUUebiuWKHdBUHKClOxUkbdIQfU
 +jZmYPk2hKef2D3cHKU8X+206xfaGIYSzs8WTFqWKuQIs730z+zvPhKhQsuFS5y31l5+
 YZtFH9S4Cre9Tge8jW7h5rsXJ+IXuFTZdoKuv5F2E13UH6v2VIZnAVQsMmgMGzWPoUxg
 cKMTapX+OrBRjq9FqMyO8RNoQLaWychRBDEOzswCzhQlh7hLZ6qH/bvJJ9LouNLep0jC
 P8LmdDAbmcggTwt8w5SsMdP7CFbrNe2JH7T2cFizxw+Vve4N8LDeDd6rPMU1NvShTx+6
 Mz/Q==
X-Gm-Message-State: AOAM532Kd4pLUf0xmmvd9aydPop0opb9UaP7iBS0CmhRO43BJCMzFIDy
 mgmEbuf+dqXoPleohopbY1NcY1cMk24/d4va
X-Google-Smtp-Source: ABdhPJyvpzGZC4y9LR5A5GfY9hssJdpYIbJZFCgV36uJgWaH6t/csFklP88LK/eBzG+D/GZriJmC4Q==
X-Received: by 2002:a17:902:b594:: with SMTP id
 a20mr15887590pls.339.1597770557934; 
 Tue, 18 Aug 2020 10:09:17 -0700 (PDT)
Received: from localhost.localdomain (114-47-163-2.dynamic-ip.hinet.net.
 [114.47.163.2])
 by smtp.gmail.com with ESMTPSA id m3sm460043pjs.22.2020.08.18.10.09.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Aug 2020 10:09:17 -0700 (PDT)
From: Green Wan <green.wan@sifive.com>
To: 
Cc: bmeng.cn@gmail.com, Green Wan <green.wan@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Subject: [RFC PATCH v3 2/2] hw/riscv: sifive_u: Add write-once protection.
Date: Wed, 19 Aug 2020 01:08:39 +0800
Message-Id: <20200818170839.20258-3-green.wan@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200818170839.20258-1-green.wan@sifive.com>
References: <20200818170839.20258-1-green.wan@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=green.wan@sifive.com; helo=mail-pl1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 18 Aug 2020 17:09:22 -0000

Add array to store the 'written' status for all bit of OTP to block
the write operation to the same bit. Ignore the control register
offset from 0x0 to 0x38 of OTP memory mapping.

Signed-off-by: Green Wan <green.wan@sifive.com>
---
 hw/riscv/sifive_u_otp.c         | 21 +++++++++++++++++++++
 include/hw/riscv/sifive_u_otp.h |  1 +
 2 files changed, 22 insertions(+)

diff --git a/hw/riscv/sifive_u_otp.c b/hw/riscv/sifive_u_otp.c
index 4552b2409e..3a25652735 100644
--- a/hw/riscv/sifive_u_otp.c
+++ b/hw/riscv/sifive_u_otp.c
@@ -27,6 +27,12 @@
 #include "sysemu/blockdev.h"
 #include "sysemu/block-backend.h"
 
+#define SET_WRITTEN_BIT(map, idx, bit)    \
+    (map[idx] |= (0x1 << bit))
+
+#define GET_WRITTEN_BIT(map, idx, bit)    \
+    ((map[idx] >> bit) & 0x1)
+
 static uint64_t sifive_u_otp_read(void *opaque, hwaddr addr, unsigned int size)
 {
     SiFiveUOTPState *s = opaque;
@@ -135,6 +141,18 @@ static void sifive_u_otp_write(void *opaque, hwaddr addr,
         s->ptrim = val32;
         break;
     case SIFIVE_U_OTP_PWE:
+        /* Keep written state for data only and PWE is enabled. Ignore PAS=1 */
+        if ((s->pa > SIFIVE_U_OTP_PWE) && (val32 & 0x1) && !s->pas) {
+            if (GET_WRITTEN_BIT(s->fuse_wo, s->pa, s->paio)) {
+                qemu_log_mask(LOG_GUEST_ERROR,
+                              "Error: write idx<%u>, bit<%u>\n",
+                              s->pa, s->paio);
+                break;
+            } else {
+                SET_WRITTEN_BIT(s->fuse_wo, s->pa, s->paio);
+            }
+        }
+
         /* write to backend */
         if (s->blk) {
             blk_pwrite(s->blk, s->pa * SIFIVE_U_OTP_FUSE_WORD, &val32,
@@ -215,6 +233,9 @@ static void sifive_u_otp_reset(DeviceState *dev)
     /* Make a valid content of serial number */
     s->fuse[SIFIVE_U_OTP_SERIAL_ADDR] = s->serial;
     s->fuse[SIFIVE_U_OTP_SERIAL_ADDR + 1] = ~(s->serial);
+
+    /* Initialize write-once map */
+    memset(s->fuse_wo, 0x00, sizeof(s->fuse_wo));
 }
 
 static void sifive_u_otp_class_init(ObjectClass *klass, void *data)
diff --git a/include/hw/riscv/sifive_u_otp.h b/include/hw/riscv/sifive_u_otp.h
index dea1df6f6c..ab6e46b013 100644
--- a/include/hw/riscv/sifive_u_otp.h
+++ b/include/hw/riscv/sifive_u_otp.h
@@ -74,6 +74,7 @@ typedef struct SiFiveUOTPState {
     uint32_t ptrim;
     uint32_t pwe;
     uint32_t fuse[SIFIVE_U_OTP_NUM_FUSES];
+    uint32_t fuse_wo[SIFIVE_U_OTP_NUM_FUSES];
     /* config */
     uint32_t serial;
     BlockBackend   *blk;
-- 
2.17.1


