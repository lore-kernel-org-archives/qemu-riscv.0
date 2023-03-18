Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pdco1-0005KS-Bf
	for mharc-qemu-riscv@gnu.org; Sat, 18 Mar 2023 16:05:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pdcny-0005K1-ER
 for qemu-riscv@nongnu.org; Sat, 18 Mar 2023 16:05:30 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pdcnw-00071F-8V
 for qemu-riscv@nongnu.org; Sat, 18 Mar 2023 16:05:29 -0400
Received: by mail-ot1-x335.google.com with SMTP id
 p11-20020a9d454b000000b0069d8eb419f9so4292347oti.4
 for <qemu-riscv@nongnu.org>; Sat, 18 Mar 2023 13:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679169927;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZeqEOURtN5CDBkL3IgSdpJl1qZrPfTDtB0kVopaF1e8=;
 b=A/0C9rtKOPii4JegLaBJOcO7zbtonVzOzArmLr7Vd3MFO5GgGyWQyUMGdCyNhtpUGP
 IRSYNFTowhjLRjO01H498YmbAE3nrEwOAB77M6hlAzMxewkYiZhnoqRt21zJ5/dw8It+
 ytjw4+qa+2AR3M6KkyIXm1/rMR34f6/YPPlsrkTeCAhnd+HlWIDmEQppG5pmO8CTDLB8
 h+FsRSZIAivttvYM16WRY77Rp76A75DYLjyM9HdPGoqSlmVPJ2/iAoOMgeynX5YjUgbL
 aVu0rx8IwGzDUZIbMP8fhNaX4s/PJ6ZSFXJD4aPXJ2BWcCB1DSiOOZF+LIjDD3DOm6kF
 n55g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679169927;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZeqEOURtN5CDBkL3IgSdpJl1qZrPfTDtB0kVopaF1e8=;
 b=YdJV6/2C78GyGV1hdbtiWYw7XAWoG/LN3tf9DtUnCLxyOz6/XzfUG7c4erh+jyCTnl
 oa4UE20d9p31jUfCdTF1qqpNRdcKJH1WrvTl4wKZqmvK/IhuX4YAXtCKsjvcXRCU+6nv
 +2aLfgPX20eHGFJDSm+AOAhXMjW1LAzwNc9oPVbwpX+MzriatTvOQjVt15RnPTN5AWJj
 hBv1cn+oaI0Y4hs5lV6EolEdKKqK/5O3XQeOT1Gcdwu5Ok+MMC5yL8IH9pDntxjMamPF
 7RZqWhwU3ufi0Wm2vMoTjTRqz5VcWuA6KAWjvOc35/2RFu73nIIxFokVq7xMFJoianus
 SpnA==
X-Gm-Message-State: AO0yUKUCcaxG5/FMSFmamkUQMrQDF76sRKeKJQIsjbBgUbkZPDquKHZ9
 GxcvS75rfZ1md9dUBbkpttoLlA==
X-Google-Smtp-Source: AK7set9aLO4CVYn1gGxQgN/WU8lUCvS1bfk9h+JLtTRsLokyQ2kAbE6T/BWwFrai1B7Wb+X9EK6QgQ==
X-Received: by 2002:a05:6830:1e29:b0:698:b03a:4fc0 with SMTP id
 t9-20020a0568301e2900b00698b03a4fc0mr1528100otr.24.1679169927660; 
 Sat, 18 Mar 2023 13:05:27 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 f69-20020a4a5848000000b004a3d98b2ccdsm2122219oob.42.2023.03.18.13.05.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Mar 2023 13:05:27 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v3 16/26] target/riscv/cpu.c: add
 riscv_cpu_validate_misa_ext()
Date: Sat, 18 Mar 2023 17:04:26 -0300
Message-Id: <20230318200436.299464-17-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318200436.299464-1-dbarboza@ventanamicro.com>
References: <20230318200436.299464-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x335.google.com
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
X-List-Received-Date: Sat, 18 Mar 2023 20:05:30 -0000

Even after taking RVG off from riscv_cpu_validate_set_extensions(), the
function is still doing too much. It is validating misa bits, then
validating named extensions, and if the validation succeeds it's doing
more changes in both cpu->cfg and MISA bits.

It works for the support we have today, since we'll error out during
realize() time. This is not enough to support write_misa() though - we
don't want to error out if userspace writes something odd in the CSR.

This patch starts splitting riscv_cpu_validate_set_extensions() into a
three step process: validate misa_ext, validate cpu->cfg, then commit
the configuration. This separation will allow us to use these functions
in write_misa() without having to worry about saving CPU state during
runtime because the function changed state but failed to validate.

riscv_cpu_validate_misa_ext() will host all validations related to misa
bits only. Validations using misa bits + name extensions will remain in
validate_set_extensions().

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 77 ++++++++++++++++++++++++++--------------------
 1 file changed, 43 insertions(+), 34 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 110b52712c..c7b05d7c4e 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1025,6 +1025,43 @@ static void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu)
     }
 }
 
+static void riscv_cpu_validate_misa_ext(RISCVCPU *cpu, Error **errp)
+{
+    if (cpu->cfg.ext_i && cpu->cfg.ext_e) {
+        error_setg(errp,
+                   "I and E extensions are incompatible");
+        return;
+    }
+
+    if (!cpu->cfg.ext_i && !cpu->cfg.ext_e) {
+        error_setg(errp,
+                   "Either I or E extension must be set");
+        return;
+    }
+
+    if (cpu->cfg.ext_s && !cpu->cfg.ext_u) {
+        error_setg(errp,
+                   "Setting S extension without U extension is illegal");
+        return;
+    }
+
+    if (cpu->cfg.ext_h && !cpu->cfg.ext_i) {
+        error_setg(errp,
+                   "H depends on an I base integer ISA with 32 x registers");
+        return;
+    }
+
+    if (cpu->cfg.ext_h && !cpu->cfg.ext_s) {
+        error_setg(errp, "H extension implicitly requires S-mode");
+        return;
+    }
+
+    if (cpu->cfg.ext_d && !cpu->cfg.ext_f) {
+        error_setg(errp, "D extension requires F extension");
+        return;
+    }
+}
+
 static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
 {
     RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(cpu);
@@ -1072,35 +1109,6 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
-    if (cpu->cfg.ext_i && cpu->cfg.ext_e) {
-        error_setg(errp,
-                   "I and E extensions are incompatible");
-        return;
-    }
-
-    if (!cpu->cfg.ext_i && !cpu->cfg.ext_e) {
-        error_setg(errp,
-                   "Either I or E extension must be set");
-        return;
-    }
-
-    if (cpu->cfg.ext_s && !cpu->cfg.ext_u) {
-        error_setg(errp,
-                   "Setting S extension without U extension is illegal");
-        return;
-    }
-
-    if (cpu->cfg.ext_h && !cpu->cfg.ext_i) {
-        error_setg(errp,
-                   "H depends on an I base integer ISA with 32 x registers");
-        return;
-    }
-
-    if (cpu->cfg.ext_h && !cpu->cfg.ext_s) {
-        error_setg(errp, "H extension implicitly requires S-mode");
-        return;
-    }
-
     if (cpu->cfg.ext_f && !cpu->cfg.ext_icsr) {
         error_setg(errp, "F extension requires Zicsr");
         return;
@@ -1120,11 +1128,6 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
-    if (cpu->cfg.ext_d && !cpu->cfg.ext_f) {
-        error_setg(errp, "D extension requires F extension");
-        return;
-    }
-
     /* The V vector extension depends on the Zve64d extension */
     if (cpu->cfg.ext_v) {
         cpu->cfg.ext_zve64d = true;
@@ -1349,6 +1352,12 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         env->misa_ext_mask = env->misa_ext;
     }
 
+    riscv_cpu_validate_misa_ext(cpu, &local_err);
+    if (local_err != NULL) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
     riscv_cpu_validate_set_extensions(cpu, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
-- 
2.39.2


