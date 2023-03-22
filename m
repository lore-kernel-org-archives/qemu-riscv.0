Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pf6ww-0006jo-Dy
	for mharc-qemu-riscv@gnu.org; Wed, 22 Mar 2023 18:28:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf6wv-0006jg-8i
 for qemu-riscv@nongnu.org; Wed, 22 Mar 2023 18:28:53 -0400
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf6uW-0006Wm-Eb
 for qemu-riscv@nongnu.org; Wed, 22 Mar 2023 18:28:52 -0400
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-17aaa51a911so20906072fac.5
 for <qemu-riscv@nongnu.org>; Wed, 22 Mar 2023 15:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679523671;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7rcAexEYtF86dx9H3aCYgqZNeqV7rAFhGmvGaHEeB5c=;
 b=hQ/esULzBQUKfkqx/L1kcx/xYYM51FVw0mO/tJWYxC8OoztCM1+ZtPmjsHHv4vqM5N
 tDGwkJb7QAb5+TReq0fYlAXl/LAh0QZ5yulkZkpvNMY9a6eMIdeoABaGbeIvGi7DKShg
 Awuhp+Yeyzvg4eMogniwdFJ7lof+gGIW0Ff1fRrwtKaXGkkxnb83P2pxFbH4TvuYc35c
 K1955B5f72Gx1iWpfhz37tMqWQbUwDaZSXsAeB1JmWqlgxYnOv/rauZAprQZBzRuhots
 jqpL3N29m7A+hAwztJZZOyyyEuscNCR2IzgRduewW8CFM4hJ8bqC0ARGeCGZxP3r3k4i
 vM1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679523671;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7rcAexEYtF86dx9H3aCYgqZNeqV7rAFhGmvGaHEeB5c=;
 b=dYiEJn5buZ6lAR6If3t9NtoI6SETvXIHtnpfVqMsKY31iUx2ZhmgglYSgonklOJC4Q
 nuageDOxWy8b00RrVLjxzU2p8BYmrpK6aFr6gCxqvxOsmQ3x213Unl7Ir+ZmtFtTJ7Mf
 n6kc9HKWxuZ+elV7ys601+hx3gs2BYiiGXWygtm6TR9A7L0b5kqUq4K45wTSuxcDwjka
 dBF4nPHpdIVrs2+P7+Wvmv9hmzodSwJ77WLZgtCAvbwvpoPSblA7hYipnEcrRzTr1kaL
 7/2g0/T6gS/EueCpA8YZOFy16qNJa8rxqCnyrCNLtA5J8aSV+54wecNa1VAla/SfEavb
 5piw==
X-Gm-Message-State: AO0yUKWPAxyrtOhvSTq6gm4XGGRVyyem7gk44SVLDrERBDv93ZWa717j
 Ofp6drst5A5s6JuMzhI2fMngBA==
X-Google-Smtp-Source: AK7set/sPJdx0Lisr+uqjMCse44C3PbllnOWnOveC8yLV4SsGpHyTaEFd7EJMWX2K2foMDUnfeRGsg==
X-Received: by 2002:a05:6870:6129:b0:17a:b715:ab9a with SMTP id
 s41-20020a056870612900b0017ab715ab9amr794447oae.50.1679523671714; 
 Wed, 22 Mar 2023 15:21:11 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 ax35-20020a05687c022300b0017243edbe5bsm5586817oac.58.2023.03.22.15.21.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 15:21:11 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v4 16/25] target/riscv/cpu.c: add
 riscv_cpu_validate_misa_ext()
Date: Wed, 22 Mar 2023 19:19:55 -0300
Message-Id: <20230322222004.357013-17-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322222004.357013-1-dbarboza@ventanamicro.com>
References: <20230322222004.357013-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2f.google.com
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
X-List-Received-Date: Wed, 22 Mar 2023 22:28:53 -0000

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
index a7bad518be..f9710dd786 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1016,6 +1016,43 @@ static void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu)
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
@@ -1063,35 +1100,6 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
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
@@ -1111,11 +1119,6 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
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
@@ -1340,6 +1343,12 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
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


