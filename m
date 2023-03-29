Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1phc6r-0006Pz-8U
	for mharc-qemu-riscv@gnu.org; Wed, 29 Mar 2023 16:09:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phc6p-0006Pi-Oe
 for qemu-riscv@nongnu.org; Wed, 29 Mar 2023 16:09:27 -0400
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phc6o-0007nO-6f
 for qemu-riscv@nongnu.org; Wed, 29 Mar 2023 16:09:27 -0400
Received: by mail-oi1-x235.google.com with SMTP id bj20so12552738oib.3
 for <qemu-riscv@nongnu.org>; Wed, 29 Mar 2023 13:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1680120565;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qgoVXA/5VPqReZ8KfSmo3riuz4iRQirpLO1IVT3EBlc=;
 b=lxpeXRzz+aqeoYhZTaAXBag14K239gBHz4N3G6EW+ORxGvKJXGVrMXM74+aE9TNzUD
 wqIihrhOHnJJFPz71fLeXulaDn0TTQf62fF3Dl1u6J0YwCHwwwCOeMkhCpFBpC3e/N3p
 hhxg56ysALL3pEcx8+jI0gSOavb4pmFqO0MMhBgnpgooVTSc2RJJw5jsjhLKvdw4zDUz
 n6cybsEOkCZWvczMUJ8nsTK8rhY9i7ff8BNqtagv9903mHQnn7vsS4sG7zg+2FEsX5AP
 IfvnzYIwOhTXDoQaUzkHOLrTgu9VwlYG4DsgZ/vTb2btR21Ux5stCecATGXox2up6ndF
 9GAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680120565;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qgoVXA/5VPqReZ8KfSmo3riuz4iRQirpLO1IVT3EBlc=;
 b=FA9dQtQQ96oSdmb8fMvbSPF3TP7P3pdseXNi5MAwXmmKX09FaCZcctb5juOuuut/Km
 LIE8u5cFkDvnPaXgeMCiGR8U3nV6aQBvNRuKkgrulFcYygIOBDxjodna4b997X1sGxAC
 NnQq3WpneiFX5Imn+WboLjwUZ6K2oS/NECp18v0O9iNhlzoKSYx8vCOw+2WwtpiIkmLI
 bioW4NKL2dTtARR6OlUW0G21/scUJCtJkTgKeoktayorccYeNsASd/td5rY7I9LRrc6u
 XDZLP12CoAFNELimzAfQO2wgpfJyTKfEJuvzUtUzHelKefcwSa3vcIUnDEFcZGfePZx3
 Nq2w==
X-Gm-Message-State: AO0yUKXZgEoeTH7KPnMU1bteUyQs1WoFiXJhqhFWKxFllP+JyhCKNpVF
 FDIfcuIKhHsAxk65l9FhDfp0Ag==
X-Google-Smtp-Source: AK7set9iFJoaLI+wB/2r9PvD10PoX7XeL0diRcyehNXT8fAEKRI0yDP9BUx9zW8Gy5OJzIQEOg9kRg==
X-Received: by 2002:a54:4f16:0:b0:386:cc99:b9f8 with SMTP id
 e22-20020a544f16000000b00386cc99b9f8mr10329732oiy.44.1680120565621; 
 Wed, 29 Mar 2023 13:09:25 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 i206-20020acaead7000000b003874e6dfeefsm8195182oih.37.2023.03.29.13.09.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 13:09:25 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v6 7/9] target/riscv/cpu.c: validate extensions before
 riscv_timer_init()
Date: Wed, 29 Mar 2023 17:08:54 -0300
Message-Id: <20230329200856.658733-8-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230329200856.658733-1-dbarboza@ventanamicro.com>
References: <20230329200856.658733-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x235.google.com
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
X-List-Received-Date: Wed, 29 Mar 2023 20:09:27 -0000

There is no need to init timers if we're not even sure that our
extensions are valid. Execute riscv_cpu_validate_set_extensions() before
riscv_timer_init().

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
---
 target/riscv/cpu.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index e8045840bd..331272c8a0 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1196,13 +1196,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
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
@@ -1210,6 +1203,10 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
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
2.39.2


