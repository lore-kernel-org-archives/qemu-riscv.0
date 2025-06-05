Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89F9CC5B543
	for <qemu-riscv@archiver.kernel.org>; Thu,  5 Jun 2025 09:29:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uN6uD-0004if-7i; Thu, 05 Jun 2025 05:29:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uN6uB-0004iA-Ih
 for qemu-riscv@nongnu.org; Thu, 05 Jun 2025 05:28:59 -0400
Received: from mail-vk1-xa30.google.com ([2607:f8b0:4864:20::a30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uN6u6-0003Pn-QO
 for qemu-riscv@nongnu.org; Thu, 05 Jun 2025 05:28:59 -0400
Received: by mail-vk1-xa30.google.com with SMTP id
 71dfb90a1353d-5308b451df0so269052e0c.2
 for <qemu-riscv@nongnu.org>; Thu, 05 Jun 2025 02:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1749115733; x=1749720533; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gwm25hiwIg/8ckj5j8PRZomVpe15vvR6v2GT8eECMYw=;
 b=N/fYgmVu3fDgRIsZx05eGhFr7BZZPkgQtPDf3TAsYEBPkMF7y426EaITavkYnfIVPt
 +nrhpgGZdrmI8H8qOx5L0YE7vkDrMppcBlZ3kGTIFfdnpaRTHEqHQgTAxmuPDouZNGoJ
 CDsWqADp8io1orwyCxG8mgN0TeYiHxz/8V/aQbA6Ywr6eaowxXZxhUqs36B42ohypa0S
 EDQ+S3h9SJF/pzvt90PAGhbqcDKamI8OQYl4BACPpRTKNgZLCv61E6+Llt9Yw5r1NKod
 G5umKSV5q2sKNWavvlUt3JcsSabYEj81bYLYHKc3uBDDiwBiJUvU/TqpOrxFRk9UcJEM
 rOoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749115733; x=1749720533;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gwm25hiwIg/8ckj5j8PRZomVpe15vvR6v2GT8eECMYw=;
 b=Xb5Vb0fU+d9VEFyN9Hr9weHGWRRI//fWPXD1uA4PnS8fTAd0xYk/yoNHHrDdN6XfAF
 iVA/iJQ+H2bti4c8DjGROZ0bWhxeVgKBcVzPrlY6qRQjYyuDRwMK/n9PFI3qO+T8qrWR
 xnvQ8iAEYCscN2Is/Yg4Or3Bl8CK2LSKLfEnvcVpA9hsFdQ8tk/yMlFHuMVoQ7HxFvVj
 IYM+56maj+Cq3jTbYWWhnoA6tYfxCe1h9k6RfTxiZzY/d5svCHqdiTqAGlBMwBeND3zT
 gIfmaEGGXlMCJ/8l10GgZ5ariunPW7mjGuy/Fab6VZqcA3jNH8T4R9gDcKAePs6p+Lmg
 9rbQ==
X-Gm-Message-State: AOJu0Yy+YnyVXJQkrR/Gn1BKAzlcDOk8XK71xMaunUtDjc+ym/4BUZFn
 xkmWA86kFBRL96KYcai7YAqbtSp2BVZwEQqsjvPFxhPjr0S61VlzIDMOlqxl7U45OHpZpiDilEJ
 HzpncW9c=
X-Gm-Gg: ASbGncsy8OeGDjTCoA/Wbw4V9Iiy10TfmF4c7JGCwLFuhlWkk7ZKtDVV+1FQQlzQP9t
 BzILenCTtveyB7owvmMjWDELnhzGyh2fzedkw0hBuH0zj6PkeRMPaVnfxqizXlXkLMeISIijHbm
 jJJ1RyGuKBoPSdvnzVRNGYK1olhpCGOvbtUUFdLeUDf7Ywx8x/ruaRS1LZoaUbTMrroRhcB2qRV
 6hSHdvAywnfgAVJbMxOuneHwrracmZ4RShCDUMkXGLcduvAuT47Y/eQ9io21sWIZe/h8+MA1NdZ
 7pi4gHFBUxVO/F/Khqa499t/gc35Cn6UATeZiupiJrMmDynFcUYYZkTdhzKU5VJqcqzunQzMP4d
 c/b3t
X-Google-Smtp-Source: AGHT+IESIyMTwIWdJjk4wyRtRFEA23cCMOPO4y9ohQKLDRt3+dEyiomh7Gq+Q95EuETGYiYaYztFug==
X-Received: by 2002:a05:6122:d99:b0:520:61ee:c815 with SMTP id
 71dfb90a1353d-530c73f5f10mr4641917e0c.10.1749115733464; 
 Thu, 05 Jun 2025 02:28:53 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.188.133.196])
 by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-53074bf86b1sm12311772e0c.36.2025.06.05.02.28.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 02:28:53 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v3 2/3] target/riscv/cpu.c: add 'ssstrict' to riscv,isa
Date: Thu,  5 Jun 2025 06:28:35 -0300
Message-ID: <20250605092836.1383882-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605092836.1383882-1-dbarboza@ventanamicro.com>
References: <20250605092836.1383882-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a30;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-vk1-xa30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

'ssstrict' is a RVA23 profile-defined extension defined as follows:

"No non-conforming extensions are present. Attempts to execute
unimplemented opcodes or access unimplemented CSRs in the standard or
reserved encoding spaces raises an illegal instruction exception that
results in a contained trap to the supervisor-mode trap handler."

In short, we need to throw an exception when accessing unimplemented
CSRs or opcodes. We do that, so let's advertise it.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/cpu.c                |   1 +
 tests/data/acpi/riscv64/virt/RHCT | Bin 406 -> 416 bytes
 2 files changed, 1 insertion(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 3c1b1dca47..058387ac48 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -217,6 +217,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(ssnpm, PRIV_VERSION_1_13_0, ext_ssnpm),
     ISA_EXT_DATA_ENTRY(sspm, PRIV_VERSION_1_13_0, ext_sspm),
     ISA_EXT_DATA_ENTRY(ssstateen, PRIV_VERSION_1_12_0, ext_ssstateen),
+    ISA_EXT_DATA_ENTRY(ssstrict, PRIV_VERSION_1_12_0, has_priv_1_12),
     ISA_EXT_DATA_ENTRY(sstc, PRIV_VERSION_1_12_0, ext_sstc),
     ISA_EXT_DATA_ENTRY(sstvala, PRIV_VERSION_1_12_0, has_priv_1_12),
     ISA_EXT_DATA_ENTRY(sstvecd, PRIV_VERSION_1_12_0, has_priv_1_12),
diff --git a/tests/data/acpi/riscv64/virt/RHCT b/tests/data/acpi/riscv64/virt/RHCT
index 156607dec45b0e63e5b3ebed62e81076dacd80d0..52a4cc4b6380eee3299b965271a39e9e01f5a698 100644
GIT binary patch
delta 52
zcmbQnynvZ2$iq2g0V4wg<L!xD2CR0Bj0~n5?U@+aic5+zlS?MsG3rguW>n@VV`N}x
IU}Rtb08<(Z?f?J)

delta 45
zcmZ3$JdK$v$iq2g8Y2S(<Ex2W2COEGj0`#(?U@)SdogNHE@M>U$YEq)C}U(`008kX
B2|xe<

-- 
2.49.0


