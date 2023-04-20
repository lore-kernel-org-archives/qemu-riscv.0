Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ppQTv-0008Nh-PU
	for mharc-qemu-riscv@gnu.org; Thu, 20 Apr 2023 05:21:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ppQTu-0008DS-3y
 for qemu-riscv@nongnu.org; Thu, 20 Apr 2023 05:21:34 -0400
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ppQTs-00074o-Ed
 for qemu-riscv@nongnu.org; Thu, 20 Apr 2023 05:21:33 -0400
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-187b70ab997so3849982fac.0
 for <qemu-riscv@nongnu.org>; Thu, 20 Apr 2023 02:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1681982491; x=1684574491;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h9G76Yn3Vxy1PuEW01LasjD65akRIwetzGF2RPX1SbQ=;
 b=J1cVaqB1BUWwD0GH6dPBi14G6QWrRkUkNKAYwVm5uNNbH0Q9KE7pnbejvNkvV+yctm
 vt0liKLbnP4RKAKCRcJ8stKDlP1ZTu3kz0Z/yjmQxMhrq0cR+Bfi43GpC/nxFThTQxBZ
 USOxkW0OqBWIzVZo5pS8gLMUTv2KpESor2a7rPBeN39V8dwyHo2ISCHvTqJKp6O8ie9p
 qbnce63pwOVWgetKaiLlFkRvdZg34vsDF3Hr95wZEYBoseyXv4u7Y4mUX2keLW1hwOep
 tQM/L6se8jO9jt3LSfz3xsxfKrjtOtagq0DGGJh7+UMepAiB34gjbSOMhr56HjckUbGI
 hgjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681982491; x=1684574491;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h9G76Yn3Vxy1PuEW01LasjD65akRIwetzGF2RPX1SbQ=;
 b=hLWK3IF/+7JNrK83w0pRTt18FEB/SRW9zflYd0A9+1jRU7jbC6glHfjLNfBAOpq+2a
 Qs57vU8JwM5IfU7UB/K+0r1th0MYrQkPvTNks+x9Nx0ybjBd2zTgFgC+QETLgH5Kj7cl
 QvglGF3eF0DVmN1s1yN5QGwnOnW0kXIV7xomyNyovog8O7mM+H6Uj3hZ80h7sp5Wa4JO
 K4kzUgVpmEA6TotcrodQcOxfjiPeJMBVzbi4iAE9vKb/qggkSRwz68QMKbfnKT/CIzhz
 2yN/E5jqPgbvDP8XvfK7mSoY8F/pMxsT9WAA7ZQ+gvcQNyz6YBPPnnDR83Tggf0lW6Y8
 0h3g==
X-Gm-Message-State: AAQBX9f30mPyWGsPlsE9QrD3mWWBvD5Rlng0McADYxi0qKFD1Eo+CBZW
 TEysKDUDh2RkS6zsxCQThBtfiA==
X-Google-Smtp-Source: AKy350Z7OmcMwhirJESeMVQuMADJdfDxy2TrLari+8xiN+CBczF18CTL8Xn6W532eR1eKNw9APcbbw==
X-Received: by 2002:a05:6870:b527:b0:176:9fbe:fe02 with SMTP id
 v39-20020a056870b52700b001769fbefe02mr594289oap.8.1681982490865; 
 Thu, 20 Apr 2023 02:21:30 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([191.255.108.232])
 by smtp.gmail.com with ESMTPSA id
 t1-20020a056870e74100b0017280f7d653sm529668oak.35.2023.04.20.02.21.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 02:21:30 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH RESEND v7 08/12] target/riscv/cpu.c: add
 riscv_cpu_validate_misa_mxl()
Date: Thu, 20 Apr 2023 06:20:56 -0300
Message-Id: <20230420092100.177464-9-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230420092100.177464-1-dbarboza@ventanamicro.com>
References: <20230420092100.177464-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 20 Apr 2023 09:21:34 -0000

Let's remove more code that is open coded in riscv_cpu_realize() and put
it into a helper. Let's also add an error message instead of just
asserting out if env->misa_mxl_max != env->misa_mlx.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
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
2.40.0


