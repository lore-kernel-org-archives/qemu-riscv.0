Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSh1A-0000Il-5D
	for mharc-qemu-riscv@gnu.org; Thu, 16 Feb 2023 11:21:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSh19-0000Hz-BX
 for qemu-riscv@nongnu.org; Thu, 16 Feb 2023 11:21:55 -0500
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSh17-0006Fn-TR
 for qemu-riscv@nongnu.org; Thu, 16 Feb 2023 11:21:55 -0500
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-169ba826189so3134418fac.2
 for <qemu-riscv@nongnu.org>; Thu, 16 Feb 2023 08:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rhjy4ZuFr2J/YQsYfjypiNp1FTwn/nVolIeKKoKX5g0=;
 b=Kmte0E+9ApE8Wn332aVwwNuwasIxgXK7+jDc+RYVqkYf2IvZsNitnonkkZfR4g2wgo
 LmVFgEwvM4GXrKgrbAlBcIqhmAmIPma/FWnwoc9HfDbUdJTpTcfb3BuzNMbbfFcds+E/
 MsKSvGiGXAOMLDK3Mr4AFaytN5YlqWUcZJfcygHmOunHlreVQpFmcfWTpk0k1VH1kKnA
 Np++2oDcAfzEbszcZNu9MlX4I1X/PWN3FvDQIG2ORFmi6zTPzVUigAWFJPtgy1EFKBAk
 8ItOUrLnxImyakeciO9msfA+LBaH+P3+Y3XrOt2EHgvPPdtCVkunCk0XrWcvdysnLn6U
 tRug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Rhjy4ZuFr2J/YQsYfjypiNp1FTwn/nVolIeKKoKX5g0=;
 b=gRGeFrYoWcmqytxnXlhgbHclBZ7ayA3xvVuIqBugoaU2Gplg7PvUXe4Lf3/SCWcL5Y
 hLUM2iWjQji092J2x0eUjyYfJgOFuNS5nnWh1pusalHqgwRVu4PkvgwBtaG3eXbVkIum
 8M7yxtLL2lTYokN+uNAOhLpSOmEcFblw3KmJJUAQXXbfq/hT7iR4z0TkINfQoupqkAiN
 Cj9Wb7UcwgSFkefLH+7NlfQ3KxrSDyx2OyvId4/MlCmoN72rjF1YM684ChTpT/OZirlH
 QosGUuf5BI96xS0olM9U1XQJ1ueRpYvqVGf3B1MRaMJ8/+YNZFO/ILQlQjKl/NrNw2Xm
 W4DQ==
X-Gm-Message-State: AO0yUKWnJI4zWTeHp6fmnPzTjXKOo9weSK78T/bLlFTWsMreMKN75n8X
 DPAVcv8jI1tvsO0CCdZqLthjOw==
X-Google-Smtp-Source: AK7set9JGiMpZ3H1fnNL34cZAPPjKHzgqQFJl70ZXvpOV3qU7JvwsWTzbXdNZnDpCzcuZUI/b6g0WA==
X-Received: by 2002:a05:6870:41c3:b0:16e:800:9e05 with SMTP id
 z3-20020a05687041c300b0016e08009e05mr1478941oac.12.1676564512898; 
 Thu, 16 Feb 2023 08:21:52 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 z17-20020a056870e15100b001600797d1b5sm693029oaa.41.2023.02.16.08.21.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 08:21:52 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v5 7/9] hw/riscv/virt.c: do not use RISCV_FEATURE_MMU in
 create_fdt_socket_cpus()
Date: Thu, 16 Feb 2023 13:21:24 -0300
Message-Id: <20230216162126.809482-8-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230216162126.809482-1-dbarboza@ventanamicro.com>
References: <20230216162126.809482-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2e.google.com
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
X-List-Received-Date: Thu, 16 Feb 2023 16:21:55 -0000

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


