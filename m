Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3347C25B75
	for <qemu-riscv@archiver.kernel.org>; Thu,  6 Jun 2024 13:50:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sFDV4-0000oD-By; Thu, 06 Jun 2024 09:49:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1sFDV2-0000ni-GB
 for qemu-riscv@nongnu.org; Thu, 06 Jun 2024 09:49:52 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1sFDV0-0008Tl-Qn
 for qemu-riscv@nongnu.org; Thu, 06 Jun 2024 09:49:52 -0400
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-681ad081695so755456a12.3
 for <qemu-riscv@nongnu.org>; Thu, 06 Jun 2024 06:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1717681789; x=1718286589; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L6wLMki1LmAn7oxGxrUEW0kbk4sc1N/F5qCG2xNjuRg=;
 b=S/9hvRbCFyOM+493LiFzqPyE8wFJk/HslO1TB4RksO/KHQRJktU4mpOs8IHevZ29kn
 Z3FQgTuMuAJzlfxEEEGKr7hXgeqDUmMyqphmfqNQ3PpRz6DB0Xpf+GuUicCexrtAH483
 aDoMm7mLn0lu2h23YJMZtWZ1WznZchbH1yTlqcwjT+jeJjvNqjPCMDYCNNjkfuUaRA6u
 lQDfMqmebsI5DamJ3FaIYJKDyCx3Hr0ZrY6x12OJcjGKrokwtRruh8ecsBd9ikCqgqPy
 DYW6ATUnSgqPEO1TvMNOf+Tp8WdV/AMPz/IZ6CynAK54QzWjjQ0VzHVwZ/r8K52FY88I
 WTCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717681789; x=1718286589;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L6wLMki1LmAn7oxGxrUEW0kbk4sc1N/F5qCG2xNjuRg=;
 b=vuTqX/IhN+CMEEcbBsjw/7nh3UGPDZj1UvpkmxIwNbFShisj6lUWNCv3fTQKsLJlD7
 3HfDBHkqz6LVgsCZOm+vv3xXMz7B0dQpI3KMmLcWu+z0INlLOBYO6OB9b/mcVfNSomo8
 H9Cmh307lWQ5MqlKk9vhyxK+Qzp2s6pAWwlxbWIwvEdWXqeDQ95up5iCFuq20QFWYYJN
 yFSS4k4oDs9MuPVsQgH04dST7ojDfZNZHvt0nKcbPl656RUZEDchcY5+nV7+/Lvqf52N
 npn6zs2B97fB4sSlDBoIqJgUNnykV0TBwAbtjjvB09cDs+kmFkaaTtQRkhFvgC7APAp+
 e8Iw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfWx0mgVBy6RqJS9Sz5si3KL5GbGSuc35zlAFYEOHJ5EG3CxbnXujp1zc1CELB/hjYPVN18YBHaXU9MHs6J5pXwlmzUuY=
X-Gm-Message-State: AOJu0YwbismaSfd9shyNnWchet2R37yQqpsraPJcJtwwlYLYqz6LYWJ7
 psTrcXeBuCxPAgW3xfVrDxeJFkvu+PZLHp3Z9+KyWWRh79ol4dvaNFEQqw0a2/k=
X-Google-Smtp-Source: AGHT+IHjmp64ORkua8NR/qN+Wy4JpmNP++CIZLQSFFwXZWRAAbrZ5Riz2KkLH3iHtXMMUSbZdepEVw==
X-Received: by 2002:a05:6a20:3955:b0:1af:8a3a:35d7 with SMTP id
 adf61e73a8af0-1b2b712dfabmr6446686637.39.1717681789270; 
 Thu, 06 Jun 2024 06:49:49 -0700 (PDT)
Received: from hsinchu36-syssw02.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-703fd50bc86sm1150919b3a.175.2024.06.06.06.49.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jun 2024 06:49:48 -0700 (PDT)
From: "Fea.Wang" <fea.wang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "Fea.Wang" <fea.wang@sifive.com>, Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v4 3/6] target/riscv: Add 'P1P13' bit in SMSTATEEN0
Date: Thu,  6 Jun 2024 21:54:51 +0800
Message-Id: <20240606135454.119186-4-fea.wang@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240606135454.119186-1-fea.wang@sifive.com>
References: <20240606135454.119186-1-fea.wang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=fea.wang@sifive.com; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Based on privilege 1.13 spec, there should be a bit56 for 'P1P13' in
mstateen0 that controls access to the hedeleg.

Signed-off-by: Fea.Wang <fea.wang@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Weiwei Li <liwei1518@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_bits.h | 1 +
 target/riscv/csr.c      | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index a470fda9be..c895aa0334 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -315,6 +315,7 @@
 #define SMSTATEEN0_CS       (1ULL << 0)
 #define SMSTATEEN0_FCSR     (1ULL << 1)
 #define SMSTATEEN0_JVT      (1ULL << 2)
+#define SMSTATEEN0_P1P13    (1ULL << 56)
 #define SMSTATEEN0_HSCONTXT (1ULL << 57)
 #define SMSTATEEN0_IMSIC    (1ULL << 58)
 #define SMSTATEEN0_AIA      (1ULL << 59)
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index ee33019b03..a19e1afa1f 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -2252,6 +2252,10 @@ static RISCVException write_mstateen0(CPURISCVState *env, int csrno,
         wr_mask |= SMSTATEEN0_FCSR;
     }
 
+    if (env->priv_ver >= PRIV_VERSION_1_13_0) {
+        wr_mask |= SMSTATEEN0_P1P13;
+    }
+
     return write_mstateen(env, csrno, wr_mask, new_val);
 }
 
@@ -2287,6 +2291,10 @@ static RISCVException write_mstateen0h(CPURISCVState *env, int csrno,
 {
     uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
 
+    if (env->priv_ver >= PRIV_VERSION_1_13_0) {
+        wr_mask |= SMSTATEEN0_P1P13;
+    }
+
     return write_mstateenh(env, csrno, wr_mask, new_val);
 }
 
-- 
2.34.1


