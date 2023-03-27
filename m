Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pgmCW-0000mC-KP
	for mharc-qemu-riscv@gnu.org; Mon, 27 Mar 2023 08:43:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgmCR-0000ZN-3B
 for qemu-riscv@nongnu.org; Mon, 27 Mar 2023 08:43:48 -0400
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgmCP-0002tz-FZ
 for qemu-riscv@nongnu.org; Mon, 27 Mar 2023 08:43:46 -0400
Received: by mail-oi1-x22f.google.com with SMTP id b19so6211626oib.7
 for <qemu-riscv@nongnu.org>; Mon, 27 Mar 2023 05:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679921024;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ynbViB4clOt5B5SrVJqlPDKEgBdFVdkLq8E38RQB1tA=;
 b=J8NrbPVOW3qHk2oUxVoGvj0RAFfV29rt1ABASllRE3GvSgFNDHV8aNuGcPxf9UO603
 iffpA54xSj8bXx2xVy2b/Bpt1cRa0LdVW5h7TCJ8AiW2qWdth6i0v/zDv4mS7DkSh4wV
 xQqrkGQKbpM5CJjw7TVVkS3RNcOeIgDTO9c7NSelYO17YXqt0wYhGA0Z5572TO3UHlee
 vgiBu1SwPjD/McZeRcVygfJnit9AK0BSnnYxb5xYTOPIvW3h/Hg1kbUYxqS7rktKWlEv
 VWBaRM3uNJ50jr7R//VEU7EuaRb7xWNSOL11hs95aD7+yPuUvJul59dZNEWrA/Alvqaw
 Erlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679921024;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ynbViB4clOt5B5SrVJqlPDKEgBdFVdkLq8E38RQB1tA=;
 b=e/G1I96h9vwucCsKYqSE0cOafhWuMSW8ik2f9PR9qzBhvJWwcQzTEQlZkeOVJrB74f
 TGKWCfJumLK+NVvy/b+S5mkb/knKsK7tJTFFExPm2tExNGJs2/5pa2DFn2iSa3yliR1l
 DeDEKL+htnWORccAc6/JzTXGp01RLXiMRgWyKtPxAuZ3Zf4C+b5FORMCrqrCpWua+iDh
 K1OHpZttPg30ymCu4KH3mZMP4xVDSCFoZKhDEW8dnQIavqun4sZTUr5YXzgtvz//kB47
 RiZNQzHp1souUpezMGAtCAtmINFaElDCx6FguHnl23upbKp6qQFZ5UZm1/GJpeVBS8wl
 XYlA==
X-Gm-Message-State: AAQBX9eOsa7qTvU08bKylo6iRAU95Ajs1AMaS7EeOrMJqc1zKAyqRYJC
 8YEbXjtX4hR8eW4JuUFovH80FQ==
X-Google-Smtp-Source: AKy350agHaXZ2N3C7jws744uDzQuv1mz+pYVXVyu455sJe/0JU28aA1EP7ogMUpLZnwD54vEI/Z78w==
X-Received: by 2002:aca:190b:0:b0:389:3512:2a45 with SMTP id
 l11-20020aca190b000000b0038935122a45mr873186oii.10.1679921024697; 
 Mon, 27 Mar 2023 05:43:44 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 m206-20020acabcd7000000b0037d7f4eb7e8sm11136677oif.31.2023.03.27.05.43.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 05:43:44 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 17/19] target/riscv: remove cfg.ext_g setup from
 rv64_thead_c906_cpu_init()
Date: Mon, 27 Mar 2023 09:42:45 -0300
Message-Id: <20230327124247.106595-18-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230327124247.106595-1-dbarboza@ventanamicro.com>
References: <20230327124247.106595-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22f.google.com
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
X-List-Received-Date: Mon, 27 Mar 2023 12:43:48 -0000

This CPU is enabling G via cfg.ext_g and, at the same time, setting
IMAFD in set_misa() and cfg.ext_icsr.

riscv_cpu_validate_set_extensions() is already doing that, so there's no
need for cpu_init() setups to worry about setting G and its extensions.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 81c8e0d541..3078d1a097 100644
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


