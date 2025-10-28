Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68F54CCD1BF
	for <qemu-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 18:43:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vDoeI-0005nU-Kv; Tue, 28 Oct 2025 14:42:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDodn-0005IN-Au
 for qemu-riscv@nongnu.org; Tue, 28 Oct 2025 14:41:57 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDodP-0005oF-NA
 for qemu-riscv@nongnu.org; Tue, 28 Oct 2025 14:41:54 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-47112a73785so40704795e9.3
 for <qemu-riscv@nongnu.org>; Tue, 28 Oct 2025 11:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761676885; x=1762281685; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lIoBZbv7mBqCNJwjBiHWOo22r8zKTe2GN0MeWBRTiMU=;
 b=RGWToCDLWr1Q/lPxNTpG7oizwf2ZUPmyRjaVW9rSCLhTOiA2HxHUa9KhdVEm2Gx3W8
 x7qO/4+Ip4/jBGSvWlvqWQJUVinZT+vf5390X1jAD2LG90mnx1KWCe44tN0k2TBYFlAO
 ZLBJgQ2q0i3Y+E0JMVq+6Y2PNQIN0tpOJbnYVhKVn3Kzwts/CV8DthPo7FY10crbGS7a
 tUMuSn4E21PTXt/AlqV/8SzcbBRBtZeRL5PABr07LvVn1AG1mCsSqx2qdfqFX+Mbv+zZ
 /c3kwxI9bAEYpksHDjNkI/0F7LIyYP6VUL8s5J/vUw8uNPRoAxQZga/MhidhbGiO2dM2
 pb8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761676885; x=1762281685;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lIoBZbv7mBqCNJwjBiHWOo22r8zKTe2GN0MeWBRTiMU=;
 b=fcY9kvak1nnZ7GOTFnxnzMVnYXgF4lpRFYEkMcw1UpnplnSAyef8lVhDuRQ38ToLww
 hLkqNdcFdv5cyVBPDPoC1l/0pjPD79tEpLAqkBx/8RWQi2ijLjc9OwwVRLoFJE3zjf1l
 SwddQxLSvRTx59AVnN32Pan+45T7sVvYAHsmAAnocEJB1eXEsexq+ZYIs1D/oG6SY67f
 Lv286qBLDXLvweShdmp4j7X+QB5fHC15tbvei7k3D0TGuWD17pvp2KLO7sUUbFjs3fSJ
 7NDJNl3gItqdqm9SJJtOe0mdN6rRvj3pRqUY7mfjqxeLq8La0I4qy41bZef9uOnVLFNt
 Rqrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwcIRAB1qNJ/hg7FF3wmFulHRKN2tU7BUxHaEtZLf++znRVxq55rtS9VcrI0UjM9IipqeZ7nmYE1wC@nongnu.org
X-Gm-Message-State: AOJu0YzwJeTKmVmELRlIHnrG/iPCzwd1m5hUOYNnlbmFLbcyeyitCfDF
 fG9sdzHbVr52W8R4758qvqVxItfTPRV5+d1xRLLzkeJFhvpFysHhkx3qHHfl9mzWJv8=
X-Gm-Gg: ASbGnct93hkRwHOR2JxUpTfzRJc6Hxw6MhyRO2bmSMz6SJGLKPUUfXI+ST6lIycHGsr
 yHDMkdyIpj8nGifXhQkmCltsJWmepv5T7sglrmg8ng7Ldrsa9+9I4tb84oa3RyhJUW4+O8CL7jn
 vU/K67ZUXWfEPPw+3zzZ+6zhvCeL/blymk7yEiUKlnUiIMPBAjYztukgTWk/v/uwMo5G0xG/nH5
 TGy3wnS9m2lqLPZJnRsHEPtuHUsQ322hU6pdmh9LqYUyns/Br3PmKhlji1p1c8kXiozjdsSn6F5
 pvupaNEm0Ev45jEWW0LjaRG8C5GOoHSJUgN83tLqB5RlVITzopDD+fgn/sfZ9RTM5Og2fHlaHfp
 BNiAtWo+AlsMaEbroWIvekcnD92R/CDseBOkuS9wYhPffF0+rrvVpEk8BwxjXPYpqvZDSvYH5sb
 9MAM3Jw2uJiFNKFKlh7lnoE+nlpnijQu76MZhjbDAcYVf0/IjFFg==
X-Google-Smtp-Source: AGHT+IE9Bg27htI7e9/HI71s8ONLKbXXTD8QFcUk7hl9xI6nX05rgKMPsTlhPJM2WGdvc6SN+XjgAw==
X-Received: by 2002:a05:6000:40e1:b0:429:8b01:c08c with SMTP id
 ffacd0b85a97d-429aef82eb8mr76573f8f.19.1761676884736; 
 Tue, 28 Oct 2025 11:41:24 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952b7b22sm21462186f8f.9.2025.10.28.11.41.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 28 Oct 2025 11:41:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.caveayland@nutanix.com>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v3 25/25] hw/sysbus: Simplify SysBusDevice::mmio
Date: Tue, 28 Oct 2025 19:12:59 +0100
Message-ID: <20251028181300.41475-26-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028181300.41475-1-philmd@linaro.org>
References: <20251028181300.41475-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Directly access the MemoryRegion array, removing
the need for the embedded structure.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/sysbus.h | 4 +---
 hw/core/sysbus.c    | 8 ++++----
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/include/hw/sysbus.h b/include/hw/sysbus.h
index b2a2ea507ea..2cee5bcd44f 100644
--- a/include/hw/sysbus.h
+++ b/include/hw/sysbus.h
@@ -59,9 +59,7 @@ struct SysBusDevice {
     /*< public >*/
 
     int num_mmio;
-    struct {
-        MemoryRegion *memory;
-    } mmio[QDEV_MAX_MMIO];
+    MemoryRegion *mmio[QDEV_MAX_MMIO];
     int num_pio;
     uint32_t pio[QDEV_MAX_PIO];
 };
diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
index b3060e02484..188a6ab055e 100644
--- a/hw/core/sysbus.c
+++ b/hw/core/sysbus.c
@@ -125,7 +125,7 @@ static void sysbus_mmio_map_common(SysBusDevice *dev, int n, hwaddr addr,
     MemoryRegion *mr;
 
     assert(n >= 0 && n < dev->num_mmio);
-    mr = dev->mmio[n].memory;
+    mr = dev->mmio[n];
 
     if (memory_region_is_mapped(mr)) {
         /* Unregister previous mapping.  */
@@ -143,7 +143,7 @@ void sysbus_mmio_map(SysBusDevice *dev, int n, hwaddr addr)
 int sysbus_mmio_map_name(SysBusDevice *dev, const char *name, hwaddr addr)
 {
     for (int i = 0; i < dev->num_mmio; i++) {
-        if (!strcmp(memory_region_name(dev->mmio[i].memory), name)) {
+        if (!strcmp(memory_region_name(dev->mmio[i]), name)) {
             sysbus_mmio_map(dev, i, addr);
             return i;
         }
@@ -175,13 +175,13 @@ void sysbus_init_mmio(SysBusDevice *dev, MemoryRegion *memory)
 
     assert(dev->num_mmio < QDEV_MAX_MMIO);
     n = dev->num_mmio++;
-    dev->mmio[n].memory = memory;
+    dev->mmio[n] = memory;
 }
 
 MemoryRegion *sysbus_mmio_get_region(const SysBusDevice *dev, int n)
 {
     assert(n >= 0 && n < QDEV_MAX_MMIO);
-    return dev->mmio[n].memory;
+    return dev->mmio[n];
 }
 
 void sysbus_init_ioports(SysBusDevice *dev, uint32_t ioport, uint32_t size)
-- 
2.51.0


