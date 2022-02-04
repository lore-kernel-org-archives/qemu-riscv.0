Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nG2hM-0005qX-9R
	for mharc-qemu-riscv@gnu.org; Fri, 04 Feb 2022 12:48:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nG2hG-0005kO-0o
 for qemu-riscv@nongnu.org; Fri, 04 Feb 2022 12:48:34 -0500
Received: from [2a00:1450:4864:20::429] (port=37619
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nG2hC-0003uh-Rk
 for qemu-riscv@nongnu.org; Fri, 04 Feb 2022 12:48:32 -0500
Received: by mail-wr1-x429.google.com with SMTP id w11so12739332wra.4
 for <qemu-riscv@nongnu.org>; Fri, 04 Feb 2022 09:48:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YbfdSx7eK3gPEz2ZUK6pK/RyjIZy0OjB/6uDwADy6Mg=;
 b=ZNLRCcSoeLYGf85F+53Ffz4t1RJdCovUcSqq4hhfSarZjYBNQfQxyabJf2wqqP6MMu
 azifPnIKPetj7PiHoaEwN4LZTmE+af0Wv3tee5rxtn+neCUV7XUebq+KnoeZmNCcvxo6
 4crkSbKVRESH+0n4sx1C0TCdrV5a0/6AZIsETeNgmNKl1z8zCigVYv/XG/VoknLDPBH/
 vq278/q4bAb908XA1RstY2OebSZGyTmlpJIeueBCl1uf3DtOyprmcc4cRoDhbA9M0tQ6
 iZQV+ktmwh4J1Usu1oDfbdgrbOPG+oeeOCMArqS9b4OkYvXCv28TaHX3kiK3l7BIKB6B
 kQtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YbfdSx7eK3gPEz2ZUK6pK/RyjIZy0OjB/6uDwADy6Mg=;
 b=gwrEhLJGe2S+FQHf2Wuyh1w3VtTZ/hadNTm/ok3Bbu41JBaxGHDEz/BMN44sT0YCWm
 wjxbVuM6lZFpbTVWk/YEjtY7hdWTtTAZpWwEoNvmRSqBsLiQlb6gAaGDhZvMCYuJEM96
 sGAF1g5Tdi1naVyiw9Pu67quERjOXUqieeNIg0ChpltCCzBZHF/41mjKM8GBII8x6Z3S
 ui0ssnxxrBhBvM1LS87eIhDMi6TxGWe3UlEmtDywrsN/DUjZpxIALYnIOiBAv+II2OjZ
 3NNoqBcke/fOzxAA/UrIgu6slLSaBDj1RjyP7E/7hY3bATszqyv0SZdr3NqhCfpleoK/
 Gj9A==
X-Gm-Message-State: AOAM533Ounu/ppQCgKcLb2BEnqYMYdfRq3vO9hviCjCKIhIpJ8pbsgKc
 hQLs0MUSYWsamFcw2IBoL7AL2QmdMqUNKA==
X-Google-Smtp-Source: ABdhPJzrh97D6PD+xB/deRtDSuo2owMeiPLHE6ATQHkgdvHZWffaX0PFF6LvIQnmf0hTS1ZlEA0/Zg==
X-Received: by 2002:a05:6000:16c8:: with SMTP id
 h8mr3336583wrf.693.1643996895311; 
 Fri, 04 Feb 2022 09:48:15 -0800 (PST)
Received: from localhost.localdomain ([122.167.157.188])
 by smtp.gmail.com with ESMTPSA id f13sm11381876wmq.29.2022.02.04.09.48.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 09:48:14 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v9 12/23] target/riscv: Implement AIA interrupt filtering CSRs
Date: Fri,  4 Feb 2022 23:16:48 +0530
Message-Id: <20220204174700.534953-13-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220204174700.534953-1-anup@brainfault.org>
References: <20220204174700.534953-1-anup@brainfault.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::429;
 envelope-from=anup@brainfault.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
X-List-Received-Date: Fri, 04 Feb 2022 17:48:34 -0000

From: Anup Patel <anup.patel@wdc.com>

The AIA specificaiton adds interrupt filtering support for M-mode
and HS-mode. Using AIA interrupt filtering M-mode and H-mode can
take local interrupt 13 or above and selectively inject same local
interrupt to lower privilege modes.

At the moment, we don't have any local interrupts above 12 so we
add dummy implementation (i.e. read zero and ignore write) of AIA
interrupt filtering CSRs.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/csr.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 552dae1ef8..00f55f47ed 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -158,6 +158,15 @@ static RISCVException any32(CPURISCVState *env, int csrno)
 
 }
 
+static int aia_any(CPURISCVState *env, int csrno)
+{
+    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    return any(env, csrno);
+}
+
 static int aia_any32(CPURISCVState *env, int csrno)
 {
     if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
@@ -568,6 +577,12 @@ static RISCVException read_zero(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
+static RISCVException write_ignore(CPURISCVState *env, int csrno,
+                                   target_ulong val)
+{
+    return RISCV_EXCP_NONE;
+}
+
 static RISCVException read_mhartid(CPURISCVState *env, int csrno,
                                    target_ulong *val)
 {
@@ -2598,9 +2613,15 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MTVAL]    = { "mtval",    any,  read_mtval,    write_mtval    },
     [CSR_MIP]      = { "mip",      any,  NULL,    NULL, rmw_mip        },
 
+    /* Virtual Interrupts for Supervisor Level (AIA) */
+    [CSR_MVIEN]      = { "mvien", aia_any, read_zero, write_ignore },
+    [CSR_MVIP]       = { "mvip",  aia_any, read_zero, write_ignore },
+
     /* Machine-Level High-Half CSRs (AIA) */
     [CSR_MIDELEGH] = { "midelegh", aia_any32, NULL, NULL, rmw_midelegh },
     [CSR_MIEH]     = { "mieh",     aia_any32, NULL, NULL, rmw_mieh     },
+    [CSR_MVIENH]   = { "mvienh",   aia_any32, read_zero,  write_ignore },
+    [CSR_MVIPH]    = { "mviph",    aia_any32, read_zero,  write_ignore },
     [CSR_MIPH]     = { "miph",     aia_any32, NULL, NULL, rmw_miph     },
 
     /* Supervisor Trap Setup */
@@ -2654,12 +2675,14 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MTINST]      = { "mtinst",      hmode,   read_mtinst,      write_mtinst      },
 
     /* Virtual Interrupts and Interrupt Priorities (H-extension with AIA) */
+    [CSR_HVIEN]       = { "hvien",       aia_hmode, read_zero, write_ignore },
     [CSR_HVICTL]      = { "hvictl",      aia_hmode, read_hvictl, write_hvictl },
     [CSR_HVIPRIO1]    = { "hviprio1",    aia_hmode, read_hviprio1,   write_hviprio1 },
     [CSR_HVIPRIO2]    = { "hviprio2",    aia_hmode, read_hviprio2,   write_hviprio2 },
 
     /* Hypervisor and VS-Level High-Half CSRs (H-extension with AIA) */
     [CSR_HIDELEGH]    = { "hidelegh",    aia_hmode32, NULL, NULL, rmw_hidelegh },
+    [CSR_HVIENH]      = { "hvienh",      aia_hmode32, read_zero, write_ignore },
     [CSR_HVIPH]       = { "hviph",       aia_hmode32, NULL, NULL, rmw_hviph },
     [CSR_HVIPRIO1H]   = { "hviprio1h",   aia_hmode32, read_hviprio1h, write_hviprio1h },
     [CSR_HVIPRIO2H]   = { "hviprio2h",   aia_hmode32, read_hviprio2h, write_hviprio2h },
-- 
2.25.1


