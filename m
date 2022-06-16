Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o1g0H-0004gW-V2
	for mharc-qemu-riscv@gnu.org; Wed, 15 Jun 2022 23:17:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1o1g0A-0004d0-6l
 for qemu-riscv@nongnu.org; Wed, 15 Jun 2022 23:17:01 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:32990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1o1g01-0001Cr-9J
 for qemu-riscv@nongnu.org; Wed, 15 Jun 2022 23:16:57 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 hv24-20020a17090ae41800b001e33eebdb5dso4722367pjb.0
 for <qemu-riscv@nongnu.org>; Wed, 15 Jun 2022 20:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7ehzLcUbf/KGK/m28zFXXsIsHXa9l1sPc8nVUsz9T/E=;
 b=JvV08RqmrU/+0zs3c8GE3J857N/gMqb31BKJGryVEP/9UQRyPYMYma2x8JdBlKwI2e
 iOaVJnDHcAfALXaaR745EDf2oREMVdYUcANPXXuCe3uA4yMOM8TkoebnEeZL0PiBKvJQ
 Ubq4Bb5t3wXNuuug08VxnYD29GHqahsXsADMjK3UgMqy129Ko3Ns/9IrAJYkB2LtFSXP
 eUyF0TfwvXGdkbkXx2MlRySBGN5MzUBXUGb7L6j6bi12tQXwAP/EfW0QJDcAr1a8ibX1
 ArI3E1JkH581IivyGHYPBfnUHqNu5f4A+PlREFjKe137YWKuMHklDxB9PhqxhJM+4yjS
 PVxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7ehzLcUbf/KGK/m28zFXXsIsHXa9l1sPc8nVUsz9T/E=;
 b=xdSFLYCy7eKjtjcc+GC8hFJr7mfIuYuR4B3P1b9U1xgY84AbQL4X9BCzoF6ga5x96S
 eS51O7uUofSKZ3BBv5Y7By90Lhr7mi7y15LNNA4foO9d32WlJShEsllcCYfIpEhnjtUQ
 EHovmpmz0W0u7WTyY5DZfSn5odRn4l0b/5jioBaMZTmz7eWs9Vy/q3gCVbbfOrRTPZoe
 rIPRt2KtcnjkmXtLn8ofJg8t7KwqyRtkac5+dfnQPWNPZsOO0HY3e6RhsL1j3JL7jEzZ
 exisW8JuxFbvZsjbGoAgg/1+1fp5CTXClks2j3uc7M/dYYvUpynKpIwvcq3lRGT15WqM
 B5bg==
X-Gm-Message-State: AJIora9yd9SdwAcNAWTlD9klsx8hGpGTySnVF5E5NaJCP5shlOrleKJl
 6H8gi4ksNxB0IPAbp0q4RMYCFg==
X-Google-Smtp-Source: AGRyM1uz6aqAriDjFvfD5Ng9PnGuAq1YgjSuBfcfV8w+JR5kuva2sGW2jRPnGaOKGvtePtfl7QITww==
X-Received: by 2002:a17:90b:1bcd:b0:1e2:c8da:7c29 with SMTP id
 oa13-20020a17090b1bcd00b001e2c8da7c29mr13620582pjb.4.1655349407485; 
 Wed, 15 Jun 2022 20:16:47 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([171.76.87.82])
 by smtp.gmail.com with ESMTPSA id
 x53-20020a056a000bf500b00517c84fd24asm389019pfu.172.2022.06.15.20.16.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jun 2022 20:16:46 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 1/2] target/riscv: Remove CSRs that set/clear an IMSIC
 interrupt file bits
Date: Thu, 16 Jun 2022 08:45:42 +0530
Message-Id: <20220616031543.953776-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616031543.953776-1-apatel@ventanamicro.com>
References: <20220616031543.953776-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=apatel@ventanamicro.com; helo=mail-pj1-x1036.google.com
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
X-List-Received-Date: Thu, 16 Jun 2022 03:17:02 -0000

Based on architecture review committee feedback, the [m|s|vs]seteienum,
[m|s|vs]clreienum, [m|s|vs]seteipnum, and [m|s|vs]clreipnum CSRs are
removed in the latest AIA draft v0.3.0 specification.
(Refer, https://github.com/riscv/riscv-aia/releases/tag/0.3.0-draft.31)

These CSRs were mostly for software convenience and software can always
use [m|s|vs]iselect and [m|s|vs]ireg CSRs to update the IMSIC interrupt
file bits.

We update the IMSIC CSR emulation as-per above to match the latest AIA
draft specification.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 target/riscv/cpu_bits.h |  24 +------
 target/riscv/csr.c      | 150 +---------------------------------------
 2 files changed, 6 insertions(+), 168 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 4a55c6a709..01608f86e5 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -177,14 +177,8 @@
 #define CSR_MIREG           0x351
 
 /* Machine-Level Interrupts (AIA) */
-#define CSR_MTOPI           0xfb0
-
-/* Machine-Level IMSIC Interface (AIA) */
-#define CSR_MSETEIPNUM      0x358
-#define CSR_MCLREIPNUM      0x359
-#define CSR_MSETEIENUM      0x35a
-#define CSR_MCLREIENUM      0x35b
 #define CSR_MTOPEI          0x35c
+#define CSR_MTOPI           0xfb0
 
 /* Virtual Interrupts for Supervisor Level (AIA) */
 #define CSR_MVIEN           0x308
@@ -224,14 +218,8 @@
 #define CSR_SIREG           0x151
 
 /* Supervisor-Level Interrupts (AIA) */
-#define CSR_STOPI           0xdb0
-
-/* Supervisor-Level IMSIC Interface (AIA) */
-#define CSR_SSETEIPNUM      0x158
-#define CSR_SCLREIPNUM      0x159
-#define CSR_SSETEIENUM      0x15a
-#define CSR_SCLREIENUM      0x15b
 #define CSR_STOPEI          0x15c
+#define CSR_STOPI           0xdb0
 
 /* Supervisor-Level High-Half CSRs (AIA) */
 #define CSR_SIEH            0x114
@@ -282,14 +270,8 @@
 #define CSR_VSIREG          0x251
 
 /* VS-Level Interrupts (H-extension with AIA) */
-#define CSR_VSTOPI          0xeb0
-
-/* VS-Level IMSIC Interface (H-extension with AIA) */
-#define CSR_VSSETEIPNUM     0x258
-#define CSR_VSCLREIPNUM     0x259
-#define CSR_VSSETEIENUM     0x25a
-#define CSR_VSCLREIENUM     0x25b
 #define CSR_VSTOPEI         0x25c
+#define CSR_VSTOPI          0xeb0
 
 /* Hypervisor and VS-Level High-Half CSRs (H-extension with AIA) */
 #define CSR_HIDELEGH        0x613
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 409a209f14..a4890ebc70 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1040,14 +1040,6 @@ static int aia_xlate_vs_csrno(CPURISCVState *env, int csrno)
         return CSR_VSISELECT;
     case CSR_SIREG:
         return CSR_VSIREG;
-    case CSR_SSETEIPNUM:
-        return CSR_VSSETEIPNUM;
-    case CSR_SCLREIPNUM:
-        return CSR_VSCLREIPNUM;
-    case CSR_SSETEIENUM:
-        return CSR_VSSETEIENUM;
-    case CSR_SCLREIENUM:
-        return CSR_VSCLREIENUM;
     case CSR_STOPEI:
         return CSR_VSTOPEI;
     default:
@@ -1202,124 +1194,6 @@ done:
     return RISCV_EXCP_NONE;
 }
 
-static int rmw_xsetclreinum(CPURISCVState *env, int csrno, target_ulong *val,
-                            target_ulong new_val, target_ulong wr_mask)
-{
-    int ret = -EINVAL;
-    bool set, pend, virt;
-    target_ulong priv, isel, vgein, xlen, nval, wmask;
-
-    /* Translate CSR number for VS-mode */
-    csrno = aia_xlate_vs_csrno(env, csrno);
-
-    /* Decode register details from CSR number */
-    virt = set = pend = false;
-    switch (csrno) {
-    case CSR_MSETEIPNUM:
-        priv = PRV_M;
-        set = true;
-        pend = true;
-        break;
-    case CSR_MCLREIPNUM:
-        priv = PRV_M;
-        pend = true;
-        break;
-    case CSR_MSETEIENUM:
-        priv = PRV_M;
-        set = true;
-        break;
-    case CSR_MCLREIENUM:
-        priv = PRV_M;
-        break;
-    case CSR_SSETEIPNUM:
-        priv = PRV_S;
-        set = true;
-        pend = true;
-        break;
-    case CSR_SCLREIPNUM:
-        priv = PRV_S;
-        pend = true;
-        break;
-    case CSR_SSETEIENUM:
-        priv = PRV_S;
-        set = true;
-        break;
-    case CSR_SCLREIENUM:
-        priv = PRV_S;
-        break;
-    case CSR_VSSETEIPNUM:
-        priv = PRV_S;
-        virt = true;
-        set = true;
-        pend = true;
-        break;
-    case CSR_VSCLREIPNUM:
-        priv = PRV_S;
-        virt = true;
-        pend = true;
-        break;
-    case CSR_VSSETEIENUM:
-        priv = PRV_S;
-        virt = true;
-        set = true;
-        break;
-    case CSR_VSCLREIENUM:
-        priv = PRV_S;
-        virt = true;
-        break;
-    default:
-         goto done;
-    };
-
-    /* IMSIC CSRs only available when machine implements IMSIC. */
-    if (!env->aia_ireg_rmw_fn[priv]) {
-        goto done;
-    }
-
-    /* Find the selected guest interrupt file */
-    vgein = (virt) ? get_field(env->hstatus, HSTATUS_VGEIN) : 0;
-
-    /* Selected guest interrupt file should be valid */
-    if (virt && (!vgein || env->geilen < vgein)) {
-        goto done;
-    }
-
-    /* Set/Clear CSRs always read zero */
-    if (val) {
-        *val = 0;
-    }
-
-    if (wr_mask) {
-        /* Get interrupt number */
-        new_val &= wr_mask;
-
-        /* Find target interrupt pending/enable register */
-        xlen = riscv_cpu_mxl_bits(env);
-        isel = (new_val / xlen);
-        isel *= (xlen / IMSIC_EIPx_BITS);
-        isel += (pend) ? ISELECT_IMSIC_EIP0 : ISELECT_IMSIC_EIE0;
-
-        /* Find the interrupt bit to be set/clear */
-        wmask = ((target_ulong)1) << (new_val % xlen);
-        nval = (set) ? wmask : 0;
-
-        /* Call machine specific IMSIC register emulation */
-        ret = env->aia_ireg_rmw_fn[priv](env->aia_ireg_rmw_fn_arg[priv],
-                                         AIA_MAKE_IREG(isel, priv, virt,
-                                                       vgein, xlen),
-                                         NULL, nval, wmask);
-    } else {
-        ret = 0;
-    }
-
-done:
-    if (ret) {
-        return (riscv_cpu_virt_enabled(env) && virt) ?
-               RISCV_EXCP_VIRT_INSTRUCTION_FAULT : RISCV_EXCP_ILLEGAL_INST;
-    }
-    return RISCV_EXCP_NONE;
-}
-
 static int rmw_xtopei(CPURISCVState *env, int csrno, target_ulong *val,
                       target_ulong new_val, target_ulong wr_mask)
 {
@@ -3409,14 +3283,8 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MIREG]    = { "mireg",    aia_any,   NULL, NULL,    rmw_xireg },
 
     /* Machine-Level Interrupts (AIA) */
-    [CSR_MTOPI]    = { "mtopi",    aia_any,   read_mtopi },
-
-    /* Machine-Level IMSIC Interface (AIA) */
-    [CSR_MSETEIPNUM] = { "mseteipnum", aia_any, NULL, NULL, rmw_xsetclreinum },
-    [CSR_MCLREIPNUM] = { "mclreipnum", aia_any, NULL, NULL, rmw_xsetclreinum },
-    [CSR_MSETEIENUM] = { "mseteienum", aia_any, NULL, NULL, rmw_xsetclreinum },
-    [CSR_MCLREIENUM] = { "mclreienum", aia_any, NULL, NULL, rmw_xsetclreinum },
     [CSR_MTOPEI]     = { "mtopei",     aia_any, NULL, NULL, rmw_xtopei },
+    [CSR_MTOPI]    = { "mtopi",    aia_any,   read_mtopi },
 
     /* Virtual Interrupts for Supervisor Level (AIA) */
     [CSR_MVIEN]      = { "mvien", aia_any, read_zero, write_ignore },
@@ -3464,14 +3332,8 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_SIREG]      = { "sireg",      aia_smode, NULL, NULL, rmw_xireg },
 
     /* Supervisor-Level Interrupts (AIA) */
-    [CSR_STOPI]      = { "stopi",      aia_smode, read_stopi },
-
-    /* Supervisor-Level IMSIC Interface (AIA) */
-    [CSR_SSETEIPNUM] = { "sseteipnum", aia_smode, NULL, NULL, rmw_xsetclreinum },
-    [CSR_SCLREIPNUM] = { "sclreipnum", aia_smode, NULL, NULL, rmw_xsetclreinum },
-    [CSR_SSETEIENUM] = { "sseteienum", aia_smode, NULL, NULL, rmw_xsetclreinum },
-    [CSR_SCLREIENUM] = { "sclreienum", aia_smode, NULL, NULL, rmw_xsetclreinum },
     [CSR_STOPEI]     = { "stopei",     aia_smode, NULL, NULL, rmw_xtopei },
+    [CSR_STOPI]      = { "stopi",      aia_smode, read_stopi },
 
     /* Supervisor-Level High-Half CSRs (AIA) */
     [CSR_SIEH]       = { "sieh",   aia_smode32, NULL, NULL, rmw_sieh },
@@ -3543,14 +3405,8 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_VSIREG]      = { "vsireg",      aia_hmode, NULL, NULL,      rmw_xireg },
 
     /* VS-Level Interrupts (H-extension with AIA) */
-    [CSR_VSTOPI]      = { "vstopi",      aia_hmode, read_vstopi },
-
-    /* VS-Level IMSIC Interface (H-extension with AIA) */
-    [CSR_VSSETEIPNUM] = { "vsseteipnum", aia_hmode, NULL, NULL, rmw_xsetclreinum },
-    [CSR_VSCLREIPNUM] = { "vsclreipnum", aia_hmode, NULL, NULL, rmw_xsetclreinum },
-    [CSR_VSSETEIENUM] = { "vsseteienum", aia_hmode, NULL, NULL, rmw_xsetclreinum },
-    [CSR_VSCLREIENUM] = { "vsclreienum", aia_hmode, NULL, NULL, rmw_xsetclreinum },
     [CSR_VSTOPEI]     = { "vstopei",     aia_hmode, NULL, NULL, rmw_xtopei },
+    [CSR_VSTOPI]      = { "vstopi",      aia_hmode, read_vstopi },
 
     /* Hypervisor and VS-Level High-Half CSRs (H-extension with AIA) */
     [CSR_HIDELEGH]    = { "hidelegh",    aia_hmode32, NULL, NULL, rmw_hidelegh },
-- 
2.34.1


