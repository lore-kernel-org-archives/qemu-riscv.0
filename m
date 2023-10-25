Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AF1EC0032E
	for <qemu-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 13:51:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qveHH-0001SK-6x; Wed, 25 Oct 2023 09:50:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qveH4-0001Jf-TV
 for qemu-riscv@nongnu.org; Wed, 25 Oct 2023 09:50:24 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qveH3-0002vp-BQ
 for qemu-riscv@nongnu.org; Wed, 25 Oct 2023 09:50:18 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1c9d407bb15so48236755ad.0
 for <qemu-riscv@nongnu.org>; Wed, 25 Oct 2023 06:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698241816; x=1698846616; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RNi1XrEGnTZ+1SvxowC3jovFOMjA8Az6HLnPmOVMkn0=;
 b=T0MdEjJ99feAdL8OCdCMMmnwxpSQewrEGIhYDFEMKK8JA9pH87Mu1S0u6zlVWcivht
 Tr4HyTMNXdvqrggbEh0B4Bbs3NiFYu/yD9xh5+6GCMWG4zp1POi7iU3mGkYKj90hijPl
 +ptyNMmeFhJU3KK01H9X+hzN4MwunAKqaWhsifRoRweB7QSJ7rhmBPH15iVI5Xw9SAHQ
 wl1rLgTbAMYagkvi74IxDnn4BhWSo0a1eK99kz/mn1FVmBAJhaExiLuc0LikFZNnFPHO
 82MvekHJ+L3k0x2OgSKESYPnpOKFBjS6lWfu7OiUN7RiQlO2efdf+swgb8G1XcLAr/jm
 qDtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698241816; x=1698846616;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RNi1XrEGnTZ+1SvxowC3jovFOMjA8Az6HLnPmOVMkn0=;
 b=EztHpEr0TL+8G1b5B1wVD4yQ6OnVJHkTo4zrmunU6BgNNFMSLQzqfRahBvtz3vARYa
 oy9saTA5k2vCegxFIhOk7XL+pRJzQo1TfRCciqG/swxf876A8Q4B8xbJC4cWhWeylYQo
 QIS4/p4aTY1p9cuYTOauT0vL1DQxXMBuvKSqRC2P6zr1jh85zNrcB333z5xdYeBVe+SM
 lDsAKKEgakZSbcSqfvtrGX5WD7v+5WDFNhIwZ30nW3GmL5DfXCweb+p1pZ22XlUORsMo
 bVF6vlEQG7uCcdlTDybQDLo6s5jq0KnGD7rfDDOi8e4gsHypkmiLJvaQea9C3qGOdqpD
 LlZw==
X-Gm-Message-State: AOJu0YxFI3iCJiLGwX0zNLTb4gK2qMgCsxIW1Slav3nFb9Dclyv380dV
 IiEyPFZV2k72sGllibaqLcI9sg==
X-Google-Smtp-Source: AGHT+IFyO0p5P+BEyu9GZLb8sI9nLMQKlkcG5OrMJ61CDwySg356VU0S8S5tI8EbKJN2meKULyXX+A==
X-Received: by 2002:a17:902:ea0e:b0:1c3:6d97:e89e with SMTP id
 s14-20020a170902ea0e00b001c36d97e89emr15674621plg.58.1698241815787; 
 Wed, 25 Oct 2023 06:50:15 -0700 (PDT)
Received: from grind.. ([191.255.2.33]) by smtp.gmail.com with ESMTPSA id
 jw4-20020a170903278400b001ca485b8515sm9252548plb.91.2023.10.25.06.50.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 06:50:15 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 2/9] target/riscv/kvm: add 'rva22u64' flag as unavailable
Date: Wed, 25 Oct 2023 10:49:54 -0300
Message-ID: <20231025135001.531224-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231025135001.531224-1-dbarboza@ventanamicro.com>
References: <20231025135001.531224-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62b.google.com
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


