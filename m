Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6BFDCCF9E0
	for <qemu-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 08:51:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vDfPu-0007DY-Vy; Tue, 28 Oct 2025 04:51:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1vDfPk-0007Cw-LV
 for qemu-riscv@nongnu.org; Tue, 28 Oct 2025 04:50:49 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1vDfPe-0006vy-Nm
 for qemu-riscv@nongnu.org; Tue, 28 Oct 2025 04:50:48 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-33e27cda4d7so6936113a91.0
 for <qemu-riscv@nongnu.org>; Tue, 28 Oct 2025 01:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1761641439; x=1762246239; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2L3ORvZ0utAMczkIOjUp0Iup2eyNQq529NIEmNSgVxY=;
 b=lo1G6s6BlAN0GfCylTtGASb74Zgwj7pj4YQnDBEPlNT//Yi0HhdzJBp7vQ6wWqwNGS
 vL8YJ8soKWdoor5vUhbwWm6dNMJj2BorJ/pm1qCLUnB54XD3vFprSwgeJxkBs9eGXUPn
 ozBi0xUqFujU/wE9TwUoIVgapLQRLnNQw0oxJuOTWtgX6lOST60e5N6PFhxJ/Do2H1sg
 iffhd+E/skPApFVh2c20SMN4dc0C+0aqL8EGxN9pKnNaEojPGFW/UX5MU2aNOWN7f/Wm
 Vgkugafii0vUZOl+KuLyFJxpNEqmU89bUdlxgKg5oN/fMJq8GgMEGv2X4Qt5eD6TVSvR
 RF2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761641439; x=1762246239;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2L3ORvZ0utAMczkIOjUp0Iup2eyNQq529NIEmNSgVxY=;
 b=TARaLm2+N4NuUi9rIojgTUywXaHqrNTRCS1nZQEuWfPkpEiuMyBIps/+KCLr7trbOj
 nUFjzD7pS5q3UTO1shYlvkPOxzMXsR2SJWpWHNwgUKMyNt/CftgEwHFOgYFOjs6AVozl
 VK6MRzhxwPvd5zWUP9ydnysGu8+I1Vn+b574es0yYlEPpJkf0mkLZbI8d1RBriXa6Anf
 yLmIJWw9ka1ZYuk/bq9gNCBL/8kK3f49MozVvKUI7lvA8uzgndBhnB7kFuz0iUOPYQ2H
 N4zFkqQ5zSJN6cHuEm35WWfKg1PlfgoPd9L1jMg9r1pmuf/HG5qFPa89Db9nOWZ0kuQK
 GF1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwPtMeywTSF7aG2YZM3LhtElNNWQbQLsCzz8cjH4pKfJl4DFFWzdJnbis4oEJOl1fIqgXsbaCb8P2O@nongnu.org
X-Gm-Message-State: AOJu0YzLNZgkacMe+Wr02Wnf9zr8Byqej1M00WVZO7Hir1+oe/U4UBf0
 RvrbTHDmAzJrMcnL8nadKP2PJ94LRJ3uKqr/yYzZcoV6s7ppYdaSFMCYDb/u7I/7xgVRpmOGfKj
 emwOTSyk=
X-Gm-Gg: ASbGnct3FR1vhK/b8y2YjNpmdCXGRX/2k1wZuq92AUyzbmG/SGh7TBL2mnWdcRYr2P1
 oN2XF2ctrFKG4AfLKMfqdXO4cgwQ3m5qs5ON0hn2JIz7VJjBq6MbFvzpVjEB9sNZMfHuYKSxGId
 h32fKDRRlxs6vRHLX/PhuT7c8UsskxUl0X5zCY0eNU5GE2VLXznqHdS2syKyiccHWdYTQ7B6eMb
 TDsBqMndA4hq867OcbOCp/d8cY95pqZXIhZ556BhMcWOLr6ph4CkV1p2h+tkL1Zx/xl+wJg5Si7
 BfbHS1ie1eXMSlNomnWlBqwWkTz7euIYHYg5Jd9JFeJ8HKTIn3SfZh2YQGxAKlqsBBub+kZj9Yo
 ooajBt4PPksH23oNFBUQjJjQ+hmTnHr/nXOHXA5EufY+oJa6oUb1Wnf78lN2RlTR9j47gtSjjmZ
 Wn+XXmNa3F3iRh13QO/B6cEB6z8wE=
X-Google-Smtp-Source: AGHT+IHwUy0E7zt/UbtNzZxKpZdwaliWI3ljUlhUVXX9YTVFeXn6T8CEVp+QMYWTmgqP6vHrp5l9aA==
X-Received: by 2002:a17:90a:e183:b0:32b:d8a9:8725 with SMTP id
 98e67ed59e1d1-340289a2ab8mr2968807a91.18.1761641437995; 
 Tue, 28 Oct 2025 01:50:37 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3402a60ff57sm833473a91.12.2025.10.28.01.50.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Oct 2025 01:50:37 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs),
 Frank Chang <frank.chang@sifive.com>
Subject: [PATCH] hw/riscv: riscv-iommu: Don't look up DDT cache in Off and
 Bare modes
Date: Tue, 28 Oct 2025 16:50:32 +0800
Message-ID: <20251028085032.2053569-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1034.google.com
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

From: Frank Chang <frank.chang@sifive.com>

According to the RISC-V IOMMU specification:

* When ddtp.iommu_mode is set to Off, there is no DDT look-up, and an "All
  inbound transactions disallowed" fault (cause = 256) is reported for any
  inbound transaction.

* When ddtp.iommu_mode is set to Bare, there is no DDT look-up, and the
  translated address is the same as the IOVA, unless the transaction type
  is disallowed (cause = 260).

In the current implementation, the DDT cache is incorrectly looked up
even when ddtp.iommu_mode is set to Off or Bare. This may result in
unintended cache hits.

Therefore, the DDT cache must not be looked up when ddtp.iommu_mode is
set to Off or Bare. For other modes, software is required to issue cache
invalidation commands before any inbound transactions.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 hw/riscv/riscv-iommu.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
index b33c7fe3259..95db811f125 100644
--- a/hw/riscv/riscv-iommu.c
+++ b/hw/riscv/riscv-iommu.c
@@ -1290,13 +1290,18 @@ static RISCVIOMMUContext *riscv_iommu_ctx(RISCVIOMMUState *s,
         .devid = devid,
         .process_id = process_id,
     };
+    unsigned mode = get_field(s->ddtp, RISCV_IOMMU_DDTP_MODE);
 
     ctx_cache = g_hash_table_ref(s->ctx_cache);
-    ctx = g_hash_table_lookup(ctx_cache, &key);
 
-    if (ctx && (ctx->tc & RISCV_IOMMU_DC_TC_V)) {
-        *ref = ctx_cache;
-        return ctx;
+    if (mode != RISCV_IOMMU_DDTP_MODE_OFF &&
+        mode != RISCV_IOMMU_DDTP_MODE_BARE) {
+        ctx = g_hash_table_lookup(ctx_cache, &key);
+
+        if (ctx && (ctx->tc & RISCV_IOMMU_DC_TC_V)) {
+            *ref = ctx_cache;
+            return ctx;
+        }
     }
 
     ctx = g_new0(RISCVIOMMUContext, 1);
-- 
2.43.0


