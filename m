Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSdww-0004QJ-RI
	for mharc-qemu-riscv@gnu.org; Thu, 16 Feb 2023 08:05:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSdwn-0004Ku-9V
 for qemu-riscv@nongnu.org; Thu, 16 Feb 2023 08:05:13 -0500
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSdwl-0002D6-92
 for qemu-riscv@nongnu.org; Thu, 16 Feb 2023 08:05:12 -0500
Received: by mail-oo1-xc34.google.com with SMTP id
 i17-20020a4adf11000000b0051abd9835d4so205141oou.1
 for <qemu-riscv@nongnu.org>; Thu, 16 Feb 2023 05:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bzgUQCLPgU6X7MZ2uleR0+KefuKd7NhosDsVObTIs/M=;
 b=PKgnkpGsaShJmPV4MGbZVSEl0sntGgP7dqF4BjeK6h4MGQ1AxqhMaC8Jj7w6GwdNmU
 f1gLVjV7GAOV0e57SvlviBJja4ExO3KcFDK3HJjWkOvktUcmPzRqAhxRc78hPDQ4HFV+
 I5k/YwvtsmBNI9UIuQJJ/17x3C0wypPKh76i0Bgl6Tr5HK1F81EOQW3z0L7SBvCQ6nGB
 ZgcHJZCBzC3yTbTWA5GBBpPYKnEmlba52x8MSEP81amrr6Nzcmdi0KxkMyCwb/o5KjEj
 Tv+0hV7A3IEEYcS07hKP3el1hn7xs4UTGA81W7AlMlvSj6s3UpdAqx2GJlJbl/M1AFPu
 AV1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bzgUQCLPgU6X7MZ2uleR0+KefuKd7NhosDsVObTIs/M=;
 b=YnKygsZaTyGQCxftu9IwlVKT302lsFUO85RXiYFOqI51pMbc3Ym75TPJsF0FNwUJWK
 00aHp3Ach/iOIa0ZH46LdP/Af8ButyWNw3aSmoUET0UAskH3B+AYCZ9hfSyiRfc2H1EC
 CBZslTZfsUY8mLDnhouhsy7ugd2J2gIo9g6igb0KhRy8CuuPwm1ucuL3HOBMhMJbeBC5
 UtVwVTwOiVMuV6rWkCqnjzh72XfVIJI/7CBXNuxuZXgSGCTRtEJjIRqgQnuUPXWaPK+/
 zMLry3z4ACbt0v2oUAOGhKg4xY0wXixpf/PVooP7p4sRSsV5SZafkv4kpSgmHMlUInnA
 qAaw==
X-Gm-Message-State: AO0yUKXhvjpWm1IZ8DZIrr/GqQXiLqZWrLk4kSGQQykC1Y8m2zdQDTjB
 nOXc9MzEKEYDXf4b70OtfjLPHg==
X-Google-Smtp-Source: AK7set9AwnQaOt03vuyttS9V2szt4NQqrvgz9uKePE3L5LJ4Z5uKR6Exjtj2xA61PTm1M5jzJdmhsA==
X-Received: by 2002:a4a:d792:0:b0:51a:32b0:9601 with SMTP id
 c18-20020a4ad792000000b0051a32b09601mr2632528oou.4.1676552710066; 
 Thu, 16 Feb 2023 05:05:10 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 c74-20020a4a4f4d000000b0051f97e8a1d5sm594315oob.35.2023.02.16.05.05.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 05:05:09 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 05/10] target/riscv/cpu.c: error out if EPMP is enabled
 without PMP
Date: Thu, 16 Feb 2023 10:04:39 -0300
Message-Id: <20230216130444.795997-6-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230216130444.795997-1-dbarboza@ventanamicro.com>
References: <20230216130444.795997-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c34;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc34.google.com
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
X-List-Received-Date: Thu, 16 Feb 2023 13:05:14 -0000

Instead of silently ignoring the EPMP setting if there is no PMP
available, error out informing the user that EPMP depends on PMP
support:

$ ./qemu-system-riscv64 -cpu rv64,pmp=false,x-epmp=true
qemu-system-riscv64: Invalid configuration: EPMP requires PMP support

This will force users to pick saner options in the QEMU command line.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/cpu.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index e34a5e3f11..4585ca74dc 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -925,13 +925,18 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
 
     if (cpu->cfg.pmp) {
         riscv_set_feature(env, RISCV_FEATURE_PMP);
+    }
+
+    if (cpu->cfg.epmp) {
+        riscv_set_feature(env, RISCV_FEATURE_EPMP);
 
         /*
          * Enhanced PMP should only be available
          * on harts with PMP support
          */
-        if (cpu->cfg.epmp) {
-            riscv_set_feature(env, RISCV_FEATURE_EPMP);
+        if (!cpu->cfg.pmp) {
+            error_setg(errp, "Invalid configuration: EPMP requires PMP support");
+            return;
         }
     }
 
-- 
2.39.1


