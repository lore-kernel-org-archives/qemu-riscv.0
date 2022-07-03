Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o8FCh-0003dv-Qq
	for mharc-qemu-riscv@gnu.org; Mon, 04 Jul 2022 02:05:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>)
 id 1o879F-0003bK-Kg; Sun, 03 Jul 2022 17:28:57 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:53208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>)
 id 1o879D-0006Ma-17; Sun, 03 Jul 2022 17:28:56 -0400
Received: by mail-pj1-x102a.google.com with SMTP id fz10so1424348pjb.2;
 Sun, 03 Jul 2022 14:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YlIyXL2dJYUsBzYu+/v+5PBfakGFPnGlml4Uo85UalI=;
 b=EUo/6ZSekJY6gqforpqcPPpmcVlwcXfDL+Qe3SvVIwVfTga21UPWG1l4msRkpqNEVZ
 N33D3eY5fNPjHUywNV3Je6HW9MF6OlzDTmm5G+sokoymuhmMBDjO3D27HJqeICI8nS/F
 arxFHrd/fsixzVbG/1fnp0OSEkSNsAQaQBetXeErT1PpRYfV3YRqbqjkATybSXNw4Lz3
 6MwpuKzCKQcjxGuQ5LXP1PM7myk1Z10fkPO6QwPG6KY+BPGfN3DFfmKRkVoPDHZuKd5e
 pCDU430Q4ZBYZVM4C5Pku9l6/VNCPmQ+uJ22lP8ueLMKSuzBzv2y57+c7manm8kU0O9y
 kf1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YlIyXL2dJYUsBzYu+/v+5PBfakGFPnGlml4Uo85UalI=;
 b=R8ezinHWAYeHNphTvOAn5FTOJwrEDbnktX3Dg/fjFl8I73v6Y3MoubiBmMO6j71BFg
 zC5sANar0zWmpdfVVqB21Mfvcy/tVt+JFOQZnHHyShLbJW/PczC10WynjrkoUGtDGv+C
 dGQ5XA+FnTWMBBT57+gXfha45br4HmT3oA7vW30BxJQ1YfBH29Um/Nx+V6PF758QG1Bx
 GuZy5WllAbmI9wwvfvjH99VrUy4EtJQ32Ab+Xm1FoTxCQ3HYCN9qzHQ29Ctx9ChzXO0o
 RUxgTAqagvxbclYrjD/y9CElsF+jV9xp0Yb4nVtHMwHcoQB/yM+FK8gZ+iivpl3+p+Ly
 UQ3g==
X-Gm-Message-State: AJIora93QM85YW9IHWbCbJKWSdLzB8tuhdKTB1rTRnzZu/lKNMIh8iJZ
 rBEM2Ge33qmbjOEMF9R4oA2Zk4O4afI=
X-Google-Smtp-Source: AGRyM1sD/yq/6+pPX/yRwDKQAxJK/ypniQTxi+KZuMeJ5WVTJOAe0y5noJPJb5Su0ye+XMhR9AnTpQ==
X-Received: by 2002:a17:90b:3b4e:b0:1ed:2236:34f3 with SMTP id
 ot14-20020a17090b3b4e00b001ed223634f3mr32074262pjb.6.1656883733147; 
 Sun, 03 Jul 2022 14:28:53 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 me3-20020a17090b17c300b001ec84b0f199sm14266337pjb.1.2022.07.03.14.28.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 14:28:52 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: QEMU Development <qemu-devel@nongnu.org>
Cc: Openrisc <openrisc@lists.librecores.org>,
 Stafford Horne <shorne@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Anup Patel <anup.patel@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 qemu-riscv@nongnu.org (open list:Goldfish RTC)
Subject: [PATCH v2 03/11] goldfish_rtc: Add endianness property
Date: Mon,  4 Jul 2022 06:28:15 +0900
Message-Id: <20220703212823.10067-4-shorne@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220703212823.10067-1-shorne@gmail.com>
References: <20220703212823.10067-1-shorne@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=shorne@gmail.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 04 Jul 2022 02:05:02 -0400
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
X-List-Received-Date: Sun, 03 Jul 2022 21:28:58 -0000

Add an endianness property to allow configuring the RTC as either
native, little or big endian.

Cc: Laurent Vivier <lvivier@redhat.com>
Signed-off-by: Stafford Horne <shorne@gmail.com>
---
 hw/rtc/goldfish_rtc.c         | 46 ++++++++++++++++++++++++++++-------
 include/hw/rtc/goldfish_rtc.h |  2 ++
 2 files changed, 39 insertions(+), 9 deletions(-)

diff --git a/hw/rtc/goldfish_rtc.c b/hw/rtc/goldfish_rtc.c
index 35e493be31..24f6587086 100644
--- a/hw/rtc/goldfish_rtc.c
+++ b/hw/rtc/goldfish_rtc.c
@@ -216,14 +216,34 @@ static int goldfish_rtc_post_load(void *opaque, int version_id)
     return 0;
 }
 
-static const MemoryRegionOps goldfish_rtc_ops = {
-    .read = goldfish_rtc_read,
-    .write = goldfish_rtc_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
-    .valid = {
-        .min_access_size = 4,
-        .max_access_size = 4
-    }
+static const MemoryRegionOps goldfish_rtc_ops[3] = {
+    [DEVICE_NATIVE_ENDIAN] = {
+        .read = goldfish_rtc_read,
+        .write = goldfish_rtc_write,
+        .endianness = DEVICE_NATIVE_ENDIAN,
+        .valid = {
+            .min_access_size = 4,
+            .max_access_size = 4
+        }
+    },
+    [DEVICE_LITTLE_ENDIAN] = {
+        .read = goldfish_rtc_read,
+        .write = goldfish_rtc_write,
+        .endianness = DEVICE_LITTLE_ENDIAN,
+        .valid = {
+            .min_access_size = 4,
+            .max_access_size = 4
+        }
+    },
+    [DEVICE_BIG_ENDIAN] = {
+        .read = goldfish_rtc_read,
+        .write = goldfish_rtc_write,
+        .endianness = DEVICE_BIG_ENDIAN,
+        .valid = {
+            .min_access_size = 4,
+            .max_access_size = 4
+        }
+    },
 };
 
 static const VMStateDescription goldfish_rtc_vmstate = {
@@ -265,7 +285,8 @@ static void goldfish_rtc_realize(DeviceState *d, Error **errp)
     SysBusDevice *dev = SYS_BUS_DEVICE(d);
     GoldfishRTCState *s = GOLDFISH_RTC(d);
 
-    memory_region_init_io(&s->iomem, OBJECT(s), &goldfish_rtc_ops, s,
+    memory_region_init_io(&s->iomem, OBJECT(s),
+                          &goldfish_rtc_ops[s->endianness], s,
                           "goldfish_rtc", 0x24);
     sysbus_init_mmio(dev, &s->iomem);
 
@@ -274,10 +295,17 @@ static void goldfish_rtc_realize(DeviceState *d, Error **errp)
     s->timer = timer_new_ns(rtc_clock, goldfish_rtc_interrupt, s);
 }
 
+static Property goldfish_rtc_properties[] = {
+    DEFINE_PROP_UINT8("endianness", GoldfishRTCState, endianness,
+                      DEVICE_NATIVE_ENDIAN),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void goldfish_rtc_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
+    device_class_set_props(dc, goldfish_rtc_properties);
     dc->realize = goldfish_rtc_realize;
     dc->reset = goldfish_rtc_reset;
     dc->vmsd = &goldfish_rtc_vmstate;
diff --git a/include/hw/rtc/goldfish_rtc.h b/include/hw/rtc/goldfish_rtc.h
index 79ca7daf5d..8e1aeb85e3 100644
--- a/include/hw/rtc/goldfish_rtc.h
+++ b/include/hw/rtc/goldfish_rtc.h
@@ -42,6 +42,8 @@ struct GoldfishRTCState {
     uint32_t irq_pending;
     uint32_t irq_enabled;
     uint32_t time_high;
+
+    uint8_t endianness;
 };
 
 #endif
-- 
2.36.1


