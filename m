Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A95BFC10DCE
	for <qemu-riscv@archiver.kernel.org>; Mon,  4 Dec 2023 15:26:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rAApm-00041p-CJ; Mon, 04 Dec 2023 10:26:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rAApk-0003ze-DW
 for qemu-riscv@nongnu.org; Mon, 04 Dec 2023 10:26:08 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rAApi-0005Rj-Ne
 for qemu-riscv@nongnu.org; Mon, 04 Dec 2023 10:26:08 -0500
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3333074512bso1811395f8f.1
 for <qemu-riscv@nongnu.org>; Mon, 04 Dec 2023 07:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701703563; x=1702308363; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JZhXIwTdxRXKPCMPSGzqdtq6zXuxgS6BLrIc53hBnkQ=;
 b=Ik+y3p73xNQfV08P+AWscF27YgM2soO9QqwULde5RKAUM5V6O4fJOaBu+f6F4Fkxdk
 OJcInbvEUHhxAxlOL/phLcTzgS3yhLdv59DvZuvdIiBGihh/1WkclPpwz7Zio9NozoU5
 U53xJShD/AWx5lHWe0R+y50Ljv1LtQL7kimtihmyTJ2ujhzLVQVP8A35O5E+0V3H4kZG
 oKTFi6w6aJeMvMtFIxvx18siorRt4JoWGKzozBcZ/+X+z5o2os/N+ePhoHnKPOH0TxFf
 qf+hm97krD4csOQMPCcop1p4wjMu68g/lu+AWsXon7DVy5mupHa19c1a965PPTkdu3Ip
 cKuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701703563; x=1702308363;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JZhXIwTdxRXKPCMPSGzqdtq6zXuxgS6BLrIc53hBnkQ=;
 b=ibXkbWlOAiLeV1wRLtAriSaN2UktY3skpDH1u30BX7S6j43pj/XLV3xNySQTUoMXcl
 hxXvvGtbLJ8yArrb1+UG8plTk+UyYx2+dBcOrAPyyTxCiWACsY/p8SVjJvCokXX7HOqX
 igsCs9GdSiq43mkszrPOJbpWFLZ1OQp7T4kGhyC7FRyHAtWt9SWp4Z2G87o1/GR08jAs
 Dns4dRwhreNNS1awLfVJI/VltAY49D4u4xHuWqaJ5tdBcFitWxeydO1syLg864QtrKJR
 1/JZtLFLwZ3t3I5/aZnpRpmx8ozM6s3talqdSTO6J8xHE/zzbv2cmafADcPqbOF0/dBz
 SVwA==
X-Gm-Message-State: AOJu0YyZi3kKxkLTwTs90d3ixEw+mOVuUsaHu1mC7k3k2OVjoT3bnN7F
 +grYApJqLu9jnkGi4eGi0kztZA==
X-Google-Smtp-Source: AGHT+IF7S4hN8Ty5stC/jwuTrFR39QKReM8akbhMSJT2uVxez0h9m7F5yWhXmozxOaiazE800TIZvA==
X-Received: by 2002:a1c:7712:0:b0:40b:5e56:7b58 with SMTP id
 t18-20020a1c7712000000b0040b5e567b58mr1265580wmi.161.1701703562831; 
 Mon, 04 Dec 2023 07:26:02 -0800 (PST)
Received: from m1x-phil.lan ([176.176.140.35])
 by smtp.gmail.com with ESMTPSA id
 iv11-20020a05600c548b00b0040b4cb14d40sm19082346wmb.19.2023.12.04.07.26.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 04 Dec 2023 07:26:02 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Patrick Venture <venture@google.com>,
 qemu-stable@nongnu.org, Chris Rauer <crauer@google.com>,
 Peter Foley <pefoley@google.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 David Hildenbrand <david@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Xu <peterx@redhat.com>
Subject: [PULL 1/4] system/memory: use ldn_he_p/stn_he_p
Date: Mon,  4 Dec 2023 16:25:21 +0100
Message-ID: <20231204152524.37803-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231204152524.37803-1-philmd@linaro.org>
References: <20231204152524.37803-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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

From: Patrick Venture <venture@google.com>

Using direct pointer dereferencing can allow for unaligned accesses,
which was seen during execution with sanitizers enabled.

Cc: qemu-stable@nongnu.org
Reviewed-by: Chris Rauer <crauer@google.com>
Reviewed-by: Peter Foley <pefoley@google.com>
Signed-off-by: Patrick Venture <venture@google.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Message-ID: <20231116163633.276671-1-venture@google.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 system/memory.c | 32 ++------------------------------
 1 file changed, 2 insertions(+), 30 deletions(-)

diff --git a/system/memory.c b/system/memory.c
index 4d9cb0a7ff..798b6c0a17 100644
--- a/system/memory.c
+++ b/system/memory.c
@@ -1339,22 +1339,7 @@ static uint64_t memory_region_ram_device_read(void *opaque,
                                               hwaddr addr, unsigned size)
 {
     MemoryRegion *mr = opaque;
-    uint64_t data = (uint64_t)~0;
-
-    switch (size) {
-    case 1:
-        data = *(uint8_t *)(mr->ram_block->host + addr);
-        break;
-    case 2:
-        data = *(uint16_t *)(mr->ram_block->host + addr);
-        break;
-    case 4:
-        data = *(uint32_t *)(mr->ram_block->host + addr);
-        break;
-    case 8:
-        data = *(uint64_t *)(mr->ram_block->host + addr);
-        break;
-    }
+    uint64_t data = ldn_he_p(mr->ram_block->host + addr, size);
 
     trace_memory_region_ram_device_read(get_cpu_index(), mr, addr, data, size);
 
@@ -1368,20 +1353,7 @@ static void memory_region_ram_device_write(void *opaque, hwaddr addr,
 
     trace_memory_region_ram_device_write(get_cpu_index(), mr, addr, data, size);
 
-    switch (size) {
-    case 1:
-        *(uint8_t *)(mr->ram_block->host + addr) = (uint8_t)data;
-        break;
-    case 2:
-        *(uint16_t *)(mr->ram_block->host + addr) = (uint16_t)data;
-        break;
-    case 4:
-        *(uint32_t *)(mr->ram_block->host + addr) = (uint32_t)data;
-        break;
-    case 8:
-        *(uint64_t *)(mr->ram_block->host + addr) = data;
-        break;
-    }
+    stn_he_p(mr->ram_block->host + addr, size, data);
 }
 
 static const MemoryRegionOps ram_device_mem_ops = {
-- 
2.41.0


