Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pS0uW-0005TW-90
	for mharc-qemu-riscv@gnu.org; Tue, 14 Feb 2023 14:24:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pS0uV-0005T1-BG
 for qemu-riscv@nongnu.org; Tue, 14 Feb 2023 14:24:15 -0500
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pS0uP-000564-KV
 for qemu-riscv@nongnu.org; Tue, 14 Feb 2023 14:24:10 -0500
Received: by mail-ot1-x330.google.com with SMTP id
 38-20020a9d04a9000000b0068f24f576c5so4694038otm.11
 for <qemu-riscv@nongnu.org>; Tue, 14 Feb 2023 11:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yKIYePLvaLWJ6O9SDeeLYtu4voQMJnIs6svun5FJO0U=;
 b=h5WwEvL3uYkHodVxI1jMwnycZxfEUFzBjP4K0PpS9X8UKpSfGv9wnm+Rll1YzCPhTd
 VsaR+VjzGRX3QjFYDNTLU6NAc3OdX9qO5APICZHpBOj4xOap31OdfNKy3P81Fqht/601
 SCxxRCN8V+7sKtTVZU18cRQyR38yCxzZcKOTNxo0ppnmjT+w2Zez4Avu1pH0j1PRGRXw
 HvS2m9P/e/0mtYOo2zebKGvnZPaRyh7K8uh9kHbym9VclcFhV0IWcbwCka5j3q4eZ4IU
 qLXwqITZVg+J66InKDH/QYE8YluzVcFLooUVCQG8vLe1AmjQNX7hXct77X/k1mzRPNz/
 w+jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yKIYePLvaLWJ6O9SDeeLYtu4voQMJnIs6svun5FJO0U=;
 b=vKMcJxtFuyObdY8UhzeDzMMhF9AGxt9tmg8kI8IkKwISH2FNEn4qUUbOw7RjKXHPSt
 y/TnsBJntxxo7ZhxheUWiXgz7bMziCqwLTF1vkNA+lnwg/Fx+Lf9qwgT9fR3+3rNjUpr
 zAeIngqXCd1isOh0xxHLb1EDTS7irhtNFI/lrwLOf+mI3e0aw94+Q8DzKmlj3oA9/SP+
 /nS6Tp44HYd/isC/wsRon0jv7efcaQgXzq8vs5QH5DV6dq+b4pMK9E6eydfgCaaV504c
 hrkgEqAhrPF5wlL+BRhRMnLGML4pnM7X99QGKBGwFLucfLVfmhdHq04vwUrf9GlhuHLn
 ynCQ==
X-Gm-Message-State: AO0yUKWwh2hJkYMCzWE7bygIwbruLdtR8rL0eppDkz/RolmUSTSeGvLa
 OrM+j8ymKa7WjZ7lwg5YGtR82g==
X-Google-Smtp-Source: AK7set+Bh93//3sVBPa6EsVmVu/V5kEvfsfA4ck4pnyndv+D3/wi5AGU7yLP02JAGder+u730/fH+Q==
X-Received: by 2002:a05:6830:3b87:b0:68b:dd2c:77cf with SMTP id
 dm7-20020a0568303b8700b0068bdd2c77cfmr1361934otb.32.1676402649038; 
 Tue, 14 Feb 2023 11:24:09 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 g5-20020a9d6185000000b006865223e532sm6653752otk.51.2023.02.14.11.24.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 11:24:08 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 02/11] target/riscv: introduce riscv_cpu_cfg()
Date: Tue, 14 Feb 2023 16:23:47 -0300
Message-Id: <20230214192356.319991-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214192356.319991-1-dbarboza@ventanamicro.com>
References: <20230214192356.319991-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x330.google.com
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
X-List-Received-Date: Tue, 14 Feb 2023 19:24:15 -0000

We're going to do changes that requires accessing the RISCVCPUConfig
struct from the RISCVCPU, having access only to a CPURISCVState 'env'
pointer. Add a helper to make the code easier to read.

Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 7128438d8e..5e4d056772 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -654,6 +654,11 @@ static inline RISCVMXL riscv_cpu_mxl(CPURISCVState *env)
 #endif
 #define riscv_cpu_mxl_bits(env) (1UL << (4 + riscv_cpu_mxl(env)))
 
+static inline RISCVCPUConfig riscv_cpu_cfg(CPURISCVState *env)
+{
+    return env_archcpu(env)->cfg;
+}
+
 #if defined(TARGET_RISCV32)
 #define cpu_recompute_xl(env)  ((void)(env), MXL_RV32)
 #else
-- 
2.39.1


