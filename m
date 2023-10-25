Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C898C25B6F
	for <qemu-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 23:46:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qvnZ4-0000vY-KH; Wed, 25 Oct 2023 19:45:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qvnYw-0000sy-E8
 for qemu-riscv@nongnu.org; Wed, 25 Oct 2023 19:45:27 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qvnYu-0002Gk-RZ
 for qemu-riscv@nongnu.org; Wed, 25 Oct 2023 19:45:22 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1c9d3a21f7aso2008665ad.2
 for <qemu-riscv@nongnu.org>; Wed, 25 Oct 2023 16:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698277519; x=1698882319; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OHkn0XIn+pavsGrnpXUqDrmtzSQW189F7d4DhyW0RDo=;
 b=XuwqaEDXyqwK7Fmdw5Xhhp8NAM6V1ls7WI9zuLfv4WdRmWt6W3tWGs8KKFjrHYDZal
 UPQ3EqmN8cdz4T3N2qkB1U6H9D+hoBBtwQ4RQj+Qr5SfhgTmyOBwY09QKJO9nlsmeZ7J
 H8WzjM6RKIs3pYDVhujNBcLghxQHQpw3VGkIPxEZWlyyde+w2m8ITX61IS/QlWrNayx+
 BLYgz3tprEQKDzybUboiCsEFH6Vfq+/P5c49DtYCA8qgVFepTYkPxLwj8CA7yIPGLbUX
 Th6KLZquVD3bXbzPXl3FZGLLv2nxsHNrb9gtvLo18So5Y0J79sXkH8S+1KMRn6UGGwiQ
 qV4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698277519; x=1698882319;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OHkn0XIn+pavsGrnpXUqDrmtzSQW189F7d4DhyW0RDo=;
 b=QnGjcaglt2XaiFOt46VksV3m5tIYg5mWaZuwABk4iv7irxc5MUjC9ykyC9pmldI6k4
 xYDygCXAlpyxtJA09LViqsZVQNGrSgkwsJqH5zZzyo+HeoEBs1T6nK/esxWcImp4y/C6
 LG8DTHgvzfi+/UAKIHqDmalvaRU9a8i7UoKMnqS+Awl7v9EmRTa5nLpFOzjq4ZkfVO+c
 ylQzeh/GnE6LiRHq1/BInf3Btzl2vqWbiHv76eJm5sRDkVFAjXo+ewAsOngw+mF8ocim
 I3wmXuUBaLVs3KQ9e/+PG8trXTG+MZf4VD0hlwMAiwOHiCoH7uZepSIYQ0+uUroLOwnH
 Fbvw==
X-Gm-Message-State: AOJu0YxFpuoYKtNT3uoF/lBhHqLUA08OiAc+cDMBJLJyAUzD1dFp9Wzv
 ECt24YtyO5alg2M1FBc4FvHikg==
X-Google-Smtp-Source: AGHT+IEIZ3PsCUI2JvEWXw6nHeHi1U99LBcM/5eMIL5y8LBr5Fxe540xpOwDpw7buxbC8df3IMuZNA==
X-Received: by 2002:a17:903:42cb:b0:1c9:bfdc:7efe with SMTP id
 jy11-20020a17090342cb00b001c9bfdc7efemr13699387plb.68.1698277519259; 
 Wed, 25 Oct 2023 16:45:19 -0700 (PDT)
Received: from grind.. ([191.255.2.33]) by smtp.gmail.com with ESMTPSA id
 w14-20020a170902e88e00b001c736746d33sm9738654plg.217.2023.10.25.16.45.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 16:45:18 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v5 03/10] target/riscv/kvm: add 'rva22u64' flag as unavailable
Date: Wed, 25 Oct 2023 20:44:52 -0300
Message-ID: <20231025234459.581697-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231025234459.581697-1-dbarboza@ventanamicro.com>
References: <20231025234459.581697-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62d.google.com
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

KVM does not have the means to support enabling the rva22u64 profile.
The main reasons are:

- we're missing support for some mandatory rva22u64 extensions in the
  KVM module;

- we can't make promises about enabling a profile since it all depends
  on host support in the end.

We'll revisit this decision in the future if needed. For now mark the
'rva22u64' profile as unavailable when running a KVM CPU:

$ qemu-system-riscv64 -machine virt,accel=kvm -cpu rv64,rva22u64=true
qemu-system-riscv64: can't apply global rv64-riscv-cpu.rva22u64=true:
    'rva22u64' is not available with KVM

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/kvm/kvm-cpu.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index 6d1c0a7915..2243dfde64 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -393,7 +393,7 @@ static void cpu_set_cfg_unavailable(Object *obj, Visitor *v,
     }
 
     if (value) {
-        error_setg(errp, "extension %s is not available with KVM",
+        error_setg(errp, "'%s' is not available with KVM",
                    propname);
     }
 }
@@ -474,6 +474,11 @@ static void kvm_riscv_add_cpu_user_properties(Object *cpu_obj)
     riscv_cpu_add_kvm_unavail_prop_array(cpu_obj, riscv_cpu_extensions);
     riscv_cpu_add_kvm_unavail_prop_array(cpu_obj, riscv_cpu_vendor_exts);
     riscv_cpu_add_kvm_unavail_prop_array(cpu_obj, riscv_cpu_experimental_exts);
+
+   /* We don't have the needed KVM support for profiles */
+    for (i = 0; riscv_profiles[i] != NULL; i++) {
+        riscv_cpu_add_kvm_unavail_prop(cpu_obj, riscv_profiles[i]->name);
+    }
 }
 
 static int kvm_riscv_get_regs_core(CPUState *cs)
-- 
2.41.0


