Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lcNKs-00005E-Rs
	for mharc-qemu-riscv@gnu.org; Fri, 30 Apr 2021 03:13:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lcNKr-0008VQ-Kz; Fri, 30 Apr 2021 03:13:13 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:37580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lcNKn-0000Ky-9O; Fri, 30 Apr 2021 03:13:13 -0400
Received: by mail-ed1-x530.google.com with SMTP id y26so1789647eds.4;
 Fri, 30 Apr 2021 00:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dIT3vmQFKYv5ZTBRKHJJ6NBlN5EHRUN2L+JtZ54C9+0=;
 b=lXfk7y008KzSLqXSQIk1PbF/zOuH4Zb3lTUyoiaRo1/+NPEl3QymG4ehwQCr57Lu3I
 dwoXEP7ZWQaAAaLidBv89eLSeDFdSodqhq2Ewt0T0oEKS20SF7f52+/MyGmFezTTwR8O
 9z89sPSSnCADCYQBItdIPzkQrf2WFMudAyNhyzNqHkgJHBEIL3PbioLeHMIDyTzAxfzT
 aDHcrmDqx74aetIR8bU1rrke5S/9LpMcT/7JjHgXTNWeF8iTnZgp+PsjU223JnCO424j
 ZTdcj9Bhd+hnLFU6Al1G2UVAPar3EqfSK4E8se8G6D9GM5HwxfzAmGIQS58gVLA3/EKk
 se1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dIT3vmQFKYv5ZTBRKHJJ6NBlN5EHRUN2L+JtZ54C9+0=;
 b=Hom2pkPUGjntZCHhUsaK5vWpTdSazZZupC4Lsr6KsqRL5STbHRkjCqeLunM2us4Z17
 30SQBtCcWbDsR/mVHhpaqDo2fgsFFBmgD1LOyIsQOzK36hVd8nxsN5FDnaZ/D8vOR9Sf
 cEGoKEmwXVNPuEnoQOSZEkb6e7rw7WdX2QpJm1F6K2b7W9Ek841k4//FsUyzBOGLWHD+
 HiD3eSvaoIdjFNb3UAJYRdrIXmYSHN6TxdyYf8vqifcPZmp0x9eyQ/oRT7ZM6mG60UfA
 dz8BEV4hjs57K821pYigWYvKvaEDCtI3HGDc3xBW0NBR3Fzl2rmw7KP04brFubdoCIKC
 Zxzw==
X-Gm-Message-State: AOAM533AWAJc3yl2Vu0CFwu4XTlVPzUuBFPZWIWXGgiALlEawNWuB+KT
 CEq+A+Hc2CHW4gMl+FksJGQ=
X-Google-Smtp-Source: ABdhPJymBxLMouSw4jg51PtwuxLyKsgbKvGi/lFcer3lx3tCNYK+D0C7iALUaV1DDRMokvFVMB2QKw==
X-Received: by 2002:a50:f296:: with SMTP id f22mr4021101edm.254.1619766787285; 
 Fri, 30 Apr 2021 00:13:07 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id b19sm574462edd.66.2021.04.30.00.13.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 00:13:06 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v2 2/8] hw/riscv: virt: Switch to use
 qemu_fdt_setprop_string_array() helper
Date: Fri, 30 Apr 2021 15:12:56 +0800
Message-Id: <20210430071302.1489082-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430071302.1489082-1-bmeng.cn@gmail.com>
References: <20210430071302.1489082-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Apr 2021 07:13:14 -0000

From: Bin Meng <bin.meng@windriver.com>

Since commit 78da6a1bca22 ("device_tree: add qemu_fdt_setprop_string_array helper"),
we can use the new helper to set the compatible strings for the
SiFive test device node.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---

Changes in v2:
- use "static const char * const" for compat

 hw/riscv/virt.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index c0dc69ff33..992f1c58a9 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -395,8 +395,11 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
         (long)memmap[VIRT_TEST].base);
     qemu_fdt_add_subnode(fdt, name);
     {
-        const char compat[] = "sifive,test1\0sifive,test0\0syscon";
-        qemu_fdt_setprop(fdt, name, "compatible", compat, sizeof(compat));
+        static const char * const compat[3] = {
+            "sifive,test1", "sifive,test0", "syscon"
+        };
+        qemu_fdt_setprop_string_array(fdt, name, "compatible", (char **)&compat,
+                                      ARRAY_SIZE(compat));
     }
     qemu_fdt_setprop_cells(fdt, name, "reg",
         0x0, memmap[VIRT_TEST].base,
-- 
2.25.1


