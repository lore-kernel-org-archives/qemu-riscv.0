Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pUuER-0007Jv-3f
	for mharc-qemu-riscv@gnu.org; Wed, 22 Feb 2023 13:52:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pUuEQ-0007Je-8Y
 for qemu-riscv@nongnu.org; Wed, 22 Feb 2023 13:52:46 -0500
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pUuEO-0004OT-R6
 for qemu-riscv@nongnu.org; Wed, 22 Feb 2023 13:52:46 -0500
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-1720600a5f0so11164815fac.11
 for <qemu-riscv@nongnu.org>; Wed, 22 Feb 2023 10:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TEaF74M6WvRmSzL9d+AXXQnqIGKGvCuao150I2D5AIs=;
 b=ZDMKsiAAvihgzqCIvfpEUHWilzLu+NXOtDeutimPOOuoQNAJbpyudz0GWjR5291RxY
 Uqt3GPWoyayhWxuVx+nq8TNkhrcYzkt+A8rj1WD68sJvWjmcMjSB/EhqVV1OpczDXVNk
 0wdMQGgPOl8x4Ag2jQQKpEU7C9LlSmrEDgLwVa/MTmjwT6fTIZqimDlb3bEDeSn5ityh
 waA0ZQvNRNsqpfqZCloTeHYozIafiWvF2kUy3Y2N6DT0caBI+n7zen5q8bkWwUO2FA1U
 wU0eK7o3OJlmQVhnr8GZCcj0AIxvr7ITIMoQnxz5xLDsIhKPzRB1CrnuRmeuAD2GMOQO
 MJ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TEaF74M6WvRmSzL9d+AXXQnqIGKGvCuao150I2D5AIs=;
 b=xQ8XPRwYCjlSyaRbSOg1asZv+p8gHhU7MYzdIgHPwjhp7e8cQUgQeGq+MJ/zW5p0Lr
 lV/ZgGBmpFe949eDgm0qU+oVPKPf03KjeU4BqJ0hLAiJFJBabifIK5P//V1ZuO+3oxOf
 0SM7I8jKvtNJKqygobKR08MkN43mU4V0kKqvBIBnEp1M+QDjmhwYThjoBuw1zUFI8uSz
 lPrkllgEqMwYeZZDEDQiqhmE33nLpfM49HrBtlOUSKS8Pb+1kP6FV7xrh2mPbMsOsvVl
 8pBlzYOscGKrNARGCNqaaD4WHZDdNl6Fukb8FtExREZPIHmFZmZ5+G/O4pMrydDcgo5j
 zVqw==
X-Gm-Message-State: AO0yUKUvSW0zaK+/6J3UJYox7/gXSgF+qDv19QH2rJj9cwrzgcJFE9Fr
 36wHAZ12Sp1coG4AuzXP7r2IGA==
X-Google-Smtp-Source: AK7set+YlVpaxPtNZa9kFVj0Yz408D87QlJ9t6+vc3atYoQFSQMX4QOP8MwwdVH8ALJ/u3jZJpt5qw==
X-Received: by 2002:a05:6870:1494:b0:163:2804:596d with SMTP id
 k20-20020a056870149400b001632804596dmr10030801oab.19.1677091963876; 
 Wed, 22 Feb 2023 10:52:43 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([189.110.112.117])
 by smtp.gmail.com with ESMTPSA id
 z2-20020a9d71c2000000b0068bcadcad5bsm1781111otj.57.2023.02.22.10.52.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 10:52:43 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v7 08/10] hw/riscv/virt.c: do not use RISCV_FEATURE_MMU in
 create_fdt_socket_cpus()
Date: Wed, 22 Feb 2023 15:52:03 -0300
Message-Id: <20230222185205.355361-9-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230222185205.355361-1-dbarboza@ventanamicro.com>
References: <20230222185205.355361-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x35.google.com
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
X-List-Received-Date: Wed, 22 Feb 2023 18:52:46 -0000

Read cpu_ptr->cfg.mmu directly. As a bonus, use cpu_ptr in
riscv_isa_string().

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
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
2.39.2


