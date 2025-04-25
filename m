Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5012EC369C2
	for <qemu-riscv@archiver.kernel.org>; Fri, 25 Apr 2025 11:38:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u8HND-00017k-3p; Fri, 25 Apr 2025 07:37:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1u8HNB-00016N-CL
 for qemu-riscv@nongnu.org; Fri, 25 Apr 2025 07:37:37 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1u8HN6-0006W6-N3
 for qemu-riscv@nongnu.org; Fri, 25 Apr 2025 07:37:36 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-2279915e06eso23139325ad.1
 for <qemu-riscv@nongnu.org>; Fri, 25 Apr 2025 04:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1745581045; x=1746185845; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v8t6U7neLyn+Bxz6GCvwrIlJBwqlaStNkHlN+bZWuP4=;
 b=NeXT/g9OPbYDtSOi0xzA3+GVLkGSVHpXEehnH3Xh7y+M0giOCqMUr7qAseypzmijvg
 zjsQZVU6Gj3jqv1OvRTRSdz2Zp4rMDdU1bcx3nRmZYYxSovsvfgrILp/718HBC82MMRf
 uUqVW5WcKk9jVmv2139xMoONCXz9iA5EW6ymmLwXeUM3FMEEKigWALKBe2qOl2K3NyPS
 L/IFWWZIbjmK5qG8ighWCq6J2m1+EOE1F4oj/wwRikjxUM5v8v7ZTb/6mnW9wxMd+Vk6
 6TyilPby6WIqRvA40kbV7aGppvw12LchLgwvKezAEf/BDBfmmjXizxW37O3KaUHzsWmB
 7NQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745581045; x=1746185845;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v8t6U7neLyn+Bxz6GCvwrIlJBwqlaStNkHlN+bZWuP4=;
 b=nXxi6jmKA3fz8xzmktDnUc6TQm5IU/oi3mejQB2iJPKIgZIefy8tLypf/NyGDoR+Gk
 X+iYq+DT8yGnvSVTc7qkA/31EJPSmWs+7HdyTJVKwQy0xQL2R2czBz44aGGay7CvphJM
 BrlfjunL2ABj6oH+K8Xsc6chi5iR7dOxfKKqHYmoNqgqWtLA9uTtmW8hjj/gLFy5DHIX
 FrOUcE0Nhw12FdM0YP5Q+pExIvZBscuahBianTibE8ExfuwoGgGnqqPSIyPSKwPKQ0AV
 KNhtslV2kKvPCDWF74zRCNhseBgOPNnoU8HxKmOGjasceeUxsmFsgRj4iBM86gAj8z70
 exWA==
X-Gm-Message-State: AOJu0YyHHLdh6xoKfTkJbHNoRwjtyuY3T1UfEXkPvVu0oywqsjv0rFNR
 /BLPcM6uRTLM1+3D29Vc/U7ohbE+fGeri56ISoyPNAqJw2++votY/x5PoWWesQg=
X-Gm-Gg: ASbGncufJ7B1NAfn+s7B8/p+T1cVxLHgTlS7smPaHiD6ssYMxZAH5As+vzk2ZzeKzNY
 hNr4pAedEV5ggwd0XraaOST3Fi8ABHmzdxuiUd20dxOaqEgq1ZUlS07VgL+tZVLQZOWkMlWhyYA
 hUi64fRjjqXeoTMtYdUXI7Ft7h9ISL2Hx5EGOrKZjPY9nezeitin4MnEY38NY36KL0iA9AAI1YN
 2LMXYJbwmpl4oID97BC+bliUiaFNt0p/xdgNlVdaj75r84XEg6Kjv8QDHILZVs+dixECthioqPJ
 cKa0iGZmZ/XkMjRYP+AmYaU/QzGfUHUxiNdqncr+Zs2LtEFHuh8MZdZ2VYx4wax/kG4i
X-Google-Smtp-Source: AGHT+IEpcbzQeM9LaLyXdJvKby1QLX/t4ODxigsMNLZcZBV6/IRjeFpMmNFgJ/HPpeQYvSbFrSFVfw==
X-Received: by 2002:a17:903:1111:b0:224:1157:6d26 with SMTP id
 d9443c01a7336-22dbf5de52cmr28785745ad.4.1745581045605; 
 Fri, 25 Apr 2025 04:37:25 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([152.234.125.33])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22db50e7a40sm29881055ad.147.2025.04.25.04.37.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 04:37:25 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com, ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 2/9] target/riscv/kvm: fix leak in
 kvm_riscv_init_multiext_cfg()
Date: Fri, 25 Apr 2025 08:36:58 -0300
Message-ID: <20250425113705.2741457-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250425113705.2741457-1-dbarboza@ventanamicro.com>
References: <20250425113705.2741457-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62e.google.com
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

'reglist' is being g+malloc'ed but never freed.

Reported-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/kvm/kvm-cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index accad4c28e..6ba122f360 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -1119,10 +1119,10 @@ static void kvm_riscv_read_vlenb(RISCVCPU *cpu, KVMScratchCPU *kvmcpu,
 
 static void kvm_riscv_init_multiext_cfg(RISCVCPU *cpu, KVMScratchCPU *kvmcpu)
 {
+    g_autofree struct kvm_reg_list *reglist = NULL;
     KVMCPUConfig *multi_ext_cfg;
     struct kvm_one_reg reg;
     struct kvm_reg_list rl_struct;
-    struct kvm_reg_list *reglist;
     uint64_t val, reg_id, *reg_search;
     int i, ret;
 
-- 
2.49.0


