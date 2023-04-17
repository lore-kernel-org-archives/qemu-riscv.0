Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1poPPM-0004Gx-1D
	for mharc-qemu-riscv@gnu.org; Mon, 17 Apr 2023 10:00:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1poPPF-0003q8-Q8
 for qemu-riscv@nongnu.org; Mon, 17 Apr 2023 10:00:33 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1poPPC-00036O-OJ
 for qemu-riscv@nongnu.org; Mon, 17 Apr 2023 10:00:33 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-18782426c4bso17427896fac.9
 for <qemu-riscv@nongnu.org>; Mon, 17 Apr 2023 07:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1681740029; x=1684332029;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/K+x0BBUJKKhnnJD7tcM3hOXjdXSPbLCX01Uxo6rI88=;
 b=LPAfdBLW/a9ZYX+ZvxXgsDCRN31zDf6hxFY6PKVKtOvmS7zNZRR5JE8wXWltGNnw8t
 v8LXY25s8isFm6pgujYgh1J3YiNR8JMf8z3r8mYdN1rIMlwizodqqztLdsyuirAYZ7mO
 vWTH0L+wTS7qNjpV5T3S8bsTspyOIjMXXKpNMAlYljbRjJV6DmCQAqgvaZon9qyrTGuQ
 tYJzgtfj+5V4e3MTJC4TmiUD9mRarRpE0y/1G9C6s9CgLn6oxOpxcoZjEvxLKC19cmoX
 wvX0JcSoF59ejpHzEtxIixs3dnyy7vTrnzaoWyODO0SRL7XN6yo7ccJ3R/ijpNDceb3M
 JJHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681740029; x=1684332029;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/K+x0BBUJKKhnnJD7tcM3hOXjdXSPbLCX01Uxo6rI88=;
 b=PlQsK9v5HGj6D8UCtrLjmNLhVU8249Zzl5kI+wp7uxWmp2J5nspIDXg1K4HVJAi1fe
 fX6qNmeBvvExd/qf5IKXWC3w7ia0gHMNXmAivwzW7EIMK9+/tjdX3OLDYztqPYDDSGC9
 H0bDHxMMWK+gXqmqcL27dPof7F3hsXQbV8vTXBiz19ijfoqDEgfosHys+zhkfD0T499G
 pEi1E0rs9GJ02FH1fyM7j0rorhwJMnG3pTFJRM7HMMt+7QSsp7GlD3UBErU2WzLycAMV
 GarldQMDwITkvL2Vv7ovtTK7TAauLRFsUHwj5/Ya9Slqu8/ewdg09dzsHow65hiUJDbP
 TPLg==
X-Gm-Message-State: AAQBX9eQkYm9QbYUpYrOSGqjXmiqJEup+dUgdyYQVqDH7vrZYUU/SGxl
 rSzA6dkMIhzL/5r0AyfkQiJf7A==
X-Google-Smtp-Source: AKy350YYyijy87m2GwSRnRs7sgPGDitw9u9ZimFSanH5lPp3slrErFqwxpEr48WYd7uFP9iQ4MnFmg==
X-Received: by 2002:a05:6870:c22a:b0:187:9b52:f58a with SMTP id
 z42-20020a056870c22a00b001879b52f58amr7723925oae.53.1681740029566; 
 Mon, 17 Apr 2023 07:00:29 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([191.255.108.232])
 by smtp.gmail.com with ESMTPSA id
 x16-20020a05687031d000b001726cfeea97sm4531868oac.29.2023.04.17.07.00.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 07:00:29 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v7 02/12] target/riscv/cpu.c: remove set_vext_version()
Date: Mon, 17 Apr 2023 11:00:03 -0300
Message-Id: <20230417140013.58893-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230417140013.58893-1-dbarboza@ventanamicro.com>
References: <20230417140013.58893-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2c.google.com
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
X-List-Received-Date: Mon, 17 Apr 2023 14:00:34 -0000

This setter is doing nothing else but setting env->vext_ver. Assign the
value directly.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
---
 target/riscv/cpu.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index feca13aefb..fed7b467e4 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -252,11 +252,6 @@ static void set_priv_version(CPURISCVState *env, int priv_ver)
     env->priv_ver = priv_ver;
 }
 
-static void set_vext_version(CPURISCVState *env, int vext_ver)
-{
-    env->vext_ver = vext_ver;
-}
-
 #ifndef CONFIG_USER_ONLY
 static uint8_t satp_mode_from_str(const char *satp_mode_str)
 {
@@ -834,7 +829,7 @@ static void riscv_cpu_validate_v(CPURISCVState *env, RISCVCPUConfig *cfg,
         qemu_log("vector version is not specified, "
                  "use the default value v1.0\n");
     }
-    set_vext_version(env, vext_version);
+    env->vext_ver = vext_version;
 }
 
 /*
-- 
2.39.2


