Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o631s-0005er-Uy
	for mharc-qemu-riscv@gnu.org; Tue, 28 Jun 2022 00:40:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1o631q-0005bg-QU
 for qemu-riscv@nongnu.org; Tue, 28 Jun 2022 00:40:46 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:33546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1o631p-0006VB-Dc
 for qemu-riscv@nongnu.org; Tue, 28 Jun 2022 00:40:46 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 i8-20020a17090aee8800b001ecc929d14dso11549601pjz.0
 for <qemu-riscv@nongnu.org>; Mon, 27 Jun 2022 21:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6J7gL6BfZeqHNBCJK+8rR2sxXz+yKeHStI/GCp5riaI=;
 b=C/sziOYWFrRn9LEtgtvFV/oq0dBYOdwLcsR3lH/TzQBT0WL3VzlyHn5+naf1tb2lia
 yPH1HLfCBOb81/M3GaFThCUdbBZ9M3lPvFedvI9Q6pv1qKpSJXNtjUrSffVjtXLI5CIi
 qAIV0jjLBkY+fRW5g12PRWLnW50flIGjXQdmDGiCpz32yD4Opkvvb4JcqUK9oEBlcPA1
 KsVMPC0Bi93CAbhFiDFU1LhyM0GyURYgX89ig650R949WLdzxXbSabAtvmN3H7DdHviW
 MMXDD7dhdtYvyNeeJST0mQXkEyHy+wmnu6WQmh2p4Z+4c1t2IP4dJrAcCDBiNYRLSyh4
 SnjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6J7gL6BfZeqHNBCJK+8rR2sxXz+yKeHStI/GCp5riaI=;
 b=Ehw8sE9PW7j7WYaF3Ld+RXQqzoqYi6y1dXMLP+dT7OwwTvJs4M6ln3/CFryjhbiZlR
 COfK0BhjvpXALbocHgT0M1HfD8OO8YTB9eGWhSbJD1SPv5G2LqroxYs/T8OOCVVqlPZ1
 1jqRpQcVyo3SFGkk/Lj/F8cvHDmeTkaH6nj7Xv8K6ze+xFWppkTtN8dN5fJbQTas1qp0
 qHpDweh10HroKNAfqhr7ctwbzZB+m8QYcr8mbm6ki85oW4QNdOhBDur6lgdU/wHRcSlN
 JDrDofUbQu5zstvAlv4QabHWAMb2oVWrDDZDOZbx3hP5HaqRjoG4HF49f7+O4gIgEsDQ
 /DPg==
X-Gm-Message-State: AJIora9lJMK+Wg38S000aVB/O6KFvXZ8jCeqlaUnCvlwfynXKtrSRU6R
 pVKOny1fDhQodK0OCjxSVuUpHg==
X-Google-Smtp-Source: AGRyM1v3o52IpJwXDuFbnKq+cDPH8VWVcIL2IzF6PXlYSrZ5ajGAfOlsza/L9w9jw6ZHQ3k8xbQg6Q==
X-Received: by 2002:a17:902:ef8e:b0:16a:5449:2012 with SMTP id
 iz14-20020a170902ef8e00b0016a54492012mr3097242plb.46.1656391243944; 
 Mon, 27 Jun 2022 21:40:43 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([117.96.230.192])
 by smtp.gmail.com with ESMTPSA id
 q62-20020a17090a17c400b001ece6f492easm10284001pja.44.2022.06.27.21.40.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:40:43 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v7 1/4] Revert "target/riscv: Add dummy mcountinhibit CSR for
 priv spec v1.11 or higher"
Date: Tue, 28 Jun 2022 10:10:25 +0530
Message-Id: <20220628044028.659704-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628044028.659704-1-apatel@ventanamicro.com>
References: <20220628044028.659704-1-apatel@ventanamicro.com>
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 28 Jun 2022 04:40:48 -0000

This reverts commit 33cc1c0b69e457f5c526f64297353cba6f7bfdb4 because
commit eab4776b2badd4088a4f807c9bb3dc453c53dc23 already implements
proper mcountinhibit CSR emulation.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 target/riscv/cpu_bits.h | 3 ---
 target/riscv/csr.c      | 2 --
 2 files changed, 5 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 8724b45c08..b3f7fa7130 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -159,9 +159,6 @@
 #define CSR_MTVEC           0x305
 #define CSR_MCOUNTEREN      0x306
 
-/* Machine Counter Setup */
-#define CSR_MCOUNTINHIBIT   0x320
-
 /* 32-bit only */
 #define CSR_MSTATUSH        0x310
 
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index b5734957cf..d65318dcc6 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -3642,8 +3642,6 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MIE]         = { "mie",        any,   NULL,    NULL,    rmw_mie           },
     [CSR_MTVEC]       = { "mtvec",      any,   read_mtvec,       write_mtvec       },
     [CSR_MCOUNTEREN]  = { "mcounteren", any,   read_mcounteren,  write_mcounteren  },
-    [CSR_MCOUNTINHIBIT] = { "mcountinhibit", any, read_zero, write_ignore,
-                                             .min_priv_ver = PRIV_VERSION_1_11_0 },
 
     [CSR_MSTATUSH]    = { "mstatush",   any32, read_mstatush,    write_mstatush    },
 
-- 
2.34.1


