Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B57B3C282EC
	for <qemu-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 18:39:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tuFKI-0005c8-HH; Mon, 17 Mar 2025 14:36:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tuFJL-0004s0-3q
 for qemu-riscv@nongnu.org; Mon, 17 Mar 2025 14:35:39 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tuFIZ-0006DX-Gm
 for qemu-riscv@nongnu.org; Mon, 17 Mar 2025 14:35:38 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-22423adf751so80107245ad.2
 for <qemu-riscv@nongnu.org>; Mon, 17 Mar 2025 11:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742236483; x=1742841283; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ipPAyCMNYKQgJ+e1Pj22cNEjWMul6XXi9iVGdQZJ7Rc=;
 b=e82twBaYUFzQj40G5+oSfwvx+YUSosr/3XOtYbPD5mEhauXKO7mBL45RJZmIEYhXLX
 t2pv1mjrk7OLFGNgVO+q23jgKIoj6YmdH/hWpiwEObTl0aofb1yZB6N5EdMfV4e6BOb5
 VMzv+7qF8FrFOPHdIcR/SybPW74oQcpcDygwMcsYYbHgKdvWtaQdp15WCkP66Af4FBL+
 msiSDf7xG0vSPHJ/B861rlI3/b327NRIFWY8e0cxKF1o/PW6+ULC17EWr7Y50AvfrRgi
 G+8fyrCeQ9U9FhYbjB6OyIUzyqal6Qnxg3NYJwJpzufjtJm9Q6sz+kXJegwq16R52aAE
 LWiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742236483; x=1742841283;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ipPAyCMNYKQgJ+e1Pj22cNEjWMul6XXi9iVGdQZJ7Rc=;
 b=fwsmR+6jR4XznS3LulXSV3fCe8eKxIscoPzSLT+yXnUxfbIUJQbFYHT1jYuLj2nV1j
 ipVeQnw1GmQ1Dh6ZNW2psBxJ97CVERucnI73zRt2S1CfDXyRsB+ZI1JtH43XhdK049x+
 bGgL3F4R4jBc3dwEjUmv+HBErtsFIG9OgPi39ZPqecQPoyvXUO2UJc8Y2XNiFBz5b1S5
 bwyjpcXT0VvTaccjrp1bTG55VbijYtZ6KnxWB3Z/aLDcqUlfaRRAI1LSC53NbD3IbEQQ
 +XIYeScwu4eA2akc1pIOZcl7lemYsO4gGGUYVo7LHz/SBDJjYEcF/9AMikwh7Rs/VFsz
 RdkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLUPMCGQ//juRU1Umt/xX9iiRQ6FPNegtCyOYVCS/wSBn/4QudsbnHlAvTTIR1KiUx3nj0QTMNBVuq@nongnu.org
X-Gm-Message-State: AOJu0YyVKPO6Q3EDaNcUTBCA8amMUooO/qyysT+8gzUwE5cUTE3N9+Jm
 QPKWgr//rsSXb+z/ihg1ZWeqRLAtRC7/JlwKKgSenEJuqPDKkpRDLjhf8PohKpM=
X-Gm-Gg: ASbGncu2j1vLJkl6jHRy9pBi8opy48QEg8eSyW3GhlXvVcUWl4cQQWZr0ScgbPqIcuX
 s19mAKnxN5Lk4yY+mxc3MuWb5xgjlcdx/D7MLNmp5FPXx0T1440N2cVuffIKpWuvOkdP+WVyMA1
 ErVw5qMSIDKdmdLCF4y+Q9yBDtGE6b40Wl1lEBSy2jIBVm+btQ8S67arjwW+NYaQlQfsfxiMWgM
 MVBEwwAy14GQSa9jGFglBFNFCJ9k36CZ3j8GMgACKNmJDXi3y7h1RdW3hg+RVZHAdK3qbIoodgJ
 lHgeAoaIgxTV5Ue3a5XO56bnPLvVYW2uDJlHKVqmZPFG
X-Google-Smtp-Source: AGHT+IEkZnLpN2CL+GDmBOdEKBU4dHJiRJeeADCMAkJ+O9oEFhXHqcZxYnGUH5GSlkI3pMVX0bW4VQ==
X-Received: by 2002:a05:6a00:1a87:b0:736:5725:59b9 with SMTP id
 d2e1a72fcca58-7372236c6b2mr14484100b3a.2.1742236482975; 
 Mon, 17 Mar 2025 11:34:42 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73711695a2esm8188770b3a.144.2025.03.17.11.34.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 11:34:42 -0700 (PDT)
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
Subject: [PATCH v6 16/18] include/exec/memory: move devend functions to
 memory-internal.h
Date: Mon, 17 Mar 2025 11:34:15 -0700
Message-Id: <20250317183417.285700-17-pierrick.bouvier@linaro.org>
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

Only system/physmem.c and system/memory.c use those functions, so we can
move then to internal header.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/memory-internal.h | 19 +++++++++++++++++++
 include/exec/memory.h          | 18 ------------------
 2 files changed, 19 insertions(+), 18 deletions(-)

diff --git a/include/exec/memory-internal.h b/include/exec/memory-internal.h
index b729f3b25ad..c75178a3d6b 100644
--- a/include/exec/memory-internal.h
+++ b/include/exec/memory-internal.h
@@ -43,5 +43,24 @@ void address_space_dispatch_free(AddressSpaceDispatch *d);
 
 void mtree_print_dispatch(struct AddressSpaceDispatch *d,
                           MemoryRegion *root);
+
+/* returns true if end is big endian. */
+static inline bool devend_big_endian(enum device_endian end)
+{
+    QEMU_BUILD_BUG_ON(DEVICE_HOST_ENDIAN != DEVICE_LITTLE_ENDIAN &&
+                      DEVICE_HOST_ENDIAN != DEVICE_BIG_ENDIAN);
+
+    if (end == DEVICE_NATIVE_ENDIAN) {
+        return target_words_bigendian();
+    }
+    return end == DEVICE_BIG_ENDIAN;
+}
+
+/* enum device_endian to MemOp.  */
+static inline MemOp devend_memop(enum device_endian end)
+{
+    return devend_big_endian(end) ? MO_BE : MO_LE;
+}
+
 #endif
 #endif
diff --git a/include/exec/memory.h b/include/exec/memory.h
index 70177304a92..a3bb0542bf6 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -3138,24 +3138,6 @@ address_space_write_cached(MemoryRegionCache *cache, hwaddr addr,
 MemTxResult address_space_set(AddressSpace *as, hwaddr addr,
                               uint8_t c, hwaddr len, MemTxAttrs attrs);
 
-/* returns true if end is big endian. */
-static inline bool devend_big_endian(enum device_endian end)
-{
-    QEMU_BUILD_BUG_ON(DEVICE_HOST_ENDIAN != DEVICE_LITTLE_ENDIAN &&
-                      DEVICE_HOST_ENDIAN != DEVICE_BIG_ENDIAN);
-
-    if (end == DEVICE_NATIVE_ENDIAN) {
-        return target_words_bigendian();
-    }
-    return end == DEVICE_BIG_ENDIAN;
-}
-
-/* enum device_endian to MemOp.  */
-static inline MemOp devend_memop(enum device_endian end)
-{
-    return devend_big_endian(end) ? MO_BE : MO_LE;
-}
-
 /*
  * Inhibit technologies that require discarding of pages in RAM blocks, e.g.,
  * to manage the actual amount of memory consumed by the VM (then, the memory
-- 
2.39.5


