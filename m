Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nzw4i-0003My-3V
	for mharc-qemu-riscv@gnu.org; Sat, 11 Jun 2022 04:02:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nzw4c-0003K6-8D
 for qemu-riscv@nongnu.org; Sat, 11 Jun 2022 04:02:23 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:37435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nzw4Y-00020w-Mh
 for qemu-riscv@nongnu.org; Sat, 11 Jun 2022 04:02:21 -0400
Received: by mail-pl1-x633.google.com with SMTP id t2so1075740pld.4
 for <qemu-riscv@nongnu.org>; Sat, 11 Jun 2022 01:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1t39f6wQstMi6nr3UEqkMVKQnbCIeTANssQ+YezQ/DE=;
 b=QwzDSkSNl95ekSmMZ0CpEQMEcACIEKRoiPE1YM0lGM7KgJl09xW733extMDezABP6C
 TtRfMGcolU6Gzy2oGtFKxo1nwcfA65cfDHP0Kz/tBYkJ6ttHGJ4WCzm62/XZ6e7+7rbh
 TqdJOoEr7gOLp1sIYWolb0N3HU3CxpaLV1/G4piEgWhHKct5jqrRHtQ8K1nXHIfbIHcg
 8Vr/S51r1GNjCR13K0TrVLunUIj8UB5tOsvoFdBYnqSgJHDCeKEulFieyRS9c7wGr0fc
 OoEb/p9XLT7krK7HUKepoeoBPBfyJnj4F+NUsYN9CWwNC+D+UjrvF9WkTxR4nMfkchMo
 fZPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1t39f6wQstMi6nr3UEqkMVKQnbCIeTANssQ+YezQ/DE=;
 b=NHPkMGn+Qcn86xxVi5DeqY/ikuy2bEhl+oGVJqYepjoUtX5mKPeb6uWLCT9GkDPlZF
 e+zsvmaY0CN92oa4MFTyd7430cA0tNo0vXTwK7ApBAUU7dfD/o6pBQiuSJTsfzQ0b48i
 Qbq7czV3lxc7bRgUAddOloJ0Cbw8srA1ve0llFSUxwY4ET/kViJ+C1lAq9C6IK4CSaNb
 EmEy33l4lj3newZgeTs/jMJHGEX/YyFo3PJw8fzd1b836dy5T0nLiGee79ze+o0f5n/E
 1NJEsGpyijLzAkkmmtZMd1fvVX5UY5QWYhr+yY4Evp1UijhyBsonQiWSgXbLv4tV3Wkt
 0thA==
X-Gm-Message-State: AOAM530+yyiBLQ1CYZ1/Idc0BWdpipvUW/Vfanc61FexYrneP+DQiyNo
 PSQH8Nnrzkuv1ZTIOOSUmikevg==
X-Google-Smtp-Source: ABdhPJz5tzWejoEK/+azgSLFAsJ56uk7Tw6za2TCbna8yHi9hMH2b68f6ZuX2cSTl1+cWDPWHDRxyg==
X-Received: by 2002:a17:90b:1a8f:b0:1e8:7dfe:c4f with SMTP id
 ng15-20020a17090b1a8f00b001e87dfe0c4fmr3882784pjb.17.1654934529538; 
 Sat, 11 Jun 2022 01:02:09 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([171.61.69.124])
 by smtp.gmail.com with ESMTPSA id
 w1-20020a62c701000000b0050dc762814asm889025pfg.36.2022.06.11.01.02.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jun 2022 01:02:08 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <apatel@ventanamicro.com>, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Atish Patra <atishp@rivosinc.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v6 1/4] target/riscv: Don't force update priv spec version to
 latest
Date: Sat, 11 Jun 2022 13:31:04 +0530
Message-Id: <20220611080107.391981-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220611080107.391981-1-apatel@ventanamicro.com>
References: <20220611080107.391981-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=apatel@ventanamicro.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Sat, 11 Jun 2022 08:02:24 -0000

The riscv_cpu_realize() sets priv spec version to v1.12 when it is
when "env->priv_ver == 0" (i.e. default v1.10) because the enum
value of priv spec v1.10 is zero.

Due to above issue, the sifive_u machine will see priv spec v1.12
instead of priv spec v1.10.

To fix this issue, we set latest priv spec version (i.e. v1.12)
for base rv64/rv32 cpu and riscv_cpu_realize() will override priv
spec version only when "cpu->cfg.priv_spec != NULL".

Fixes: 7100fe6c2441 ("target/riscv: Enable privileged spec version 1.12")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 target/riscv/cpu.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 05e6521351..8db0f0bd49 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -173,6 +173,8 @@ static void rv64_base_cpu_init(Object *obj)
     /* We set this in the realise function */
     set_misa(env, MXL_RV64, 0);
     register_cpu_props(DEVICE(obj));
+    /* Set latest version of privileged specification */
+    set_priv_version(env, PRIV_VERSION_1_12_0);
 }
 
 static void rv64_sifive_u_cpu_init(Object *obj)
@@ -204,6 +206,8 @@ static void rv128_base_cpu_init(Object *obj)
     /* We set this in the realise function */
     set_misa(env, MXL_RV128, 0);
     register_cpu_props(DEVICE(obj));
+    /* Set latest version of privileged specification */
+    set_priv_version(env, PRIV_VERSION_1_12_0);
 }
 #else
 static void rv32_base_cpu_init(Object *obj)
@@ -212,6 +216,8 @@ static void rv32_base_cpu_init(Object *obj)
     /* We set this in the realise function */
     set_misa(env, MXL_RV32, 0);
     register_cpu_props(DEVICE(obj));
+    /* Set latest version of privileged specification */
+    set_priv_version(env, PRIV_VERSION_1_12_0);
 }
 
 static void rv32_sifive_u_cpu_init(Object *obj)
@@ -524,7 +530,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     CPURISCVState *env = &cpu->env;
     RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
     CPUClass *cc = CPU_CLASS(mcc);
-    int priv_version = 0;
+    int priv_version = -1;
     Error *local_err = NULL;
 
     cpu_exec_realizefn(cs, &local_err);
@@ -548,10 +554,8 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         }
     }
 
-    if (priv_version) {
+    if (priv_version >= PRIV_VERSION_1_10_0) {
         set_priv_version(env, priv_version);
-    } else if (!env->priv_ver) {
-        set_priv_version(env, PRIV_VERSION_1_12_0);
     }
 
     if (cpu->cfg.mmu) {
-- 
2.34.1


