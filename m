Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kIF2f-0001mb-SS
	for mharc-qemu-riscv@gnu.org; Tue, 15 Sep 2020 13:46:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kIF2a-0001eD-35
 for qemu-riscv@nongnu.org; Tue, 15 Sep 2020 13:46:52 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:34297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kIF2R-0007Ft-DI
 for qemu-riscv@nongnu.org; Tue, 15 Sep 2020 13:46:51 -0400
Received: by mail-pf1-x444.google.com with SMTP id v196so2399714pfc.1
 for <qemu-riscv@nongnu.org>; Tue, 15 Sep 2020 10:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dqbg1+YUD56oz0mEVRHEVZEpbEBWoWejpoX6YFZKEQU=;
 b=wIMVXKQ7A9wqMV6ahF3x93b67teFXTMtRtMBgKFJlMtmwUbP0oEe3XInieb3KuYQOG
 KiyAECgOBhhGh7lAmlBzF9JA5F2+IcEz84xSlAh78slltADr9TJS8wQ4+Mb51fSZ0fF1
 OMINPJCzzzJwcHshlmNwReuj4YtxvFSIV0gWOJ2NM3OsWbc/L0Dvy4hN90ohEvJzokBO
 LjH/0YIMQ/q3+yir565kq1rzenX9UoEYl6c1XsGUpkuTBKTvtLCIOFP6ROTC5Be4gCNn
 t1gu72yQqYlI7hg+aznPw4jeectTZnlwy+2oIwhTeh6tLoSCMTUQCrCAL7D5ua+H5itn
 UthQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dqbg1+YUD56oz0mEVRHEVZEpbEBWoWejpoX6YFZKEQU=;
 b=GcU+jfZe63vjTnHAV1FUgFEicOGeaUZJwue+MSpVd/t8kg9RuYhbIHayy4wjMZmkr8
 YGKmnI7BoBYj+6qqGbq+ckrvZ8tskDW+D/0K8LCXIYVdxrOJzJQ3F0Y4fhBzXjQob5Su
 jIaHL6P4/2WYYaRDLpqxxev6wJC9laq3KHUx4VpDODJGX7emBbf1I8788UQkkdxlfuzQ
 nfGIji8rvMtQdZ76JXn97CtR2S0e/Fw0XOLl6PdGYongsT9KHpXo+yWUeMzDWwkHm4PG
 IxLe7In2UUrT2YlK4rca1c50+72OlKbPKx4Yj+t+zKfz8JwRKU0MpLpDmGuSTHbIX7JQ
 cULw==
X-Gm-Message-State: AOAM530HxJGFHlyDhYpz4Pui1Gxvxjk+d+svPUiWdyUz90bn0iZQBi9e
 DxJjGfzH/hhsQbY0KvK0FExexw==
X-Google-Smtp-Source: ABdhPJzeP40a2R73hVlHspFFH3oT/sMTNQWEuJ4nQfNH1+17WZu5COItofZZYVlIQKycfXM1e7MZYg==
X-Received: by 2002:a65:624d:: with SMTP id q13mr10219029pgv.237.1600192001890; 
 Tue, 15 Sep 2020 10:46:41 -0700 (PDT)
Received: from localhost.localdomain ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id cf7sm147896pjb.52.2020.09.15.10.46.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 10:46:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
	qemu-riscv@nongnu.org
Subject: [PATCH 4/5] target/riscv: Set instance_align on RISCVCPU TypeInfo
Date: Tue, 15 Sep 2020 10:46:34 -0700
Message-Id: <20200915174635.2333553-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200915174635.2333553-1-richard.henderson@linaro.org>
References: <20200915174635.2333553-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Sep 2020 17:46:52 -0000

Fix alignment of CPURISCVState.vreg.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
Cc: Alistair Francis <Alistair.Francis@wdc.com>
Cc: qemu-riscv@nongnu.org
---
 target/riscv/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 57c006df5d..0bbfd7f457 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -628,6 +628,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
         .name = TYPE_RISCV_CPU,
         .parent = TYPE_CPU,
         .instance_size = sizeof(RISCVCPU),
+        .instance_align = __alignof__(RISCVCPU),
         .instance_init = riscv_cpu_init,
         .abstract = true,
         .class_size = sizeof(RISCVCPUClass),
-- 
2.25.1


