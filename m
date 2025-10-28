Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 727C1CCF9E0
	for <qemu-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 18:21:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vDoJu-0004iF-0m; Tue, 28 Oct 2025 14:21:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDoJN-0004C8-Nt
 for qemu-riscv@nongnu.org; Tue, 28 Oct 2025 14:20:50 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDoJ3-0002a5-7U
 for qemu-riscv@nongnu.org; Tue, 28 Oct 2025 14:20:43 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-475dc6029b6so35422395e9.0
 for <qemu-riscv@nongnu.org>; Tue, 28 Oct 2025 11:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761675620; x=1762280420; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GfeUVn3AUVOc8i76MmM0CIkfCI7XFzM26eB6JeFZWbQ=;
 b=Rv8MoNlOdHMvYAovOZipVBJjL/z9TSyQipI+714suRCBub1wkvD/6hR4u8NNy4nXvL
 GUZFf+5vQdWBwuXW+/hir1xQrLOcA9NLi+g9JBcC4nhRtAifLJtfdMBNiHLGUwtZlvvX
 nUeB52U6oJFXMK6h/d9pq5FSTQLlbCWUtRqKbA4PEQ/2U7ywNnU1eiTkd/9Erg05FK9L
 by0NX3rhdCcGk6bu3y9ELdOuHkcH2iG+WUpDRI0/x11+2bAPjqPTf/gBBB5g5PI2bDfJ
 WERZK131fj4BKXyio36TiPyfV9jcpmM94JUeAp8enn3sfp41M/C8cd67DEw3oVeO/Zw8
 1+3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761675620; x=1762280420;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GfeUVn3AUVOc8i76MmM0CIkfCI7XFzM26eB6JeFZWbQ=;
 b=uBpIiUVop5iToJE4+bAFXdLKaQPYzycfdodQn50625rjRuHD86kN5Ti6vYswX0N6LX
 3jpGRuR4Ct7Q58qsG24E/P+xof23kHrZIOgMod9UCKQ7Khmzuh8zvSkLIyCwsNyt34Nx
 6UV9ATf7RSucOENY1GS6Ksv4v2daPICzKZmXOY4LPyGmZmo5a6PjelOPbMa11+4SelSO
 sq7lgdbpwOK/kC/aAMZ7759fx5nnckSxxnxg+Fp1R7NEgvWY0tQ6VqD/vZhuuT3SYCeD
 NC26RVlbA8fLyK+A9cT23jXw4UkawwHftlUUVJShXyTQ4OzEpmozn6nI+hbso31+k3pX
 1Jvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWg0Ok60EDG3koHhzflNhfE6HvdDMVnAPSZEF/rxxVwBWWfwrddaSoQqAvtu+tGT5dpF6YfUi6niGAh@nongnu.org
X-Gm-Message-State: AOJu0Yz/e27xnMz8ECBf/9ho1MIv441l8C0rdEJ7S1wMn6tTvOcgL+4t
 whd1cyK2VPSHnFbDDGMQW4RJ647bjjQwkGFBECT7nXTdfxv6kTL7iNg70s4x13PxUA4=
X-Gm-Gg: ASbGncuGEZlg1svQCZtrMBtfcL3L2+dzVcqnGOmaaeRIJMWJCPEo+81KeqHOEdouZ2E
 B61Xj3TG9S9ZzHecP73i4ehmAjEBS5VG+mdXeyuAD+deM5m/liBBA1rAvhrDCDLuKtNev5ijEd0
 XrzLp1bSYnhnJ5zCCFlsPBeBS3uP0rTLOT/QqJbTmn/s/mW2CshM2G+BnPO9pAAvGKHTBY7Bzkq
 gYLIi+LApbdyenPhdYZn7Ff1b6e+u17Ge7HBh3ENAYdTIFaz6f3IHPqw1428EhB/FQoPYYMFpyO
 Q8K05svslYbI3d5hndxWb1XQpvqDkFP0fdD00AGqsq3TI0J/8++FYjTTo4rzs1JZ+mnxOJhR+E1
 muFVz7XQdfqyKEm3iVLNJdP9tTEJLvulMZ2iSxcobCNdzy+cfkjEnQulr1a+NnSsg9nFuUKb/bv
 z2NtMMr+Fgc4Kh1sN23nVdnExpbh1fsXqk+Ie1Bfp9H5fxKENGqQ==
X-Google-Smtp-Source: AGHT+IE4+6k4M+b4NtcuWtYqw/qnC8+nn4S/fp9gmDCS5E4FcUYInz3VNgEQ2qiMYd5mzGgXsmC5aQ==
X-Received: by 2002:a05:600c:848c:b0:471:16e5:6d7a with SMTP id
 5b1f17b1804b1-4771e181091mr3312195e9.13.1761675619704; 
 Tue, 28 Oct 2025 11:20:19 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952d3532sm22256679f8f.20.2025.10.28.11.20.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 28 Oct 2025 11:20:19 -0700 (PDT)
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
Subject: [PATCH v3 07/25] hw/sysbus: Use memory_region_name()
Date: Tue, 28 Oct 2025 19:12:41 +0100
Message-ID: <20251028181300.41475-8-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028181300.41475-1-philmd@linaro.org>
References: <20251028181300.41475-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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

MemoryRegion::name is private data of MemoryRegion. Use the
proper memory_region_name() accessor, which might return a
different name.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 hw/core/sysbus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
index ae447c1196a..d33be6b2b52 100644
--- a/hw/core/sysbus.c
+++ b/hw/core/sysbus.c
@@ -154,7 +154,7 @@ void sysbus_mmio_map(SysBusDevice *dev, int n, hwaddr addr)
 int sysbus_mmio_map_name(SysBusDevice *dev, const char *name, hwaddr addr)
 {
     for (int i = 0; i < dev->num_mmio; i++) {
-        if (!strcmp(dev->mmio[i].memory->name, name)) {
+        if (!strcmp(memory_region_name(dev->mmio[i].memory), name)) {
             sysbus_mmio_map(dev, i, addr);
             return i;
         }
-- 
2.51.0


