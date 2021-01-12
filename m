Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzGAJ-000331-OC
	for mharc-qemu-riscv@gnu.org; Tue, 12 Jan 2021 04:40:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGAH-0002wx-6N
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:40:37 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:43475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGAF-000781-8i
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:40:36 -0500
Received: by mail-pg1-x531.google.com with SMTP id n10so1064276pgl.10
 for <qemu-riscv@nongnu.org>; Tue, 12 Jan 2021 01:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=jleV92peaBoleoUyz44TD5KVBflWewFN0Wl2yb/PChU=;
 b=M/9QUxtvvo/dZNY28mi0qCP1kC8Qp4kYgxCgptvHdyg/5fchcggk+WBO6Eoe8w5vPr
 x5NFjOug5EsBpBYoCiXSFHKg06ybEHtvezaKd7Wj5oZKALvNTidunZmRSO6Atu7zviEH
 UPcjzeZ27QCEl8Q9UDn3hSfgoU39/zwGRpE1FFvn4aFZNS23Z2H3Xa7HYrgXavicYoxE
 Cf3ZkMMhTrjsZJfVmmr5uc2+Akig12wJ6HEubbfbJ01fXjnN97WvKxTE7+9ivq0POTUx
 VSA+sCVWqeeslopxdAajVeFNwcNT7nFYQpiUGOAeETkJAj8jUgbEfkGn3XlnSG/3wZmi
 S04Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=jleV92peaBoleoUyz44TD5KVBflWewFN0Wl2yb/PChU=;
 b=SCrm/BY+48iQQ3mtjaPqsssXsxEDyTy5noGh6/FnXvWG51ZBsMmxrywVg3f2AMeYZe
 mv1ZkNVkrKHXteZHJP5i0pizkeLerDRPpeeKoLbXpaPg012VaqM555iS0dRbTtcLfL4x
 U73BzpGzAHqy0n3+zTTRPecgRIu4wZBSCwQsJpDjZlQtFUpm8stYwyOColiKXVuA8lpx
 Mw27bJY8kn3eXpuahIerDz2UKDK824eu6pXwoJ8YAFKqpVeyOmI/aEUcetEmGhjLj6B6
 JHAMGpljXJ0AdxHa1+yb9FOx/xTOFh0vv5r+PD9zkbeGdEpZbmYqEXlqdUoKSWL5a/pO
 nf8Q==
X-Gm-Message-State: AOAM532De+ScjviAzweh6wlSW+LaJB1DeADhUbLIAC6/CoygYnZ+Swzq
 SeOcfBySGOVVA5nEC5hmbwx6hw==
X-Google-Smtp-Source: ABdhPJxY2ZGZMCk7bHoug8iSm70yqGlttdG98IE0xic6FDiIwq4c/bq5wI4zFwKT/r4IkbZvw0IOOA==
X-Received: by 2002:a65:47c7:: with SMTP id f7mr3830284pgs.305.1610444433869; 
 Tue, 12 Jan 2021 01:40:33 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id h16sm2865664pgd.62.2021.01.12.01.40.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 01:40:33 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Greentime Hu <greentime.hu@sifive.com>,
 Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [PATCH v6 09/72] target/riscv: rvv-1.0: add vlenb register
Date: Tue, 12 Jan 2021 17:38:43 +0800
Message-Id: <20210112093950.17530-10-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112093950.17530-1-frank.chang@sifive.com>
References: <20210112093950.17530-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x531.google.com
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
X-List-Received-Date: Tue, 12 Jan 2021 09:40:37 -0000

From: Greentime Hu <greentime.hu@sifive.com>

Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu_bits.h | 1 +
 target/riscv/csr.c      | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 2538580a62a..fcc8fe5cdb4 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -63,6 +63,7 @@
 #define CSR_VCSR            0x00f
 #define CSR_VL              0xc20
 #define CSR_VTYPE           0xc21
+#define CSR_VLENB           0xc22
 
 /* VCSR fields */
 #define VCSR_VXSAT_SHIFT    0
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 4ac1ed8cfa8..7a6554447af 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -272,6 +272,12 @@ static int read_vtype(CPURISCVState *env, int csrno, target_ulong *val)
     return 0;
 }
 
+static int read_vlenb(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env_archcpu(env)->cfg.vlen >> 3;
+    return 0;
+}
+
 static int read_vl(CPURISCVState *env, int csrno, target_ulong *val)
 {
     *val = env->vl;
@@ -1420,6 +1426,7 @@ static riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_VCSR] =                { vs,   read_vcsr,        write_vcsr        },
     [CSR_VL] =                  { vs,   read_vl                             },
     [CSR_VTYPE] =               { vs,   read_vtype                          },
+    [CSR_VLENB] =               { vs,   read_vlenb                          },
     /* User Timers and Counters */
     [CSR_CYCLE] =               { ctr,  read_instret                        },
     [CSR_INSTRET] =             { ctr,  read_instret                        },
-- 
2.17.1


