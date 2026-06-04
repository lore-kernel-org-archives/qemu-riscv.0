Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38762CD6E6B
	for <qemu-riscv@archiver.kernel.org>; Thu,  4 Jun 2026 12:43:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wV7Q2-0003PR-Iq; Thu, 04 Jun 2026 08:43:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qingwei.hu@bytedance.com>)
 id 1wV6kZ-0003wG-QF
 for qemu-riscv@nongnu.org; Thu, 04 Jun 2026 08:00:42 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <qingwei.hu@bytedance.com>)
 id 1wV6kU-0004lP-KW
 for qemu-riscv@nongnu.org; Thu, 04 Jun 2026 08:00:39 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-36da151a152so440659a91.1
 for <qemu-riscv@nongnu.org>; Thu, 04 Jun 2026 05:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1780574429; x=1781179229; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=C1U/pafTgBeeiM015nLfMNulFdqqReE50PJzyG3bAA0=;
 b=bL2CVsJyQsRLrkKVtRmlwKTyY39BT0EcbcSt70wc3gWnTSk2i7y+mIT6Vocpb2fedA
 PaT5IcX4oPKE6KUxe6chFnMpCS9/MxMmymPCj+OXBY5rv0Xv+Dn4e9ZN6MEgq5Hps/E9
 x517yaR5dbNSQBJLA9ETbSzQVKzXCxdMcXH1lRp1g9X2DBKd8PrrEJaRCvjn8FJJFS/6
 JUyVinkz2r4HL7H1bThhis7Z2vctc0KwQYBg9hGXfwIwbPP0lm4g2Ubq7iPi09/+NnNs
 87Dvihp4/T5D3VU96iC6JcZCnDKbujm8tIaWN3s66gEPKtg8qD6YYl25db2MnS7hze7c
 aeFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780574429; x=1781179229;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C1U/pafTgBeeiM015nLfMNulFdqqReE50PJzyG3bAA0=;
 b=UXfbIiyg4rWeL2AMpIr3UE1pmE6f2uJmmvrD27fd/MsX8WW3cSKEgXdvu/9RWQRPWm
 /PSG0rILdygm3bOinqw8HBjD4suoIp/5+LAkNsye/PJGP0ONONK+q82WEUPypHMS8JRF
 bl4aQxeRoArvMge9hz46r229F4rBqEOw7S7UtqJYj6Mj9mfFeBvfLqeTu93owmlfGDmw
 W3j3G9fJYlTcqGI51ixqAKCk43/MKLH7ZZ5rEK2yE9CvU7qG3MCJ9UQKNtE9eyvMqNKg
 zgEcF7ex2zCWF2mqg4ZkNPTlFHpZ+OG9YSMGHtD4OW20WgBL25ACZnkppKuUGNYyfyqe
 3OXA==
X-Gm-Message-State: AOJu0Yw/ybngA7mbBn+F5V/bH1RErH+glZ4AeEuXRfdqcsLv12nfiiLX
 BJKHZrqMnKWt1HRpaGN2cW9OG38T0F5uSJ9aaDlxVhRu80amH3Gk8xcZznrSXGgL8VM=
X-Gm-Gg: Acq92OEtaWI+ZzpD3VhSyztqRnYP7R0vRtncnNXg1xMgo5mU4r+XdaiedahnWoaU/cM
 Viyg2NQEkN/QhWjklxGXUezmZgQzV7+ayPh3/iyngPhkfHSOD1xx6NJIQum7NQgPzw7gnbBiUpA
 +EeFau3LNdcmwTzG03Od8tfq8Rm11zzfVdGY1tJKieLqPFCA9XXL44jImwiX1xO/hhv589m6B30
 5uGvqlkVWn2/qPaOqh//xBdvQWAjFgyv9y3nRJ7sIuRF7U9nVJewv2YySfZv0Q4EgUdPkq3RBcA
 Ooe77LwKAiguT43hORvBGHHD/1E4Entqt8x1e+AjqNmmLoFgw5U+FBXy4zztsdR4jKCO68BpTTA
 oI/1TRwrQwzbfrnSKEY9KyaxWBw6NakIi3oVi1L8BuIJPRz25BPko9a+kAdes+Yjj6qRc7RhY1Q
 c/eVMJ0yE2lswtVdqfR34CAX6o/Y3mlr//Ec08Gt6TBwN9ep7qPt0m
X-Received: by 2002:a17:90b:1e07:b0:367:bc89:546e with SMTP id
 98e67ed59e1d1-36e310fdaf5mr7293146a91.12.1780574428845; 
 Thu, 04 Jun 2026 05:00:28 -0700 (PDT)
Received: from n37-012-226.byted.org ([115.190.40.13])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c85df034a2csm5043929a12.3.2026.06.04.05.00.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2026 05:00:28 -0700 (PDT)
From: Qingwei Hu <qingwei.hu@bytedance.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, sunilvl@ventanamicro.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, liwei1518@gmail.com,
 daniel.barboza@oss.qualcomm.com, zhiwei_liu@linux.alibaba.com,
 chao.liu.zevorn@gmail.com, Qingwei Hu <qingwei.hu@bytedance.com>
Subject: [PATCH] hw/riscv/virt-acpi-build: Fix RINTC PLIC context ID for KVM
Date: Thu,  4 Jun 2026 20:00:17 +0800
Message-Id: <20260604120017.398890-1-qingwei.hu@bytedance.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=qingwei.hu@bytedance.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 04 Jun 2026 08:43:23 -0400
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

Each RISC-V MADT RINTC entry contains an External Interrupt Controller
ID field. On the virt machine without AIA, this field identifies the
S-mode PLIC context associated with the hart.

TCG virt has both M-mode and S-mode PLIC contexts, so the S-mode context
ID is odd and 2 * local_cpu_id + 1 is correct. KVM virt exposes only
S-mode PLIC contexts, and those contexts are numbered contiguously from
0. Reporting the TCG context ID for KVM makes the guest enable a
different PLIC context from the one used by QEMU.

With ACPI enabled, this can leave PCI INTx interrupts pending in QEMU
while the guest-programmed PLIC context remains disabled. A virtio-blk
root disk can then stall during boot because its first interrupt is never
delivered.

Use local_cpu_id for KVM and keep the existing odd S-mode context ID for
TCG.

Fixes: d641da6ed43 ("hw/riscv/virt-acpi-build.c: Add PLIC in MADT")
Signed-off-by: Qingwei Hu <qingwei.hu@bytedance.com>
---
 hw/riscv/virt-acpi-build.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
index 413d47d70e..6b06d9aa87 100644
--- a/hw/riscv/virt-acpi-build.c
+++ b/hw/riscv/virt-acpi-build.c
@@ -100,6 +100,8 @@ static void riscv_acpi_madt_add_rintc(uint32_t uid,
         build_append_int_noprefix(entry,
                                   ACPI_BUILD_INTC_ID(
                                       arch_ids->cpus[uid].props.node_id,
+                                      kvm_enabled() ?
+                                      local_cpu_id :
                                       2 * local_cpu_id + 1),
                                   4);
     } else {
-- 
2.39.5


