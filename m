Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ppQTx-0008U7-4y
	for mharc-qemu-riscv@gnu.org; Thu, 20 Apr 2023 05:21:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ppQTw-0008QU-F4
 for qemu-riscv@nongnu.org; Thu, 20 Apr 2023 05:21:36 -0400
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ppQTu-00075J-R1
 for qemu-riscv@nongnu.org; Thu, 20 Apr 2023 05:21:36 -0400
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-187df75c901so230488fac.1
 for <qemu-riscv@nongnu.org>; Thu, 20 Apr 2023 02:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1681982493; x=1684574493;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z2BCmuELRJPh5SQX498hmY8SpGq4Krgaf5b8ZbejSLc=;
 b=Uo2nu2LIEHjEKvUrbFN6Y6C6YYmp6BgjPIdtsFxrDiusfIOwKh6QDpOqArH+s7satK
 AqLJT1NwxOgtEWrir5IBSUlQmvoF3nau/rqEyKQIdFDNq544ZNEIY8zOjAtCXBMexxZz
 /PaHXNl39FsLw79J53rBnCQaasYW2CFZexUCPqCZHUg6xnFQIQ/GblNEC+0ix6UMgjdq
 m3Xc23wAkXYyIq9ay6avKySZBFU0Nw0L8pxj8n09WhBp72VNG1ZigrWIOjuVtGa0rW86
 2vs92z6ha8VhiJD7+95t5Y7G1F+5g4CQA1X1tHM2QEzm/PtxWVUMUqIFZjzYv3MUPVs9
 1fQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681982493; x=1684574493;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z2BCmuELRJPh5SQX498hmY8SpGq4Krgaf5b8ZbejSLc=;
 b=NUZ3PH1Sw0riplY8qJBlcCXosoDe6bThAb6SwMr9VGI37R3PRBCvRWdQfvYbF1r3rJ
 9F3fKRNF8oPsyTP8SJnZEwH96Bml5WsCLny/OJjj7snB6A+5MIZeHKxDDBnzkc8YTScJ
 /iM3GlaLQVFyDmsqGcvKCuK32xZh6WvpxPUajkf7b2ze1smKXaav9Z3D6OnOGKwnMVjE
 ZgLZ9Ct3S7BGEc2Nf3cflHGWsiKoiJa96agG4V+zwRqDwQ0RUBiVOChWvKmROYcbqX93
 SEvihFjBha7J1fht8hJo7tkj7C/bUa7Fn8Tn3FhpIKPX58DRpVFypoyHCbgHeARWKKDb
 0cMg==
X-Gm-Message-State: AAQBX9efMgimVphyEAQF/mRn7ABK93fTHC5qR62ESuCh47Gdvm2THhIw
 Z9P5qYjPRzb8agD+0N1FM2dQFg==
X-Google-Smtp-Source: AKy350aN61rK2S73EeYm+IbsIBvcwjOpdDNpmTg21MdFAGuPcgRM+rT8+eB3M9dmAn++qgJ0vKofNA==
X-Received: by 2002:a05:6870:ec91:b0:17f:84ba:a74d with SMTP id
 eo17-20020a056870ec9100b0017f84baa74dmr699520oab.53.1681982493607; 
 Thu, 20 Apr 2023 02:21:33 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([191.255.108.232])
 by smtp.gmail.com with ESMTPSA id
 t1-20020a056870e74100b0017280f7d653sm529668oak.35.2023.04.20.02.21.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 02:21:33 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH RESEND v7 09/12] target/riscv/cpu.c: validate extensions
 before riscv_timer_init()
Date: Thu, 20 Apr 2023 06:20:57 -0300
Message-Id: <20230420092100.177464-10-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230420092100.177464-1-dbarboza@ventanamicro.com>
References: <20230420092100.177464-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x30.google.com
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
X-List-Received-Date: Thu, 20 Apr 2023 09:21:36 -0000

There is no need to init timers if we're not even sure that our
extensions are valid. Execute riscv_cpu_validate_set_extensions() before
riscv_timer_init().

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 43635144bd..2d7f0ac785 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1257,13 +1257,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-
-#ifndef CONFIG_USER_ONLY
-    if (cpu->cfg.ext_sstc) {
-        riscv_timer_init(cpu);
-    }
-#endif /* CONFIG_USER_ONLY */
-
     riscv_cpu_validate_set_extensions(cpu, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
@@ -1271,6 +1264,10 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     }
 
 #ifndef CONFIG_USER_ONLY
+    if (cpu->cfg.ext_sstc) {
+        riscv_timer_init(cpu);
+    }
+
     if (cpu->cfg.pmu_num) {
         if (!riscv_pmu_init(cpu, cpu->cfg.pmu_num) && cpu->cfg.ext_sscofpmf) {
             cpu->pmu_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
-- 
2.40.0


