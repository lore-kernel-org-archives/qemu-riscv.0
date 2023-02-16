Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSmEa-0002ui-TH
	for mharc-qemu-riscv@gnu.org; Thu, 16 Feb 2023 16:56:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSmEW-0002rq-DG
 for qemu-riscv@nongnu.org; Thu, 16 Feb 2023 16:56:04 -0500
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSmEU-0001t5-Ir
 for qemu-riscv@nongnu.org; Thu, 16 Feb 2023 16:56:04 -0500
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-16ab8581837so4289133fac.4
 for <qemu-riscv@nongnu.org>; Thu, 16 Feb 2023 13:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E0YbACxmbDVY2djSGNnFWhmaGCk8HOixmpp41hp0ofs=;
 b=Z72FiW7rcUTLAy4SaVG0IF7x2L57s+ZD+ndQADm6DW+Wn+MffQtSX4C/LTh25gzgb8
 37bVIe+27wPz50eCKxSwpK09C7+h+572woKF6uLdKWgzEd3D1nbZ5XqKWTOw6jEcImt8
 Db7+1gk0oJ7Nn7+HlzY/ZHHVnzrT4UaY6eKNqOSZqTaV6GaurWHXnITOnBp2Rlej1YnN
 QkvstyYL4z5lFIy4v3Q4IoowLxWC9iC4u6liPkurEihQaw7CMXo8jGuRYHek9wzVpWCc
 yOTSKi2O8bp8XRsO0eCUoFPvJepwZTrVa665b26E3kiuje+FPqThCJkaIKUOF4SAMm37
 ynGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E0YbACxmbDVY2djSGNnFWhmaGCk8HOixmpp41hp0ofs=;
 b=oxdGf/an8UMJBedrtrM5du9/sHBdBBCntJ2QsaIlDPBerB9KigKzf/CcBd1KL+AOio
 usn+Sp0yhm/Z9oHbe6awPMEkQPQWfZZfKRm8vz65Ubr6onTKtlJOWs04vsKt/UmzCjpL
 26AGifpv7mFung+NBFRkYlAsaIZBqvfzYOeoHiVsZUp2b7zpFGieqTrwtmCgJT0NHbGY
 gxuxDK3scN24b+CaC6dsf4qxuS3tL48MS6ITOLepXozL4h5UdbfZBoqi4+Hik9C3fkNz
 fLEPho5+LA7KBajO3inKGPc2qgScvan0dxUfgfj4xh6vYaDl2IJyN9HxU21MJ80E0EVC
 Vxtg==
X-Gm-Message-State: AO0yUKWNzMVd+kVHhQBbymxRFCMekd/c4uqUfbqIJNrko2OdbQlIyMfW
 Uq3xINOglkvYW/VfjU0IaMIZSQ==
X-Google-Smtp-Source: AK7set+EQ4aV1H7HGHKkTNPo3PE7r/C1gLPvpEHNZowLC8w0G2+uLS40zQdDq+IlpvG6B8s/pRuvhQ==
X-Received: by 2002:a05:6870:961b:b0:16e:94c5:589a with SMTP id
 d27-20020a056870961b00b0016e94c5589amr254906oaq.4.1676584560123; 
 Thu, 16 Feb 2023 13:56:00 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 i132-20020acaea8a000000b0037d7f4d0890sm1047570oih.26.2023.02.16.13.55.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 13:55:59 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 richard.henderson@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v6 1/9] target/riscv: turn write_misa() into an official no-op
Date: Thu, 16 Feb 2023 18:55:42 -0300
Message-Id: <20230216215550.1011637-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230216215550.1011637-1-dbarboza@ventanamicro.com>
References: <20230216215550.1011637-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 16 Feb 2023 21:56:04 -0000

At this moment, and apparently since ever, we have no way of enabling
RISCV_FEATURE_MISA. This means that all the code from write_misa(), all
the nuts and bolts that handles how to write this CSR, has always been a
no-op as well because write_misa() will always exit earlier.

This seems to be benign in the majority of cases. Booting an Ubuntu
'virt' guest and logging all the calls to 'write_misa' shows that no
writes to MISA CSR was attempted. Writing MISA, i.e. enabling/disabling
RISC-V extensions after the machine is powered on, seems to be a niche
use.

Before proceeding, let's recap what the spec says about MISA. It is a
CSR that is divided in 3 fields:

- MXL, Machine XLEN, described as "may be writable";

- MXLEN, the XLEN in M-mode, which is given by the setting of MXL or a
fixed value if MISA is zero;

- Extensions is defined as "a WARL field that can contain writable bits
where the implementation allows the supported ISA to be modified"

Thus what we have today (write_misa() being a no-op) is already a valid
spec implementation. We're not obliged to have a particular set of MISA
writable bits, and at this moment we have none.

Given that allowing the dormant code to write MISA can cause tricky bugs
to solve later on, and we don't have a particularly interesting case of
writing MISA to support today, and we're already not violating the
specification, let's erase all the body of write_misa() and turn it into
an official no-op instead of an accidental one. We'll keep consistent
with what we provide users today but with 50+ less lines to maintain.

RISCV_FEATURE_MISA enum is erased in the process since there's no one
else using it.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/cpu.h |  1 -
 target/riscv/csr.c | 55 ----------------------------------------------
 2 files changed, 56 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 7128438d8e..01803a020d 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -89,7 +89,6 @@ enum {
     RISCV_FEATURE_MMU,
     RISCV_FEATURE_PMP,
     RISCV_FEATURE_EPMP,
-    RISCV_FEATURE_MISA,
     RISCV_FEATURE_DEBUG
 };
 
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 1b0a0c1693..f7862ff4a4 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1329,61 +1329,6 @@ static RISCVException read_misa(CPURISCVState *env, int csrno,
 static RISCVException write_misa(CPURISCVState *env, int csrno,
                                  target_ulong val)
 {
-    if (!riscv_feature(env, RISCV_FEATURE_MISA)) {
-        /* drop write to misa */
-        return RISCV_EXCP_NONE;
-    }
-
-    /* 'I' or 'E' must be present */
-    if (!(val & (RVI | RVE))) {
-        /* It is not, drop write to misa */
-        return RISCV_EXCP_NONE;
-    }
-
-    /* 'E' excludes all other extensions */
-    if (val & RVE) {
-        /* when we support 'E' we can do "val = RVE;" however
-         * for now we just drop writes if 'E' is present.
-         */
-        return RISCV_EXCP_NONE;
-    }
-
-    /*
-     * misa.MXL writes are not supported by QEMU.
-     * Drop writes to those bits.
-     */
-
-    /* Mask extensions that are not supported by this hart */
-    val &= env->misa_ext_mask;
-
-    /* Mask extensions that are not supported by QEMU */
-    val &= (RVI | RVE | RVM | RVA | RVF | RVD | RVC | RVS | RVU | RVV);
-
-    /* 'D' depends on 'F', so clear 'D' if 'F' is not present */
-    if ((val & RVD) && !(val & RVF)) {
-        val &= ~RVD;
-    }
-
-    /* Suppress 'C' if next instruction is not aligned
-     * TODO: this should check next_pc
-     */
-    if ((val & RVC) && (GETPC() & ~3) != 0) {
-        val &= ~RVC;
-    }
-
-    /* If nothing changed, do nothing. */
-    if (val == env->misa_ext) {
-        return RISCV_EXCP_NONE;
-    }
-
-    if (!(val & RVF)) {
-        env->mstatus &= ~MSTATUS_FS;
-    }
-
-    /* flush translation cache */
-    tb_flush(env_cpu(env));
-    env->misa_ext = val;
-    env->xl = riscv_cpu_mxl(env);
     return RISCV_EXCP_NONE;
 }
 
-- 
2.39.1


