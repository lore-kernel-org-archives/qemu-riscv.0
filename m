Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 974C7C25B74
	for <qemu-riscv@archiver.kernel.org>; Thu, 16 May 2024 17:11:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1s7ecq-00031r-GO; Thu, 16 May 2024 13:10:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1s7ecc-0002wv-Ju
 for qemu-riscv@nongnu.org; Thu, 16 May 2024 13:10:28 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1s7eca-00073l-RO
 for qemu-riscv@nongnu.org; Thu, 16 May 2024 13:10:26 -0400
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-5f415fd71f8so359723a12.3
 for <qemu-riscv@nongnu.org>; Thu, 16 May 2024 10:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1715879423; x=1716484223; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v6MYc56L3fcEf1EQICqMxhN7hDYNOLRBmuy96VA1LD4=;
 b=UxvDf4+OwrkSHWuBCjUjUGDDGUNr1USZ+j3Ec4dJoIpttxafw4BMsFJfIhczYSoCkl
 vq1s12iJ9opxNogznFo6QQ34F4tRe0aSaJXKJrR20oeDqJgPrz0ISBKXQdj5psRO3Vcj
 FJ78klk07/hmXf6d9bTJ/CWRpCRkeDcThfOIVY6pJzeZQGvWOI5XkQmKZdyWZQQF5MtJ
 DVBIIzOtFMAQU8O2LeAkjdWOg3pB74Nr1kWBaX84VezcbOJQTCutyoTCyva5oWGI4eZa
 2GPX0KnZpQUq73vKDrXBcxVbv23zrBgagvA18ktkFdaoqMjnA9qkMfTwWX1JljWgrKRp
 VUOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715879423; x=1716484223;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v6MYc56L3fcEf1EQICqMxhN7hDYNOLRBmuy96VA1LD4=;
 b=ZgZGjYQG+TcuQwofA6VmsiICg0F8MJJDVi4ktfmiA9G+Fzi9E9uS9WZwN6hdUiJARY
 mOLI1zQ/2+p0ZyWY35OTTGdsB086Be0DPflCnfliXbgTqHqaSQM6daA4pvnlYmyvdooW
 MkKRqVwsIak3qbJvcsGRVymCThuL125jUwBfgO3e2TVZFckE1lRA2qu5+z6CVrYjgmkI
 SOxrodJSJ+hj/YuUeAW5BGCG7yGrCR4OsPf1sLXHioj8C/cG0yTks1VAhgvehgV5XVHW
 Ci1tx8Llu2rcFN2hSH7Uxn9krEiD/fhHxkD1Ql6hJxwEG5zr7mfCNzuFmL5oitCGWOOo
 vsPw==
X-Gm-Message-State: AOJu0Yz6fm8P14oBS9ENEHRizDv1yQxZY2aw4HYsno7CUJ8z3+1zyfJW
 AB33ysvwMWZk9fOfqJzXdX5+QqP/wwv+B7sP9rnjUUrykXvm206I1FE7VPUUHJ0=
X-Google-Smtp-Source: AGHT+IHKZ1qOZ59PumbciG7+k8RWfU0f5DC7ip32JLPXvJwJnuH47+naw9HGzHUSWhliR7FVR3YuKw==
X-Received: by 2002:a17:90a:b383:b0:2b2:6975:bf49 with SMTP id
 98e67ed59e1d1-2b6cc34033amr16752125a91.6.1715879423252; 
 Thu, 16 May 2024 10:10:23 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.94.42.57])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2b628ea6aadsm15769257a91.50.2024.05.16.10.10.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 May 2024 10:10:22 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 akihiko.odaki@daynix.com, alex.bennee@linaro.org, mjt@tls.msk.ru,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Robin Dapp <rdapp.gcc@gmail.com>
Subject: [PATCH 1/1] riscv,
 gdbstub.c: fix reg_width in ricsv_gen_dynamic_vector_feature()
Date: Thu, 16 May 2024 14:10:10 -0300
Message-ID: <20240516171010.639591-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240516171010.639591-1-dbarboza@ventanamicro.com>
References: <20240516171010.639591-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pg1-x532.google.com
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

Commit 33a24910ae changed 'reg_width' to use 'vlenb', i.e. vector length
in bytes, when in this context we want 'reg_width' as the length in
bits.

Fix 'reg_width' back to the value in bits like 7cb59921c05a
("target/riscv/gdbstub.c: use 'vlenb' instead of shifting 'vlen'") set
beforehand.

Cc: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Alex Bennée <alex.bennee@linaro.org>
Reported-by: Robin Dapp <rdapp.gcc@gmail.com>
Fixes: 33a24910ae ("target/riscv: Use GDBFeature for dynamic XML")
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/gdbstub.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index d0cc5762c2..358158c42a 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -288,7 +288,7 @@ static GDBFeature *riscv_gen_dynamic_csr_feature(CPUState *cs, int base_reg)
 static GDBFeature *ricsv_gen_dynamic_vector_feature(CPUState *cs, int base_reg)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
-    int reg_width = cpu->cfg.vlenb;
+    int reg_width = cpu->cfg.vlenb << 3;
     GDBFeatureBuilder builder;
     int i;
 
-- 
2.44.0


