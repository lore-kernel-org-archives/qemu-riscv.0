Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nGdh9-00084L-AA
	for mharc-qemu-riscv@gnu.org; Sun, 06 Feb 2022 04:18:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nGdh7-0007zF-Ok
 for qemu-riscv@nongnu.org; Sun, 06 Feb 2022 04:18:53 -0500
Received: from [2607:f8b0:4864:20::334] (port=34721
 helo=mail-ot1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nGdh5-00013O-SL
 for qemu-riscv@nongnu.org; Sun, 06 Feb 2022 04:18:53 -0500
Received: by mail-ot1-x334.google.com with SMTP id
 b17-20020a9d4791000000b005a17fc2dfc1so8847402otf.1
 for <qemu-riscv@nongnu.org>; Sun, 06 Feb 2022 01:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O6PObwqwUIyUdHO/OYUSJ8TGMiaYgn/szHFribdqUcc=;
 b=2qRkEbyBeaZcg8kyyYOD/xH4GCJF/JRpc25V3BJ3CSNHa+y0UAiLsUK18+QE8GjDQU
 JoPeITXZvcgUiZc9qQROuNiXdlSzwhXD70000+Kh+/KSs7RjvEdaHmsnqPLAaN/XCUKl
 pMI5/QsB+SUCY+X/EzSyax0vv0Qj4twteuJtFWOfi2ZBkSdXXUZl/CdK1gBFqrWIbPBq
 wjQKTRTFe9g/ybB1JJM+AebSkCLZ9Q1Ye9cHT+R1C8A/u9SJzErD3A/DRjSyfoc2OIwd
 QTwuuNgM3NYkCBbaHV2ZRJ3qkX8XVa2rPyGSGo/ZseT5FeG0HXBynXNGZcaGLYAd9wLN
 dzPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O6PObwqwUIyUdHO/OYUSJ8TGMiaYgn/szHFribdqUcc=;
 b=Sko6h2A56vH7aL+4AW+gHn8s0fB//7VZVObLd/nMo6BjA+pJQe7KhMzAghT1V3kyjl
 KuNW3fBho2GOrQkTWu+f9cuQljVhHi5tUv28ocT4WD6uByFj+xYp7g8Vti9S2T5xj3u3
 BNeK1kiu//HcRcMVvR0vIOwmVJ7zgIRjDLZak8v9QC6gaq4UZdJDHkPguJwCa4AnuVCz
 efyFxupb8lXGAu99W5vmTwD3FQJBooHMTWqRoGSzx2zgJSTsM4P3TIzlM69mWCjkcKny
 EvZ2nTXgmwHF1buZFLEF2PCUGAGwj+/oVHpnQFqvs0+rM0tvoVKl6ZFx/RSxUt01mM4j
 G8pg==
X-Gm-Message-State: AOAM530egc2se7YkxUwmzpSw6mv9XAkELdi8KHt6dg/0YF43gvg+ZiGB
 XtHTB9NZM+4Vu9uroqeM9zUP76902ry6gyWJ
X-Google-Smtp-Source: ABdhPJy455Y5gy3wZuaUODLdmKRZVHMMnUxF9Ci2eaVSOzlKFDwE0x34S/Klkd0X9MLuUKEdqh3CEQ==
X-Received: by 2002:a05:6830:2328:: with SMTP id
 q8mr2442076otg.251.1644139130923; 
 Sun, 06 Feb 2022 01:18:50 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id 1sm1596841oab.16.2022.02.06.01.18.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 01:18:50 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v3 3/6] target/riscv: Introduce privilege version field in the
 CSR ops.
Date: Sun,  6 Feb 2022 01:18:32 -0800
Message-Id: <20220206091835.1244296-4-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220206091835.1244296-1-atishp@rivosinc.com>
References: <20220206091835.1244296-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::334
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=atishp@rivosinc.com; helo=mail-ot1-x334.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
X-List-Received-Date: Sun, 06 Feb 2022 09:18:54 -0000

To allow/disallow the CSR access based on the privilege spec, a new field
in the csr_ops is introduced. It also adds the privileged specification
version (v1.12) for the CSRs introduced in the v1.12. This includes the
new ratified extensions such as Vector, Hypervisor and secconfig CSR.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/cpu.h |   2 +
 target/riscv/csr.c | 103 ++++++++++++++++++++++++++++++---------------
 2 files changed, 70 insertions(+), 35 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 60b847141db2..0741f9822cf0 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -593,6 +593,8 @@ typedef struct {
     riscv_csr_op_fn op;
     riscv_csr_read128_fn read128;
     riscv_csr_write128_fn write128;
+    /* The default priv spec version should be PRIV_VERSION_1_10_0 (i.e 0) */
+    uint32_t min_priv_ver;
 } riscv_csr_operations;
 
 /* CSR function table constants */
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 8c63caa39245..25a0df498669 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -2981,13 +2981,20 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
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
@@ -3096,33 +3103,58 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
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
@@ -3154,7 +3186,8 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
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


