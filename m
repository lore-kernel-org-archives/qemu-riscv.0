Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pf70W-0006xP-Be
	for mharc-qemu-riscv@gnu.org; Wed, 22 Mar 2023 18:32:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf70U-0006x4-Vc
 for qemu-riscv@nongnu.org; Wed, 22 Mar 2023 18:32:34 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf70H-0007Hz-AS
 for qemu-riscv@nongnu.org; Wed, 22 Mar 2023 18:32:34 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-5416698e889so364149987b3.2
 for <qemu-riscv@nongnu.org>; Wed, 22 Mar 2023 15:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679524237;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U3NtH6HOCPh1vtXRdOnmbAb1lq7yTfwsV1uPUUDJ9mE=;
 b=fLFmXEChuhhTAJ6n6ElJq9RHNIaJ9W0Tl66vSYnL85OElcFtq4bjeRbJDUKZmMj/Fu
 EC4bS5MLzhmTXMYmwAuZD9l5h8VnU11ApcH1Hn7APrt8oYbEdTE5fheapUzF9EtLZ8fi
 QiGmbIfiFQLAr5jrKLIf9qEqyoWVesqymDz4U9crKhlhItwszVBVCC7PhVwB84zgJpGv
 ZV++UVc0ZNWItRKd9gzVlgxBJPlcASkHiQEACZzUqtAQ7rQBg0U1ZsqWNHlzwuAq5TRe
 VyaANh2S+8wamynUV4lJLZuvtNjh7zpOhtAgweYBWI9lS3ZDILDBKfLsBkQVxcJZVtpT
 vmpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679524237;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U3NtH6HOCPh1vtXRdOnmbAb1lq7yTfwsV1uPUUDJ9mE=;
 b=Oq/uw4fF8VkMmKGPC5zNMRv8GvXcOK9wvhHaVm/Wv0H170Ojg0j22ATSeggpwsvpzC
 es9vkTnibexwhHjxf9cv8nk8VQ3OLJthTIu+UMaZS9L1B/hMsUfBKVhN+y+87hUJ96p3
 oPTfrgWTvVLyKs/nu9hQRT6c6L4PqEcGYuiGDsAX3c0aSbivc3an1XKiK9in9EDQh1ka
 5k/8N8xbxn7lwpT7XlXCkvpj7OHOid38Cf3RrM4f+3afdiEEe6IVDGsu3y4bZAiCLgmU
 A7fXuok0ynU7SutBw55N5D/Db3bjTkurjCG+Bf4BTc9wRaI2iClS9LvKscObTM+2vWTq
 KtrQ==
X-Gm-Message-State: AAQBX9dQUheT8qKPNYORAOi57FZrFaOVHQId6/digY4dtbC1OMm2M0vn
 nOvYgHM6FVpZBkBGRhBfodOYWvIwclFm8Maqo5w=
X-Google-Smtp-Source: AKy350YIdbjsDvDEJjKSr8iHUsB57Uy+tccjLm5aedxLcI8G4W+YthwFgQmU7/kKCoilaLJyRkgftg==
X-Received: by 2002:a05:6870:330f:b0:177:abd2:f867 with SMTP id
 x15-20020a056870330f00b00177abd2f867mr1026243oae.9.1679523687573; 
 Wed, 22 Mar 2023 15:21:27 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 ax35-20020a05687c022300b0017243edbe5bsm5586817oac.58.2023.03.22.15.21.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 15:21:27 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v4 21/25] target/riscv: split
 riscv_cpu_validate_set_extensions()
Date: Wed, 22 Mar 2023 19:20:00 -0300
Message-Id: <20230322222004.357013-22-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322222004.357013-1-dbarboza@ventanamicro.com>
References: <20230322222004.357013-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-yw1-x1132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 22 Mar 2023 22:32:35 -0000

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
index bd90e1d329..ed02332093 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1109,10 +1109,10 @@ static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
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
@@ -1201,7 +1201,10 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
             return;
         }
     }
+}
 
+static void riscv_cpu_commit_cpu_cfg(RISCVCPU *cpu)
+{
     if (cpu->cfg.ext_zk) {
         cpu->cfg.ext_zkn = true;
         cpu->cfg.ext_zkr = true;
@@ -1364,12 +1367,14 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
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


