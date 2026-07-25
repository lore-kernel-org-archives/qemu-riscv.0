Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32FC5C531D0
	for <qemu-riscv@archiver.kernel.org>; Sat, 25 Jul 2026 18:39:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wnhH9-0005ed-2Q; Sat, 25 Jul 2026 14:39:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dubdublan1987@gmail.com>)
 id 1wnfc3-0005Rk-Hp
 for qemu-riscv@nongnu.org; Sat, 25 Jul 2026 12:52:35 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dubdublan1987@gmail.com>)
 id 1wnfc2-0006XW-2d
 for qemu-riscv@nongnu.org; Sat, 25 Jul 2026 12:52:35 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-2cf27856f9cso18715675ad.2
 for <qemu-riscv@nongnu.org>; Sat, 25 Jul 2026 09:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784998352; x=1785603152; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=tovyE2DbLb570DWkXurR66/dN/47WcWTHraH2RaG+7g=;
 b=DBMFCyQiecvVukp6O838O2cnt4RlM/5+qTGnQ9tgdqPoZ+Icp8i0YnEcdu2ObPP8vC
 pSsdA0HzFHJIGuAoiPnUQep4D1PCDIZaA10DhGDl3TIJt8M9EJRx9uFie6LPw6TdJ4n4
 qa2ek3Yni/97BZ4IkKPGbkTJUoBoSG1P/myMHpqUKyrb80uXlh3frrcv9Z4+dMLTED9O
 17bzXyeXylK0x0pRlUGQc26WAqe51iV3OMFv2lCwnDS0GdikNXAFRCfQJHGmlqg9Lz0G
 iodmMU3Izh+H3kr0ff8i+w3ygvNj84vSc8gmvrAHf5pArebbD0yvALH3HWqQWfqXN9MO
 n41g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784998352; x=1785603152;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=tovyE2DbLb570DWkXurR66/dN/47WcWTHraH2RaG+7g=;
 b=K7CkBYWCn0bw6bmeZVFKBM3a0FUXrg9TmVU6KIXdxJtvgHo3gjfdBBkzYS43EDnKjB
 jSMPSmBoFtd0BcNP39UK7ZEubVnz6Iu4kAU57VX2RbVa+Jbd5DMIcr8MJxZdkzzg9KlD
 5U1c/P0i1N6eTBEPK44scsmurku+KTF+ElWmqgluZpJJdJxdJIS4QnYuPYwDBMTZVMeu
 OcpzuU6L/LJA5hKTNNkT7xqTkd6UXAAp8fArAUie82pOFcOoNFdIdYMdN2C79iAlcfRU
 fajzPyTUG6AAKhi1zH5ooTs/Uc94LIqvMKwsYjkY69WXdegaMxA5U8WdcP+5OwMBWewY
 Fv/A==
X-Gm-Message-State: AOJu0YzqIC3/6J2ngjHa+xTOK8LnzfyP2wiXNVeGQ/kLo8yBgW7JZ5MD
 kfHVp5S8f207xUmASR6Q1nzpjo/c04h1ZgquuhzfXC1WeeLMUJYsQ5dQ
X-Gm-Gg: AR+sD10aV1trLv6kV9bgdqtEOHsqO6PvW8sZZBd0pHmDRDkq4OOZHvWbp8VVggurRps
 0qrESEOecjh4dIeOUPTxErwNcyA1MyxPCUWr3ck5x2IccBB6xep9p0JT1X7OB7My2ccVgpnLg94
 tWy0qsGY6lKoA2Pr26XZhkWYBdcso2fWHDUh5nF2DrZ/UcssSTTM2Q+CMp9H4q9MS0SyeZUerzm
 IZriDJVXyOLZYE4zt5lFiL8FEMR4Knv9mW3NjkGBK2SYK3WAQyX6x0oNQp+uzox2kxmmstd8aZ/
 B7PZYFIMk9T5LM1lz/+Dns+wlUd90SGFOO9W2qEaMWJPRsNI5b/MnmmxdWi65Oid5OfVF03uhNX
 FESD5aFlt5AbuDA8f5ZByNmHsQSBEM6lof8Dneyw+j/WcgCs9/IAJ8FBuJOWha7EfcY3XtaDjtP
 2LrD69yGnXyLoQMhiByAnC24A7HLKuUQ==
X-Received: by 2002:a17:902:d4c5:b0:2cf:32bc:9722 with SMTP id
 d9443c01a7336-2cfde866d88mr24961355ad.34.1784998352488; 
 Sat, 25 Jul 2026 09:52:32 -0700 (PDT)
Received: from localhost.localdomain.localdomain ([27.115.61.146])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2cfde81d81csm11027105ad.80.2026.07.25.09.52.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 25 Jul 2026 09:52:32 -0700 (PDT)
From: lanxiaoyun <dubdublan1987@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Alistair.Francis@wdc.com, palmer@dabbelt.com,
 lanxiaoyun1 <dubdublan1987@gmail.com>
Subject: [PATCH v1 1/1] hw/intc: resample level IRQ on PLIC completion
Date: Sun, 26 Jul 2026 00:51:18 +0800
Message-ID: <b946a6859040243e973622b7f038a19c2021db95.1784966571.git.dubdublan1987@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1784966571.git.dubdublan1987@gmail.com>
References: <cover.1784966571.git.dubdublan1987@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=dubdublan1987@gmail.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 25 Jul 2026 14:39:00 -0400
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

From: lanxiaoyun1 <dubdublan1987@gmail.com>

When an interrupt completion message is received, if the interrupt is
level-triggered and still asserted, forward a new interrupt request to
the PLIC core.

This updates the SiFive PLIC IRQ handling so completion rechecks the
current source level and reasserts pending state when the input remains
high, matching the RISC-V PLIC specification.

Signed-off-by: lanxiaoyun1 <dubdublan1987@gmail.com>
---
 hw/intc/sifive_plic.c         | 4 +++-
 include/hw/intc/sifive_plic.h | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index 9c84ff06a9..43f235e329 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -246,6 +246,7 @@ static void sifive_plic_write(void *opaque, hwaddr addr, uint64_t value,
         } else if (contextid == 4) {
             if (value < plic->num_sources) {
                 sifive_plic_set_claimed(plic, value, false);
+                sifive_plic_set_pending(plic, value, !!plic->source[value]);
                 sifive_plic_update(plic);
             }
         } else {
@@ -276,6 +277,7 @@ static void sifive_plic_reset(DeviceState *dev)
     int i;
 
     memset(s->source_priority, 0, sizeof(uint32_t) * s->num_sources);
+    memset(s->source, 0, sizeof(uint32_t) * s->num_sources);
     memset(s->target_priority, 0, sizeof(uint32_t) * s->num_addrs);
     memset(s->pending, 0, sizeof(uint32_t) * s->bitfield_words);
     memset(s->claimed, 0, sizeof(uint32_t) * s->bitfield_words);
@@ -353,7 +355,7 @@ static void parse_hart_config(SiFivePLICState *plic)
 static void sifive_plic_irq_request(void *opaque, int irq, int level)
 {
     SiFivePLICState *s = opaque;
-
+    s->source[irq] = !!level;
     if (level > 0) {
         sifive_plic_set_pending(s, irq, true);
         sifive_plic_update(s);
diff --git a/include/hw/intc/sifive_plic.h b/include/hw/intc/sifive_plic.h
index 32973dbf28..627a418ba1 100644
--- a/include/hw/intc/sifive_plic.h
+++ b/include/hw/intc/sifive_plic.h
@@ -54,6 +54,7 @@ struct SiFivePLICState {
     uint32_t num_enables;
     PLICAddr *addr_config;
     uint32_t *source_priority;
+    uint32_t *source;
     uint32_t *target_priority;
     uint32_t *pending;
     uint32_t *claimed;
-- 
2.43.0


