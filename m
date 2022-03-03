Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nPqbK-0007VK-8L
	for mharc-qemu-riscv@gnu.org; Thu, 03 Mar 2022 13:54:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nPqbI-0007QT-Pn
 for qemu-riscv@nongnu.org; Thu, 03 Mar 2022 13:54:56 -0500
Received: from [2607:f8b0:4864:20::336] (port=38581
 helo=mail-ot1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nPqbG-0001so-Ry
 for qemu-riscv@nongnu.org; Thu, 03 Mar 2022 13:54:56 -0500
Received: by mail-ot1-x336.google.com with SMTP id
 a7-20020a9d5c87000000b005ad1467cb59so5404064oti.5
 for <qemu-riscv@nongnu.org>; Thu, 03 Mar 2022 10:54:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3apVKTkl7xTSgH68JnVCZIoSiOD759Y37jslcQcAbgI=;
 b=dUnuo9wOtLEbFCUBvbZkf+9HzvwDPq/vWz37vbKg/X8HAM/6fKzXCb6MnA7EyY6Jut
 IVrjME3orzgsPLNk7cZdjfo12FPjGUcvzyEmfrDy40iy9wgDynIvfw8tHW6odGYI3T7V
 tPF6CNTQ+ViG8Ba3tPn1bOxY7r9FSVbq0X4qygpwInb8dotUQ8OQtXca4hOcNy/1X49P
 cDbce2sL/wjvrl2GZ+Sk3EVV6jvTn8dZsQtM+3hZ6Xk+NC6l10oslcFhWueZN76FD5eV
 BM2kHAFw9joIGibS94XZdcW7CeaacGKpTRArW3EOU0IlRLb7mj4Z0sUT9RpEnB0lVgIt
 LQog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3apVKTkl7xTSgH68JnVCZIoSiOD759Y37jslcQcAbgI=;
 b=D4sNeyl8jeZ2vK5BrdMbAfNASgUBDhB2t/0EFQ1tnu5BJiNbn9JGh5wP3wBbowbcwC
 qwbUTmwtskGOJcxuznTA2sGiCLMxPH34tFdmDNyJ3De6t/n5nBE+HH2YhmdEMm+D6QGU
 GQy+VUDlsrO1I7oBm1q2OzxSfmRA5Uo4WGqE3vm9YTMJjlqepsZShFsCiYKbfthmipmR
 /oJOjEstx6bjubN/QREZjrODQF6GAbsTWk3HJNV7Yp1no4dEE4DzzI38yfp4qBlTxXrB
 Elh3hRMN4+vYnSb+am8M9mCOB71oWxJ5Gdsd6qYlq3kcTuBfCnLX758UvwTpf0sIbadS
 yh3w==
X-Gm-Message-State: AOAM531XFsHy+jYTmEJfmr2yxfI/cSelqrgl5PGaWL3KieBSamqHsZjf
 2DWAV9CqiCwynb8qKrx9Frpudw==
X-Google-Smtp-Source: ABdhPJwrHkIfbLtkWElzeEPNKtKYYKqQn4ysXbpU6eZh/2rEUcnhPObb7eCY35lKHCNODb9VWqgBdw==
X-Received: by 2002:a9d:6409:0:b0:5ad:2055:9bdc with SMTP id
 h9-20020a9d6409000000b005ad20559bdcmr19717972otl.93.1646333693805; 
 Thu, 03 Mar 2022 10:54:53 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190]) by smtp.gmail.com with ESMTPSA id
 u24-20020a4ae698000000b0031c286f2e0csm1331052oot.29.2022.03.03.10.54.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 10:54:53 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v5 3/6] target/riscv: Introduce privilege version field in the
 CSR ops.
Date: Thu,  3 Mar 2022 10:54:37 -0800
Message-Id: <20220303185440.512391-4-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220303185440.512391-1-atishp@rivosinc.com>
References: <20220303185440.512391-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::336
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=atishp@rivosinc.com; helo=mail-ot1-x336.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Thu, 03 Mar 2022 18:54:57 -0000

To allow/disallow the CSR access based on the privilege spec, a new field
in the csr_ops is introduced. It also adds the privileged specification
version (v1.12) for the CSRs introduced in the v1.12. This includes the
new ratified extensions such as Vector, Hypervisor and secconfig CSR.
However, it doesn't enforce the privilege version in this commit.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/cpu.h |   2 +
 target/riscv/csr.c | 103 ++++++++++++++++++++++++++++++---------------
 2 files changed, 70 insertions(+), 35 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 7f67e920c650..e7133f4c8ac9 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -661,6 +661,8 @@ typedef struct {
     riscv_csr_op_fn op;
     riscv_csr_read128_fn read128;
     riscv_csr_write128_fn write128;
+    /* The default priv spec version should be PRIV_VERSION_1_10_0 (i.e 0) */
+    uint32_t min_priv_ver;
 } riscv_csr_operations;
 
 /* CSR function table constants */
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index aea82dff4aff..ec41a5363f6b 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -3067,13 +3067,20 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_FRM]      = { "frm",      fs,     read_frm,     write_frm    },
     [CSR_FCSR]     = { "fcsr",     fs,     read_fcsr,    write_fcsr   },
     /* Vector CSRs */
-    [CSR_VSTART]   = { "vstart",   vs,     read_vstart,  write_vstart },
-    [CSR_VXSAT]    = { "vxsat",    vs,     read_vxsat,   write_vxsat  },
-    [CSR_VXRM]     = { "vxrm",     vs,     read_vxrm,    write_vxrm   },
-    [CSR_VCSR]     = { "vcsr",     vs,     read_vcsr,    write_vcsr   },
-    [CSR_VL]       = { "vl",       vs,     read_vl                    },
-    [CSR_VTYPE]    = { "vtype",    vs,     read_vtype                 },
-    [CSR_VLENB]    = { "vlenb",    vs,     read_vlenb                 },
+    [CSR_VSTART]   = { "vstart",   vs,    read_vstart,  write_vstart,
+                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_VXSAT]    = { "vxsat",    vs,    read_vxsat,   write_vxsat,
+                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_VXRM]     = { "vxrm",     vs,    read_vxrm,    write_vxrm,
+                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_VCSR]     = { "vcsr",     vs,    read_vcsr,    write_vcsr,
+                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_VL]       = { "vl",       vs,    read_vl,
+                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_VTYPE]    = { "vtype",    vs,    read_vtype,
+                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_VLENB]    = { "vlenb",    vs,    read_vlenb,
+                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
     /* User Timers and Counters */
     [CSR_CYCLE]    = { "cycle",    ctr,    read_instret  },
     [CSR_INSTRET]  = { "instret",  ctr,    read_instret  },
@@ -3182,33 +3189,58 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_SIEH]       = { "sieh",   aia_smode32, NULL, NULL, rmw_sieh },
     [CSR_SIPH]       = { "siph",   aia_smode32, NULL, NULL, rmw_siph },
 
-    [CSR_HSTATUS]     = { "hstatus",     hmode,   read_hstatus,     write_hstatus     },
-    [CSR_HEDELEG]     = { "hedeleg",     hmode,   read_hedeleg,     write_hedeleg     },
-    [CSR_HIDELEG]     = { "hideleg",     hmode,   NULL,   NULL,     rmw_hideleg       },
-    [CSR_HVIP]        = { "hvip",        hmode,   NULL,   NULL,     rmw_hvip          },
-    [CSR_HIP]         = { "hip",         hmode,   NULL,   NULL,     rmw_hip           },
-    [CSR_HIE]         = { "hie",         hmode,   NULL,   NULL,     rmw_hie           },
-    [CSR_HCOUNTEREN]  = { "hcounteren",  hmode,   read_hcounteren,  write_hcounteren  },
-    [CSR_HGEIE]       = { "hgeie",       hmode,   read_hgeie,       write_hgeie       },
-    [CSR_HTVAL]       = { "htval",       hmode,   read_htval,       write_htval       },
-    [CSR_HTINST]      = { "htinst",      hmode,   read_htinst,      write_htinst      },
-    [CSR_HGEIP]       = { "hgeip",       hmode,   read_hgeip,       NULL              },
-    [CSR_HGATP]       = { "hgatp",       hmode,   read_hgatp,       write_hgatp       },
-    [CSR_HTIMEDELTA]  = { "htimedelta",  hmode,   read_htimedelta,  write_htimedelta  },
-    [CSR_HTIMEDELTAH] = { "htimedeltah", hmode32, read_htimedeltah, write_htimedeltah },
-
-    [CSR_VSSTATUS]    = { "vsstatus",    hmode,   read_vsstatus,    write_vsstatus    },
-    [CSR_VSIP]        = { "vsip",        hmode,   NULL,    NULL,    rmw_vsip          },
-    [CSR_VSIE]        = { "vsie",        hmode,   NULL,    NULL,    rmw_vsie          },
-    [CSR_VSTVEC]      = { "vstvec",      hmode,   read_vstvec,      write_vstvec      },
-    [CSR_VSSCRATCH]   = { "vsscratch",   hmode,   read_vsscratch,   write_vsscratch   },
-    [CSR_VSEPC]       = { "vsepc",       hmode,   read_vsepc,       write_vsepc       },
-    [CSR_VSCAUSE]     = { "vscause",     hmode,   read_vscause,     write_vscause     },
-    [CSR_VSTVAL]      = { "vstval",      hmode,   read_vstval,      write_vstval      },
-    [CSR_VSATP]       = { "vsatp",       hmode,   read_vsatp,       write_vsatp       },
-
-    [CSR_MTVAL2]      = { "mtval2",      hmode,   read_mtval2,      write_mtval2      },
-    [CSR_MTINST]      = { "mtinst",      hmode,   read_mtinst,      write_mtinst      },
+    [CSR_HSTATUS]     = { "hstatus",     hmode,   read_hstatus,   write_hstatus,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_HEDELEG]     = { "hedeleg",     hmode,   read_hedeleg,   write_hedeleg,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_HIDELEG]     = { "hideleg",     hmode,   NULL,   NULL, rmw_hideleg,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_HVIP]        = { "hvip",        hmode,   NULL,   NULL,   rmw_hvip,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_HIP]         = { "hip",         hmode,   NULL,   NULL,   rmw_hip,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_HIE]         = { "hie",         hmode,   NULL,   NULL,    rmw_hie,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_HCOUNTEREN]  = { "hcounteren",  hmode,   read_hcounteren, write_hcounteren,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_HGEIE]       = { "hgeie",       hmode,   read_hgeie,       write_hgeie,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_HTVAL]       = { "htval",       hmode,   read_htval,     write_htval,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_HTINST]      = { "htinst",      hmode,   read_htinst,    write_htinst,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_HGEIP]       = { "hgeip",       hmode,   read_hgeip,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_HGATP]       = { "hgatp",       hmode,   read_hgatp,     write_hgatp,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_HTIMEDELTA]  = { "htimedelta",  hmode,   read_htimedelta, write_htimedelta,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_HTIMEDELTAH] = { "htimedeltah", hmode32, read_htimedeltah, write_htimedeltah,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
+
+    [CSR_VSSTATUS]    = { "vsstatus",    hmode,   read_vsstatus,  write_vsstatus,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_VSIP]        = { "vsip",        hmode,   NULL,    NULL,  rmw_vsip,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_VSIE]        = { "vsie",        hmode,   NULL,    NULL,    rmw_vsie ,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_VSTVEC]      = { "vstvec",      hmode,   read_vstvec,    write_vstvec,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_VSSCRATCH]   = { "vsscratch",   hmode,   read_vsscratch, write_vsscratch,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_VSEPC]       = { "vsepc",       hmode,   read_vsepc,     write_vsepc,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_VSCAUSE]     = { "vscause",     hmode,   read_vscause,   write_vscause,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_VSTVAL]      = { "vstval",      hmode,   read_vstval,    write_vstval,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_VSATP]       = { "vsatp",       hmode,   read_vsatp,     write_vsatp,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
+
+    [CSR_MTVAL2]      = { "mtval2",      hmode,   read_mtval2,    write_mtval2,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_MTINST]      = { "mtinst",      hmode,   read_mtinst,    write_mtinst,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
 
     /* Virtual Interrupts and Interrupt Priorities (H-extension with AIA) */
     [CSR_HVIEN]       = { "hvien",       aia_hmode, read_zero, write_ignore },
@@ -3242,7 +3274,8 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_VSIPH]       = { "vsiph",       aia_hmode32, NULL, NULL, rmw_vsiph },
 
     /* Physical Memory Protection */
-    [CSR_MSECCFG]    = { "mseccfg",  epmp, read_mseccfg, write_mseccfg },
+    [CSR_MSECCFG]    = { "mseccfg",  epmp, read_mseccfg, write_mseccfg,
+                                     .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_PMPCFG0]    = { "pmpcfg0",   pmp, read_pmpcfg,  write_pmpcfg  },
     [CSR_PMPCFG1]    = { "pmpcfg1",   pmp, read_pmpcfg,  write_pmpcfg  },
     [CSR_PMPCFG2]    = { "pmpcfg2",   pmp, read_pmpcfg,  write_pmpcfg  },
-- 
2.30.2


