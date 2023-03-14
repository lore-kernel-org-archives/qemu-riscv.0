Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pc7sC-00086f-Qw
	for mharc-qemu-riscv@gnu.org; Tue, 14 Mar 2023 12:51:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pc7rg-0006wr-Pl
 for qemu-riscv@nongnu.org; Tue, 14 Mar 2023 12:51:18 -0400
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pc7rc-00035o-Oa
 for qemu-riscv@nongnu.org; Tue, 14 Mar 2023 12:51:07 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-176261d7f45so17965188fac.11
 for <qemu-riscv@nongnu.org>; Tue, 14 Mar 2023 09:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1678812662;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Hq9gu6gdQMKvyfHGOOHilBq8t2MGN+S8P1yZLlg/7J8=;
 b=fan1aJUarjHM4z8Dimno2vBi7Lq7p9Vs1zop2m+gYz0cBtJy8W/b+ftNgKDb39//Ua
 pQHFiQeAUmYu2siJcwL0CAKfdnxK6mqIg3JLOsCwA9kR43lnI7W7fv+IBKhg11KhpE4k
 0AXM3EAN9D7mz7EcwBZ0emxSm3wbuV7R0Xg+s4LxoFGgWVlLG6JM8vhyb4TZ84KS0o1I
 /zixpNiItUIdeV02E76WWPZNw3gPni5+j9okOe/jr1zFqBEenO1IKC3UTXx8Yw4wYJ+d
 /muE3irZBIFHgy1+wzCpX2W4oU0MqxfI6+ms21KqfQuLI4teGQyj5TbrNtHlE0Lma+GE
 +x8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678812662;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Hq9gu6gdQMKvyfHGOOHilBq8t2MGN+S8P1yZLlg/7J8=;
 b=eRapV3hP5jJ6gE6iDHfqII6Tmp/tQnNZ8Zugd+yT87ey3LmemEtj8Pe0nC3HrYiL2d
 RnbDTWSPkEVCPWdVnsHsJWLfEKqN1aAuJn/LP71kYPjvkkSbIvnX+0QEef5ro+o6JgKb
 VoTW6S3uVL/h7C03mANelBArMjBiJAdt3pEGBpWqU61oSsDGMQH7pEePj/Xa+kAO/xNb
 OxFPemrIFDyeseMq2eRGbtdJmZHfi7IWJIn+jTh61M7F+Ey1Hfn+Zjb/9LBNyd3/gwL4
 ej80Ug2aXSAuDZ2i97voX5srXVO0evcA6hotGSMb8TJfw1qyAl6WJ1sUAzkZa1m4RcPB
 bLHA==
X-Gm-Message-State: AO0yUKUmjIYlKjdXPPc4O1tzRg3gxYesJRbkxvUdWNxgWNolIEMlfLI+
 BceCR00one3Onmrr1nFWz4ue2nQn9LRv6ZEWJ6g=
X-Google-Smtp-Source: AK7set/7r2Ej9UkkE01qmGQjtfTTY7VfoWfAY2uxENaH8ku3nh9+6Lqjzrnb2RYIzJFx0qZLU8DwUQ==
X-Received: by 2002:a05:6870:b016:b0:177:896a:cb06 with SMTP id
 y22-20020a056870b01600b00177896acb06mr8626840oae.17.1678812662217; 
 Tue, 14 Mar 2023 09:51:02 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 96-20020a9d04e9000000b0069451a9274bsm348689otm.28.2023.03.14.09.50.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 09:51:01 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v2 22/26] target/riscv: error out on priv failure for
 RVH
Date: Tue, 14 Mar 2023 13:49:44 -0300
Message-Id: <20230314164948.539135-23-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230314164948.539135-1-dbarboza@ventanamicro.com>
References: <20230314164948.539135-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2b.google.com
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

We have one last case where we're changing env->misa_ext* during
validation. riscv_cpu_disable_priv_spec_isa_exts(), at the end of
riscv_cpu_validate_set_extensions(), will disable cpu->cfg.ext_h and
cpu->cfg.ext_v if priv_ver check fails.

This check can be done in riscv_cpu_validate_misa_ext(). The difference
here is that we're not silently disable it: we'll error out. Silently
disabling a MISA extension after all the validation is completed can
can cause inconsistencies that we don't have to deal with. Verify ealier
and fail faster.

Note that we're ignoring RVV priv_ver validation since its minimal priv
is also the minimal value we support. RVH will error out if enabled
under priv_ver under 1_12_0.

As a bonus, we're guaranteeing that all env->misa_ext* changes will
happen up until riscv_set_G_virt_ext(). We don't have to worry about
keeping env->misa_ext in sync with cpu->cfg.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index f8f416d6dd..1f72e1b8ce 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1067,6 +1067,20 @@ static void riscv_cpu_validate_misa_ext(CPURISCVState *env,
         return;
     }
 
+    /*
+     * Check for priv spec version. RVH is 1_12_0, RVV is 1_10_0.
+     * We don't support anything under 1_10_0 so skip checking
+     * priv for RVV.
+     *
+     * We're hardcoding it here to avoid looping into the
+     * 50+ entries of isa_edata_arr[] just to check the RVH
+     * entry.
+     */
+    if (misa_ext & RVH && env->priv_ver < PRIV_VERSION_1_12_0) {
+        error_setg(errp, "H extension requires priv spec 1.12.0");
+        return;
+    }
+
     if (misa_ext & RVV) {
         /*
          * V depends on Zve64d, which requires D. It also
@@ -1117,14 +1131,10 @@ static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
 
 /*
  * Check consistency between chosen extensions while setting
- * cpu->cfg accordingly, setting env->misa_ext and
- * misa_ext_mask in the end.
+ * cpu->cfg accordingly.
  */
 static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
 {
-    CPURISCVState *env = &cpu->env;
-    uint32_t ext = 0;
-
     if (cpu->cfg.epmp && !cpu->cfg.pmp) {
         /*
          * Enhanced PMP should only be available
@@ -1241,10 +1251,6 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
      * validated and set everything we need.
      */
     riscv_cpu_disable_priv_spec_isa_exts(cpu);
-
-    ext = riscv_get_misa_ext_with_cpucfg(&cpu->cfg);
-
-    env->misa_ext_mask = env->misa_ext = ext;
 }
 
 #ifndef CONFIG_USER_ONLY
@@ -1355,6 +1361,10 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    /*
+     * This is the last point where env->misa_ext* can
+     * be changed.
+     */
     if (cpu->cfg.ext_g) {
         riscv_set_G_virt_ext(cpu);
     }
-- 
2.39.2


