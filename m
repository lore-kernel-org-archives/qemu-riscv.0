Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pS0un-0005u2-LU
	for mharc-qemu-riscv@gnu.org; Tue, 14 Feb 2023 14:24:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pS0um-0005qO-Em
 for qemu-riscv@nongnu.org; Tue, 14 Feb 2023 14:24:32 -0500
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pS0uj-0005Am-T9
 for qemu-riscv@nongnu.org; Tue, 14 Feb 2023 14:24:32 -0500
Received: by mail-ot1-x32f.google.com with SMTP id
 d21-20020a056830005500b0068bd2e0b25bso4977439otp.1
 for <qemu-riscv@nongnu.org>; Tue, 14 Feb 2023 11:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mKe9WCZnTVAaZJnop0rP7VzduBZzF4Gb7p5FsE1kSnU=;
 b=KzBPPp+6nqF+q0LEd//+vjLUxvhDQYiLDBBdQtcO/FkVsZ6+Qci+mBoZU4WlbgqhbK
 k0TbmMbHVLOIE4IdI3OXKZD5wSkkv2CZBOkZ57hCrIyRn5Tsj52UeC1bluuU1qiW564b
 ey3bzpqBuHRQvPZE0d7c7Hj8bF9s6l7SC/P64pTPSAPQeufXJmKVeVd1bGnSLL4qbE8w
 MYoK1x2ddFVZrmq7EWb1Nh0nL73UKD8KesF3xjebMHaXdn3hGYagLgbAUE5wR6guNUWX
 Ykn5NvLY6h5G4P+ksH5Awr590bw0B8mnw/ONr7oNFucfw+lNVGGbojRAG7sLzmSoBRXZ
 jyyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mKe9WCZnTVAaZJnop0rP7VzduBZzF4Gb7p5FsE1kSnU=;
 b=3lkUWgaabnQYkJwCA//NOnDfLtDsHYohwN4fRqn/Hk615FDNKUgPSYQA/sBTcxyyhT
 EZWCHrH9fK+3yzY2uRuKQb9PH2R1BI1oL197p/Y+fv/vZEjBjhV6uEQWwL0iSgPDhpHV
 BXcjZ50ylgyWlZuEgiQooRmpIl43+ruMmZAkHUS90i9RGUAaex3K1qMikGnJfAY69Txs
 qpZp5Mcko1QiIHGI34dLFnZo5FHejoI8ak4zJmFFOLJoJuCtEfltk9JVE4MLVaEgtR3q
 QPP1YO7qqClbkpBPF0l8voTVsrb1lxvjzCr734DFJ3QqMFC4U9NMGLRV8iKxSH1/5Kzg
 ixXQ==
X-Gm-Message-State: AO0yUKWgLBMinlxxLzmcTZ0c7GHCqoOn5P1saMJ7BU6UltaHRl6WM/5L
 6ZKrDip449DL0P8f9r/7wgNx5A==
X-Google-Smtp-Source: AK7set8jekvl3BwJ8YDq86O+nN6ihAbX866F3rGkoLaKtCboWfZbKOZpAGsw75ejDYq8upPjl4twqQ==
X-Received: by 2002:a9d:7f89:0:b0:68d:7a7b:bd61 with SMTP id
 t9-20020a9d7f89000000b0068d7a7bbd61mr2059006otp.23.1676402668631; 
 Tue, 14 Feb 2023 11:24:28 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 g5-20020a9d6185000000b006865223e532sm6653752otk.51.2023.02.14.11.24.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 11:24:28 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 09/11] hw/riscv/virt.c: do not use RISCV_FEATURE_MMU in
 create_fdt_socket_cpus()
Date: Tue, 14 Feb 2023 16:23:54 -0300
Message-Id: <20230214192356.319991-10-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214192356.319991-1-dbarboza@ventanamicro.com>
References: <20230214192356.319991-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32f.google.com
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
X-List-Received-Date: Tue, 14 Feb 2023 19:24:32 -0000

Read cpu_ptr->cfg.mmu directly. As a bonus, use cpu_ptr in
riscv_isa_string().

Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
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


