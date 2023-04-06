Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkTyp-0001Q2-4r
	for mharc-qemu-riscv@gnu.org; Thu, 06 Apr 2023 14:05:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pkTyn-0001Mr-Lx
 for qemu-riscv@nongnu.org; Thu, 06 Apr 2023 14:05:01 -0400
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pkTyj-0000mZ-EF
 for qemu-riscv@nongnu.org; Thu, 06 Apr 2023 14:04:59 -0400
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-17ac5ee3f9cso43200304fac.12
 for <qemu-riscv@nongnu.org>; Thu, 06 Apr 2023 11:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1680804295;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6Wyx1FHmxLdFtf+sn5xFAZ+OPtPshuj5d2U+hRYbEPU=;
 b=ndQ2X+kmw7UYP2zhjJqqooTLbEUUbWfBrKw9NbAXLWK9Iiace0HRsEoFeh5Mi0iAWS
 8FqJdzSrYpbmlMCTmq8hHQuhwHfxTylLigDSyUcb9PQu5eC9kGxxrK+JJhBU8HmI2s1n
 9UyEBToSFbpaQe3OhGoj5YBzYrFOOczE1Vw9hUGj47XnAZe6b5poDPpYPO5zV5ICCd5z
 1nQEv7hyltpeYQYjXg6v13l9QDiHv2gcy8x+pGNe1dUG+SgklkgwDmgN6XTnuDoXcGkQ
 zxziRtWCaVagpKtw2PqNkvXbpamaV6ts7NwNIT4SEhSxK32A6Xy6Hc/JK/EBeYUGhkld
 aFOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680804295;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6Wyx1FHmxLdFtf+sn5xFAZ+OPtPshuj5d2U+hRYbEPU=;
 b=Lv3qRbx7iQ+J92RPbkfsPm76kJFfVI1ZuLei/7Ic0W23ONg1WTSoGzWXhvwaNE3YNL
 nsg/O/dwZdzRNB0b8zUP7uji8JjfNVsc1wYYKH70O9t4I+tFwZplHPQt5zL39u84Bhu0
 HoU2/L9qnSzvI5ddrOk3oYxzlDkVieJh5zkcuCt/2CiSp0vBPKrgciOXZfL31PG828aw
 puQ48a0KEh78tY2m9VOG2YBYEY/E4MhyX/GU12VjIds+1i17DCPmyevBZu+QIml9lOIB
 e4FhM3Kplc7Kg9ySD7GpxEXiPgpABQv9K+7LA7Vutvik4lNNeaxaKV1pOUXypJwVS9ak
 YmkQ==
X-Gm-Message-State: AAQBX9dJ86X0p6cB3XI0a1M0ib7hj02QtdOoXV2HF1XSsNwGcSL2erKe
 QAaGr04Hmj7O2nM1h8CkPzM8vg==
X-Google-Smtp-Source: AKy350YBor918awCNStMZ1zlzHp0MzyDIeSR9kuuQW3BNyaD1juNywcjPXBxBdnSK/VeetETpOYLfA==
X-Received: by 2002:a05:6870:d595:b0:177:a4d0:e389 with SMTP id
 u21-20020a056870d59500b00177a4d0e389mr110831oao.28.1680804295404; 
 Thu, 06 Apr 2023 11:04:55 -0700 (PDT)
Received: from grind.. ([191.255.108.232]) by smtp.gmail.com with ESMTPSA id
 g4-20020a056870d20400b0018045663fc5sm906309oac.48.2023.04.06.11.04.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 11:04:54 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 18/20] target/riscv: remove cfg.ext_g setup from
 rv64_thead_c906_cpu_init()
Date: Thu,  6 Apr 2023 15:03:49 -0300
Message-Id: <20230406180351.570807-19-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230406180351.570807-1-dbarboza@ventanamicro.com>
References: <20230406180351.570807-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x30.google.com
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
X-List-Received-Date: Thu, 06 Apr 2023 18:05:02 -0000

This CPU is enabling G via cfg.ext_g and, at the same time, setting
IMAFD in set_misa() and cfg.ext_icsr.

riscv_cpu_validate_set_extensions() is already doing that, so there's no
need for cpu_init() setups to worry about setting G and its extensions.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1ecb82bb5d..b005bcb786 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -403,11 +403,10 @@ static void rv64_thead_c906_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     RISCVCPU *cpu = RISCV_CPU(obj);
 
-    set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
+    set_misa(env, MXL_RV64, RVC | RVS | RVU);
     set_priv_version(env, PRIV_VERSION_1_11_0);
 
     cpu->cfg.ext_g = true;
-    cpu->cfg.ext_icsr = true;
     cpu->cfg.ext_zfh = true;
     cpu->cfg.mmu = true;
     cpu->cfg.ext_xtheadba = true;
-- 
2.39.2


