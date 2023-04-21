Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ppqny-0002MS-82
	for mharc-qemu-riscv@gnu.org; Fri, 21 Apr 2023 09:28:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ppqnv-0002C3-So
 for qemu-riscv@nongnu.org; Fri, 21 Apr 2023 09:27:59 -0400
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ppqnt-0003tw-Vr
 for qemu-riscv@nongnu.org; Fri, 21 Apr 2023 09:27:59 -0400
Received: by mail-oo1-xc30.google.com with SMTP id
 006d021491bc7-54711bc097bso664764eaf.0
 for <qemu-riscv@nongnu.org>; Fri, 21 Apr 2023 06:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1682083677; x=1684675677;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h9G76Yn3Vxy1PuEW01LasjD65akRIwetzGF2RPX1SbQ=;
 b=liK86/4PpO5TZ6RG4jVQbDOBnRdYPC11M/RfY09kSvBB4ZoG5smHt6eHGyPYE42Mnk
 raQGkJ82qWN0H55xV+QGvSV0w6NX/GkJqBL5umQFJouWm7QvKbNyIpfjqmO7QMpuLHlO
 zHYgfn95FDq+Jl4UaxuLuLpMlQCXIrH+WvehnYoT4V3R8KYfP8utBKSDsg8wKtZyNMAb
 keqoS4YFTv0s2pQMnzE2V05YOh8IYOanFw41QK5aFmnJfzQ3GDGxj8slHkKtpFGS5h7i
 SLSnvPjR5vRnVxeo+bQwRIQuBlYsK0JGKgHRk+94mtM89wV5X+u5rJLyFLgLK7dge2lE
 46Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682083677; x=1684675677;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h9G76Yn3Vxy1PuEW01LasjD65akRIwetzGF2RPX1SbQ=;
 b=iLlLsK0BHtGMGWzJZWSzr1c5tgWlYWZvLQr/TbuSp5DJWIyr8hJnH6vTmL7hphql4U
 0m546qVWH4InobH2K/kdhenmRXbpLAU6sJKQ98aIG0UvKm4FmwOb2jZNLzIGbJpE1pIG
 MNYVEmwI9M5Pzv7CdQnmFKPn5BYKnT37pFoZ8DgnjD6dCKhsybwDZmPt/Ze+ksqzdeRV
 /26Lc9HfWuEBQXovRwrzXx97QXNdL9hjPF2Q7n3eTqcrPKfo3RLoiP4heC7ubVCtNYC6
 zt+6a5gH44/VTyMpYss27tLmjPXLrnKyF5wlMqqpFWzg4E3xOMcXRa+5SWkTMvdTPsle
 Yd6Q==
X-Gm-Message-State: AAQBX9eVuJNZmwrtclfcN8vlDoDSTUCQNUFiAro+kj9/o4LIBZr3cZqR
 Yn3QwEk1eu8Y7A9iWvYsBXEGtw==
X-Google-Smtp-Source: AKy350blg5Sykj8EK0DE6glshQkFh+HwRcJRK4du6+KMJ6Kxk+n8Wl7tRPecMfS8P4iQYm0qmEbLMQ==
X-Received: by 2002:aca:1818:0:b0:38e:88b6:1808 with SMTP id
 h24-20020aca1818000000b0038e88b61808mr981655oih.5.1682083676533; 
 Fri, 21 Apr 2023 06:27:56 -0700 (PDT)
Received: from grind.. ([191.255.108.232]) by smtp.gmail.com with ESMTPSA id
 r84-20020acada57000000b003895430852dsm1623359oig.54.2023.04.21.06.27.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 06:27:56 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v8 08/11] target/riscv/cpu.c: add riscv_cpu_validate_misa_mxl()
Date: Fri, 21 Apr 2023 10:27:24 -0300
Message-Id: <20230421132727.121462-9-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421132727.121462-1-dbarboza@ventanamicro.com>
References: <20230421132727.121462-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c30;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc30.google.com
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
X-List-Received-Date: Fri, 21 Apr 2023 13:28:00 -0000

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


