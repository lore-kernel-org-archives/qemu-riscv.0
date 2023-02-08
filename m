Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pPe0G-0002Ai-82
	for mharc-qemu-riscv@gnu.org; Wed, 08 Feb 2023 01:32:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1pPe0A-00029q-G7
 for qemu-riscv@nongnu.org; Wed, 08 Feb 2023 01:32:18 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1pPe08-00044x-SF
 for qemu-riscv@nongnu.org; Wed, 08 Feb 2023 01:32:18 -0500
Received: by mail-pg1-x52e.google.com with SMTP id n3so6515891pgr.9
 for <qemu-riscv@nongnu.org>; Tue, 07 Feb 2023 22:32:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vXNnFIlxIp7s7YkT8jHIWkidIz6GUFBEv4EXFKzf1qU=;
 b=RBWEqaNKjQ8a85GZidGekj3Sht5fWDIXH1GeUk2iKQg3jwVcRGTjMJ3JjvlnFjNTXK
 J0akKJeLlVTV/aHXZXxjv2CTmCJtDr1C4EJJTnrs3I/1h9QrLrEyYGMfsrhqwowULcFF
 a/QkvdGAiEOOUReytPZDrXTZqT1j4ob9vmBBAnVoYGlsq+q8HY3DGY+QVjW/fzT4miIF
 tsP0vtyvTjbEgao7jaDimKIPKPgFPzJoH3wduWdwfsgVzQDmo2R81wrPst4BH3ihMcOS
 dMbg7/JxlBDALcUuZ9eiNdFlaKjorLbhH7gBqUuahVOcIHzXDiLjvpna2jYNJ3U1bix1
 7wAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vXNnFIlxIp7s7YkT8jHIWkidIz6GUFBEv4EXFKzf1qU=;
 b=sfTv1V68vuXqHSDNcWk3/emoYK6R6hk2waoOK6jMJ8VVnHm8RE/VNKtbHPaV/mb5pc
 uVzptiqi83hSS9+ZBGF0LyUGKugkWQNtULZ49fadsbKUkGosHLWa1PoyFpdOf1L4dEYI
 4W1ewYEdV7Pw8WeVkZOhBkdJimczFC7cefQUhznAHf3MPUvyTO/S9oASJeYvOBakYeti
 tpCsbUyS+IQPW5u/3jr3193Ud424yQ6fxtLI/U3EhBnfEXYxoxvA/N4udeoMQ0EO9sl3
 xjcdJLeUfGjJjWJbt+M6z+P5+pnsfmZ8its+RCqWwBtn72yRcODNMxyp/fNps0uMPxfL
 WLvw==
X-Gm-Message-State: AO0yUKX0arqnmSpbf9nks8L779tFjgXL5YfemA7g7IzvnZyCXbtGtakJ
 BOto37hl39C5VlRARzOveASBlQ==
X-Google-Smtp-Source: AK7set8usHG5OSpNUY6/Q/ElCt+CiSG4ygMnLbWec4D2wScykToBuODu78MbqdeDMOlBKbtnHGEADA==
X-Received: by 2002:a62:4e89:0:b0:58d:be61:4859 with SMTP id
 c131-20020a624e89000000b0058dbe614859mr4281803pfb.11.1675837934433; 
 Tue, 07 Feb 2023 22:32:14 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 x37-20020a056a0018a500b0058baf8694e1sm10326943pfh.71.2023.02.07.22.32.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 22:32:14 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Bin Meng <bmeng@tinylab.org>, LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v2] target/riscv: Remove privileged spec version restriction
 for RVV
Date: Wed,  8 Feb 2023 14:32:08 +0800
Message-Id: <20230208063209.27279-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 08 Feb 2023 06:32:19 -0000

From: Frank Chang <frank.chang@sifive.com>

The RVV specification does not require that the core needs to support
the privileged specification v1.12.0 to support RVV, and there is no
dependency from ISA level.

This commit removes the restriction from both RVV CSRs and extension CPU
ISA string.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
---
 target/riscv/cpu.c |  2 +-
 target/riscv/csr.c | 21 +++++++--------------
 2 files changed, 8 insertions(+), 15 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 0dd2f0c753..93b52b826c 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -73,7 +73,7 @@ struct isa_ext_data {
  */
 static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(h, false, PRIV_VERSION_1_12_0, ext_h),
-    ISA_EXT_DATA_ENTRY(v, false, PRIV_VERSION_1_12_0, ext_v),
+    ISA_EXT_DATA_ENTRY(v, false, PRIV_VERSION_1_10_0, ext_v),
     ISA_EXT_DATA_ENTRY(zicsr, true, PRIV_VERSION_1_10_0, ext_icsr),
     ISA_EXT_DATA_ENTRY(zifencei, true, PRIV_VERSION_1_10_0, ext_ifencei),
     ISA_EXT_DATA_ENTRY(zihintpause, true, PRIV_VERSION_1_10_0, ext_zihintpause),
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index fa17d7770c..1b0a0c1693 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -3980,20 +3980,13 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_FRM]      = { "frm",      fs,     read_frm,     write_frm    },
     [CSR_FCSR]     = { "fcsr",     fs,     read_fcsr,    write_fcsr   },
     /* Vector CSRs */
-    [CSR_VSTART]   = { "vstart",   vs,     read_vstart,  write_vstart,
-                       .min_priv_ver = PRIV_VERSION_1_12_0            },
-    [CSR_VXSAT]    = { "vxsat",    vs,     read_vxsat,   write_vxsat,
-                       .min_priv_ver = PRIV_VERSION_1_12_0            },
-    [CSR_VXRM]     = { "vxrm",     vs,     read_vxrm,    write_vxrm,
-                       .min_priv_ver = PRIV_VERSION_1_12_0            },
-    [CSR_VCSR]     = { "vcsr",     vs,     read_vcsr,    write_vcsr,
-                       .min_priv_ver = PRIV_VERSION_1_12_0            },
-    [CSR_VL]       = { "vl",       vs,     read_vl,
-                       .min_priv_ver = PRIV_VERSION_1_12_0            },
-    [CSR_VTYPE]    = { "vtype",    vs,     read_vtype,
-                       .min_priv_ver = PRIV_VERSION_1_12_0            },
-    [CSR_VLENB]    = { "vlenb",    vs,     read_vlenb,
-                       .min_priv_ver = PRIV_VERSION_1_12_0            },
+    [CSR_VSTART]   = { "vstart",   vs,     read_vstart,  write_vstart },
+    [CSR_VXSAT]    = { "vxsat",    vs,     read_vxsat,   write_vxsat  },
+    [CSR_VXRM]     = { "vxrm",     vs,     read_vxrm,    write_vxrm   },
+    [CSR_VCSR]     = { "vcsr",     vs,     read_vcsr,    write_vcsr   },
+    [CSR_VL]       = { "vl",       vs,     read_vl                    },
+    [CSR_VTYPE]    = { "vtype",    vs,     read_vtype                 },
+    [CSR_VLENB]    = { "vlenb",    vs,     read_vlenb                 },
     /* User Timers and Counters */
     [CSR_CYCLE]    = { "cycle",    ctr,    read_hpmcounter  },
     [CSR_INSTRET]  = { "instret",  ctr,    read_hpmcounter  },
-- 
2.36.1


