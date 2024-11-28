Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64303D69113
	for <qemu-riscv@archiver.kernel.org>; Thu, 28 Nov 2024 14:15:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tGfH3-0005IM-GE; Thu, 28 Nov 2024 09:13:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cleger@rivosinc.com>)
 id 1tGfGz-0005Bl-A4
 for qemu-riscv@nongnu.org; Thu, 28 Nov 2024 09:13:38 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cleger@rivosinc.com>)
 id 1tGfGw-00060K-4Y
 for qemu-riscv@nongnu.org; Thu, 28 Nov 2024 09:13:35 -0500
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-21290973bcbso8034155ad.3
 for <qemu-riscv@nongnu.org>; Thu, 28 Nov 2024 06:13:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1732803212; x=1733408012;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J00ybbkLhRDty+/Gfb3TMi/46nhNnKAwTkyfG+1+1qM=;
 b=xsyJ/0ujN7fH0r7Umy8shncY1nZFb5C+QqC37GxM3UiZBjPQcwLIFWqiqOcNYGCIS3
 34TGXOS0CAAAYkDhCougiqSTkaOt0kKDuztQe1lz9yvZKVpOaOHSdb8BKx+Dv3MgtV9m
 E82FO3+kgZ5eemRaUrMzmLj2mapAXqZxgR2UIoMclRASL4oc7vrVmXkw0W9eht926xs3
 MCP0hMm9CvXuo6nGRxjTqjnscdBxUkIsla7vHNtbRHIv7CTtdXaPuwfnQJO8jhcd/60F
 CqQ0wlthuOUVW1ItuaZ0ZsytfrYbaPkLA5m3LASBu5LTF5Z8dtN8eEMr2eXRNQXRs15n
 ch1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732803212; x=1733408012;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J00ybbkLhRDty+/Gfb3TMi/46nhNnKAwTkyfG+1+1qM=;
 b=IZEpLdutCMwHlDsh9YYstf8YhqWPK+tk3JaN7P7kstRb7hsRPNgTXYSgjippYHDrgY
 8dZfGVvv1LZBt8EOo13ATZsPSrVSiirdBpn5Acb+mNkkyMQ3IdvrkU9uVUg/M1es0F5i
 dZlHcg7wnFR9laS/YE/wia+xiDEEIHtj0v2zDU0j1y552Wsu/8JGzSBRKwGTLpDhypy8
 rd6WkPRUCSKXPHtO4DAkNmM3iTOKwcAWFBLF3jfwwq3RShP8TPgV21GYm1eEQrr+evGJ
 EnKnf36uXOC6ocwznfFfuCvdrWaIYYCdTo9HWPXHcg+FoxWg+nFXcKf6Ea2P8rJgpVw5
 bIag==
X-Gm-Message-State: AOJu0YyWlgFl3fteyCZidsGWpCeKAoKnKBNcpQVGYeHVv3UnZwHbC6yo
 Ja5MIwUoT+0/n9Ki6X6K2gRjQyJ0FwSjCwDFuX8AuOLc3uc6h+QMKrKbpcW6AWkgGQyoC0lSov2
 f
X-Gm-Gg: ASbGnct+RQGQYIuZNuI+0CkZOwXcbbMmU4zIROXlzFy8zZN1Wmf3reQKdTeb8wZevyI
 8IWlYtIoR+FY9ZZlu4yhGDSfva4pifnIfUdh/fxUzZDCK0JWiXS/ty0c6vjbAxH9ritDmtxmegH
 PX0RegcM70FZGRmZSgoalrraqrHaKYGRC2UWiuazQo8MptjK1zsoqAXw1mfW7DI31uRQxwVS69B
 VgYL54Nxj+OmA2lBwIZR7zoKSpGvL9DuXBcmcOOrQ0YsWViyPM=
X-Google-Smtp-Source: AGHT+IEhICvooZzv2eRBI5RAoMQRNxLm9tM3vBudt4iPE1qdfsB7SOrrMNcvd8MN6Lhe/i8nydhRtg==
X-Received: by 2002:a17:903:22ce:b0:20c:9c2b:c40 with SMTP id
 d9443c01a7336-215010853d4mr101064715ad.12.1732803211744; 
 Thu, 28 Nov 2024 06:13:31 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-215218f452csm13829005ad.48.2024.11.28.06.13.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2024 06:13:31 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Ved Shanbhogue <ved@rivosinc.com>, Atish Patra <atishp@rivosinc.com>,
 qemu-devel@nongnu.org, Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v6 5/9] target/riscv: Add Ssdbltrp ISA extension enable switch
Date: Thu, 28 Nov 2024 15:12:25 +0100
Message-ID: <20241128141230.284320-6-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241128141230.284320-1-cleger@rivosinc.com>
References: <20241128141230.284320-1-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=cleger@rivosinc.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Add the switch to enable the Ssdbltrp ISA extension.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1fac03ca99..f30630e947 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -192,6 +192,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(ssccptr, PRIV_VERSION_1_11_0, has_priv_1_11),
     ISA_EXT_DATA_ENTRY(sscofpmf, PRIV_VERSION_1_12_0, ext_sscofpmf),
     ISA_EXT_DATA_ENTRY(sscounterenw, PRIV_VERSION_1_12_0, has_priv_1_12),
+    ISA_EXT_DATA_ENTRY(ssdbltrp, PRIV_VERSION_1_13_0, ext_ssdbltrp),
     ISA_EXT_DATA_ENTRY(sstc, PRIV_VERSION_1_12_0, ext_sstc),
     ISA_EXT_DATA_ENTRY(sstvala, PRIV_VERSION_1_12_0, has_priv_1_12),
     ISA_EXT_DATA_ENTRY(sstvecd, PRIV_VERSION_1_12_0, has_priv_1_12),
@@ -1586,6 +1587,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
     MULTI_EXT_CFG_BOOL("smrnmi", ext_smrnmi, false),
     MULTI_EXT_CFG_BOOL("smstateen", ext_smstateen, false),
     MULTI_EXT_CFG_BOOL("ssaia", ext_ssaia, false),
+    MULTI_EXT_CFG_BOOL("ssdbltrp", ext_ssdbltrp, false),
     MULTI_EXT_CFG_BOOL("svade", ext_svade, false),
     MULTI_EXT_CFG_BOOL("svadu", ext_svadu, true),
     MULTI_EXT_CFG_BOOL("svinval", ext_svinval, false),
-- 
2.45.2


