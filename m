Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nG2hN-0005v4-C6
	for mharc-qemu-riscv@gnu.org; Fri, 04 Feb 2022 12:48:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nG2hL-0005my-FG
 for qemu-riscv@nongnu.org; Fri, 04 Feb 2022 12:48:39 -0500
Received: from [2a00:1450:4864:20::431] (port=40508
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nG2hE-0003wv-Rh
 for qemu-riscv@nongnu.org; Fri, 04 Feb 2022 12:48:39 -0500
Received: by mail-wr1-x431.google.com with SMTP id s18so12720553wrv.7
 for <qemu-riscv@nongnu.org>; Fri, 04 Feb 2022 09:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5iofbV+eQQr3W3ompIyVSp6/gtSl1Y7cNrfFo9LhVpQ=;
 b=sgh3zzFQWiZvDebQv+j3AqUSp5+aHxlClf+d5L/4IdWrCznAOH2YK5pOFm4liYDjI6
 FVTA+jB4H6Rv75HzfjEOWeFHJClrMh3PfpVKYuNvqiI8zBQvNVwI5Jx8IhfmBO3oq5CT
 bVJaBy8iGJkLRQ2KbN82H1AMMd7QBcTINVzFZu5KTo37UEed0/22ln9X7Z75tqkVe3Bi
 cPjwz0WhaNOyh0qoukkeY65A/ZmTe7FXvSuuyE2xHHuPn7d2S7OSBXe8UjBjKNlps8bb
 zNkVesrnjifsWg2qdo/UlmtqS4u33/MwdtrFIMZe5gWuDtYws0oyhYQIVnvIg7SJ3sUG
 4Xcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5iofbV+eQQr3W3ompIyVSp6/gtSl1Y7cNrfFo9LhVpQ=;
 b=mNK7ZxBE/LvF8LRfwMXEf+o8iUnZAkFQLwUUdPwDlfCMd5whX0HENJUA6WZoSQ2kCA
 wqIp1nisqbOKcXWpWpyjjIrSv7hnHPm4r7X6z9SS5SDQsIrRi48KDubBMLBKeFlCXZuY
 KslPilA6Xytx4LG0hvt6LYrgmS60Rk2yWup68Hw5NozI7AOn1tGbQoqosTtiBXun+f8w
 QqVPl/yuUjZUc3OZO5JzLuJzHmvgzJX48kPwn063Hnd2GfqFVzjRhDmfePtB7SoGzcYr
 QXzrhIohYvjjBJHMHbwNplMzMQoOQibqUJOGEJH+HFpZrhTV3J344nDqHXI11owu7cP8
 qh2Q==
X-Gm-Message-State: AOAM531q2ZdC7r6T1O16iktWcFiSLMddBV5zDnG/RhK4hdQjkW3AgFPG
 038GOsftc0D7I2zmsPabYfWneA==
X-Google-Smtp-Source: ABdhPJwAGpUNqeYsZ7fv6CYybHL24uBjxGV8ebi5HRQQhtET945imitpEtzV5RRJrlDVQ+yKcUByJg==
X-Received: by 2002:a5d:500c:: with SMTP id e12mr3430477wrt.187.1643996911018; 
 Fri, 04 Feb 2022 09:48:31 -0800 (PST)
Received: from localhost.localdomain ([122.167.157.188])
 by smtp.gmail.com with ESMTPSA id f13sm11381876wmq.29.2022.02.04.09.48.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 09:48:30 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v9 15/23] target/riscv: Implement AIA IMSIC interface CSRs
Date: Fri,  4 Feb 2022 23:16:51 +0530
Message-Id: <20220204174700.534953-16-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220204174700.534953-1-anup@brainfault.org>
References: <20220204174700.534953-1-anup@brainfault.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::431;
 envelope-from=anup@brainfault.org; helo=mail-wr1-x431.google.com
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
X-List-Received-Date: Fri, 04 Feb 2022 17:48:39 -0000

From: Anup Patel <anup.patel@wdc.com>

The AIA specification defines IMSIC interface CSRs for easy access
to the per-HART IMSIC registers without using indirect xiselect and
xireg CSRs. This patch implements the AIA IMSIC interface CSRs.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/csr.c | 203 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 203 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index f310bbdd8d..b320344a8f 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -942,6 +942,16 @@ static int aia_xlate_vs_csrno(CPURISCVState *env, int csrno)
         return CSR_VSISELECT;
     case CSR_SIREG:
         return CSR_VSIREG;
+    case CSR_SSETEIPNUM:
+        return CSR_VSSETEIPNUM;
+    case CSR_SCLREIPNUM:
+        return CSR_VSCLREIPNUM;
+    case CSR_SSETEIENUM:
+        return CSR_VSSETEIENUM;
+    case CSR_SCLREIENUM:
+        return CSR_VSCLREIENUM;
+    case CSR_STOPEI:
+        return CSR_VSTOPEI;
     default:
         return csrno;
     };
@@ -1094,6 +1104,178 @@ done:
     return RISCV_EXCP_NONE;
 }
 
+static int rmw_xsetclreinum(CPURISCVState *env, int csrno, target_ulong *val,
+                            target_ulong new_val, target_ulong wr_mask)
+{
+    int ret = -EINVAL;
+    bool set, pend, virt;
+    target_ulong priv, isel, vgein, xlen, nval, wmask;
+
+    /* Translate CSR number for VS-mode */
+    csrno = aia_xlate_vs_csrno(env, csrno);
+
+    /* Decode register details from CSR number */
+    virt = set = pend = false;
+    switch (csrno) {
+    case CSR_MSETEIPNUM:
+        priv = PRV_M;
+        set = true;
+        pend = true;
+        break;
+    case CSR_MCLREIPNUM:
+        priv = PRV_M;
+        pend = true;
+        break;
+    case CSR_MSETEIENUM:
+        priv = PRV_M;
+        set = true;
+        break;
+    case CSR_MCLREIENUM:
+        priv = PRV_M;
+        break;
+    case CSR_SSETEIPNUM:
+        priv = PRV_S;
+        set = true;
+        pend = true;
+        break;
+    case CSR_SCLREIPNUM:
+        priv = PRV_S;
+        pend = true;
+        break;
+    case CSR_SSETEIENUM:
+        priv = PRV_S;
+        set = true;
+        break;
+    case CSR_SCLREIENUM:
+        priv = PRV_S;
+        break;
+    case CSR_VSSETEIPNUM:
+        priv = PRV_S;
+        virt = true;
+        set = true;
+        pend = true;
+        break;
+    case CSR_VSCLREIPNUM:
+        priv = PRV_S;
+        virt = true;
+        pend = true;
+        break;
+    case CSR_VSSETEIENUM:
+        priv = PRV_S;
+        virt = true;
+        set = true;
+        break;
+    case CSR_VSCLREIENUM:
+        priv = PRV_S;
+        virt = true;
+        break;
+    default:
+         goto done;
+    };
+
+    /* IMSIC CSRs only available when machine implements IMSIC. */
+    if (!env->aia_ireg_rmw_fn[priv]) {
+        goto done;
+    }
+
+    /* Find the selected guest interrupt file */
+    vgein = (virt) ? get_field(env->hstatus, HSTATUS_VGEIN) : 0;
+
+    /* Selected guest interrupt file should be valid */
+    if (virt && (!vgein || env->geilen < vgein)) {
+        goto done;
+    }
+
+    /* Set/Clear CSRs always read zero */
+    if (val) {
+        *val = 0;
+    }
+
+    if (wr_mask) {
+        /* Get interrupt number */
+        new_val &= wr_mask;
+
+        /* Find target interrupt pending/enable register */
+        xlen = riscv_cpu_mxl_bits(env);
+        isel = (new_val / xlen);
+        isel *= (xlen / IMSIC_EIPx_BITS);
+        isel += (pend) ? ISELECT_IMSIC_EIP0 : ISELECT_IMSIC_EIE0;
+
+        /* Find the interrupt bit to be set/clear */
+        wmask = ((target_ulong)1) << (new_val % xlen);
+        nval = (set) ? wmask : 0;
+
+        /* Call machine specific IMSIC register emulation */
+        ret = env->aia_ireg_rmw_fn[priv](env->aia_ireg_rmw_fn_arg[priv],
+                                         AIA_MAKE_IREG(isel, priv, virt,
+                                                       vgein, xlen),
+                                         NULL, nval, wmask);
+    } else {
+        ret = 0;
+    }
+
+done:
+    if (ret) {
+        return (riscv_cpu_virt_enabled(env) && virt) ?
+               RISCV_EXCP_VIRT_INSTRUCTION_FAULT : RISCV_EXCP_ILLEGAL_INST;
+    }
+    return RISCV_EXCP_NONE;
+}
+
+static int rmw_xtopei(CPURISCVState *env, int csrno, target_ulong *val,
+                      target_ulong new_val, target_ulong wr_mask)
+{
+    bool virt;
+    int ret = -EINVAL;
+    target_ulong priv, vgein;
+
+    /* Translate CSR number for VS-mode */
+    csrno = aia_xlate_vs_csrno(env, csrno);
+
+    /* Decode register details from CSR number */
+    virt = false;
+    switch (csrno) {
+    case CSR_MTOPEI:
+        priv = PRV_M;
+        break;
+    case CSR_STOPEI:
+        priv = PRV_S;
+        break;
+    case CSR_VSTOPEI:
+        priv = PRV_S;
+        virt = true;
+        break;
+    default:
+        goto done;
+    };
+
+    /* IMSIC CSRs only available when machine implements IMSIC. */
+    if (!env->aia_ireg_rmw_fn[priv]) {
+        goto done;
+    }
+
+    /* Find the selected guest interrupt file */
+    vgein = (virt) ? get_field(env->hstatus, HSTATUS_VGEIN) : 0;
+
+    /* Selected guest interrupt file should be valid */
+    if (virt && (!vgein || env->geilen < vgein)) {
+        goto done;
+    }
+
+    /* Call machine specific IMSIC register emulation for TOPEI */
+    ret = env->aia_ireg_rmw_fn[priv](env->aia_ireg_rmw_fn_arg[priv],
+                    AIA_MAKE_IREG(ISELECT_IMSIC_TOPEI, priv, virt, vgein,
+                                  riscv_cpu_mxl_bits(env)),
+                    val, new_val, wr_mask);
+
+done:
+    if (ret) {
+        return (riscv_cpu_virt_enabled(env) && virt) ?
+               RISCV_EXCP_VIRT_INSTRUCTION_FAULT : RISCV_EXCP_ILLEGAL_INST;
+    }
+    return RISCV_EXCP_NONE;
+}
+
 static RISCVException read_mtvec(CPURISCVState *env, int csrno,
                                  target_ulong *val)
 {
@@ -2930,6 +3112,13 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     /* Machine-Level Interrupts (AIA) */
     [CSR_MTOPI]    = { "mtopi",    aia_any,   read_mtopi },
 
+    /* Machine-Level IMSIC Interface (AIA) */
+    [CSR_MSETEIPNUM] = { "mseteipnum", aia_any, NULL, NULL, rmw_xsetclreinum },
+    [CSR_MCLREIPNUM] = { "mclreipnum", aia_any, NULL, NULL, rmw_xsetclreinum },
+    [CSR_MSETEIENUM] = { "mseteienum", aia_any, NULL, NULL, rmw_xsetclreinum },
+    [CSR_MCLREIENUM] = { "mclreienum", aia_any, NULL, NULL, rmw_xsetclreinum },
+    [CSR_MTOPEI]     = { "mtopei",     aia_any, NULL, NULL, rmw_xtopei },
+
     /* Virtual Interrupts for Supervisor Level (AIA) */
     [CSR_MVIEN]      = { "mvien", aia_any, read_zero, write_ignore },
     [CSR_MVIP]       = { "mvip",  aia_any, read_zero, write_ignore },
@@ -2966,6 +3155,13 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     /* Supervisor-Level Interrupts (AIA) */
     [CSR_STOPI]      = { "stopi",      aia_smode, read_stopi },
 
+    /* Supervisor-Level IMSIC Interface (AIA) */
+    [CSR_SSETEIPNUM] = { "sseteipnum", aia_smode, NULL, NULL, rmw_xsetclreinum },
+    [CSR_SCLREIPNUM] = { "sclreipnum", aia_smode, NULL, NULL, rmw_xsetclreinum },
+    [CSR_SSETEIENUM] = { "sseteienum", aia_smode, NULL, NULL, rmw_xsetclreinum },
+    [CSR_SCLREIENUM] = { "sclreienum", aia_smode, NULL, NULL, rmw_xsetclreinum },
+    [CSR_STOPEI]     = { "stopei",     aia_smode, NULL, NULL, rmw_xtopei },
+
     /* Supervisor-Level High-Half CSRs (AIA) */
     [CSR_SIEH]       = { "sieh",   aia_smode32, NULL, NULL, rmw_sieh },
     [CSR_SIPH]       = { "siph",   aia_smode32, NULL, NULL, rmw_siph },
@@ -3011,6 +3207,13 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     /* VS-Level Interrupts (H-extension with AIA) */
     [CSR_VSTOPI]      = { "vstopi",      aia_hmode, read_vstopi },
 
+    /* VS-Level IMSIC Interface (H-extension with AIA) */
+    [CSR_VSSETEIPNUM] = { "vsseteipnum", aia_hmode, NULL, NULL, rmw_xsetclreinum },
+    [CSR_VSCLREIPNUM] = { "vsclreipnum", aia_hmode, NULL, NULL, rmw_xsetclreinum },
+    [CSR_VSSETEIENUM] = { "vsseteienum", aia_hmode, NULL, NULL, rmw_xsetclreinum },
+    [CSR_VSCLREIENUM] = { "vsclreienum", aia_hmode, NULL, NULL, rmw_xsetclreinum },
+    [CSR_VSTOPEI]     = { "vstopei",     aia_hmode, NULL, NULL, rmw_xtopei },
+
     /* Hypervisor and VS-Level High-Half CSRs (H-extension with AIA) */
     [CSR_HIDELEGH]    = { "hidelegh",    aia_hmode32, NULL, NULL, rmw_hidelegh },
     [CSR_HVIENH]      = { "hvienh",      aia_hmode32, read_zero, write_ignore },
-- 
2.25.1


