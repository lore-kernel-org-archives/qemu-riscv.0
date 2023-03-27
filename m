Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pgvfw-0006cq-Qc
	for mharc-qemu-riscv@gnu.org; Mon, 27 Mar 2023 18:50:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgvfv-0006bO-0p
 for qemu-riscv@nongnu.org; Mon, 27 Mar 2023 18:50:51 -0400
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgvft-0007hY-DF
 for qemu-riscv@nongnu.org; Mon, 27 Mar 2023 18:50:50 -0400
Received: by mail-oo1-xc35.google.com with SMTP id
 n6-20020a4abd06000000b0053b59893660so1614418oop.0
 for <qemu-riscv@nongnu.org>; Mon, 27 Mar 2023 15:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679957448;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KBPjYNS6cT394WjeQaCxJymd5fxaWDVeNGS/MFvML28=;
 b=bqBuZC7EvcUjL7XtfH1/aZyj27H5s4Fl4GsChMIE4xKgreykBBRAce9bhgZicjRckg
 +MAegj2ONxrORNujeuIywkk28skTzuAW5tmBqRvXi1pa6A3tSDtV3JZuJPDVAVbS54/i
 vpaHnkQVnhhmQwX8iHIpp+Z9gcTZqTHdnSr1LdHlYaG2I5OAj8N8BxiAqMUc+kdzB0NI
 fJ6Qqt5d/ilTQm4XXqd+HOYYj60udVRBVhxaXU9w9DdqP9QPCuvmZdw34tWueX1AwKWX
 lsfaCTVfNm4zatEqgRgTY5AGtvHsfpN0Bpix/QDn3W016No8BeNRTrUFJaQ3lSD/auI/
 CR0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679957448;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KBPjYNS6cT394WjeQaCxJymd5fxaWDVeNGS/MFvML28=;
 b=JLkxfEmOda8xil5uLUtLeg9KGLU5lCMhXRt8EFbhwv+AyljuK0FWL2dH2+cQxZi1qr
 PCAW3M8cTk3xJFqwLrhYnB63x0m33BIF4qvnbH4TQyQi062UE1dCgKXK7SlgEH/taZZN
 Qrf+Lt/x3/6BkYSGpZ90h+pDhV13j5OcdNZTRk1UDE0jsh3SXYgIbs0pUJ/pL9Wd5LKx
 tJH57WbtK1H/DOg0SsOAzD2+yvRtrkM46ERMlXkv8PzMo+zGCmYet5S89KHOaShbWwpl
 N8Ag/D6QlPLMkLlkh1xSpYoIppXgf6L0a/ycJcjUCo7DN58Sbl0i4SRvtYS0SnDR34ul
 JIcQ==
X-Gm-Message-State: AO0yUKUpMjD82sQ7JMsNbHO/pJBsYKDevOXXfKjkDTictSvVwi2Qlm7d
 R/EZvfHMsYsP1pHYmc27qNV7ig==
X-Google-Smtp-Source: AK7set+3ftwlTB7ZWg5SYMFGG6EhKPM/Sk13lvXS+a1KvZJbFUZ9sbwkKzYhKRNxVeUzYMHooIJqZQ==
X-Received: by 2002:a4a:4fd0:0:b0:53b:5359:6c1 with SMTP id
 c199-20020a4a4fd0000000b0053b535906c1mr6576629oob.6.1679957448765; 
 Mon, 27 Mar 2023 15:50:48 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 s9-20020a4a9689000000b005255e556399sm11985361ooi.43.2023.03.27.15.50.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 15:50:48 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 17/19] target/riscv: remove cfg.ext_g setup from
 rv64_thead_c906_cpu_init()
Date: Mon, 27 Mar 2023 19:49:32 -0300
Message-Id: <20230327224934.363314-18-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230327224934.363314-1-dbarboza@ventanamicro.com>
References: <20230327224934.363314-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c35;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc35.google.com
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
X-List-Received-Date: Mon, 27 Mar 2023 22:50:51 -0000

This CPU is enabling G via cfg.ext_g and, at the same time, setting
IMAFD in set_misa() and cfg.ext_icsr.

riscv_cpu_validate_set_extensions() is already doing that, so there's no
need for cpu_init() setups to worry about setting G and its extensions.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index fa50aae4a5..07097ca3fd 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -397,11 +397,10 @@ static void rv64_thead_c906_cpu_init(Object *obj)
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


