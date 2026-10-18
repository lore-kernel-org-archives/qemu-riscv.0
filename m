Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3F7ACCF2C4
	for <qemu-riscv@archiver.kernel.org>; Sun, 18 Oct 2026 14:11:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xIRb3-0005q8-7a; Sun, 18 Oct 2026 10:10:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dingtaodtdt@gmail.com>)
 id 1xIRb1-0005pL-I5
 for qemu-riscv@nongnu.org; Sun, 18 Oct 2026 10:10:43 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dingtaodtdt@gmail.com>)
 id 1xIRay-000514-Tw
 for qemu-riscv@nongnu.org; Sun, 18 Oct 2026 10:10:42 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-8a05b210703so222530b3a.0
 for <qemu-riscv@nongnu.org>; Sun, 18 Oct 2026 07:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792332639; x=1792937439; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=IWmaGYAhUbRIolbD7GEvcJTHQYZVhBb4kKhSSqPzT48=;
 b=SNIC+QBnmXIHk5AWC0JtQ9NGVoZWUs1CJsiuagG1LT3Wx07qQFBnzYWPOpn9hk++wo
 3ZJuVk5f/kdL+zfRCN15zhuN7iDg/j4LzjRttOnlF8OnYEChAxd58W/yMw48uk265Q6O
 6cuyGqdsIYB+6EUYswfvpBgQ0fA8/iua6QJ/1MPKxy8NvvBG2fJMrp/kTjyXK7Ic0ucu
 faN8AHt7koyQcSBjg1zpPwkBaMCfn0GPZctaiW5Dj7H54+KcN+3wPChORDCGUt54obt0
 zjQeM9AV1J/mJ33u1DK8ZmDzLoBuzDwfmXgXT/1X1FPaYzHGXxIeQXOkhFBAXrEx5swg
 ABVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792332639; x=1792937439;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=IWmaGYAhUbRIolbD7GEvcJTHQYZVhBb4kKhSSqPzT48=;
 b=jQVhzmpVkAex+4jn2J+UnEwpyB5ESxo4XbiAclWYw3ETK0XOX8f9KeQV7oUgyf5DsB
 jqndKbV8M24ASO2aopDdyFSJadldZ0fqlW3cX7tOeKjz7UX5TOj+FNVCj2FUjv+U4nli
 trVH3Y/LOkFZNsirrhq6OVc2Bc7FJOT6nJajFUB3f5CgZO/WYrlxIz074JSxzRLNYzIj
 TsgWUCu6xQX1JyNNNdl/9etdQsLVq8geplmFvVvRZ7cA+VfpnJsGMhXTGnA9q9Z+am8O
 DYgt2ho/zoir+QciUicDtzmNOffTLSGOc6iC84GdmwhzjK1wT2wmujUl9X8LBtU2xL3L
 ezYw==
X-Gm-Message-State: AFq9FYK9+biQIs48MnHmRefs+4S4An/GrbKx/HJu8Nhnjx5m2fWna9Nj
 LyRa8yjP+lYXqK2YttxCxz+sRTwT95V0q/4cifAejDcQKTZhEL3Ba4k6
X-Gm-Gg: AYBFou07oyds8MfkpWfxNxBHRR068U4dh/CSt2BkOowpxKaZLF4VP+l9ojWN/279YbM
 QNP4HE1nAxgUPBm4iIN24CPU0KQiAUii0G4dytoZmOlUlOonwwT+K8mk2r8O5M8QLk+o2yfrT18
 AYnKyccavm6BROezpZl9SYnlQgVIzHZbY+iTrRS/65ZfkW3cxUXCEQoeHu+If+C9fOlvogqrrn/
 a6/aim4rl/rJE0ytUdDWYxbfjmZvFIEyv1GFQW5yy1ANcIlVUhWE/T5lF5wDA6YLMAlEM9tUQUH
 a7oWAqnD2t6YSadw3ve6gIneJsNh2VmuAj1H20tu8WX2r5DDqlJtLBQ1ae80HEqeowFbW9Ewc6P
 VrPbqqnRHG0HHYIyvRHUjegoK8H+UcWqoewQy3P7HZqzvonhjfSvKWe0bz5t3IvlgSQ/KmA4RgB
 OlgbJdyG4I6JjW2l0R9Dv+WpHFzPXAqbMYX5IpD4BpiRh+Jjm6OzmfAQNy4jDuq4nk4cZnaePZ4
 yJEKnwV2a9afakd4A==
X-Received: by 2002:a05:6a20:c5aa:b0:3dd:a195:fa22 with SMTP id
 adf61e73a8af0-3e22606feebmr4232562637.71.1792332639458; 
 Sun, 18 Oct 2026 07:10:39 -0700 (PDT)
Received: from dt-VM.localdomain ([101.204.150.66])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-89f57653ea9sm2949430b3a.32.2026.10.18.07.10.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Oct 2026 07:10:39 -0700 (PDT)
From: Tao Ding <dingtaodtdt@gmail.com>
X-Google-Original-From: Tao Ding <dingtao0430@163.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, chao.liu@processmission.com, farosas@suse.de,
 lvivier@redhat.com, pbonzini@redhat.com, Alistair.Francis@wdc.com,
 Tao Ding <dingtao0430@163.com>
Subject: [PATCH v3 5/5] hw/dma: fix k230_gsdma integer handling issues
Date: Sun, 18 Oct 2026 22:10:06 +0800
Message-ID: <20261018141006.16398-6-dingtao0430@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261018141006.16398-1-dingtao0430@163.com>
References: <20261018141006.16398-1-dingtao0430@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=dingtaodtdt@gmail.com; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Separate global and channel register handling to prevent unsigned address underflow 
when calculating GSDMA channel offsets.

Resolves: Coverity CID 1685514

Reported-by: Alistair Francis <Alistair.Francis@wdc.com>
Signed-off-by: Tao Ding <dingtao0430@163.com>
---
 hw/dma/k230_gsdma.c | 84 ++++++++++++++++++++++-----------------------
 1 file changed, 42 insertions(+), 42 deletions(-)

diff --git a/hw/dma/k230_gsdma.c b/hw/dma/k230_gsdma.c
index 7635cd19e8..bd6db9e64d 100644
--- a/hw/dma/k230_gsdma.c
+++ b/hw/dma/k230_gsdma.c
@@ -304,54 +304,54 @@ static uint64_t k230_gsdma_read(void *opaque, hwaddr addr, unsigned int size)
     hwaddr ch_off;
     uint64_t ret = 0;
 
-    switch (addr) {
-    case K230_GSDMA_DMA_CH_EN:
-        ret = s->dma_ch_en;
-        break;
-    case K230_GSDMA_DMA_INT_MASK:
-        ret = s->dma_int_mask;
-        break;
-    case K230_GSDMA_DMA_INT_STAT:
-        ret = s->dma_int_stat;
-        break;
-    case K230_GSDMA_DMA_CFG:
-        ret = s->dma_cfg;
-        break;
-    case K230_GSDMA_DMA_WEIGHT:
-        ret = s->dma_weight;
-        break;
-    default:
-        if (addr < K230_GSDMA_CH_BASE) {
-            qemu_log_mask(LOG_GUEST_ERROR,
-                        "%s: not implement gdma at offset 0x%" HWADDR_PRIx
-                        "\n", __func__, addr);
-        }
-        break;
-    }
-
-    ch = (addr - K230_GSDMA_CH_BASE) / K230_GSDMA_CH_STRIDE;
-    ch_off = (addr - K230_GSDMA_CH_BASE) % K230_GSDMA_CH_STRIDE;
-    if (ch < K230_GSDMA_NUM_SDMA_CHANNELS) {
-        switch (ch_off) {
-        case K230_GSDMA_CH_CTL:
-            break;
-        case K230_GSDMA_CH_STATUS:
-            ret = s->channels[ch].status;
+    if (addr < K230_GSDMA_CH_BASE) {
+        switch (addr) {
+        case K230_GSDMA_DMA_CH_EN:
+            ret = s->dma_ch_en;
             break;
-        case K230_GSDMA_CH_CFG:
-            ret = s->channels[ch].cfg;
+        case K230_GSDMA_DMA_INT_MASK:
+            ret = s->dma_int_mask;
             break;
-        case K230_GSDMA_CH_USR_DATA:
-            ret = s->channels[ch].usr_data;
+        case K230_GSDMA_DMA_INT_STAT:
+            ret = s->dma_int_stat;
             break;
-        case K230_GSDMA_CH_LLT_SADDR:
-            ret = s->channels[ch].llt_saddr;
+        case K230_GSDMA_DMA_CFG:
+            ret = s->dma_cfg;
             break;
-        case K230_GSDMA_CH_CURRENT_LLT:
-            ret = s->channels[ch].current_llt;
+        case K230_GSDMA_DMA_WEIGHT:
+            ret = s->dma_weight;
             break;
         default:
-            break;
+            qemu_log_mask(LOG_GUEST_ERROR,
+                        "%s: not implement gdma at offset 0x%" HWADDR_PRIx
+                        "\n", __func__, addr);
+            return ret;
+        }
+    } else {
+        ch = (addr - K230_GSDMA_CH_BASE) / K230_GSDMA_CH_STRIDE;
+        ch_off = (addr - K230_GSDMA_CH_BASE) % K230_GSDMA_CH_STRIDE;
+        if (ch < K230_GSDMA_NUM_SDMA_CHANNELS) {
+            switch (ch_off) {
+            case K230_GSDMA_CH_CTL:
+                break;
+            case K230_GSDMA_CH_STATUS:
+                ret = s->channels[ch].status;
+                break;
+            case K230_GSDMA_CH_CFG:
+                ret = s->channels[ch].cfg;
+                break;
+            case K230_GSDMA_CH_USR_DATA:
+                ret = s->channels[ch].usr_data;
+                break;
+            case K230_GSDMA_CH_LLT_SADDR:
+                ret = s->channels[ch].llt_saddr;
+                break;
+            case K230_GSDMA_CH_CURRENT_LLT:
+                ret = s->channels[ch].current_llt;
+                break;
+            default:
+                break;
+            }
         }
     }
 
-- 
2.43.0


