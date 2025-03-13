Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6FDDC35FF3
	for <qemu-riscv@archiver.kernel.org>; Thu, 13 Mar 2025 16:42:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tslaa-0003J5-KK; Thu, 13 Mar 2025 12:39:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tslaX-0003HR-Ds
 for qemu-riscv@nongnu.org; Thu, 13 Mar 2025 12:39:18 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tslaU-0005am-6d
 for qemu-riscv@nongnu.org; Thu, 13 Mar 2025 12:39:16 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-2ff694d2d4dso2177946a91.0
 for <qemu-riscv@nongnu.org>; Thu, 13 Mar 2025 09:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741883952; x=1742488752; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=949DeBQijWmgHqYCdDdupcSTn3rDdND8nLqwkILEwEI=;
 b=pO1qkPN3xq41woDABhcVXxQXEMO51Cno0Z1gcYZyej63JZEb8VkYQKvgZDVMxwixx2
 8dRYsjb1ZLYa5U/zvdYxUXQ8tdxSmXbqwWG65isMWlF3+x+ftn4IeASC9VvfktWcrt1B
 /ZqZBqiay1pBYfxSzdTWa3RH2plY53bVANXtY27WgilGKuyLwDZRpWAalfVkBDyR7JVE
 ykiYZpkU3TU+EsZlCMOfqEML6blvPah395Cu68vjLkJG8uvRDYJ+dKxH+FZuz7957DpG
 9+xsgKa3e/EY1jxxudOZ4vQ+ngPDbCHY6mYdLU1+9cfoRgCGfl71xNp6rU1QDWlSDFks
 kisg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741883952; x=1742488752;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=949DeBQijWmgHqYCdDdupcSTn3rDdND8nLqwkILEwEI=;
 b=KZo1+uhiXQ1scZxbMYAh8PZgoN84/s0BIv4mIUsHZrLtc7h1xwby2Rh9xuclCICIm8
 WKhNKPAQ4S8eGJf8Y/sW4CbDRCtO7+tEajMD98xI23SZpRumXkPFLCzNnDkLXvSos84s
 gVi8id4TzMKlkZ3iJPzBxQxLMR6kniuIQB2NfXZ544cGCZiYz35qv5k+9s/AF7Zl8IG3
 1DGqN7go5XHyx3iMYlOmNAC7lftfmgdJmgd2vVw1qbJtbQDdByU8O1rn8wiMYAf/h4BX
 9Mb07bO5ZRdrQVyPxshhtW0azAW2EkbvH51tWRIN8YCvo83Dkh0PGTMqnrJxNlj1GVBq
 oQuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtB+5bjm+spmBQXnpEwQ6pXl5ByVDLv0zBKA5KItvxSyral8z4w1I4P+8bOum3cSij7DXcHOdECGhy@nongnu.org
X-Gm-Message-State: AOJu0Yx1S4U6SC9/F31PYeWuQY5ehrQx4+GsesNCXk2kMaLhjGRxpoju
 CWsfn4sMU85WA0XF6GOQ24pBpGNNgmmJ5sXvvzU9v+nK0DYtEpG+ipH4jIVOrTI=
X-Gm-Gg: ASbGnctBwl7BRSjCwNZgNQgDc9ohdToEBs7hy4x7B8fsw2mtxs1KB6tsGDnDk48rNKX
 6j8hAeQZm2bxVXAoiXiU9CBAI0/HN7q4aF5f0e83F+Zg7y3Znn7pxDB3px5+bEGX8odsamike4b
 NZ+mHtpQIb/X2MFw/YJjgX06u2fI5ObeBX60F0nelFYIIe68ebv0xp2byipTiGcO6+XimEQ8NZ4
 q9/XrGaBXbx1WA5Vs1H6y0G+1zW0VxlTn0j1ESL5K63SPVpbBVSpzBlBnsVXiZRhhi9y0+JGojp
 hv8D6FuI/On4duxPeuSdff8UZkpVloptP/rRvHSD+Q14
X-Google-Smtp-Source: AGHT+IGev37PyaCRPVTSAXm6sa8QmcuQfkCR4AEqF/Tkfr+Zh7Bhff2KfoPULWlCloRr8rbLF7MLgw==
X-Received: by 2002:a17:90b:3850:b0:2ff:7b15:813b with SMTP id
 98e67ed59e1d1-3014e855f52mr302864a91.17.1741883952691; 
 Thu, 13 Mar 2025 09:39:12 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30119265938sm4020084a91.39.2025.03.13.09.39.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 09:39:12 -0700 (PDT)
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
Subject: [PATCH v4 01/17] exec/tswap: target code can use TARGET_BIG_ENDIAN
 instead of target_words_bigendian()
Date: Thu, 13 Mar 2025 09:38:47 -0700
Message-Id: <20250313163903.1738581-2-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250313163903.1738581-1-pierrick.bouvier@linaro.org>
References: <20250313163903.1738581-1-pierrick.bouvier@linaro.org>
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


