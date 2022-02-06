Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nGdhA-00088T-HG
	for mharc-qemu-riscv@gnu.org; Sun, 06 Feb 2022 04:18:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nGdh8-00082m-TZ
 for qemu-riscv@nongnu.org; Sun, 06 Feb 2022 04:18:54 -0500
Received: from [2607:f8b0:4864:20::c32] (port=46705
 helo=mail-oo1-xc32.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nGdh7-000148-1u
 for qemu-riscv@nongnu.org; Sun, 06 Feb 2022 04:18:54 -0500
Received: by mail-oo1-xc32.google.com with SMTP id
 o192-20020a4a2cc9000000b00300af40d795so10277282ooo.13
 for <qemu-riscv@nongnu.org>; Sun, 06 Feb 2022 01:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=znQ0SVdA7leeqpez6/9lgiMyOZDn0ifFMpy9Ja+QSK0=;
 b=up1rXZ355Z/a7yDoSPYsucNZyDorXoBxPVqZM8jzbLiaDC/euqC00HNFIkpjUT4nT4
 dkDINn5IBRPngp0eqK9awe8UfeT9lR859PJ0M1Uyr2rTjBIB471zJsVnaRIJbvBFNQ6S
 PZjnKIJ1Tbm8FjP77upP8rrfO4EpSnqfvBbfW/W12QF1fpZ9yBESZZFZvoFY9prXeYCI
 WG7VZuWLLBUXlOx99eG1I5v+8TrLf6ChDnle6wToTNTzMLqy6jHxMLaFB3sDdXhAZ1z+
 Aq/IxkLYBdc+1PGp36A/x811Wsrhu68XuuHeiup1+VjgKCuQXW9/rxzEgJ9TqvQegI6H
 WSCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=znQ0SVdA7leeqpez6/9lgiMyOZDn0ifFMpy9Ja+QSK0=;
 b=wPCP3Mq99nO57qJYA0du8xlngUqZgfvwxohVqlweVDM/XaPNnRT68syxVx3NOxjBAB
 0XzVaEvV9piZfBdkiM4GHWiAisLu9TxxTzR9ieV+0Je5p1nOBk/YmiDUTkTdMnjaTyQZ
 g20Fzuo2j2oDGRUJl8mS4ZwmjVi+xuegVq+uYl2FpLkHT/S4vMFlr4bhVXved2bhG2uZ
 UwGN65Cg+410R4zBL/IgRN64P+mqslTH5XDcQfi45oA52TglVxu0azg5ClW0eetw5UWw
 MO8RYfYnzroIklmXn+e2j7y7tdcKCH8FSlhw/I1mvu6kxwNUC+W8QdmzhcXcsrme20ys
 DEnA==
X-Gm-Message-State: AOAM530l2Z8cXv94p10Efi87zTe1+sTlWAFb7GW/g4NeukZpLk+qW25i
 6HYc5OZuHd5Nx1SGBL2w8An1Mg==
X-Google-Smtp-Source: ABdhPJxnWZPr7pfZ+B1iVDPNx1xXIXP84Ehcy+frzwx1pLZshsvv5+ZxgkqJCuHV5LFYJceLs3R7zQ==
X-Received: by 2002:a05:6870:7734:: with SMTP id
 dw52mr1160983oab.185.1644139132181; 
 Sun, 06 Feb 2022 01:18:52 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id 1sm1596841oab.16.2022.02.06.01.18.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 01:18:51 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v3 4/6] target/riscv: Add support for mconfigptr
Date: Sun,  6 Feb 2022 01:18:33 -0800
Message-Id: <20220206091835.1244296-5-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220206091835.1244296-1-atishp@rivosinc.com>
References: <20220206091835.1244296-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c32
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c32;
 envelope-from=atishp@rivosinc.com; helo=mail-oo1-xc32.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
X-List-Received-Date: Sun, 06 Feb 2022 09:18:55 -0000

RISC-V privileged specification v1.12 introduced a mconfigptr
which will hold the physical address of a configuration data
structure. As Qemu doesn't have a configuration data structure,
is read as zero which is valid as per the priv spec.

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


