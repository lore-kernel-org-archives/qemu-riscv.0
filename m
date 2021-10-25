Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mezKb-0001tM-MS
	for mharc-qemu-riscv@gnu.org; Mon, 25 Oct 2021 08:44:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rpathak@ventanamicro.com>)
 id 1mezKZ-0001kN-59
 for qemu-riscv@nongnu.org; Mon, 25 Oct 2021 08:43:59 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:42842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rpathak@ventanamicro.com>)
 id 1mezKX-0005Wm-Ds
 for qemu-riscv@nongnu.org; Mon, 25 Oct 2021 08:43:58 -0400
Received: by mail-pg1-x529.google.com with SMTP id t7so10799352pgl.9
 for <qemu-riscv@nongnu.org>; Mon, 25 Oct 2021 05:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7yXLiuOcBTxYABPq5lAJTZLVXh8n3YYUevwT4wKlq2k=;
 b=cWwQ7CHifJjfDW0kqDPJUc+U64yPNYUIjKyhHQtpbef8MqdwEZci1jmIJFwzaSXJkX
 u7UzRqfvnUzPPtKmqYDJu6kee2U53xrLi/kzNuRQJBmAtZE8DrGR/M+hJ8/4cpO45Rxi
 ITw9wce31v2LP+22G848rVKL4U52VNB76vU2iG0PAAse9T0w0N2+tRdZvFGyV4MszGuY
 rmLK5DlUIuLjtxAV0LrF+nCzMABHHTwKTcGcHkILtgXXp+8DGKXOpGC7meRe/FysjIfB
 LadR96lyCxVrP6h8/UYGWIBi1Iu6DH2MpDAoSRxdKudCZ8v+oigmaTmcvbCCtH+Z3ONB
 YVpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7yXLiuOcBTxYABPq5lAJTZLVXh8n3YYUevwT4wKlq2k=;
 b=h88v8nmMRWp/H+pqUkrcK7UWEnDlojOwS5s7xdn40YluiKke0QNG+BjSdUbiMS2NL7
 5smcs9uujlFyF1B2tdNM8qIXlYQ398qBGeCLnZP4JHaTHKSWjNevv+/2VRrT9PEc+osp
 CjSms+RUf3idr+ZWTWV0KrWGZMXA/Rw+GJHvREw7U6QotuYpq7U2Ii2r9mcn9tBT9NiW
 kKJwNGf8+By2yP+Ae1H3EkqwGrsOwtCnQvV46dLdhi2X8FfNyv1FN/LLNlpxhOHUF4aa
 X8t3Rmtgh3po9Tgms5IX/HFtn5kFWH/o1nB62yWMi4VmzCH4NRsR93zSzmYBlD0YL49y
 dSMA==
X-Gm-Message-State: AOAM531zdol3gfGZO3mtVDy5+AirmCIk5/zM9VfxpLm4bba9LwVcBhxw
 3naUPz50m3IzjNOpCl073fugtIxUIYw=
X-Google-Smtp-Source: ABdhPJwJKdJiw6HtmGMWTiKqP+HGnZMdeypFeeHMl/MK1G5a/oQ2+u9PMsTxVkDSpMG2i8N1ZbEd7g==
X-Received: by 2002:a63:b145:: with SMTP id g5mr10095805pgp.355.1635165834850; 
 Mon, 25 Oct 2021 05:43:54 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:6817:c049:7263:28b8:7cdf:c7e4])
 by smtp.googlemail.com with ESMTPSA id nn2sm3293461pjb.34.2021.10.25.05.43.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 05:43:54 -0700 (PDT)
From: Rahul Pathak <rpathak@ventanamicro.com>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, bmeng.cn@gmail.com,
 Alistair.Francis@wdc.com
Cc: rpathak@ventanamicro.com
Subject: [PATCH v2 2/2] target/riscv: csr: Implement mconfigptr CSR
Date: Mon, 25 Oct 2021 18:13:19 +0530
Message-Id: <20211025124319.195290-3-rpathak@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211025124319.195290-1-rpathak@ventanamicro.com>
References: <20211025124319.195290-1-rpathak@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=rpathak@ventanamicro.com; helo=mail-pg1-x529.google.com
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
X-List-Received-Date: Mon, 25 Oct 2021 12:43:59 -0000

Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>
---
 target/riscv/cpu_bits.h |  1 +
 target/riscv/csr.c      | 19 +++++++++++++++----
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index cffcd3a5df..e2f154b7c5 100644
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
index 69e4d65fcd..2d7f608d49 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -209,6 +209,16 @@ static RISCVException epmp(CPURISCVState *env, int csrno)
 
     return RISCV_EXCP_ILLEGAL_INST;
 }
+
+static RISCVException priv1p12(CPURISCVState *env, int csrno)
+{
+	if (env->priv_ver >= PRIV_VERSION_1_12_0) {
+		return RISCV_EXCP_NONE;
+	}
+
+	return RISCV_EXCP_ILLEGAL_INST;
+}
+
 #endif
 
 /* User Floating-Point CSRs */
@@ -1569,10 +1579,11 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MINSTRETH] = { "minstreth", any32, read_instreth },
 
     /* Machine Information Registers */
-    [CSR_MVENDORID] = { "mvendorid", any,   read_zero    },
-    [CSR_MARCHID]   = { "marchid",   any,   read_zero    },
-    [CSR_MIMPID]    = { "mimpid",    any,   read_zero    },
-    [CSR_MHARTID]   = { "mhartid",   any,   read_mhartid },
+    [CSR_MVENDORID] = { "mvendorid", 	any,   		read_zero    },
+    [CSR_MARCHID]   = { "marchid",   	any,   		read_zero    },
+    [CSR_MIMPID]    = { "mimpid",    	any,   		read_zero    },
+    [CSR_MHARTID]   = { "mhartid",   	any,   		read_mhartid },
+    [CSR_MCONFIGPTR] = {"mconfigptr", 	priv1p12,  	read_zero    },
 
     /* Machine Trap Setup */
     [CSR_MSTATUS]     = { "mstatus",    any,   read_mstatus,     write_mstatus     },
-- 
2.25.1


