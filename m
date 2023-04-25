Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1prPNa-0007MK-Jc
	for mharc-qemu-riscv@gnu.org; Tue, 25 Apr 2023 16:35:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dfustini@baylibre.com>)
 id 1prPNY-0007LC-JQ
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 16:35:12 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dfustini@baylibre.com>)
 id 1prPNV-0002i5-Ol
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 16:35:12 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1a9253d4551so50203535ad.0
 for <qemu-riscv@nongnu.org>; Tue, 25 Apr 2023 13:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1682454908; x=1685046908; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GhPIkBqwZ2QWKZzsQQCYpaum8E1A6iG6Z+AlQP2xdwU=;
 b=4K9H+SC2tHOrhxlgKs16a8gFoCpVkK0p4tk1DA9VQmdOoE8VZxWpoJLoaoNDd2RL8y
 opuKVkwEgBsZ0sFz0KExWviBnKVeBAkO8j0mVsuQpMv7hVfcgWkX682Oz5qbPhfdJKV2
 7I9VI+bTbY0DapTdqCcUNbkILymP49cFKqKn5ekc7kgYQotHeGqvxmym+g5dwtV67eSt
 aU3AnSJywCxLu5pZQZH6i47TUr72Zh9PjEec2U8Grf5U+N7Q2y897TX5u7+8WGRwKPZr
 IdSx04Mgm8ugb57E3xjBC8UvhYnz5CWdGP9eLHgBcRbRkIGBSnbU2PPkCnoxFUWTM7V0
 qeew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682454908; x=1685046908;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GhPIkBqwZ2QWKZzsQQCYpaum8E1A6iG6Z+AlQP2xdwU=;
 b=bQIsIwZjKzC7YrXLViFaNVavE7Vlz/DcRr9ACBxfO843uZ3CKhRNb8GiGWIGsDOlla
 kwBMx2/ckkqReMCLBb+7xVpKM8gt48rZoKHwZyt/v52UeZ3/3+mV6Vu2UjSKYM/jRp9N
 LpBXjPwD4Nb0+3WDj/cK9AB1Lo8iozX5bzQUWXF2zywKmjy23zg1jPoJWzsMs1Ggrhev
 Sjr5iB+jXiEBg1DFLHmy2RBRoLW+Mtvz+HhT7KYmLNOqiTd0qbjWbamX9WCZ4cz903gL
 dOn0KEzmoGRM2zBtSLdCvnxjsj76TFkz5lHCF8Gqe7A75BXKOsJLmjCrNi8jegwTupMp
 70Gg==
X-Gm-Message-State: AAQBX9d42eTa/xLDWFSGbW+KJTAycqgdMIdtthLyjpKj1dNByIboTYnt
 JvhhJc0qljEVCjNYs0gp+DrMOw==
X-Google-Smtp-Source: AKy350Yr9BNzQUGXaBogyS3jHYQCA2a8L1XaXaBEQZANzWa1OfI6+M90qFLb0fcGvHFIhnnv3xGg9g==
X-Received: by 2002:a17:902:eb89:b0:1a2:3108:5cc9 with SMTP id
 q9-20020a170902eb8900b001a231085cc9mr20109790plg.40.1682454907910; 
 Tue, 25 Apr 2023 13:35:07 -0700 (PDT)
Received: from x1.hsd1.or.comcast.net
 ([2601:1c2:1800:f680:b08a:7f49:1848:42ff])
 by smtp.gmail.com with ESMTPSA id
 ep8-20020a17090ae64800b0024739e4ad02sm762752pjb.28.2023.04.25.13.35.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 13:35:07 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
To: Ved Shanbhogue <ved@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Nicolas Pitre <npitre@baylibre.com>,
 Adrien Ricciardi <aricciardi@baylibre.com>,
 =?UTF-8?q?Kornel=20Dul=C4=99ba?= <mindal@semihalf.com>
Cc: Drew Fustini <dfustini@baylibre.com>
Subject: [RFC PATCH v2 1/9] riscv: implement Ssqosid extension and sqoscfg CSR
Date: Tue, 25 Apr 2023 13:38:26 -0700
Message-Id: <20230425203834.1135306-2-dfustini@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425203834.1135306-1-dfustini@baylibre.com>
References: <20230425203834.1135306-1-dfustini@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=dfustini@baylibre.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 25 Apr 2023 20:35:12 -0000

From: Kornel Dulęba <mindal@semihalf.com>

Implement the sqoscfg CSR defined by the Ssqosid ISA extension
(Supervisor-mode Quality of Service ID). The CSR contains two fields:

  - Resource Control ID (RCID) used determine resource allocation
  - Monitoring Counter ID (MCID) used to track resource usage

The CSR is defined for S-mode but accessing it when V=1 shall cause a
virtual instruction exception. Implement this behavior by calling the
hmode predicate.

Link: https://github.com/riscv-non-isa/riscv-cbqri/blob/main/riscv-cbqri.pdf
Signed-off-by: Kornel Dulęba <mindal@semihalf.com>
[dfustini: rebase on v8.0.50, reword commit message]
Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
Changes since v1:
- rebase on current master (v8.0.50) instead of 8.0.0-rc4

 disas/riscv.c           |  1 +
 target/riscv/cpu.c      |  2 ++
 target/riscv/cpu.h      |  3 +++
 target/riscv/cpu_bits.h |  5 +++++
 target/riscv/csr.c      | 34 ++++++++++++++++++++++++++++++++++
 5 files changed, 45 insertions(+)

diff --git a/disas/riscv.c b/disas/riscv.c
index d6b0fbe5e877..94336f54637b 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -2100,6 +2100,7 @@ static const char *csr_name(int csrno)
     case 0x0143: return "stval";
     case 0x0144: return "sip";
     case 0x0180: return "satp";
+    case 0x0181: return "sqoscfg";
     case 0x0200: return "hstatus";
     case 0x0202: return "hedeleg";
     case 0x0203: return "hideleg";
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1e97473af27b..fb3f8c43a32d 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -114,6 +114,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(smaia, true, PRIV_VERSION_1_12_0, ext_smaia),
     ISA_EXT_DATA_ENTRY(ssaia, true, PRIV_VERSION_1_12_0, ext_ssaia),
     ISA_EXT_DATA_ENTRY(sscofpmf, true, PRIV_VERSION_1_12_0, ext_sscofpmf),
+    ISA_EXT_DATA_ENTRY(ssqosid, true, PRIV_VERSION_1_12_0, ext_ssqosid),
     ISA_EXT_DATA_ENTRY(sstc, true, PRIV_VERSION_1_12_0, ext_sstc),
     ISA_EXT_DATA_ENTRY(svadu, true, PRIV_VERSION_1_12_0, ext_svadu),
     ISA_EXT_DATA_ENTRY(svinval, true, PRIV_VERSION_1_12_0, ext_svinval),
@@ -1397,6 +1398,7 @@ static Property riscv_cpu_extensions[] = {
 
     DEFINE_PROP_BOOL("svadu", RISCVCPU, cfg.ext_svadu, true),
 
+    DEFINE_PROP_BOOL("ssqosid", RISCVCPU, cfg.ext_ssqosid, true),
     DEFINE_PROP_BOOL("svinval", RISCVCPU, cfg.ext_svinval, false),
     DEFINE_PROP_BOOL("svnapot", RISCVCPU, cfg.ext_svnapot, false),
     DEFINE_PROP_BOOL("svpbmt", RISCVCPU, cfg.ext_svpbmt, false),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 638e47c75a57..ffc1b5009d15 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -222,6 +222,8 @@ struct CPUArchState {
     target_ulong mcause;
     target_ulong mtval;  /* since: priv-1.10.0 */
 
+    target_ulong sqoscfg;
+
     /* Machine and Supervisor interrupt priorities */
     uint8_t miprio[64];
     uint8_t siprio[64];
@@ -454,6 +456,7 @@ struct RISCVCPUConfig {
     bool ext_icboz;
     bool ext_zicond;
     bool ext_zihintpause;
+    bool ext_ssqosid;
     bool ext_smstateen;
     bool ext_sstc;
     bool ext_svadu;
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index fca7ef0cef91..d11a3928735e 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -217,6 +217,7 @@
 /* Supervisor Protection and Translation */
 #define CSR_SPTBR           0x180
 #define CSR_SATP            0x180
+#define CSR_SQOSCFG         0x181
 
 /* Supervisor-Level Window to Indirectly Accessed Registers (AIA) */
 #define CSR_SISELECT        0x150
@@ -898,4 +899,8 @@ typedef enum RISCVException {
 #define MHPMEVENT_IDX_MASK                 0xFFFFF
 #define MHPMEVENT_SSCOF_RESVD              16
 
+/* SQOSCFG BITS (QOSID) */
+#define SQOSCFG_RCID                      0x00000FFF
+#define SQOSCFG_MCID                      0x0FFF0000
+
 #endif
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index d522efc0b63a..5769b3545704 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -2700,6 +2700,37 @@ static RISCVException write_satp(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
+static RISCVException check_sqoscfg(CPURISCVState *env, int csrno)
+{
+    RISCVCPU *cpu = env_archcpu(env);
+
+    if (!cpu->cfg.ext_ssqosid) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    /*
+     * Even though this is an S-mode CSR the spec says that we need to throw
+     * and virt instruction fault if a guest tries to access it.
+     */
+    return hmode(env, csrno);
+}
+
+static RISCVException read_sqoscfg(CPURISCVState *env, int csrno,
+                                target_ulong *val)
+{
+    *val = env->sqoscfg;
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_sqoscfg(CPURISCVState *env, int csrno,
+                                 target_ulong val)
+{
+    env->sqoscfg = val & (SQOSCFG_RCID | SQOSCFG_MCID);
+    return RISCV_EXCP_NONE;
+}
+
+
+
 static int read_vstopi(CPURISCVState *env, int csrno, target_ulong *val)
 {
     int irq, ret;
@@ -4182,6 +4213,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     /* Supervisor Protection and Translation */
     [CSR_SATP]     = { "satp",     smode, read_satp,     write_satp     },
 
+    /* Supervisor-Level Quality of Service Identifier */
+    [CSR_SQOSCFG]  = { "sqoscfg",  check_sqoscfg, read_sqoscfg, write_sqoscfg },
+
     /* Supervisor-Level Window to Indirectly Accessed Registers (AIA) */
     [CSR_SISELECT]   = { "siselect",   aia_smode, NULL, NULL, rmw_xiselect },
     [CSR_SIREG]      = { "sireg",      aia_smode, NULL, NULL, rmw_xireg },
-- 
2.34.1


