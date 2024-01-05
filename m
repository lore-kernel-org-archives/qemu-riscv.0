Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EDC5C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 15:56:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLmTR-00035l-3x; Fri, 05 Jan 2024 10:51:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmST-000060-Ls
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:50:05 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmSR-00011T-LY
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:50:05 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40e3712d259so10460445e9.3
 for <qemu-riscv@nongnu.org>; Fri, 05 Jan 2024 07:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469801; x=1705074601; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SDwxzH3vS9V/d1nX5dyRUP+IK7/Bx5gX/AEs8zKaqSE=;
 b=serQmlLIe01mZ/Q4/bElvfh9EQf7ZBvIKcZy4qmSldLsvUS859MG0lwpZ6amaLkSp3
 uDJIkL+28oYOdcbODmN9PVgUBfF1NFIJ0Pr8yr4HOODW3jDzAI5hbQx/ZhGn1LPXtHDN
 Y7X0uuVB0zmqSs1qOoMWZOff5Y2sQqgKu3IQTwYs6HSVIAmc+Pfr2wrA/KaI4jcqOqO3
 t8TbqnqowaqijPSJDiZOrg7B9XHEENzZT+JjBvWjrnpCabOBrAkiO+DVEQhoXS7q22/O
 6PdULmvbzC5lG13RZEK7cYrqfnAlnzG/iQ2nBEXaCaJ84PpcomS+B7Bl6jR6UYLXMiar
 Vjig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469801; x=1705074601;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SDwxzH3vS9V/d1nX5dyRUP+IK7/Bx5gX/AEs8zKaqSE=;
 b=gwCq6QqHg3JrKH+Go+CoekpIWrWNsRUIG90mx1VRv393cRJqmQqoS/R++d9rZ4iH9F
 RzOzFUe9clvj8V1MvJbv6mTNvHwl5i4zT/kOr8egqpv1wrYygpyOlUg1Dfyb7IVLwOXs
 bdglk7PKWj/WyjuUJPwY0NMCx25JM41bJyeq5Xw1OZMEohNnxJcAlNo/eT/fb/EWEZPE
 H4oiGAyG/UjRQYf8LyqGy5Wf2s5aV0/CD/6RAAaag9VK/OCXHUZ268xT96+DUaCUgj1h
 BbG+TkgBLHn4f3fB62WL2KHX4koV+7BNfiOLQgn7PIZ5TzQ5WKnUnbeWiY4iLKG4uAgr
 kQ8A==
X-Gm-Message-State: AOJu0YzNBC9HoX+eWPHjOGY2IIPgMR4BHWokJCW/smPfQt2LAzjUMNTB
 P1YOP/8mD32AcE8ZdFfGvlssORDsXlGnpw==
X-Google-Smtp-Source: AGHT+IHZhgpsMlbsYpnIF6g74vkVM44Ykg89QYw29B5DlHtEOAZm73Uhln07VdUJ0jn4/p0BBuuaKQ==
X-Received: by 2002:a7b:cd96:0:b0:40d:5821:5148 with SMTP id
 y22-20020a7bcd96000000b0040d58215148mr934968wmj.67.1704469801572; 
 Fri, 05 Jan 2024 07:50:01 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 b1-20020a5d4d81000000b00337405c06a6sm1621048wru.48.2024.01.05.07.50.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:50:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Gavin Shan <gshan@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
Subject: [PULL 68/71] hw/pci-host/raven: Propagate error in raven_realize()
Date: Fri,  5 Jan 2024 16:43:01 +0100
Message-ID: <20240105154307.21385-69-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

When an Error** reference is available, it is better to
propagate local errors, rather then using generic ones,
which might terminate the whole QEMU process.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Message-Id: <20231120213301.24349-26-philmd@linaro.org>
---
 hw/pci-host/raven.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/pci-host/raven.c b/hw/pci-host/raven.c
index f71d4872c8..c7a0a2878a 100644
--- a/hw/pci-host/raven.c
+++ b/hw/pci-host/raven.c
@@ -345,8 +345,10 @@ static void raven_realize(PCIDevice *d, Error **errp)
     d->config[PCI_LATENCY_TIMER] = 0x10;
     d->config[PCI_CAPABILITY_LIST] = 0x00;
 
-    memory_region_init_rom_nomigrate(&s->bios, OBJECT(s), "bios", BIOS_SIZE,
-                                     &error_fatal);
+    if (!memory_region_init_rom_nomigrate(&s->bios, OBJECT(s), "bios",
+                                          BIOS_SIZE, errp)) {
+        return;
+    }
     memory_region_add_subregion(get_system_memory(), (uint32_t)(-BIOS_SIZE),
                                 &s->bios);
     if (s->bios_name) {
-- 
2.41.0


