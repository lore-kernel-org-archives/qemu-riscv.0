Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nzw4g-0003Lf-3M
	for mharc-qemu-riscv@gnu.org; Sat, 11 Jun 2022 04:02:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nzw4b-0003K3-DC
 for qemu-riscv@nongnu.org; Sat, 11 Jun 2022 04:02:23 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:51012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nzw4X-00021F-Cm
 for qemu-riscv@nongnu.org; Sat, 11 Jun 2022 04:02:21 -0400
Received: by mail-pj1-x1030.google.com with SMTP id e24so1375472pjt.0
 for <qemu-riscv@nongnu.org>; Sat, 11 Jun 2022 01:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BVHViNMuB7xKyupW6LMRK2DTrEYBRxgZhhJyysMzOXI=;
 b=K2vK2Ekqs2VRw14pfK+188Xunjtf4RMgkIrwvcwCkbQsHeP+UnU+8VqbghVX1GJ31t
 P/b5bIZyaW9Os5CUr0FI32LIe6GBX4HRnj8TyfChut1dAem1IYpdyMta68Li9UEngHvi
 ugtbMUS6PdTOTUV0w5FytlKIIL16bIHS9KWFt2q/gkeob33ibfIrWT2RwGkvjEHHBU4d
 tpBfLg74CQ8qLNlmrstRz4Rrni/jmBgj7IXu2gsYxzYdzju7sijvmAXz3hmYlARMCOeV
 rjBvBjbZM6KRpdTN9zgO13rY7xWNZu8fDLcp740cA/aJI7tmrHInZOHKJ0nT2MLBbOE5
 7CSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BVHViNMuB7xKyupW6LMRK2DTrEYBRxgZhhJyysMzOXI=;
 b=ZCJnc7Y3ZjV/LuWL4osztoc+dDoHrxrOfEH0JGCzWqvzwPFPF/a5ntxxwQ+gtCfs02
 yBjl1PEgkWh/0Bc3qM8scN8hL1IjeK3T6sQnQlqWynGnJGbjElmN7vfSCF5HPopEV3a3
 iWHukDrTbE1sGNRuMgCpAEtLYwmAlBZKNImO+TpN+c3lNTkzJGbzJE3+v4TmuBJo3JKz
 sYppeo9r9NZ3kiMeRRZ/TM/DKotFUZUbFxXto26b8rYDCfGfexOJh66rPW2EojtuoQSS
 3OO7vUrBtEZ6ogekVtiaYQX9ZuQjkluPc3+JMcJd+/8s4q/ujFeaXxaiCryM3VKW0/fH
 4EZg==
X-Gm-Message-State: AOAM533tluBwr1QfjOoa3pRHIGLPn4Oo5+MRP1GsQV5w3SLQhJrf9fHQ
 o4sVy+8HWoYVNxs2+8OIKmTPyNwtbW9h2Q==
X-Google-Smtp-Source: ABdhPJzNldIB4DrETIJ2gKBeV35RRXKWNU/cm299ziOfhSws6SwQGrvJG1C37mxT3MqfsG9sz1JxdA==
X-Received: by 2002:a17:90b:247:b0:1e6:7f44:e385 with SMTP id
 fz7-20020a17090b024700b001e67f44e385mr3951162pjb.195.1654934534157; 
 Sat, 11 Jun 2022 01:02:14 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([171.61.69.124])
 by smtp.gmail.com with ESMTPSA id
 w1-20020a62c701000000b0050dc762814asm889025pfg.36.2022.06.11.01.02.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jun 2022 01:02:13 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <apatel@ventanamicro.com>, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v6 2/4] target/riscv: Add dummy mcountinhibit CSR for priv
 spec v1.11 or higher
Date: Sat, 11 Jun 2022 13:31:05 +0530
Message-Id: <20220611080107.391981-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220611080107.391981-1-apatel@ventanamicro.com>
References: <20220611080107.391981-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=apatel@ventanamicro.com; helo=mail-pj1-x1030.google.com
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
X-List-Received-Date: Sat, 11 Jun 2022 08:02:25 -0000

The mcountinhibit CSR is mandatory for priv spec v1.11 or higher. For
implementation that don't want to implement can simply have a dummy
mcountinhibit which is always zero.

Fixes: a4b2fa433125 ("target/riscv: Introduce privilege version field in the CSR ops.")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 target/riscv/cpu_bits.h | 3 +++
 target/riscv/csr.c      | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 4d04b20d06..4a55c6a709 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -159,6 +159,9 @@
 #define CSR_MTVEC           0x305
 #define CSR_MCOUNTEREN      0x306
 
+/* Machine Counter Setup */
+#define CSR_MCOUNTINHIBIT   0x320
+
 /* 32-bit only */
 #define CSR_MSTATUSH        0x310
 
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 6dbe9b541f..409a209f14 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -3391,6 +3391,8 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MIE]         = { "mie",        any,   NULL,    NULL,    rmw_mie           },
     [CSR_MTVEC]       = { "mtvec",      any,   read_mtvec,       write_mtvec       },
     [CSR_MCOUNTEREN]  = { "mcounteren", any,   read_mcounteren,  write_mcounteren  },
+    [CSR_MCOUNTINHIBIT] = { "mcountinhibit", any, read_zero, write_ignore,
+                                             .min_priv_ver = PRIV_VERSION_1_11_0 },
 
     [CSR_MSTATUSH]    = { "mstatush",   any32, read_mstatush,    write_mstatush    },
 
-- 
2.34.1


