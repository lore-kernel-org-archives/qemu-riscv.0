Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AEF1C282DE
	for <qemu-riscv@archiver.kernel.org>; Thu, 13 Mar 2025 16:41:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tslbB-0003uC-Py; Thu, 13 Mar 2025 12:39:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tslao-0003Ul-0A
 for qemu-riscv@nongnu.org; Thu, 13 Mar 2025 12:39:34 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tslak-0005j3-D3
 for qemu-riscv@nongnu.org; Thu, 13 Mar 2025 12:39:33 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-2fecba90cc3so2590662a91.2
 for <qemu-riscv@nongnu.org>; Thu, 13 Mar 2025 09:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741883969; x=1742488769; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/B5foK4Qy0OvFQVWNYpVAAsAF+tVTKpBxl4Jl8CdPFE=;
 b=h6G0ju1FFFvJs1QWONdC/10/IJ5LtezCPMEU7MD5gvpRmNp6+xnjvDGuMZq6u1E2SQ
 UleMxl4goug1vJxHr5A2OWW3+cIKmxeHGhb+WnOhXypodTt99xRQ8oFXsthJkEprg1GP
 3QOr/Sr1Na3Fk4gjnwbPRo7f6y1DbLQNuXyLDl/18AaPIdL0GM7Yy+bdaQmEsjwdAXjU
 jffyi1tqoD4I7T7RFl7s7S1JAjuYv5BnpdmrECpLCAuDRAyVZLxglZFQZhItIHfzldxR
 j7Oxi4tr81scefOR4kufGUVlejmmUHOxLgE7zWICEQbZwmlQNJeQ7LNl2hL9Bttt1aQF
 sQdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741883969; x=1742488769;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/B5foK4Qy0OvFQVWNYpVAAsAF+tVTKpBxl4Jl8CdPFE=;
 b=YdUGo/sUdjl5/voxEGPdMr2RYTg6gJjLRVbHI1buCghGoKo2Lu/jmKqNTSHDf4O/Ow
 vzMWmWSCKepQNi7a9xI64Cv7JJ5EgoSuqEcbqtzk//b23tdsW8Syg888nvrB4BDeE8Vb
 Xj+t7f2aH9Oyqz7UEoQTkC0IuWbmgMvybuNlc8TOAXT1srpw4mDUp5GF4EIIdWT0Eu1e
 o2PgOG9b+cAmwCjyTWlMPaiD09U7W012Ce8Aib7+X3Ogve7DfeDx4tijpwDZn6IorakU
 VlFX6F9uQHeCtd24H4wL4Cli9M9gG3wbZA7ggi8C/GbVXpwvcSTtZQPnxrGXz/Hg6V0m
 7GCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWaNvxC2XN29vDfUy+UerRZ8ZiR6WYiGK7YunLHSYbzhFP2uhGcrjt56NBCNvzMu7YFsFOveKRfiEhe@nongnu.org
X-Gm-Message-State: AOJu0Yys7Vn7minddnqkUq2yY5/RsIC1lZ4yZL60CTRPfRWbw0gn4lS0
 3wvSfXQXhQz5kev29gRZ/sWtkKyiY+hMjRGjKgLhPTM7jp4OFMCkVlrsQ7I6Ofs=
X-Gm-Gg: ASbGnctGBacNbQTd3g6yrtgis0j8s1aS6nf2mmsWMzbowJaDWvgCcet7EDy+1KWfp+F
 DSBtFfs2CQeBZppHtdXReANoWyzEGa45nQic+qAHzcBelI9pNRhg3f/g6UndMbTCjx/w3gHr7aL
 JbZCWzjx0XEHVLyrpZU6H/NN82ozn5KI1xN6Rr5GOmEzKQDhaPS8/HKx8+rn2cJ1w5iqLtkYA4O
 mMkN53Znoj7W7wN5Ay+1SZn4TTQavvy51B4fGJGyxKHq2M2nRysjKxaWCR+yR+QmOJIH8YmA42R
 6nLP04lGys9fAckIe1My8HXIhEgink3rOW6INRaBm0Uu
X-Google-Smtp-Source: AGHT+IE6Us2O77TYYfj/J/RmRU6RhpFIbMCr45wvgkThs0nxBWSPhVRimj63yvMeVhIF4wJ+N9MdKw==
X-Received: by 2002:a17:90b:3bc6:b0:2ff:58b8:5c46 with SMTP id
 98e67ed59e1d1-3014e82fd9amr271511a91.8.1741883968719; 
 Thu, 13 Mar 2025 09:39:28 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30119265938sm4020084a91.39.2025.03.13.09.39.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 09:39:28 -0700 (PDT)
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
Subject: [PATCH v4 15/17] include/exec/memory: move devend functions to
 memory-internal.h
Date: Thu, 13 Mar 2025 09:39:01 -0700
Message-Id: <20250313163903.1738581-16-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250313163903.1738581-1-pierrick.bouvier@linaro.org>
References: <20250313163903.1738581-1-pierrick.bouvier@linaro.org>
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

Only system/physmem.c and system/memory.c use those functions, so we can
move then to internal header.

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


