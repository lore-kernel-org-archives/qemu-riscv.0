Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2E82C282EC
	for <qemu-riscv@archiver.kernel.org>; Tue, 18 Mar 2025 12:53:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tuWMM-0004eg-SU; Tue, 18 Mar 2025 08:47:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1tuQxd-0000K1-TK
 for qemu-riscv@nongnu.org; Tue, 18 Mar 2025 03:02:02 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1tuQxb-0002kn-VU
 for qemu-riscv@nongnu.org; Tue, 18 Mar 2025 03:02:01 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-22438c356c8so90836375ad.1
 for <qemu-riscv@nongnu.org>; Tue, 18 Mar 2025 00:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1742281318; x=1742886118; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0edgTYoWHKRu92ltgEpm8dVjfH0ldEKXvt5V/yx46BU=;
 b=B0LKkIPs3BIrJn+7BNlRg0BaBbzk22NeDiJocaz5WUzoxChBBC8t9oHJKnZvMgij3q
 5KYHX4CTR6P6GBXUEB11D1QnjqbIz8sIQay25pp0AEMN+7yd0+2yfKtUXw/x4V0w/yTN
 dOliCOL0E6nvhDdcqJqf9UUai+kt7HkUKzXauhSDZa+jryvp46gxhIgHiQq9XVL9zDpK
 0391ph879U3UY8+vUBV8syPQB40SUTN//SBkvQKVh+UfcuZn18fgv5rR2yQ4vm3Ja1UA
 V813FRquXqi0YJS9feUI1Kd2/v/KiC/zHo4du2VLuSytGM+GIEA91AzVs4gWNlIZ/Fqi
 TIsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742281318; x=1742886118;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0edgTYoWHKRu92ltgEpm8dVjfH0ldEKXvt5V/yx46BU=;
 b=rJYqpRgvKC2PfmKX5gDASMDTRABY4mtmVz0EES3nMLf0Ov8hM0/TD6yk4lW5/Fzzqn
 HMEdtIPKK2eCanQoTDCiYX8TcV99j3tiMGRez5TmlLcM7TvArbV5MQeFWXqmjT7GzSgE
 tcvP5JcNZkE84jhqPQXw6aY12V4ekSSqivIuulSwRfflVLko6rTrG6rpimAXAR8304WD
 rgoMXRJrV9SSbZPFLWTIxBjb/lMSwYyQeFqOZx1AqBUpyVXbNYA/148zbzB4p8CIxu8a
 HM0Dvqj+5OB/Hslc6ABJXfBgtDsdpd2mwhPNcN8pU6tXLImfxhmbkGptD36jBq/Pc2Tz
 zxFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX00Zf00bty36A5N5AgdeJVSAs3Urs3sWesAoEY0DiiEnFfjhbVntAAOJFdicHMyo4HJc1fi+3dBUnu@nongnu.org
X-Gm-Message-State: AOJu0Ywb8W4T5vBC9vaZAup/aUze+FcNR6jXAciauvITslw8oaVEkDRK
 WK44+yQaLPj7IR3HaxST+rJjBejwhLzVg5fK6d4dc53uRQyeJmB2axVWasptBT4=
X-Gm-Gg: ASbGncvVihM/A3VJQ0ez6umDBKpYotyreOyT4PUja4Mb2vzfIzz+gC7aAA+HMZyqa/m
 V+pYXxMn9lEfnFSvwKIOQbk/fhtJ5SQ1FjkBcyAnFb0SHlUlsKGjXH0rgfMcuHfSUkqtuXLgXID
 7fFM6VaPS0Z1oADnhoWkUqXRtDAqGTZ8OzQVRVrdnwX+Xvd2n9kKaGmaZUE40oiYnKuO88msqgt
 8tskq/RqCi6YSNOhaKq4Ai90Dmmn0FjDAgMcIKoRXxqxauWfAtOkP9CV9Ds1I0cdrZ72fkVRg+U
 6tB/niEh6sTaT4qaBDyIDmt7D718bHgBxQ9iaJnTDsP3nmgsezaceyGqX4VKrpV0Rbdat2Al8Mn
 9Ns+VKMZG
X-Google-Smtp-Source: AGHT+IGWifLnYVuRbqWUZyfMBtkq3CXs7fAs6peqoxMK/fCdcqHir/J6V82jUNm12Xja0X92WeP3Sw==
X-Received: by 2002:a17:902:c944:b0:223:54aa:6d15 with SMTP id
 d9443c01a7336-225e0a6c3bdmr188429355ad.12.1742281318146; 
 Tue, 18 Mar 2025 00:01:58 -0700 (PDT)
Received: from jchang-1875.internal.sifive.com ([136.226.240.172])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-225c68885a1sm86966235ad.13.2025.03.18.00.01.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 18 Mar 2025 00:01:57 -0700 (PDT)
From: Jay Chang <jay.chang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Jay Chang <jay.chang@sifive.com>, Frank Chang <frank.chang@sifive.com>
Subject: [PATCH 1/2] target/riscv: Restrict mideleg/medeleg/medelegh access to
 S-mode harts
Date: Tue, 18 Mar 2025 15:01:35 +0800
Message-ID: <20250318070136.38898-1-jay.chang@sifive.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=jay.chang@sifive.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 18 Mar 2025 08:45:46 -0400
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

RISC-V Privileged Spec states:
"In harts with S-mode, the medeleg and mideleg registers must exist, and
setting a bit in medeleg or mideleg will delegate the corresponding trap
, when occurring in S-mode or U-mode, to the S-mode trap handler. In
harts without S-mode, the medeleg and mideleg registers should not
exist."

Add smode predicate to ensure these CSRs are only accessible when S-mode
is supported.

Reviewed-by: Frank Chang <frank.chang@sifive.com>
Signed-off-by: Jay Chang <jay.chang@sifive.com>
---
 target/riscv/csr.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 7948188356..975d6e307f 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -5783,8 +5783,8 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
                           NULL,                read_mstatus_i128           },
     [CSR_MISA]        = { "misa",       any,   read_misa,    write_misa,
                           NULL,                read_misa_i128              },
-    [CSR_MIDELEG]     = { "mideleg",    any,   NULL, NULL,   rmw_mideleg   },
-    [CSR_MEDELEG]     = { "medeleg",    any,   read_medeleg, write_medeleg },
+    [CSR_MIDELEG]     = { "mideleg",    smode,   NULL, NULL,   rmw_mideleg   },
+    [CSR_MEDELEG]     = { "medeleg",    smode,   read_medeleg, write_medeleg },
     [CSR_MIE]         = { "mie",        any,   NULL, NULL,   rmw_mie       },
     [CSR_MTVEC]       = { "mtvec",      any,   read_mtvec,   write_mtvec   },
     [CSR_MCOUNTEREN]  = { "mcounteren", umode, read_mcounteren,
@@ -5792,7 +5792,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
 
     [CSR_MSTATUSH]    = { "mstatush",   any32, read_mstatush,
                           write_mstatush                                   },
-    [CSR_MEDELEGH]    = { "medelegh",   any32, read_zero, write_ignore,
+    [CSR_MEDELEGH]    = { "medelegh",   smode32, read_zero, write_ignore,
                           .min_priv_ver = PRIV_VERSION_1_13_0              },
     [CSR_HEDELEGH]    = { "hedelegh",   hmode32, read_hedelegh, write_hedelegh,
                           .min_priv_ver = PRIV_VERSION_1_13_0              },
-- 
2.48.1


