Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2403FC001B0
	for <qemu-riscv@archiver.kernel.org>; Thu, 20 Jul 2023 02:34:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qMJTp-0005Jm-QW; Wed, 19 Jul 2023 22:33:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tjeznach@rivosinc.com>)
 id 1qMJTn-0005E9-Vw
 for qemu-riscv@nongnu.org; Wed, 19 Jul 2023 22:33:24 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tjeznach@rivosinc.com>)
 id 1qMJTl-0002Kb-WF
 for qemu-riscv@nongnu.org; Wed, 19 Jul 2023 22:33:23 -0400
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-55ae2075990so140159a12.0
 for <qemu-riscv@nongnu.org>; Wed, 19 Jul 2023 19:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689820399; x=1690425199; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JFszruGEJdEzQJsVXPbk2X9A+ewv6qF14kYm0ANUE3w=;
 b=Mc/vRCw6Bq0WGC70lA2AF7dKsEXhY6V8kh2O7xaOTSnpoXYgBgGeEnko6LBEioGfXr
 qck1+JVD+DFXLin65ADdw2FZ6lDYcDzVMuJDffJ3UHoqRbREu8wh3mniupcj75BZL/hw
 gsr+zbxDM9n6UaA/27iQbjRwlRduZYe3K6wNp8trTluE+hgiq1MpU1yDJrk3jaXHYiyg
 oXb1fcM9jbZs5Zm7OhO9DrU5oev1TB6sv1EMk967AllAzpsOTCk6V3c8IZm8qbV3bUnF
 b5fxGqvHvMXitaKGOifMbJS8Le6h7sfHyVUWnwbVYZMfiTt+QFibtMBaS6a0hH6N/b83
 renQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689820399; x=1690425199;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JFszruGEJdEzQJsVXPbk2X9A+ewv6qF14kYm0ANUE3w=;
 b=jfeRQjauSak11UyPpAc/VXzKmm+qMaKUeFlxWihrHd51Fgyi8Kv4ke2E/5DvJo0ODS
 WUfVpojcG0ddvRTp5+z34ZaC42xBqCMfVdrmoHAy46X8RHJGsgQiDgvnq1XLLVlz7JM9
 XaEfk3AXYwhdbyLx5dQBZF+EryIipPZhhAX8qDTRpSwXklLb6c+54WPcwXgsPye4WNV5
 0qi2S//13AvOjhtjnyMhtT5MEbpDNsaP08VraCL+RiObODuezqIe2Mj5G40LIUMqF7b+
 1U023LR/nJAEuYUgBmtUBMZQN9Gju8uvXPI64i82NzRkXOvvCw5QImDm42e4ct4Vxop8
 o9Tg==
X-Gm-Message-State: ABy/qLaDGndaYTk2hkXLxx+xaC/b35fECWbLsDE8lyDP3xhi1UeYpDBt
 yfqVVTLX7k6teLrAVyd5JQ4Ibg==
X-Google-Smtp-Source: APBJJlHeXSk+FVRCg0HUATINiFftVo9A3gs5nISEX2i4k2OIWrrxAd02u+0zrkrAHxM/z9AqBg9d+Q==
X-Received: by 2002:a05:6a20:1441:b0:123:828f:68c with SMTP id
 a1-20020a056a20144100b00123828f068cmr22099542pzi.50.1689820399642; 
 Wed, 19 Jul 2023 19:33:19 -0700 (PDT)
Received: from tjeznach.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 w5-20020a1709029a8500b001b9e9f191f2sm4692032plp.15.2023.07.19.19.33.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jul 2023 19:33:19 -0700 (PDT)
From: Tomasz Jeznach <tjeznach@rivosinc.com>
To: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org, linux@rivosinc.com,
 Tomasz Jeznach <tjeznach@rivosinc.com>
Subject: [PATCH 4/5] hw/riscv: IOMMU: use process identifier from transaction
 attributes.
Date: Wed, 19 Jul 2023 19:32:57 -0700
Message-Id: <81df51e9bd547f1826d67834a0d705977d7e1435.1689819032.git.tjeznach@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689819031.git.tjeznach@rivosinc.com>
References: <cover.1689819031.git.tjeznach@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=tjeznach@rivosinc.com; helo=mail-pg1-x534.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Use iommu index as process identifier, linking transaction
memory attributes with translation request.

Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
---
 hw/riscv/riscv-iommu.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
index fd271b2988..62525df2e2 100644
--- a/hw/riscv/riscv-iommu.c
+++ b/hw/riscv/riscv-iommu.c
@@ -2236,6 +2236,12 @@ static void riscv_iommu_realize(DeviceState *dev, Error **errp)
     /* Report QEMU target physical address space limits */
     s->cap = set_field(s->cap, RISCV_IOMMU_CAP_PAS, TARGET_PHYS_ADDR_SPACE_BITS);
 
+    /* Restricted to the size of MemTxAttrs.pasid field. */
+    if (s->cap & RISCV_IOMMU_CAP_PD8) {
+        MemTxAttrs attrs = { .pasid = ~0 };
+        s->pasid_bits = ctz32(~((unsigned)attrs.pasid));
+    }
+
     /* Adjust reported PD capabilities */
     if (s->pasid_bits < 20) {
         s->cap &= ~RISCV_IOMMU_CAP_PD20;
@@ -2506,12 +2512,13 @@ void riscv_iommu_pci_setup_iommu(RISCVIOMMUState *iommu, PCIBus *bus,
 static int riscv_iommu_memory_region_index(IOMMUMemoryRegion *iommu_mr,
     MemTxAttrs attrs)
 {
-    return RISCV_IOMMU_NOPASID;
+    return attrs.unspecified ? RISCV_IOMMU_NOPASID : (int)attrs.pasid;
 }
 
 static int riscv_iommu_memory_region_index_len(IOMMUMemoryRegion *iommu_mr)
 {
-    return 1;
+    RISCVIOMMUSpace *as = container_of(iommu_mr, RISCVIOMMUSpace, iova_mr);
+    return 1 << as->iommu->pasid_bits;
 }
 
 static void riscv_iommu_memory_region_init(ObjectClass *klass, void *data)
-- 
2.34.1


