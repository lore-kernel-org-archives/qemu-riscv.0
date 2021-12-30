Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n2ufq-0003eX-Sb
	for mharc-qemu-riscv@gnu.org; Thu, 30 Dec 2021 07:36:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n2ufo-0003am-DN
 for qemu-riscv@nongnu.org; Thu, 30 Dec 2021 07:36:48 -0500
Received: from [2607:f8b0:4864:20::52e] (port=33456
 helo=mail-pg1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n2ufm-0003SI-9J
 for qemu-riscv@nongnu.org; Thu, 30 Dec 2021 07:36:47 -0500
Received: by mail-pg1-x52e.google.com with SMTP id 7so8676815pgn.0
 for <qemu-riscv@nongnu.org>; Thu, 30 Dec 2021 04:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6KNcxB0lI+145naSOKpjow3XUCsQJZAnp5v4CWe5LiQ=;
 b=i/XLEi9gvP9RnOOUcndn4eoQFfHb7Lp2xSMNLauICR5/FWFTqT6q8dfVGDnWSg2j9x
 EkJUekUiK0coZ5hUvPcVwdavwZUcr2mAMl036in9LjFUMYM0+R7biWBbVmK0ImdYV++Z
 +Xm8OOW0++8J3O1d2RbfxSKDBoFz4wqPyJ3vshHGVtWEo0AIvNZu2+SHRWfhDwjdWRMI
 4hub/BVIKyXA3u14GTQCLP+cDXnu2smPPs+GjIqZUJv8ZfZHBUSt5KRW7xuQiYydSG1w
 +QSrGtfg9Wqi+uRb4265/zJaOyVTPQtWGGULBCNTiMcST6evW+L0opF13JPYSuTB07gj
 Jy1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6KNcxB0lI+145naSOKpjow3XUCsQJZAnp5v4CWe5LiQ=;
 b=E9a6d6jQTxjD3689yN7xq94JQc3VMuvFHi/TwSpM3hgZ+2VF9giryhy3hzZdlGaQ96
 UA29SgYUH4fyUqlJdczYg+/5vhLOzfSJaSHpDLCIWWf75iavp/lwEYSHoeLholC9qjp/
 QZ9ts3OuXMLz4LDNFG8b7WpqPH9avzlxqhGy3kR7mAd0kKc05StqS2SFSQmyedhAJOPC
 nJgYKQa2rlrc4hZ5OXIHvCy+I5hq8i4G/4ZXaayHXhJZKjt7LRqT6Sw9DU1/u4K0eELH
 ngAO0ByYGMamNJmGeNAhwfhGI3K0wiODTTdd0T/S7HzrPEUSWJ0i2uJc6GNqq205uf7e
 YuSw==
X-Gm-Message-State: AOAM533DxceHE5pUNNTfEfpzEa27k64j76IQiNJ1oJI50HRtcc5F4Xd/
 FiivsjeQw+tIB6Rp4nuxiU0f7w==
X-Google-Smtp-Source: ABdhPJzJwf3dkh3dhpoIpux70bsHIbxkE9En0c7Q4BEhtUqeAIMh05POl2dYt5TVhrO4aCSJ5l9gvg==
X-Received: by 2002:aa7:868d:0:b0:4ba:e919:b2f1 with SMTP id
 d13-20020aa7868d000000b004bae919b2f1mr31130673pfo.31.1640867805001; 
 Thu, 30 Dec 2021 04:36:45 -0800 (PST)
Received: from localhost.localdomain ([171.61.71.9])
 by smtp.gmail.com with ESMTPSA id a3sm28588348pfv.47.2021.12.30.04.36.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 04:36:44 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v6 16/23] hw/riscv: virt: Use AIA INTC compatible string when
 available
Date: Thu, 30 Dec 2021 18:05:32 +0530
Message-Id: <20211230123539.52786-17-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211230123539.52786-1-anup@brainfault.org>
References: <20211230123539.52786-1-anup@brainfault.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52e
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::52e;
 envelope-from=anup@brainfault.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 30 Dec 2021 12:36:49 -0000

From: Anup Patel <anup.patel@wdc.com>

We should use the AIA INTC compatible string in the CPU INTC
DT nodes when the CPUs support AIA feature. This will allow
Linux INTC driver to use AIA local interrupt CSRs.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/virt.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 3af074148e..720641b1dd 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -211,8 +211,17 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
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


