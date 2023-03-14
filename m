Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pc7s7-0007hs-4w
	for mharc-qemu-riscv@gnu.org; Tue, 14 Mar 2023 12:51:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pc7rg-0006wq-PH
 for qemu-riscv@nongnu.org; Tue, 14 Mar 2023 12:51:18 -0400
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pc7re-00032C-0K
 for qemu-riscv@nongnu.org; Tue, 14 Mar 2023 12:51:07 -0400
Received: by mail-oo1-xc29.google.com with SMTP id
 bd3-20020a4aee03000000b00517affa07c0so2406301oob.7
 for <qemu-riscv@nongnu.org>; Tue, 14 Mar 2023 09:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1678812665;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8A4bMOdOlp/qGLIk/cJ34z337QI1i7O+DLs8TRcWY1g=;
 b=ORqeECt+415G0wOBlCoWNWg8aKDotjz5MyoNJJkd8VPK7RnmWwuS7QvKAwWtb3KmOb
 77RAU8Ae+RFtoByQ7exryWbD4KW+XUw5MeBdd0m2r/KPmmSP5Dkc0pELTr8pShkmxt/i
 8HI5g64BCIq5YI3rGzQZHzDdrUcH9+UoImfQJUQmcrFg4nvA/yNvXZuxR9H9apeotdRT
 yo7mWdqWb7vXCnXXPQLugmd9RqAZT+H50qa4pRcUy0Qbh4nrGwHkEAjpvLWERrHaVMPq
 jAV2U1pKLsdbfPkpG5X2LN/CECa58uarck9JMAIJfMpd8KokpBJm3KlxFWs0c6/jCtLv
 J1og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678812665;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8A4bMOdOlp/qGLIk/cJ34z337QI1i7O+DLs8TRcWY1g=;
 b=NshciJWRG8bLNAJsXuekMhYXBegniw4BgwLyMWjFEHIyOMyLpHjsEDzTlMRLvuAIxn
 usmsSSEbWv/G/KA1vyowN9mnVXQDGlH496hQG5vwuj98duFkIXg3oKBcPzUHRX5CbSfR
 IyLfT/6R78MVheY+cTT1AU4PXw6ozabfBU6rg86Axo9s8Jr6u0N60k+IVj85JdHXXxEw
 sOCnBh3bliAIaGEnHJBDv0yIygKblmf2dlaEGuU8N56sJoHDEkvVC63eWGnrSY15sZpF
 xW4F/MTlm7q2SrUTCGY/ld8sRxQhjgTizZH4b3ghH0LfdqIFHQlb9S872BTVEpCgVTdR
 9dLw==
X-Gm-Message-State: AO0yUKXMssUHC6q834VAN7sy+Ph43VdatxoEwKWe/foCHX2fKb+QAbX+
 VVPrBHXPJ2HcGo0yxdQRBMuNIw==
X-Google-Smtp-Source: AK7set/Ql946wi5Yws02Kv5gzU9StoKoRjZJcvCbPIvWOOA7vPFfZYodjCHIFwyDUkHVX2nUm6KGZw==
X-Received: by 2002:a4a:3018:0:b0:517:4020:60b6 with SMTP id
 q24-20020a4a3018000000b00517402060b6mr16028065oof.8.1678812665364; 
 Tue, 14 Mar 2023 09:51:05 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 96-20020a9d04e9000000b0069451a9274bsm348689otm.28.2023.03.14.09.51.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 09:51:05 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v2 23/26] target/riscv: split
 riscv_cpu_validate_set_extensions()
Date: Tue, 14 Mar 2023 13:49:45 -0300
Message-Id: <20230314164948.539135-24-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230314164948.539135-1-dbarboza@ventanamicro.com>
References: <20230314164948.539135-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c29;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc29.google.com
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
X-List-Received-Date: Tue, 14 Mar 2023 16:51:27 -0000

We're now ready to split riscv_cpu_validate_set_extensions() in two.
None of these steps are going to touch env->misa_ext*.

riscv_cpu_validate_extensions() will take care of all validations based
on cpu->cfg values. cpu->cfg changes that are required for the
validation are being tolerated here. This is the case of extensions such
as ext_zfh enabling ext_zfhmin.

The RVV chain enablement (ext_zve64d, ext_zve64f and ext_zve32f) is also
being tolerated because the risk of failure is being mitigated by the
RVV -> RVD && RVF dependency in validate_misa_ext() done prior.

In an ideal world we would have all these extensions declared as object
properties, with getters and setters, and we would be able to, e.g.,
enable ext_zfhmin as soon as ext_zfh is enabled. This would avoid
cpu->cfg changes during riscv_cpu_validate_extensions(). Easier said
than done, not just because of the hundreds of lines involved in it, but
also because we want these properties to be available just for generic
CPUs (named CPUs don't want these properties exposed for users). For now
we'll work with that we have.

riscv_cpu_commit_cpu_cfg() is the last step of the validation where more
cpu->cfg properties are set and disabling of extensions due to priv spec
happens. We're already validated everything we wanted, so any cpu->cfg
change made here is valid.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1f72e1b8ce..e423d3e2d2 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1130,10 +1130,10 @@ static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
 }
 
 /*
- * Check consistency between chosen extensions while setting
- * cpu->cfg accordingly.
+ * Check consistency between chosen extensions. No changes
+ * in env->misa_ext are made.
  */
-static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
+static void riscv_cpu_validate_extensions(RISCVCPU *cpu, Error **errp)
 {
     if (cpu->cfg.epmp && !cpu->cfg.pmp) {
         /*
@@ -1222,7 +1222,10 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
             return;
         }
     }
+}
 
+static void riscv_cpu_commit_cpu_cfg(RISCVCPU *cpu)
+{
     if (cpu->cfg.ext_zk) {
         cpu->cfg.ext_zkn = true;
         cpu->cfg.ext_zkr = true;
@@ -1375,12 +1378,14 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    riscv_cpu_validate_set_extensions(cpu, &local_err);
+    riscv_cpu_validate_extensions(cpu, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
         return;
     }
 
+    riscv_cpu_commit_cpu_cfg(cpu);
+
 #ifndef CONFIG_USER_ONLY
     if (cpu->cfg.ext_sstc) {
         riscv_timer_init(cpu);
-- 
2.39.2


