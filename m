Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFC9CE77188
	for <qemu-riscv@archiver.kernel.org>; Tue, 14 Jan 2025 13:22:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tXgqW-0008OB-27; Tue, 14 Jan 2025 08:20:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tXgqM-0008L8-IR
 for qemu-riscv@nongnu.org; Tue, 14 Jan 2025 08:20:31 -0500
Received: from mail-oa1-x43.google.com ([2001:4860:4864:20::43])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tXgqK-0003sg-IT
 for qemu-riscv@nongnu.org; Tue, 14 Jan 2025 08:20:30 -0500
Received: by mail-oa1-x43.google.com with SMTP id
 586e51a60fabf-29f9e76802aso3157836fac.1
 for <qemu-riscv@nongnu.org>; Tue, 14 Jan 2025 05:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1736860827; x=1737465627; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mynXJ5IrYfy9NgRkzBtm75h5rsWmg3+Z5xI7zKtSYPg=;
 b=XYS3pxSLcFseftCX2414RH5AxXyUoLLBHSUXqszaw4rh9Yc+CkUUoIwJJe9596eEKV
 Yerf1I16ifQHz6AlK7zzOT5JtE3+/wqs4x7Ta2i4SRMilA32avvsQrwdwzJkvj8KblYx
 kgZJf0Jt2/dlfzrOax8gREUNH3tJEXxQ2wbvhUirPKjM6r0hDmQ+TGdJX760wsG5oHLZ
 FYYcQsok5PWVfvvyD3RYVfDjRunYknIbGFa06YLDANfBU6zUbmpE48Sy9adMaAs8nKnd
 BApMcLR9PA7nzZjyzKuObU9bWkAJTWUzG2WunBlal6Vz+fy40fuF0f8EoWCspnvsCJsE
 cEBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736860827; x=1737465627;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mynXJ5IrYfy9NgRkzBtm75h5rsWmg3+Z5xI7zKtSYPg=;
 b=Qs0buZi/9wPEKEqtVRSjLzMxmZTtBE7YGnTyy2aeVeajTjauRR/qDzEzebFKXe1rzW
 5Kd4BJihJ8DxAE0XYS3aV3IlQLB9IpiYwrPCLvTEX7A/WDJPPd7eRwHsgVzfgZ8QBS5m
 v8aMF3199qs5FV7SW6tcxRaMd4zUyY/6Lp6dC6EAh29uSvbUsM10oXmxAvObZQ3tyMPv
 NaNkPDbCyaeTTLVEwzetcGp9h0tlOjx8SRAWX7cEWJ/dD3VIgXKSxH1AONApiNzhNN/d
 iFE3Mh105GYrmiakwAVI4904AmKHGCJCUIwHer2QXpyN/pFMgN4zM57GMnXwPjafu94I
 xJVQ==
X-Gm-Message-State: AOJu0YySbcv7Md/KVw+9JSYf/uCT3XRfGK3IvjHhDOajnPiVdCL0Ogqb
 lzynfvR832cnwih9r5G/qqjsFEEIBcv4XzvcUp+bdnU58vgj/vTlHknIBJPzGFk=
X-Gm-Gg: ASbGncsVWIs/JoMNkfGfb1KEHKM9q2mabc6ykZbfWqyvY4MNwSgBoKGkZodP4DsMzBc
 LxJLiaC2Zqyi8NfTpcU61FQ3/W1jyPi0fXuNXYRdi1S9Ma+JRr4qSPKqGL8D29B+XB7kjSFJfqc
 qfeOVdxXcPxCGOTZr0kMGpALkk4VTuVt4+ZIUZQlJnMERLplGZ2WydGxX7R+ZKTSYjEUoR9aVsy
 9zK29yKfug7sdl4FzwiejAb4kC1LFuO5PqmuWcNp7u/aTTKMVTQypIXBQ87IYDveoLymJPOqO8b
 OoNJptHamA==
X-Google-Smtp-Source: AGHT+IH9GEM07NrUQO5QW5qlgUiKy6kyt5794f3uDyRbSk64cnDkglA67Jp3+mM8ve9rPbmMjj9c3Q==
X-Received: by 2002:a05:6871:4f0e:b0:2ab:99ac:250e with SMTP id
 586e51a60fabf-2ab99ac2699mr9656070fac.11.1736860827334; 
 Tue, 14 Jan 2025 05:20:27 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([189.110.107.205])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2ad809b10e4sm5052411fac.35.2025.01.14.05.20.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2025 05:20:26 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 2/4] target/riscv: use RVB in RVA22U64
Date: Tue, 14 Jan 2025 10:20:10 -0300
Message-ID: <20250114132012.1224941-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250114132012.1224941-1-dbarboza@ventanamicro.com>
References: <20250114132012.1224941-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::43;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x43.google.com
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

From the time we added RVA22U64 until now the spec didn't declare 'RVB'
as a dependency, using zba/zbb/zbs instead. Since then the RVA22 spec
[1] added the following in the 'RVA22U64 Mandatory Extensions' section:

"B Bit-manipulation instructions

Note: The B extension comprises the Zba, Zbb, and Zbs extensions. At the
time of RVA22U64's ratification, the B extension had not yet been
defined, and so RVA22U64 explicitly mandated Zba, Zbb, and Zbs instead.
Mandating B is equivalent."

It is also equivalent to QEMU (see riscv_cpu_validate_b() in
target/riscv/tcg/tcg-cpu.c).

Finally, RVA23U64 [2] directly mentions RVB as a mandatory extension,
not citing zba/zbb/zbs.

To make it clear that RVA23U64 will extend RVA22U64 (i.e. RVA22 is a
parent of RVA23), use RVB in RVA22U64 as well. As a bonus we can also
exclude zba/zbb/zbs from 'ext_offsets' and make it a bit shorter.

(bios-tables-test change: zba/zbb/zbs no longer on riscv,isa)

[1] https://github.com/riscv/riscv-profiles/blob/main/src/profiles.adoc#61-rva22u64-profile
[2] https://github.com/riscv/riscv-profiles/blob/main/src/rva23-profile.adoc#rva23u64-profile

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c                |   5 ++---
 tests/data/acpi/riscv64/virt/RHCT | Bin 398 -> 400 bytes
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index b187ef2e4b..8d0563527f 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -2351,13 +2351,12 @@ static const PropertyInfo prop_marchid = {
 static RISCVCPUProfile RVA22U64 = {
     .parent = NULL,
     .name = "rva22u64",
-    .misa_ext = RVI | RVM | RVA | RVF | RVD | RVC | RVU,
+    .misa_ext = RVI | RVM | RVA | RVF | RVD | RVC | RVB | RVU,
     .priv_spec = RISCV_PROFILE_ATTR_UNUSED,
     .satp_mode = RISCV_PROFILE_ATTR_UNUSED,
     .ext_offsets = {
         CPU_CFG_OFFSET(ext_zicsr), CPU_CFG_OFFSET(ext_zihintpause),
-        CPU_CFG_OFFSET(ext_zba), CPU_CFG_OFFSET(ext_zbb),
-        CPU_CFG_OFFSET(ext_zbs), CPU_CFG_OFFSET(ext_zfhmin),
+        CPU_CFG_OFFSET(ext_zfhmin),
         CPU_CFG_OFFSET(ext_zkt), CPU_CFG_OFFSET(ext_zicntr),
         CPU_CFG_OFFSET(ext_zihpm), CPU_CFG_OFFSET(ext_zicbom),
         CPU_CFG_OFFSET(ext_zicbop), CPU_CFG_OFFSET(ext_zicboz),
diff --git a/tests/data/acpi/riscv64/virt/RHCT b/tests/data/acpi/riscv64/virt/RHCT
index b14ec15e553200760a63aad65586913d31ea2edc..13c8025b868051485be5ba62974a22971a07bc6a 100644
GIT binary patch
delta 53
zcmeBUp1{l%<l!7LfsuiM@#{n`13^7TMg~>JqB1j+%-qDZl;ot1UQ&#clNpsc(ij;S
I3K$s}0ARKZK>z>%

delta 52
zcmbQh+{ern<l!9B$H>6Im@tvcKtP9)kwJyAsLaeHGdD3UC3&N_6yxMHMkS6EMh1pF
HMg|4|IwT82

-- 
2.47.1


