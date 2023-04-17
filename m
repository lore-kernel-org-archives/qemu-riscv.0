Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1poPQ6-0006QD-Q7
	for mharc-qemu-riscv@gnu.org; Mon, 17 Apr 2023 10:01:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1poPPm-0005NH-ET
 for qemu-riscv@nongnu.org; Mon, 17 Apr 2023 10:01:07 -0400
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1poPPW-0003Gx-52
 for qemu-riscv@nongnu.org; Mon, 17 Apr 2023 10:01:06 -0400
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-1880110ebe5so676738fac.3
 for <qemu-riscv@nongnu.org>; Mon, 17 Apr 2023 07:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1681740048; x=1684332048;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2nanoWdEOCS8aleFtiQT4lFRR5GhUFB/wRnqpy8wWN8=;
 b=I9218DVOEm4QwDNFjfWAV7NdQW5WSf5lz3M961MP1usxc4YcE3myBEp+aYhULhFQNY
 WMHNklh0gjbmL9PNeNMhnd9rM2GSX/zq1Dpg4OzxpggE6Lf7xI4y9pbZz0OAOJJcHuCZ
 6c2Wk5Glq0g4fI6Kclr3LSS2e47+PoWKWwbhyMRFhjnY9R771b6sDVKd6eTTUELbePhO
 T0+3YuWFhJZ1YovWPEIxqdZAoig5Heo3a2P36/aDEfdh3ddJh5Pkay1JykpNQ9uaM2Qw
 kYeYjnn1wqKk+1VJfk4LODkvHpNlEund2I0hYF0K0vju/4Nb77VbJ0fnMEJAIIvvb+X7
 Dv1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681740048; x=1684332048;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2nanoWdEOCS8aleFtiQT4lFRR5GhUFB/wRnqpy8wWN8=;
 b=CH+E3jLKjpQ7lnHbb+exXkcFenT1kkEniLKB/4/BeKBBNe/N/40XbQHi4mQTCAfFPA
 L2xsHYbDl/1BDtTHJfT6lqKDv7w142zYB9jONFIR/GtJ4bon9Bgr9lxI++MFT/xebeF4
 OP8b2lLs+KDK8knD31oPSAD8Hi07SAcOfUP5lJyiffaKg8V2taELFktuiyZU1fsLVlsL
 FL17aqZHvBQlJN3oDZ+pZ7RRj7Ij4/VqnqItbIK+BkWqIt+kxcJooPoPIWtwUMlu1vFf
 GtNT1rn45nfXnFkb0aT6kc9WM3feGupU47bj9yn+CLcZF/WhCX6qXR6vKITH9VtmqPJf
 hEsQ==
X-Gm-Message-State: AAQBX9dV5iS6//UucabEr6pbCtkX0zoyaNPoCioqh9sCwHCoGvo1D3ZZ
 EAFzEIH4LY6q2WTp/exCN6l9bA==
X-Google-Smtp-Source: AKy350Z/kC+05oTTcitYzikJPQFj3cBKfmbdTmvPXRSbszeChMR/BPGA3Y1glf/2ghYBp9mir0/48Q==
X-Received: by 2002:a05:6870:d60b:b0:186:906d:5b0b with SMTP id
 a11-20020a056870d60b00b00186906d5b0bmr7957977oaq.40.1681740048336; 
 Mon, 17 Apr 2023 07:00:48 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([191.255.108.232])
 by smtp.gmail.com with ESMTPSA id
 x16-20020a05687031d000b001726cfeea97sm4531868oac.29.2023.04.17.07.00.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 07:00:47 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v7 08/12] target/riscv/cpu.c: add riscv_cpu_validate_misa_mxl()
Date: Mon, 17 Apr 2023 11:00:09 -0300
Message-Id: <20230417140013.58893-9-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230417140013.58893-1-dbarboza@ventanamicro.com>
References: <20230417140013.58893-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 17 Apr 2023 14:01:08 -0000

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
index c928925544..43635144bd 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -873,6 +873,33 @@ static void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu)
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
@@ -1195,7 +1222,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     RISCVCPU *cpu = RISCV_CPU(dev);
     CPURISCVState *env = &cpu->env;
     RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
-    CPUClass *cc = CPU_CLASS(mcc);
     Error *local_err = NULL;
 
     cpu_exec_realizefn(cs, &local_err);
@@ -1204,6 +1230,12 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
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
@@ -1232,22 +1264,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
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


