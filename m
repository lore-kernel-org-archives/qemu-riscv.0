Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3FFECCD1BF
	for <qemu-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 18:18:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vDoGc-0001Ec-HY; Tue, 28 Oct 2025 14:18:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDoG6-0000SI-Lz
 for qemu-riscv@nongnu.org; Tue, 28 Oct 2025 14:17:32 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDoFw-000282-W0
 for qemu-riscv@nongnu.org; Tue, 28 Oct 2025 14:17:26 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-42421b1514fso4512546f8f.2
 for <qemu-riscv@nongnu.org>; Tue, 28 Oct 2025 11:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761675431; x=1762280231; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ogjIj2x0b+Ph1mDq8xs+aaEQIpc9IB/77pPj2JRToEQ=;
 b=snw85uAJ0YE12Hnho7O/S5L0PLEcMKwytIZn5Mv7H5AgMkUQ8A8zl9lMIovgIq20Td
 WPFLZHcNzvvlrumhXQJ/epBOW1Zl2p/QNONH7/ZQLw+j3SwUx5ty9/QDOrKnSRBiO6DW
 c1jFwx1YD3msirEoP/93Hb8kw0Wn6jXSDQQYNkHydwolFfjRluQl4eJUbWSzsgdai7qS
 Z/QyNlJguFbnZTCMSz2S5TNxIMU/rNtOR4PwoiaA5RKtMnXI5B8iwb+ritDjkcFasAb3
 XbdoyB4+A0MiKjpOIOfbSgQ5b12PPZYWW5nl7oaX8b3aniTGujmFb4jRhd8YT8uxRwb6
 ooWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761675431; x=1762280231;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ogjIj2x0b+Ph1mDq8xs+aaEQIpc9IB/77pPj2JRToEQ=;
 b=s6ZkzQ4TEplclQb4OtxI1o3Stq6aaktoVlcbQSec2Y+Qwn5RH5mXOK5h4c9PhPdQYp
 g8QO23aDiGGREVeqV7qkiEnhWyTP57tjImkkHzh+F8uL+hAPOFojfed3N60PZCvLG9Hy
 42JzGADxXHPLok5XXSA/Q3bnpiyyPp5We+h1uyIh/Whnd0fkv2LRrpczIcVGEnJwqZPK
 rOJ4zaA10ikfaibB7Bc9NxfUyPLigPuynbkb0yMhntcyo5ZsyXP9cQ6tjUjvuprkvaiG
 T3uaS5K1rWNX9jlrv807e3868QM/iX2qZziDuw55tjdu+hkaXCSEgwYebekemyyPwneX
 Qumg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDDRPCFCnvRM9bZsuz+vZ1tyuu4ziYsgElT8Gi3rVQ/zZkEJMREXcqKaT5ygjhz1FylD+4RfFc1v9a@nongnu.org
X-Gm-Message-State: AOJu0YzTF7Xs4gXLzLLktW1XiXSQm/7AK7kVhvcTRFAGqFb6ni4PVQr1
 8Mk3cBrZW5YWpx3u/ti3Wk2O2Uo/k1zjMzJnxfR0+QHCj3RnyqY+IWfM7Va8DWm8RWk=
X-Gm-Gg: ASbGncum41XQpWSG0BEUgK9SnB8yOZHiCO/RWmNv2V4BcQNK//nemZO3cWhWqYrRqVw
 zfHHtzl2PUCbkRvz5licpy6up0KTJ8f3uMgo2fwn1eXrJ73R6P/wl0nPHIVAD9uZBTU94giKJoq
 Xe4+hpHCq1xLLF6+4+NZ8AQMCuyGPhKGkfPHNoOE8bv7MxsvZTwYwP0xmvt4FE/m75X6w+TcNIg
 a2B44vpyJsbv7HmYLq8As1NO5D8DGf33lFb5e3/6u740/BOfubmeK3bZSAf6rPUNn+AJT3wSZwl
 dZlGt86Q6awtAnbTEAB9FjBAbDP1R2kqUATHZKeNtMcsZLVyizoTIm5iRl3uAJUjTU+bDcLsYhL
 NlSbud9Ai1bAf77j2ycuu2qlDSqUrW0XefmkDuoV27DM0UEGpo7IC8nuwBhJT+WUeCVPVEEeDBr
 DE3ErZahFXS3Sguobo1UM6lc9tpsUYMg9SnCNaSyKU3+40NJ215A==
X-Google-Smtp-Source: AGHT+IGZXkSBvcMPXbgnK+FlW/f44gMl6lxA9bRKWCpTYzA77U/IZTSLqjuTQCa2An7uq/TgPnrKyw==
X-Received: by 2002:a5d:5f84:0:b0:428:5674:7a13 with SMTP id
 ffacd0b85a97d-429aefbbd87mr4104f8f.36.1761675431530; 
 Tue, 28 Oct 2025 11:17:11 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952df6b9sm22503931f8f.44.2025.10.28.11.17.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 28 Oct 2025 11:17:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.caveayland@nutanix.com>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>
Subject: [PATCH v3 04/25] hw/acpi/cxl: Use proper SysBus accessors
Date: Tue, 28 Oct 2025 19:12:38 +0100
Message-ID: <20251028181300.41475-5-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028181300.41475-1-philmd@linaro.org>
References: <20251028181300.41475-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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

SysBusDevice::mmio[] is private data of SysBusDevice, use
sysbus_mmio_get_region() to access it.

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


