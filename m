Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1phc6b-0006Ks-FU
	for mharc-qemu-riscv@gnu.org; Wed, 29 Mar 2023 16:09:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phc6a-0006K4-7i
 for qemu-riscv@nongnu.org; Wed, 29 Mar 2023 16:09:12 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phc6Y-0007nQ-MP
 for qemu-riscv@nongnu.org; Wed, 29 Mar 2023 16:09:11 -0400
Received: by mail-oi1-x236.google.com with SMTP id b19so12543223oib.7
 for <qemu-riscv@nongnu.org>; Wed, 29 Mar 2023 13:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1680120550;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a7raJYv508hDPYTX7Dx1KX4h6DtiCuFfCm123h7f7NA=;
 b=FulcEYrhXfxpHqHRYyNB0hoaZ8b98GPltA1TBOYeSNXG4QOVqUZxqCu9cJ5OPNdKoS
 9ecizmzdRHwJaw3EXbxxBAaVGO3Qt1KEx5xvbG2yN8L+vvuaUK72lr0PmM3eaNX0Dvgk
 lvEwg6ukrBadadmxIlBGR6HaMV8+JhL3RroMfnt6qvc0JamclxOeRZ0am06NdnsyIjsX
 DE+biJsW4cbMYFCdDzfwlxh+9wGTG4fE8/cloQpRSg3GIeAmcJXRt/j/u0xUOttbclBS
 CTjPPja+Y1pZmIsvrazbiDE6OtKuW2aufFKNZwztDipEPvA+sCizkb7eRUcyj8ZTjjZc
 7qVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680120550;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a7raJYv508hDPYTX7Dx1KX4h6DtiCuFfCm123h7f7NA=;
 b=SxYxqCIYiSeD9rlQqMTdQEFJKSEo7fwH1EXPpj+0b559rc/R/76Y/6fsPt6BJtIiMs
 0rripIPjanqnuQkjih1rbKFaiyZRkF53tmQ2JYfSIIrNW7YDToaC5XUz8DYMfmAPWs7j
 Wq7KqH85cvDpCyMV232+jbMaJ8tC10o6RDx034PdTnHmy0QCQ5RDmm6lEbNQf/SemXpT
 jY9gvk8dlnhH+IB0nFmOufWvWqBpjcZJ+BuKA9GLKq5uXxtQeXY7oqGafJ2nlMiQfOxz
 UPZ2NX/Qxgfle2qG2p0jah0+VXgNOkLRY2uoMu4RB5x4J+e8xiCPK5vLcjoJId+jIjHG
 WKoA==
X-Gm-Message-State: AO0yUKW3jh4z3MERqoGtV6u+2+v1WZhQTvTLUXzVlwIr1t5vlXcF2jU1
 K//UiGGze37Cph72q2/3ApX9Pw==
X-Google-Smtp-Source: AK7set+/EbM9rqjga0p64CFqW+aWOnWYIh72ttbLEHHYbf70cOil7xSZloT+lqcOHnt+TokI44lAoQ==
X-Received: by 2002:a05:6808:18a0:b0:387:205b:70c7 with SMTP id
 bi32-20020a05680818a000b00387205b70c7mr12484869oib.13.1680120550071; 
 Wed, 29 Mar 2023 13:09:10 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 i206-20020acaead7000000b003874e6dfeefsm8195182oih.37.2023.03.29.13.09.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 13:09:09 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v6 2/9] target/riscv/cpu.c: remove set_vext_version()
Date: Wed, 29 Mar 2023 17:08:49 -0300
Message-Id: <20230329200856.658733-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230329200856.658733-1-dbarboza@ventanamicro.com>
References: <20230329200856.658733-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x236.google.com
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
X-List-Received-Date: Wed, 29 Mar 2023 20:09:12 -0000

This setter is doing nothing else but setting env->vext_ver. Assign the
value directly.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
---
 target/riscv/cpu.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 610e55cb04..19e0a6a902 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -245,11 +245,6 @@ static void set_priv_version(CPURISCVState *env, int priv_ver)
     env->priv_ver = priv_ver;
 }
 
-static void set_vext_version(CPURISCVState *env, int vext_ver)
-{
-    env->vext_ver = vext_ver;
-}
-
 #ifndef CONFIG_USER_ONLY
 static uint8_t satp_mode_from_str(const char *satp_mode_str)
 {
@@ -827,7 +822,7 @@ static void riscv_cpu_validate_v(CPURISCVState *env, RISCVCPUConfig *cfg,
         qemu_log("vector version is not specified, "
                  "use the default value v1.0\n");
     }
-    set_vext_version(env, vext_version);
+    env->vext_ver = vext_version;
 }
 
 /*
-- 
2.39.2


