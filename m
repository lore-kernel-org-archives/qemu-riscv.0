Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7EE8C27C47
	for <qemu-riscv@archiver.kernel.org>; Sat, 28 Oct 2023 08:56:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qwf5p-0000MO-H2; Sat, 28 Oct 2023 04:54:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qwf5n-0000LU-BE
 for qemu-riscv@nongnu.org; Sat, 28 Oct 2023 04:54:51 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qwf5l-00049U-UC
 for qemu-riscv@nongnu.org; Sat, 28 Oct 2023 04:54:51 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-5a822f96aedso23137487b3.2
 for <qemu-riscv@nongnu.org>; Sat, 28 Oct 2023 01:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698483289; x=1699088089; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OHkn0XIn+pavsGrnpXUqDrmtzSQW189F7d4DhyW0RDo=;
 b=gl2hugDAQxD3XbnNNr9f9DLSTO5OmqlXvsxQzYG3bVOsm/2StVD5vLpPHWCBIM6Yx6
 5tHcD56FOD3+hMgCUnZK3ByIFvH06m9re9JUREUrVxKc58aT7W09oK4aEFNITh0BvMvE
 9VXuIZMhGDXNt6fq2f1kqWEm+VwfRjpTGJye8n4eOzPOXBhodTYCKS9ZQc3IulLltf2A
 cbMXRIgglnnUH+Ry6a8054AD1/GMOcgBUXp1e0pQe7hSA8zS5mvl9BTuZko+hw0UWH6d
 b00JY31o9CWPzkhABmz/mRYgV56zoAtet4Sf+C16ySYqfKFn759pO56Jj1KPUuJatsMA
 TlHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698483289; x=1699088089;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OHkn0XIn+pavsGrnpXUqDrmtzSQW189F7d4DhyW0RDo=;
 b=BSoWd1ARdUJO+s7TwC8VN9akwRjmAfzXJ8UrT92vRiY73jwKQPfO3F1OhRI9QBDLK8
 tHuxYPQV46mGWoxJ8iciiLbCsMythyVDnIO+pLc7jKkA5dhnWL7jVdoGEFb/+VPdS0GX
 6hTV7CJf0D04MnZyV2uWCKMGrJiFeTguzb6IcaLwNrBT3Rw3YsvRLF66A0EFGp2f4JYN
 kMCgWC5d+zxAqK5ITXppiwtRP0hmDvcZT5R45ySsaf/rVlvM4fr1s4DJuqDYrjt477eL
 7vc4MDmoSWziEdavH6dcvJCuBkP8vU7IJjFBeJJ+FoihMGRfQ382rLgF3kfplGosbcvG
 IOxw==
X-Gm-Message-State: AOJu0YzKSKZKn4QmzYhy3/NIM0xXS0MnqcM0Yd7KnC3P227x0lLcDQoa
 il75xIcwjOaRSytA6BBcFkbAOg==
X-Google-Smtp-Source: AGHT+IGuw6joI4RF7sxdnX1RSvovzJtFoZDnnYT9wIoDT6UmlYmTeFvZECRX19iMfOwKTyG5pLDx4w==
X-Received: by 2002:a81:b606:0:b0:5ac:d1c1:bd8d with SMTP id
 u6-20020a81b606000000b005acd1c1bd8dmr4698293ywh.39.1698483288788; 
 Sat, 28 Oct 2023 01:54:48 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([191.255.2.33])
 by smtp.gmail.com with ESMTPSA id
 t15-20020a81830f000000b00594fff48796sm1604325ywf.75.2023.10.28.01.54.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Oct 2023 01:54:48 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v6 05/12] target/riscv/kvm: add 'rva22u64' flag as unavailable
Date: Sat, 28 Oct 2023 05:54:20 -0300
Message-ID: <20231028085427.707060-6-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231028085427.707060-1-dbarboza@ventanamicro.com>
References: <20231028085427.707060-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-yw1-x1129.google.com
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


