Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F104C4345F
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Apr 2024 17:15:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1ryxFX-00081D-7v; Mon, 22 Apr 2024 13:14:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ryxFV-00080h-Lb
 for qemu-riscv@nongnu.org; Mon, 22 Apr 2024 13:14:37 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ryxFT-0006CH-Vx
 for qemu-riscv@nongnu.org; Mon, 22 Apr 2024 13:14:37 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1e5aa82d1f6so34736135ad.0
 for <qemu-riscv@nongnu.org>; Mon, 22 Apr 2024 10:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1713806074; x=1714410874; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LFBkuYABK0A7c67di0u2krxWPF/mO74fm5XS97vNPpQ=;
 b=gNObZUxfiPnlX3nokBJZDmUlQ6xghngpdCLuQiTM4sRLJ5ITc556bnOS1UGoTe5tD9
 t2aNCRdUYvLCYDTQVq6BOCaUmDseQsahJnGD2pK8af+yMOeGRe3O0Ze1lPV4oh6vxv6U
 u4hmx8GsXf80c6BRSy5eO+aGaRQOMenE8/2HvP91lvz1W75UEAkhOyC2ncvUpJrMq2we
 jL2MtPmHr3jFl8ZEt+0z7zgAjBEWKaq6dPI1jZQkh0FrRlk5SBELqC+3j4jkhbK9zWpl
 pAGQjz4FWQScSQ07jy5I3FwZkZQWA96SUJG1+wx8/cAcu8n5vrSbWetYBJNAEB0gQ0d3
 vspg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713806074; x=1714410874;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LFBkuYABK0A7c67di0u2krxWPF/mO74fm5XS97vNPpQ=;
 b=G4vcH3bgHjLcO5HTxQEP7Ro+6vWyUYipBXzYtzpd20RodGKq3lWCruovm4X+b/8+7b
 jyUm3ppr0+Hj1WwiARSoTx8ZFC4/XGKAJQtMCR7uAmqjavZ9G6LaUGMNwm3bifsyyCu9
 hPeU8LeEdh6RRMdQytlDHqlM4Go6SbmcGGwpmjueUJXewDw1O0TiO2jxnRPOp3LAyTOK
 941Evig1CelrbExxMrRkOdYndj8Q9ZmUzm4UkX8jTuLFAKSC/60ZldCf7VzqGqlpmovK
 B3Z79ozBn/nTk76cRWHbalwleElkoD9Qaw9jsaAothR0vuv0TR1DV9UpSQedHODPOEdn
 82Zg==
X-Gm-Message-State: AOJu0YxA+cPLnTlt5v1osIb51TV4EvO8MzvTrzSA/VMBqKS3r5O8CW+0
 xBDgT7I62TYL39xjxTcD5ingQprMv4Yyt4qFoKGpE3x2C1PdE5AvXzw4IchIQMw=
X-Google-Smtp-Source: AGHT+IHEX84P4yRfqXSktjEsFM6tHuceD2hedFpb3s0ftT111lUvO7bHbESlv+010GmRB3AVXMirKA==
X-Received: by 2002:a17:902:d4c5:b0:1e5:a3b2:3da9 with SMTP id
 o5-20020a170902d4c500b001e5a3b23da9mr370003plg.17.1713806074460; 
 Mon, 22 Apr 2024 10:14:34 -0700 (PDT)
Received: from grind.. ([191.255.35.121]) by smtp.gmail.com with ESMTPSA id
 i16-20020a17090332d000b001e0c568ae8fsm8326613plr.192.2024.04.22.10.14.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 10:14:34 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 1/1] target/riscv/kvm: tolerate KVM disable ext errors
Date: Mon, 22 Apr 2024 14:14:25 -0300
Message-ID: <20240422171425.333037-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240422171425.333037-1-dbarboza@ventanamicro.com>
References: <20240422171425.333037-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x635.google.com
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

Running a KVM guest using a 6.9-rc3 kernel, in a 6.8 host that has zkr
enabled, will fail with a kernel oops SIGILL right at the start. The
reason is that we can't expose zkr without implementing the SEED CSR.
Disabling zkr in the guest would be a workaround, but if the KVM doesn't
allow it we'll error out and never boot.

In hindsight this is too strict. If we keep proceeding, despite not
disabling the extension in the KVM vcpu, we'll not add the extension in
the riscv,isa. The guest kernel will be unaware of the extension, i.e.
it doesn't matter if the KVM vcpu has it enabled underneath or not. So
it's ok to keep booting in this case.

Change our current logic to not error out if we fail to disable an
extension in kvm_set_one_reg(), but show a warning and keep booting. It
is important to throw a warning because we must make the user aware that
the extension is still available in the vcpu, meaning that an
ill-behaved guest can ignore the riscv,isa settings and  use the
extension.

The case we're handling happens with an EINVAL error code. If we fail to
disable the extension in KVM for any other reason, error out.

We'll also keep erroring out when we fail to enable an extension in KVM,
since adding the extension in riscv,isa at this point will cause a guest
malfunction because the extension isn't enabled in the vcpu.

Suggested-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/kvm/kvm-cpu.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index 6a6c6cae80..03e3fee607 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -427,10 +427,14 @@ static void kvm_riscv_update_cpu_cfg_isa_ext(RISCVCPU *cpu, CPUState *cs)
         reg = kvm_cpu_cfg_get(cpu, multi_ext_cfg);
         ret = kvm_set_one_reg(cs, id, &reg);
         if (ret != 0) {
-            error_report("Unable to %s extension %s in KVM, error %d",
-                         reg ? "enable" : "disable",
-                         multi_ext_cfg->name, ret);
-            exit(EXIT_FAILURE);
+            if (!reg && ret == -EINVAL) {
+                warn_report("KVM cannot disable extension %s",
+                            multi_ext_cfg->name);
+            } else {
+                error_report("Unable to enable extension %s in KVM, error %d",
+                             multi_ext_cfg->name, ret);
+                exit(EXIT_FAILURE);
+            }
         }
     }
 }
-- 
2.44.0


