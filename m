Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSmEp-000332-Sl
	for mharc-qemu-riscv@gnu.org; Thu, 16 Feb 2023 16:56:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSmEo-00031T-2D
 for qemu-riscv@nongnu.org; Thu, 16 Feb 2023 16:56:22 -0500
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSmEl-0001zC-MI
 for qemu-riscv@nongnu.org; Thu, 16 Feb 2023 16:56:21 -0500
Received: by mail-oi1-x22c.google.com with SMTP id bx13so3083016oib.13
 for <qemu-riscv@nongnu.org>; Thu, 16 Feb 2023 13:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rhjy4ZuFr2J/YQsYfjypiNp1FTwn/nVolIeKKoKX5g0=;
 b=LugphfGor1gmprUSAby7mJAPaibOuGqZG6te5q8kb9VUbENNZ7y/mZzIlgErXKYVB3
 rXI0maowpzY38vuwMLSYcfRMrgGnJ7algLFXIVjYsnt6kxM+GnBX3LFt1NVyuleIYcDt
 tucThstlg1UiYhMtOJgtRYp8tE1VIUT3B3JJYdf7K3CQZPRrFltPFHJmhuetTZ91S5RL
 f8mAxtjDsSTfxorD8LjRzToEf5gd1m8gpg87dV39xVLOj6s8W6SSd91YUfsr73joPVG3
 4YauKpS5LNdvc9/xr1oLiHe/cXPEwzF7GHNWjT0oERrJO+SiR9inBk+PDwi8kN1fsBBL
 eHhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Rhjy4ZuFr2J/YQsYfjypiNp1FTwn/nVolIeKKoKX5g0=;
 b=dTORfvnZJqjBn8rgkXQ7VDlx40axBOmr62CBroApYPS0gGT2AmDVDQ8OpQVEhntLH4
 PnmhYuX70WTMpK1gnndBVOKlJs4NSJN01LKOpy7rUgn6qS0bfa8K7648iRFTRZW/2Ho7
 j/fFYwxOHdoy3pzmCBolwv9LOdfdB9TQnuGjB+mbgqB3mjjynv46S9d05kie6kzC4RAv
 jWsPM/U4VzuGxu9cILJ+aLpzFdjdt81A76DVERASuCVfh+0qN2Sc2UJxV65tMzTDNADA
 g/t+iXL5wifsxbTYcmJVwnwgtD+JNEi4asuXdo3LD0sDe9hlXRhuuB0h0BBvldDRMUUI
 0M+w==
X-Gm-Message-State: AO0yUKW7RkCm4enPwrBIeyNmpWS1XhG6xRRgnAlmBCGpi25y7PkOqPa5
 EwVUbz7ZQS0rlE2TPGGOlLJcOw==
X-Google-Smtp-Source: AK7set+0Hnum3qfi+p5MUU+xhgmardYCuI6QJD5j1j1IUf2xEor0XxwF4CfdT3mJMZczDKfETZGlbw==
X-Received: by 2002:a54:4784:0:b0:378:3340:d31c with SMTP id
 o4-20020a544784000000b003783340d31cmr2802931oic.33.1676584578566; 
 Thu, 16 Feb 2023 13:56:18 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 i132-20020acaea8a000000b0037d7f4d0890sm1047570oih.26.2023.02.16.13.56.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 13:56:18 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 richard.henderson@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v6 7/9] hw/riscv/virt.c: do not use RISCV_FEATURE_MMU in
 create_fdt_socket_cpus()
Date: Thu, 16 Feb 2023 18:55:48 -0300
Message-Id: <20230216215550.1011637-8-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230216215550.1011637-1-dbarboza@ventanamicro.com>
References: <20230216215550.1011637-1-dbarboza@ventanamicro.com>
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
X-List-Received-Date: Thu, 16 Feb 2023 21:56:22 -0000

Read cpu_ptr->cfg.mmu directly. As a bonus, use cpu_ptr in
riscv_isa_string().

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 hw/riscv/virt.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 86c4adc0c9..49f2c157f7 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -232,20 +232,21 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
     bool is_32_bit = riscv_is_32bit(&s->soc[0]);
 
     for (cpu = s->soc[socket].num_harts - 1; cpu >= 0; cpu--) {
+        RISCVCPU *cpu_ptr = &s->soc[socket].harts[cpu];
+
         cpu_phandle = (*phandle)++;
 
         cpu_name = g_strdup_printf("/cpus/cpu@%d",
             s->soc[socket].hartid_base + cpu);
         qemu_fdt_add_subnode(ms->fdt, cpu_name);
-        if (riscv_feature(&s->soc[socket].harts[cpu].env,
-                          RISCV_FEATURE_MMU)) {
+        if (cpu_ptr->cfg.mmu) {
             qemu_fdt_setprop_string(ms->fdt, cpu_name, "mmu-type",
                                     (is_32_bit) ? "riscv,sv32" : "riscv,sv48");
         } else {
             qemu_fdt_setprop_string(ms->fdt, cpu_name, "mmu-type",
                                     "riscv,none");
         }
-        name = riscv_isa_string(&s->soc[socket].harts[cpu]);
+        name = riscv_isa_string(cpu_ptr);
         qemu_fdt_setprop_string(ms->fdt, cpu_name, "riscv,isa", name);
         g_free(name);
         qemu_fdt_setprop_string(ms->fdt, cpu_name, "compatible", "riscv");
-- 
2.39.1


