Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA17C35FF8
	for <qemu-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 18:37:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tuFJI-0004pB-Fa; Mon, 17 Mar 2025 14:35:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tuFIc-0004Ri-9o
 for qemu-riscv@nongnu.org; Mon, 17 Mar 2025 14:34:56 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tuFII-00068y-RM
 for qemu-riscv@nongnu.org; Mon, 17 Mar 2025 14:34:51 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-22423adf751so80101425ad.2
 for <qemu-riscv@nongnu.org>; Mon, 17 Mar 2025 11:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742236466; x=1742841266; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=949DeBQijWmgHqYCdDdupcSTn3rDdND8nLqwkILEwEI=;
 b=tt5B/BgLLyJp+Jw29O2N7uGLl/bZ65baRl5DQq7mmfslBKZD4dAVBIvHkgzB8npTPt
 qRSm8OedK9p9kxq3PmTc6GepYwkNpICZ9rh8WTpF0c0wp5poKdMujC1Zo9aBFZ0aYe2M
 Idqj0oFKDXPg9jsd7NmwgbrdjM3Ot73FE0V+TwC+YRATtfHGg99r87aVcrgV429UF7cz
 ShG6+Ztf7gy+SFH3MDouqAWNS5py7TyadW86OxX5VYrTB56vJh0ULPMgI1s7hGu3MPUv
 XaNkT554H+OgcsYdH36mQDaJ2CKsTDdV3kLojUwQ7vYXujlKoXLYKAELqBeeAbt2qL3+
 Elzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742236466; x=1742841266;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=949DeBQijWmgHqYCdDdupcSTn3rDdND8nLqwkILEwEI=;
 b=wJ6EanDnsbBqqJqXfB61Vx8LvtwGG6cslNV4mH+9hoAx7PeK1dFHOiF8iJH24Qixfa
 wrmBCIvHnl9B2wmPadlV1+S8yJ8wiPO6X5WD0NAO+FnLKEPIFJgRjJovzSqL2m+f7v6r
 SKdFvHhofzDBVEkGQoBt7mjJZGTXhTmMtZIdhwAVf942DkCLMDLOocxqt24lhzOdLzqo
 USfBLWv496rtRk77aDL72j01TdvwDVmW9s2nyjEw9/Cp7HwBVi7VoCnOd0MMr+znyb6I
 mE9YdRHwfNKjWKOaJdOiJUjtoq+bPqpjtKMyhPJ6d+7ZAAHR+izaV8GImA+OivbMxBHy
 gNRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzpN5WyaaPTcOSaY8D5DeZ5XVEJSHgZWXNWzLre5mwtjrYKVBXLq/mbHwlP+cNoyYr4CNCSEVRmwi7@nongnu.org
X-Gm-Message-State: AOJu0YzeI0sg1cu3h2ZUWmOhQ1HF4+8h1+LagvIkGqjOJW/X+5Pd+nMM
 fWjzz3IIJR50aaB+aGoGINaP8GZLjidlCKZpsTp66Bcwkjhi+rQ3aKChuRaX2jU=
X-Gm-Gg: ASbGncvh0iix3rOneOXoMOk4enIhde5gCJzHMUa8OO5J0K+iodMtlbwlzaiVvUsL45P
 U7a5+1adl5sorCs1myFs56hyXdJ9D3+S+pzjOc16BXlD41cIcXq44hLGSPEikMg0PJeRNRn+lnb
 NksaQSEO/Qyt2ZgBrxk6lGsZzJQg8dftoJISFwtVjU1+8A6pRk5VtUw4FexAiO7NgXQdR8xZ5KZ
 CbhS5+wxvpl/Bx5sKyIX6oEXeB7C2tM/kfSJVhDq/qwz6kItU1+fnSaq6ZmEr4UH8NFlmYf17OC
 EQSNBZaMWjpW2P7vMwjva6cT9gB88n5CA3vi818lXJvR
X-Google-Smtp-Source: AGHT+IEMdkhHnCOZBQ+9EV0uYxPSw6/JcOSk+BrsDVDiw8khDcGewsFrIqa6c3AgQ8Es/TqwcULwNA==
X-Received: by 2002:a05:6a00:139f:b0:736:9e40:13b1 with SMTP id
 d2e1a72fcca58-737224726e5mr14180634b3a.23.1742236465994; 
 Mon, 17 Mar 2025 11:34:25 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73711695a2esm8188770b3a.144.2025.03.17.11.34.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 11:34:25 -0700 (PDT)
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
Subject: [PATCH v6 01/18] exec/tswap: target code can use TARGET_BIG_ENDIAN
 instead of target_words_bigendian()
Date: Mon, 17 Mar 2025 11:34:00 -0700
Message-Id: <20250317183417.285700-2-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250317183417.285700-1-pierrick.bouvier@linaro.org>
References: <20250317183417.285700-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x62b.google.com
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


