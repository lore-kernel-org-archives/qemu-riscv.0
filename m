Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3056DC282EC
	for <qemu-riscv@archiver.kernel.org>; Tue, 11 Mar 2025 20:05:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1ts5kV-0001HB-TB; Tue, 11 Mar 2025 15:58:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1ts5jz-0000oi-IH
 for qemu-riscv@nongnu.org; Tue, 11 Mar 2025 15:58:17 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1ts5jx-0008UV-8a
 for qemu-riscv@nongnu.org; Tue, 11 Mar 2025 15:58:15 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-223959039f4so120348515ad.3
 for <qemu-riscv@nongnu.org>; Tue, 11 Mar 2025 12:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741723092; x=1742327892; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=949DeBQijWmgHqYCdDdupcSTn3rDdND8nLqwkILEwEI=;
 b=w1mlVKH4kEhNempyiiXq96ZE2QOzsOnrItzWRdZwSZ79IRZl/h/qyDHVUpRctSM9ct
 wqPVKDAOGYZFxdzh3zGSKxN5pPD9IriWWhcFH5x/dfULOYYgE+DQ8A3v/M9tMyqokb0K
 Lq1SmPCUey4wxvLTziidBM2OR1EQYQNey52iAlpaq1BrApyt9DP5rt2AriqFGFDfxCei
 Z3BvoidHsSLtalP+nQjSIsfIUWgJT1G76CTE9IdRXYd/GUtWDsmt8uvj9npI3rli+oaZ
 NNUpnLiFYoU5u4qZTg6G2EGX9/YBrOBoSKp0vKiH0V1glIZ6lMxOVMPagWLuGicow83B
 h6Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741723092; x=1742327892;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=949DeBQijWmgHqYCdDdupcSTn3rDdND8nLqwkILEwEI=;
 b=o9qS5NtCWtpnO2xV0rGpcuF/dnMlWTGSqIj/Strc7P6BNu5dRuaOnUdXlLc6SPFrlT
 OlQ+4alQj5iAzzHIBeAAFenCQbgxI4nnGGqEXO6MO4g2qFiBoTh06tY9tw/BdbEjRb12
 yKa6UpcO10gm6alL35C3ez9YqLmV436yTRBO0kGfAuLFS1JhYrN/LFT9XgOzwnk6Yjha
 XRr4htvG08kyCOWUdvt57Z8ytRlvj4VqG4IRKyzN6X007NFdzMk2VNuSjLb8c75QSERu
 rynj7ATi2Hmq8QZDO1D2CoKTIkUmIYvv2HG0PTcrUpfWmqi4Mx6gmch6kYCWlktsqaNu
 qp3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXus7qyNDbIYPHFMzKpc9DavcEhfK07iIT3wvWw0VL3VLXjgmM47sFl5A+4IbDUjIKmqKYeCBU67Q1F@nongnu.org
X-Gm-Message-State: AOJu0YwxfQ/SyUpHSk1Pzgx5omX7bL5zuXjHKbXo6prHOdrcZN5mXXDq
 W5qT3REX2mez9nig/ldIBBLXkK5Y7TcgQHrxoSC5GV/qqyTpYGSd82CR2oV6RdY=
X-Gm-Gg: ASbGnctGSDIVN33Ptcg1pieHEwAm3fceXXZrsdT/nAPWahnazeyzMNyCBy6mjastx8p
 d3RXLWTvWAtJr7infRc1DKYrOALj9JwnKxsqgU+NA2RWIUv0Qd41Fns9vnVJtN1yghtt0oeKipM
 vKjeTsLy/cY4327kE2DjwGm9Dp8t4iZ4q/M8Iq/GC9/nKoUpKN+L/gXZjpIHs2SK730RjFaayhu
 ii7xVwEzRTHEpc4MSohsY2oY9WJzN9TbiBj8afDXWOlJQoLcVqgDSyOtTbH2UD0v5LfHsUNmmit
 MsIZTM4dtFjQg+djGbdHJoLma8lyQlkhoksq5CDHJxyN8xw1P4lz0fA=
X-Google-Smtp-Source: AGHT+IEdn0vUjdqWf+0ft6dtNABWq7WqhDB4TNeuQtg0nIMIUQeKA5OeniZU9oewAupJBz+i092ynA==
X-Received: by 2002:aa7:9e43:0:b0:736:d297:164 with SMTP id
 d2e1a72fcca58-736d29703d5mr9263457b3a.1.1741723091837; 
 Tue, 11 Mar 2025 12:58:11 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736a6e5c13asm9646981b3a.157.2025.03.11.12.58.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 12:58:11 -0700 (PDT)
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
Subject: [PATCH v3 01/17] exec/tswap: target code can use TARGET_BIG_ENDIAN
 instead of target_words_bigendian()
Date: Tue, 11 Mar 2025 12:57:47 -0700
Message-Id: <20250311195803.4115788-2-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250311195803.4115788-1-pierrick.bouvier@linaro.org>
References: <20250311195803.4115788-1-pierrick.bouvier@linaro.org>
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


