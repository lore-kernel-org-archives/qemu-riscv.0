Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mWzgl-00087s-9j
	for mharc-qemu-riscv@gnu.org; Sun, 03 Oct 2021 07:29:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rpathak@ventanamicro.com>)
 id 1mWzgj-000879-4K
 for qemu-riscv@nongnu.org; Sun, 03 Oct 2021 07:29:49 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:41578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rpathak@ventanamicro.com>)
 id 1mWzgf-0007gw-DI
 for qemu-riscv@nongnu.org; Sun, 03 Oct 2021 07:29:48 -0400
Received: by mail-pg1-x52d.google.com with SMTP id v11so1270048pgb.8
 for <qemu-riscv@nongnu.org>; Sun, 03 Oct 2021 04:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e3ZeB5IUD5JkAYv9He3jdM0XZHcFNUIlabgRb08Pj28=;
 b=nS1Lfn5NPP0YlM37DyYToKVajYwgqtVLCY25TZp6yr7nYBrs5AmzpsvsfQSXwT+hoj
 YLGomW/ol86TzftAjhZGXffAqPTBNu7lQRESDlULYhAmrzcgiu1bhKS3vKD/xJgxZ3uz
 9Eba6yzToRkPrQh9Tuzd9tX6+c468nV5+ts6xPxBEGIOCa5HkP5xuwsUGcJ0XSK85LlX
 dRq9KetYzcHBaYE67Nb/sx8KIjTrbVIOr5oQEZZnqtWeAMMGV33YoB0WqllIg36btTJD
 Ppm3c1LHsAXa+6n7WAgKBxvLDDOPf6CRp/6Sz25xLdP1o4t024t/t9avnp10hz0NV1ni
 h+Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e3ZeB5IUD5JkAYv9He3jdM0XZHcFNUIlabgRb08Pj28=;
 b=kNMmR2NRS1fYF3BNKl8k3Rym+GqNn9kjGTlH3+cwsG0j76eKfXwdup8RJATQZzH9li
 z4b4jgZGO+exWq1VyaNm3MrNaVMTVravQ8W/gI0dKDUkZ42WHzpRFRjH4I4kERudkAOn
 Ka5N5/H6u0VJ383WS5U/l30xUB9qy5cDz1RPhQ9+O1KWOuSN8uNwMeT4+zwLkOh4g6EB
 zGadTUZ/soDruOu76rFVu5Gb9FUvZzkZc8T1u6l1zxYGWuzKrnJMC2LA6WYgZ6eDb/Qc
 D0jHKRs//EtViIWoGvloAaljBotX9UZRzeQSVRKPRkrZZn4eHTcLgYeDU68HM9QBskXr
 rjgQ==
X-Gm-Message-State: AOAM531rTprFlo4dvbx3mU8ueD41gHIOpyeW0P8rwBrv8FQs3O0z2QoN
 WBM7cmKOaqVGoiulMd5kumAFoQ==
X-Google-Smtp-Source: ABdhPJwo+QDIBq2GgZs/JhQwGgGbnpIjbSGKm7P5giQY0M933mCekwnI4rY2YGxeabKlpLM8Qos6Cw==
X-Received: by 2002:a05:6a00:9a:b0:44b:b8f9:1d72 with SMTP id
 c26-20020a056a00009a00b0044bb8f91d72mr19616012pfj.21.1633260583143; 
 Sun, 03 Oct 2021 04:29:43 -0700 (PDT)
Received: from rpathak-ThinkPad-T490.dc1.ventanamicro.com ([103.48.101.147])
 by smtp.googlemail.com with ESMTPSA id o11sm10512013pjp.0.2021.10.03.04.29.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Oct 2021 04:29:42 -0700 (PDT)
From: Rahul Pathak <rpathak@ventanamicro.com>
To: Alistair.Francis@wdc.com, bmeng.cn@gmail.com, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: pathakraul@gmail.com,
	Rahul Pathak <rpathak@ventanamicro.com>
Subject: [PATCH] target/riscv: csr: Implement mconfigptr CSR
Date: Sun,  3 Oct 2021 16:58:56 +0530
Message-Id: <20211003112855.960081-1-rpathak@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=rpathak@ventanamicro.com; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Sun, 03 Oct 2021 11:29:49 -0000

mconfigptr is an mandatory CSR as per the priv spec.
This csr holds the physical address of the configuration
data structure if this data structure is implemented
Its an readonly csr set to zero making configuration
data structure not supported.

Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>
---
 target/riscv/cpu_bits.h | 1 +
 target/riscv/csr.c      | 1 +
 2 files changed, 2 insertions(+)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 999187a9ee..5dc4729ed5 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -140,6 +140,7 @@
 #define CSR_MARCHID         0xf12
 #define CSR_MIMPID          0xf13
 #define CSR_MHARTID         0xf14
+#define CSR_MCONFIGPTR      0xf15 
 
 /* Machine Trap Setup */
 #define CSR_MSTATUS         0x300
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 23fbbd3216..2182943f54 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1549,6 +1549,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MARCHID]   = { "marchid",   any,   read_zero    },
     [CSR_MIMPID]    = { "mimpid",    any,   read_zero    },
     [CSR_MHARTID]   = { "mhartid",   any,   read_mhartid },
+    [CSR_MCONFIGPTR] = {"mconfigptr", any,  read_zero    },
 
     /* Machine Trap Setup */
     [CSR_MSTATUS]     = { "mstatus",    any,   read_mstatus,     write_mstatus     },
-- 
2.25.1


