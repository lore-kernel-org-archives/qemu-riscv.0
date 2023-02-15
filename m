Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSMyc-00086c-2I
	for mharc-qemu-riscv@gnu.org; Wed, 15 Feb 2023 13:57:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSMyS-0007tf-TJ
 for qemu-riscv@nongnu.org; Wed, 15 Feb 2023 13:57:49 -0500
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSMyR-0007wH-BR
 for qemu-riscv@nongnu.org; Wed, 15 Feb 2023 13:57:48 -0500
Received: by mail-oi1-x232.google.com with SMTP id bj22so16652577oib.11
 for <qemu-riscv@nongnu.org>; Wed, 15 Feb 2023 10:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bzgUQCLPgU6X7MZ2uleR0+KefuKd7NhosDsVObTIs/M=;
 b=LOO3Aw+4O/x4DDMndxOcWWbRp+PaoLPv9slPF7t6+iQ3HYFjC9ad0ipGLJzz9o7DzI
 NYIq7tBkjRVqRkTD/lZxULrVSot58/sRPIJQaup876poUjwc4K24bI9YYH4ZCCRNVWhE
 9iZEw/gBuQTtYlPLvvjVUmQ4VSJjEIp/2c4azh2Cb/SkwP1qTplfYw7Li6BBbZv2AH6H
 VZ7q0o6MnwY8+xwUO/0J2PeAbAs6B3UbZQQRRUHln2YLQ0QYGVlJqZrS+RLyy4nKFNoh
 ge03NXCcA2fLqsraQK3Fy960fTrI9bZVB9ObCYp9vLRhD4M6WBMR7mC0SgcWGmWgiMry
 BsFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bzgUQCLPgU6X7MZ2uleR0+KefuKd7NhosDsVObTIs/M=;
 b=diV/y1ZhsOTw9nrdU4zW97D3bKJ7LKDousOCKL7rE7iurBZy8mUhjQZlfZH7qCb9eh
 uILL+ltHAv3nSpq0vTdIMAt0sJYyX0K8BESd7nKwBA2V1/A8i2k0+LFWdz0ZvRlDxBKf
 hjZ/iUINhG4aE+lZlDixoVWgH5QpG4nEduG8AKK7LolM96Wt4UeALMUntRX+d+17ABfR
 SyBZzNIfw0J/uhI0gbuAcwvsP0ZHht8pAAbYDcKDb20O7es/HJ5qJXjRZ8oVlWAAvsQ3
 4a0yVDpsptzXCyIinUQctT5D9dYOXW+4eif35VRPRX1DuXqvANtX3NDJViWOAFcUY9Hm
 zMRA==
X-Gm-Message-State: AO0yUKULLOpgvb4LmLaPRL8jsRxn3le21R6vo4XZNRB/FEHcp1LARwug
 Mv/ngMeWPrVoDfFweYKcEsEJOQ==
X-Google-Smtp-Source: AK7set8HGPd+7pnj0afCL9oguEdGct0htrfsgxK4oQR4JM1/M/hRjhjBkBcsMGjOsJiqnEo7GZM8gA==
X-Received: by 2002:a05:6808:ab1:b0:364:5d1d:5528 with SMTP id
 r17-20020a0568080ab100b003645d1d5528mr1299692oij.1.1676487466739; 
 Wed, 15 Feb 2023 10:57:46 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 c21-20020a056808139500b0037d8dbe4308sm4145697oiw.48.2023.02.15.10.57.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 10:57:46 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v3 05/10] target/riscv/cpu.c: error out if EPMP is enabled
 without PMP
Date: Wed, 15 Feb 2023 15:57:21 -0300
Message-Id: <20230215185726.691759-6-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230215185726.691759-1-dbarboza@ventanamicro.com>
References: <20230215185726.691759-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x232.google.com
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
X-List-Received-Date: Wed, 15 Feb 2023 18:57:50 -0000

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


