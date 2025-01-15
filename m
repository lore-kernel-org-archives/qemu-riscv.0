Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A14DCC02180
	for <qemu-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 06:48:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tXxCQ-0002Dq-Sc; Wed, 15 Jan 2025 01:48:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1tXxCJ-0002D9-Vy
 for qemu-riscv@nongnu.org; Wed, 15 Jan 2025 01:48:17 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1tXxCF-0000ok-I4
 for qemu-riscv@nongnu.org; Wed, 15 Jan 2025 01:48:15 -0500
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-216426b0865so111799785ad.0
 for <qemu-riscv@nongnu.org>; Tue, 14 Jan 2025 22:48:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1736923689; x=1737528489; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TWkLrilyr6xgAqOGuDM3wLiIgr0K8L2HbMAIGQO6peE=;
 b=N+0ksGyoMmEzXz1To9WJRR0f7i9OkY+mAh9wJAiRVCBs7rWBqZiS5cr03bAGH7C3C1
 Zco6MldLU2J/RhUXb8zfjkjhZmmPqnEn39YRfpJJX92/+kkNcgCZyGckLZjgXuRckkPx
 YV0cW/bKzb6xhNtSEepErxodFKDh8qBLfQkcQ6+jD/4uI8kRL7j5A5YeexTt/oUWduCE
 HVa71MjGQ4MD23g8iPyXlSI+tstGNMl7vnsSAISumbrOi4fQ9wk4pDAQRlY3SQiFwSG0
 rIDE+6GoYJ/aFxWqGTcDzMcEY325em0LQQQSm29WNfyIvyMTQMIhlTN98c3QwD2/ucFS
 W58A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736923689; x=1737528489;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TWkLrilyr6xgAqOGuDM3wLiIgr0K8L2HbMAIGQO6peE=;
 b=b4a7TBn923PLSa6X6pZhMRxp5UwXyqGi9FKpquZj2e/j2fV0e31ryzPZrBoJtjMIR3
 dcewSy+6DLePX+/LdtQLVgTEpmoJ2lpCUFKKOEjXO7CEOjRxs18FaFlpe+ukmrnH46GO
 ZrQJkEX7esjU9RFDuO4FfoHUyQfXVfBFHtR+KtL1yoIKfopJlGJ9n3u9evuvdBSU8uvj
 rln9+yUOUvzWu4ECEdtaFRdWl6wYwa2r518YesNpLija4hP9LcIS78e9POIGf5Nj4r+F
 JUhHZuV+ia2daBERH8WydrW8LfA6eFRs5lENoUFe5uqOUBTH2rQTvED4s16dw/8qEnG7
 Wpxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVg8982IPoAs+8ELZiXLlWOrIcb0C4VzzlxHNeVogLV3h1Ledfajk20TNOkuQg5X8pl5/By90FM7HPV@nongnu.org
X-Gm-Message-State: AOJu0YzJQMd3zSiIuRmVIrkwatO8vzbYkimt6xE2I4GfFNCpjY2Nfx2n
 Msy/ccX7z6ilnYNO/hOTOw+Ah9ap8V0tnQHFugMRR0zepVxJ3JCUSo1Zf7Jt46k=
X-Gm-Gg: ASbGncvPGkxz3c78E0oymt5p4HgRsPxBQDkuHYm0CtIejZ1yxjlCatSLMKEe7+oksLg
 U72JJZqEqg570prxPGX4YXTKUjj5muk8j2aht+2bfZvbxJEyLLJVoOTDqMV7f0idtbzzCF5uVv9
 FLidtDI7z1Uhuplxobn9JOxdukpoWIkn2rFenqME9Bgc9k/IVfRxy+CsVCso0yTlxOF3iI3VxVL
 poV3nWnwSDY2iGeez0RzYEvNdr3FZm5PiRnA9LZGNRHWb16u9T+4oV8TZo3Ay5F8HA8HljwPasr
 D1CzDyeo
X-Google-Smtp-Source: AGHT+IFtX0RfcuIqzT4HpX9o5JyJaamXw0DDwGxRPgtLRRJ+wL4Z+dE8eqJ9misaQMdEyocMJ2mqGw==
X-Received: by 2002:a05:6a00:2908:b0:71e:1722:d019 with SMTP id
 d2e1a72fcca58-72d21ffd1f8mr35978605b3a.22.1736923688701; 
 Tue, 14 Jan 2025 22:48:08 -0800 (PST)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72d4067ee81sm8668470b3a.132.2025.01.14.22.48.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2025 22:48:08 -0800 (PST)
From: Jason Chien <jason.chien@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Jason Chien <jason.chien@sifive.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v2 1/2] hw/riscv/riscv-iommu: Remove redundant struct members
Date: Wed, 15 Jan 2025 14:47:36 +0800
Message-ID: <20250115064737.16350-1-jason.chien@sifive.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=jason.chien@sifive.com; helo=mail-pl1-x62d.google.com
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

Initially, the IOMMU would create a thread, but this thread was removed in
the merged version. The struct members for thread control should have been
removed as well, but they were not removed at that time.

Signed-off-by: Jason Chien <jason.chien@sifive.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 hw/riscv/riscv-iommu.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/hw/riscv/riscv-iommu.h b/hw/riscv/riscv-iommu.h
index 9424989df4..fa8a50fa24 100644
--- a/hw/riscv/riscv-iommu.h
+++ b/hw/riscv/riscv-iommu.h
@@ -58,11 +58,6 @@ struct RISCVIOMMUState {
     /* interrupt notifier */
     void (*notify)(RISCVIOMMUState *iommu, unsigned vector);
 
-    /* IOMMU State Machine */
-    QemuThread core_proc; /* Background processing thread */
-    QemuCond core_cond;   /* Background processing wake up signal */
-    unsigned core_exec;   /* Processing thread execution actions */
-
     /* IOMMU target address space */
     AddressSpace *target_as;
     MemoryRegion *target_mr;
-- 
2.43.2


