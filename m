Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E8D7C5B549
	for <qemu-riscv@archiver.kernel.org>; Wed,  4 Jun 2025 17:39:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uMs4Q-0000Ut-7J; Wed, 04 Jun 2025 13:38:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uMs4A-0000RH-HK
 for qemu-riscv@nongnu.org; Wed, 04 Jun 2025 13:38:18 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uMs48-0003CB-SM
 for qemu-riscv@nongnu.org; Wed, 04 Jun 2025 13:38:18 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-2349f096605so1103055ad.3
 for <qemu-riscv@nongnu.org>; Wed, 04 Jun 2025 10:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1749058695; x=1749663495; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cRzrOe/cf03tnXNq4F7M1tVP+Oou957h+wPpKs536b8=;
 b=khmD+/Ybk38Im7Ov259HuoBptPftjz3ft9u36WPgGx+OyOW6i6cv5pWCcZDujsZWJs
 hvn26xWSQKKDXFAU/SZwW0JiR8UXwYuC4nT5PNEOOQtPlQXiYJ6O4P0psRi67+BZfts0
 tl4Ga9IjOLq4a9CoOYAFFKwMski4Z/1H8p0w/TVoqpzV8ksEPD2WE6YRnEde76XKR0q6
 I4/cosytV0ns1HVLpvBbumOK5LAxXGye3AMEa2/x2oGQEzoaaMbQ07FES9405s/mtrV8
 PO5lrUkc3JZRpeVT2HyUKCSQlngcYLZzsAmdj11KLfWNr2nusas/3UAmBnzGGVxCqWQS
 fZ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749058695; x=1749663495;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cRzrOe/cf03tnXNq4F7M1tVP+Oou957h+wPpKs536b8=;
 b=KKIWzcky4m5vFr+U4Ou8+cOopi+00O5I8Qsm5ZwtTXgn5UsnVs4pXA7IRhhIARzjEv
 mkWyT5CrUUo/PwVH8gX8IL5KkvKnrn9Er7DBPjO6GK0zcaqI0MKytRh0WsvQRyWzlW9W
 DAfHAlPQFEPY8uLwuS077qvPM+aj3Jl0+D3XyzfGRlA9nP2bQP3i7hrVKnJ+KQka3xAW
 +npkn1mMUzRfVf+4a9fK5X5SXuSTjbMIhFPxz1mvchvLAEjweDsfMQLwaNd+AGNbZ47S
 zjtgr4eWJvqHa0JlNXO427lQKbbAq9cuVuj2LU/kUmdP7P1r/OhYwz9HMk7zECFSfFrl
 d9Rg==
X-Gm-Message-State: AOJu0YyRABhId7WwLM/igvZA8+XYgOZHNkxlcw2V9ixVbZ7T41JuLmLn
 MiriDO1NJ1UzdjJllrDUecrz7iQHk6+0WhBT0/qZ/xtjVoWYe/fEUbl2CgVixWjiN3BzQMekGLB
 VZzCv55k=
X-Gm-Gg: ASbGnctBd2ARIlbEzE9I/DXUgVV2Vbbl47i3CfchmFcJct7Q5JL3kMZHMczRHx46XpJ
 iFdwnSUFstKLK+7a7c0uZcbcVfC7y0crPD4KZi108TDZ+Je9AfEAMhjrCYx6D9J42BjG5Ko77Xp
 /HSBDnSuuGWbfTmK+WAbf7QaivRyt8e7NWBXpvfKtZtRRv4gT+ficS7kRQrFtRNzCLOnva4h1a0
 c92DOIwLlvHLp9FouthUzxDP2c6pssHUPdljXbj/l2yMTBUyfIn+BsXs3a4b2/1zHtCNVTmdao3
 B5lh8qxj0+eJ/rbc/QXEFaMvlcu+ybP3y6Fesgx9xyXHGMqbKrY33WI/qwNcCj5uA5o0mOspH79
 jQeI/
X-Google-Smtp-Source: AGHT+IFkpEmJZlD2S/cAaIS2wpLgmZgC3GlwxG5puXsTlmeGLpdfiPqBtRx05aL23gryYemoOXEOWA==
X-Received: by 2002:a17:902:74cb:b0:235:e942:cb9d with SMTP id
 d9443c01a7336-235e942cc6dmr25439415ad.17.1749058695553; 
 Wed, 04 Jun 2025 10:38:15 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.188.133.196])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23506cfcbb9sm106913215ad.208.2025.06.04.10.38.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jun 2025 10:38:15 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v2 2/3] target/riscv/cpu.c: add 'ssstrict' to riscv,isa
Date: Wed,  4 Jun 2025 14:37:57 -0300
Message-ID: <20250604173800.1147364-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250604173800.1147364-1-dbarboza@ventanamicro.com>
References: <20250604173800.1147364-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x636.google.com
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
Message-ID: <20250529202315.1684198-3-dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c                |   1 +
 tests/data/acpi/riscv64/virt/RHCT | Bin 406 -> 416 bytes
 2 files changed, 1 insertion(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index eeb44a2f1e..c1bcf60988 100644
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


