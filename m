Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF3C9C282EC
	for <qemu-riscv@archiver.kernel.org>; Tue, 11 Mar 2025 20:03:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1ts5kX-0001MN-0g; Tue, 11 Mar 2025 15:58:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1ts5k4-0000v0-OG
 for qemu-riscv@nongnu.org; Tue, 11 Mar 2025 15:58:21 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1ts5k1-0008VA-CL
 for qemu-riscv@nongnu.org; Tue, 11 Mar 2025 15:58:20 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-22337bc9ac3so114171595ad.1
 for <qemu-riscv@nongnu.org>; Tue, 11 Mar 2025 12:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741723094; x=1742327894; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fcP4MFj0H7Fu3AxOxTbJlPG2KgbdJwiBtz5sSPdKZDU=;
 b=iws8qo3UagKBsqqcvBdMZILd8sTU8/0hPnSqw57kQtJ+HwyOIqKs68fcbPusKltir/
 iCT5gmNEriSOgmopllPjTpBIXw2GRaHNp3le5USWZgIpJXLrjOV0CP6jeOmRaBIqPdQM
 PniY74PQRvq3E5pVv0Pduf56D4iNYqSb0ynshPiSRmNxyyGdIlQyce3nMVHSIbSS2i58
 k+FnFyx0jbgWYuhuLMv7QUPvSKKyIKiIBFT6drPwiDZYLhwolj42rnTv5rRILdCaUchT
 iEELVMtRYjzvrwzU4Uo9FKNEtBM/imuHGMniiaW14m+AtU/ve3TlcIorPxooZS7Qy1vv
 zJgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741723094; x=1742327894;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fcP4MFj0H7Fu3AxOxTbJlPG2KgbdJwiBtz5sSPdKZDU=;
 b=pKETfu/qEeKowmroYfbCyzLG3km7FPlG7oUDZlzlwJLvq+obV6MBlSfnTBDk0owVj1
 0gZkXYRxH9AybrW+Yu6hVkmWsZyfpeL31IXsPvcp402YcW8V4mTJWCmM5ohSAqWf8M88
 Mbh8FbREtrP4+Qpvn16i7nPDy+UM1PRhRkbcnwd6a3VM1MMu4ObiNdnlAz0BOsXXPIHV
 ItQ3ZGwPjA/pUeeSkLzBjZ2JGsLmTmVfP5SptW2vvgiNDGERptiKpn25niSaWJNfw0MM
 qH7nJFoYmZeG4U/oJ2CqXULmc6LSCv78+H1heQNFoGnftM2w24w9YwoYy8uRIoqzcFPg
 ArwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWaXNdCgnaU4vrUSIKPi2hFOCLia2BL48a189KGJPC3cKe1426rLNAuQWbOQ/wIMe7+AkDjVZN8xIoq@nongnu.org
X-Gm-Message-State: AOJu0YyqK4rutxoQ77vR84TC6xKwhlh35I+0cRQCk0TVhJeoHOUFyttq
 QeD3b3RPTSz59W+VWmVcRxl2eVVLbp1vGbjRrgY52fR/OY8lQiA6+dWDeLKkW08=
X-Gm-Gg: ASbGncvI9ksR+wPhYGj78cueG+JkKeiZQOHg3kNv2h71SSoe8dzOTtjRFIQTx8RdHCA
 5/2FxmkoipTGa2WCW47gd06B0rzRQdR5UzWlPPhEZo15bJcJGDu8CoPkifngRL3nVlPgyGXRYjb
 l5pRqf5ca85tIRHJtynB0ZDvrU+K2dQt2k7UUoqxDbdMl0IWNShQHGx452Vcsq4Y0p2LVreecF3
 WFFX4IybWByl8xGweOn+6tRztjrhch4uIrnSkUKtLRgXvkr85hxnkOHoYCjIGjb50+JlIAiTHNb
 ybetunDOgr04LQGiO8JJh/JBk8WFLNts9MurMLIt8tAd
X-Google-Smtp-Source: AGHT+IHtn3wjueX80hXlhR3WWJLzlWQ/GjOadBaAC9ISUpU84/t/abdjw/+6bEkcmiHY0rapbw+ALA==
X-Received: by 2002:a05:6a00:189b:b0:736:755b:8317 with SMTP id
 d2e1a72fcca58-736eb8a15femr7017121b3a.21.1741723094173; 
 Tue, 11 Mar 2025 12:58:14 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736a6e5c13asm9646981b3a.157.2025.03.11.12.58.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 12:58:13 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Anthony PERARD <anthony@xenproject.org>, xen-devel@lists.xenproject.org,
 Nicholas Piggin <npiggin@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, kvm@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paul Durrant <paul@xen.org>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 manos.pitsidianakis@linaro.org, Peter Xu <peterx@redhat.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Alistair Francis <alistair.francis@wdc.com>, alex.bennee@linaro.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 03/17] exec/memory_ldst: extract memory_ldst declarations
 from cpu-all.h
Date: Tue, 11 Mar 2025 12:57:49 -0700
Message-Id: <20250311195803.4115788-4-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250311195803.4115788-1-pierrick.bouvier@linaro.org>
References: <20250311195803.4115788-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x631.google.com
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


