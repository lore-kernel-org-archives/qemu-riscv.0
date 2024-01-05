Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8694C47079
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 15:59:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLmRO-0004tP-Hq; Fri, 05 Jan 2024 10:48:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmR1-0002Ba-To
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:48:36 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmQy-0005lJ-TW
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:48:35 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40d3c4bfe45so14944785e9.1
 for <qemu-riscv@nongnu.org>; Fri, 05 Jan 2024 07:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469710; x=1705074510; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pxeB5JHPsloAIkHe9tjmngVFFPhZ7Tzq56PtI31mi5A=;
 b=r/UI2DJI7ZXzSJoq9WxifR9U6Q0kDtzHeIEO4eFalKxCvKsetcZBrrG8C8Xl1PvAxY
 PkLUOCC9Qxh4DZP5ekaR1OmqNthHK4ujNKtyYYp8SNRJm6e5dtXkgixgO06obNkEXpKt
 GvdzOvgv8W+O82NNCcKBNI+msaac663by9A/Su3gweaAyWPpWMKSwYCGfpLOQmJ6DSxx
 g6hJUUm2LbuVn76IuCAC96y2FJ0/bE1qDaJYRQ9w/cBDFxBxF0dAOkUYZe3xEXaFITZa
 KCSC9j9tQgirrP3mMA8O2shq5PWonkQMgLLKmc4Tj7Thnq3U9UHsiVT9gD1hHd30aUXJ
 kUPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469710; x=1705074510;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pxeB5JHPsloAIkHe9tjmngVFFPhZ7Tzq56PtI31mi5A=;
 b=NbETDKU+0Tf0SmTMwGuEi5DdhOhPLS3JcdgUIQyHzUwCyWUe3I4a0uLh10veKw9taw
 NyXmfOED3SEzB8MFagQHDzUEPgQ/CsxEAaS1cVyxioUv40r5rI8Bku8UXJzGEW1D+uGE
 tewh/3U4Z7Ttv/mSUsfe99AGdvIktEs7DMGisQh+OAkblBSx6EBAsw+GQ9XGRyUAVtx5
 H5MeOnL7eB2uWfvi+5QvEvGd0Mi02venEVHn9JkRTGZY6QcbG+2oJl/xjtUdcmFIPW8M
 KxICZR3Mzfy9VkBG+WWnX9x33b5Lf8eZoH6oteqVlAYqUjX+zmhb1CUFUk4s8zYhkoFT
 EHTQ==
X-Gm-Message-State: AOJu0YwMe2gGu2C1+JS4SGLM+DxGWhkyQP+0CkEubfPo4v5RGz+RndtP
 wevRQjN3hiAA+jv3bM/Uw2JfdaMIwWs0Uw==
X-Google-Smtp-Source: AGHT+IGGmNlvX+5XEyFN41Jq0pCpjhFubR2VsuO+YfPUoop45ZA6QI8jot/WJJTvWFoNWF4EwwAJAg==
X-Received: by 2002:a05:600c:34c1:b0:40d:880f:4876 with SMTP id
 d1-20020a05600c34c100b0040d880f4876mr630692wmq.152.1704469710540; 
 Fri, 05 Jan 2024 07:48:30 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 e9-20020a05600c4e4900b0040e38859c47sm1959505wmq.16.2024.01.05.07.48.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:48:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Xu <peterx@redhat.com>, Gavin Shan <gshan@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>
Subject: [PULL 51/71] memory: Have memory_region_init_rom_device_nomigrate()
 return a boolean
Date: Fri,  5 Jan 2024 16:42:44 +0100
Message-ID: <20240105154307.21385-52-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Following the example documented since commit e3fe3988d7
("error: Document Error API usage rules"), have
memory_region_init_rom_device_nomigrate() return a boolean
indicating whether an error is set or not.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Message-Id: <20231120213301.24349-9-philmd@linaro.org>
---
 include/exec/memory.h | 4 +++-
 system/memory.c       | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 9f54bc4af8..6d7b49b735 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -1523,8 +1523,10 @@ bool memory_region_init_rom_nomigrate(MemoryRegion *mr,
  *        must be unique within any device
  * @size: size of the region.
  * @errp: pointer to Error*, to store an error if it happens.
+ *
+ * Return: true on success, else false setting @errp with error.
  */
-void memory_region_init_rom_device_nomigrate(MemoryRegion *mr,
+bool memory_region_init_rom_device_nomigrate(MemoryRegion *mr,
                                              Object *owner,
                                              const MemoryRegionOps *ops,
                                              void *opaque,
diff --git a/system/memory.c b/system/memory.c
index 069aa5ee08..8db271c19e 100644
--- a/system/memory.c
+++ b/system/memory.c
@@ -1716,7 +1716,7 @@ bool memory_region_init_rom_nomigrate(MemoryRegion *mr,
     return true;
 }
 
-void memory_region_init_rom_device_nomigrate(MemoryRegion *mr,
+bool memory_region_init_rom_device_nomigrate(MemoryRegion *mr,
                                              Object *owner,
                                              const MemoryRegionOps *ops,
                                              void *opaque,
@@ -1737,7 +1737,9 @@ void memory_region_init_rom_device_nomigrate(MemoryRegion *mr,
         mr->size = int128_zero();
         object_unparent(OBJECT(mr));
         error_propagate(errp, err);
+        return false;
     }
+    return true;
 }
 
 void memory_region_init_iommu(void *_iommu_mr,
-- 
2.41.0


