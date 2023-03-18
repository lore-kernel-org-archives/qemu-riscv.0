Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pdcoH-0005ga-Cb
	for mharc-qemu-riscv@gnu.org; Sat, 18 Mar 2023 16:05:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pdcoD-0005Uw-Sv
 for qemu-riscv@nongnu.org; Sat, 18 Mar 2023 16:05:45 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pdcoC-0007Bh-5H
 for qemu-riscv@nongnu.org; Sat, 18 Mar 2023 16:05:45 -0400
Received: by mail-oi1-x22a.google.com with SMTP id w133so6224955oib.1
 for <qemu-riscv@nongnu.org>; Sat, 18 Mar 2023 13:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679169943;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o0rl6JVpTdkHoeH1u/5HjB+UHq/yyk05dEosKdOXvJw=;
 b=B/WAdZEsdVOWX8r/G2ajpzw36NW0da4XK/Pwugmukdq3QjpTPopi92hWPBwat7eQy9
 PzrHq6zFecaa7OQovf/f9bp8lF6uf5z0betRHSQ1BOfKokq8Mp8+tQ1CLmiayiadM8p4
 npfqEapNOcTr/7iGfOG9P73ypUwVJHoReJxwggDI2e2vgpBHAjJsINNIwvb+NqKikmKx
 bNwlfxicNg3Tu5jQR0XB449KsQUz1oZrJkMSGdLevZ0Yxwrr5Mr2pYGQsQR9VIGDNGt4
 vbFIaMecFh3vDoNPshZmcG1UuR8Cvp2PPcOWWtCHJreIRJRzyMkyFEClCaXft7nkG3g8
 ytiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679169943;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o0rl6JVpTdkHoeH1u/5HjB+UHq/yyk05dEosKdOXvJw=;
 b=DMukOMmmg58IO6fhIM/lEbFOcmSzEcmfRJEaQRo/bsXyxEy5tieBiE6lGnABbEGCsE
 1O8jBJSx0CKtpb/LpItdDw/RoGe6uiSaWRRPXpBU04Jq3H/bekWazBZ0g3hMHKgy0yGt
 d4XQkkyGEDwJBJlqWKOPEJhn2x3DqamPVHs/5AvnUj4wto1EzHenDI+NtbviS0WiYAlX
 RrbG2Mlc43DTqXpkcu7DmH8l8EKa1noXL2gac2rPNSh4LeMZjre4/3nf04Tp/frLlDKG
 KgHpucSoWfOOy83xY5xiMMeWni3p81nIs2vgrCSGgKid6RgzWJ+hfS073TilRJQNUOWh
 6c7Q==
X-Gm-Message-State: AO0yUKVnACEev5WxMtkV+rAxyDgEVmjHtzmtsAXrLvhNiEAv5f7qtUQ6
 GB2nq4gWXC0YVt14OGG7kiW32g==
X-Google-Smtp-Source: AK7set9XBji2pzM8Pr1EJXgHzyrNlmEJBFOEsQQXhJlRTHDqq6qn+l39/BeOh+qPUseWwUwBAw60zg==
X-Received: by 2002:aca:2107:0:b0:384:3a4d:7f72 with SMTP id
 7-20020aca2107000000b003843a4d7f72mr6543843oiz.9.1679169942039; 
 Sat, 18 Mar 2023 13:05:42 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 f69-20020a4a5848000000b004a3d98b2ccdsm2122219oob.42.2023.03.18.13.05.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Mar 2023 13:05:41 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v3 21/26] target/riscv: split
 riscv_cpu_validate_set_extensions()
Date: Sat, 18 Mar 2023 17:04:31 -0300
Message-Id: <20230318200436.299464-22-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318200436.299464-1-dbarboza@ventanamicro.com>
References: <20230318200436.299464-1-dbarboza@ventanamicro.com>
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
X-List-Received-Date: Sat, 18 Mar 2023 20:05:46 -0000

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
index 7861f0421e..69fc0d17a5 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1118,10 +1118,10 @@ static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
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
@@ -1210,7 +1210,10 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
             return;
         }
     }
+}
 
+static void riscv_cpu_commit_cpu_cfg(RISCVCPU *cpu)
+{
     if (cpu->cfg.ext_zk) {
         cpu->cfg.ext_zkn = true;
         cpu->cfg.ext_zkr = true;
@@ -1373,12 +1376,14 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
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


