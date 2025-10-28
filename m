Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D12CCD1BF
	for <qemu-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 08:07:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vDeij-0000HW-8o; Tue, 28 Oct 2025 04:06:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDehP-00083j-Do
 for qemu-riscv@nongnu.org; Tue, 28 Oct 2025 04:04:59 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDehK-0000v6-LJ
 for qemu-riscv@nongnu.org; Tue, 28 Oct 2025 04:04:57 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-426f1574a14so3661984f8f.3
 for <qemu-riscv@nongnu.org>; Tue, 28 Oct 2025 01:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761638690; x=1762243490; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BU4cbGt91bL/zj+kwzBNgRzNipaoran6iEGhQUMuavI=;
 b=CVl0e+pTF5yKF4TGl+V9VaqqCKNEbJbVZFw9skdSMMJ8fgcRkhbFmgKDsFxkWplSmv
 IUtcN9UJae5zBg62hxrRpkWUYCk2ADvY9qhYRHjvhOBzOi3m9XX3mHvf49DJ2rcB57R+
 4ykP2D42ko73FKCL7OGa1fN1ltmhecPdgYzkHfaPQJddk1Ebc+9+AAvR7MUKAoPrxfDn
 QgEmSwJ94QHGUi5VpcAkz9Nc/QpMguT/LJVOG+tE0ZSoAGLyocWDw725XwIIOCXMHt6b
 5GFWNqZiWHS9Xi4sv27IVT0vuINxDXgznlyfo4olG7XgH5OL1+jrkH5S0wkHLPiayfX6
 M5VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761638690; x=1762243490;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BU4cbGt91bL/zj+kwzBNgRzNipaoran6iEGhQUMuavI=;
 b=YsWOk3CB2pBU4Veco0AVYnWI0PikKh4ZXqipwsu6rLVQNNmoMf2kiTJHkrsSk34br4
 Mk6PlXw1a23RdrLBw5ePcyiK4wVi8uvQaHWB9iPP3I3buzIWhEHIv+jf0j2vdB31acVp
 N0xRGNLwm/ZzVRK9zNqEgt7FalXnAKaugnF/bzfJfGmwGDkyxTLZFg0ZaV7ZIsKwaiev
 rWu8TgXxLN7av8vRd4g+vDGIZHJD4vhNuyC8qwob+VXz3R9nJ9cZbK4/2Npx0VcJpFet
 v/vmotayIRKK4Z2PRwXtKq0fzejDB9C5Ub2qPs2A0cujMmGa1RNHGNCyFuGqRQ7ATXqH
 9D6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXat7xMUaPz32bg1q3uJvhXuo9cyZ4IgMonTdF5EJcg+RE/R8TW0NrZymoec2xMexKWimveyMgyOQQ0@nongnu.org
X-Gm-Message-State: AOJu0Yyhr54edVy1pLCFia4i3R1JNTILIEyntZhi2oejOz/o32w61Loj
 el//Z7NzU6p1uwnSVoLPHn7yet0fFgw7R0by3/t70Iwii6FbcB6LdJzdTU3bdnOtS8A=
X-Gm-Gg: ASbGncvF5WquX3KeVTghj3BYWEiYaQsUTR7MTexqr/q7lASRHz3fog2ydGuIEbO/q9n
 iaYUZgSrHqrBz8W7YngOesiVpUerrdH2qLgXH0Hf7Zpo082jrqRBSr53x4hpcJRGbIOlcxcmMhh
 Ql23eF1nlACFdqT4aCeO9uV6xEktCixzHP8JbBaNmL9V+SXM02v61f31CumW/h8MEal+860F1hS
 JreS9PAxMOubbBLQ1Nei9vgqd1inBAQv0v7YDLOuebkwlPfl/00Whm/Hk6NKY7/4yqMLJnewi1q
 ZyuNVYTsSvNUbehpPupRjP2CqKjBAsTQbXnDceo+HLR9IjPT0fQWZoW/5wACDkY57JVrCO6RqPb
 pufn1X0T7p5sSCfeLoIra/mW98nMdyoSbIhZ/6pLoBlO9uaXIvwDEUCSC0dflQ54OTlWyotXHdc
 wKkyuZ2mUdL+lesoChI80L9GqWFawmWit3YOvFNxA/2vKMuwQ3piJV/iw=
X-Google-Smtp-Source: AGHT+IG3QDDR+Lrr+fbcwn1dwgH4NdC7JNF+0fC97Yvd0G9hDjhSV8LBvqRvsw+uaEZQ1JTHvTioDA==
X-Received: by 2002:a05:600c:3548:b0:46e:37af:f90e with SMTP id
 5b1f17b1804b1-47717df644fmr21641325e9.6.1761638689834; 
 Tue, 28 Oct 2025 01:04:49 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952db80fsm18400849f8f.31.2025.10.28.01.04.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 28 Oct 2025 01:04:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>, qemu-ppc@nongnu.org,
 qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>
Subject: [PATCH v2 5/7] hw/acpi/cxl: Use proper SysBus accessors
Date: Tue, 28 Oct 2025 09:02:55 +0100
Message-ID: <20251028080258.23309-6-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028080258.23309-1-philmd@linaro.org>
References: <20251028080258.23309-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

SysBusDevice::mmio[] is kind of internal. Use the proper
sysbus_mmio_get_region() accessor.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/acpi/cxl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/acpi/cxl.c b/hw/acpi/cxl.c
index 75d5b30bb8b..77c99dfb184 100644
--- a/hw/acpi/cxl.c
+++ b/hw/acpi/cxl.c
@@ -104,7 +104,7 @@ static void cedt_build_chbs(GArray *table_data, PXBCXLDev *cxl)
 {
     PXBDev *pxb = PXB_DEV(cxl);
     SysBusDevice *sbd = SYS_BUS_DEVICE(cxl->cxl_host_bridge);
-    struct MemoryRegion *mr = sbd->mmio[0].memory;
+    MemoryRegion *mr = sysbus_mmio_get_region(sbd, 0);
 
     /* Type */
     build_append_int_noprefix(table_data, 0, 1);
-- 
2.51.0


