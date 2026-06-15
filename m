Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A108CD98C5
	for <qemu-riscv@archiver.kernel.org>; Mon, 15 Jun 2026 13:20:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wZ7ED-00021m-T5; Mon, 15 Jun 2026 09:19:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qingwei.hu@bytedance.com>)
 id 1wZ7EC-00021R-1e
 for qemu-riscv@nongnu.org; Mon, 15 Jun 2026 09:19:48 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <qingwei.hu@bytedance.com>)
 id 1wZ7EA-0003R6-9C
 for qemu-riscv@nongnu.org; Mon, 15 Jun 2026 09:19:47 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-2bf1cda2b17so23872225ad.1
 for <qemu-riscv@nongnu.org>; Mon, 15 Jun 2026 06:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1781529582; x=1782134382; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ucx3uLkg3ssgpzA1hnSf5+DtlQk6YxcnZlxyY7JjFMU=;
 b=lM57gYbW2QoCfnYQX34hUBxDgODmogpyoH4FXxrdxn1znbpXxeUBc6USej6luPcrGC
 LKCS+Cp1P+yuEftHfUNe+Jxwdltr6sM+7k2EUtdLrDai5oh+1Repefc+h09cRMug+D7p
 g1k8LT/gea0P5CBGNZuDF8/kOYvUZb4Z0YFSuMe/5WI2LsUaOm7YTqm+SEbjMgJJQOI2
 puDbaVSFwVg/eprnYfHvAl815s/+Cr6fUHNSEVxPXU5TwfgmbURGzylSHplIcIn7YQFk
 ifEQMSROsHU8mUgCLUwiCuZS3kAvopv9ZrQt71/IMcTstd5HeVTg/5STff1EiKgPtorX
 P6Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781529582; x=1782134382;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ucx3uLkg3ssgpzA1hnSf5+DtlQk6YxcnZlxyY7JjFMU=;
 b=gqaI6yvSoa5gv8/NqU1Z3fU84RSdjWTECL1ef3LBfMwAtpGbxQHQcvrrDZupapwShs
 NnXVxu+Id/KvUWd94wcwntSxT97K87+uoUokLI/SW+Y5D73tfgKk0bX6rbu4MYeAuM6X
 3FurOXFu5zKXbigsQdcfWVwJexSC41GpRAlszeoxcVyc2FSCoWKx1IfmRIh5P2uveHIC
 +PaMRyvbuHZ8RiXuh83McqKbmRBUeVsdNvLNfJrKk5fLjur7HszMzqv1VU9CmTTSIoYz
 tORW3DfICANre7XqoG4h4stTxNQL3WrxkwH3uL+D/ATzzTE99GY1JiSeqm7bQll2ubjB
 M7DQ==
X-Gm-Message-State: AOJu0YwmK705dLfgOBVO9K8cw9HIX36/z0q+rgfgltn3Zd/boPW5uuhQ
 QAk2Yp1IeSiVV9vkgGMCIlr7tAzrGdRuKAIW+EU8ML4NGpnP+K5KIt09Bj2BuPpjAKs=
X-Gm-Gg: Acq92OHF4tWVXnROWHbZ2jx2WBL445yqDOUEvgr0KWE2rwiAL3ECx76cHylB+ZioMFb
 9cKCwMMjahIZ8er9rEOqp5LC/Puw4V77sNGSnHI/old1FcIIkW1US4Ak+10UZ9T4w31WnD4BU08
 4r/4lb/vSpaKpKcPqCwk6m2iSteu1mDIaeIYUZxPJ560wqB59JG68KW44fGruc1plqvDzMQUl+S
 KtO5w6aPRdz3DC48Pj5p9lpjsX1dhBs00atYPq1pr1dlBZY9jyz6NuLRxq4fThD+n/vtoFgM2TJ
 21hoKH5dxxkG2Fj6M1rNH1ve8XkajoMYCMp/Bf9v5KPE3Fm7XP4GgLjGMUEYvqbTOLlG6O/0NWc
 6uAj39DrRh83cRfJVNL2YcQh7RTv93weA1A0zM580NCxlUm+KCAd+AOHCav4kOuXegRu0MurQTV
 OXVmuJMmpzMorVTS8uhZov99ejzWsihxnmbR7DDQUhYQ==
X-Received: by 2002:a17:903:b84:b0:2bf:2d0:8877 with SMTP id
 d9443c01a7336-2c3fd41e1f5mr118777645ad.23.1781529582068; 
 Mon, 15 Jun 2026 06:19:42 -0700 (PDT)
Received: from n37-012-226.byted.org ([115.190.40.15])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c432c8ca31sm101483565ad.55.2026.06.15.06.19.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2026 06:19:41 -0700 (PDT)
From: Qingwei Hu <qingwei.hu@bytedance.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 liwei1518@gmail.com, daniel.barboza@oss.qualcomm.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 jim.shu@sifive.com, nutty.liu@hotmail.com,
 Qingwei Hu <qingwei.hu@bytedance.com>
Subject: [PATCH v2 0/2] hw/intc: Skip reset for KVM irqchip
Date: Mon, 15 Jun 2026 21:19:23 +0800
Message-Id: <20260615131925.3019370-1-qingwei.hu@bytedance.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=qingwei.hu@bytedance.com; helo=mail-pl1-x630.google.com
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

This series fixes NULL pointer dereferences in the RISC-V APLIC and
IMSIC reset paths when the interrupt controller is handled by the KVM
in-kernel irqchip.

Changes in v2:
- Split the APLIC and IMSIC reset fixes into separate patches.
- Carry Nutty Liu's Reviewed-by tag from v1.

Qingwei Hu (2):
  hw/intc: riscv_aplic: Skip reset for KVM irqchip
  hw/intc: riscv_imsic: Skip reset for KVM irqchip

 hw/intc/riscv_aplic.c | 4 ++++
 hw/intc/riscv_imsic.c | 4 ++++
 2 files changed, 8 insertions(+)

-- 
2.47.3


