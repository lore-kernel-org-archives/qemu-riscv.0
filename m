Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9674AC282EC
	for <qemu-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 17:35:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tt8tf-0005sa-Ri; Fri, 14 Mar 2025 13:32:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tt8tC-0005cq-NI
 for qemu-riscv@nongnu.org; Fri, 14 Mar 2025 13:32:07 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tt8t6-0008Ge-Go
 for qemu-riscv@nongnu.org; Fri, 14 Mar 2025 13:32:04 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-22349bb8605so53160145ad.0
 for <qemu-riscv@nongnu.org>; Fri, 14 Mar 2025 10:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741973516; x=1742578316; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BsftdeZcZ0LsVJ43Vlgc1kB7SrUHDvnjwuIeYSteybs=;
 b=qBZPtlgqFNp4zq6y6ma4Yfxc1QOVdub8vKffWegWoQvwX6G5rMVWJ0NOFgpen17hUM
 UJZUzMOyEdr7D2n3K+5rUpgF072GafNDuQfLTqccGKDkqvXl57dCdFMq4/VxplvuVJOM
 vbhOr70kgHEkcvDGVHoC3WgOntcNjg4+K6DvmkfOhr+Ba88joJ2yg9zBkynWnFOXFN6n
 izJNTrfzN1ixIRT/xZB3P3ehHNB7272A5oLsSBMq0286zdhGOYOb9aWtLlBcuWflMFrq
 nrUXD+0PfXlF1R1BqIdF6Z7pPWQqvLkQ0C4qL/hUmv57328JH1ld4Mx/ocPfANsT398f
 lQbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741973516; x=1742578316;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BsftdeZcZ0LsVJ43Vlgc1kB7SrUHDvnjwuIeYSteybs=;
 b=d69QObsszRfqYXP+bxPK9r55ERnFMh4bSjyxCjy3C813E1LBvLtNL0ar6yaVyJiam0
 aW7vzwTUJ8NZzsHlOrqAcii80i9f8AmJPR19t3j6+vOrxs8MGcsSY1ZMgOJ1fhvY/x2/
 TCIn5ifBq4Fh9SsdEcrRQPxnHuuwXLQcWm6WdCc55NmgKVpTU11oG9X4OcFz/CoqQSop
 hzCvvrt5SJO8dar4QhC2R+ffzkRUwq+ZXaMMqPKmSCkUN/2HW8yBBcWFDp/R7KYScyCJ
 OWoUnpzajJhj+1zv8+2LsfSw0g2RWoVIy9E9YJ0DMpxiNRf2LF31Sto406g/D8AoJfFP
 4WwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZwS0oRwMuD2KEnQXYD3v4OvZezSpJQcM2QXKlgYhTBYRv92Y+D9XlShQUiY2fJQVSkvdv/AOci32L@nongnu.org
X-Gm-Message-State: AOJu0YzDmp7k7/Ck3Hrm5Ktb+Z/Z/8zkMFNQUjC8QF0ONHKsJlQv2Jli
 RvqWxWZfCJkliHXRA9XxdZkV7mLp5fbT7yfJ9t30GtQ0Nm5IVfrOnmn32VElSts=
X-Gm-Gg: ASbGncu3YoOYxDMU+M4EuSTj+pi/vwMmjZ5gsE/06ROuLqEUx1harX9GSUPzoqxEEgA
 1zlQxmYRaGzkFNBsPcB1QDfsjsakAm7PnZwciNUAqarzjLZWh7jBibb6f5ouBdftqzgbYH/Xbel
 JPUeBejfhHAWaKZItn3Sn0S9Ze6EW3YeVuU6snZX77RQkQwZVKqPZmt5QdxiNqRLwnvwiCNmlds
 luNvqTr2WDMBGiY3Mtuz+JwE7t4Hd30Zjn3lAzKsJqrm/d77jWRUTAlBZZVn5rtuiTvA7X5dRWO
 LxswnsySSi7bbi7A3aZVVNgcG3QAcRMxBmGxLTMWKbst
X-Google-Smtp-Source: AGHT+IHMleMJwhfQuIw2SImS8wKBtMic5A4ELNmhk5zJYoh3vglYg1/X+SLV/IgTuYLv0/Y4ZISJug==
X-Received: by 2002:a05:6a20:1595:b0:1f5:8622:5ecd with SMTP id
 adf61e73a8af0-1f5c12c78aamr4816767637.32.1741973516583; 
 Fri, 14 Mar 2025 10:31:56 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af56e9cd03bsm2990529a12.8.2025.03.14.10.31.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 10:31:56 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Paul Durrant <paul@xen.org>, Peter Xu <peterx@redhat.com>,
 alex.bennee@linaro.org, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-riscv@nongnu.org,
 manos.pitsidianakis@linaro.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Anthony PERARD <anthony@xenproject.org>, kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 10/17] system/kvm: make kvm_flush_coalesced_mmio_buffer()
 accessible for common code
Date: Fri, 14 Mar 2025 10:31:32 -0700
Message-Id: <20250314173139.2122904-11-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250314173139.2122904-1-pierrick.bouvier@linaro.org>
References: <20250314173139.2122904-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x632.google.com
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


