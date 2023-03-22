Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pf7HX-00085S-DI
	for mharc-qemu-riscv@gnu.org; Wed, 22 Mar 2023 18:50:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf7HV-00085F-JE
 for qemu-riscv@nongnu.org; Wed, 22 Mar 2023 18:50:09 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf7HU-000216-1T
 for qemu-riscv@nongnu.org; Wed, 22 Mar 2023 18:50:09 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-544b959a971so330698077b3.3
 for <qemu-riscv@nongnu.org>; Wed, 22 Mar 2023 15:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679525406;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gSRdDD81e7A1PCiuRYEMqVD92dtWZhXv26NfXfSATYc=;
 b=Zezz9YRg83vUvMMBQs13M8TxS7ZYnTGU+m+1m/xZo4DLeqwRkYbCp3tRBT0j4n77Q3
 9bZ70e1b4MRZD5auDjfYtZET4AKlwquOQPnbyRYctMYRpsAtfiUYuhgHmP8QR/j7UeJk
 7dlELwupwLYwI/koZPygKnBOYjjoTXA3eXc0YWRqO4ARq6RPbxfcEBWJ44A1RXbWq20P
 dOWoHm2srTBinwRxdeR0ja+TcxqlpuHPcvKe2uvLJQnNCfLbt1WY/4gp9BSmK3FeOxec
 HAOau131vrq5AUJUjT2Dj3+8Khk/eR4ibx1eST/DiLqBK0nr2gYTI435C2ekHoiyLPuq
 jJWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679525406;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gSRdDD81e7A1PCiuRYEMqVD92dtWZhXv26NfXfSATYc=;
 b=jzlSXsOUKt0+gXpbOr7I2D5DTBsjYE87piJgyJ5bU6W//rCdnMODalqbHI+QLj5YVk
 CfPRaCVclDBCDrXtRoFVsH6A0VfkExnyEU8OO5TmLBYsRQ9zIrKDyQ3jhJiVwMPgwT4L
 Qw56XCPceG/C0wK1hVhZqWmdyh0MImGtlMMER+HAjHnJznhoqdZHM3H7Veu9kiz1pA+Y
 gPmXLPo8U8Hs6W8sMzu7wNed1HKHWeyoGQItrvzGXeqsq6tQs0enGd5y9e+jZZxAJhlF
 VRjrAFG0XaYIqqmzSde1gHkaA74BMYtmwrgL/DcTiaAgGFgekWhaoUxsqMShbDDOsakp
 k4IQ==
X-Gm-Message-State: AAQBX9fu5GmutJvMshZRF06pgZtNPxSwzW2X2FtwgXArLbutney5t5o1
 ucivPamunMrVLTQcsUobGNB0xSl1+mWa1cS726c=
X-Google-Smtp-Source: AK7set9bbwcE9m9O1sjfaI5cMsBtmUH6pAgsYqzJuP7tKvD7RSUUk34t53xuVLXbIeZmcM5G1zXiKw==
X-Received: by 2002:a05:6870:c0d5:b0:172:48e:b8c4 with SMTP id
 e21-20020a056870c0d500b00172048eb8c4mr601841oad.17.1679523665259; 
 Wed, 22 Mar 2023 15:21:05 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 ax35-20020a05687c022300b0017243edbe5bsm5586817oac.58.2023.03.22.15.21.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 15:21:04 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v4 14/25] target/riscv: add RVG
Date: Wed, 22 Mar 2023 19:19:53 -0300
Message-Id: <20230322222004.357013-15-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322222004.357013-1-dbarboza@ventanamicro.com>
References: <20230322222004.357013-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-yw1-x112d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 22 Mar 2023 22:50:09 -0000

The 'G' bit in misa_ext is a virtual extension that enables a set of
extensions (i, m, a, f, d, icsr and ifencei). We're already have code to
handle it but no bit definition. Add it.

Add RVG to set_misa() in rv64_thead_c906_cpu_init() and remove the
manual cpu->cfg.ext_g assignment while we're at it.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 8 ++++++--
 target/riscv/cpu.h | 1 +
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index c4f18d0436..f41888baa0 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -274,6 +274,9 @@ static uint32_t riscv_get_misa_ext_with_cpucfg(RISCVCPUConfig *cfg)
     if (cfg->ext_j) {
         ext |= RVJ;
     }
+    if (cfg->ext_g) {
+        ext |= RVG;
+    }
 
     return ext;
 }
@@ -293,6 +296,7 @@ static void riscv_set_cpucfg_with_misa(RISCVCPUConfig *cfg,
     cfg->ext_u = misa_ext & RVU;
     cfg->ext_h = misa_ext & RVH;
     cfg->ext_j = misa_ext & RVJ;
+    cfg->ext_g = misa_ext & RVG;
 }
 
 static void set_misa(CPURISCVState *env, RISCVMXL mxl, uint32_t ext)
@@ -474,10 +478,10 @@ static void rv64_thead_c906_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     RISCVCPU *cpu = RISCV_CPU(obj);
 
-    set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
+    set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD |
+                            RVC | RVS | RVU | RVG);
     env->priv_ver = PRIV_VERSION_1_11_0;
 
-    cpu->cfg.ext_g = true;
     cpu->cfg.ext_icsr = true;
     cpu->cfg.ext_zfh = true;
     cpu->cfg.mmu = true;
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 2263629332..dbb4df9df0 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -82,6 +82,7 @@
 #define RVU RV('U')
 #define RVH RV('H')
 #define RVJ RV('J')
+#define RVG RV('G')
 
 
 /* Privileged specification version */
-- 
2.39.2


