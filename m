Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C20EB64DD
	for <qemu-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 10:08:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qFB3G-00052q-5Q; Fri, 30 Jun 2023 06:08:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qFB3E-00052a-N7
 for qemu-riscv@nongnu.org; Fri, 30 Jun 2023 06:08:28 -0400
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qFB3D-0000l9-0w
 for qemu-riscv@nongnu.org; Fri, 30 Jun 2023 06:08:28 -0400
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-1b056276889so1462766fac.2
 for <qemu-riscv@nongnu.org>; Fri, 30 Jun 2023 03:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1688119706; x=1690711706;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q2Ls8WYAVehPuW6jRYnhu0ILyAvAR2A2rGoavXju0UU=;
 b=VPgI4oKz8zRXvgs3p+R7JxklGqRrcfA486xl5RyKEagigrFPzORgZg9LA9grO7pWPq
 KRivCVTxkLlT8/qFUz+NR2ICZMvjQBHoHRDMSP7rHo0y4oqOIj+b8bXHPdd1gV9D/f/u
 QaqTdsKnwaQ3fvzq8nuBmQ33ut8sz1kwsEmBKOEh4v7bqlRL9n00UfnFjW30y8CY594Z
 9uM3gfT94WHiktKCopvwNzsXIfr5vu5DFzVdqSPZABkNm9JQqY9JRFvgT1tlnc/7xm4B
 vDUeXkXlgIjTuIcPgvcEWzLC1oULVUbv13VIlOF5nj9IYLfVvnTNyBP++3MJ1iswlKo6
 +4dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688119706; x=1690711706;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q2Ls8WYAVehPuW6jRYnhu0ILyAvAR2A2rGoavXju0UU=;
 b=fhBCdySRQgdF+VhH5pMtNLaXM475e6CxnRGxEggojiK9yjbVUKWVeF6keM4vG9HqRH
 jngSV3whepXdjFmAs0E7QcKAshYdbcWe97URJY/7S3zvgre3umxUaVMDZVgFbRsJI2Of
 9k+wyJUZS4UdmN1jTb549vx9cfNzgdnpuOxLmAwHFBYrwm/Svi7Q4499bZktJJlmxig2
 bG5jhejG56GvEMRgfz7ggKo18WAh+8sr4WEUS1A7etn4tqjzDV31TK6wiEt+0ER2HRGw
 pH6bxOXpBD7MoveUfuAUYzRaOIAKTL3v6ReT8PLoLGV9uMuHHvAR7FT24cSR+0D9j5Kk
 KzPw==
X-Gm-Message-State: ABy/qLZSFdgNYDXjPEaizfCtKsiZ92WBkedXbGspaj1RaTmAI3nI9xyv
 Ez+X77ECxeQvx1bQr6u//aVzCw==
X-Google-Smtp-Source: ACHHUZ4FMAdo81GaiQbTQp6jj/59wk+DK5lfQ2yYvIOnc2E+s/tR61rxQNAGSydn96fjml4dwTrJpg==
X-Received: by 2002:a05:6870:7815:b0:19e:cfe6:8758 with SMTP id
 hb21-20020a056870781500b0019ecfe68758mr2727441oab.13.1688119706018; 
 Fri, 30 Jun 2023 03:08:26 -0700 (PDT)
Received: from grind.. (201-69-66-110.dial-up.telesp.net.br. [201.69.66.110])
 by smtp.gmail.com with ESMTPSA id
 eh18-20020a056870f59200b001a663e49523sm8707467oab.36.2023.06.30.03.08.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jun 2023 03:08:25 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com, philmd@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v7 02/20] hw/riscv/virt.c: skip 'mmu-type' FDT if satp mode
 not set
Date: Fri, 30 Jun 2023 07:07:53 -0300
Message-ID: <20230630100811.287315-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230630100811.287315-1-dbarboza@ventanamicro.com>
References: <20230630100811.287315-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x34.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

The absence of a satp mode in riscv_host_cpu_init() is causing the
following error:

$ ./qemu/build/qemu-system-riscv64  -machine virt,accel=kvm \
    -m 2G -smp 1  -nographic -snapshot \
    -kernel ./guest_imgs/Image \
    -initrd ./guest_imgs/rootfs_kvm_riscv64.img \
    -append "earlycon=sbi root=/dev/ram rw" \
    -cpu host
**
ERROR:../target/riscv/cpu.c:320:satp_mode_str: code should not be
reached
Bail out! ERROR:../target/riscv/cpu.c:320:satp_mode_str: code should
not be reached
Aborted

The error is triggered from create_fdt_socket_cpus() in hw/riscv/virt.c.
It's trying to get satp_mode_str for a NULL cpu->cfg.satp_mode.map.

For this KVM cpu we would need to inherit the satp supported modes
from the RISC-V host. At this moment this is not possible because the
KVM driver does not support it. And even when it does we can't just let
this broken for every other older kernel.

Since mmu-type is not a required node, according to [1], skip the
'mmu-type' FDT node if there's no satp_mode set. We'll revisit this
logic when we can get satp information from KVM.

[1] https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/cpu.yaml

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/riscv/virt.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 95708d890e..f025a0fcaf 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -243,13 +243,13 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
             s->soc[socket].hartid_base + cpu);
         qemu_fdt_add_subnode(ms->fdt, cpu_name);
 
-        satp_mode_max = satp_mode_max_from_map(
-            s->soc[socket].harts[cpu].cfg.satp_mode.map);
-        sv_name = g_strdup_printf("riscv,%s",
-                                  satp_mode_str(satp_mode_max, is_32_bit));
-        qemu_fdt_setprop_string(ms->fdt, cpu_name, "mmu-type", sv_name);
-        g_free(sv_name);
-
+        if (cpu_ptr->cfg.satp_mode.supported != 0) {
+            satp_mode_max = satp_mode_max_from_map(cpu_ptr->cfg.satp_mode.map);
+            sv_name = g_strdup_printf("riscv,%s",
+                                      satp_mode_str(satp_mode_max, is_32_bit));
+            qemu_fdt_setprop_string(ms->fdt, cpu_name, "mmu-type", sv_name);
+            g_free(sv_name);
+        }
 
         name = riscv_isa_string(cpu_ptr);
         qemu_fdt_setprop_string(ms->fdt, cpu_name, "riscv,isa", name);
-- 
2.41.0


