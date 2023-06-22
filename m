Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E225EB64DB
	for <qemu-riscv@archiver.kernel.org>; Thu, 22 Jun 2023 13:58:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qCKpC-0008AN-VV; Thu, 22 Jun 2023 09:58:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qCKp5-00085g-6s
 for qemu-riscv@nongnu.org; Thu, 22 Jun 2023 09:58:08 -0400
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qCKp3-0001o7-M3
 for qemu-riscv@nongnu.org; Thu, 22 Jun 2023 09:58:06 -0400
Received: by mail-oo1-xc30.google.com with SMTP id
 006d021491bc7-55ab0f777afso4776617eaf.1
 for <qemu-riscv@nongnu.org>; Thu, 22 Jun 2023 06:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1687442284; x=1690034284;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HCyEYTCurZlKeBb+smp4iBapbYzZbkqtdlsgVYmzaks=;
 b=gZ8Vje3Ozti5nlfaSbgIvdUKgqtI5FnwsLqnbbpRJy3kLLzLRZk0BH585YXPXULiXX
 NcEnVs8Y0urr5ZEF5+lE6dsBhIKjjH/Nh+/Q/Z4Gmmpc8WZpyjTJ3qL9ugXDeDViBUUl
 Evb/F1IT8C5j+ekB/+9NhiMG4vAwfDCMgddI52SYohqTewHTPLDx+GyPL+OzCV/21rqg
 +XS51QSUY/W3yQ+d1IYpyuSDSluIDQxp9S+ZBP3LV9mYQwv0yUyTIjiFmfZNDJZFhghR
 5w2IEG/ril3NU8v7Vx1WMIXSg4PiicB1+S8744eQyJ8X+Dg0IZ4rfar4lj85sy34Ipou
 6UIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687442284; x=1690034284;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HCyEYTCurZlKeBb+smp4iBapbYzZbkqtdlsgVYmzaks=;
 b=DPHpbHbRZEWb/CVs0rRtYUQWlpXsiUA6ZlaARBnA9yeHoUm5yQwjcOYpBZpJDds0ni
 Ek32j2IVFbf+HUa2vg2CKtDAUDTJZy0yShlyULAg71NovhmB8CczUr/P/AekJfnCQ7tl
 VcZwVb7vzMQMWRJ1uJs3DSSBGT3NekHsYWhsxku2gUFjqgtRS8RNK+G+9J3vQ5CzALMe
 JO9IeD/qCOxD7kweWXAx8MWKuWaCwVxsb3cFdZ5zZjpluA2In7ZkOqR6qTz0wi5Pqjlc
 kefKkNHdLRfv6zNHGY8KHdoiUcMRk12k3Kql2RjHMwiJ5nHTK0aCroE+8aQ8XiV3wlFG
 gPKw==
X-Gm-Message-State: AC+VfDw5zYTQ7qEH5vzTOQzlryzA6Usfgvi5UT2IVxyM9gWZ5/NClhC6
 2vAu4WsUe67YiJgNkhpToYVQxA==
X-Google-Smtp-Source: ACHHUZ7lqgKRL6q0OHr3QicH9w7FZIIWxGcwzcjKkRrjMHzTJM6BBPqNLyZAeBFbKbXFh1awuqotaw==
X-Received: by 2002:a4a:d18d:0:b0:562:eb64:73f6 with SMTP id
 j13-20020a4ad18d000000b00562eb6473f6mr649443oor.4.1687442284714; 
 Thu, 22 Jun 2023 06:58:04 -0700 (PDT)
Received: from grind.. (201-69-66-110.dial-up.telesp.net.br. [201.69.66.110])
 by smtp.gmail.com with ESMTPSA id
 w6-20020a4aa446000000b00562f06fb5easm156677ool.11.2023.06.22.06.58.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jun 2023 06:58:04 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 18/19] target/riscv/kvm.c: add kvmconfig_get_cfg_addr()
 helper
Date: Thu, 22 Jun 2023 10:56:59 -0300
Message-ID: <20230622135700.105383-19-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230622135700.105383-1-dbarboza@ventanamicro.com>
References: <20230622135700.105383-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c30;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

There are 2 places in which we need to get a pointer to a certain
property of the cpu->cfg struct based on property offset. Next patch
will add a couple more.

Create a helper to avoid repeating this code over and over.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/kvm.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
index 6eebeb123a..e8f6683030 100644
--- a/target/riscv/kvm.c
+++ b/target/riscv/kvm.c
@@ -215,11 +215,15 @@ static KVMCPUConfig kvm_multi_ext_cfgs[] = {
     KVM_EXT_CFG("svpbmt", ext_svpbmt, KVM_RISCV_ISA_EXT_SVPBMT),
 };
 
+static void *kvmconfig_get_cfg_addr(RISCVCPU *cpu, KVMCPUConfig *kvmcfg)
+{
+    return (void *)&cpu->cfg + kvmcfg->offset;
+}
+
 static void kvm_cpu_cfg_set(RISCVCPU *cpu, KVMCPUConfig *multi_ext,
                             uint32_t val)
 {
-    int cpu_cfg_offset = multi_ext->offset;
-    bool *ext_enabled = (void *)&cpu->cfg + cpu_cfg_offset;
+    bool *ext_enabled = kvmconfig_get_cfg_addr(cpu, multi_ext);
 
     *ext_enabled = val;
 }
@@ -227,8 +231,7 @@ static void kvm_cpu_cfg_set(RISCVCPU *cpu, KVMCPUConfig *multi_ext,
 static uint32_t kvm_cpu_cfg_get(RISCVCPU *cpu,
                                 KVMCPUConfig *multi_ext)
 {
-    int cpu_cfg_offset = multi_ext->offset;
-    bool *ext_enabled = (void *)&cpu->cfg + cpu_cfg_offset;
+    bool *ext_enabled = kvmconfig_get_cfg_addr(cpu, multi_ext);
 
     return *ext_enabled;
 }
-- 
2.41.0


