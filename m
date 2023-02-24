Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVdJq-0001jy-Uy
	for mharc-qemu-riscv@gnu.org; Fri, 24 Feb 2023 14:01:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pVdJk-0001g5-B0
 for qemu-riscv@nongnu.org; Fri, 24 Feb 2023 14:01:16 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pVdJd-0002eM-HZ
 for qemu-riscv@nongnu.org; Fri, 24 Feb 2023 14:01:16 -0500
Received: by mail-pj1-x102f.google.com with SMTP id l1so51537pjt.2
 for <qemu-riscv@nongnu.org>; Fri, 24 Feb 2023 11:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677265265;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DDWoUrS3gNFU9IU+ndidQqS1Eb6eRflzx7e/dFgHmuQ=;
 b=IAaDUpJhI0v5JUSkQW4z8WzozeBheiRWzFaJ0QqmwvGt2zr0R6sB4BmJ+cu+ur6cGq
 ZUOO2xL7Stru3W8DTDpQxYTjrjMXFmPMhYTN8Wv9S+XX8/rixGQFEj39eWV9QwUaH/Q5
 sFBVkDlTbqUGWVGWDEJnAJIPzmBS3sk3pODkk2upcFVxkv2QjkGauxy+YwX6JwwGu0I1
 9uYULWpDxkYMvlOBNjaK0EZlv6C9IgAJ+CkneHaDTUbCqYFiXaL2nuIlodiv9kz2Q2MK
 0gYz0cWbqZfSLeA8OsmD90YR9ZWGPo8WG6FddbOXVZKDT4nyNze68WnOIqn46VlSV1DA
 dTHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677265265;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DDWoUrS3gNFU9IU+ndidQqS1Eb6eRflzx7e/dFgHmuQ=;
 b=qvYS2eT0mEQpXyqW4ljykEzdRgwj6kYwrKYhKXHX6aEDHnApNEOESEq4L4pxxHjDIW
 KSj3aQBRGhncblr5OGPWJlI8Ke20UMn/30pa3qcLoypmz23wk0utNhn5HhrBzwBtwJu0
 xpNnYdi+rwzlFvQLqzWR6yXbVymC7m3P2GJQx8TrrhpLYr0oomATgiW7goOdOrScxsF2
 GCI33CRNuf/E9+IYt1bPHdLsYaoZ/8ijf/4uxYEO0loMCr7qnbQhd+wXxk52Vl4Ncj1O
 fFZe5VD5UW3TGJq3BYoYONnmcA5MBxwlKMfJ67J/RbMBJEqsa6HS9bGP3w3YbnS4GwQ2
 cIRg==
X-Gm-Message-State: AO0yUKUjfDceMlr5CSyiT7n5EdOn5/EVb+uXQjwcYuXHgPpitjCuA11M
 765Ukj9ItGkMnNLcYXOxt89DL2922G2igKS6
X-Google-Smtp-Source: AK7set+WZgU+3zTTjYykNv3PGxEC8vR7LqK29oW2oCpdeTYLLRkbsX8n0RfYO94RsoPS1UUCKoxG7Q==
X-Received: by 2002:a17:902:e74f:b0:199:2e77:fe56 with SMTP id
 p15-20020a170902e74f00b001992e77fe56mr21524320plf.52.1677265264643; 
 Fri, 24 Feb 2023 11:01:04 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 g5-20020a170902c38500b0019c92f56983sm7512159plg.120.2023.02.24.11.01.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 11:01:04 -0800 (PST)
Subject: [PULL 4/8] target/riscv: Remove privileged spec version restriction
 for RVV
Date: Fri, 24 Feb 2023 10:59:05 -0800
Message-Id: <20230224185908.32706-5-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230224185908.32706-1-palmer@rivosinc.com>
References: <20230224185908.32706-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Frank Chang <frank.chang@sifive.com>, Bin Meng <bmeng@tinylab.org>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=palmer@rivosinc.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 24 Feb 2023 19:01:16 -0000

From: Frank Chang <frank.chang@sifive.com>

The RVV specification does not require that the core needs to support
the privileged specification v1.12.0 to support RVV, and there is no
dependency from ISA level.

This commit removes the restriction from both RVV CSRs and extension CPU
ISA string.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20230208063209.27279-1-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
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
2.39.0


