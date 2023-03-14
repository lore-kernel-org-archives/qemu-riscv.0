Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pc7rL-00069S-IJ
	for mharc-qemu-riscv@gnu.org; Tue, 14 Mar 2023 12:50:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pc7rJ-00064c-RN
 for qemu-riscv@nongnu.org; Tue, 14 Mar 2023 12:50:45 -0400
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pc7rH-00032C-UD
 for qemu-riscv@nongnu.org; Tue, 14 Mar 2023 12:50:45 -0400
Received: by mail-oo1-xc29.google.com with SMTP id
 bd3-20020a4aee03000000b00517affa07c0so2406133oob.7
 for <qemu-riscv@nongnu.org>; Tue, 14 Mar 2023 09:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1678812643;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UkqYwjMeffkjPjp5cMWVsaWAzAtPS7xe9pFJYyoNEaE=;
 b=IfIjmZgQBovpc1OGxZhoUuywmV6BjZZ6WqB+1tnpE0Djnn5J47xI2XPRkaUGklZ9B2
 zYw5ObXLx6oEVf+5rfSpVXlglZL42fNXHhjpyuFl5a/fEBW9Enj48//WDJjh7Z04ppec
 CEuouwVTwQbpYMY8427MrRE4FVDfJbnUZnTdc9LP+6dnrCWGdP4MzAYZsscmX5MGZPt9
 9pQ8tjF353gD/y65HJVp+N5OnOy9o8BFUbLZiPRA9grmCa2XB7UU4/cf35yqTkVXjVfg
 dN1XsTsZhHy0foI2ShCv3vRO+G4CxS91SJH2gDh68oLyHsT0GoUNnJXiZ+pdKJcoBOjS
 +Czg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678812643;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UkqYwjMeffkjPjp5cMWVsaWAzAtPS7xe9pFJYyoNEaE=;
 b=zpTKd6tjO6vkHte2TCVOfnxxOBv8tOQbGiI6q3Xyl2xb7qBl5/Dbj5ypkqWZ42axRX
 njoIQMOfdBm9i87XDfiAMv0VaEfDPAf45LQokF046LSmLMqRrxQ0gmoFEzSy9123rUlo
 rlaCN2Nz2eu5+ZUPZLvEsfwkDpCOma4xI0r1SR1CvGFbq8SquVj9buLWt1NAWqedDwBK
 M1IJD7dR2Rh/wqQYnxnA7Zvn1hMJ5BSY6t2mvczeMpmcpfXIF0Lu50ILjCnUJZC16lUk
 CKxk4uBw/w11qd2vn3aYvdJrGy/ko4JxYvCy/xHjL43Q+zVypV8RvdssE9NJKVfEr10H
 u2Vw==
X-Gm-Message-State: AO0yUKVs9zI9gL99sjoqMA+93I5evYott5JrOfTyZj/3EHBx4oiw5Ksl
 pA/x4qn1SmkYIvLB1jPE9KuRyRUdkKfQbjzfR08=
X-Google-Smtp-Source: AK7set+gte7C+eU4YZsUqbvakrIvdiZTBVsU+BADHhQavPYGw5mlQaULBlPq3SFvKCwYcdUSI5byJg==
X-Received: by 2002:a05:6820:150b:b0:525:42c7:9a5f with SMTP id
 ay11-20020a056820150b00b0052542c79a5fmr20315906oob.6.1678812642823; 
 Tue, 14 Mar 2023 09:50:42 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 96-20020a9d04e9000000b0069451a9274bsm348689otm.28.2023.03.14.09.50.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 09:50:42 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v2 16/26] target/riscv/cpu.c: split RVG code from
 validate_set_extensions()
Date: Tue, 14 Mar 2023 13:49:38 -0300
Message-Id: <20230314164948.539135-17-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230314164948.539135-1-dbarboza@ventanamicro.com>
References: <20230314164948.539135-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c29;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc29.google.com
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
X-List-Received-Date: Tue, 14 Mar 2023 16:50:46 -0000

We can set all RVG related extensions during realize time, before
validate_set_extensions() itself. It will also avoid re-enabling
RVG via write_misa() when the CSR start to using the same validation
code realize() does.

Note that we're setting both cfg->ext_N and env->misa_ext bits, instead
of just setting cfg->ext_N. The intention here is to start syncing all
misa_ext operations with its cpu->cfg flags, in preparation to allow for
the validate function to operate using a misa_ext. This doesn't make any
difference for the current code state, but will be a requirement for
write_misa() later on.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 55 +++++++++++++++++++++++++++++++++-------------
 1 file changed, 40 insertions(+), 15 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 48ad7372b9..133807e39f 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -281,6 +281,42 @@ static uint32_t riscv_get_misa_ext_with_cpucfg(RISCVCPUConfig *cfg)
     return ext;
 }
 
+static void riscv_set_G_virt_ext(RISCVCPU *cpu)
+{
+    CPURISCVState *env = &cpu->env;
+    RISCVCPUConfig *cfg = &cpu->cfg;
+
+    if (!(cfg->ext_i && cfg->ext_m && cfg->ext_a &&
+          cfg->ext_f && cfg->ext_d &&
+          cfg->ext_icsr && cfg->ext_ifencei)) {
+
+        warn_report("Setting G will also set IMAFD_Zicsr_Zifencei");
+        cfg->ext_i = true;
+        env->misa_ext |= RVI;
+
+        cfg->ext_m = true;
+        env->misa_ext |= RVM;
+
+        cfg->ext_a = true;
+        env->misa_ext |= RVA;
+
+        cfg->ext_f = true;
+        env->misa_ext |= RVF;
+
+        cfg->ext_d = true;
+        env->misa_ext |= RVD;
+
+        cfg->ext_icsr = true;
+        cfg->ext_ifencei = true;
+
+        /*
+         * Update misa_ext_mask since this is called
+         * only during riscv_cpu_realize().
+         */
+        env->misa_ext_mask = env->misa_ext;
+    }
+}
+
 static void riscv_set_cpucfg_with_misa(RISCVCPUConfig *cfg,
                                        uint32_t misa_ext)
 {
@@ -1036,21 +1072,6 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
-    /* Do some ISA extension error checking */
-    if (cpu->cfg.ext_g && !(cpu->cfg.ext_i && cpu->cfg.ext_m &&
-                            cpu->cfg.ext_a && cpu->cfg.ext_f &&
-                            cpu->cfg.ext_d &&
-                            cpu->cfg.ext_icsr && cpu->cfg.ext_ifencei)) {
-        warn_report("Setting G will also set IMAFD_Zicsr_Zifencei");
-        cpu->cfg.ext_i = true;
-        cpu->cfg.ext_m = true;
-        cpu->cfg.ext_a = true;
-        cpu->cfg.ext_f = true;
-        cpu->cfg.ext_d = true;
-        cpu->cfg.ext_icsr = true;
-        cpu->cfg.ext_ifencei = true;
-    }
-
     if (cpu->cfg.ext_i && cpu->cfg.ext_e) {
         error_setg(errp,
                    "I and E extensions are incompatible");
@@ -1313,6 +1334,10 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    if (cpu->cfg.ext_g) {
+        riscv_set_G_virt_ext(cpu);
+    }
+
     riscv_cpu_validate_set_extensions(cpu, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
-- 
2.39.2


