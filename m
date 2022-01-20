Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nAdjC-00037E-Ez
	for mharc-qemu-riscv@gnu.org; Thu, 20 Jan 2022 15:08:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nAdj7-0002pa-Rh
 for qemu-riscv@nongnu.org; Thu, 20 Jan 2022 15:08:09 -0500
Received: from [2607:f8b0:4864:20::829] (port=43649
 helo=mail-qt1-x829.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nAdj5-0006hw-Nq
 for qemu-riscv@nongnu.org; Thu, 20 Jan 2022 15:08:09 -0500
Received: by mail-qt1-x829.google.com with SMTP id m9so3850295qtq.10
 for <qemu-riscv@nongnu.org>; Thu, 20 Jan 2022 12:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D+ihxa1Ld5LxT20StF+81LT6lsXU3VYkkQbIBKYyb9w=;
 b=EbqYbbOu9agKYYpJipy722ZUTzDgTp25eZ+Y7AlBKndmwkenu4yJ1+S7UjS1nzWO0e
 2/s4LyUypr1TncQoulW2uk60+MIiw+sPvgn7htpwTW9TJ5uSRD8BHlj0BK5cJhufKq7b
 Vm3ryvYwK4goxLQxHDSaslVhS+XCsuEKgeb8V+9v8Ur02SGDpE2Jk0g7yn6NK40QngEr
 u8E9nTR2lJ4sdYxtjff/LsDQ+Ho3CR0jliEFwJvrR+bWjMCbxlG8nEExTgsgwoetIm98
 t6qwThhw7eAlv6K3ohA4OY2iSPYvjhOvl26yJH4nxh9Ng2nTrCn6zg0COl8fftE20Scc
 xdyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D+ihxa1Ld5LxT20StF+81LT6lsXU3VYkkQbIBKYyb9w=;
 b=U8tQayf0u7qbIGHFqjW9qrug2EUpuzMQ15FM8hmg34BngKMFSsHK/DcJnsZlJukazg
 A+Vn9w5b5rsBcfO+I+87AgYHntd8f4ukMWBNTSCcbvTUCOx0usnneAcV0kD1UV80V1O0
 kKZPjoNxFvcF2/oXUosjST6m9566MvOqYtZjHzPGW/TSv1KQSke53KfSWe1GZIBn4nsC
 9y80RKi+kkrIrL6dqjuLjtS+T2qcEtwW/tjNVnsWqZANdQ/hJgmUN8mdqyX0D56eFfsu
 GtvOcvnmq5OpD6q2ZytoLpNtyJkfA3ERZ6pOvLhjcyhFpmyEvqMVaJpqV5iSM4pejW2I
 OKQg==
X-Gm-Message-State: AOAM53222IBlTkQvdLm37FpZjMEftMQhoDEMt+cOrt+a6uUEAxqG61s4
 W7h+LdITQOQ8Tms5RBMhtsYD8Q==
X-Google-Smtp-Source: ABdhPJw+Vp5wD9222Ynvu/EQCjpP8cSEINE6XOkd9qh8kq+l86VQk+Rouu0C7OqVicbMVLR7YIj4nQ==
X-Received: by 2002:a05:622a:512:: with SMTP id
 l18mr641866qtx.120.1642709286765; 
 Thu, 20 Jan 2022 12:08:06 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id a136sm1834160qkc.56.2022.01.20.12.08.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 12:08:06 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Anup Patel <anup@brainfault.org>, qemu-riscv@nongnu.org
Subject: [RFC 2/5] target/riscv: Introduce privilege version field in the CSR
 ops.
Date: Thu, 20 Jan 2022 12:07:32 -0800
Message-Id: <20220120200735.2739543-3-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220120200735.2739543-1-atishp@rivosinc.com>
References: <20220120200735.2739543-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::829
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::829;
 envelope-from=atishp@rivosinc.com; helo=mail-qt1-x829.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 20 Jan 2022 20:08:10 -0000

To allow/disallow the CSR access based on the privilege spec, a new field
in the csr_ops is introduced. It also adds the privileged specification
version (v1.12) for the CSRs introduced in the v1.12. This includes the
new ratified extensions such as Vector, Hypervisor and secconfig CSR.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/cpu.h |   1 +
 target/riscv/csr.c | 103 ++++++++++++++++++++++++++++++---------------
 2 files changed, 69 insertions(+), 35 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 671f65100b1a..7f87917204c5 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -521,6 +521,7 @@ typedef struct {
     riscv_csr_op_fn op;
     riscv_csr_read128_fn read128;
     riscv_csr_write128_fn write128;
+    uint32_t min_priv_ver;
 } riscv_csr_operations;
 
 /* CSR function table constants */
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index adb3d4381d1f..762d3269b4a4 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1991,13 +1991,20 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
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
+    [CSR_VSTART]   = { "vstart",   vs,     read_vstart,  write_vstart, NULL,
+                                           NULL, NULL, PRIV_VERSION_1_12_0 },
+    [CSR_VXSAT]    = { "vxsat",    vs,     read_vxsat,   write_vxsat, NULL,
+                                           NULL, NULL, PRIV_VERSION_1_12_0 },
+    [CSR_VXRM]     = { "vxrm",     vs,     read_vxrm,    write_vxrm, NULL,
+                                           NULL, NULL, PRIV_VERSION_1_12_0 },
+    [CSR_VCSR]     = { "vcsr",     vs,     read_vcsr,    write_vcsr, NULL,
+                                           NULL, NULL, PRIV_VERSION_1_12_0 },
+    [CSR_VL]       = { "vl",       vs,     read_vl, NULL, NULL, NULL, NULL,
+                                           PRIV_VERSION_1_12_0 },
+    [CSR_VTYPE]    = { "vtype",    vs,     read_vtype, NULL, NULL, NULL, NULL,
+                                           PRIV_VERSION_1_12_0 },
+    [CSR_VLENB]    = { "vlenb",    vs,     read_vlenb, NULL, NULL, NULL, NULL,
+                                           PRIV_VERSION_1_12_0 },
     /* User Timers and Counters */
     [CSR_CYCLE]    = { "cycle",    ctr,    read_instret  },
     [CSR_INSTRET]  = { "instret",  ctr,    read_instret  },
@@ -2063,36 +2070,62 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     /* Supervisor Protection and Translation */
     [CSR_SATP]     = { "satp",     smode, read_satp,    write_satp      },
 
-    [CSR_HSTATUS]     = { "hstatus",     hmode,   read_hstatus,     write_hstatus     },
-    [CSR_HEDELEG]     = { "hedeleg",     hmode,   read_hedeleg,     write_hedeleg     },
-    [CSR_HIDELEG]     = { "hideleg",     hmode,   read_hideleg,     write_hideleg     },
-    [CSR_HVIP]        = { "hvip",        hmode,   NULL,   NULL,     rmw_hvip          },
-    [CSR_HIP]         = { "hip",         hmode,   NULL,   NULL,     rmw_hip           },
-    [CSR_HIE]         = { "hie",         hmode,   read_hie,         write_hie         },
-    [CSR_HCOUNTEREN]  = { "hcounteren",  hmode,   read_hcounteren,  write_hcounteren  },
-    [CSR_HGEIE]       = { "hgeie",       hmode,   read_zero,        write_hgeie       },
-    [CSR_HTVAL]       = { "htval",       hmode,   read_htval,       write_htval       },
-    [CSR_HTINST]      = { "htinst",      hmode,   read_htinst,      write_htinst      },
-    [CSR_HGEIP]       = { "hgeip",       hmode,   read_zero,        write_hgeip       },
-    [CSR_HGATP]       = { "hgatp",       hmode,   read_hgatp,       write_hgatp       },
-    [CSR_HTIMEDELTA]  = { "htimedelta",  hmode,   read_htimedelta,  write_htimedelta  },
-    [CSR_HTIMEDELTAH] = { "htimedeltah", hmode32, read_htimedeltah, write_htimedeltah },
-
-    [CSR_VSSTATUS]    = { "vsstatus",    hmode,   read_vsstatus,    write_vsstatus    },
-    [CSR_VSIP]        = { "vsip",        hmode,   NULL,    NULL,    rmw_vsip          },
-    [CSR_VSIE]        = { "vsie",        hmode,   read_vsie,        write_vsie        },
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
+                                         NULL, NULL, NULL, PRIV_VERSION_1_12_0 },
+    [CSR_HEDELEG]     = { "hedeleg",     hmode,   read_hedeleg,   write_hedeleg,
+                                         NULL, NULL, NULL, PRIV_VERSION_1_12_0 },
+    [CSR_HIDELEG]     = { "hideleg",     hmode,   read_hideleg,   write_hideleg,
+                                         NULL, NULL, NULL, PRIV_VERSION_1_12_0 },
+    [CSR_HVIP]        = { "hvip",        hmode,   NULL,   NULL,   rmw_hvip,
+                                         NULL, NULL, PRIV_VERSION_1_12_0 },
+    [CSR_HIP]         = { "hip",         hmode,   NULL,   NULL,   rmw_hip,
+                                         NULL, NULL, PRIV_VERSION_1_12_0 },
+    [CSR_HIE]         = { "hie",         hmode,   read_hie,       write_hie,
+                                         NULL, NULL, NULL, PRIV_VERSION_1_12_0 },
+    [CSR_HCOUNTEREN]  = { "hcounteren",  hmode,   read_hcounteren, write_hcounteren,
+                                         NULL, NULL, NULL, PRIV_VERSION_1_12_0 },
+    [CSR_HGEIE]       = { "hgeie",       hmode,   read_zero,      write_hgeie,
+                                         NULL, NULL, NULL, PRIV_VERSION_1_12_0 },
+    [CSR_HTVAL]       = { "htval",       hmode,   read_htval,     write_htval,
+                                         NULL, NULL, NULL, PRIV_VERSION_1_12_0 },
+    [CSR_HTINST]      = { "htinst",      hmode,   read_htinst,    write_htinst,
+                                         NULL, NULL, NULL, PRIV_VERSION_1_12_0 },
+    [CSR_HGEIP]       = { "hgeip",       hmode,   read_zero,      write_hgeip,
+                                         NULL, NULL, NULL, PRIV_VERSION_1_12_0 },
+    [CSR_HGATP]       = { "hgatp",       hmode,   read_hgatp,     write_hgatp,
+                                         NULL, NULL, NULL, PRIV_VERSION_1_12_0 },
+    [CSR_HTIMEDELTA]  = { "htimedelta",  hmode,   read_htimedelta, write_htimedelta,
+                                         NULL, NULL, NULL, PRIV_VERSION_1_12_0 },
+    [CSR_HTIMEDELTAH] = { "htimedeltah", hmode32, read_htimedeltah, write_htimedeltah,
+                                         NULL, NULL, NULL, PRIV_VERSION_1_12_0 },
+
+    [CSR_VSSTATUS]    = { "vsstatus",    hmode,   read_vsstatus,  write_vsstatus,
+                                         NULL, NULL, NULL, PRIV_VERSION_1_12_0 },
+    [CSR_VSIP]        = { "vsip",        hmode,   NULL,    NULL,  rmw_vsip,
+                                         NULL, NULL, PRIV_VERSION_1_12_0 },
+    [CSR_VSIE]        = { "vsie",        hmode,   read_vsie,      write_vsie,
+                                         NULL, NULL, NULL, PRIV_VERSION_1_12_0 },
+    [CSR_VSTVEC]      = { "vstvec",      hmode,   read_vstvec,    write_vstvec,
+                                         NULL, NULL, NULL, PRIV_VERSION_1_12_0 },
+    [CSR_VSSCRATCH]   = { "vsscratch",   hmode,   read_vsscratch, write_vsscratch,
+                                         NULL, NULL, NULL, PRIV_VERSION_1_12_0 },
+    [CSR_VSEPC]       = { "vsepc",       hmode,   read_vsepc,     write_vsepc,
+                                         NULL, NULL, NULL, PRIV_VERSION_1_12_0 },
+    [CSR_VSCAUSE]     = { "vscause",     hmode,   read_vscause,   write_vscause,
+                                         NULL, NULL, NULL, PRIV_VERSION_1_12_0 },
+    [CSR_VSTVAL]      = { "vstval",      hmode,   read_vstval,    write_vstval,
+                                         NULL, NULL, NULL, PRIV_VERSION_1_12_0 },
+    [CSR_VSATP]       = { "vsatp",       hmode,   read_vsatp,     write_vsatp,
+                                         NULL, NULL, NULL, PRIV_VERSION_1_12_0 },
+
+    [CSR_MTVAL2]      = { "mtval2",      hmode,   read_mtval2,    write_mtval2,
+                                         NULL, NULL, NULL, PRIV_VERSION_1_12_0 },
+    [CSR_MTINST]      = { "mtinst",      hmode,   read_mtinst,    write_mtinst,
+                                         NULL, NULL, NULL, PRIV_VERSION_1_12_0 },
 
     /* Physical Memory Protection */
-    [CSR_MSECCFG]    = { "mseccfg",  epmp, read_mseccfg, write_mseccfg },
+    [CSR_MSECCFG]    = { "mseccfg",  epmp, read_mseccfg, write_mseccfg,
+                                     NULL, NULL, NULL, PRIV_VERSION_1_12_0 },
     [CSR_PMPCFG0]    = { "pmpcfg0",   pmp, read_pmpcfg,  write_pmpcfg  },
     [CSR_PMPCFG1]    = { "pmpcfg1",   pmp, read_pmpcfg,  write_pmpcfg  },
     [CSR_PMPCFG2]    = { "pmpcfg2",   pmp, read_pmpcfg,  write_pmpcfg  },
-- 
2.30.2


