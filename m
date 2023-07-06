Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D716EB64D9
	for <qemu-riscv@archiver.kernel.org>; Thu,  6 Jul 2023 10:20:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qHM4j-0007Wg-8l; Thu, 06 Jul 2023 06:19:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qHM4f-0006zh-Dk
 for qemu-riscv@nongnu.org; Thu, 06 Jul 2023 06:18:57 -0400
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qHM4c-0007Eu-Gc
 for qemu-riscv@nongnu.org; Thu, 06 Jul 2023 06:18:55 -0400
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-6b7541d885cso453548a34.3
 for <qemu-riscv@nongnu.org>; Thu, 06 Jul 2023 03:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1688638732; x=1691230732;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=epgN1L60i5qRwSB1KATbx92UpJwFQjBK1q4qrZS11A4=;
 b=QxxnjlzrSHxGbdPJOY5r1wVMpmQzk6Bf1cvEGvStVWetOsNIoNU6yMucI4PcCMxj8P
 IZh+thaeQ9gd5/F44rq1lcmdjUW/rHOpGV4Cc5K7+3HmR20Lh4YMzzXkb2fAb3ME4uv0
 Se5DRgL/9y5fLmphO2uTjVfIIvUaGtN4IjWL/TMHA8nahw+Mo0eHdVNIEaLX2E0jK0lW
 aUNon04+eSpcPiKsi5hvsDT6XKpTrzZt+tSJnsiYtH1isTEmx/GIbjnCwrDyB7wreHmZ
 l/yZJqhRx0e5PER9RgoohbNfzExpqeaTB4QbksJMoVZrlq+J08QPNvQSMVaWg3ETrf/8
 kLrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688638732; x=1691230732;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=epgN1L60i5qRwSB1KATbx92UpJwFQjBK1q4qrZS11A4=;
 b=QZRgxTHBk8IhLmzncV+0RBEF9K9zucPbP+fv8k30egCQ3bdKqpSdaepXaanG2jd6b2
 UOB9TPAZaUeg09tQOTPn/T5Hra3MK46tph1h35tBGGPt7LdfaX2kg/0+5bWEn72afrEf
 d70bfKKpi+2aolAnWCvllYePxipBQU1SynqEXDnHTGUjQXZeGjwfBcdBGOBt23O92Svr
 TdBUFJ5+l4A2rtt/7+7ggz5Z0DCir3vxcfdKvYgGlp3/xloq1u3xzuXmZJs8OB57WMa/
 GFcXwUcRmPXay8ypRnkPJ5+1yY2cn5UpSiDBHwrVOET1sA7W/cTMzL53LzvDbdiu8MLs
 fC/A==
X-Gm-Message-State: ABy/qLaB/OBPRyZqmNLH9LebOh/biu8dai56Cwk3XyXALg+CHcG8LynE
 4u7VWFERSCC2IMEJWLTJpSC4TA==
X-Google-Smtp-Source: APBJJlHTTYST3+ifk2Tolofh62bzFJKpxuUW4GDr0dzBoqsDLNJi6hUCtQWb+qPm+BHPdzAUqdeOUA==
X-Received: by 2002:a05:6830:1686:b0:6b8:794e:f1ff with SMTP id
 k6-20020a056830168600b006b8794ef1ffmr1522554otr.34.1688638732532; 
 Thu, 06 Jul 2023 03:18:52 -0700 (PDT)
Received: from grind.. (201-69-66-110.dial-up.telesp.net.br. [201.69.66.110])
 by smtp.gmail.com with ESMTPSA id
 h25-20020a9d6a59000000b006b8850ad193sm511382otn.56.2023.07.06.03.18.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jul 2023 03:18:52 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v9 19/20] target/riscv/kvm.c: add kvmconfig_get_cfg_addr()
 helper
Date: Thu,  6 Jul 2023 07:17:37 -0300
Message-ID: <20230706101738.460804-20-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230706101738.460804-1-dbarboza@ventanamicro.com>
References: <20230706101738.460804-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x330.google.com
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
index ba940e570e..cfeab5a4c0 100644
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


