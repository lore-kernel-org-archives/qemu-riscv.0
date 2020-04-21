Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jQyQl-0007yK-6w
	for mharc-qemu-riscv@gnu.org; Tue, 21 Apr 2020 15:19:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52126)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1jQyQi-0007uX-Ow
 for qemu-riscv@nongnu.org; Tue, 21 Apr 2020 15:19:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1jQyQi-0007m1-40
 for qemu-riscv@nongnu.org; Tue, 21 Apr 2020 15:19:36 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:39142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmerdabbelt@google.com>)
 id 1jQyQh-0007l5-N1
 for qemu-riscv@nongnu.org; Tue, 21 Apr 2020 15:19:35 -0400
Received: by mail-pl1-x641.google.com with SMTP id k18so5625853pll.6
 for <qemu-riscv@nongnu.org>; Tue, 21 Apr 2020 12:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=EcmH1ZDIDp6eDqzmMHbf5Yg0cI5B14bq79JtZLqE3lQ=;
 b=q3ZiveiAixw9dmey8lwV9qcBIL7ne1uemCQyuR5XpdsQrYs/jWBpUXIxomav4oDDsY
 qyUkH2Lh6bv3UEZgQUl9CViX7oGlCNAHidZ3Ta6wlJhIM5Nmdsk6VaSOZ3Fomj//MJDy
 Ypcv/LO7pLnvzGN60hopE6tbuHMELuOmupddrOq92rLULQPKbXSXaUMBmpga5HGMs4Lx
 Jzj6SNDWWArDxMboMWOaxenAvUCGcdY0DWk5OJztUvB/mBjvrP9TqAyWCM9EHwvs4u0u
 4tcciEbMW9xY0HH6DkL3pP0qqv3nnc8MoiOaJ5d57pnrL+GSLQhUsXqobTq2UQ30Qpov
 PSGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=EcmH1ZDIDp6eDqzmMHbf5Yg0cI5B14bq79JtZLqE3lQ=;
 b=rELreb+SIJbmLqy0U6QaenyCU0JGlp7kQ8RHyxxBrH8wJ2QFKcPRqghvXtJdjozCm1
 WhpowxV8uB083q2PXLlLLFO9zHrkrDgM9m6FFqo+mCTSyHClmcL3KAEKApN5ReUTfXtQ
 pb/H7WVgr+d0EzHmGp8K1v95fCw4m7o6qOXSTKfD3EtE70fc0v+JbEF5/urn/mHtasof
 COdbSxcaSzmVFGbhvjxtszfXPQ4CsH/lqISTmt2L7Ar6OCHgUhEGYpkuEV+fOOBBgARt
 tKwM/+VJk/L/ZJhiTFWa4SjIqKrAsRseJw+U8Q5ozXN/RLWdRsZpqXZhF6SQx4PHJ1+t
 YDkA==
X-Gm-Message-State: AGi0PuZeWH+bvt3ALEOZdjNcLxcHEeRkwyQ/Dy2oOEMZZdahcCzUwiBm
 pSd4LOuPLbPXAstAfGORE23J4hGKkvM=
X-Google-Smtp-Source: APiQypIjMfCJjDmK6jRK7vqtKxnCr1t1Qav0KLp0ZnxiKRIk7e5BKa21RAKU7Bk/gtvjj0dHvu7/Hw==
X-Received: by 2002:a17:902:740a:: with SMTP id
 g10mr22966992pll.137.1587496772863; 
 Tue, 21 Apr 2020 12:19:32 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id 3sm3237745pfo.27.2020.04.21.12.19.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 12:19:32 -0700 (PDT)
Subject: [PULL 5/6] riscv/sifive_u: Add a serial property to the sifive_u SoC
Date: Tue, 21 Apr 2020 12:10:00 -0700
Message-Id: <20200421191001.92644-6-palmerdabbelt@google.com>
X-Mailer: git-send-email 2.26.1.301.g55bc3eb7cb9-goog
In-Reply-To: <20200421191001.92644-1-palmerdabbelt@google.com>
References: <20200421191001.92644-1-palmerdabbelt@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=palmerdabbelt@google.com; helo=mail-pl1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::641
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
X-List-Received-Date: Tue, 21 Apr 2020 19:19:37 -0000

From: Alistair Francis <alistair.francis@wdc.com>

At present the board serial number is hard-coded to 1, and passed
to OTP model during initialization. Firmware (FSBL, U-Boot) uses
the serial number to generate a unique MAC address for the on-chip
ethernet controller. When multiple QEMU 'sifive_u' instances are
created and connected to the same subnet, they all have the same
MAC address hence it creates a unusable network.

A new "serial" property is introduced to the sifive_u SoC to specify
the board serial number. When not given, the default serial number
1 is used.

Suggested-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 hw/riscv/sifive_u.c         | 8 +++++++-
 include/hw/riscv/sifive_u.h | 2 ++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index d0ea6803db..9bfd16d2bb 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -492,7 +492,6 @@ static void riscv_sifive_u_soc_init(Object *obj)
                           TYPE_SIFIVE_U_PRCI);
     sysbus_init_child_obj(obj, "otp", &s->otp, sizeof(s->otp),
                           TYPE_SIFIVE_U_OTP);
-    qdev_prop_set_uint32(DEVICE(&s->otp), "serial", OTP_SERIAL);
     sysbus_init_child_obj(obj, "gem", &s->gem, sizeof(s->gem),
                           TYPE_CADENCE_GEM);
 }
@@ -585,6 +584,7 @@ static void riscv_sifive_u_soc_realize(DeviceState *dev, Error **errp)
     object_property_set_bool(OBJECT(&s->prci), true, "realized", &err);
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->prci), 0, memmap[SIFIVE_U_PRCI].base);
 
+    qdev_prop_set_uint32(DEVICE(&s->otp), "serial", s->serial);
     object_property_set_bool(OBJECT(&s->otp), true, "realized", &err);
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->otp), 0, memmap[SIFIVE_U_OTP].base);
 
@@ -611,10 +611,16 @@ static void riscv_sifive_u_soc_realize(DeviceState *dev, Error **errp)
         memmap[SIFIVE_U_GEM_MGMT].base, memmap[SIFIVE_U_GEM_MGMT].size);
 }
 
+static Property riscv_sifive_u_soc_props[] = {
+    DEFINE_PROP_UINT32("serial", SiFiveUSoCState, serial, OTP_SERIAL),
+    DEFINE_PROP_END_OF_LIST()
+};
+
 static void riscv_sifive_u_soc_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
 
+    device_class_set_props(dc, riscv_sifive_u_soc_props);
     dc->realize = riscv_sifive_u_soc_realize;
     /* Reason: Uses serial_hds in realize function, thus can't be used twice */
     dc->user_creatable = false;
diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
index 82667b5746..a2baa1de5f 100644
--- a/include/hw/riscv/sifive_u.h
+++ b/include/hw/riscv/sifive_u.h
@@ -42,6 +42,8 @@ typedef struct SiFiveUSoCState {
     SiFiveUPRCIState prci;
     SiFiveUOTPState otp;
     CadenceGEMState gem;
+
+    uint32_t serial;
 } SiFiveUSoCState;
 
 #define TYPE_RISCV_U_MACHINE MACHINE_TYPE_NAME("sifive_u")
-- 
2.26.1.301.g55bc3eb7cb9-goog


