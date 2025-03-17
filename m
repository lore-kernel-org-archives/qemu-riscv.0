Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA57C282EC
	for <qemu-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 18:37:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tuFJX-000531-6G; Mon, 17 Mar 2025 14:35:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tuFJA-0004iF-FU
 for qemu-riscv@nongnu.org; Mon, 17 Mar 2025 14:35:28 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tuFIW-0006Bo-6E
 for qemu-riscv@nongnu.org; Mon, 17 Mar 2025 14:35:23 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-225df540edcso61414355ad.0
 for <qemu-riscv@nongnu.org>; Mon, 17 Mar 2025 11:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742236476; x=1742841276; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BsftdeZcZ0LsVJ43Vlgc1kB7SrUHDvnjwuIeYSteybs=;
 b=o84Fkg8jknLDIUcKXE+NdAhNbNURUtErC4I5s7HGLXJwIhLe/ZPZ7C9joTiOfIk25W
 Ut+Q4iENe2UQiWR3g/2K/0tHc8BGTcBNLmWtAJGFVUhLmugNC0QHgPCueIHEhdLy6YwC
 UWXa1k0umYypLLGt0Cuvn44e+bwScdedn/eHZd98BWvliX7ejbwS31mOiTWvc0VHLDQx
 3Cn56LqDMnFtrxUXwyP/unPhEoYWunLTYpcfLd7e5wTVjP2/kh+2QCsVeOhjV4Xzivx4
 IyMx1uDPjg3figx+Nn243B7Jvf9534dYmxRPDlnB8ZWqGbXPTi7/bdDl8Pwl0uivrP7E
 EsXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742236476; x=1742841276;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BsftdeZcZ0LsVJ43Vlgc1kB7SrUHDvnjwuIeYSteybs=;
 b=KonW1U5nmuFvE6cM+Vg6+OyAxRvq0EOa2rSEF0yoRhpmp1PLf7CxRZgFcxijClSQSw
 1CkClk53ExoB4l7MOd+DoOMco+L1StjKQZl0+1XxyuDQ7ty1h5KNDS/5qBmz8oyWBZm1
 XpclYRlHju/2EcJMEyMKez8PgmVmYL8bBY8/rbyrniY23ljJFVZjzU7pCAM8nFVrZa8W
 aZewVI3bkP9te8TvklWZHh64GdUpCz7AlrmypcBGSI6v36mmYL63rKTk8T9YaqgfXftI
 mYD6Hnljxg6efAPQQKM6TJcNBxAtv3YbLhIaSRLANXAapviBfRbG0kLMhr17QKKTRL2P
 demg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/CDAsPwSvk7VdlSChm923jUHysWrzLCRTkwtwCyPGwEtBNcxxgPAOtG728e7szYDChmdSK458ALDF@nongnu.org
X-Gm-Message-State: AOJu0YxavUB+pCYX/EXWTO9WQ1FXDQLsoax9D9ycH3FWpK9dnPkEnkER
 BcV/8ZfsrLTgodPm57xwEo36cOiBtWkyovgBl/ATOSzri0OSSbuf3TKs6gr50svFJVV5Who6BSv
 S
X-Gm-Gg: ASbGncsnrt8ynafamcJ9BW9L0gZ8Z3G05T6tluEi9Wt1nsHSLHhzTU13Q89XLW45z9w
 zhLD5bYsCCmf4PnoZBQaa3tRj2JxGgfsGtvqCWmXzu9/uhK+KGKFarlrS2vzLkpBGBuPY4qJdx+
 Zle9dRpJ81Hy0R1mVgfkUiK+EC2eh03Yl7uAlBvJgOe0oHjd/TAjspKkVPbiN7z+E0gf6LscQlG
 pbCAl4ytcwI0IoUiv62/zJ0ovN0sCV3HYP4Jr8qS+QAQgMucbM4e5S0sM1cMW0Fwkryd5rqTyQf
 qi32sLE8n4uQA0mVizeDlhX7nlUiaFQainfn1leQUqEO
X-Google-Smtp-Source: AGHT+IFrc3E9fUAh+z3i68X6oJdtySmjNUcFSLSYjTurJl9vG25uO/0RkrUhFSmr8bwDc6/U+8pjrQ==
X-Received: by 2002:a05:6a00:3b8e:b0:736:b400:b58f with SMTP id
 d2e1a72fcca58-7375752916dmr715700b3a.0.1742236476193; 
 Mon, 17 Mar 2025 11:34:36 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73711695a2esm8188770b3a.144.2025.03.17.11.34.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 11:34:35 -0700 (PDT)
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
Subject: [PATCH v6 10/18] system/kvm: make kvm_flush_coalesced_mmio_buffer()
 accessible for common code
Date: Mon, 17 Mar 2025 11:34:09 -0700
Message-Id: <20250317183417.285700-11-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250317183417.285700-1-pierrick.bouvier@linaro.org>
References: <20250317183417.285700-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x62c.google.com
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

This function is used by system/physmem.c will be turn into common code
in next commit.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/system/kvm.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/system/kvm.h b/include/system/kvm.h
index ab17c09a551..21da3b8b052 100644
--- a/include/system/kvm.h
+++ b/include/system/kvm.h
@@ -210,11 +210,11 @@ bool kvm_arm_supports_user_irq(void);
 int kvm_on_sigbus_vcpu(CPUState *cpu, int code, void *addr);
 int kvm_on_sigbus(int code, void *addr);
 
-#ifdef COMPILING_PER_TARGET
-#include "cpu.h"
-
 void kvm_flush_coalesced_mmio_buffer(void);
 
+#ifdef COMPILING_PER_TARGET
+#include "cpu.h"
+
 /**
  * kvm_update_guest_debug(): ensure KVM debug structures updated
  * @cs: the CPUState for this cpu
-- 
2.39.5


