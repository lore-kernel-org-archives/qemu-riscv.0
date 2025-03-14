Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F6A4C35FF3
	for <qemu-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 17:36:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tt8te-0005s5-O1; Fri, 14 Mar 2025 13:32:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tt8sz-0005TK-6i
 for qemu-riscv@nongnu.org; Fri, 14 Mar 2025 13:31:54 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tt8sv-0008Ci-20
 for qemu-riscv@nongnu.org; Fri, 14 Mar 2025 13:31:52 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-22355618fd9so48786895ad.3
 for <qemu-riscv@nongnu.org>; Fri, 14 Mar 2025 10:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741973506; x=1742578306; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=949DeBQijWmgHqYCdDdupcSTn3rDdND8nLqwkILEwEI=;
 b=k9eUbFeTBmoGVOYPQ8Up09RXUz88bSnaKb1unT+uGaXDBfosFE+KdXqBvELADa7TcW
 Por1y54iS+hH+QIi+5XZo6TDb35jDRQTRZJdow6iQ82GDDZqrv1liOJ7mBBdzC/nlj8P
 nnK/ikP+cOf/tPBJ7LI6MKDzqvswBXQLz6rk84bI9uBz4yHDx/2jFdCeXQRes1cGAgJu
 VO0FCmzKj6DJcZWFfm+R2vN7DLvpR9t/CHPVBXw3XRXlpCEHZgwOOFotGJ/FbdesYxhw
 m/cdm4jnfqSAZecp+S4rXzuYjbBu5Z1kic2Hrwi+SeVHobDYVPExTJRSvhaLEifx9ZBb
 kPNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741973506; x=1742578306;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=949DeBQijWmgHqYCdDdupcSTn3rDdND8nLqwkILEwEI=;
 b=pH6pkstk5s7Qe3shKWNIfKrK7y9Ao7iuEau8WNam3hmVwxeJk9Q1PIF1t0lzODM34z
 5sEi0xtNCHgBYO5RzK/YDf3je/IrdCUWGUIbX6jaNw07S+BQFYjt1Kudvi8gtc10r+k1
 TkaFdUh+NnnBE1F7LU7nTsWlNYB9jkxh71/YeVhAmXvZ/gxQAUcmXgCNTFlSBzz03bCB
 ppBxrjXN/ZznZ0aTRl2TEmIKshCHeyIWu757Lsj82miONb54Ex/HjXc+EtYIAgIq1NbU
 zzWNuxQ5Zw1DKvtB82gudemCrwDx22TVD5IdmTdK8uQ77fvjGV2tckvL8CBqZUHbS+nh
 z2Dg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIaWIa3lRJAXhseAiHRP9RmA/7r/udlnkcfV4yWtPRzdn7PoTml7q3qcCgT/YwOmXqUzj4eeRVOe+4@nongnu.org
X-Gm-Message-State: AOJu0Yw+tcLVcK3RayWcdu8eaMiLE2ldgYR9Uy2DSeub5iXQRP0qsFz1
 lKovpCuKeGk4RJ14+hxZjIlYoJbx1/aBXAMjgVGNT2xVsvWaJAjyL83Zv6cm/qk=
X-Gm-Gg: ASbGncuiA/A6qkpY7kmVayWo+OB8618F9Oh0BET88yQ2Y2DaWSrSMc0EwN/AlUiodJL
 QVJ2W8jhmiqp2hNO0ic1tdTsKuzkeESPsdovL/dVZ7mMMS3R3Eq1vaxIy+U7PcZSz7eJxX9epmA
 qa/F/ZZUh/Zy5M1BwgdLaRzt0Em+6RAplPFI2g/izaqVWsJYLcdG49+H9+DdWKlhAXCuVHX4Pdd
 HY0V9Rxss+2enxJbQnPIuwORCQQqFOl91bPFZU5YrdzlMEFyl/LPRcmHeP6g7m3V5ZhVXbMiyhe
 paKQ/7pv/PxWNdxyztv8RDfcHsx6Hp7eC7zfQhZGLgY+
X-Google-Smtp-Source: AGHT+IEjELEcHkUSgYSyUpOQLSDQBfR3q2soKgt+mWzeI9X+HyRoUAOICNrXniu51BG9jWIge0MJZQ==
X-Received: by 2002:a05:6a21:168e:b0:1f5:7f2e:5c3c with SMTP id
 adf61e73a8af0-1f5c113795cmr4514154637.1.1741973505987; 
 Fri, 14 Mar 2025 10:31:45 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af56e9cd03bsm2990529a12.8.2025.03.14.10.31.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 10:31:45 -0700 (PDT)
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
Subject: [PATCH v5 01/17] exec/tswap: target code can use TARGET_BIG_ENDIAN
 instead of target_words_bigendian()
Date: Fri, 14 Mar 2025 10:31:23 -0700
Message-Id: <20250314173139.2122904-2-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250314173139.2122904-1-pierrick.bouvier@linaro.org>
References: <20250314173139.2122904-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x632.google.com
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


