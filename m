Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nPqbM-0007fB-Ro
	for mharc-qemu-riscv@gnu.org; Thu, 03 Mar 2022 13:55:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nPqbJ-0007UN-SN
 for qemu-riscv@nongnu.org; Thu, 03 Mar 2022 13:54:57 -0500
Received: from [2607:f8b0:4864:20::c35] (port=33555
 helo=mail-oo1-xc35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nPqbI-0001tP-1I
 for qemu-riscv@nongnu.org; Thu, 03 Mar 2022 13:54:57 -0500
Received: by mail-oo1-xc35.google.com with SMTP id
 r41-20020a4a966c000000b0031bf85a4124so6863181ooi.0
 for <qemu-riscv@nongnu.org>; Thu, 03 Mar 2022 10:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/tS8r6MLk9Ys/DbcleIob127V9NYv9KycItEsxaklD8=;
 b=F1JDBHzBMIK0U/4m5qJk6zYTebgB9PELFz3b/qjqaWyFTKZGGH4iSGIZHmEgMdzohG
 N9+ixkBXvjay+mKOn0btsO1kHvA5EpbY8VElnFfznBYnQX8EL+2RqDTWncpOpdqtg4kZ
 naEDI6pSzzpLv4aKkTByKG7Fmsbeg2jHWmlv0+TVnR0CbVNO4MrUoez/R+aPJPM7mBOp
 eSJC8VGbLn+h8hrKiRRGXI5raVCaXOc04IZCd+VMGgU1AkIPG7pAXB7GyM5Q6ueWlUfK
 xezDfjOkaU/r0lGifuqhFGIIKpo7vbY+OR3eMXkA5gwFloqBFIMq+Am3Ye6sgWRMeOYc
 Mkvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/tS8r6MLk9Ys/DbcleIob127V9NYv9KycItEsxaklD8=;
 b=Jinlv6rGCA8u4uWHc3JOKgXr1p4jBH9UvKR/7cqrD87t/Zm6zLqloLjzF2Sdy+Z+xk
 xrgUfU38H+ciMq2ovnIWCSsbZtgwPE+rfD59Q3pIH8HcAzlEYZpBJzLHJq4LJQCWSSHo
 Cmeh7XaHn2hKr1tS/Jxnw0zO46yqNvslvAvym5URI0XeIbtrCkDplr95xX5a4AUoPqoS
 tkYOt3b1QW2ClYD39Ca/FDjR8JaPpH9hQyLSma9wTwo58IzijEN07RxOBfj4h35ne/QE
 VBXgYqdOfPjUh0ZixG9C+OdJZAkDPKQSvRJYvrurrq9e6cLVDTLDM6xnkokMWnVpLIPB
 K6EQ==
X-Gm-Message-State: AOAM533ANNWpZXxx2YCITS93s9Q5xjRBiRo+wYj89HNe48jDwkceq6RW
 gSgjiO1jTZ5mA5soD1Af/Gtv1w==
X-Google-Smtp-Source: ABdhPJzGW29hc70GAUKLV3jekc71n2hCm6cz6pwLb1P2FNUYZ0SWjJeKHX23EIGuIE3OAz0rgrl+fw==
X-Received: by 2002:a05:6870:a686:b0:d7:91:e56b with SMTP id
 i6-20020a056870a68600b000d70091e56bmr5169651oam.86.1646333695037; 
 Thu, 03 Mar 2022 10:54:55 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190]) by smtp.gmail.com with ESMTPSA id
 u24-20020a4ae698000000b0031c286f2e0csm1331052oot.29.2022.03.03.10.54.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 10:54:54 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v5 4/6] target/riscv: Add support for mconfigptr
Date: Thu,  3 Mar 2022 10:54:38 -0800
Message-Id: <20220303185440.512391-5-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220303185440.512391-1-atishp@rivosinc.com>
References: <20220303185440.512391-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c35
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c35;
 envelope-from=atishp@rivosinc.com; helo=mail-oo1-xc35.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Thu, 03 Mar 2022 18:54:58 -0000

RISC-V privileged specification v1.12 introduced a mconfigptr
which will hold the physical address of a configuration data
structure. As Qemu doesn't have a configuration data structure,
is read as zero which is valid as per the priv spec.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/cpu_bits.h | 1 +
 target/riscv/csr.c      | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 0fe01d7da57f..48d92a81c3ee 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -148,6 +148,7 @@
 #define CSR_MARCHID         0xf12
 #define CSR_MIMPID          0xf13
 #define CSR_MHARTID         0xf14
+#define CSR_MCONFIGPTR      0xf15
 
 /* Machine Trap Setup */
 #define CSR_MSTATUS         0x300
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index ec41a5363f6b..699d72b6c6f1 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -3107,6 +3107,8 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MIMPID]    = { "mimpid",    any,   read_zero    },
     [CSR_MHARTID]   = { "mhartid",   any,   read_mhartid },
 
+    [CSR_MCONFIGPTR]  = { "mconfigptr", any,   read_zero,
+                                        .min_priv_ver = PRIV_VERSION_1_12_0 },
     /* Machine Trap Setup */
     [CSR_MSTATUS]     = { "mstatus",    any,   read_mstatus,     write_mstatus, NULL,
                                                read_mstatus_i128                   },
-- 
2.30.2


