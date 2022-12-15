Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p5wz8-0004E8-Ur
	for mharc-qemu-riscv@gnu.org; Thu, 15 Dec 2022 17:45:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abrestic@rivosinc.com>)
 id 1p5wz8-0004DV-2K
 for qemu-riscv@nongnu.org; Thu, 15 Dec 2022 17:45:50 -0500
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <abrestic@rivosinc.com>)
 id 1p5wz6-00013L-DL
 for qemu-riscv@nongnu.org; Thu, 15 Dec 2022 17:45:49 -0500
Received: by mail-qv1-xf2b.google.com with SMTP id q10so510875qvt.10
 for <qemu-riscv@nongnu.org>; Thu, 15 Dec 2022 14:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SCTf7NMvJLELqtGoZRPSE1QFP//FtelGYPMJRFHqiNk=;
 b=2eBGt10jEePE8+bscEGmvu5Ys9eNbzWzHiP1cNap52QTHl0IfkBITXu17NTKu9G6eB
 1jkw3M4QFkBJP2z1h1vq9JEvwCv7ntFbcojHxgFViuLVWEMtOXySc8joe5QeHyRbNyxD
 0MH5n21NfJ1bho/98mKbaiAl0qSFor5BzjPdZwJTbHaym/5d3BTkwFPYbVwLsVy4EqCF
 9bblNzSCksS9JEtVT8oMHkbug/oYlTpyZBQBrnwQpxztfzXzPAqG8ZCN84KYBsQA5jQ3
 6eie0h3UzWjZ6JySjPIaWW/3sNxt5Mc87cCFBS8/zdgvEmMr4Fzhwwf7ikXnl+P+g+hO
 uSKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SCTf7NMvJLELqtGoZRPSE1QFP//FtelGYPMJRFHqiNk=;
 b=nyKph/mz2//BwJFrtUVsQdjC/nyY8770ePHYTAI/41W5ugT6dTF6sQBFzIpln/j4bu
 yEOAljaAYMr8dFDLSBL3kIv/JOQuYToPxwI+mLLOzoYFnWGk1Ju1v8cvgXCQk2BqqDV3
 bYNizzpSpX4YwWOlJfFYnB3KBHkLVozUEg/F3eHYUtDRTWW/RAf8YnU7yMCFvYv5U3Lf
 fhzgILNwtOlzbIZnVXHUuCyDPxwoBt4bZq7Tm+uxqeozuIjkrbXL6aSjJBN53yKJ9Z0k
 /KL3CF0PG6L8Z1jXZuIy4Y2QMQzrGj8qkVUk7U1Lo19cObcTTDnBsB/o+gXOLeyEtSUz
 aXyQ==
X-Gm-Message-State: ANoB5pkbOlCMS2TC/fK0d7/pCML/b8JgY+Ne95q4d3SKbkIfYAW5U6RW
 rNz5OTQFbfJSswSrZOK0J9OSh6c3tAge1+lZ
X-Google-Smtp-Source: AA0mqf5uuWCft1+h1ePjNWZX5TbFcWhHb66VUmfo78xQ4T7WUVV78mimS23B4ig3dSeJCoHtgYx4gg==
X-Received: by 2002:a0c:ef54:0:b0:4c6:e965:e129 with SMTP id
 t20-20020a0cef54000000b004c6e965e129mr40563187qvs.47.1671144347298; 
 Thu, 15 Dec 2022 14:45:47 -0800 (PST)
Received: from localhost.localdomain
 (pool-72-80-155-134.nycmny.fios.verizon.net. [72.80.155.134])
 by smtp.gmail.com with ESMTPSA id
 q4-20020a05620a0d8400b006fba44843a5sm173445qkl.52.2022.12.15.14.45.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Dec 2022 14:45:46 -0800 (PST)
From: Andrew Bresticker <abrestic@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 Andrew Bresticker <abrestic@rivosinc.com>
Subject: [PATCH 2/2] target/riscv: Trap on writes to stimecmp from VS when
 hvictl.VTI=1
Date: Thu, 15 Dec 2022 17:45:41 -0500
Message-Id: <20221215224541.1423431-2-abrestic@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221215224541.1423431-1-abrestic@rivosinc.com>
References: <20221215224541.1423431-1-abrestic@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2b;
 envelope-from=abrestic@rivosinc.com; helo=mail-qv1-xf2b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 15 Dec 2022 22:45:50 -0000

Per the AIA specification, writes to stimecmp from VS level should
trap when hvictl.VTI is set since the write may cause vsip.STIP to
become unset.

Fixes: 3ec0fe18a31f ("target/riscv: Add vstimecmp support")
Signed-off-by: Andrew Bresticker <abrestic@rivosinc.com>
---
 target/riscv/csr.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 984548bf87..7d9035e7bb 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -935,6 +935,9 @@ static RISCVException write_stimecmp(CPURISCVState *env, int csrno,
     RISCVCPU *cpu = env_archcpu(env);
 
     if (riscv_cpu_virt_enabled(env)) {
+        if (env->hvictl & HVICTL_VTI) {
+            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+        }
         return write_vstimecmp(env, csrno, val);
     }
 
@@ -955,6 +958,9 @@ static RISCVException write_stimecmph(CPURISCVState *env, int csrno,
     RISCVCPU *cpu = env_archcpu(env);
 
     if (riscv_cpu_virt_enabled(env)) {
+        if (env->hvictl & HVICTL_VTI) {
+            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+        }
         return write_vstimecmph(env, csrno, val);
     }
 
-- 
2.25.1


