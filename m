Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C74CCF9E0
	for <qemu-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 18:39:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vDoaT-0002tZ-Lr; Tue, 28 Oct 2025 14:38:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDoaQ-0002tD-Qx
 for qemu-riscv@nongnu.org; Tue, 28 Oct 2025 14:38:27 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDoaK-0005Dc-7z
 for qemu-riscv@nongnu.org; Tue, 28 Oct 2025 14:38:26 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4710665e7deso33705835e9.1
 for <qemu-riscv@nongnu.org>; Tue, 28 Oct 2025 11:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761676697; x=1762281497; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3LiVkULu7cpH5vHA/z/rbLa6gWXf0joU93uS+b0AUFI=;
 b=W2o/QHE9Pbnv7kcpIVuc56Rr4SwyeHGHsEhkTM6qc3+1qSzIqvCu3Im9paA7EdQcJs
 /SN6tmfrc4z7lXGjpEGTf5HccKnS7uOH2FPUFirNrG1u/BdO83XYApV+Z4pmzSgHr7RP
 tNPPwyvd1ATc9aD2EqF9FWsxgWdoTu4Gi+8dHnWtfE/mD93OxHvj8bjTwZVGYtPHCCXN
 MZh/K35hs1tMMWfsnMnJQQnirYF0ddPs+97w+INPX7yCtuF2YXQGpO1f7kMM4Om89XiY
 ark42+layZZ3czw2Hur6BtmuZJxdWLXzgGao5gmggfxwzCBnVZX+ov6aELqLqk7pdmcz
 CQKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761676697; x=1762281497;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3LiVkULu7cpH5vHA/z/rbLa6gWXf0joU93uS+b0AUFI=;
 b=oFuHih+T+q5U26Ni9p89XRv3nrQtUnpKYVeh39FcGu6HWxkMiNeXCAM01bZCbQc2cu
 OamOhW+IFRr2JTvr6LK4N1OZkj27fw31xSPpbMQC0c9IAV+t0lv9zTVFfXcbG8gVQ+DM
 LjsGM92kFvFVumZXOPtgJKx4ry9/Un7+d7j5Aj7lq3uJyyoJGndnsRiFS7Dizknhi1w4
 wem3icWMjFmBSVI6LD9o2ylWEDMZ1OnFUU0hlSG27qh1Z/8u1X2UxLKje3feIBtfdt48
 6XXCXHhs5oKk4zjkwyxN0/7ryoBtnjC4LpdvMjQY2iwRDUGvNSnRzv+ERPg7qb+Iub2i
 dFMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDY7O7TmFvyidqX3g3xUE8R0F2FwlS/UCwxoYDr2xdKzXWG33Nm7zE76mu/QC8sd0brsY6rQfZVLMH@nongnu.org
X-Gm-Message-State: AOJu0YxlV21BDvtIX8aSNwd+OSei1GscpJZYfQNxlEeTJ26S9VKudw2b
 UcappEOcPe/ih7n0x8mvUADMPdMpH/4KT1+N56Mgi7LTqZPBmBFeHbwYHGr1E0AK7l4=
X-Gm-Gg: ASbGncu6vAlba7MMmrfhKe389fbpY4Cwsjmdmxgh44YDPtQ7RXDy8XiflGAqLV31Ua8
 DIIrn0g9F+ijIS53UzndKvD5/P3D4EZ3pcmIcM3h+gQsT/qbXFqZOdB9WdkFkmThVZ3MXHupjAz
 nzdkTbxcq2wYQYoqcmXBD/n9dhwONDQbcCw/WSWotG9f75uv7CxGBNZtIQrJXx8fs43ZzL6jhuR
 wBrC2YoqP1WAvVAlIp35ke3uRQ15/Adjb/6r8aT8+IkAXrqxWhWUxDqiznahSy97LULi1p84zT5
 B+NhLak14wTg71aQKulpK62pkfLskUKRL8q+ZFFW8rFRsQKhvJARlKzSI/XbyjSGnLH5dXz11gk
 1A8gXYAakbTNh9nSbY5Hb7v/QaoXHgq1LK3fKA5GMfn7QqtPI1PPEECXqttwca8GaUf11G2hwSA
 hyMsU3nCIRT7jjXQa5IclV+KU9Zk93AG3roSNVjgek3lgd8HuK/Q==
X-Google-Smtp-Source: AGHT+IHlAKKbu1BvepCk2+xKmeMgOIpCiIa0/Yll5w1gh4uX8422ccZ4n4jMUDX3DYA0RYB95NOTig==
X-Received: by 2002:a05:600c:198f:b0:46e:32dd:1b1a with SMTP id
 5b1f17b1804b1-4771e165903mr5014625e9.7.1761676697458; 
 Tue, 28 Oct 2025 11:38:17 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4771e202093sm6130775e9.11.2025.10.28.11.38.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 28 Oct 2025 11:38:16 -0700 (PDT)
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
Subject: [PATCH v3 22/25] hw/sysbus: Hoist MemoryRegion in
 sysbus_mmio_map_common()
Date: Tue, 28 Oct 2025 19:12:56 +0100
Message-ID: <20251028181300.41475-23-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028181300.41475-1-philmd@linaro.org>
References: <20251028181300.41475-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

In order to make the next commit easier to review,
use the local @mr variable in sysbus_mmio_map_common().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/core/sysbus.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
index 414b3f806d1..dca6e67a92d 100644
--- a/hw/core/sysbus.c
+++ b/hw/core/sysbus.c
@@ -122,7 +122,10 @@ bool sysbus_has_mmio(const SysBusDevice *dev, unsigned int n)
 static void sysbus_mmio_map_common(SysBusDevice *dev, int n, hwaddr addr,
                                    bool may_overlap, int priority)
 {
+    MemoryRegion *mr;
+
     assert(n >= 0 && n < dev->num_mmio);
+    mr = dev->mmio[n].memory;
 
     if (dev->mmio[n].addr == addr) {
         /* ??? region already mapped here.  */
@@ -130,13 +133,13 @@ static void sysbus_mmio_map_common(SysBusDevice *dev, int n, hwaddr addr,
     }
     if (dev->mmio[n].addr != (hwaddr)-1) {
         /* Unregister previous mapping.  */
-        memory_region_del_subregion(get_system_memory(), dev->mmio[n].memory);
+        memory_region_del_subregion(get_system_memory(), mr);
     }
     dev->mmio[n].addr = addr;
     if (may_overlap) {
         memory_region_add_subregion_overlap(get_system_memory(),
                                             addr,
-                                            dev->mmio[n].memory,
+                                            mr,
                                             priority);
     }
     else {
-- 
2.51.0


