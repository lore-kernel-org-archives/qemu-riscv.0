Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67293C28B2F
	for <qemu-riscv@archiver.kernel.org>; Tue, 11 Mar 2025 04:13:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1trqxc-0005Gy-1o; Tue, 11 Mar 2025 00:11:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1trqvf-0003Qp-0x
 for qemu-riscv@nongnu.org; Tue, 11 Mar 2025 00:09:19 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1trqva-0006Xf-43
 for qemu-riscv@nongnu.org; Tue, 11 Mar 2025 00:09:18 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-2ff6cf448b8so9951521a91.3
 for <qemu-riscv@nongnu.org>; Mon, 10 Mar 2025 21:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741666153; x=1742270953; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LEAQ9wvxViIwfRRF7MZBxVkXSE0tKicEinIFunB945A=;
 b=jStkEORuEiUx7wAf2U+aA1KCiAkV6cwUHHiOrEnRDmgGKSVJb2UZe1Fg9DPyRsDI/a
 jKDVa79CAjEfLG8XxrD+bQHfeCVeh11s9p5upgfLfagSNBVyKwawk/9o7Zy/CLZ/Xkoh
 vbAQjlHuOJUI+sqLN+whnkzlx0/nYeBDKtwI1TT/twzJpDKqo6vwW4ykI74SAYHdc2K1
 iNlKWfFRLynnOtOmaIBksiDrWrF3kIWVgQH6GOHCrDp6Cbs+8DZp1GIpXytPoqARRcpb
 zK86xkeTlXZJEd8S7gAaXIeGcnSbHd3cgOaPCL6eocpPJF6NxOJJrR/BqqXiq7nkC6ua
 QtWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741666153; x=1742270953;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LEAQ9wvxViIwfRRF7MZBxVkXSE0tKicEinIFunB945A=;
 b=cYwL4OZYjHC5mVJ1fFq3K+fI4pKxraKcrhwY9RmGE3cCk5hf+pc6Bfx4V3CX9pztMz
 SfyC5DngxnAJWt4dZmGScEIKC6XPN06/0mq1G2PweCqfZLveUPOJMOPNgv1/7oi1ZnVK
 2pnX2xXa9x0fSqlRZ7gJOWmeb2fnMCvtP7byt1UVPQmooRmH6m2dGzjvG6yUQD4OJG1/
 GnT/r8/e1uzq+T/7kz7jZNyba8yeMtx9AVJwgn2DMFSoQuZtlOyWyN9wP6ltK2L9NG/f
 xuxOe60XyuhH6u8IjkGjmU8nDwhwV8j8fetfyeaMwpJnmXS6IhAr7x64Iii3SxNZXJ3G
 luKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUz1q2Y1yjlzdZbA/vq8phICd3ILFv7ZC/GZ5yxIex6YXZFFY2EdnXTMktZE8SOf/sUCmU6sHt0j2yl@nongnu.org
X-Gm-Message-State: AOJu0Yzb+gecpsgm6AHQ+2yQM8KGVPOgdAEiu63OHD0hWSZBnNk3wYjg
 I3LzywGXHhDLhmDkoid35Z7BddvMGrXpjEbmiKe1e/OrOPKMpML9XLDlYR/BP5A=
X-Gm-Gg: ASbGncugCvKpNHzqo3cxq5BQu/elciXK9BNQ24yL4QCjOtdp5or7LZHuVYkIcvaCIxS
 hRXptvq2+iAXf0o/pJ41gFyZP48tkf0czYzCsdxjOXy5+xHHoNxN0lkWWzn26CBFMtDfB8CN3KJ
 4gCkYgn2aPwukxixz3AMV0/PRFkmms0GNJ8lqSEReNXlP1OLxZ9kQCuFppiSLdQO4PG4qEQSsCZ
 XO8UQ6/rfPd7elp6ptervwarNEpvsSXr/kiK9Mbpu+NhLOYCQy+sV5CABemwMI7qpRshpWeefH6
 t4A0laaBe0R6yOuEKGtwLZDPYX7/cYjwHMvzp8HFxHvT
X-Google-Smtp-Source: AGHT+IEEBIqVh4ZJ8rHFVsra/zLBqrrO/2Z7wqCz/tbRxr6Sh6SkveOkvqyI/KznC/OO1HDpbbusNw==
X-Received: by 2002:a05:6a21:4d17:b0:1f5:6e71:e55 with SMTP id
 adf61e73a8af0-1f56e71100cmr14244196637.6.1741666152825; 
 Mon, 10 Mar 2025 21:09:12 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af28c0339cesm7324454a12.46.2025.03.10.21.09.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 21:09:12 -0700 (PDT)
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
Subject: [PATCH v2 14/16] include/exec/memory: extract devend_big_endian from
 devend_memop
Date: Mon, 10 Mar 2025 21:08:36 -0700
Message-Id: <20250311040838.3937136-15-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250311040838.3937136-1-pierrick.bouvier@linaro.org>
References: <20250311040838.3937136-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x102c.google.com
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

we'll use it in system/memory.c.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/memory.h | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 60c0fb6ccd4..57661283684 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -3138,16 +3138,22 @@ address_space_write_cached(MemoryRegionCache *cache, hwaddr addr,
 MemTxResult address_space_set(AddressSpace *as, hwaddr addr,
                               uint8_t c, hwaddr len, MemTxAttrs attrs);
 
-/* enum device_endian to MemOp.  */
-static inline MemOp devend_memop(enum device_endian end)
+/* returns true if end is big endian. */
+static inline bool devend_big_endian(enum device_endian end)
 {
     QEMU_BUILD_BUG_ON(DEVICE_HOST_ENDIAN != DEVICE_LITTLE_ENDIAN &&
                       DEVICE_HOST_ENDIAN != DEVICE_BIG_ENDIAN);
 
-    bool big_endian = (end == DEVICE_NATIVE_ENDIAN
-                       ? target_words_bigendian()
-                       : end == DEVICE_BIG_ENDIAN);
-    return big_endian ? MO_BE : MO_LE;
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
 }
 
 /*
-- 
2.39.5


