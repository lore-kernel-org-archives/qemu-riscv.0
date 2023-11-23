Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20853C624B4
	for <qemu-riscv@archiver.kernel.org>; Thu, 23 Nov 2023 18:53:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r6EoF-00006E-Is; Thu, 23 Nov 2023 13:52:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r6Eo1-00087V-Vz
 for qemu-riscv@nongnu.org; Thu, 23 Nov 2023 13:52:07 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r6Enx-0008NI-SW
 for qemu-riscv@nongnu.org; Thu, 23 Nov 2023 13:52:05 -0500
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-6cbbfdf72ecso1144128b3a.2
 for <qemu-riscv@nongnu.org>; Thu, 23 Nov 2023 10:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1700765516; x=1701370316; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=idOjzqB/2N8r45g3xvXzJsWeC0Y1TlRo66OPhQFDTfY=;
 b=Ml8uC9zsXEYWnbmBPv9NKIcoDt3Jdy4n2NbXtN41qiT7TIC7gAToFaMLmOKTRyjmyV
 RXyJ6bk8f4yvzRZMSjSeJeXQjOtzHChzIE9q6flb+WnwbMNnj+LnBY8HQmZZ5rfkrBWb
 2TrnuMb/gT+/8ppFx/Pp6zjMSjo4xIWAisa7T1zM4g4pPLnWb9Iopvnb5Sn6c/ZAgGd7
 0gQWFQfqtSKHOUvdbDTvuVeRD1xnvORVwuZ2C65d8E0EtjKNeuOLgQhsttctMAMR9X3e
 viwbd5pFFqB9rFGF0PPwUoQyzudl2y+dT4fO+4Hg2APYICoqYYpZdM5WObSwYbCLsvjB
 AswQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700765516; x=1701370316;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=idOjzqB/2N8r45g3xvXzJsWeC0Y1TlRo66OPhQFDTfY=;
 b=h0CqVo7d6uFt+trXpPR1UBmrKyBbhHWrBmY/cJ6RGpJ4JwTzKSLrm3cfveoZQ0oYli
 uSki7ZohVOSF2BD7gKa+ndTl29yCjmy0Y410g9eSh0Ocqu2IM6WJibJDOUlUFUw4LHLv
 u+FhMjwWJWjaAsf9K8+Je8i6GgrLNdFAfyo7r2wKjy/mqhLorKBcrmoCEhVOZ3vdv8lk
 sbeePAzn7bJEZpESJwfjWLeO1K6J4BLF5B/OKikO2fwsp+jrAK+O6ypw2NPSBDyvhKqJ
 cqxHuKvYarn0aqlbahlQQlE27Zk1H1wD+WVSJQcj6VA95zbFJs9ypy8v4NArjxueDes9
 2uYg==
X-Gm-Message-State: AOJu0YzLi11GvVdwYY4gJ1JvWzvLOfUHnhfS3MZWnE22YNv07SW5qZza
 g76YY2AOFSJ3TaD199qPB6Xedg==
X-Google-Smtp-Source: AGHT+IGnWoYoxI6sUCvbAtpJGwcK9XudH7Mr0e7yLJuw9XB38vvwGxUNQ73VdGBh21GijSBWOLv3Sg==
X-Received: by 2002:a05:6a20:7493:b0:189:bde9:71aa with SMTP id
 p19-20020a056a20749300b00189bde971aamr506764pzd.48.1700765516584; 
 Thu, 23 Nov 2023 10:51:56 -0800 (PST)
Received: from grind.. ([2804:7f0:bdcd:fb00:6501:2693:db52:c621])
 by smtp.gmail.com with ESMTPSA id
 u4-20020a17090282c400b001bb1f0605b2sm1662638plz.214.2023.11.23.10.51.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Nov 2023 10:51:56 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-9.0 v11 09/18] target/riscv/kvm: add 'rva22u64' flag as
 unavailable
Date: Thu, 23 Nov 2023 15:51:13 -0300
Message-ID: <20231123185122.1100436-10-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231123185122.1100436-1-dbarboza@ventanamicro.com>
References: <20231123185122.1100436-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x433.google.com
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
index 78fa1fa162..9c6ff774b5 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -398,7 +398,7 @@ static void cpu_set_cfg_unavailable(Object *obj, Visitor *v,
     }
 
     if (value) {
-        error_setg(errp, "extension %s is not available with KVM",
+        error_setg(errp, "'%s' is not available with KVM",
                    propname);
     }
 }
@@ -479,6 +479,11 @@ static void kvm_riscv_add_cpu_user_properties(Object *cpu_obj)
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


