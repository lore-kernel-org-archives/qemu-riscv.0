Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSMyi-0008Kb-EN
	for mharc-qemu-riscv@gnu.org; Wed, 15 Feb 2023 13:58:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSMyb-00086a-TF
 for qemu-riscv@nongnu.org; Wed, 15 Feb 2023 13:57:58 -0500
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSMya-000803-Ca
 for qemu-riscv@nongnu.org; Wed, 15 Feb 2023 13:57:57 -0500
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-16dcb07b805so17558189fac.0
 for <qemu-riscv@nongnu.org>; Wed, 15 Feb 2023 10:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rhjy4ZuFr2J/YQsYfjypiNp1FTwn/nVolIeKKoKX5g0=;
 b=cQRoPKkkeY6SG7kjMP2mcLCrvmFRchM/Ek8r4BVoUl+XreMhbEz3/aJE9u30OC1oFB
 Hr+Wilsp0sR/R3+FasRaIg3bFIwwBdyqvCuRUTh4RhlA31BqaS3/nDjGarR0nLRxOuFd
 YIepH7WC2vcAzS6+T4faaD4DJd2S1hfnfTDCkzJ/akGhXQ5U2FM/QyqWFmppnkWDyIHG
 XqXZt54h/X0XBH29hHkOwxSPpUXIaAvVJUxxFX6etgC5z7H+ydF/5OV8yPbjO5+9vcIY
 vCWBkMnNkvB7/ZDZXzZ+iB8G1GCwM2jvlfSWDhYcNuRJ3l++mDxuohQF/4FPDhOgxb77
 6S/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Rhjy4ZuFr2J/YQsYfjypiNp1FTwn/nVolIeKKoKX5g0=;
 b=W8NMoFce6XlG51YV+uNDiJmck0mRlsd7RBjMLPF3/3mKqzE3aY08+rE3ZVK+ZKy3sW
 XJYS9YT3fi1Jfu8ezwBaFfqSNDr5XyxtWz4C4opmvogE18L5sGNWJk1IVZTdZQ+iPjDS
 YD8Rlzsk9JKUlCqK7j3btta1bWeJnTCLkHklIk3C0WG2nvsFfq25PiF2cDQeJBmwkT8g
 x1Va8v+kM20085j+6s6eqT16o4MX3VMQX18fQ9UeHWPJ8FBCjMIWt0zd91FwSqdb+tJC
 LnH4JIGeaEaMiGlwtYl/Hraw+6ZF5VVdayqHuXrfgR6Ruwej16P7k8vTsZpG6/A2Hohq
 I37A==
X-Gm-Message-State: AO0yUKWg4beUe0uN7p4ItzSchD0LnATIZUGTzXChYYkLf8vz23Ni0nmv
 0OkdlwymOTseLVoKTX2yfUTptQ==
X-Google-Smtp-Source: AK7set99WNSWOw5IYu4hKdqjrkA617YNnvhKygjmCUQzmX+RrlC0M6nLJ0LQWAqdh0x9uyYvyddtBQ==
X-Received: by 2002:a05:6870:560c:b0:16a:c90e:def9 with SMTP id
 m12-20020a056870560c00b0016ac90edef9mr1547552oao.9.1676487475205; 
 Wed, 15 Feb 2023 10:57:55 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 c21-20020a056808139500b0037d8dbe4308sm4145697oiw.48.2023.02.15.10.57.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 10:57:54 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v3 08/10] hw/riscv/virt.c: do not use RISCV_FEATURE_MMU in
 create_fdt_socket_cpus()
Date: Wed, 15 Feb 2023 15:57:24 -0300
Message-Id: <20230215185726.691759-9-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230215185726.691759-1-dbarboza@ventanamicro.com>
References: <20230215185726.691759-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x30.google.com
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
X-List-Received-Date: Wed, 15 Feb 2023 18:57:58 -0000

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


