Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kBCcm-0000cP-8j
	for mharc-qemu-riscv@gnu.org; Thu, 27 Aug 2020 03:47:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <green.wan@sifive.com>)
 id 1kBCck-0000Wf-6E
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2020 03:47:06 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:43629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <green.wan@sifive.com>)
 id 1kBCch-0008IY-9q
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2020 03:47:05 -0400
Received: by mail-pf1-x441.google.com with SMTP id y206so2843251pfb.10
 for <qemu-riscv@nongnu.org>; Thu, 27 Aug 2020 00:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=c2pBcp/mbPtnLHyvPGQngbikpywJkc4V5//cOK1jHUU=;
 b=B41J3jCjLolFLLB8OysyMPhtaZUxNKijGltGIm1kNGbQbrBgcuLeSHhKIDZXmyElQ/
 ggVn1+ca2POnsK3rnlsrrnspF0CKVvM0DF9T48hSe6LJ+S0JjQKzY+L3NnbYa9VYj6B7
 VXZrRvo+BxzuoEB4DE+3aK0HmFyrF2ECOKzO9M4R1A1HAixOtsSg2GVAQkXSH+MNx49x
 XQTGkH2a5IGI8zMr/3vobseKhNczB3rKIm5eCYWL/W6F+gDQTePfpyzYXMLcJ7MV7pU3
 HmBDNEgyeikFsG/doLDBj8OAjUsQxinqzwzf1lsZjgw6tBviFuBo3CBxa+ZoOBQrLKBn
 /8nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=c2pBcp/mbPtnLHyvPGQngbikpywJkc4V5//cOK1jHUU=;
 b=dn+359rj/ZxNMWIrjlJZhn2KVLXmhwP+SI+gOU8esKnN2jz0zyvTpMzz046DPsn/wt
 UrkYhhmUBuMMbOGiyrsWRh/gL6gmz7DsNeEBUHAuMYnpgeZu+z4G4xDqH7zae5OUh5o7
 t2loDksYB5XAhdOzSP9WhCIx8syngOPjvKH4I2cPE0wHrIeOJ3pzLS0VXs+iadNEH0tk
 Fl+qU8hqM1fTZrcbrTWVLxhcq0eri0PUl7eO/kc9IJD7MaEasRHqRXswRXTh1JxkQJRQ
 tu7/g/ELQqj+OPDiKhzBxkbsWN61Bx+EoyvU3rNE0vYIxB+1M4tEngaZrG32DLAZb0Y0
 03qw==
X-Gm-Message-State: AOAM532aw+qzww8AUDkTv05Nuj+PKd0AURkac04gzSVvksB25TH6Cn6c
 OFjszFoibskekn8AgU5HrespbQ==
X-Google-Smtp-Source: ABdhPJxuUOqhfyXURZWLXW9IXqc+OgpTUFD6kalyDP5WnrGHnjQcs4yBxRa5WhDTifwR2hiwjIwLNA==
X-Received: by 2002:a17:902:a412:: with SMTP id
 p18mr15192445plq.3.1598514421952; 
 Thu, 27 Aug 2020 00:47:01 -0700 (PDT)
Received: from localhost.localdomain (111-241-121-209.dynamic-ip.hinet.net.
 [111.241.121.209])
 by smtp.gmail.com with ESMTPSA id k17sm431032pfg.99.2020.08.27.00.47.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2020 00:47:01 -0700 (PDT)
From: Green Wan <green.wan@sifive.com>
To: 
Cc: bmeng.cn@gmail.com, Green Wan <green.wan@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Subject: [RFC PATCH v4 2/2] hw/riscv: sifive_u: Add write-once protection
Date: Thu, 27 Aug 2020 15:46:38 +0800
Message-Id: <20200827074638.21451-3-green.wan@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200827074638.21451-1-green.wan@sifive.com>
References: <20200827074638.21451-1-green.wan@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=green.wan@sifive.com; helo=mail-pf1-x441.google.com
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
X-List-Received-Date: Thu, 27 Aug 2020 07:47:06 -0000

Add array to store the 'written' status for all bit of OTP to block
the write operation to the same bit. Ignore the control register
offset from 0x0 to 0x38 of OTP memory mapping.

Signed-off-by: Green Wan <green.wan@sifive.com>
---
 hw/riscv/sifive_u_otp.c         | 21 +++++++++++++++++++++
 include/hw/riscv/sifive_u_otp.h |  1 +
 2 files changed, 22 insertions(+)

diff --git a/hw/riscv/sifive_u_otp.c b/hw/riscv/sifive_u_otp.c
index aab2220494..e9605b9ae9 100644
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
+            }
+
+            SET_WRITTEN_BIT(s->fuse_wo, s->pa, s->paio);
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
index 13d2552e43..49d40a6430 100644
--- a/include/hw/riscv/sifive_u_otp.h
+++ b/include/hw/riscv/sifive_u_otp.h
@@ -74,6 +74,7 @@ typedef struct SiFiveUOTPState {
     uint32_t ptrim;
     uint32_t pwe;
     uint32_t fuse[SIFIVE_U_OTP_NUM_FUSES];
+    uint32_t fuse_wo[SIFIVE_U_OTP_NUM_FUSES];
     /* config */
     uint32_t serial;
     BlockBackend *blk;
-- 
2.17.1


