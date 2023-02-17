Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pT4va-0005Dk-Eg
	for mharc-qemu-riscv@gnu.org; Fri, 17 Feb 2023 12:53:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pT4vY-0005Cq-Ow
 for qemu-riscv@nongnu.org; Fri, 17 Feb 2023 12:53:44 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pT4vW-0000vo-A6
 for qemu-riscv@nongnu.org; Fri, 17 Feb 2023 12:53:44 -0500
Received: by mail-pl1-x62e.google.com with SMTP id q15so2862547plx.13
 for <qemu-riscv@nongnu.org>; Fri, 17 Feb 2023 09:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HiDf99ONuWgEdr4jvynmYG1DeBAM0qjC8eL111ML/t4=;
 b=j/x8YpvAWBo+Q43RMSIXgeDpqPlgtgCQPIvEUTcaXItRaErEEpelPgOC5FRtk9haRi
 g10pq5hgFoU6xvhVVNnHdONETNXcYD5OFkZf18zk2vrow+jG4NMrM0MMQo2FF37mjsKZ
 qW/+3QUtKXwi0s5zqsEXkzbjV++8zffqhXAdXOdkykRz0+3K0XwpTBK8HVJvQZW5E85i
 siNwF8sPIeXdYEB7+JuJHg+5Ss4+IAztlM5R8YxuMaEkSzflqNSihD04Evz62Lg9HbJv
 tVUV0/bjTeshxFtoy9F28l/jladBPDYf1/+Y0+yHoCL0IIl/Le7xqGpP+BDGU+mjWEg4
 oHKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HiDf99ONuWgEdr4jvynmYG1DeBAM0qjC8eL111ML/t4=;
 b=eTjmGEKLXZs4TFbD64AnNmfmP8SMw0W/fS7qtjuk58iRAm8ykunzmk/m8bb3g18D50
 MXanXcApV/k02enYa1DraAhjKB3HHldP3UVy0CsQzP/asBcS03m1I57Wa7W3hiSzm9ED
 +SBIhs8+mgmBAa1crPWqzUm6aEU17z5/G345N0+0uashdEfj3QCSJ8Yz0aPwX6KuJdx7
 T6UAFJHnqBc+symdB/h6oqbR2CYe9d5Yfd9AAemjMYIOtXf5xSrmhHQZYOgFOWEq7oLe
 WG0c0alAFmLqNMrk77ZRMQm7Z5zwyTpCWU58jyM5IKrtn2Z4Ky8hvh/tP4rgORxfoL50
 pH4A==
X-Gm-Message-State: AO0yUKU90iETbzVkZijtfXdRKjkpR71GS1hPR0M/ZRbbS8aKDyHYTw2h
 oQBKlaEr7ArmAm8ycYQjxM19vHwtsweZwcbh
X-Google-Smtp-Source: AK7set8cLrh9ubaxGaQ61B6QSmIvqkRxyHzof55qKct5mAnGSZSnYY91YpUYi50MnYpxrPrtV4/1pQ==
X-Received: by 2002:a17:902:ce0f:b0:19a:9434:af30 with SMTP id
 k15-20020a170902ce0f00b0019a9434af30mr1028373plg.18.1676656420755; 
 Fri, 17 Feb 2023 09:53:40 -0800 (PST)
Received: from localhost ([135.180.226.51]) by smtp.gmail.com with ESMTPSA id
 jd12-20020a170903260c00b0019a6e9ae01csm3467601plb.21.2023.02.17.09.53.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 09:53:40 -0800 (PST)
Subject: [PULL 7/9] target/riscv: Smepmp: Skip applying default rules when
 address matches
Date: Fri, 17 Feb 2023 09:52:01 -0800
Message-Id: <20230217175203.19510-8-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230217175203.19510-1-palmer@rivosinc.com>
References: <20230217175203.19510-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Himanshu Chauhan <hchauhan@ventanamicro.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=palmer@rivosinc.com; helo=mail-pl1-x62e.google.com
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
X-List-Received-Date: Fri, 17 Feb 2023 17:53:45 -0000

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


