Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1phc6o-0006PB-BH
	for mharc-qemu-riscv@gnu.org; Wed, 29 Mar 2023 16:09:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phc6m-0006Ol-S1
 for qemu-riscv@nongnu.org; Wed, 29 Mar 2023 16:09:24 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phc6l-0007oi-7d
 for qemu-riscv@nongnu.org; Wed, 29 Mar 2023 16:09:24 -0400
Received: by mail-oi1-x22a.google.com with SMTP id q27so11811061oiw.0
 for <qemu-riscv@nongnu.org>; Wed, 29 Mar 2023 13:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1680120562;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EYVRv5okuTTY3DbepQQiz5pLfs3NIng0dJ4MkGLEnKk=;
 b=OgrkR9csRTToIHYUTq+YFrXFkGHVZxxGcq7w037WC7tO+Ws4ybr2qR6UAwmOFxN2yy
 ozQOT8YQracL6yQipyIUIdkjfKjUHrirWHO9qPuBeA+ZXDbFOhh3IAOhRNfzQChcKovw
 q1hWAeLOma7wTC6qSPu5cp7OjbS3YCm6VByO+3H2gAQAxIimIat6Gjc4lxXdOx+hcgpk
 zUmvRcew1JYkkNhDWDnViweSegPDcBOoO8jq57VLduXeuGXZgL/W2c00Rhie3gbdbKJq
 rL8J2gmusK1skGKazY1dOYsrHD8CgKoGm5jlx++d3qd8gmTF8iNdN8i2KDAbW/LNS3mw
 vRsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680120562;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EYVRv5okuTTY3DbepQQiz5pLfs3NIng0dJ4MkGLEnKk=;
 b=hmhCVtDi3G2BbhONEdEG9G+Bifk2JT3bbdqr91LfY78sRIcvf4ZPQJLYOO8z7YYa5M
 K1j6ZbhA2xlu7f9b6G0z/svPvy2vLL2IaEF5bnDEBxy/wWTS7ZFmRTfG2Ct9qjOtXsDZ
 4xo0iNW/Z48PmMJAm6leCeyOX+h08DMmzeF4Gfi4SQcFgPCmDAEfU1R7pEzf4qm/LoMg
 VMEq7seweNkk2cTXYKG0OAvrt3oOAGU9v6yncOqiETmm4Bx2e7FM7h2/8rieDbcZZPSP
 aYjWN7Zg3gkKkXCjtIhsqft3Tfq47CHT3QeB0SWW6lFE3Y4qQ/KmTjEcEmboDGcNYvOJ
 8S6w==
X-Gm-Message-State: AO0yUKW9rbyk28XXQE6QknhMM6TamZDS2V2qqC4aBgYt44EZ5ETZbZUb
 jTJY/9WzH9rqCirMUPfmCfbcDsZKscGBCxySmnU=
X-Google-Smtp-Source: AK7set8SdOY6hSjPZe7i5sW1gTTvH4/4LDckoUnYZyZiXEeldKnpEIRfYOdzyLJgYFsS1ri/5QmUGA==
X-Received: by 2002:aca:1918:0:b0:387:6a3b:5a82 with SMTP id
 l24-20020aca1918000000b003876a3b5a82mr8434388oii.44.1680120562566; 
 Wed, 29 Mar 2023 13:09:22 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 i206-20020acaead7000000b003874e6dfeefsm8195182oih.37.2023.03.29.13.09.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 13:09:22 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v6 6/9] target/riscv/cpu.c: add riscv_cpu_validate_misa_mxl()
Date: Wed, 29 Mar 2023 17:08:53 -0300
Message-Id: <20230329200856.658733-7-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230329200856.658733-1-dbarboza@ventanamicro.com>
References: <20230329200856.658733-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22a.google.com
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
X-List-Received-Date: Wed, 29 Mar 2023 20:09:25 -0000

Let's remove more code that is open coded in riscv_cpu_realize() and put
it into a helper. Let's also add an error message instead of just
asserting out if env->misa_mxl_max != env->misa_mlx.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
---
 target/riscv/cpu.c | 50 ++++++++++++++++++++++++++++++----------------
 1 file changed, 33 insertions(+), 17 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 8f0620376c..e8045840bd 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -866,6 +866,33 @@ static void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu)
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
  * cpu->cfg accordingly.
@@ -1134,7 +1161,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     RISCVCPU *cpu = RISCV_CPU(dev);
     CPURISCVState *env = &cpu->env;
     RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
-    CPUClass *cc = CPU_CLASS(mcc);
     Error *local_err = NULL;
 
     cpu_exec_realizefn(cs, &local_err);
@@ -1143,6 +1169,12 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    riscv_cpu_validate_misa_mxl(cpu, &local_err);
+    if (local_err != NULL) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
     riscv_cpu_validate_priv_spec(cpu, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
@@ -1171,22 +1203,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
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


