Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B316C28B28
	for <qemu-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 18:37:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tuFJX-000534-9f; Mon, 17 Mar 2025 14:35:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tuFJ4-0004h1-Ah
 for qemu-riscv@nongnu.org; Mon, 17 Mar 2025 14:35:24 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tuFIW-0006B7-6k
 for qemu-riscv@nongnu.org; Mon, 17 Mar 2025 14:35:19 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-223594b3c6dso98913785ad.2
 for <qemu-riscv@nongnu.org>; Mon, 17 Mar 2025 11:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742236474; x=1742841274; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rp8GQC6vA5rTxSSazblnkjuLZPjrJAYUOFg9uGM493s=;
 b=lJ3Jk9jgB2vzvglhUh5wIQVJsbOiyjAei3e4E50N9JZJI28cwku5hpR3qtYtpBqJGE
 MH3Tl7qgjJ0ZvtxAP2dnMmNCgFgi/yGaAV2/QkFELTcIrk92Ezlu2VOHA2XwOodUkOQL
 pzTsvFLxo1t7CNfvzrVB2u00NdB/Ivc6PVB4K5YJFn9JWUX85QSAqiIADODX12CrkwGx
 vpYgf6A/pyxgQSDnWi6ZEK0XLAfWE/yIZP2V3nqq8RozXIqSeOkrhhvcJsScIjOo2kON
 6PRlPaFxBqcc29/EABtQUCPZ7wnsXKiEzZupbNPnn4BvMabPxVGUK5Z6E9joHx63sqqK
 3uMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742236474; x=1742841274;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Rp8GQC6vA5rTxSSazblnkjuLZPjrJAYUOFg9uGM493s=;
 b=dgzbsqvwiHQ+v5j44qlQemUSAzJEdlECXu2b48a6HLf5I6oJxL0ikjbkIEWMvW25x3
 90Psrh4AcEhUmPcjR2bAAbo90V4jjinnyPUSuofcY+9bC6PxUeuFu+9PFv6Vh3yedhy5
 SkYWFMwtigVzf5cySeV/M6Di4V6YVq11rjROEi/wxjGZ0ATfUDOd/V9TpbrgGtZOlLSQ
 udMep6PfYe3BjgAs31KpS1A+UgXwIzaNpvMv/2A8CPCzuQF9qvdVfFkxQ6ehSv5roxZB
 88F/0Otd12+uSJPDLjKM6wSK7bzKgYSjMJxO+dF9g4dlHcRz++Hdl0mo0TcE3XhDaYPx
 78sw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbr619lBaOY5ONmZBCMX0PRuWwEo+hu9c1xe54FWC/rhIFXzAG+UM6WUYu5xJufzLHZ+aslTooN91T@nongnu.org
X-Gm-Message-State: AOJu0YyGPyH5dq2nZz0tqFPyNvLOAbYQIAlnuwpxn3SKlRrdADh+0XEW
 +B4fi6KoUos6zR7XQ4kg+s9T8t/jzB/Eg0jcTBbtnIvZrugEp3kqZ7HqR+jDa0g6dZVSbP4gMJF
 B
X-Gm-Gg: ASbGnct9a8PMQC4fXG/wNRHeUsA+P7XmECuRNgzyKg7LD8/uiaNvn7fqAovP7sIWoQc
 Cy1UD9muo+IE3tdIi9wZepI8bUNGgDVToKt5i964utfoRXRzSXyec6DEx7NDX1bk/0nKSU/VUAP
 YyxKch7FzRhY2nU7atj61EvLGhCkUaHJkVQZ4dyzzZUKVp0B5boAyRaOLrs46R+NNe28tFXChcF
 aAlQIVybXJ2R5yjbiPOMXXcNAptNNUt8hONEYSv2kilkWAn6LtRhz8Tbu3QBRajRJvhBk0GtlGP
 rD2j2YQjyRVJymwwe/ENzyU2xYYGkebvoAAG8w1xqo1q
X-Google-Smtp-Source: AGHT+IHGRjUHfsZhtfemIo+dlcyT/9a20csro4vrsnSjWHRpRL87+9vnxPcq6naL2TxBdu+3gDVtPg==
X-Received: by 2002:a05:6a00:9a7:b0:736:6ac4:d204 with SMTP id
 d2e1a72fcca58-73722375218mr14371340b3a.11.1742236473962; 
 Mon, 17 Mar 2025 11:34:33 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73711695a2esm8188770b3a.144.2025.03.17.11.34.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 11:34:33 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org,
 David Hildenbrand <david@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-riscv@nongnu.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, alex.bennee@linaro.org,
 manos.pitsidianakis@linaro.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, kvm@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Peter Xu <peterx@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Anthony PERARD <anthony@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 08/18] exec/memory-internal: remove dependency on cpu.h
Date: Mon, 17 Mar 2025 11:34:07 -0700
Message-Id: <20250317183417.285700-9-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250317183417.285700-1-pierrick.bouvier@linaro.org>
References: <20250317183417.285700-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x62d.google.com
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

Needed so compilation units including it can be common.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/memory-internal.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/exec/memory-internal.h b/include/exec/memory-internal.h
index 100c1237ac2..b729f3b25ad 100644
--- a/include/exec/memory-internal.h
+++ b/include/exec/memory-internal.h
@@ -20,8 +20,6 @@
 #ifndef MEMORY_INTERNAL_H
 #define MEMORY_INTERNAL_H
 
-#include "cpu.h"
-
 #ifndef CONFIG_USER_ONLY
 static inline AddressSpaceDispatch *flatview_to_dispatch(FlatView *fv)
 {
-- 
2.39.5


