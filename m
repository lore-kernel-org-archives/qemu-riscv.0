Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nG2hP-00065Z-Uh
	for mharc-qemu-riscv@gnu.org; Fri, 04 Feb 2022 12:48:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nG2hN-0005x7-PN
 for qemu-riscv@nongnu.org; Fri, 04 Feb 2022 12:48:41 -0500
Received: from [2a00:1450:4864:20::42f] (port=35379
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nG2hJ-0003yc-Jl
 for qemu-riscv@nongnu.org; Fri, 04 Feb 2022 12:48:41 -0500
Received: by mail-wr1-x42f.google.com with SMTP id j25so12032956wrb.2
 for <qemu-riscv@nongnu.org>; Fri, 04 Feb 2022 09:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pp8R2yp0LwUIqj1uG0Z00NdjUepf/4Fv+MsY1tChXMw=;
 b=PaV1mKaqr+CMDsNeD1CiVKQMRh6i0PnTejy9cvAWbFXEhcDwfecHNQfC8fbzCB+DM8
 A2cvCXPTHnHTP/cL/uZYm6AhbdfLTsmUdjStvmcmPlX+bX5PSGafQAhxZvxnexhNq4YL
 EvbrcuNHnBlt8cOY8QPX+2hXHfxCkXztaVnk/VxDMXamBTcjZc5fHZka4BqJ/aEZWEzV
 Tpq/xkmOOf/WHmKTbL7W7Hbxp5Hzj2aGQXeMGxTcftRudbktA6ZqQgtzawDpIBMa/C6i
 4rcLtZv/YPGmNHEDBKGSucFaZqdS74M8SQbfxM7UNDHB8q5ltFZTZswmiY7iAk1ytt1z
 onSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pp8R2yp0LwUIqj1uG0Z00NdjUepf/4Fv+MsY1tChXMw=;
 b=8CyVV4OzDTG7mZIYAspx1vwy+NmoXV7l3c+C3pdA6jOpwvQczSwhPTMB+D5eB+Ovi7
 7S1fjIgY2R5CoSjuNNbs6IoenwfYjlNvRXwSWNjr3+XeCi9ZZUUmXP7GMyR5pC5Q5GJo
 yEoZFF/k1/EOqN2NUWwyqtbcW7q5mAsghOMn9CxfMu4nO4oRx+GlWpmP5QGn86lSdBw7
 Jp5jUZqAjPcIAIbKN6OAL4611gXcnz14niDmkR9ns6FJeeMdHna/TbfpCu9bX5/xPe/c
 hm74m0Qcnvln60XkzjzkPb3OOmarfaefDsVLLIfz8eODe4DS9hw0pUAOtczPTCqo+AUe
 MEgQ==
X-Gm-Message-State: AOAM532kGy695SduucOvR6g0tAMnvlHHwtNNiPn6PlZwdpHaHzRtLpaJ
 VHkcutgJFRNK9DULE/ZQvFbJIg==
X-Google-Smtp-Source: ABdhPJyreK4yVcbEAQmHL6uNW0WrwbnuLr85eDXUBR3Yei0qJ9lkFXTtDS+dZDiDPP8Vg8G/I9zw9g==
X-Received: by 2002:adf:f252:: with SMTP id b18mr30287wrp.50.1643996916335;
 Fri, 04 Feb 2022 09:48:36 -0800 (PST)
Received: from localhost.localdomain ([122.167.157.188])
 by smtp.gmail.com with ESMTPSA id f13sm11381876wmq.29.2022.02.04.09.48.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 09:48:35 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v9 16/23] hw/riscv: virt: Use AIA INTC compatible string when
 available
Date: Fri,  4 Feb 2022 23:16:52 +0530
Message-Id: <20220204174700.534953-17-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220204174700.534953-1-anup@brainfault.org>
References: <20220204174700.534953-1-anup@brainfault.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::42f;
 envelope-from=anup@brainfault.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 04 Feb 2022 17:48:42 -0000

From: Anup Patel <anup.patel@wdc.com>

We should use the AIA INTC compatible string in the CPU INTC
DT nodes when the CPUs support AIA feature. This will allow
Linux INTC driver to use AIA local interrupt CSRs.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 hw/riscv/virt.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 2643c8bc37..e3068d6126 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -212,8 +212,17 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
         qemu_fdt_add_subnode(mc->fdt, intc_name);
         qemu_fdt_setprop_cell(mc->fdt, intc_name, "phandle",
             intc_phandles[cpu]);
-        qemu_fdt_setprop_string(mc->fdt, intc_name, "compatible",
-            "riscv,cpu-intc");
+        if (riscv_feature(&s->soc[socket].harts[cpu].env,
+                          RISCV_FEATURE_AIA)) {
+            static const char * const compat[2] = {
+                "riscv,cpu-intc-aia", "riscv,cpu-intc"
+            };
+            qemu_fdt_setprop_string_array(mc->fdt, intc_name, "compatible",
+                                      (char **)&compat, ARRAY_SIZE(compat));
+        } else {
+            qemu_fdt_setprop_string(mc->fdt, intc_name, "compatible",
+                "riscv,cpu-intc");
+        }
         qemu_fdt_setprop(mc->fdt, intc_name, "interrupt-controller", NULL, 0);
         qemu_fdt_setprop_cell(mc->fdt, intc_name, "#interrupt-cells", 1);
 
-- 
2.25.1


