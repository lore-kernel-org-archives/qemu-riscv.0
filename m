Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVdJm-0001iB-Uz
	for mharc-qemu-riscv@gnu.org; Fri, 24 Feb 2023 14:01:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pVdJk-0001gO-Un
 for qemu-riscv@nongnu.org; Fri, 24 Feb 2023 14:01:16 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pVdJe-0002eg-OH
 for qemu-riscv@nongnu.org; Fri, 24 Feb 2023 14:01:16 -0500
Received: by mail-pj1-x1032.google.com with SMTP id kb15so56852pjb.1
 for <qemu-riscv@nongnu.org>; Fri, 24 Feb 2023 11:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677265268;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HiDf99ONuWgEdr4jvynmYG1DeBAM0qjC8eL111ML/t4=;
 b=6IfXpJ7/+BvuG81H1t3laFBqdvrznylWrdGezdtoUydbHJV0f9qMCR1zTzvc8JfhmL
 hj6WaL9wRbTR+kjD+Ef6Q27f+3BtiebDiU/snp/7eeBW8VbNthIWoQobFCvv7XAEpZHL
 SI8eOMWNaVnj3SgpMYbupovpZUkeXAb72w9ZY8edHx8hotUcXTbRMxzAWSDr15vznwkw
 yTXWCm63sUaaIql8OChF6FnGcuNi6D4oIuEy+rnZwXYqNs90jrFsPbUgAFPyM8H1dSgV
 zNmH6LOcCpDvRraWvKfLYVyYQF4OFCKwmDnABdab4mTZVmV+DP7xAhvx+/DTGThPIIDG
 IunA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677265268;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HiDf99ONuWgEdr4jvynmYG1DeBAM0qjC8eL111ML/t4=;
 b=6xNy1sEz0IVJfU6tsSwpGTzE/fapCWUYXY02Cif0BZsGATrEfqfliwsmDkr+Ol13zJ
 rBRiIwykQ9EN6OL7PltI/1rXXfUOmRrA5xt8Q0WxhhAhxS1wBJWUfsPVkgVyW0rhF5SH
 vmOtBGaSkY+xBYrlxBUE8WHT8ykIxENO6064etJ+fpGBY6fwUwXhcu1ioKMu6T/+Aa26
 g3ocpswXdBR6ivgJLMNjn1Y/k/eISaFi6bWkM5Btc/nA/7m9fo2Tojz8bFEJ8bgGl+KO
 9PqTiXkbdYdunvqWTn3s0CadsSVcfv/4uGurYETdNH1Za+iV+2IFeTZ+WowRSGKNPxgq
 Epng==
X-Gm-Message-State: AO0yUKXGAoDgfxyOP9quOp+RsxCEPE4QQuc6RlM3ucZEZdgl1c/icQB8
 MpQXQ2/6e5WxtkU0SQD4psGtCTo9+3DCPSJi
X-Google-Smtp-Source: AK7set+5OithdA7RhJynaPKnbmvKHLNLtUIHWzcbuGZ2Z9uzPR+CgITfWnv/N+uSJ39m/ykQI/ukzg==
X-Received: by 2002:a05:6a20:3d81:b0:cc:32aa:8570 with SMTP id
 s1-20020a056a203d8100b000cc32aa8570mr6886326pzi.14.1677265267930; 
 Fri, 24 Feb 2023 11:01:07 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 k11-20020aa790cb000000b005e093020cabsm2172654pfk.45.2023.02.24.11.01.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 11:01:07 -0800 (PST)
Subject: [PULL 6/8] target/riscv: Smepmp: Skip applying default rules when
 address matches
Date: Fri, 24 Feb 2023 10:59:07 -0800
Message-Id: <20230224185908.32706-7-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230224185908.32706-1-palmer@rivosinc.com>
References: <20230224185908.32706-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Himanshu Chauhan <hchauhan@ventanamicro.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=palmer@rivosinc.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 24 Feb 2023 19:01:17 -0000

From: Himanshu Chauhan <hchauhan@ventanamicro.com>

When MSECCFG.MML is set, after checking the address range in PMP if the
asked permissions are not same as programmed in PMP, the default
permissions are applied. This should only be the case when there
is no matching address is found.

This patch skips applying default rules when matching address range
is found. It returns the index of the match PMP entry.

Fixes: 824cac681c3 (target/riscv: Fix PMP propagation for tlb)
Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20230209055206.229392-1-hchauhan@ventanamicro.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target/riscv/pmp.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index d1126a6066..4bc4113531 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -441,9 +441,12 @@ int pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
                 }
             }
 
-            if ((privs & *allowed_privs) == privs) {
-                ret = i;
-            }
+            /*
+             * If matching address range was found, the protection bits
+             * defined with PMP must be used. We shouldn't fallback on
+             * finding default privileges.
+             */
+            ret = i;
             break;
         }
     }
-- 
2.39.0


