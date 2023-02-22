Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pUuED-0007Al-Sp
	for mharc-qemu-riscv@gnu.org; Wed, 22 Feb 2023 13:52:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pUuEA-0007A1-3p
 for qemu-riscv@nongnu.org; Wed, 22 Feb 2023 13:52:31 -0500
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pUuE8-0004Lq-F3
 for qemu-riscv@nongnu.org; Wed, 22 Feb 2023 13:52:29 -0500
Received: by mail-ot1-x333.google.com with SMTP id
 e18-20020a0568301e5200b00690e6abbf3fso1920235otj.13
 for <qemu-riscv@nongnu.org>; Wed, 22 Feb 2023 10:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AUjfQmZFOjBhh67GMkNvzvN+XgGlao3hTMnflad7XzA=;
 b=hevj//avL/AbNTgu6ovHiCrNomyU8hRpmLcCvjQ4SBji5nMwR7El3V7lXF7qRvnXJj
 hN8vsEPn51KvNiP8yGxpDL27trG31uR2TdCG1kdYFy4fYTmlwzhGH25dRCjeTBE6+Cxb
 l8hYhT8EMoyHyu70AIQftFId+969NkqXThnLAooszdEJ/BsFRptINwMXaGHj9RnxWw3a
 qOwfdVtKTW0LXLvt/4a939VVZc9iLfzZBIUiwuKbsClvZ7OJ6H9G5GkMroiHe3N6+sNG
 u6ZtlViDjrW9Ydbon2HQjlEbzG3I+c8JqjrWux+LyGYOxhMCydi/LY3gb6XVmYnPkhG7
 ZTpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AUjfQmZFOjBhh67GMkNvzvN+XgGlao3hTMnflad7XzA=;
 b=wC6hPu/jOEE/VrAkqh/6/qZCmR9uPCTk+w+dBuNDs5lKKcuryc2u240DGz4wKVbA3Z
 pJ7Bu8FIP/Ta0RIrS+/IPjXxYBoUC9r73iQ/ZKN2hxX5ch1wwFsevNgKx1JIKEo2uw6g
 wphUXXX0rFfNmEjEf+QeT6J/5bpz2eDEMosHmDdduDhq5cFdZaHyh/5NsdyHokEr+QyW
 jiHvpTIaU2BY0MRwxuAhrNdyliW6lyKsyeZ/G2vZNTHrZ+LjxFXV8jCNXwVOMFt8xF9B
 ovDJG37kdsGXhcO+AaYEZtNcVG5FrhQH9OwG6zwFOdsA2Z3110OsUtqeLIwvnjNN7IX+
 WM2Q==
X-Gm-Message-State: AO0yUKXcc2+Dj6Ztoy+TqynR4dzqQH4tJL69h3EBVnFsVSIU40OBNt61
 DG8SFsbXfbbi9DmXE+pOM+XnWQ==
X-Google-Smtp-Source: AK7set8Y6y6y5/bZozuoam9xpr5OwCmTKbBDg4tneGc3tJN3cSGAVsF22mLNBzhBph5mHxwFHe8zvg==
X-Received: by 2002:a05:6830:6518:b0:693:c6d4:c232 with SMTP id
 cm24-20020a056830651800b00693c6d4c232mr1741592otb.12.1677091947461; 
 Wed, 22 Feb 2023 10:52:27 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([189.110.112.117])
 by smtp.gmail.com with ESMTPSA id
 z2-20020a9d71c2000000b0068bcadcad5bsm1781111otj.57.2023.02.22.10.52.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 10:52:27 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v7 03/10] target/riscv: allow MISA writes as experimental
Date: Wed, 22 Feb 2023 15:51:58 -0300
Message-Id: <20230222185205.355361-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230222185205.355361-1-dbarboza@ventanamicro.com>
References: <20230222185205.355361-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x333.google.com
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
X-List-Received-Date: Wed, 22 Feb 2023 18:52:32 -0000

At this moment, and apparently since ever, we have no way of enabling
RISCV_FEATURE_MISA. This means that all the code from write_misa(), all
the nuts and bolts that handles how to properly write this CSR, has
always been a no-op as well because write_misa() will always exit
earlier.

This seems to be benign in the majority of cases. Booting an Ubuntu
'virt' guest and logging all the calls to 'write_misa' shows that no
writes to MISA CSR was attempted. Writing MISA, i.e. enabling/disabling
RISC-V extensions after the machine is powered on, seems to be a niche
use.

After discussions in the mailing list, most notably in [1], we reached
the consensus that this code is not suited to be exposed to users
because it's not well tested, but at the same time removing it is a bit
extreme because we would like to fix it, and it's easier to do so with
the code available to use instead of fetching it from git log.

The approach taken here is to get rid of RISCV_FEATURE_MISA altogether
and use a new experimental flag called x-misa-w. The default value is
false, meaning that we're keeping the existing behavior of doing nothing
if a write_misa() is attempted. As with any existing experimental flag,
x-misa-w is also a temporary flag that we need to remove once we fix
write_misa().

[1] https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg05092.html

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 6 ++++++
 target/riscv/cpu.h | 2 +-
 target/riscv/csr.c | 2 +-
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 93b52b826c..1d637b1acd 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1210,6 +1210,12 @@ static Property riscv_cpu_properties[] = {
 
     DEFINE_PROP_BOOL("rvv_ta_all_1s", RISCVCPU, cfg.rvv_ta_all_1s, false),
     DEFINE_PROP_BOOL("rvv_ma_all_1s", RISCVCPU, cfg.rvv_ma_all_1s, false),
+
+    /*
+     * write_misa() is marked as experimental for now so mark
+     * it with -x and default to 'false'.
+     */
+    DEFINE_PROP_BOOL("x-misa-w", RISCVCPU, cfg.misa_w, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 215423499e..9d3304bcda 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -89,7 +89,6 @@ enum {
     RISCV_FEATURE_MMU,
     RISCV_FEATURE_PMP,
     RISCV_FEATURE_EPMP,
-    RISCV_FEATURE_MISA,
     RISCV_FEATURE_DEBUG
 };
 
@@ -498,6 +497,7 @@ struct RISCVCPUConfig {
     bool pmp;
     bool epmp;
     bool debug;
+    bool misa_w;
 
     bool short_isa_string;
 };
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index e149b453da..3cb8d2ffad 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1329,7 +1329,7 @@ static RISCVException read_misa(CPURISCVState *env, int csrno,
 static RISCVException write_misa(CPURISCVState *env, int csrno,
                                  target_ulong val)
 {
-    if (!riscv_feature(env, RISCV_FEATURE_MISA)) {
+    if (!riscv_cpu_cfg(env)->misa_w) {
         /* drop write to misa */
         return RISCV_EXCP_NONE;
     }
-- 
2.39.2


