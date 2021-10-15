Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbHvk-0005XW-IF
	for mharc-qemu-riscv@gnu.org; Fri, 15 Oct 2021 03:47:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHvj-0005Tg-6Z
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 03:47:03 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:36550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHvh-000236-Ej
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 03:47:02 -0400
Received: by mail-pf1-x42a.google.com with SMTP id m26so7702272pff.3
 for <qemu-riscv@nongnu.org>; Fri, 15 Oct 2021 00:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YKDZvsFfrcqUaND6Ypeeqcrc1C7r0SxXNdTD0IBK5xY=;
 b=R4i/kexnRTU4oJR8z6r3I9hPIA5XGLVLaC1yvJXrFzGeXU+F3wzcrIJza5UR5Cgpp7
 uUa9gH9Y+j304wrVLiqQxoTPsP2FUEEuP8niiaPHECF0BOxgZasKR1bdJRHr9NZ4xYXg
 v7x5FVSACmue84SXt+D/5PLoqCZBRCBHEN+C/7GkAqoB/kWqEKdsos0KXPb7LqOHTudh
 OruysBw10ZH3ZadTMwmt1dxDasgAH/e8EQmndrs4+0hYjuV/OqBTbn5AO/jCfoJvGP1q
 7Kd/OynYS9D4zMXaaCTzGrABJqnVJGPgsRCs/z0AogxOmNmBGKgGW9LUBE0jzqW14uNN
 kYLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YKDZvsFfrcqUaND6Ypeeqcrc1C7r0SxXNdTD0IBK5xY=;
 b=grBwEzFhH0jbh88AURRi1JlJTgN2x/WGrUTgsptGrBREuzxbU4mG9UPzkLdz8zJ3YK
 00oFuJHvGF/CGEfo/SiTo49hyNnmMrViSPJ+aHmONVT1VesuN6OzMyTJA7f7nsE616Qu
 OA1otZ7jXvpwsDqrwNGTrxjYAagObcrePtlfopgBtp6UKWCnGKb1Dgn3Mkf81toEy0Wo
 kp0fnAs5mG0BWwillytAryZd+AA3T+SSW2Ayxce5Xu/wZnxvT26a6UJXehgO+VsJeJPQ
 fuC6qmmPKsb2tFLxBB0IeOA1VD90+/3K/yrSqLaanSHh6Sh7ybNHPlrWyrchNkGug72J
 /sDw==
X-Gm-Message-State: AOAM532q6uPLI1QZ/+sB/sbziJ3UN0HQqXEHRdCfgEfkPFrvCFX3aBgc
 Bv3atu0i5pcL9x0o2g2DgVtja/DXnfTwy1Cm
X-Google-Smtp-Source: ABdhPJwvKOXmExC9jaNOU/G46qc7ONE1p4I97K+vB8f1lZqOJivnZpNEvhT5w2aJ333/VSLPQnRwEg==
X-Received: by 2002:a63:d354:: with SMTP id u20mr7814798pgi.382.1634284020226; 
 Fri, 15 Oct 2021 00:47:00 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id z13sm4271680pfq.130.2021.10.15.00.46.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 00:46:59 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v8 06/78] target/riscv: rvv-1.0: introduce writable misa.v
 field
Date: Fri, 15 Oct 2021 15:45:07 +0800
Message-Id: <20211015074627.3957162-7-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015074627.3957162-1-frank.chang@sifive.com>
References: <20211015074627.3957162-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Oct 2021 07:47:03 -0000

From: Frank Chang <frank.chang@sifive.com>

Implementations may have a writable misa.v field. Analogous to the way
in which the floating-point unit is handled, the mstatus.vs field may
exist even if misa.v is clear.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index d8a3010140e..2734c223369 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -610,7 +610,7 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
     val &= env->misa_mask;
 
     /* Mask extensions that are not supported by QEMU */
-    val &= (RVI | RVE | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
+    val &= (RVI | RVE | RVM | RVA | RVF | RVD | RVC | RVS | RVU | RVV);
 
     /* 'D' depends on 'F', so clear 'D' if 'F' is not present */
     if ((val & RVD) && !(val & RVF)) {
-- 
2.25.1


