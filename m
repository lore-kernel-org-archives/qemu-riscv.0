Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k1L5Y-0001Vs-Gt
	for mharc-qemu-riscv@gnu.org; Thu, 30 Jul 2020 22:48:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <green.wan@sifive.com>)
 id 1k1L5W-0001RX-KO
 for qemu-riscv@nongnu.org; Thu, 30 Jul 2020 22:48:02 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:39453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <green.wan@sifive.com>)
 id 1k1L5T-0003sA-Vn
 for qemu-riscv@nongnu.org; Thu, 30 Jul 2020 22:48:02 -0400
Received: by mail-pl1-x643.google.com with SMTP id b9so16031634plx.6
 for <qemu-riscv@nongnu.org>; Thu, 30 Jul 2020 19:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=1JnB4YudV1m077cp66xzMnx1Junj30UO75iLbZUf12Y=;
 b=O3VtvxF2kxDrdqYV/12D8cnKeQ1yEDEwKTFLium7I6T2GURjMtrhihwq9xjepTDQwj
 Frgvsp+XMw6EANBKjCR6X5M5unY9Jti39+mRmo+UtKG/Wb0dc5uSapzBnRh5QjQXTT6T
 yKwghLzb6c0m4eaj6EfUuRQaRt3VOSYUcUmChUiY/HkPCEkqX92lGfq9CiXnFKEt++bd
 LdcHHGNmdx35TzpUt13NcGZI3s3FYLRl3S0NCLhnUyM9n06Mq7FN/+lN5ptB5vMNKace
 rY9OGYMYJjy6MhPLwCoGcOk6UUWwSxRHAioOHkBhgby8lx9rEl/XkEmleOvvz4mkn8Hh
 cKbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=1JnB4YudV1m077cp66xzMnx1Junj30UO75iLbZUf12Y=;
 b=OWy72AlQ33BuC+4ZBQ/QGIvmVlZsW11SR1JXDU7v6P3OCCWPRgZpHVmaGMI3ks8fBg
 5oh0hkBltnslxsZsYARNe0pzSro67R6jbGLLIP/M1IqG8iA+UHviupPqkRNbnoqCAppV
 1OIg5sBwq1zAvBbOMW/yw9sv1/lIvHVpnq0HI/FYf2VDQoPBeJbGJ0ytrLBEqrpZ+9a1
 1raotQx4LdSVrQn9Xyz/v5mT4/1sWDKBkYBbl+SXAx54erq/UXe0jABD6r21DXuR/wSh
 58QCUNcAS85Uuo9QRddsAqV19/4vc73o3Ua70jpcxdsbhTXk96YT+UkBlfS0Jy75hrvU
 rJhA==
X-Gm-Message-State: AOAM533fPIpXGVsMa0MGct88wqv2nfGagvE2J+ZbQdzF7PlEME2JVcyw
 pIweV4pcEWbegUb6TORothSiQA==
X-Google-Smtp-Source: ABdhPJzxLVssuc0Cm1KqNN+d3BB94LMk9TxwvkPxAGuUUSdXO6Bnk1ft08yLVGq90bruwIqNuV+uog==
X-Received: by 2002:a17:90a:22a3:: with SMTP id
 s32mr2027720pjc.49.1596163678573; 
 Thu, 30 Jul 2020 19:47:58 -0700 (PDT)
Received: from localhost.localdomain (111-243-189-249.dynamic-ip.hinet.net.
 [111.243.189.249])
 by smtp.gmail.com with ESMTPSA id c27sm7578483pfj.163.2020.07.30.19.47.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jul 2020 19:47:58 -0700 (PDT)
From: Green Wan <green.wan@sifive.com>
To: 
Cc: bmeng.cn@gmail.com, Green Wan <green.wan@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Subject: [RFC PATCH v2 2/2] hw/riscv: sifive_u: Add write-once protection.
Date: Fri, 31 Jul 2020 10:47:08 +0800
Message-Id: <20200731024708.32725-3-green.wan@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200731024708.32725-1-green.wan@sifive.com>
References: <20200731024708.32725-1-green.wan@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=green.wan@sifive.com; helo=mail-pl1-x643.google.com
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
X-List-Received-Date: Fri, 31 Jul 2020 02:48:02 -0000

Add array to store the 'written' status for all bit of OTP to block
the write operation to the same bit. Ignore the control register
offset from 0x0 to 0x38 of OTP memory mapping.

Signed-off-by: Green Wan <green.wan@sifive.com>
---
 hw/riscv/sifive_u_otp.c         | 20 ++++++++++++++++++++
 include/hw/riscv/sifive_u_otp.h |  1 +
 2 files changed, 21 insertions(+)

diff --git a/hw/riscv/sifive_u_otp.c b/hw/riscv/sifive_u_otp.c
index e359f30fdb..a793093d47 100644
--- a/hw/riscv/sifive_u_otp.c
+++ b/hw/riscv/sifive_u_otp.c
@@ -35,6 +35,11 @@
 
 #define TRACE_PREFIX            "FU540_OTP: "
 #define SIFIVE_FU540_OTP_SIZE   (SIFIVE_U_OTP_NUM_FUSES * 4)
+#define SET_WRITTEN_BIT(map, idx, bit)    \
+    (map[idx] |= (0x1 << bit))
+
+#define GET_WRITTEN_BIT(map, idx, bit)    \
+    ((map[idx] >> bit) & 0x1)
 
 static int32_t sifive_u_otp_backed_open(const char *filename, int32_t *fd,
                                         uint32_t **map)
@@ -195,6 +200,18 @@ static void sifive_u_otp_write(void *opaque, hwaddr addr,
         s->ptrim = val32;
         break;
     case SIFIVE_U_OTP_PWE:
+        /* Keep written state for data only and PWE is enabled. Ignore PAS=1 */
+        if ((s->pa > SIFIVE_U_OTP_PWE) && (val32 & 0x1) && !s->pas) {
+            if (GET_WRITTEN_BIT(s->fuse_wo, s->pa, s->paio)) {
+                qemu_log_mask(LOG_GUEST_ERROR,
+                              TRACE_PREFIX "Error: write idx<%u>, bit<%u>\n",
+                              s->pa, s->paio);
+                break;
+            } else {
+                SET_WRITTEN_BIT(s->fuse_wo, s->pa, s->paio);
+            }
+        }
+
         /* open and mmap OTP image file */
         if (0 == sifive_u_otp_backed_open(s->otp_file, &fd, &map)) {
             /* store value */
@@ -248,6 +265,9 @@ static void sifive_u_otp_reset(DeviceState *dev)
     /* Make a valid content of serial number */
     s->fuse[SIFIVE_U_OTP_SERIAL_ADDR] = s->serial;
     s->fuse[SIFIVE_U_OTP_SERIAL_ADDR + 1] = ~(s->serial);
+
+    /* Initialize write-once map */
+    memset(s->fuse_wo, 0x00, sizeof(s->fuse_wo));
 }
 
 static void sifive_u_otp_class_init(ObjectClass *klass, void *data)
diff --git a/include/hw/riscv/sifive_u_otp.h b/include/hw/riscv/sifive_u_otp.h
index f3d71ce82d..4c6ac2e75e 100644
--- a/include/hw/riscv/sifive_u_otp.h
+++ b/include/hw/riscv/sifive_u_otp.h
@@ -73,6 +73,7 @@ typedef struct SiFiveUOTPState {
     uint32_t ptrim;
     uint32_t pwe;
     uint32_t fuse[SIFIVE_U_OTP_NUM_FUSES];
+    uint32_t fuse_wo[SIFIVE_U_OTP_NUM_FUSES];
     /* config */
     uint32_t serial;
     char *otp_file;
-- 
2.17.1


