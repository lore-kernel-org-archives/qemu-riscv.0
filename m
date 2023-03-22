Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pf6rH-0006VD-B3
	for mharc-qemu-riscv@gnu.org; Wed, 22 Mar 2023 18:23:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf6rG-0006Uy-Lj
 for qemu-riscv@nongnu.org; Wed, 22 Mar 2023 18:23:02 -0400
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf6qW-0006YF-S2
 for qemu-riscv@nongnu.org; Wed, 22 Mar 2023 18:23:01 -0400
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-1755e639b65so20933637fac.3
 for <qemu-riscv@nongnu.org>; Wed, 22 Mar 2023 15:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679523699;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WnZuvoOyH81mzIEVt1YEnFoKwxp+YLpZDq3yraeAc0A=;
 b=OWY4aEneV5GFogaR5EYdgqJy4Vi9IzVUr5zxey1bCN21XWfq78sTfYXaPNK/KjZiRb
 M/hrRT15IDU/zP87NrTeQsdgo71vQfoBUuD20V+N1fNxaSufbVvW5+zi6e5gyyXrvgej
 i4wX+kItl7YWLPZBicv7IUNU/ADwgaC0J3GKlHwR6+W8r8KOW6f4LlMlvjyR3mOQ/f5A
 e3nDd6a5wzJLa1Wq0Sj6Egl4+Tn4ShbYmIEgYyFKb6Hvkzun5LTTB5vXWlriRyfAkF+2
 mv9MsTM2nHchYYd8W3NaLZ5sD6DqLBnF5vhHtPsioi19fQWWV2n41FdWRVCEgbGQ9sv8
 B1Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679523699;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WnZuvoOyH81mzIEVt1YEnFoKwxp+YLpZDq3yraeAc0A=;
 b=X635BDDX7hlc/YbQHfjaqq47wAVlot8z5GioUDlExAmZAyT3uSvyLgCZ3tbtbBO1Pd
 TDit0fzDWWg39+kDFGhXhY/kaQr6mqJQan3FRDTB3Y3Iz/ZvEgg9GYXhYaH7sO3yYb+6
 CQ5RyjW0ueafJLcZznE5bn742RLI+gkGCaOneIwZUIpueVBkbE3zbrreSC8yoW6oI1UT
 UF/QFcnTCaqqyZY4c7oLgJrDghopSHJKPPdEx4qpT0MISr7cb7q2pawgHk7CMAIHVp85
 YazrIxpkjGfOrJ+ogJOEJ4e7iXCoec7Zi3sCzn78BwuKGP3+ObYafDD+vKtNHp8tmNYZ
 1ctg==
X-Gm-Message-State: AAQBX9ffHOzT1nzYy/aUPeK+dfHB0TQDYRj6FJTypVdsF+igxhIGYXNQ
 DbvtdJjORCHXFLXfmZBHvMCbCw==
X-Google-Smtp-Source: AK7set+zKHkfT9ug18RbxYw8swDozTHo4jTqzfDj45y8L/liTEYfefpST3bmZhAtrW1+BYNJzMjBgg==
X-Received: by 2002:a05:6870:e301:b0:17a:d06e:6bdc with SMTP id
 z1-20020a056870e30100b0017ad06e6bdcmr693287oad.25.1679523699702; 
 Wed, 22 Mar 2023 15:21:39 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 ax35-20020a05687c022300b0017243edbe5bsm5586817oac.58.2023.03.22.15.21.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 15:21:39 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v4 25/25] target/riscv: handle RVG updates in
 write_misa()
Date: Wed, 22 Mar 2023 19:20:04 -0300
Message-Id: <20230322222004.357013-26-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322222004.357013-1-dbarboza@ventanamicro.com>
References: <20230322222004.357013-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2f.google.com
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
X-List-Received-Date: Wed, 22 Mar 2023 22:23:02 -0000

RVG is enabled when IMAFD_Zicsr_Zifencei is also enabled. Change
write_misa() to enable IMAFD if G is being written in the CSR.

Likewise, RVG should be disabled if any of IMAFD got disabled during the
process. Clear RVG in this case.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/csr.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 839862f1a8..1c0f438dfb 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1381,6 +1381,14 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
         val &= RVE;
     }
 
+    if (val & RVG && !(env->misa_ext & RVG)) {
+        /*
+         * If the write wants to enable RVG, enable all its
+         * dependencies as well.
+         */
+        val |= RVI | RVM | RVA | RVF | RVD;
+    }
+
     /*
      * This flow is similar to what riscv_cpu_realize() does,
      * with the difference that we will update env->misa_ext
@@ -1396,6 +1404,12 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
         return RISCV_EXCP_NONE;
     }
 
+    if (!(val & RVI && val & RVM && val & RVA &&
+          val & RVF && val & RVD)) {
+        /* Disable RVG if any of its dependencies were disabled */
+        val &= ~RVG;
+    }
+
     riscv_cpu_commit_cpu_cfg(cpu, val);
 
     if (!(val & RVF)) {
-- 
2.39.2


