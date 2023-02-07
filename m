Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pPJZz-0000Mh-AG
	for mharc-qemu-riscv@gnu.org; Tue, 07 Feb 2023 03:43:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1pPJZt-0000LQ-8E
 for qemu-riscv@nongnu.org; Tue, 07 Feb 2023 03:43:49 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1pPJZr-0003S0-D7
 for qemu-riscv@nongnu.org; Tue, 07 Feb 2023 03:43:48 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 d6-20020a17090ae28600b00230aa72904fso5915267pjz.5
 for <qemu-riscv@nongnu.org>; Tue, 07 Feb 2023 00:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QUReV4KMvI7An8ubheslQVfRM2aU7U816taWVsImywA=;
 b=a5orAumV77+kcjH0Ni32yXBpSYK+gd9VCjoKYhVuYtUQp1RdpCTENNwm71GelEydi2
 xkNWqiemH27UYHtrOuIiThlvn7OAxm4UsM4WRgU9zReOuT/E8l7mi2FWoeHVkjh5jU3w
 O8Zbll1QZp6JriSmW8PRam6133aSEkY3pJjTf5kBoWJAtIVsTUUUBoZBApQAPXQL4yNy
 n4WDklI33l7Usc5TUf6zeQAZv4SvpGhe/G+Ehx9nlVh42qTibKQ4ryDO2d6E5nBQS3pS
 CS6jfA6Ln1W5NuGenB3rtrloqs3ijwid/nfamzi4QRBUdbbdxblLHvTyVZ/W3rYEsWK1
 Xo1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QUReV4KMvI7An8ubheslQVfRM2aU7U816taWVsImywA=;
 b=LNe1TLwTA4a64Yv1VlY/qjQG+9YCCodQKDGeDTlLW0ubcHchKToRtjgSKrEaqFiIcx
 hlO6YB9zrXK9mYn/a7h5PtdYuVYQ/XelZWwv3NbAHTC72pTzzaC+tMjPr02K13jLH0on
 TwGH+nx/x3cVgLeoVq5H3JqT981eoX+wNT4uq7YXD1uBbeu8euvX/scsUeJyBJWz+Wpe
 ptlR7W9OiYPtQM7dkA09StBT+8t68s9M1mt79IfRNDJn1x0dhbMm1Cw8q9iwIEKjvbV6
 3H1QAEUNicc+HQhA4epHKQHm2QMaPOgU6hb2S/VnixqltJnTdp1goukncuuS3Jcxt2Ir
 kH/Q==
X-Gm-Message-State: AO0yUKUSZ/BByIqeMZWXrBU4YSrLezKPk/O5JH9DSDME1gNxa+xxerJD
 3UPjZg8bZFLGJvo3vsSpFkLObQ==
X-Google-Smtp-Source: AK7set+MVL77dHpKwxO5VfAF71g/keFiItjUgyaHv/dlZYh0XixvAwOvvgUPhHsEXffTO4uU2jwCyw==
X-Received: by 2002:a17:902:c612:b0:196:49a3:d349 with SMTP id
 r18-20020a170902c61200b0019649a3d349mr1844112plr.30.1675759425381; 
 Tue, 07 Feb 2023 00:43:45 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 v14-20020a170902e8ce00b001949c680b52sm8273534plg.193.2023.02.07.00.43.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 00:43:45 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH] target/riscv: Remove .min_priv_ver restriction from RVV CSRs
Date: Tue,  7 Feb 2023 16:43:35 +0800
Message-Id: <20230207084341.303907-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 07 Feb 2023 08:43:50 -0000

From: Frank Chang <frank.chang@sifive.com>

The RVV specification does not require that the core needs to support
the privileged specification v1.12.0 to support RVV, and there is no
dependency from ISA level. This commit removes the restriction.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/csr.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index fa17d7770c4..1b0a0c1693c 100644
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
2.25.1


