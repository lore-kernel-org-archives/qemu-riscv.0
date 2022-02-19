Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nLDZu-00086s-Qv
	for mharc-qemu-riscv@gnu.org; Fri, 18 Feb 2022 19:26:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nLDZu-00086V-3g
 for qemu-riscv@nongnu.org; Fri, 18 Feb 2022 19:26:22 -0500
Received: from [2607:f8b0:4864:20::c2c] (port=45643
 helo=mail-oo1-xc2c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nLDZ9-0006xh-T5
 for qemu-riscv@nongnu.org; Fri, 18 Feb 2022 19:26:21 -0500
Received: by mail-oo1-xc2c.google.com with SMTP id
 y15-20020a4a650f000000b0031c19e9fe9dso2593818ooc.12
 for <qemu-riscv@nongnu.org>; Fri, 18 Feb 2022 16:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tWdPBgFPd5OdpI5BydIr2KjDq2q84k4RMsJ72Aie9z0=;
 b=L0UDUOclyCTvg55FzKrMLSKoCAigKe7MWIPEi1Pj5iUcVVoc3WrS270AoX3i/jhtpo
 KZszXxzzo4a981uHn0be4U+516oNgS9ISbuBejT6UL5MKvH67fkmrz7AkjXnAAazzjb9
 5xg6qX0tmbBCleBrTP+DYIGhDazw/DMMBV17Dv2mi49NYn+gKo+d/hQZPIIz5FB3TA05
 ZV/NQh6TGEol9x3eTnzLUYcaj+/4tKYkIQGtaP7aj80n7jm6uIJZTAAwygxAQQP0AfTV
 NxsqYNTtFlgYNPzMhm5srKXYKvrdr5vAFMQALomRaCUn1g/yCEHJPfFLMOYbZKy89vhf
 55Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tWdPBgFPd5OdpI5BydIr2KjDq2q84k4RMsJ72Aie9z0=;
 b=dFrPi80+3QfTSzz6KScEHF6TC5g1Qy5kZwmXNRkWezZdC6VPY78jyt90R2Dy7TnskL
 gvnVsGI8ni42m+29C3tVQ598VlFJNwO1JP1Mdi5jOLN8qSuKo7lRK2cklXZZ+QuBus+c
 FbP355Aw7OWITQclB7OdcRMADZd2Q5JB0yt8J7hwY1TFD8WBpt5b/5b0uhuTF1i0T7rC
 F866Rkrywged80zOIOXFFuGSv+VK65ZXhr55h0rjui0uZrrcbdIAktMDxhaWTV1aPjsm
 02Da6K/im7mBNtwnktR5aob2tfYQU/wsacmPkNHWRyDMvx1O/TSlkPECU+XL1D2EBUr9
 4SKw==
X-Gm-Message-State: AOAM531RoVMfxLA1hgDYwO5V+H079yLqKPgfFoRMJdIzZUy6IQ5dEt7C
 X3nXo2wRHGxnkxj+2Rq4Lv356Q==
X-Google-Smtp-Source: ABdhPJxjOwA1eH8Di09HpXI02eI2Ux7fQtE74To3QX1aSOK0+KxmNS9DkS9AUzUfRalDQEsSn5qqZw==
X-Received: by 2002:a05:6870:51ce:b0:d3:d65f:ad6f with SMTP id
 b14-20020a05687051ce00b000d3d65fad6fmr2756806oaj.234.1645230334937; 
 Fri, 18 Feb 2022 16:25:34 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id r38sm2315588otv.72.2022.02.18.16.25.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 16:25:34 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Atish Patra <atishp@rivosinc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Subject: [PATCH v5 01/12] target/riscv: Fix PMU CSR predicate function
Date: Fri, 18 Feb 2022 16:25:07 -0800
Message-Id: <20220219002518.1936806-2-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220219002518.1936806-1-atishp@rivosinc.com>
References: <20220219002518.1936806-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c2c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2c;
 envelope-from=atishp@rivosinc.com; helo=mail-oo1-xc2c.google.com
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
X-List-Received-Date: Sat, 19 Feb 2022 00:26:22 -0000

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
index b16881615997..3799ee850087 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -94,8 +94,9 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
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
@@ -121,8 +122,9 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
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


