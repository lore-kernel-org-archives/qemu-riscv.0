Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pdcna-00053D-OW
	for mharc-qemu-riscv@gnu.org; Sat, 18 Mar 2023 16:05:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pdcnW-00052a-Lb
 for qemu-riscv@nongnu.org; Sat, 18 Mar 2023 16:05:02 -0400
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pdcnU-0006uz-PH
 for qemu-riscv@nongnu.org; Sat, 18 Mar 2023 16:05:02 -0400
Received: by mail-oi1-x233.google.com with SMTP id bg11so6216536oib.5
 for <qemu-riscv@nongnu.org>; Sat, 18 Mar 2023 13:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679169899;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=edyvksieWPeu1SW2+k+C41ShJ9HM1xvZ3+am3Bxgf3Y=;
 b=oXTpuAEvZNL8NEhbZqAFx7HLAmYSUvNkZNpRkVqN4EGYfvqdf0piJiZKXa22DAxR9w
 j9uPWqOoQaYaErh3S14zMk/okxR1/iZP3PvxCjNrVdyTE2jPE6lBEiCvv7t/R6Dp5sMf
 neOiOvVoaCZDJh6Bdt/J6JCNTApzy0jtSSz6fsnl2eRuQBE94yTzUKHkSVmDk6G1GtBC
 +C6jEV3776884eJxH4e6NcW6NZC5MqTEZOadIXSmCkeVfmN7SFfpVvln3AGh11ppAtAb
 fy9Nfom56yIjs9ZviBHp4rZVlMe3zv3LrlaT7pKuKMuSN5ZD25oiK5fAroiQlr9YWPCY
 EbzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679169899;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=edyvksieWPeu1SW2+k+C41ShJ9HM1xvZ3+am3Bxgf3Y=;
 b=SwMY8lVugyfsbgGbERMPF2Hh52l5IDClYeNUacPmrU17VVdQsjgdfABhLevfiI3o1b
 0DCOJ9mc4tCdAP3hxUAR/u5iGijkNI8i+YAM9/q2CHeF7wzOzSQlCScxGgJs3vn+UKIg
 18RAq2HhMbT8vA6CM6unK8I8iJo6Q30V5dOZlxfNbj84RwG2Gy8MFsQ7oFPMJRBGXBi9
 rMa93fhCUQVlKVEOdaB8E5wJljPXi0BCSxhfgsxMfFPLjrsbS8N5nlqmqSgDCgSv46vU
 OXegqpiISf2dxyoRmDvMNad225ZI4rsDlncXarmJ4TJn5RsB4QcNK37zHKh3JWBo/Y5R
 AVAA==
X-Gm-Message-State: AO0yUKVN1dxqZ2f/LY9Q4OcUmw0AgOyrNxwZhnB9JcuruOlGYcBf7feO
 d+WKHcDkRx7ZBIZmPSQNIL3fEg==
X-Google-Smtp-Source: AK7set9PF6y9rYrA/I/l+jUYLAgZpaLiZumLaIBoZzlReP5zTNfnBRlRubOX7hdSyTERlO6pcHl0qQ==
X-Received: by 2002:a05:6808:2a8c:b0:383:c945:124e with SMTP id
 fc12-20020a0568082a8c00b00383c945124emr6666371oib.36.1679169899748; 
 Sat, 18 Mar 2023 13:04:59 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 f69-20020a4a5848000000b004a3d98b2ccdsm2122219oob.42.2023.03.18.13.04.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Mar 2023 13:04:59 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v3 06/26] target/riscv/cpu.c: add
 riscv_cpu_validate_misa_mxl()
Date: Sat, 18 Mar 2023 17:04:16 -0300
Message-Id: <20230318200436.299464-7-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318200436.299464-1-dbarboza@ventanamicro.com>
References: <20230318200436.299464-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x233.google.com
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
X-List-Received-Date: Sat, 18 Mar 2023 20:05:03 -0000

Let's remove more code that is open coded in riscv_cpu_realize() and put
it into a helper. Let's also add an error message instead of just
asserting out if env->misa_mxl_max != env->misa_mlx.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 51 ++++++++++++++++++++++++++++++----------------
 1 file changed, 33 insertions(+), 18 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 17b301967c..1a298e5e55 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -879,6 +879,33 @@ static void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu)
     }
 }
 
+static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
+{
+    RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(cpu);
+    CPUClass *cc = CPU_CLASS(mcc);
+    CPURISCVState *env = &cpu->env;
+
+    /* Validate that MISA_MXL is set properly. */
+    switch (env->misa_mxl_max) {
+#ifdef TARGET_RISCV64
+    case MXL_RV64:
+    case MXL_RV128:
+        cc->gdb_core_xml_file = "riscv-64bit-cpu.xml";
+        break;
+#endif
+    case MXL_RV32:
+        cc->gdb_core_xml_file = "riscv-32bit-cpu.xml";
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    if (env->misa_mxl_max != env->misa_mxl) {
+        error_setg(errp, "misa_mxl_max must be equal to misa_mxl");
+        return;
+    }
+}
+
 /*
  * Check consistency between chosen extensions while setting
  * cpu->cfg accordingly, doing a set_misa() in the end.
@@ -1180,9 +1207,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
 {
     CPUState *cs = CPU(dev);
     RISCVCPU *cpu = RISCV_CPU(dev);
-    CPURISCVState *env = &cpu->env;
     RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
-    CPUClass *cc = CPU_CLASS(mcc);
     Error *local_err = NULL;
 
     cpu_exec_realizefn(cs, &local_err);
@@ -1197,6 +1222,12 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    riscv_cpu_validate_misa_mxl(cpu, &local_err);
+    if (local_err != NULL) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
     if (cpu->cfg.epmp && !cpu->cfg.pmp) {
         /*
          * Enhanced PMP should only be available
@@ -1213,22 +1244,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     }
 #endif /* CONFIG_USER_ONLY */
 
-    /* Validate that MISA_MXL is set properly. */
-    switch (env->misa_mxl_max) {
-#ifdef TARGET_RISCV64
-    case MXL_RV64:
-    case MXL_RV128:
-        cc->gdb_core_xml_file = "riscv-64bit-cpu.xml";
-        break;
-#endif
-    case MXL_RV32:
-        cc->gdb_core_xml_file = "riscv-32bit-cpu.xml";
-        break;
-    default:
-        g_assert_not_reached();
-    }
-    assert(env->misa_mxl_max == env->misa_mxl);
-
     riscv_cpu_validate_set_extensions(cpu, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
-- 
2.39.2


