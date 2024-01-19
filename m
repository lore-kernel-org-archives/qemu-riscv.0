Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CAFEC4725D
	for <qemu-riscv@archiver.kernel.org>; Fri, 19 Jan 2024 11:37:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rQnA8-000237-0b; Fri, 19 Jan 2024 06:35:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQnA5-0001zs-91
 for qemu-riscv@nongnu.org; Fri, 19 Jan 2024 06:35:49 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQnA2-0000H5-9R
 for qemu-riscv@nongnu.org; Fri, 19 Jan 2024 06:35:48 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40e800461baso7220445e9.3
 for <qemu-riscv@nongnu.org>; Fri, 19 Jan 2024 03:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705664145; x=1706268945; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PRuBRVEWPg8k5cL0C9qDEuFeMVHGZcEBcpFoyN0cEVQ=;
 b=EMVAxAMrrzUnjsnO7ApWlfOIu7VNaPwPDdRXqzgzqvcoRUYR2UMjH/dU9JDn5o3tB2
 g4sPh+YrgMNowicgedvP/qPWXRDTJeB0mQurnCO2bBAUROZwOh18nksK2ZfsfD1cT6j5
 pB42Hh4d1+usxIxhOaTkSnzG1mBnu9xD/LEUO+65bmGlUXtfgwgrkot5T/bzfkEctact
 7z5N8TIYa8AOpxVWyWRgXhnc5G4JjeNNUna2QJUho23GrzfWr3dW5pOb0/UI9gFqa3rN
 op4PS+HMsB0neOKJgtyPbp0njObQjitiAJixKF4AgFpGh4eyPS+ZRE4ApmY8+yJ0ezRC
 RFoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705664145; x=1706268945;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PRuBRVEWPg8k5cL0C9qDEuFeMVHGZcEBcpFoyN0cEVQ=;
 b=oNNmETBtGh6rlgE2v0wHgeKshy1mv+ivUOZB/hpZKJ3wY37aa46n6kgK00BwwIxA2u
 y5mfoZzciBskS6wzOHlsC1aEvltKlAnB98t9uE/Lw81DmEdotyLzs+sC8DqDK+B7vGiJ
 YlZsOkRUAA0L7Om1IvBvXlt19Ms/v1YzEwFUZaI1i4dzA0BRZUQWgTrDpNm/yAl+KREz
 SmJC5eTxJzsR4zRRxM98EkDcLptNkxS0U/rVMdRajYTmoQxBBdOW60lR8iA1XgLMck0K
 pOtXWZeRohdqzBNNVlFa2tC7YJl6GrRwgkOz6CJn2XaoOSLkp6UfC8VtpvYTvCjuyZKJ
 reUw==
X-Gm-Message-State: AOJu0Ywyn2vgslcibQMo3y5reUZQaND3G8YfW8vhxVxTnMt4TWDc559J
 3JDB1WWvwVLekPWtzBvcE87wx/m18C4r6svQp93bEyb1pQspqzRnlGBnqBWzmEM=
X-Google-Smtp-Source: AGHT+IF798xCajTRjCTkS072PtElk6PHFEgZ7W5QaajSvhfp1HsTQ3Ae0P1hWFiKJ3OnCfiVTr8f7A==
X-Received: by 2002:a7b:c4d4:0:b0:40e:7611:e52f with SMTP id
 g20-20020a7bc4d4000000b0040e7611e52fmr568136wmk.315.1705664144965; 
 Fri, 19 Jan 2024 03:35:44 -0800 (PST)
Received: from localhost.localdomain (91-163-26-170.subs.proxad.net.
 [91.163.26.170]) by smtp.gmail.com with ESMTPSA id
 r19-20020a05600c459300b0040e42391a12sm28532667wmo.13.2024.01.19.03.35.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 19 Jan 2024 03:35:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 08/36] accel/tcg: Remove tb_invalidate_phys_page() from system
 emulation
Date: Fri, 19 Jan 2024 12:34:37 +0100
Message-ID: <20240119113507.31951-9-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240119113507.31951-1-philmd@linaro.org>
References: <20240119113507.31951-1-philmd@linaro.org>
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

Since previous commit, tb_invalidate_phys_page() is not used
anymore in system emulation. Make it static for user emulation
and remove its public declaration in "exec/translate-all.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20231130205600.35727-1-philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/translate-all.h |  1 -
 accel/tcg/tb-maint.c         | 24 +-----------------------
 2 files changed, 1 insertion(+), 24 deletions(-)

diff --git a/include/exec/translate-all.h b/include/exec/translate-all.h
index 88602ae8d8..85c9460c7c 100644
--- a/include/exec/translate-all.h
+++ b/include/exec/translate-all.h
@@ -23,7 +23,6 @@
 
 
 /* translate-all.c */
-void tb_invalidate_phys_page(tb_page_addr_t addr);
 void tb_check_watchpoint(CPUState *cpu, uintptr_t retaddr);
 
 #ifdef CONFIG_USER_ONLY
diff --git a/accel/tcg/tb-maint.c b/accel/tcg/tb-maint.c
index 3d2a896220..da39a43bd8 100644
--- a/accel/tcg/tb-maint.c
+++ b/accel/tcg/tb-maint.c
@@ -1021,7 +1021,7 @@ void tb_invalidate_phys_range(tb_page_addr_t start, tb_page_addr_t last)
  * Called with mmap_lock held for user-mode emulation
  * NOTE: this function must not be called while a TB is running.
  */
-void tb_invalidate_phys_page(tb_page_addr_t addr)
+static void tb_invalidate_phys_page(tb_page_addr_t addr)
 {
     tb_page_addr_t start, last;
 
@@ -1160,28 +1160,6 @@ tb_invalidate_phys_page_range__locked(struct page_collection *pages,
 #endif
 }
 
-/*
- * Invalidate all TBs which intersect with the target physical
- * address page @addr.
- */
-void tb_invalidate_phys_page(tb_page_addr_t addr)
-{
-    struct page_collection *pages;
-    tb_page_addr_t start, last;
-    PageDesc *p;
-
-    p = page_find(addr >> TARGET_PAGE_BITS);
-    if (p == NULL) {
-        return;
-    }
-
-    start = addr & TARGET_PAGE_MASK;
-    last = addr | ~TARGET_PAGE_MASK;
-    pages = page_collection_lock(start, last);
-    tb_invalidate_phys_page_range__locked(pages, p, start, last, 0);
-    page_collection_unlock(pages);
-}
-
 /*
  * Invalidate all TBs which intersect with the target physical address range
  * [start;last]. NOTE: start and end may refer to *different* physical pages.
-- 
2.41.0


