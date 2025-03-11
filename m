Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B426AC28B2E
	for <qemu-riscv@archiver.kernel.org>; Tue, 11 Mar 2025 04:10:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1trqva-0003ON-Ct; Tue, 11 Mar 2025 00:09:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1trqvT-0003JC-2y
 for qemu-riscv@nongnu.org; Tue, 11 Mar 2025 00:09:08 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1trqvP-0006Q0-8G
 for qemu-riscv@nongnu.org; Tue, 11 Mar 2025 00:09:06 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-2ff797f8f1bso6645093a91.3
 for <qemu-riscv@nongnu.org>; Mon, 10 Mar 2025 21:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741666141; x=1742270941; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KTcsPgfp4qWHKI5IiGC/xRJnn7HmZtcbIn5ZIF7f/ys=;
 b=MeHZdvfcVoAs6k4sTWtn1uowH9CceIKI0ogUH4PNDDE4OnT+rchLrvBg3rIlJc+/td
 WSg1Ap4MbjmryKSLVQJW2mWcelxtiqosYMgFVq4qKPDTBlzchJE33ZuB7CqhR1obZNA0
 fQZSqpWyU1t9sDT5uyWLMr25fIqM5PxRaRWPN3rmbuMp+ee2pxChX6AylG7C8N/nQEhM
 5cgPvSCrifmoBJ9Fqlcrmty7m7v8yVt/ETv6tSqHbHMwFUg4expI36Il/p8DfQFCUuGy
 rptfBgyncV8fuDB7qgNj78Jl5vOJYkirh6/+e3IwTjIhKrGpbeM00T2SN/4aCdPNRviX
 r/uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741666141; x=1742270941;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KTcsPgfp4qWHKI5IiGC/xRJnn7HmZtcbIn5ZIF7f/ys=;
 b=LhJiMSDWwU1u7KC3LXWvRuD9GAJ9OKnPfRhWRhMaoL55935ttW9rbXaIcR/tDBw5PO
 XvCyCCEJG3J0fyCnpx5/m8jHf3tqyaZng59yoTLuyy8AOw3GOZv1nrcG2Xhw5tngU/sp
 zfiiVkhUKpPnXdM+CXiZiaT8t9Z4Yg+0r87EM5rDSgyb8+VX107uZ5osyKSbabr0Ef3i
 E3W4mRSOCLItRoGk3kjkmnWN//DounMUQCSJ5KgyQSiwuEANswhpRHJA1kXiPUXB95FS
 ttu12xWhXary6czr6BRkL762qCD9F72H3plQKXRvnJ9Ocm1s3qz6+s8B6q7Dm4TS2mFD
 4mxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlCvp/AaNJXr0Ereaq/P5rCXCTTaSlLFrOzI3CMlwRKe+Q5oovAbp9nEBSS9e/pOuz13wLaGliUEqv@nongnu.org
X-Gm-Message-State: AOJu0YyH6HRhvl2s30VTxsi/e1JuXqvokpDIGF9T9Mj9UJ72e3lSwLhd
 xzJRURSHvjLamVXob2Ptc35MY71DFi58schibG/Foezvg1i5mzgjgZsguhk+rVU=
X-Gm-Gg: ASbGncvTpUDTT0NEwRDSEsVxhRCRru/c0lle7QdykNA90yBTi2Kj24AVpF+z6kD1k6P
 k2bbPrNOD5VHVSwyaI8TsD/DA6t2CrWDNTVEmSIHFc1qtOtvOd/vtaWForV7arWA4w3r2N337eN
 4NGWMBWhwrt57wGsoPTzu+/M6jlqKAhnspvyv2PvzXluXn9NkcTJrztMYmSHNoQ3eW2uhrosCdM
 Cnj4pX8mszQANlx2ZQTVD702HvsfhzXdMt2+cdpc7LjdueB20AW6NAYdwinQvJTuRZmnhwrKidX
 TJxevp1DuIdQXajDAFdKJgdQDludURQUhINGMIL5aR8ErlBf+OzFUv4=
X-Google-Smtp-Source: AGHT+IFvmMV6FR9w9HRJlmca+n7Q/Lcb7qpOce3I31boqIZsCEXwR+2F1i3uigVa31tDctZYbS6W9g==
X-Received: by 2002:a05:6a21:6b18:b0:1ee:c7c8:ca4 with SMTP id
 adf61e73a8af0-1f58cbef8a4mr4223140637.36.1741666140734; 
 Mon, 10 Mar 2025 21:09:00 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af28c0339cesm7324454a12.46.2025.03.10.21.08.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 21:09:00 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 David Hildenbrand <david@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 xen-devel@lists.xenproject.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Xu <peterx@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, alex.bennee@linaro.org,
 qemu-riscv@nongnu.org, manos.pitsidianakis@linaro.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Anthony PERARD <anthony@xenproject.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 03/16] exec/memory_ldst: extract memory_ldst declarations
 from cpu-all.h
Date: Mon, 10 Mar 2025 21:08:25 -0700
Message-Id: <20250311040838.3937136-4-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250311040838.3937136-1-pierrick.bouvier@linaro.org>
References: <20250311040838.3937136-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x1032.google.com
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

They are now accessible through exec/memory.h instead, and we make sure
all variants are available for common or target dependent code.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/cpu-all.h         | 12 ------------
 include/exec/memory_ldst.h.inc |  4 ----
 2 files changed, 16 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index e56c064d46f..0e8205818a4 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -44,18 +44,6 @@
 
 #include "exec/hwaddr.h"
 
-#define SUFFIX
-#define ARG1         as
-#define ARG1_DECL    AddressSpace *as
-#define TARGET_ENDIANNESS
-#include "exec/memory_ldst.h.inc"
-
-#define SUFFIX       _cached_slow
-#define ARG1         cache
-#define ARG1_DECL    MemoryRegionCache *cache
-#define TARGET_ENDIANNESS
-#include "exec/memory_ldst.h.inc"
-
 static inline void stl_phys_notdirty(AddressSpace *as, hwaddr addr, uint32_t val)
 {
     address_space_stl_notdirty(as, addr, val,
diff --git a/include/exec/memory_ldst.h.inc b/include/exec/memory_ldst.h.inc
index 92ad74e9560..7270235c600 100644
--- a/include/exec/memory_ldst.h.inc
+++ b/include/exec/memory_ldst.h.inc
@@ -19,7 +19,6 @@
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifdef TARGET_ENDIANNESS
 uint16_t glue(address_space_lduw, SUFFIX)(ARG1_DECL,
     hwaddr addr, MemTxAttrs attrs, MemTxResult *result);
 uint32_t glue(address_space_ldl, SUFFIX)(ARG1_DECL,
@@ -34,7 +33,6 @@ void glue(address_space_stl, SUFFIX)(ARG1_DECL,
     hwaddr addr, uint32_t val, MemTxAttrs attrs, MemTxResult *result);
 void glue(address_space_stq, SUFFIX)(ARG1_DECL,
     hwaddr addr, uint64_t val, MemTxAttrs attrs, MemTxResult *result);
-#else
 uint8_t glue(address_space_ldub, SUFFIX)(ARG1_DECL,
     hwaddr addr, MemTxAttrs attrs, MemTxResult *result);
 uint16_t glue(address_space_lduw_le, SUFFIX)(ARG1_DECL,
@@ -63,9 +61,7 @@ void glue(address_space_stq_le, SUFFIX)(ARG1_DECL,
     hwaddr addr, uint64_t val, MemTxAttrs attrs, MemTxResult *result);
 void glue(address_space_stq_be, SUFFIX)(ARG1_DECL,
     hwaddr addr, uint64_t val, MemTxAttrs attrs, MemTxResult *result);
-#endif
 
 #undef ARG1_DECL
 #undef ARG1
 #undef SUFFIX
-#undef TARGET_ENDIANNESS
-- 
2.39.5


