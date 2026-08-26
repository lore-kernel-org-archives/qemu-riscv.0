Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C167CC5DF97
	for <qemu-riscv@archiver.kernel.org>; Wed, 26 Aug 2026 22:07:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wzLlQ-0005IZ-Bq; Wed, 26 Aug 2026 18:06:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wzLlO-0005GZ-SI
 for qemu-riscv@nongnu.org; Wed, 26 Aug 2026 18:06:30 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wzLlN-0004qa-D3
 for qemu-riscv@nongnu.org; Wed, 26 Aug 2026 18:06:30 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-383b4a3755fso1901481a91.3
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 15:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787781988; x=1788386788; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=angXpW714AxLO7bEvAuoyzYf+yVTyNqRpHReJaAGMI8=;
 b=cJdThBlVwPzw+v2bT93E8aN89bE98QiUbRo8lv5uGJa7FvizpoRWMkNhN+sZm0zFGL
 WdPc+NBB3dmOAghv6bqLYP9YTnHHYEQHZ7TlhJjSXxLOujnp+sJsFS5NqzASaPbxBPzR
 B4vIzH46VOeD4HhdQ42sZf+GneX/fMPPLnEGVPA4CqOV1/9vh7Styq1N/DKmYqUjoXJ3
 OCTUpTzLPTiMXA7tEc0dLO7jjloBvk0k7fipBEnNkGet8k+xePNtpKNL0LJPYnZJSLnY
 1+JmJkeU27A4ZfrmK1Gb3/Hw+1lydRaV/YIQeba5bE920CaPiHta8fFn2s/ZxGK2H+9v
 uZUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787781988; x=1788386788;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=angXpW714AxLO7bEvAuoyzYf+yVTyNqRpHReJaAGMI8=;
 b=RHGDpnsu9jV/rQfUIKIVyDcfpEsy6RaZhH+LXAtfYOv4Va3dGPM5Ci9PakQ53bBjaW
 3tBmyScaER5l1B0CW5BqV+UDmomlYZ27TP/+au3cEk/wd5IxnmUifypnXQEN9JnVQoP9
 RWis3tDOgg7ao39/tni5NyZIi8gGkiohU4q79Z6U2gHDHRMXFR25DIzMBs8sZEbrTlS1
 r8fVFwRFCnjzBqUU5MyY0XiENMauVGeJMvtijFoJl0uXXZwUuyV1NYHvDtVx7AKm4Q5F
 0Hbxv6vQcFI28G7llCes/wBea42XBJ2nNL6gh9X0eYjvmXDFPEZUQf8Egho+4xrE2+qQ
 LX6w==
X-Forwarded-Encrypted: i=1;
 AHgh+RriUxntTx/SMapU4ENh8lpf3TRueCsfjwxNB30QLDT7IhM+7l5Z085EedtNAtmmi5zpxszTQGD/Q/E6@nongnu.org
X-Gm-Message-State: AFuF++kp4otc3apKyE60ZxhmiMI7zhyGbTp75+yrhrx3EIEviFxndTlq
 APUjzkNy1B7YLIfvflUW6pWVMNYga9vL0KcPIC66flwuAzKz5KEW0GnK
X-Gm-Gg: AR+sD111kzJvvGgPKBO6Zl40bY/4sw0HvxHJ0v2AK4CYhVTOJpsmvCZKOYCkqDnKU/w
 paxu8vGFh92Rgb4LUbyzEdf3Ct1MlYj+1H3SXBBIrmVeiuRH/amsp3nzYbfgaz0mLBu0JM6wnWO
 ylrrQoinSgNZLz2USc022wLSpad3mG2+jZ3atQbulPWK6zwp+xlEVKf3iG768p5lH75pMATV48w
 0AGy9Qb5750It9Cci1cge1frID68bA8LeHpC6RwO+41S6NBZAJRdYWVud5sJUX52cUUhno0Woch
 V9smoSkypdraWJU5xa5MVj0nqOHWtEE+IhNEnyrwoxHvjrr9jpnSCCMZHq1UQTnoeL6NzCzZhND
 VcgaPm/LbbXcjQ12CWLNP3KKWoz2aaSgiOBN6ePeBIUhV8802C1JS+WNZCdmMJ2gUfhZ6D521vt
 kjx23qkDMt6rjo1wBkLI7bD7zCcKV8lHkPbW40ZJ+bcBYSm0mbdBHZMhT4y6Tf87bU7WScv9OsH
 yeiLTbHkrsA74uQ9iS4Ie57iiAjm73H93T0k3EoDR6+Hk9y+MVjzTejnCZpN2F2xtsxeuRr2WWS
 sNxl+jHkr4saCtXTXXWKDfYWYB+QydM=
X-Received: by 2002:a17:90b:4a50:b0:396:61f1:da5c with SMTP id
 98e67ed59e1d1-3966d3aabe3mr19251084a91.4.1787781988020; 
 Wed, 26 Aug 2026 15:06:28 -0700 (PDT)
Received: from donnager-debian.. ([180.150.112.50])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-39668a573a1sm5789956a91.14.2026.08.26.15.06.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 15:06:27 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Michael Ellerman <mpe@kernel.org>,
 Portia Stephens <portias@oss.tenstorrent.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 08/16] hw/riscv/atlantis: Remove unused fdt_size
Date: Thu, 27 Aug 2026 07:35:18 +0930
Message-ID: <20260826220528.54516-9-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260826220528.54516-1-joel@jms.id.au>
References: <20260826220528.54516-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=joel.stan@gmail.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

The machine state carries around the FDT size which isn't used by
anything.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 include/hw/riscv/tt_atlantis.h | 2 --
 hw/riscv/tt_atlantis.c         | 6 ++++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/hw/riscv/tt_atlantis.h b/include/hw/riscv/tt_atlantis.h
index c9308aa57017..d0cca3b02424 100644
--- a/include/hw/riscv/tt_atlantis.h
+++ b/include/hw/riscv/tt_atlantis.h
@@ -33,8 +33,6 @@ struct TTAtlantisState {
     DeviceState *irqchip;
     DesignWareI2CState i2c[TT_ATL_NUM_I2C];
     UnimplementedDeviceState uart1;
-
-    int fdt_size;
 };
 
 enum {
diff --git a/hw/riscv/tt_atlantis.c b/hw/riscv/tt_atlantis.c
index acfd0d31b368..127c89be4f60 100644
--- a/hw/riscv/tt_atlantis.c
+++ b/hw/riscv/tt_atlantis.c
@@ -366,9 +366,10 @@ static void finalize_fdt(TTAtlantisState *s)
 static void create_fdt(TTAtlantisState *s)
 {
     MachineState *ms = MACHINE(s);
+    int fdt_size = 0;
 
     ms->fdt = create_board_device_tree("Tenstorrent Atlantis RISC-V Machine",
-                                       "tenstorrent,atlantis", &s->fdt_size);
+                                       "tenstorrent,atlantis", &fdt_size);
 
     qemu_fdt_add_subnode(ms->fdt, "/chosen");
 
@@ -384,8 +385,9 @@ static void load_fdt(TTAtlantisState *s)
     MachineState *ms = MACHINE(s);
     char **node_path;
     Error *err = NULL;
+    int fdt_size = 0;
 
-    ms->fdt = load_device_tree(ms->dtb, &s->fdt_size);
+    ms->fdt = load_device_tree(ms->dtb, &fdt_size);
     if (!ms->fdt) {
         error_report("load_device_tree() failed");
         exit(1);
-- 
2.47.3


