Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 491EBC021A4
	for <qemu-riscv@archiver.kernel.org>; Mon, 24 Feb 2025 19:10:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tmdpL-0005kU-7K; Mon, 24 Feb 2025 14:09:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tmdok-0005bP-9Q
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2025 14:08:42 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tmdoi-0004mG-Eq
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2025 14:08:38 -0500
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-220c665ef4cso83363335ad.3
 for <qemu-riscv@nongnu.org>; Mon, 24 Feb 2025 11:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1740424115; x=1741028915; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H5YKF3HsuWUbiaPLrEWpm5TtTdaWovSQz+CQU4mRVEM=;
 b=dpK6cZ2QMtzDHQv4rI3ryw/lvFDX3IXr1yUy19U0jFus831iUieovlFiO0OE8EO6O3
 gAkmv/LFc/bHOXBk3NZq+abJ7ewRE3Mc/i+qifDaBDp4CWFoF9KryvemJR4PS1sw5vEK
 AbXp3NQt/jwSxPTPZwp9IsVw6X2VI98neo5YrEArfYHDNh/eIamu5ceFBfUxHDqBDHCR
 ulJY1ABVN4RvSfu4rfbn4ZA8J0bmKRUCght9bhA5BDHenDw7pfAHWuFBN9ieHQI9+/pg
 7y7NsEQi47NBv7gBfN7BjmSWLqKz8LQDFOzUFXImYwDWJJw4+Gq6XZtN73XDytjBfGPZ
 Bnpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740424115; x=1741028915;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H5YKF3HsuWUbiaPLrEWpm5TtTdaWovSQz+CQU4mRVEM=;
 b=olA1xd2gYnZpHqgUYmGXHfSdiVFfsT0d1eYtSN+u85f7c9s2iB0jLvPrjBlHiCWMsU
 T64Jjw6T8zuHH4VbqHEUdOBq55ecHCn8/HCBhyRCHupa1gLtdiqAqzDocLX6/28XgEGL
 7g0hokXZwv8PZbYBUmuxK+ctGiUh6meFl5wB70gUw9V5Cx6mVQsmuNuXr1okp4K9uPUk
 KrexD46Za6oWkbcdMinusWAvlEAL87S2744X4AO4FEfC0zMALHqMFCog/TGRGaUyaW5h
 6o2uqblPjGNGjqZfJA1+q/duBynnpRqwRV7hpOtOvH5GEwaLakId8JYqil6yfsvOnVWv
 RNug==
X-Gm-Message-State: AOJu0YxG/QIRUHy55qiucUQDoo3Y7dE324d9PlHB3B1rKemUA9Q1r0SZ
 FgWFFzcSskjrQAdpFOWHS6ktg4PClF80ELO8fIodCTkJ8DuRImFOm8KbjOSfPg8=
X-Gm-Gg: ASbGncshE9xfI1HqJQtchyQn+F5oMff68xuJB8pumDVCX9lW4vno4rQjlMH5OlKj0UQ
 zlXwo0JRwAIw79U1PRS6no2O9GgU+gFr3CEjhHRQ5CXicse4ZKkJd65xRk15uZsj1ldP1jutb1a
 /lTUxNpPukIZoDaGvwEbWtVj6YzSxLz83wOh7+3ESzcVzOnL8x8d86YRgU0Wh7pXi1IJJtPtrMY
 27H3D5kQk5kDOIy38UQbUpjJ+S2qLH869Jj9LkiVx09kq5Fb2c+1r+TCmwXxGOYtpYNsJHBpcWA
 QIXrFHJmPvnBwPtcRTMC+l0R//5vUg==
X-Google-Smtp-Source: AGHT+IHFR7q/79SWVCsSWTocNfY/RAdad1m2qaTUQPu16hfUp1z4NaZP/483YVQ8VlKndyGV0Z9boA==
X-Received: by 2002:a17:902:f544:b0:215:6cb2:7877 with SMTP id
 d9443c01a7336-2219ff827cdmr287717055ad.4.1740424114844; 
 Mon, 24 Feb 2025 11:08:34 -0800 (PST)
Received: from grind.. ([2804:7f0:bcc0:6edb:f473:a9df:d551:443b])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-220d545df28sm183583155ad.153.2025.02.24.11.08.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2025 11:08:34 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 01/11] hw/riscv/riscv-iommu.h: add missing headers
Date: Mon, 24 Feb 2025 16:08:16 -0300
Message-ID: <20250224190826.1858473-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250224190826.1858473-1-dbarboza@ventanamicro.com>
References: <20250224190826.1858473-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x632.google.com
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

This header is incomplete, i.e. it is using definitions that are being
supplied by the .c files that are including it.

Adding this header into a fresh .c file will result in errors:

/home/danielhb/work/qemu/hw/riscv/riscv-iommu.h:30:17: error: field ‘parent_obj’ has incomplete type
   30 |     DeviceState parent_obj;
      |                 ^~~~~~~~~~
/home/danielhb/work/qemu/hw/riscv/riscv-iommu.h:50:5: error: unknown type name ‘dma_addr_t’; did you mean ‘in_addr_t’?
   50 |     dma_addr_t cq_addr;   /* Command queue base physical address */
      |     ^~~~~~~~~~
      |     in_addr_t
(...)
/home/danielhb/work/qemu/hw/riscv/riscv-iommu.h:62:5: error: unknown type name ‘QemuThread’; did you mean ‘GThread’?
   62 |     QemuThread core_proc; /* Background processing thread */
      |     ^~~~~~~~~~
      |     GThread
/home/danielhb/work/qemu/hw/riscv/riscv-iommu.h:63:5: error: unknown type name ‘QemuCond’
   63 |     QemuCond core_cond;   /* Background processing wake up signal */
      |     ^~~~~~~~
/home/danielhb/work/qemu/hw/riscv/riscv-iommu.h:71:18: error: field ‘trap_as’ has incomplete type
   71 |     AddressSpace trap_as;
      |                  ^~~~~~~
/home/danielhb/work/qemu/hw/riscv/riscv-iommu.h:72:18: error: field ‘trap_mr’ has incomplete type
   72 |     MemoryRegion trap_mr;
      |                  ^~~~~~~
/home/danielhb/work/qemu/hw/riscv/riscv-iommu.h:80:18: error: field ‘regs_mr’ has incomplete type
   80 |     MemoryRegion regs_mr;
      |                  ^~~~~~~

Fix it by adding the missing headers for these definitions.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/riscv-iommu.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/riscv/riscv-iommu.h b/hw/riscv/riscv-iommu.h
index fa8a50fa24..d2608d2f9b 100644
--- a/hw/riscv/riscv-iommu.h
+++ b/hw/riscv/riscv-iommu.h
@@ -20,6 +20,8 @@
 #define HW_RISCV_IOMMU_STATE_H
 
 #include "qom/object.h"
+#include "hw/qdev-properties.h"
+#include "system/dma.h"
 #include "hw/riscv/iommu.h"
 #include "hw/riscv/riscv-iommu-bits.h"
 
-- 
2.48.1


