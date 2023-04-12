Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pmWbg-0007Cx-9C
	for mharc-qemu-riscv@gnu.org; Wed, 12 Apr 2023 05:17:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pmWbe-0007Ch-Pp
 for qemu-riscv@nongnu.org; Wed, 12 Apr 2023 05:17:34 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pmWbR-0004j9-5v
 for qemu-riscv@nongnu.org; Wed, 12 Apr 2023 05:17:34 -0400
Received: by mail-wm1-x32b.google.com with SMTP id gw13so6083871wmb.3
 for <qemu-riscv@nongnu.org>; Wed, 12 Apr 2023 02:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1681291038; x=1683883038; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LGpSnkBJ4zhtllDlsdgv+XdCiU1d9KOkSdJhsZZctEQ=;
 b=fOs2MMJ6Q7qjToXaPLq5eUZwBzWFpsW4rgN9Vxh224sdufPPCrP53BTbXveVZyI+SO
 Bfsl4R03y8oMqMFORO9iZerXlUARhHjjZYP/f9MbWnDRjhBQt14/KY5N4LMIUKYmL4Uq
 AxJ6dc5BCnHCvJJwRKqXtxPmTkZNjRjr7SGmAhrQ5eFFxTkB3xGZeBX10NJjsYmbnTx1
 ehSD3Neweo8HZAtzydwf8bKCNxJ+HYx9uhDTzh1nyjse/zjL1dR6m8POP82cbl/oUKzE
 fIFH2Qa7Ngp2ICdDzy4CSZ/jT42Q9S7r/HNv/mJcbfn9UqbHx1fVh+IPNRS5vnd5QF3j
 cJJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681291038; x=1683883038;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LGpSnkBJ4zhtllDlsdgv+XdCiU1d9KOkSdJhsZZctEQ=;
 b=HfWz6BouMxhZxpfGXMxcOaBlIfht91a7+xLYm8p8tN5s+vLw5MWshrjFuZPiViUDhS
 EEz9tA/FcPRGax6XQD7M3sMjN7ojzzw/v+w4KjPhPdhAy3KgWdZwpY1aLm9BUMzVvQBn
 x4sHZSboQrl1910PpWP3M+M/5lMZ2ipd15c+6O4F13Ch52wQrtRH0o8rs2QQWsskYdFO
 u9+nq8mQ8tiiJSNlPtW1+n0EM+XbZ7/BPhD+I7jmpUCO/MuOAE6xULtpApd5bR6dpB7q
 hCf3wZmL2A8CFOfED3ex5EjHqn3R5jF7ftjEZBgBx/mFeO6KHKfxN9kM74IUhsEumPCO
 xHxg==
X-Gm-Message-State: AAQBX9cwt/0Cs/8FQ6v4sxe+E6APepi8nvRHTYA1hleCQmWKmyuuIFrP
 cnBZ2bAeS+mbgNRKlxAQjAsVQw==
X-Google-Smtp-Source: AKy350ZaSHVzlgHTmWDXxlLFU90DnFK09dj58Wf2yIKeQ42MhmQUgGlweo0od2oNn09h4VV29EjBfA==
X-Received: by 2002:a1c:f609:0:b0:3ed:3d89:1b4b with SMTP id
 w9-20020a1cf609000000b003ed3d891b4bmr12129585wmc.8.1681291038507; 
 Wed, 12 Apr 2023 02:17:18 -0700 (PDT)
Received: from alex-rivos.home
 (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
 by smtp.gmail.com with ESMTPSA id
 s5-20020a7bc385000000b003edcc2223c6sm1668271wmj.28.2023.04.12.02.17.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 02:17:18 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Andrea Parri <andrea@rivosinc.com>
Subject: [PATCH] riscv: Raise an exception if pte reserved bits are not cleared
Date: Wed, 12 Apr 2023 11:17:16 +0200
Message-Id: <20230412091716.126601-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alexghiti@rivosinc.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 12 Apr 2023 09:17:35 -0000

As per the specification, in 64-bit, if any of the pte reserved bits 60-54
is set, an exception should be triggered (see 4.4.1, "Addressing and Memory
Protection"), so implement this behaviour in the address translation process.

Reported-by: Andrea Parri <andrea@rivosinc.com>
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 target/riscv/cpu_bits.h   | 1 +
 target/riscv/cpu_helper.c | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index fca7ef0cef..8d9ba2ce11 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -640,6 +640,7 @@ typedef enum {
 #define PTE_SOFT            0x300 /* Reserved for Software */
 #define PTE_PBMT            0x6000000000000000ULL /* Page-based memory types */
 #define PTE_N               0x8000000000000000ULL /* NAPOT translation */
+#define PTE_RESERVED        0x1FC0000000000000ULL /* Reserved bits */
 #define PTE_ATTR            (PTE_N | PTE_PBMT) /* All attributes bits */
 
 /* Page table PPN shift amount */
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index f88c503cf4..39c323a865 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -936,6 +936,11 @@ restart:
             return TRANSLATE_FAIL;
         }
 
+        /* PTE reserved bits must be cleared otherwise an exception is raised */
+        if (riscv_cpu_mxl(env) == MXL_RV64 && (pte & PTE_RESERVED)) {
+            return TRANSLATE_FAIL;
+        }
+
         bool pbmte = env->menvcfg & MENVCFG_PBMTE;
         bool hade = env->menvcfg & MENVCFG_HADE;
 
-- 
2.37.2


