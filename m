Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21C2FC282EC
	for <qemu-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 17:37:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tt8tv-00064A-Bx; Fri, 14 Mar 2025 13:32:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tt8tL-0005gU-93
 for qemu-riscv@nongnu.org; Fri, 14 Mar 2025 13:32:16 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tt8tF-0008J8-2n
 for qemu-riscv@nongnu.org; Fri, 14 Mar 2025 13:32:13 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-224100e9a5cso48995365ad.2
 for <qemu-riscv@nongnu.org>; Fri, 14 Mar 2025 10:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741973522; x=1742578322; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ipPAyCMNYKQgJ+e1Pj22cNEjWMul6XXi9iVGdQZJ7Rc=;
 b=xYpxq0h+ebVTHIFOxqOTni3MZq7i51vLM/Fq6xr3oB+lL5j6gnulNtIi1/nvoTA+9L
 i+Em+bU1uCB9SlekJRhF9tJNn/5re4+HcwBYSPFnIvHjGdniWSqe2fu9cTTJBnh/Eoss
 YkifVC3c22qadqgAgxnrIEqIqvJ4H5ATUuDWuN5wzDD0FBMaZw2yPFHX01s7BMDYD6f+
 aaUTA0yEgiwFyQzkZIFrP0b+NjO7ptPndqxtYaQItgxs7tD7WvSnA6EimTOJTIhfVb3E
 fUMz2ut3DMhpipXVn9f7Fo5mo16C9hm/5V1lJxquceMMG04WUKl+WhxBMP/NPKhN3Byz
 /EHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741973522; x=1742578322;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ipPAyCMNYKQgJ+e1Pj22cNEjWMul6XXi9iVGdQZJ7Rc=;
 b=I2oLSkwZeI4WwvXjnngpmemY/sLm2zDjk9gBni9hwImSdaJ3prO/4Nj/5irROa4UAq
 QYv1UtOWsGQRmh8gvof26GVLy2jFw/L25P7wJv7eF1gXUTt2RKcdwk8waV6YAbCIrHIY
 mVThTEAeeF+a4MGGHG3O6pFEI5CUcNhBuGd1XAmyjoxy6aflbcixeLRLdNY661C1BX7o
 gVRHFrRWbJgcIL1Ic5fPogALTSHxPCzsFz4/3QN1izoX7hXBd38j7gH3m4tTvsjqsc77
 3yPzDwgHCFjsKkV+PxR9DBfZh9iKXe2AV7Ay/iFfpNgC7otPRcSX2qfqFRXpJYx+7OJb
 I59g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoY9pmY4PJsHZWtGBk7aq/kuxsRIF02j5xy84eA7WKSkVRCfXkUNGDoyXFq6RHMzupxz6aIoUwzMfM@nongnu.org
X-Gm-Message-State: AOJu0YwbcYstNfKv9pvrbWmaTneOblzXuSHFUuow5GcctW5DXGyUgyKb
 anDF44HQyeHRQ6w3B7u3Lm8OZ7q6CmhEFZ78BDxRDH79jl9N9S2k2EQfqLfiOOk=
X-Gm-Gg: ASbGncvgmkmmt22jcRF4rkotXW/i5PvG9CGK8oK24mMtfMt2iNPumPb8+tHE0Cdy/h4
 EG1eXSJL82FqyisIecEwvwewahU4bsyfUPqwP3RCu2q1Z/I0Jz1IgVV5njsQrsEmdgHU/2f2CNR
 Ao2jHHXQtsWol/zI5e14wIfJMUtYw40QgYzv3e2v757NIUJs6OrsrkfBCvmLEBWb2jKUwefE0VP
 LsKnSJVwQcvM0acG/OKPTzxBYuAyjdiK3rko8lO63NVFvEI36qcctJuMNdO0MpR9gKslR1UU9ar
 hE5S7gcEYYrsMYuVvFSb5mgYfmPI2P8AA0CVgOb419DY
X-Google-Smtp-Source: AGHT+IEtHSmevJ6R5avE3bKBZZosO5sZ+P9hAoOgJtZ8OftQtbIF6mLlVq94OOMFZzJGHDBT5BJrHg==
X-Received: by 2002:a05:6a21:6d88:b0:1f5:7873:3053 with SMTP id
 adf61e73a8af0-1f5c12ec5b1mr4773946637.29.1741973522470; 
 Fri, 14 Mar 2025 10:32:02 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af56e9cd03bsm2990529a12.8.2025.03.14.10.32.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 10:32:02 -0700 (PDT)
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
Subject: [PATCH v5 15/17] include/exec/memory: move devend functions to
 memory-internal.h
Date: Fri, 14 Mar 2025 10:31:37 -0700
Message-Id: <20250314173139.2122904-16-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250314173139.2122904-1-pierrick.bouvier@linaro.org>
References: <20250314173139.2122904-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x629.google.com
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


