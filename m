Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C55C19F32
	for <qemu-riscv@archiver.kernel.org>; Sun,  2 Mar 2025 09:13:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tofND-0001EK-Ad; Sun, 02 Mar 2025 04:12:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1tofN6-0001C0-19
 for qemu-riscv@nongnu.org; Sun, 02 Mar 2025 04:12:28 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1tofN4-0003JL-I4
 for qemu-riscv@nongnu.org; Sun, 02 Mar 2025 04:12:27 -0500
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-223a3c035c9so3241885ad.1
 for <qemu-riscv@nongnu.org>; Sun, 02 Mar 2025 01:12:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1740906744; x=1741511544; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6wEnkpxsHEbI0fxfUeUBSWHfWq/aVMmkApj4LVSqQuY=;
 b=Nb+z6ck1x5c3SgukdRZjtpfDOzWLTEGh8n5aG25xd0o/HWrDSnlsVNrGBx4kERYxHR
 rfp0XGOIsG0grJbTmsVMk3ivmDVXgvEDMMJ6u6qXbNbyFH3K36EyiOTlQ6p+1gurt9o/
 uoYeuzyuXjS7RPrMpMMNK54v5gG3TkqRqf0Bvc/tjBbZjhZYOmwPuTTLArKLnUpvRjkm
 xapU+c9G10ShJDHNyTAekNWNuJ3QhqYOjod1+BbRsNs3+jFiXVLmXQzkn+ZN3295x+8z
 SuWaAR9i1QMcLea1KO+u15IOa1kkArkTC2uEkN10kxOxA4JfixAoGJ2DLIKPbneNWB8s
 NDNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740906744; x=1741511544;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6wEnkpxsHEbI0fxfUeUBSWHfWq/aVMmkApj4LVSqQuY=;
 b=RcmzZQS9nKIVWfhA7rNmuGj/lWuZG+ML7ZFC2LbaXIofbtw5wag3KT5VuQw3xYuZ56
 7RavPcdtS8JBBSl9HSTL3U0VQ56Cr93WW2tocq5hbLJAf5cgEP97EvOc3RB8HTuns3Bk
 H4mrponegKI4d6ItY6dodDoAvXa7wr3hzvV5ImDQ6oU2y7bQKRrgObADsnCTukzRPsQ3
 ZmD6RcZgdigk/dhpaYIWxiBizZt8v2c1ubWhn4S4nWBYju1QovbGKJqmpfw+JLNgocQS
 er1orSn5QmkgPNjw93wvhkeZIiD+lGAHIYXoi29Bw3PJZHRnGIy9SD42BIyAMu6QdlIE
 nYlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCtKQkAzmj5VfMmoxuenrYScF9IcWl8MbkDJ0/sLp6c17IRwW6QOcydLkHiDubDzqUNe7r85GgcpiU@nongnu.org
X-Gm-Message-State: AOJu0Yx7XD8FUFYCP+h/qLVs+UBufpGIqU9dR1qQIm0JsXf+T0P68lNL
 t6VmWS0IeJ+ku8gZj8dOP225m+P2VJek3oY0Y1r8MS3qu7qkU2rLqBQufTYMvpU=
X-Gm-Gg: ASbGnct007ZpsBLrv56gzUo6RPYKdiVWvk+ghPXLEIPyChgBc2XtEgc7bcn07tDKMGg
 /atUmzDBkuZyfA5PqKxln7+wSguhyH1xNV4mG/qrq/z98A+X4YHBKo9xEf3oSX1bNBVKCAUOJge
 ruYy8baxbexp4ETmxzKKQ+KA+O+aviTuh7YUA/9ma4GZ5Ce7IonI36rY7Ic775xdTEW6HLRvpQt
 7t5KjBVgdZfaKc1QI+EYRhNhUgvNCqvZ+yATxy8ZSJrunsMb5PCtsRV1qXeBbm6QXyRlT9ie5si
 Bwz+0PfBOdb20XVxhvSu1JCGFlNR9duDvYTFh/rPKRu/rh0rj6y6iT1ghKL0Ka8gpe+4s0Yl
X-Google-Smtp-Source: AGHT+IGu9d8sMF19BXEBKgHsCQ4kvaVpecX4e62+Ankya6235bqvZXneOq260SIi0aYPU9CFt4EO2w==
X-Received: by 2002:a17:902:e947:b0:223:807f:7f92 with SMTP id
 d9443c01a7336-223807f8110mr83898835ad.20.1740906744360; 
 Sun, 02 Mar 2025 01:12:24 -0800 (PST)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736310abc8csm2952616b3a.77.2025.03.02.01.12.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Mar 2025 01:12:23 -0800 (PST)
From: Jason Chien <jason.chien@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Jason Chien <jason.chien@sifive.com>
Subject: [PATCH 2/3] hw/riscv/riscv-iommu: Obtain Device IDs from Memory
 Attributes
Date: Sun,  2 Mar 2025 17:12:08 +0800
Message-ID: <20250302091209.20063-3-jason.chien@sifive.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20250302091209.20063-1-jason.chien@sifive.com>
References: <20250302091209.20063-1-jason.chien@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=jason.chien@sifive.com; helo=mail-pl1-x633.google.com
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

The bus number of a PCIe endpoint may change after PCIe re-enumeration,
potentially causing the device ID stored in RISCVIOMMUSpace to become
outdated. This can lead to an incorrect Device Directory Table walk.

This commit ensures that the IOMMU dynamically retrieves the latest device
IDs from the memory attributes of the requester devices, ensuring accuracy.

Signed-off-by: Jason Chien <jason.chien@sifive.com>
---
 hw/riscv/riscv-iommu.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
index d46beb2d64..b72ce8e6d0 100644
--- a/hw/riscv/riscv-iommu.c
+++ b/hw/riscv/riscv-iommu.c
@@ -2644,7 +2644,13 @@ void riscv_iommu_pci_setup_iommu(RISCVIOMMUState *iommu, PCIBus *bus,
 static int riscv_iommu_memory_region_index(IOMMUMemoryRegion *iommu_mr,
     MemTxAttrs attrs)
 {
-    return attrs.unspecified ? RISCV_IOMMU_NOPROCID : (int)attrs.pid;
+    RISCVIOMMUSpace *as = container_of(iommu_mr, RISCVIOMMUSpace, iova_mr);
+
+    /* Requesters must attach its device ID. */
+    g_assert(attrs.unspecified == 0);
+
+    as->devid = attrs.requester_id;
+    return attrs.pid;
 }
 
 static int riscv_iommu_memory_region_index_len(IOMMUMemoryRegion *iommu_mr)
-- 
2.43.2


