Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nhkXH-0004yY-AA
	for mharc-qemu-riscv@gnu.org; Fri, 22 Apr 2022 00:04:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nhkXF-0004xN-Ut
 for qemu-riscv@nongnu.org; Fri, 22 Apr 2022 00:04:45 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:33537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nhkXD-0000I0-Ku
 for qemu-riscv@nongnu.org; Fri, 22 Apr 2022 00:04:45 -0400
Received: by mail-pl1-x633.google.com with SMTP id c23so8193907plo.0
 for <qemu-riscv@nongnu.org>; Thu, 21 Apr 2022 21:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TgdHAxqucwcWuUdvW2Ct2lWgjV0L5B12+Jl2GPsSxa8=;
 b=bmqmuHnaKdmtyNbcoPfoAtOT+J+VT371GUH5EYj+/h2SBm0In4BZwgagfMurZy5UIc
 8VKwqPIf+vSixW0YnDEWjaOO1Vt4CEF3c+wi0LSoo89c4rhd0lC221ayNZJ99saW14zo
 JvmNuoQjLg776YtvEYzl477Wz02SZIGICh+cAtRknM8p1eEbafvi2e9z/LABw3lAWF3Q
 8pm0uOVoFHaCayTzhxIWnyBGydK5WfU3w8pJhc9m+tGHt3iqt0RX7UC6vaSvLrGlwaLu
 OKRFlELJZEzb5mv0WP482Wnx1BO+0xIM4QxFpWvnbilF77IxSe8yChN34tamnGPqWPaC
 7EyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TgdHAxqucwcWuUdvW2Ct2lWgjV0L5B12+Jl2GPsSxa8=;
 b=SH50WNvNLaj6/PTUMDX+N13TULazRPr0zLGAvkw/Kp2noWGSnPyk/7Wqg2NKZAICUO
 J2R3miToSmxCJA/PcygppaiHJQhZPLrjQVAMn7zz7TGv/a6eNcJDEM304UJUWgovm0aP
 4qqjHWgD82JAvQxxxp0+rmBmgEPwxNp5k71spRJvcPvdunZpep5CQ1EHZKFiA8flyBk/
 5B7P/ON03quCVU8je8lq0xuEFqAJzQjBHfHmB03FB2ZuiY+xQoQV0A9AbC44EFAWH6g9
 ms9RHsELGEqZNXK6pFsJ2EZtJ2RVlllbh57qJgQ+J7Xy+qMOpG9p4uixyG4n0UE2qT2+
 /hWQ==
X-Gm-Message-State: AOAM531hNwNVAVGHId34ASbPTGYyCKvoDqJETk6V8rqlacxFGC6/nRvc
 VgIkEm6YCOCbMPiDRz5mNy6s3A==
X-Google-Smtp-Source: ABdhPJxXqbUIsbhmuVWPaYutBUkLTP8rHCDIwPSwYhPxteSMA59GxOuWwZrzqR5TXP0/hEcL/PxfjQ==
X-Received: by 2002:a17:90b:3903:b0:1d2:c8ea:4c9c with SMTP id
 ob3-20020a17090b390300b001d2c8ea4c9cmr3143436pjb.210.1650600281948; 
 Thu, 21 Apr 2022 21:04:41 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 g13-20020a62520d000000b0050a923a7754sm636877pfb.119.2022.04.21.21.04.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 21:04:41 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Jim Shu <jim.shu@sifive.com>, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bmeng.cn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v3] target/riscv: Support configuarable marchid, mvendorid,
 mipid CSR values
Date: Fri, 22 Apr 2022 12:04:34 +0800
Message-Id: <20220422040436.2233-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 22 Apr 2022 04:04:46 -0000

From: Frank Chang <frank.chang@sifive.com>

Allow user to set core's marchid, mvendorid, mipid CSRs through
-cpu command line option.

The default values of marchid and mipid are built with QEMU's version
numbers.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Jim Shu <jim.shu@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 target/riscv/cpu.c |  9 +++++++++
 target/riscv/cpu.h |  4 ++++
 target/riscv/csr.c | 38 ++++++++++++++++++++++++++++++++++----
 3 files changed, 47 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 0c774056c5..ace68ed855 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -34,6 +34,11 @@
 
 /* RISC-V CPU definitions */
 
+#define RISCV_CPU_MARCHID   ((QEMU_VERSION_MAJOR << 16) | \
+                             (QEMU_VERSION_MINOR << 8)  | \
+                             (QEMU_VERSION_MICRO))
+#define RISCV_CPU_MIPID     RISCV_CPU_MARCHID
+
 static const char riscv_single_letter_exts[] = "IEMAFDQCPVH";
 
 struct isa_ext_data {
@@ -810,6 +815,10 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
     DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
 
+    DEFINE_PROP_UINT32("mvendorid", RISCVCPU, cfg.mvendorid, 0),
+    DEFINE_PROP_UINT64("marchid", RISCVCPU, cfg.marchid, RISCV_CPU_MARCHID),
+    DEFINE_PROP_UINT64("mipid", RISCVCPU, cfg.mipid, RISCV_CPU_MIPID),
+
     DEFINE_PROP_BOOL("svinval", RISCVCPU, cfg.ext_svinval, false),
     DEFINE_PROP_BOOL("svnapot", RISCVCPU, cfg.ext_svnapot, false),
     DEFINE_PROP_BOOL("svpbmt", RISCVCPU, cfg.ext_svpbmt, false),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 34c22d5d3b..46c66fbf8e 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -393,6 +393,10 @@ struct RISCVCPUConfig {
     bool ext_zve32f;
     bool ext_zve64f;
 
+    uint32_t mvendorid;
+    uint64_t marchid;
+    uint64_t mipid;
+
     /* Vendor-specific custom extensions */
     bool ext_XVentanaCondOps;
 
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 6ba85e7b5d..1c2d3f7193 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -612,6 +612,36 @@ static RISCVException write_ignore(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
+static RISCVException read_mvendorid(CPURISCVState *env, int csrno,
+                                     target_ulong *val)
+{
+    CPUState *cs = env_cpu(env);
+    RISCVCPU *cpu = RISCV_CPU(cs);
+
+    *val = cpu->cfg.mvendorid;
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException read_marchid(CPURISCVState *env, int csrno,
+                                   target_ulong *val)
+{
+    CPUState *cs = env_cpu(env);
+    RISCVCPU *cpu = RISCV_CPU(cs);
+
+    *val = cpu->cfg.marchid;
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException read_mipid(CPURISCVState *env, int csrno,
+                                 target_ulong *val)
+{
+    CPUState *cs = env_cpu(env);
+    RISCVCPU *cpu = RISCV_CPU(cs);
+
+    *val = cpu->cfg.mipid;
+    return RISCV_EXCP_NONE;
+}
+
 static RISCVException read_mhartid(CPURISCVState *env, int csrno,
                                    target_ulong *val)
 {
@@ -3260,10 +3290,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MINSTRETH] = { "minstreth", any32, read_instreth },
 
     /* Machine Information Registers */
-    [CSR_MVENDORID] = { "mvendorid", any,   read_zero    },
-    [CSR_MARCHID]   = { "marchid",   any,   read_zero    },
-    [CSR_MIMPID]    = { "mimpid",    any,   read_zero    },
-    [CSR_MHARTID]   = { "mhartid",   any,   read_mhartid },
+    [CSR_MVENDORID] = { "mvendorid", any,   read_mvendorid },
+    [CSR_MARCHID]   = { "marchid",   any,   read_marchid   },
+    [CSR_MIMPID]    = { "mimpid",    any,   read_mipid     },
+    [CSR_MHARTID]   = { "mhartid",   any,   read_mhartid   },
 
     [CSR_MCONFIGPTR]  = { "mconfigptr", any,   read_zero,
                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
-- 
2.35.1


