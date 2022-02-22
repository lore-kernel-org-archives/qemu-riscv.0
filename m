Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nMdJg-0005wX-JT
	for mharc-qemu-riscv@gnu.org; Tue, 22 Feb 2022 17:07:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nMdJZ-0005lg-NV
 for qemu-riscv@nongnu.org; Tue, 22 Feb 2022 17:07:22 -0500
Received: from [2607:f8b0:4864:20::c2f] (port=42677
 helo=mail-oo1-xc2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nMdJV-0005MQ-1K
 for qemu-riscv@nongnu.org; Tue, 22 Feb 2022 17:07:20 -0500
Received: by mail-oo1-xc2f.google.com with SMTP id
 s203-20020a4a3bd4000000b003191c2dcbe8so19648247oos.9
 for <qemu-riscv@nongnu.org>; Tue, 22 Feb 2022 14:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kkZGA5zMICgSFHManAvIfubSG1Ccpwu/k/TvltcJAM4=;
 b=D6Cf+TzXAWffgsolwp+iXvBIVkV6P3613gYPbI4FblwAYFM5+nOcRtgm15+wL8qMNR
 QtDbF708dYNEoj0MmhmjzbgDNMI4FthGzBI+TZQtxOVWlmTN2y0JY4qrpSfD1SeyczLq
 +5ExY5tx2OQR30QhA3Ca7yG+k+HxSjrldbcLIZD3RTQgs+r0zRPOqFPUIA2LwrqwO6aT
 Nlfi2fG6TxADU1Lgnr+CiaTgpys0kk70T05A9ajzXirD4enMM7tCyuBaJBCI4eZQ5iTi
 GfD2OhBxuBM6TZuSIVkwv5Gs9JbmZ3UaOYtdGO903fxadA4y9jIO4jbZAZ9UYAIU42PG
 bB/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kkZGA5zMICgSFHManAvIfubSG1Ccpwu/k/TvltcJAM4=;
 b=pZ9v3zYk4vGIYKRwz0gRLwLXdaY2BKyyCotA3pvC7mYQTwq0QQjP20T7K/iEZohUih
 jjCNsSK2fc2+QmwRP24ZhtamV+enWVOfeSkkIQ70RFrprEoW+MZ+t1Bg39NlrFUGbbeo
 0IZSu6paBGr5Eryu9BPmnZerO7mOGVpP+yqycEAjlpoxURfJE2JGwFruQrGt4dbmGUyI
 Nt81NWGRcJ7dPL7MbNS1AcWUGyHaUpoo1Ij74vvRxSjC1wM2HriPn4ffmhrpI7xuGRRe
 IYddH4txfOz0nyxXBkPaQ683XyDgrpLWy9SVvORvfuq6GorwN/KTHBkwOVZL4s4MXr2/
 S+Bw==
X-Gm-Message-State: AOAM531hibPeDrMMqgUzW07Cw2AOeN/SldBvTHIvc8tDmrGTWgj96ZWG
 e7wANh/2/xXlMph+OONDMksH+g==
X-Google-Smtp-Source: ABdhPJxFpZDlvlFZ6b0L+TbCw0zzL8EVBuDTlCKhDAo+FhXoAG3q1LDdvi4HoBGpMKMR2fWvPBWDYA==
X-Received: by 2002:a05:6870:3b05:b0:ce:c0c9:663 with SMTP id
 gh5-20020a0568703b0500b000cec0c90663mr2780830oab.181.1645567633854; 
 Tue, 22 Feb 2022 14:07:13 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id n25sm4901913otq.78.2022.02.22.14.07.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 14:07:13 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v4 4/6] target/riscv: Add support for mconfigptr
Date: Tue, 22 Feb 2022 14:07:02 -0800
Message-Id: <20220222220704.2294924-5-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220222220704.2294924-1-atishp@rivosinc.com>
References: <20220222220704.2294924-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c2f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2f;
 envelope-from=atishp@rivosinc.com; helo=mail-oo1-xc2f.google.com
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
X-List-Received-Date: Tue, 22 Feb 2022 22:07:23 -0000

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
index f96d26399607..89440241632a 100644
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
index 25a0df498669..18fe17b62f51 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -3021,6 +3021,8 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MIMPID]    = { "mimpid",    any,   read_zero    },
     [CSR_MHARTID]   = { "mhartid",   any,   read_mhartid },
 
+    [CSR_MCONFIGPTR]  = { "mconfigptr", any,   read_zero,
+                                        .min_priv_ver = PRIV_VERSION_1_12_0 },
     /* Machine Trap Setup */
     [CSR_MSTATUS]     = { "mstatus",    any,   read_mstatus,     write_mstatus, NULL,
                                                read_mstatus_i128                   },
-- 
2.30.2


