Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pc7qq-0005QU-NW
	for mharc-qemu-riscv@gnu.org; Tue, 14 Mar 2023 12:50:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pc7qo-0005Pq-P0
 for qemu-riscv@nongnu.org; Tue, 14 Mar 2023 12:50:14 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pc7qn-0002ba-1c
 for qemu-riscv@nongnu.org; Tue, 14 Mar 2023 12:50:14 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 f19-20020a9d5f13000000b00693ce5a2f3eso8742255oti.8
 for <qemu-riscv@nongnu.org>; Tue, 14 Mar 2023 09:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1678812612;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=edyvksieWPeu1SW2+k+C41ShJ9HM1xvZ3+am3Bxgf3Y=;
 b=Ku/pPJ3ifUcvVnhxN4r2/dGMB43qfMdkZlHbM/BfmO4Of4zuc2iFXToDpMFNF9oJoe
 vHc5j7alpcg9AP3Zp7JNAjJJdt+HvbApH5umxgDFdokIaHcwcQAQCrHWoSd9JE6Qbcw7
 Zj07eOcOdU/J69erXHXLmpsuODhncHJqT11oc/Xwl5mZbE8lMCnN28uZ1P0FYCFClyPr
 P71d/FyN66cI4/83KO5YrhzNM+8vXuBUt6JMR0EpoL+Ce40laPBprK9tSHA+a55/n7by
 pjyHKrzOlj8vltiKvjMTYORHtAenmyIcDvc/FmpiP7FlRHUuWaSVhLYqmg5ICO97pviE
 uGWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678812612;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=edyvksieWPeu1SW2+k+C41ShJ9HM1xvZ3+am3Bxgf3Y=;
 b=IykNAL8xHGNtvBVsaP+j0Dv3xuQp4M8Jjb1ejzG4Lmbk8lFM5U+xh9OxiomItyHphM
 fO35fO00XJGoTwnwHBKr8Blox0ohw2jCjDo1596vu94c+S7vIfAvTavLg5ySKxDIeq1W
 GMwHx/YATozdOYtBT4XuuPbz3o2Hep16K3bNFW0s9lVj8pPRTUApcEoDt4zi6rAsh1Zl
 /VjB+h4q/Xx2c6VT+ZYnFBv6CW2C7iAosePfHTrco2UGyTakmt1+GvneV6x1t6OQrNwo
 vP7A7+yA6gTAW7xokvd5L7Z9TZJi1OewaUvkMumNXbPgHwtks5YCgtNI53ZFxBJcQFWs
 vmDw==
X-Gm-Message-State: AO0yUKU6r+x3KfmPTIq8/9AwSiUeVfJ/f9tmEoIOftNxMfGDiSGuBneV
 I5pYvR43J7uSqD/t4Y7S03CnAkcynvGCqeTF8AU=
X-Google-Smtp-Source: AK7set9NDg96Wf08CGf2sstvRBf47MNTiZT7aLrn8/C2ZrPIBfwiohHTScOohf/mfdRiqSET9VGkDA==
X-Received: by 2002:a05:6830:3687:b0:68b:dfc9:c41c with SMTP id
 bk7-20020a056830368700b0068bdfc9c41cmr22763230otb.9.1678812612300; 
 Tue, 14 Mar 2023 09:50:12 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 96-20020a9d04e9000000b0069451a9274bsm348689otm.28.2023.03.14.09.50.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 09:50:11 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v2 06/26] target/riscv/cpu.c: add
 riscv_cpu_validate_misa_mxl()
Date: Tue, 14 Mar 2023 13:49:28 -0300
Message-Id: <20230314164948.539135-7-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230314164948.539135-1-dbarboza@ventanamicro.com>
References: <20230314164948.539135-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x334.google.com
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
X-List-Received-Date: Tue, 14 Mar 2023 16:50:15 -0000

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


