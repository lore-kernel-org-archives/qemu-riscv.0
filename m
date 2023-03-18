Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pdcnL-0004ym-KA
	for mharc-qemu-riscv@gnu.org; Sat, 18 Mar 2023 16:04:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pdcnK-0004yU-RY
 for qemu-riscv@nongnu.org; Sat, 18 Mar 2023 16:04:50 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pdcnJ-0006r0-5h
 for qemu-riscv@nongnu.org; Sat, 18 Mar 2023 16:04:50 -0400
Received: by mail-oi1-x22a.google.com with SMTP id bd36so6188395oib.12
 for <qemu-riscv@nongnu.org>; Sat, 18 Mar 2023 13:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679169888;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EV5OEE/WdNMUI185IdCQ9kgxw43fPzMUW63mdVe54zA=;
 b=IpmDUIfCCC2iFnO1uyChREBXD1lfSzcWxEoW23yc1Qn09RCmbPKRdxvlYHGK7TD8pZ
 oSgg60d31f8zGya3I96fGsmBIdB1Vw1oYK28H4NniJTRHFHVrybraRk1tyY2OaMmCFC7
 CRx+5cOfL0lQsNWsWynryDVWOH+tmrT6b98uMHD0lmf2d9BZBHibUl4ISK9NvdqvMSBj
 aOg84xjnOnletG3fQryJaQvhEAo3P7wLBse+w6YcDbAOihDevMJo0LwN7AV6LwPDut6x
 fGtbe8RRQzj+HNLjYARAK7/Lf26xQgtaVB50oP4/iiU5/fKHXukZbvIBz9lDtnl9XgAS
 QzzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679169888;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EV5OEE/WdNMUI185IdCQ9kgxw43fPzMUW63mdVe54zA=;
 b=c+/pUEgSUQ22C3nCiQalM20dOncGOVeiERMH0wLIHkNvKPtUZP7E9O45K1U+hHA65h
 Ny1Bx2vKnODc8TX4mRQKhRHNdceszuriVOU7lxuLFcDZ8K9TYW0vmiI4sjXSuO3je7LM
 X5HB0Em1TubKs94pRwJ6OmombunKNaRGcnV1Yw9eeExDjW26RU06eiAesuHJvQkRM4+p
 Eu/K7XNGIZmH8S5hRAqXEE4WWX2n0S34S0hQdwFDAf7Ui2GMTAxnItY/pQm2ByuWl6Yr
 J+Qw/iJaHDrxH0Le+B+arxJ+3QBJTJ78dR2TaM8IoaFKKbsxOsyMQYauPlzTKnb0svZq
 O03A==
X-Gm-Message-State: AO0yUKUEy26otkqSvYpbI8XjxJkMHQM5pfz6q+U15SBWss5nJ4GM1PVu
 iMWLSkHwVr+O3zwwF2QQE+kQlw==
X-Google-Smtp-Source: AK7set+xbJlhLjLE3Xpcg+tJbY/gKyy/PGNW2E2jQvFD+iQfV3FJZcg7VpTIZ8RQUvP4Uz5Sjin2nw==
X-Received: by 2002:a05:6808:1912:b0:386:c5ad:16ab with SMTP id
 bf18-20020a056808191200b00386c5ad16abmr5793344oib.10.1679169888057; 
 Sat, 18 Mar 2023 13:04:48 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 f69-20020a4a5848000000b004a3d98b2ccdsm2122219oob.42.2023.03.18.13.04.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Mar 2023 13:04:47 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v3 02/26] target/riscv/cpu.c: remove set_vext_version()
Date: Sat, 18 Mar 2023 17:04:12 -0300
Message-Id: <20230318200436.299464-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318200436.299464-1-dbarboza@ventanamicro.com>
References: <20230318200436.299464-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22a.google.com
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
X-List-Received-Date: Sat, 18 Mar 2023 20:04:51 -0000

This setter is doing nothing else but setting env->vext_ver. Assign the
value directly.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 18591aa53a..2752efe1eb 100644
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
@@ -839,7 +834,7 @@ static void riscv_cpu_validate_v(CPURISCVState *env, RISCVCPUConfig *cfg,
         qemu_log("vector version is not specified, "
                  "use the default value v1.0\n");
     }
-    set_vext_version(env, vext_version);
+    env->vext_ver = vext_version;
 }
 
 /*
-- 
2.39.2


