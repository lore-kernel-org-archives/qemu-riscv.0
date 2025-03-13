Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B5DC282EC
	for <qemu-riscv@archiver.kernel.org>; Thu, 13 Mar 2025 16:40:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tslan-0003Tn-2H; Thu, 13 Mar 2025 12:39:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tslag-0003PQ-VP
 for qemu-riscv@nongnu.org; Thu, 13 Mar 2025 12:39:26 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tslae-0005fo-H4
 for qemu-riscv@nongnu.org; Thu, 13 Mar 2025 12:39:26 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-2232aead377so27039415ad.0
 for <qemu-riscv@nongnu.org>; Thu, 13 Mar 2025 09:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741883963; x=1742488763; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BsftdeZcZ0LsVJ43Vlgc1kB7SrUHDvnjwuIeYSteybs=;
 b=wJ5i7iWrebch1sYlNhi0meyjv1Ccg8TMZjzA+iK7ns8/qputM63fdMhjgANJIJO3Wj
 GgqXI5CQW+0uCyIUf8qP9pgpAW6apNIlh+DrtscyukKLsd3ViRZUPhuDV9utyLXY159W
 bKEPMhAGHsN30DzPjyFx/AZZpf4jyWT/ny5iQ7cQYiRhBB7oSI151lqRkMHV3kwaJA7h
 mtSaTjhCIKkUyBqqejZhY0+hJSS6OHP0GmDBbRtVxsvmRUfUrvOOoicl9e/jYSBoOaKX
 cJnnN4lvyYuQm66dJtd834doxXMwntNTTxZH6CaBpniPD9tLgHFStaEm6i4yjHpusJ8O
 t1Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741883963; x=1742488763;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BsftdeZcZ0LsVJ43Vlgc1kB7SrUHDvnjwuIeYSteybs=;
 b=s7VRSyQn7SINDN82eVjcf7NJPnBaSP8NcmYfmHAnWFYEZUu8qnaTR2tcpYWq+fCnOL
 XJUSgxF4IotUAkOF++Hmas1CpKBFt9DPnKJfdSOsd+z+kYGoOSM+4nNM1f7e4TsNzSKX
 u+cpzZ141ilEcrS7YYxEf8RSSn9IbSVr0wzXB1YcPYt1Q72FlBcypc7eQzR26ZzxKCXh
 0/eMchw/DEb90bQzEbD39irZwfF4MMJsRCPJ31yS3sqROYuuRnwthgCS55DI+bNVf6Ef
 VvGg7vr0kV7U+TrCUe+JFjKRwV9LJQ3wJ6wf4a2daf1gCdy9IfsQq7q8GN/MgoeeUEjQ
 XGSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8IgMvMjfn9cqPIMUF9QRsoklxR+Dbm8DSg/sqhP5feHbWKMKjN1VvshXSTASGV1NRgMBTZEK4NVY0@nongnu.org
X-Gm-Message-State: AOJu0Yxzgp+dfGJN8DVAGzMtkYQWVRZKRhSbYbkTd5BEUvfKdO3ehuG3
 +U8gGlE17pHiD+vqWLEEEHNxypyln/BED91bXr/2gS2rpiCX9V4c1JM8rd8/cIw=
X-Gm-Gg: ASbGnctzpo/kS414E3emUgBLTTF62MAvqJG1wQpGBNPg4D9fgdt0LmY34vNzOh5nrOp
 X2NrnlILMZBxX2nqkWv37TYN/EOU3mZgc1iDII3ladnQztPRAQ6atwbwgjsbT0TvV3sPxl5x+AW
 3zZxj12H6HDUR+mZHoWrINbjkg2CgFMhfRwnObFLZntsXN8+jiBLX/SaReupB148CLCeZuGXg7t
 zaHkvAnyFz3NOxSQ8IyjqjN7fDFSDfbvXdbW40AE4ugNkoc/SKF1mrXz0StLNQbZL7B4l2AMPPe
 WjGPcZZIDaYlwa/d47ah+cCFrPEfMr59Sk3Zd1W7LermQjnBgm5pkGU=
X-Google-Smtp-Source: AGHT+IFA5iTR0M+uWE9BgHbKNSK5QhTOV/p9oDq/Jx41glVxwyMkriyoe5Nv+AlfRyMJQR/e/whMeQ==
X-Received: by 2002:a17:902:d4c8:b0:224:1074:638e with SMTP id
 d9443c01a7336-225dd8ec5f6mr2405345ad.52.1741883962943; 
 Thu, 13 Mar 2025 09:39:22 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30119265938sm4020084a91.39.2025.03.13.09.39.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 09:39:22 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 xen-devel@lists.xenproject.org, Peter Xu <peterx@redhat.com>,
 alex.bennee@linaro.org, manos.pitsidianakis@linaro.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, kvm@vger.kernel.org,
 David Hildenbrand <david@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Weiwei Li <liwei1518@gmail.com>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Anthony PERARD <anthony@xenproject.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 10/17] system/kvm: make kvm_flush_coalesced_mmio_buffer()
 accessible for common code
Date: Thu, 13 Mar 2025 09:38:56 -0700
Message-Id: <20250313163903.1738581-11-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250313163903.1738581-1-pierrick.bouvier@linaro.org>
References: <20250313163903.1738581-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x62e.google.com
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


