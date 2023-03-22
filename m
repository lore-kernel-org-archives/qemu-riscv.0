Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pf6pz-0006Rw-RC
	for mharc-qemu-riscv@gnu.org; Wed, 22 Mar 2023 18:21:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf6py-0006RY-Ap
 for qemu-riscv@nongnu.org; Wed, 22 Mar 2023 18:21:42 -0400
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf6pr-0006VJ-5v
 for qemu-riscv@nongnu.org; Wed, 22 Mar 2023 18:21:42 -0400
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-1755e639b65so20931594fac.3
 for <qemu-riscv@nongnu.org>; Wed, 22 Mar 2023 15:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679523642;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=edyvksieWPeu1SW2+k+C41ShJ9HM1xvZ3+am3Bxgf3Y=;
 b=cVksWXjmG8Jl+Nj3SGN7GdpDBShpXuRn09lskeI4K8zH1MHIPSBz5PZAFQHeQUEXmD
 MuHncFQdM+j22FnMVHKekI/nLLHihnUh5DD0qAI/MYC3InGQpsuDqDI9djcpAve6eTY2
 wjX5Fm0m/++4xazCBmejVJC2Lk3H8EYwFHD/ydyf+4KBQsjUP50uuvlAiMSzcqGECGuY
 +66aE/fEaC7TnjyAUPoubcwizxdgB7a7SKgN8lAwtI8GM/wfWWS1r/oOWK4GMuaqnL3Q
 FOEK0ltc9VgGfOrUSuVxi2f5qDXj/oP+0xeaekZRGnlZvQHfyBHYT4O2UupNo3MODbyk
 mbIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679523642;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=edyvksieWPeu1SW2+k+C41ShJ9HM1xvZ3+am3Bxgf3Y=;
 b=ErYGDSzvH1PsghFsd2415SnGOzKR/4l7mkCOfp/Hq0M2PvyicaL1Y+pfU+BYaIZ2+W
 clyuhtHX5ZhI+iDJB1xXxUb8O+u38dfD32vXE6XazAv1ofrX8YF9OXG7+PXinmlSKbFl
 R8qGx/zfvecZtv7GOwZpOPYRo+9psTRs9qg01aN/fVoIDblKDl+lIqKNFit9ABAVNG9J
 DX+rdF/Nl4khf+GX8J6i4mdoM1Xc56IsVsSbH4VBrOp83+TBi5S2In6SkUMFz1+3kRSc
 QW/cUIbtPHo1+iJy83+LvG/QLppBOGCuo8KjatTvkuzay4R2avK7QsFEa5EQmb8OnrCn
 trbw==
X-Gm-Message-State: AO0yUKXRwm6tmt2zJasVmpP8OoZaWu2yvWc4ZVT9psaNslwm6+3KAPPi
 p51mcCTKoIoxwJ+zEzOvKT1DXA==
X-Google-Smtp-Source: AKy350ZZFwYQnX/fw7UpJ6CRrYAEa67RHv2RpxPDeFeljEtZIzEEDELjfFYTaCpqozhKkuT8o42v9w==
X-Received: by 2002:a05:6870:a44b:b0:177:c2ec:1a78 with SMTP id
 n11-20020a056870a44b00b00177c2ec1a78mr781124oal.36.1679523641168; 
 Wed, 22 Mar 2023 15:20:41 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 ax35-20020a05687c022300b0017243edbe5bsm5586817oac.58.2023.03.22.15.20.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 15:20:40 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v4 06/25] target/riscv/cpu.c: add
 riscv_cpu_validate_misa_mxl()
Date: Wed, 22 Mar 2023 19:19:45 -0300
Message-Id: <20230322222004.357013-7-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322222004.357013-1-dbarboza@ventanamicro.com>
References: <20230322222004.357013-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x30.google.com
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
X-List-Received-Date: Wed, 22 Mar 2023 22:21:42 -0000

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


