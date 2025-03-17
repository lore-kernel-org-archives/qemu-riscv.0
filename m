Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CC7AC28B28
	for <qemu-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 18:36:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tuFJ3-0004Yz-2R; Mon, 17 Mar 2025 14:35:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tuFIa-0004RQ-3I
 for qemu-riscv@nongnu.org; Mon, 17 Mar 2025 14:34:53 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tuFIJ-00069R-2f
 for qemu-riscv@nongnu.org; Mon, 17 Mar 2025 14:34:50 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-225477548e1so82724385ad.0
 for <qemu-riscv@nongnu.org>; Mon, 17 Mar 2025 11:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742236468; x=1742841268; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fcP4MFj0H7Fu3AxOxTbJlPG2KgbdJwiBtz5sSPdKZDU=;
 b=OFQKPkd8zQFT53AvZqrYGdg4tP1hRz+tGx6FSZO37U7P9bjp3kUHL92C+DqPYwSXrj
 Iinj3zILrnUwGrpALD8FN2UuFo8yrL4g6lPiQ4QT7SzzutydY9nRUEzuBpebdz1vvSbk
 oGou+mzw3Z0XN0XbSgZq9jtYCAYkoMBiDFwbeiPIDvPeNMnozr7DMH6LPKD6uDi3aWxU
 xoSXOn9b13nUS00d/V41UK84jiFKDBcHy5noOqT3N5B7yMbeZV5pV98Yh6jmd+LuFk8l
 a62CtwMrc29NPhXu/J9LSOmduf6AqIbc9a6QBFA2EXxqgWphbv7LScX9nReSbE91/r2/
 ShMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742236468; x=1742841268;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fcP4MFj0H7Fu3AxOxTbJlPG2KgbdJwiBtz5sSPdKZDU=;
 b=TGmVTj4wy9UBD0/ALCdeoX1vjifDyGJ50g1tX1mevxfOQ70Xpu2JcZe79onTG6G92q
 EdKe799ZlEo+NC5u3kBhbxrqdAjeBv51/kkd5hf9dGc1m6tyEB5RwZBKfTWXJp6GLUzg
 MUyX/wnNoWOWgq+O0BB4ou411gIbKtwCuohj83Xm5EQswowdHx4ITLlcTwjec950O2uf
 gZc59b/RRfviO3p3opy4hakBcgGKcOD7Xbt6XtswE/nu4n6arCv+NpwHFvprO1ltc/kM
 EfJgAFzvYQTYgJXZ/SFdZn46IQ45YBjjVUIFLHbef4/i5W8zf/okuTM6l398PmLgjGkI
 IMuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5rZg/UVv0CJbmM+kP4Uw2TLKNp7Oyxe1Zo7A5v9t1inyaNp7ciZNBdGmVaMhheRkyn9VOmCjY9Wjy@nongnu.org
X-Gm-Message-State: AOJu0YwnI+AgNCtOjFFN/LE5n4K2zShy5QiyVqJ61oCpQD4IE697nYfR
 KyfcBDKaz9bmAoQRoX29kq43Iok7bC74wkZ6LDY10PaN85/G/rHe7TDwOZvA+2w=
X-Gm-Gg: ASbGncsBeJHMUBFBQGVfCryBsBCUPygnlXkjnJM+juK4V4YWDv1taoqojigSjWeHDlq
 lYfojTCF8dLgNMbmOQkBGoVKTRKD3pd1ehRLkDOyQb+5qjB/laRP9Z7Mt+mmMOK8nptWtQg8oCy
 NDQ9F+mTfK7Jg1Jy2yA9dl6MYfcOP0MZ4XBi6ElZKWLnUjoT/vQ8PsQm84Gk/JKNx2W9czy00lD
 J1CyF2QYdiWwQ2Atfy7lRz9GnLwLmvTUQyo7+dBepOJtLbn9KDwV9uidyYcYK34sdcb8aDSYoE9
 TbsXo/vfajVnHobjL734uHTFca8dkCd7soXjTZKilqcd
X-Google-Smtp-Source: AGHT+IHQDcKJsv+Vb17cz20O+u5FV4YlvIefcRPItg35hxavnuYTE6e3UlOmHk58oIUa6dLl2/Rvnw==
X-Received: by 2002:a05:6a00:13a6:b0:736:7175:f252 with SMTP id
 d2e1a72fcca58-7372239d970mr17183784b3a.14.1742236468325; 
 Mon, 17 Mar 2025 11:34:28 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73711695a2esm8188770b3a.144.2025.03.17.11.34.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 11:34:27 -0700 (PDT)
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
Subject: [PATCH v6 03/18] exec/memory_ldst: extract memory_ldst declarations
 from cpu-all.h
Date: Mon, 17 Mar 2025 11:34:02 -0700
Message-Id: <20250317183417.285700-4-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250317183417.285700-1-pierrick.bouvier@linaro.org>
References: <20250317183417.285700-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x630.google.com
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


