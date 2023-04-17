Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1poPQ7-0006ax-S4
	for mharc-qemu-riscv@gnu.org; Mon, 17 Apr 2023 10:01:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1poPPo-0005P7-7O
 for qemu-riscv@nongnu.org; Mon, 17 Apr 2023 10:01:08 -0400
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1poPPY-0003HL-Jd
 for qemu-riscv@nongnu.org; Mon, 17 Apr 2023 10:01:07 -0400
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-187dc84637aso4886451fac.2
 for <qemu-riscv@nongnu.org>; Mon, 17 Apr 2023 07:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1681740051; x=1684332051;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mA9TaJor3VOov64Jl6vxePW5HOjf4tVu/fsDcc2X43Y=;
 b=U40/VaMv/8KJ8YuCSZCiVMpgOk8/WnEGxPPnD5RAAVYCem2Yu76MG+1w1/HM3CPsu7
 uBjxB+iabNRqbLNGzngmx9zi/XlJFU71eusdxIdlmDiYjTpqa97oCRQzr/4uCyYEaYS3
 SwCxKV10Iqtfuz+ss7HL0igNdm21JGw3aLtJSkZZyHkcY2AmmuUJzc/dNRIpLQ0obdoE
 BO8T93nID+mSMc5A15g+dT5gDGGyB2M3+KfNPAmmkBdhD6IxA2niKePtuMZrqgjG+9dP
 UXLlFtIm2HImmc7H4jOzLyWE/lnjxsDrxrB8tpJMWJaQtxZ4OOBn7XqdTnXkFSqHKy0S
 s8BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681740051; x=1684332051;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mA9TaJor3VOov64Jl6vxePW5HOjf4tVu/fsDcc2X43Y=;
 b=GjtKOIYz0LbgHjHG1Jzepccq4l32sxedKii+zGhlI38TQF2+mdg9K35lzG5O46JmZM
 WiNzXMXafwP3EQ9PooG5dwbJSsrUzOYbWhPyX5kYVPYbeZ/srEvGl+JjCnrxK2JfXbJM
 GaTJaMm7BM+bdNmFQkkVZHqw9ZryyueS5kNnncc+aXSO6xKJT5rj3l4lN7YA5/amfaXS
 6l2WR4LG6H/FbdT06cHXRWJzgdm0lpcfp4bJ0z+crHsujXzYiQEGrrV7wLDX4gbhmtqw
 1LklHCCGMsAgoWAO4B1pSTHHBFOihyXqEq/yMLXQuEiFrV+bc1/soNNb/mwHueLGmrdF
 KZYQ==
X-Gm-Message-State: AAQBX9fQ4w2Uj9yGVkWqTu5Kn3FkjfqLbmbTRCCDFcfXbBS5LGUggoi7
 sOheSGYth3zIfS4BbbBzdHKPe5Vt5gryvsYMUMM=
X-Google-Smtp-Source: AKy350ZrLo/Zg/BsDLiVrpjG3+CJ+aLAMQvzYKS19lBRho+4Qn0/ttcGqFijH8ehZ9uNflL5PZswnQ==
X-Received: by 2002:a05:6870:4694:b0:184:266a:1700 with SMTP id
 a20-20020a056870469400b00184266a1700mr9423605oap.47.1681740051469; 
 Mon, 17 Apr 2023 07:00:51 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([191.255.108.232])
 by smtp.gmail.com with ESMTPSA id
 x16-20020a05687031d000b001726cfeea97sm4531868oac.29.2023.04.17.07.00.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 07:00:51 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v7 09/12] target/riscv/cpu.c: validate extensions before
 riscv_timer_init()
Date: Mon, 17 Apr 2023 11:00:10 -0300
Message-Id: <20230417140013.58893-10-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230417140013.58893-1-dbarboza@ventanamicro.com>
References: <20230417140013.58893-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x36.google.com
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
X-List-Received-Date: Mon, 17 Apr 2023 14:01:10 -0000

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
2.39.2


