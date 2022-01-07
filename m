Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n5em2-0001sR-Vv
	for mharc-qemu-riscv@gnu.org; Thu, 06 Jan 2022 21:14:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1n5dXp-0007Ou-QW
 for qemu-riscv@nongnu.org; Thu, 06 Jan 2022 19:55:49 -0500
Received: from [2607:f8b0:4864:20::b2a] (port=33349
 helo=mail-yb1-xb2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1n5dXo-0004o0-1B
 for qemu-riscv@nongnu.org; Thu, 06 Jan 2022 19:55:49 -0500
Received: by mail-yb1-xb2a.google.com with SMTP id g80so12554780ybf.0
 for <qemu-riscv@nongnu.org>; Thu, 06 Jan 2022 16:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jpFlMaPtAV8PGNPWTK3CGyRMHE5OZo4qgrPLCNS5aSY=;
 b=Bd3Id2FTZmvNrhQKKsOv3iKGi0M0u0uzkvPDrsjCFwBmtfMB7IIx58EECoWruYn02H
 80N8IMDIpm2OUWWt9PVPnrS/TwARNg21OEx9sdb1Rs1soO0/rgu1yCnEx7Bq5+Xv5Fva
 6BAmGGNjE/ZjauBEkZ8yYlBQdgAHeegWm9mqN/Qk9x1Yf7nOvP1dITxKWKrzgMPm0nhv
 ZsZv0aUipUbp873f0+tgHT9n1WuioyMaYhbBGjYzidvzgoFDSUzvB2mzeZwc2F9Lps5l
 Rw4EXQbcXOClJEyz8TPwMmxF/A9BwXZb5COYMPV03Bp/Ub8s3ShHIul1K2c1BY228jw5
 3A2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jpFlMaPtAV8PGNPWTK3CGyRMHE5OZo4qgrPLCNS5aSY=;
 b=RTiymegUQEldmQaLT/XMLJSyjfSeIlLXlhhH2CU51UBUrjgRXRnFiLr5Tr9A3xvtYb
 Z459lRFEpUuJfrxap90gNTz1FCfwL0PLCnvWtHqES4F54vYNCuJFBW+npgUXuan6uzjm
 olmIVQUxovqiL16yOEhhidLAadJeTm68E3ciNtCsbpv3xhgcSloVsIwOL29RkhaZ8AVX
 GYdjuUBfe8/H4PJ0HNvXE3v9mVKhi0DhG/oZsNvS9U7G58CUNsiHsikRrzENmA8e0qDb
 7t0akUzIn8X3OEPz8upTiclYzgi/IQVtZUlSiAFCJKCy8O/R3ZIzXVH7ZsTc3vFSiIg+
 hTFQ==
X-Gm-Message-State: AOAM532zutka9MnBAlMLuy9cRkpWd7JnMkBPyZPSrsZB2R+dwU1aIzv5
 g07jthhUx7cvGdI2o6KeB6a9KjiPaxF64YJL
X-Google-Smtp-Source: ABdhPJxQJzdCzdsV4dCZO7PMRU7PzbgFtVdv4sSlejLbx1qOlWtQ6ME09XS3bRpJQvfc70omFuC63A==
X-Received: by 2002:a05:6820:556:: with SMTP id n22mr37704ooj.60.1641516567871; 
 Thu, 06 Jan 2022 16:49:27 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id e4sm678441oiy.12.2022.01.06.16.49.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 16:49:27 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Atish Patra <atishp@rivosinc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Subject: [PATCH v4 01/11] target/riscv: Fix PMU CSR predicate function
Date: Thu,  6 Jan 2022 16:48:36 -0800
Message-Id: <20220107004846.378859-2-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220107004846.378859-1-atishp@rivosinc.com>
References: <20220107004846.378859-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=atishp@rivosinc.com; helo=mail-yb1-xb2a.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 06 Jan 2022 21:14:13 -0500
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
X-List-Received-Date: Fri, 07 Jan 2022 00:55:50 -0000

From: Atish Patra <atish.patra@wdc.com>

The predicate function calculates the counter index incorrectly for
hpmcounterx. Fix the counter index to reflect correct CSR number.

Fixes: e39a8320b088 ("target/riscv: Support the Virtual Instruction fault")

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/csr.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 146447eac5d5..53a621fdbaef 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -90,8 +90,9 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
             }
             break;
         case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
-            if (!get_field(env->hcounteren, 1 << (csrno - CSR_HPMCOUNTER3)) &&
-                get_field(env->mcounteren, 1 << (csrno - CSR_HPMCOUNTER3))) {
+            ctr_index = csrno - CSR_CYCLE;
+            if (!get_field(env->hcounteren, 1 << ctr_index) &&
+                 get_field(env->mcounteren, 1 << ctr_index)) {
                 return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
             }
             break;
@@ -117,8 +118,9 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
                 }
                 break;
             case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
-                if (!get_field(env->hcounteren, 1 << (csrno - CSR_HPMCOUNTER3H)) &&
-                    get_field(env->mcounteren, 1 << (csrno - CSR_HPMCOUNTER3H))) {
+                ctr_index = csrno - CSR_CYCLEH;
+                if (!get_field(env->hcounteren, 1 << ctr_index) &&
+                     get_field(env->mcounteren, 1 << ctr_index)) {
                     return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
                 }
                 break;
-- 
2.30.2


