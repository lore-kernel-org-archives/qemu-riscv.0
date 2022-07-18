Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oDHof-0006Jb-6b
	for mharc-qemu-riscv@gnu.org; Sun, 17 Jul 2022 23:53:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1oDHod-0006HE-A7
 for qemu-riscv@nongnu.org; Sun, 17 Jul 2022 23:53:03 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:39609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1oDHob-0002bb-3q
 for qemu-riscv@nongnu.org; Sun, 17 Jul 2022 23:53:02 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 v4-20020a17090abb8400b001ef966652a3so16947149pjr.4
 for <qemu-riscv@nongnu.org>; Sun, 17 Jul 2022 20:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=OSfNi9CRiDFuBtQzA4BMUUt8sk2+mA+9HeBF0nB1mxY=;
 b=JkbsqjMpYmWF3SbMumaI4mWDRAsUXBkI9mJVGp7b72oBOdhw82B/W11tZI+U6tUgpo
 oFTzCyFTL6UM2ieYB4iLPAz8aEXuKSi4ntufq8GD5uAALEtPKIaCMY/sPxA3+/CEotra
 gpDRi0kvM6zx5fWNoudROErkQ2SyzrMLER3HqvSkheZ17aDO/WJQef2brrDh4pH80DuR
 Gtsi15rvHvOmzok5D0OM9Bt2IFAQu1hNX360xKsD0tufgqljBzLuaxqVh3QCAQSmMhZZ
 zcPfg+RWluiwphnOWsFDBLdycuZUPvvKirDf0UIdcAzRMAxXkCW7iSbYI9hRiivQVqgN
 JE0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=OSfNi9CRiDFuBtQzA4BMUUt8sk2+mA+9HeBF0nB1mxY=;
 b=er0sBpV1YdQ9JuHuzwv0PCD6Z9KT6mTL1dLpymyK28nJWlJJ5B2NfuDNfomCmYEKQk
 4Au8msz3Lhk36NkbCS/TvlooIT6C4ww5tFH8Sc0M4JGsd92/WhJDkgiw6XxSNeFNewBC
 QyOtazagckq6FDY4AqfPyKWA3AQ9N/aQO41tm7NqW7+Q9DqLNLCr+pqwRq4x2CGCQamF
 Bu6vYfjSPoFJysC/kWr1U00MJJ2kjPME6NDD2Ov8dGI/u0RozUYbwodrkUqQUP3a5Tv7
 bEAncm681J8Ol8JlOKclvBfFcMlliEwoT+YamrmxgcqbLTEyWiJJqeJn+JGbgluaY2t6
 Qtrw==
X-Gm-Message-State: AJIora/D3hnycJnCjOsn7Q82KMC5WM2IauowRuwsCjmOo2Ax/W5bQSqB
 7EJVnbM//JwHKk3GoovwV5pwkA==
X-Google-Smtp-Source: AGRyM1v8gLWfZ+AQ+vwRgFxW/yXBXBtYpQPZz9RhXFt9YPERmnm20AtpA9fm/us9sSnbow0f8t9i1g==
X-Received: by 2002:a17:903:249:b0:16b:9cf3:596e with SMTP id
 j9-20020a170903024900b0016b9cf3596emr25922243plh.60.1658116379034; 
 Sun, 17 Jul 2022 20:52:59 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 ij8-20020a170902ab4800b0016c066e566bsm8041019plb.164.2022.07.17.20.52.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jul 2022 20:52:58 -0700 (PDT)
From: Jim Shu <jim.shu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Jim Shu <jim.shu@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH] target/riscv: Support SW update of PTE A/D bits and Ssptwad
 extension
Date: Mon, 18 Jul 2022 03:52:26 +0000
Message-Id: <20220718035249.17440-1-jim.shu@sifive.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=jim.shu@sifive.com; helo=mail-pj1-x1031.google.com
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
X-List-Received-Date: Mon, 18 Jul 2022 03:53:03 -0000

RISC-V priv spec v1.12 permits 2 PTE-update schemes of A/D-bit
(Access/Dirty bit): HW update or SW update. RISC-V profile defines the
extension name 'Ssptwad' for HW update to PTE A/D bits.
https://github.com/riscv/riscv-profiles/blob/main/profiles.adoc

Current QEMU RISC-V implements HW update scheme, so this commit
introduces SW update scheme to QEMU and uses the 'Ssptwad' extension
as the CPU option to select 2 PTE-update schemes. QEMU RISC-V CPU still
uses HW update scheme (ext_ssptwad=true) by default to keep the backward
compatibility.

SW update scheme implemention is based on priv spec v1.12:
"When a virtual page is accessed and the A bit is clear, or is written
and the D bit is clear, a page-fault exception (corresponding to the
original access type) is raised."

Signed-off-by: Jim Shu <jim.shu@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu.c        | 2 ++
 target/riscv/cpu.h        | 1 +
 target/riscv/cpu_helper.c | 9 +++++++++
 3 files changed, 12 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1bb3973806..1d38c1c1d2 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -857,6 +857,7 @@ static void riscv_cpu_init(Object *obj)
 
     cpu->cfg.ext_ifencei = true;
     cpu->cfg.ext_icsr = true;
+    cpu->cfg.ext_ssptwad = true;
     cpu->cfg.mmu = true;
     cpu->cfg.pmp = true;
 
@@ -900,6 +901,7 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("svinval", RISCVCPU, cfg.ext_svinval, false),
     DEFINE_PROP_BOOL("svnapot", RISCVCPU, cfg.ext_svnapot, false),
     DEFINE_PROP_BOOL("svpbmt", RISCVCPU, cfg.ext_svpbmt, false),
+    DEFINE_PROP_BOOL("ssptwad", RISCVCPU, cfg.ext_ssptwad, true),
 
     DEFINE_PROP_BOOL("zba", RISCVCPU, cfg.ext_zba, true),
     DEFINE_PROP_BOOL("zbb", RISCVCPU, cfg.ext_zbb, true),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 5c7acc055a..2eee59af98 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -433,6 +433,7 @@ struct RISCVCPUConfig {
     bool ext_zve32f;
     bool ext_zve64f;
     bool ext_zmmul;
+    bool ext_ssptwad;
     bool rvv_ta_all_1s;
 
     uint32_t mvendorid;
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 59b3680b1b..a8607c0d7b 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -981,6 +981,15 @@ restart:
 
             /* Page table updates need to be atomic with MTTCG enabled */
             if (updated_pte != pte) {
+                if (!cpu->cfg.ext_ssptwad) {
+                    /*
+                     * If A/D bits are managed by SW, HW just raises the
+                     * page fault exception corresponding to the original
+                     * access type when A/D bits need to be updated.
+                     */
+                    return TRANSLATE_FAIL;
+                }
+
                 /*
                  * - if accessed or dirty bits need updating, and the PTE is
                  *   in RAM, then we do so atomically with a compare and swap.
-- 
2.17.1


