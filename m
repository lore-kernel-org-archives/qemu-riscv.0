Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B2C0C369D3
	for <qemu-riscv@archiver.kernel.org>; Fri, 25 Apr 2025 16:52:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u8MGn-0006Re-J1; Fri, 25 Apr 2025 12:51:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1u8MGV-0006Me-EY
 for qemu-riscv@nongnu.org; Fri, 25 Apr 2025 12:51:04 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1u8MGS-0006xl-8A
 for qemu-riscv@nongnu.org; Fri, 25 Apr 2025 12:51:02 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2243803b776so43324535ad.0
 for <qemu-riscv@nongnu.org>; Fri, 25 Apr 2025 09:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745599858; x=1746204658; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ayh9uUapKIYXic2i8rYkQgbn/Z8hKtLS75uVQvb84DQ=;
 b=zn0Z1JRp/FYrOqqsK9TNqBe236GOn+02v7SqhlY9xOd2fkZylegGhUuKCV/IKa62zg
 YwcDrSdKx1SQbYbJFHajw8X12WIUZeVTxD44RUJcWMu/dvBmykcGF11tpwTYFosB4QI5
 3GX9e4yBj86zCR0ugpgOgEn7ZW3ikw5/jWlIRQIGDoDbZvNrzGpQT2P4VwoEmC6MCW24
 qgkti5AVYcR2+5szRCJS12OIFpaVEQuzpIo84kI3vXP4VX2VhsVOnKOPc1tMHceZNUIn
 wOlOIjxtgSRJUJrwpg5rB2yYXLpxRV7M6ypO4XpoOGNPCPdwSaVc26Dt+VQ9MMlCCiS7
 FeMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745599858; x=1746204658;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ayh9uUapKIYXic2i8rYkQgbn/Z8hKtLS75uVQvb84DQ=;
 b=Wy4lRJDJjNBR0rNLub+62GmoVm1xgU8zSND9i+WYT5aPyqG/Y/pFiRqpRZEugPFGCi
 3TJO9tvFjVHA7DBRIrnW0yfZ9bt/9vtHWZu5UlRa0n2KBUaWCZlUmoNuDmgIWAZX9MVl
 Hw+3dFgSGcG2pBqKK8iHLLPCTJVmWvuDDSsaHdAzeJS3a33TKfzU6dKaMl0y1C2B6TN6
 Sv66EWjSiyzVrk2Si1+BKaJaxnGzycLcnsaynLjUCphRT6kB4aPi2fd9JMDGd7chQHhv
 OUcvH/o2t4THLzZgqJwymNU5ZCdE8TnDPuh5qhHmNy60GtnOY9W/cI+UMbk4YyUSegla
 njtg==
X-Gm-Message-State: AOJu0Yx/sWYHl4tMq95JsMcH2ZsvCfqXxRM6GZvhRJPfR7BjBzGftlbp
 BAsQnlVo9yse9553qmzaljv6LRShq7mFhaUV9suPDS0Sv5sRaMjsOYrc5lATI3w=
X-Gm-Gg: ASbGncvIALS3GPsNCXbvDLjfOBb4qw6dbNOkVEoIoq8Ear8kRRbN6BJURUxI/ZC+eFa
 nQdeyAIkBNhxQ1qVFnnL7wMWElKf14MMv8mGOyGGW2XtIEUVT1r32cJqjLuQK1qBrDf+wtwJuFS
 uaRTeVhO3ZzHY5wTPEFllfaN3AqvOilMdXttKgFRJDPb5AF8xBfCcBXdKSEYvZGhaEo3GCK0Iic
 GjtirnXd9hcI2o36ZioDpVqEaNbzCTe70d+pob6WOR1f3abSuaA9S9cE8YrVQPMUmx0xV8w5/Su
 YYTkMd7xhoygv9etV4hVfMlJf2YneG1ZCTg1p3H6Gm6iaLswjV7xP3oHYJEhS/gRnuH5V+0Iy3s
 bz5mWKjTAgw==
X-Google-Smtp-Source: AGHT+IHMZ236ZscVrOC8TVqcE77W7laennAZiK3jnVteUT1rVqqxGZ7dFbAJr09iURZAvQmfNLuDHw==
X-Received: by 2002:a17:902:db05:b0:223:517a:d2a3 with SMTP id
 d9443c01a7336-22dbf5da7a2mr44862515ad.17.1745599858482; 
 Fri, 25 Apr 2025 09:50:58 -0700 (PDT)
Received: from stoup.. (71-212-47-143.tukw.qwest.net. [71.212.47.143])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22db50fff4dsm34637305ad.159.2025.04.25.09.50.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 09:50:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, dbarboza@ventanamicro.com
Subject: [PATCH alternate 2/2] target/riscv: Fix write_misa vs aligned next_pc
Date: Fri, 25 Apr 2025 09:50:55 -0700
Message-ID: <20250425165055.807801-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250425165055.807801-1-richard.henderson@linaro.org>
References: <20250425165055.807801-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

Do not examine a random host return address, but examine the
guest pc via env->pc.

Fixes: f18637cd611 ("RISC-V: Add misa runtime write support")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/csr.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index c52c87faae..992ec8ebff 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -2111,10 +2111,13 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
     val &= env->misa_ext_mask;
 
     /*
-     * Suppress 'C' if next instruction is not aligned
-     * TODO: this should check next_pc
+     * Suppress 'C' if next instruction is not aligned.
+     * Outside of the context of a running cpu, env->pc contains next_pc.
+     * Within the context of a running cpu, env->pc contains the pc of
+     * the csrw/csrrw instruction.  But since all such instructions are
+     * exactly 4 bytes, next_pc has the same alignment mod 4.
      */
-    if ((val & RVC) && (GETPC() & ~3) != 0) {
+    if ((val & RVC) && (env->pc & ~3) != 0) {
         val &= ~RVC;
     }
 
-- 
2.43.0


