Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF577C28B2F
	for <qemu-riscv@archiver.kernel.org>; Tue, 11 Mar 2025 04:11:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1trqvZ-0003Nh-MJ; Tue, 11 Mar 2025 00:09:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1trqvP-0003Hv-Vc
 for qemu-riscv@nongnu.org; Tue, 11 Mar 2025 00:09:04 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1trqvM-0006OL-Sh
 for qemu-riscv@nongnu.org; Tue, 11 Mar 2025 00:09:03 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-2ff65d88103so7263360a91.2
 for <qemu-riscv@nongnu.org>; Mon, 10 Mar 2025 21:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741666138; x=1742270938; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=949DeBQijWmgHqYCdDdupcSTn3rDdND8nLqwkILEwEI=;
 b=bIDzTMg5oXhqPdANqq0yUjjZcrN5rnVdj5/OPG7J0z3Tp1I2k2OsPHREKF+XcXXKSi
 6bhP/DSrYWmfgAesqrnFQvxJk9IeIK/M4aD/tKOCBUSVofuM6hUBxXHlkOicNe4xDVnm
 JlIWFPBHWaJjWKt9egYp/OGnzHJ3HpZjcCl3BZrM1Yg85E9qk5ZyTju/TkTL2jOy9h6Q
 Li4LEGcWCmVqZD5Ts6CWjai8eA+zMuAu+QPm0394J3oDd903sUqX3GKcmLzFq88/BTOH
 KDxl943sIBM6mZeP0uKsCG5UMD2Ux+H8ntFFgVADYVfzFilkzMDzjFoKKE9EfDb7lE+U
 fVWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741666138; x=1742270938;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=949DeBQijWmgHqYCdDdupcSTn3rDdND8nLqwkILEwEI=;
 b=nuggmE3wJ+2qFetvAlmTgj4xGwOCijuURHcfYDVv44V/t/MdeHSW6T5qDllIwlvEW2
 oPFBHjnQitU2yU4g7eq4C3CmK4acjfSAAUPbCjOmR5EV2EupamvTh+BEC8Ql5hfIwX1s
 D+riA0FFWfgQ3CkCjcGc6yTuaSSBqwVp1ArXAVEB4o4rogS859AX+XbuW97kAGKXZQ0V
 GrAetxMKVz732H5LTr+VUG6d56R6MnQUi/xkbDJv+FE3ztQVOPzgcY6dZOm/x20cKW/p
 JCz1whG5WWFnJBOyI9+MFRg7YloOfbUF7j4duXKBsx+yIbHXx5D7oOm76ArzDx36Z4od
 4mNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKPTO4/OFD3g1D3gnljQaIh0gsWp2KT6edsKfrK39x9nJWn1Ldr3o1v40qfQspjxaHiT3BEUXg5St9@nongnu.org
X-Gm-Message-State: AOJu0Yz6h2hzFyW1nPEAH/6vCRiWvUqSwOobJUqT3D02sGRICYy0oV5p
 UBoV0miYWri1qJqV4KLXpAcMLd35VHKuIcioWnbqPD2r8M1OSMipDsbZGUHtnL8=
X-Gm-Gg: ASbGncvB7fFVhvqlY4R1kAlo6NTYUnHdlJAc1ODy0fn2dUjJQOk5O4VrWdLIPnuqDur
 Wbt/323nuZ/CTa+S022OJaY0PCdn+Ty0jj2zH7fq5kYjJKjEU9YKGw3IgXMyRDQCiT6N9UTtk+V
 dGw6iYQ0q637bWqEZ6G+GQs6ScpGkVl1wUddAZdLXZVbsF9TXy3tIwnTsJo4rYkiRLPleW3UAdb
 z1MSDxdrXbSGKAhLpnQVhgvNVrmWRONFmZtGDp2fr/WCfBLsnC/SUO1K+EcTxN7nLpmPdzpbhTf
 1ImS4/32dxiPGfiFYMF7LaudoSnT98HB1NenojcL3BkD
X-Google-Smtp-Source: AGHT+IEzBJ4Y504tWVEKTLiAl14rUz4i3nUGGoyaKrgK43oaArjDd5np2LA5f1JQHmiuxtYBHKlEDg==
X-Received: by 2002:a05:6a21:b97:b0:1f5:889c:3cdb with SMTP id
 adf61e73a8af0-1f5889c6dc7mr5899820637.8.1741666138527; 
 Mon, 10 Mar 2025 21:08:58 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af28c0339cesm7324454a12.46.2025.03.10.21.08.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 21:08:58 -0700 (PDT)
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
Subject: [PATCH v2 01/16] exec/tswap: target code can use TARGET_BIG_ENDIAN
 instead of target_words_bigendian()
Date: Mon, 10 Mar 2025 21:08:23 -0700
Message-Id: <20250311040838.3937136-2-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250311040838.3937136-1-pierrick.bouvier@linaro.org>
References: <20250311040838.3937136-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x1035.google.com
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/tswap.h | 11 ++++++-----
 cpu-target.c         |  1 +
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/include/exec/tswap.h b/include/exec/tswap.h
index ecd4faef015..2683da0adb7 100644
--- a/include/exec/tswap.h
+++ b/include/exec/tswap.h
@@ -13,13 +13,14 @@
 /**
  * target_words_bigendian:
  * Returns true if the (default) endianness of the target is big endian,
- * false otherwise. Note that in target-specific code, you can use
- * TARGET_BIG_ENDIAN directly instead. On the other hand, common
- * code should normally never need to know about the endianness of the
- * target, so please do *not* use this function unless you know very well
- * what you are doing!
+ * false otherwise. Common code should normally never need to know about the
+ * endianness of the target, so please do *not* use this function unless you
+ * know very well what you are doing!
  */
 bool target_words_bigendian(void);
+#ifdef COMPILING_PER_TARGET
+#define target_words_bigendian()  TARGET_BIG_ENDIAN
+#endif
 
 /*
  * If we're in target-specific code, we can hard-code the swapping
diff --git a/cpu-target.c b/cpu-target.c
index cae77374b38..519b0f89005 100644
--- a/cpu-target.c
+++ b/cpu-target.c
@@ -155,6 +155,7 @@ void cpu_abort(CPUState *cpu, const char *fmt, ...)
     abort();
 }
 
+#undef target_words_bigendian
 bool target_words_bigendian(void)
 {
     return TARGET_BIG_ENDIAN;
-- 
2.39.5


