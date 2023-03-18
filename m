Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pdcnS-00050x-9D
	for mharc-qemu-riscv@gnu.org; Sat, 18 Mar 2023 16:04:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pdcnQ-00050e-UZ
 for qemu-riscv@nongnu.org; Sat, 18 Mar 2023 16:04:57 -0400
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pdcnP-0006su-1K
 for qemu-riscv@nongnu.org; Sat, 18 Mar 2023 16:04:56 -0400
Received: by mail-oo1-xc30.google.com with SMTP id
 n3-20020a4ad403000000b0053351dadc20so1312586oos.13
 for <qemu-riscv@nongnu.org>; Sat, 18 Mar 2023 13:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679169894;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4rTzH7idYU1tgJNSYCPX09c7tPogRTBHBl05b0u1Jxw=;
 b=JtahI04iRUgUc4R2dh4lvVZzkWZFl8YYM22WjgCAcVfTmqIOEzKQLdEh2iLA2Jj773
 AnZvbK6r+XlwuzUqZgUL90RO4Zq359Wzeuh2aNF7nA7G0/jIPloXQ4b/V4Q/F6LnegGB
 a1Q8qvvnKFGUFB70eAgFaqOHTH2KxAxAUQWgTPIIg6kpACd8uYkZ9lgEokgr6DmzZqlX
 8qHiipjxn16oPlW3BcGMx3ddU9YE4sGtcEZWCpp/tGbTg0MaiQMYyaqH2l78uVlAQ9js
 1i+W+jhuvOt5wC3EFY9bZe2bFlGWaa3aL1Qz0OivWJWa6OOkfciv75Ud4/Pou6TgjDoN
 otsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679169894;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4rTzH7idYU1tgJNSYCPX09c7tPogRTBHBl05b0u1Jxw=;
 b=jwSE2cn0Kzo05jaiFr9bRHRkzEg1osHwyTZIXRTI7Oyp5WJk3FGExhRFVsYSfGue9I
 +OLVEW1eALaPiVe+r0kUVaEdMMYI9Q3x1b9eVTaFvHxNPjFTmYJOKN+YQQhgjd++JaL6
 aI+ACdQDBCb+ZqqpoTPOLQ0pWMeW08zhhiWPeXJAnc3y85eZgSJYg2mM4ZHvzMF6P0FF
 QRBfKQim/uii9OwLCXDomUEPf40FhaTTpuRNwRSI4eTeKESujUe7r2BPD+k0stBaPufD
 MUeRxiTEHicbb60rLMi1R73dmXVgB6NdOGP9H/BG6SzNsIbUdtdPA53F47DgH4FJe0WU
 TQWQ==
X-Gm-Message-State: AO0yUKXSV01xICpuKs2EoOEvM24IrYmJAgesXb56cez/swTCd8orKmq1
 fwkI00OhIOOOTrcq2zr7CDCjlw==
X-Google-Smtp-Source: AK7set9K187HEkKDbq1Fp0+GvsbCxZL/oXPicQzJquWkfr/nU5ldIHlv8pZDsVtbKK14fKjWFw5oFw==
X-Received: by 2002:a4a:9693:0:b0:536:6493:2434 with SMTP id
 s19-20020a4a9693000000b0053664932434mr1266067ooi.7.1679169893948; 
 Sat, 18 Mar 2023 13:04:53 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 f69-20020a4a5848000000b004a3d98b2ccdsm2122219oob.42.2023.03.18.13.04.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Mar 2023 13:04:53 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH for-8.1 v3 04/26] target/riscv: add PRIV_VERSION_LATEST
Date: Sat, 18 Mar 2023 17:04:14 -0300
Message-Id: <20230318200436.299464-5-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318200436.299464-1-dbarboza@ventanamicro.com>
References: <20230318200436.299464-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c30;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc30.google.com
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
X-List-Received-Date: Sat, 18 Mar 2023 20:04:57 -0000

All these generic CPUs are using the latest priv available, at this
moment PRIV_VERSION_1_12_0:

- riscv_any_cpu_init()
- rv32_base_cpu_init()
- rv64_base_cpu_init()
- rv128_base_cpu_init()

Create a new PRIV_VERSION_LATEST enum and use it in those cases. I'll
make it easier to update everything at once when a new priv version is
available.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 8 ++++----
 target/riscv/cpu.h | 2 ++
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 18032dfd4e..1ee322001b 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -338,7 +338,7 @@ static void riscv_any_cpu_init(Object *obj)
                                     VM_1_10_SV32 : VM_1_10_SV57);
 #endif
 
-    env->priv_ver = PRIV_VERSION_1_12_0;
+    env->priv_ver = PRIV_VERSION_LATEST;
     register_cpu_props(obj);
 }
 
@@ -350,7 +350,7 @@ static void rv64_base_cpu_init(Object *obj)
     set_misa(env, MXL_RV64, 0);
     register_cpu_props(obj);
     /* Set latest version of privileged specification */
-    env->priv_ver = PRIV_VERSION_1_12_0;
+    env->priv_ver = PRIV_VERSION_LATEST;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV57);
 #endif
@@ -426,7 +426,7 @@ static void rv128_base_cpu_init(Object *obj)
     set_misa(env, MXL_RV128, 0);
     register_cpu_props(obj);
     /* Set latest version of privileged specification */
-    env->priv_ver = PRIV_VERSION_1_12_0;
+    env->priv_ver = PRIV_VERSION_LATEST;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV57);
 #endif
@@ -439,7 +439,7 @@ static void rv32_base_cpu_init(Object *obj)
     set_misa(env, MXL_RV32, 0);
     register_cpu_props(obj);
     /* Set latest version of privileged specification */
-    env->priv_ver = PRIV_VERSION_1_12_0;
+    env->priv_ver = PRIV_VERSION_LATEST;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV32);
 #endif
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 638e47c75a..76f81c6b68 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -88,6 +88,8 @@ enum {
     PRIV_VERSION_1_10_0 = 0,
     PRIV_VERSION_1_11_0,
     PRIV_VERSION_1_12_0,
+
+    PRIV_VERSION_LATEST = PRIV_VERSION_1_12_0,
 };
 
 #define VEXT_VERSION_1_00_0 0x00010000
-- 
2.39.2


