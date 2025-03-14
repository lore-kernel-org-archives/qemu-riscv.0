Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2011AC282EC
	for <qemu-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 17:33:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tt8tW-0005lp-AR; Fri, 14 Mar 2025 13:32:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tt8t2-0005Vf-AP
 for qemu-riscv@nongnu.org; Fri, 14 Mar 2025 13:31:57 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tt8sx-0008DJ-74
 for qemu-riscv@nongnu.org; Fri, 14 Mar 2025 13:31:55 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-22403cbb47fso45115355ad.0
 for <qemu-riscv@nongnu.org>; Fri, 14 Mar 2025 10:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741973508; x=1742578308; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fcP4MFj0H7Fu3AxOxTbJlPG2KgbdJwiBtz5sSPdKZDU=;
 b=YPczUYCahMd5iZ4FaAzF5pv+lPCYaWbCpv8o6KEt2kiaReBR8OJwaqL8A1DqeXdOly
 xqcfTmFf7bsAM0dl4te6BvkRy2+VDC9ospRz85relOXnc16Owy918w7bMjkcbvsjIiBz
 AUNQTyb/sPcnRn6Xo10CfBIt3KVkDPSkyNcgAQVGkCOmYWNc+ALkzCCWxf+YH1tYCIR6
 BRsHxLKy5c+MIAmY4s3eV/1rOLM/X8AC8w9vuKnhN66NfPbhbUtIPY52C367Xg1Gt7Tg
 IfKjdGrZhb/V+8iF0HhI0leULuQg07Eu98R2wvDANJGbFHi/FbKtKzV8/r+tbXhI94kx
 ymtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741973508; x=1742578308;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fcP4MFj0H7Fu3AxOxTbJlPG2KgbdJwiBtz5sSPdKZDU=;
 b=Uc7A36asy3OUdKRr0dJ/L1ZOWDvMfdxojx7vc7fjBiRC8TcoZpOIDXz2C41P1PoS1i
 rm49u02vmwwETHfMAcypnQNOH9h2p1m91rbsyQnZsEVSLdh6zZ3y8CvsAxTS4t6dgRNq
 ligGfDzXCb7azj3v6BRfJHY9qlkKpNiN8R6XumdEUjCM7XN9r5seNzmRbLAnGmMtBdvz
 O2rcc/RdY/1gBDI2kfvsnOR1Qfusgu06YdJc8BJaXQnsAJtg5w4fzdgauPbsKFf2sf9D
 sjMkUu05tAU15ZVgociti4BWnhMFyGDYAjYLHXkX+Si2hUsc2cyv9Y4TQWx/7R/cuPUi
 IA8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXW4yf8Cj9EKz0CXSiabrhIhG4SQH87jztnU2JQiYcVzxlavZtqh4OxHW+0eg+hsVa0FwSZ6EsIIwdZ@nongnu.org
X-Gm-Message-State: AOJu0YzKik9tpDp3N0yFoVJy+/7J7UApsvdMqnm8/nd2TCHyK3Xu8yWw
 Vv6EgVN8J86sf/SmneV+/Cr0mFp5diEllFYg/2twUoqTXK2FReAZfN+R7GJN/I4=
X-Gm-Gg: ASbGnctfkiorQ4btISgpA/w8IW1ATYppuZ03zCkFGDf7zmykti+0IMYANFbOYhBJ+QJ
 J05Y6BBMeSycDe8n1k4KAQIcsdm+4uY8k/bnMv0IWMI4sbntiJEP3toMiF4YNdrtRbaLQa23cZ5
 0atEE6iQwVLj/HRrGWirg16mjg9pOlrbiuXGdTbr82USxcCD2NHnBcfmZ72VVEGgCF4mHnCRqxH
 nlf1hR3kgvk6UIS89oFUhsgLlkQ3txprXCQTYTCW88PLendyo0PiCXSUK028/cFSMGWrM+AX74C
 F77EU2ljZVyb1ZEQ7TXOo7t17U/v++bdmSUyXqcvUzkr
X-Google-Smtp-Source: AGHT+IEybdH1a4UlSgUtF+/hwXdxnavqEZfmFC1l+XuioTIMcBmIgOmIQCQoptJbICxTDzesMl+Yag==
X-Received: by 2002:a05:6a00:a1f:b0:732:5164:3cc with SMTP id
 d2e1a72fcca58-737223e7399mr3832395b3a.19.1741973508455; 
 Fri, 14 Mar 2025 10:31:48 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af56e9cd03bsm2990529a12.8.2025.03.14.10.31.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 10:31:48 -0700 (PDT)
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
Subject: [PATCH v5 03/17] exec/memory_ldst: extract memory_ldst declarations
 from cpu-all.h
Date: Fri, 14 Mar 2025 10:31:25 -0700
Message-Id: <20250314173139.2122904-4-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250314173139.2122904-1-pierrick.bouvier@linaro.org>
References: <20250314173139.2122904-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x636.google.com
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


