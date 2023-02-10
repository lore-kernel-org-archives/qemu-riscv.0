Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pQSfy-00033h-Du
	for mharc-qemu-riscv@gnu.org; Fri, 10 Feb 2023 07:38:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pQSfu-000330-Ax
 for qemu-riscv@nongnu.org; Fri, 10 Feb 2023 07:38:46 -0500
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pQSfr-0003pv-E4
 for qemu-riscv@nongnu.org; Fri, 10 Feb 2023 07:38:45 -0500
Received: by mail-oi1-x22c.google.com with SMTP id bj22so4286177oib.11
 for <qemu-riscv@nongnu.org>; Fri, 10 Feb 2023 04:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eqDEVzEJSAV8K2Jys7ja335ZZIehAyBdNW6Zbc2eCcA=;
 b=aKNlho6esE/EfTvMyLi6EzNDr/vFhQfrB89oEuW3BsEVFDYwGwvs4e71x7oC8JyvsY
 0MmPE9M4/hDEgo4T9zMGxoVSuXO+2BiHAbcuoVPIIV/efpo0+pRFS2KJ4G0G2tVHyT8p
 X0hXVWERTaV+oalS+mQLifpn165W0oo6RxbIsGq0ysQZVycCzSq+fVy+vQvzZEIrTj1U
 Nl0qsglIscBGU2buezeWcUy83A3XcM7dX62aqqElGTy7Psp3Awr67tWEtyi6HIRRzBua
 JhtIR1mTlgIHoi2WJPttgLYBefHo4+ost8irTjLCdc+frpOq6R8QMXjA2T9VS9yrwDUZ
 4SuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eqDEVzEJSAV8K2Jys7ja335ZZIehAyBdNW6Zbc2eCcA=;
 b=i1YhxeGIMTPtPRh+8cj14MSn+EoS86uX0X9oFb7dl+ybBvPI7p6xUHs6TJl1uYVl37
 TVR7J32AJnrPQPD94U+0GWz4H2bX4vDj+hGreMn/DreFiaONn2Pf5+ALI1Ko0YUuXa+p
 KN3YhntCYdcgLMbpkVqFaZ4vvQlpFmidEZ/yLFz3q66ft48s7FZnpQhHzCHOJlwEUf2/
 mukTtmGkVGBMZXKpadpoSOL2R925CC17RzsIu/TQsM4h1n3LwjfYSFXmT/KW5Z8jM81p
 NRPUHWWyElGxdhx05C/p1HQ5JTHaQO/kBzKypNgBGePZ3Dw+ievsCql3H2kkx5saBxgT
 wH9Q==
X-Gm-Message-State: AO0yUKUqLkNy86o3zTV1O/Bu2m1y1IrAveZK+r8GitBQiJeA6rDZ6mU2
 bHFbr7CSZmyZOol7LYrTRK48Cw==
X-Google-Smtp-Source: AK7set9gtlyP5LzqeSuaP5cFOuF517Tuga4WcxlTp7Kxdil6151WAbl3l9i2optEOSAulHgctyyJ8g==
X-Received: by 2002:a05:6808:aae:b0:35b:abe2:b46b with SMTP id
 r14-20020a0568080aae00b0035babe2b46bmr6808814oij.23.1676032721175; 
 Fri, 10 Feb 2023 04:38:41 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.19.125.138])
 by smtp.gmail.com with ESMTPSA id
 l9-20020a9d7a89000000b0068d4dda3d61sm1913613otn.39.2023.02.10.04.38.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 04:38:40 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH] target/riscv: avoid env_archcpu() in cpu_get_tb_cpu_state()
Date: Fri, 10 Feb 2023 09:38:36 -0300
Message-Id: <20230210123836.506286-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22c.google.com
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
X-List-Received-Date: Fri, 10 Feb 2023 12:38:46 -0000

We have a RISCVCPU *cpu pointer available at the start of the function.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index ad8d82662c..3a9472a2ff 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -60,7 +60,7 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
          * which is not supported by GVEC. So we set vl_eq_vlmax flag to true
          * only when maxsz >= 8 bytes.
          */
-        uint32_t vlmax = vext_get_vlmax(env_archcpu(env), env->vtype);
+        uint32_t vlmax = vext_get_vlmax(cpu, env->vtype);
         uint32_t sew = FIELD_EX64(env->vtype, VTYPE, VSEW);
         uint32_t maxsz = vlmax << sew;
         bool vl_eq_vlmax = (env->vstart == 0) && (vlmax == env->vl) &&
-- 
2.39.1


