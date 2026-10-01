Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 062DBCA5FA5
	for <qemu-riscv@archiver.kernel.org>; Thu,  1 Oct 2026 03:45:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xC7iG-0001qc-4Q; Wed, 30 Sep 2026 23:44:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dingtaodtdt@gmail.com>)
 id 1xC6SC-00065m-SE
 for qemu-riscv@nongnu.org; Wed, 30 Sep 2026 22:23:24 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dingtaodtdt@gmail.com>)
 id 1xC6S7-0002Qv-7l
 for qemu-riscv@nongnu.org; Wed, 30 Sep 2026 22:23:24 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-39647184c73so131040a91.1
 for <qemu-riscv@nongnu.org>; Wed, 30 Sep 2026 19:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790821397; x=1791426197; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=rKmdNyUIBVdIPme0GHxqMjMQ/2Bke/GwQXMJS1f1SKg=;
 b=BmEUPzXQrugFIpSH9b0b9F7F/W3qpazdBP7RyqtiEgRXUws8Ks0MmjwledsxwlUoUD
 4DSRENscP+Dc9iORuitiXZJ160BDfnPbpxb/M64ZP9RJtfISMgP8EvY0gj8hVLM5EAX5
 F40tlkggbi1maUNkhhFMn4WFih5ueeZE80cUN9Ls2lAxanJZ3g1orqbxB9EZHgJdPrhs
 TV+UUejZgAxqzDuVeG0K/QCn17qCr2/bHpBWv1ZUXPQkJWvByV5f6YPUkNUxHgm3jUCP
 NWhut3HT8Px/bK3j4evvDeI2zVe9ErhKv3d3sw+bDaHW81SYHYjq+1SGxSlTKHakgBOg
 NwgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790821397; x=1791426197;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=rKmdNyUIBVdIPme0GHxqMjMQ/2Bke/GwQXMJS1f1SKg=;
 b=NYkmrRLTsWb7Rw9ganraSotHwwrrtjEF91iM9OTY8sqTAdW8didQ0fYLYwz883Tjjf
 d5dVkGBpHJ525+3NjKZbiKE/IGaQzs9pee8ZXTK+Ph7qy+fY+7cj61+aHO+pmI6ItZOV
 v71RAwtS6wtUpX7txUlJiGtP5nFWW+J7fAeeHQGrW2bE6D2pHkiXTB4yw3F/mrZcxKIu
 tM0Cu6BAeqgoXyq2hG6fAJMzMhUhazGvjbGVqTR/vJdCbQzbc//YlyV9A4rr17b8g1O8
 g8cWyftSH9cP+hEc/rzoYCAbrPgpMelW677tvchnRgOmTQJKNR2IyjV3mfsLurRYy3R5
 XOJQ==
X-Gm-Message-State: AFq9FYJT+HtLte3N4TM4B5SkQ96bF5phqa0XEP6Q3LcGymZPVjs7jojE
 smH+P23wxBVj/VvgM3JuE+K2uvcZ4/Efazfb7gGIVtDafJnmOZag/C49
X-Gm-Gg: AYBFou1LfZ6nSean8W+ewPTDhKHgFZKfoOiPGnh8j9DQtJtUSDZ1tHY8HQiv83rU+lR
 7NDEnMBEEK5xAHR6Ll94/e5eOlE0JaY5KvaUYOtAScjLdQtSazSRvNQmKjMWCpXXcRWLsOAWxoY
 68wJ028cxWK8ntYz0ZXZ0iYkUi9UtPeOuEj+xFCwG3VLJwODH44M4Y/y/Uzuedo7Wu6e676gt6S
 v+804zn7X7qZnzMdARJQ6IOOXoBSm8AMXL4wqeQ8VTDUWwGAraJu1PS9LNS5duKkg6tHs9kdbr3
 n9fK6Wv9uqgwgA8A9RrPsFNKNe2cfaJrDDRB5PbgKeCu38SJ76+Tc9wb5TU2+6q+UkO3QZ/TP0G
 ErsMKLvcjpC72zKxl4+U8Mji0tqWFMftj39j7NgqKyEVbnZhNeAsG3spcUMDNTte3bMBXHsagIL
 zh+YI6Rj07I/fBYqB2BhoWkMNfN5DIX0wJwbMtPY1uIkEkClSowMORfguECOwGlyImdHOqQRzbx
 4PiUI6zTmAPtLZf
X-Received: by 2002:a17:90b:3c47:b0:39e:4c97:ce09 with SMTP id
 98e67ed59e1d1-3a4f3b9821amr925227a91.42.1790821397245; 
 Wed, 30 Sep 2026 19:23:17 -0700 (PDT)
Received: from dt-VM.localdomain ([175.152.37.254])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2e300b8fd4csm3943635ad.80.2026.09.30.19.23.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2026 19:23:16 -0700 (PDT)
From: Tao Ding <dingtaodtdt@gmail.com>
X-Google-Original-From: Tao Ding <dingtao0430@163.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, chao.liu@processmission.com, farosas@suse.de,
 lvivier@redhat.com, pbonzini@redhat.com, Tao Ding <dingtao0430@163.com>,
 Alistair Francis <Alistair.Francis@wdc.com>
Subject: [PATCH 3/3] hw/dma: fix k230_gsdma integer handling issues
Date: Thu,  1 Oct 2026 10:22:23 +0800
Message-ID: <20261001022223.8633-4-dingtao0430@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001022223.8633-1-dingtao0430@163.com>
References: <20261001022223.8633-1-dingtao0430@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=dingtaodtdt@gmail.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 30 Sep 2026 23:44:02 -0400
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

Validate the address before subtracting the channel base and use hwaddr 
for channel calculations to prevent unsigned underflow and truncation.

Resolves: Coverity CID 1685516

Reported-by: Alistair Francis <Alistair.Francis@wdc.com>
Signed-off-by: Tao Ding <dingtao0430@163.com>
---
 hw/dma/k230_gsdma.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/dma/k230_gsdma.c b/hw/dma/k230_gsdma.c
index 7635cd19e8..e9a7877e54 100644
--- a/hw/dma/k230_gsdma.c
+++ b/hw/dma/k230_gsdma.c
@@ -300,7 +300,7 @@ static const VMStateDescription vmstate_k230_gsdma = {
 static uint64_t k230_gsdma_read(void *opaque, hwaddr addr, unsigned int size)
 {
     K230GSDMAState *s = K230_GSDMA(opaque);
-    unsigned int ch;
+    hwaddr ch;
     hwaddr ch_off;
     uint64_t ret = 0;
 
@@ -329,6 +329,9 @@ static uint64_t k230_gsdma_read(void *opaque, hwaddr addr, unsigned int size)
         break;
     }
 
+    if (addr < K230_GSDMA_CH_BASE) {
+        goto out;
+    }
     ch = (addr - K230_GSDMA_CH_BASE) / K230_GSDMA_CH_STRIDE;
     ch_off = (addr - K230_GSDMA_CH_BASE) % K230_GSDMA_CH_STRIDE;
     if (ch < K230_GSDMA_NUM_SDMA_CHANNELS) {
@@ -355,6 +358,7 @@ static uint64_t k230_gsdma_read(void *opaque, hwaddr addr, unsigned int size)
         }
     }
 
+out:
     trace_k230_gsdma_read(addr, size, ret);
     return ret;
 }
-- 
2.43.0


