Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9S6L-0001iy-Kr
	for mharc-qemu-riscv@gnu.org; Mon, 17 Jan 2022 08:31:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n9S5T-0001Me-K0
 for qemu-riscv@nongnu.org; Mon, 17 Jan 2022 08:30:20 -0500
Received: from [2607:f8b0:4864:20::62f] (port=40564
 helo=mail-pl1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n9S5N-0000pj-Rx
 for qemu-riscv@nongnu.org; Mon, 17 Jan 2022 08:30:16 -0500
Received: by mail-pl1-x62f.google.com with SMTP id b3so12158004plc.7
 for <qemu-riscv@nongnu.org>; Mon, 17 Jan 2022 05:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3nsDPgbxXT0RftBOVWKLNr91iXQOw4zty79cR5/Fa/E=;
 b=JWZHJ9gi2nRZXcv1ifovMY+zJwhn1Lt2FznCkiXnpk+1OkZQlQuxe8EqC3zYTJXmea
 ok9O2diCD51GagOieuT/7WLTRo8UxV1lEFLUbuGrOWqcWKUPUC3aXoaQd+mqQ4YLs3Ea
 0MfWz8vEPSRAZ74dKF5LZGIIeg0ry+8mGyNX5+cGTQQw3uKm9ZfSx/2nGVbUPimZ6XQt
 4Ilm95wq23UiNWP0jtuMKQ2nHN4+tpMSddufAeinvWvNMhCWWdcXqqYAAETX1XkS8bPa
 uerAzAe6LpKaalyHTTQlZv7lMc0iXgxBBA12HQ4qqS0gfwZgcesFxd4ny5sY41Tv3JAZ
 sCnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3nsDPgbxXT0RftBOVWKLNr91iXQOw4zty79cR5/Fa/E=;
 b=ghUMWIPVfkBL1JZO1sS9Hx4b1XY4gWV5P1OLvvHMJcSKUkkmD688SXsIwgqI62WhkB
 tNOHIJJn4rG9Dy8yMLqxO4UUwSfh4QwoxPy1rRuoaYlJ7Bf6RM+mvWNy9DxWq19BfN7L
 bOVOPzMTxaBqsrUuDFY9YRzJVpmuNdZ6YYeLEK07Wza+wEEdBsLLvwQRwhWt0acPZ4T1
 fUEo4Q2hC9YYrC3ivuketPwo9X9jXt4Zc5BWWZSItAQtl/9bMHNbisr0X422yNagBTLr
 Vw3WGUKhXkMOwZEkrrS8MM7cQ0vyUfF3+SNe62LnOM21Qz90Ib2d3rMaDJKephoQbAdP
 CqbA==
X-Gm-Message-State: AOAM533YmxrKiIZhiBk+/Gy34v0wA3kf5c91sZEvF82oMyXkhJMrYVOw
 FV1nb21Ze6Lf2/sbl0r14w5sBA==
X-Google-Smtp-Source: ABdhPJwV+iOf/oPXQi289mF3/UHgVUEo4hLskHAqB4SjYNYnHS+YjWsaPsuBZ2XFvsCRbSGz07zQ9A==
X-Received: by 2002:a17:903:11c3:b0:14a:58c4:f34c with SMTP id
 q3-20020a17090311c300b0014a58c4f34cmr22119295plh.151.1642426203487; 
 Mon, 17 Jan 2022 05:30:03 -0800 (PST)
Received: from localhost.localdomain ([122.179.70.109])
 by smtp.gmail.com with ESMTPSA id 7sm9532607pfm.25.2022.01.17.05.29.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 05:30:02 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v7 12/23] target/riscv: Implement AIA interrupt filtering CSRs
Date: Mon, 17 Jan 2022 18:58:15 +0530
Message-Id: <20220117132826.426418-13-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220117132826.426418-1-anup@brainfault.org>
References: <20220117132826.426418-1-anup@brainfault.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62f
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::62f;
 envelope-from=anup@brainfault.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 17 Jan 2022 13:30:24 -0000

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
index f0d8cb097b..d018cbae72 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -154,6 +154,15 @@ static RISCVException any32(CPURISCVState *env, int csrno)
 
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
@@ -553,6 +562,12 @@ static RISCVException read_zero(CPURISCVState *env, int csrno,
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
@@ -2524,9 +2539,15 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
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
@@ -2580,12 +2601,14 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
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


