Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF3C5CD6E4A
	for <qemu-riscv@archiver.kernel.org>; Tue,  2 Jun 2026 09:19:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wULH4-0000u3-Th; Tue, 02 Jun 2026 05:19:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fritchleybohrer@gmail.com>)
 id 1wULGp-0000Z2-P1
 for qemu-riscv@nongnu.org; Tue, 02 Jun 2026 05:18:49 -0400
Received: from mail-dl1-x1244.google.com ([2607:f8b0:4864:20::1244])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fritchleybohrer@gmail.com>)
 id 1wULGk-0007e8-Pd
 for qemu-riscv@nongnu.org; Tue, 02 Jun 2026 05:18:45 -0400
Received: by mail-dl1-x1244.google.com with SMTP id
 a92af1059eb24-137eeae6c29so30658c88.0
 for <qemu-riscv@nongnu.org>; Tue, 02 Jun 2026 02:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780391920; x=1780996720; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PCLumQ0UyNQHKa/ypfifej8V3OAD6FODRX9ywAOjyVA=;
 b=M2ntlYJf1Azh56TrvgvL5KtpTsGwa1xJVatQ+Ldh8cufU+7al30A5VnHitJq7mhjWJ
 8dyAK5G3itKmkJvoAAdBTfjwsrvgrey9UmK0TXo/DWwNTm+/THR7Vays94I/S47TreRG
 guQoV/jKSuKi0c4XW/QT3AaLVnU8TbIDblcLM9EvcfiOThviHadnAXbGgdGx9xH89f0w
 Za5SJSzNXnzJ1B6bXBsuCMK4Un5/nL8q3SavesRCAP6jBQ5iiOuhKxKwJRavLVLRA2P+
 vKBAmHV6XlyISmjhZVvF/u3c6abz30nV80TbsaJ2/ynPEyCWgNhG4ZYPDhJSd4MSlzar
 rj4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780391920; x=1780996720;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=PCLumQ0UyNQHKa/ypfifej8V3OAD6FODRX9ywAOjyVA=;
 b=LlFVgXsGQLTyaL2hc+9uSQEF8FOdYifr5A0anr3CFB9cV0e+nxO6WuvpHJNus47FA+
 ppZUZSX2TMjvgX8esXOlViTedktRRM8lfZPjhVRe4gjup/P501ipasVM2g6+zTBqisaG
 9ic33dUyVz/M9lRojRGqHcENda3huwSChpIza5iDhcKdQtZGU7R0zliOCsrVXEnuZTCH
 jj0o8+4Zd8e0hsNwfDPccqLSyacsgJ7B15YrWoB0MXRQ/fgWo1AviQEHi4MrfRT7f0YO
 7xMAe2bz0VIodWIP2/gyvw6QctxgB4wwWMt4j03X0j7diGk2+6ZvijCdzOho2leLZpyM
 Ceow==
X-Gm-Message-State: AOJu0Yx7WoaCzoJNanaB+bMVH7nUJgJ8abCp3+XpgDdkLGKj0xGAva6T
 6L329fX4sJC+ZjAem+99tF0O/E1mfyoaVCU7b6msX8J3q5oJNcKzImxx
X-Gm-Gg: Acq92OGNcEvmwg/ryqGh6uCcnflpV7KvRTA8wyO3+is5So0IELP3AMs3GbaBNT6UOv/
 Ppk9XHA33R5U0joHdbI4BBLKsorZf/1e1CWPA3QQbVEHh5auwknJsBDDG3THfZnHoVmEshe+9Ob
 iWexUxtdh8VJEk8wW629tGKErDaIg+HjcYaIJm7gfUrNZVEmcWzN4OoC0pnF8IgzgR7b//xMwUS
 OrHE6hIBG9X3/7FDbepy0EKx4CCHKwwaIWO93w9cKEUXf/i0YssmEIih5LuTiifBd1XiqIQ5+TY
 rA4P0zCA4/q5cfzaw/ATydDc7UvCAOFOiWqVGrMzGvly3tyQHWNMEj+VVxVzVtkR/T2+8VFvXMe
 fzZHIsTzao1+QI8APrgLSYTPRIOu+lco2P0h+wuIQAfOVXw/R1iuG/uLqLJbXeIS6yIMgwek7Ex
 biGnBQFwsS5cItAe6Ppamn5pb8J/CrkDDMkpX40vxEid8gs4Os1LkT0qvmZJuhYW47xSAxbMSWq
 OtmC2tXoITAK21f0U5pnp8xZ+hONm8fEivr7w==
X-Received: by 2002:a05:693c:300c:b0:2ca:8099:ffc0 with SMTP id
 5a478bee46e88-304fa4a90c6mr7077827eec.7.1780391920436; 
 Tue, 02 Jun 2026 02:18:40 -0700 (PDT)
Received: from openkylin..
 (ec2-54-176-108-193.us-west-1.compute.amazonaws.com. [54.176.108.193])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-304ed2c3121sm11419146eec.5.2026.06.02.02.18.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2026 02:18:39 -0700 (PDT)
From: Zephyr Li <fritchleybohrer@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 liwei1518@gmail.com, daniel.barboza@oss.qualcomm.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 alex.bennee@linaro.org, pierrick.bouvier@oss.qualcomm.com,
 philmd@linaro.org, Zephyr Li <fritchleybohrer@gmail.com>
Subject: [PATCH v3 4/6] target/riscv: reject x-misa-w outside TCG
Date: Tue,  2 Jun 2026 17:17:51 +0800
Message-ID: <20260602091753.3209261-5-fritchleybohrer@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260602091753.3209261-1-fritchleybohrer@gmail.com>
References: <20260602091753.3209261-1-fritchleybohrer@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1244;
 envelope-from=fritchleybohrer@gmail.com; helo=mail-dl1-x1244.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

x-misa-w controls dynamic writes to misa in the emulated CPU path and is
only meaningful when TCG is available. Reject it explicitly outside TCG
instead of relying on TCG-only finalize code.

This also covers CONFIG_TCG builds that are running with a non-TCG
accelerator. It also rejects CPU models that require writable misa by
default when the selected accelerator is not TCG.

Signed-off-by: Zephyr Li <fritchleybohrer@gmail.com>
---
 target/riscv/cpu.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 862834b480..8ef72a88b1 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -956,6 +956,18 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
     Error *local_err = NULL;
 
+    if (cpu->cfg.misa_w) {
+#ifdef CONFIG_TCG
+        if (!tcg_enabled()) {
+            error_setg(errp, "x-misa-w requires TCG");
+            return;
+        }
+#else
+        error_setg(errp, "x-misa-w requires TCG");
+        return;
+#endif
+    }
+
     cpu_exec_realizefn(cs, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
-- 
2.43.0


