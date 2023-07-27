Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF7E2C001DC
	for <qemu-riscv@archiver.kernel.org>; Thu, 27 Jul 2023 11:39:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qOyBD-0003Vm-Uf; Thu, 27 Jul 2023 06:25:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1qOyAz-0003PV-75
 for qemu-riscv@nongnu.org; Thu, 27 Jul 2023 06:24:57 -0400
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1qOyAx-0003ts-Py
 for qemu-riscv@nongnu.org; Thu, 27 Jul 2023 06:24:56 -0400
Received: by mail-il1-x12b.google.com with SMTP id
 e9e14a558f8ab-348dfefd1a4so2729945ab.1
 for <qemu-riscv@nongnu.org>; Thu, 27 Jul 2023 03:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1690453493; x=1691058293;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=GfEVzfDMM3KV/MRFcXCu/fGQgJk4J1J61XVMjT70iMs=;
 b=cHmrInueGEngMD7UYGmB+iSXoktK/awClLPYSSKF/pxXfwAGRn+ArthLC/yhmHpuJB
 LswL/BReQY7IL6c2/yJXWuk09AYNEeR2QJscAvtNifHzohRaMFnzh7JCCOs+E/qsZn5n
 TS7CmIir0KqXVnwtD7qWEC8ZpYvZMPqiD2NQ3Vn+58/3ZCWF2Spok7iS6cAIvZaQ3h8H
 yMZJIHYAKXPamwly2j9kdO7kitEsCGSBFTRscnmDvQltEnV0RpJAfcpbrmq5R22FK8Q+
 slnlFFAe9ukcL6dPVpCUHcvwdNNeIatrHV5mkFebfpIzyIR6/kQjINlH/Qjb8WoywZcp
 WcCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690453493; x=1691058293;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GfEVzfDMM3KV/MRFcXCu/fGQgJk4J1J61XVMjT70iMs=;
 b=UUQry9MRAjP4P1/150bchf0KazUFeb0Cx35bXSW4YXexg9XMkTLlwNYndzoxSTlV8O
 jeY15JbeY1lC9bAWnk9BQJn2KKJC/HyTYSQ8LQj+bAOGxUk75Y+SptZfQZC5bA8DfCNo
 RvrWBkydHaiiOh42y7vPgQwNhzkyIXXodqTwrB6tgqkCgSPS8qkDt1PHPZjS/2YjeP0O
 9zDDElgqu54w15Q9XZQavhi5KXRRBliYKHpXLvhVe3XzZmSt4/Pzk4+idVIyaq7iRFAF
 nmnAhGNCPv/cY0T63smXdD7ukdps4uLlpMW7eOpbwWLi7FS1bDvP63VEFwWOwoVWwX0W
 K6TQ==
X-Gm-Message-State: ABy/qLaqBWj+ZUzulYTRG4xNv8Go0lTc2ygdIajR/14ticn/cf12n5Cc
 Q28o9AVkIuN5sOsDikEODG9qdA==
X-Google-Smtp-Source: APBJJlGmpqtL4QEdAiDixYp4kNbQW1CQ9NkC8foOTmxv9KtWAPuVL9V2HinYgjq9XtD2a/1AO9/O7w==
X-Received: by 2002:a05:6e02:1a6a:b0:345:fbdc:bb78 with SMTP id
 w10-20020a056e021a6a00b00345fbdcbb78mr5294262ilv.29.1690453493285; 
 Thu, 27 Jul 2023 03:24:53 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a17090341c800b001b882880550sm1230139ple.282.2023.07.27.03.24.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 03:24:53 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: rkanwal@rivosinc.com, anup@brainfault.org, dbarboza@ventanamicro.com,
 ajones@ventanamicro.com, atishp@atishpatra.org, vincent.chen@sifive.com,
 greentime.hu@sifive.com, frank.chang@sifive.com, jim.shu@sifive.com,
 Yong-Xuan Wang <yongxuan.wang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org
Subject: [PATCH v7 2/5] target/riscv: check the in-kernel irqchip support
Date: Thu, 27 Jul 2023 10:24:34 +0000
Message-Id: <20230727102439.22554-3-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230727102439.22554-1-yongxuan.wang@sifive.com>
References: <20230727102439.22554-1-yongxuan.wang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::12b;
 envelope-from=yongxuan.wang@sifive.com; helo=mail-il1-x12b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

We check the in-kernel irqchip support when using KVM acceleration.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Reviewed-by: Jim Shu <jim.shu@sifive.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/kvm.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
index 9d8a8982f9..005e054604 100644
--- a/target/riscv/kvm.c
+++ b/target/riscv/kvm.c
@@ -914,7 +914,15 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
 
 int kvm_arch_irqchip_create(KVMState *s)
 {
-    return 0;
+    if (kvm_kernel_irqchip_split()) {
+        error_report("-machine kernel_irqchip=split is not supported on RISC-V.");
+        exit(1);
+    }
+
+    /*
+     * We can create the VAIA using the newer device control API.
+     */
+    return kvm_check_extension(s, KVM_CAP_DEVICE_CTRL);
 }
 
 int kvm_arch_process_async_events(CPUState *cs)
-- 
2.17.1


