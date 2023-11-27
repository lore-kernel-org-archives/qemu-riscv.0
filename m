Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AACC2C4167B
	for <qemu-riscv@archiver.kernel.org>; Mon, 27 Nov 2023 11:39:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r7Zwb-0003yG-0p; Mon, 27 Nov 2023 06:38:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r7ZwZ-0003xh-Ql
 for qemu-riscv@nongnu.org; Mon, 27 Nov 2023 06:38:27 -0500
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r7ZwY-0005QK-CQ
 for qemu-riscv@nongnu.org; Mon, 27 Nov 2023 06:38:27 -0500
Received: by mail-oi1-x233.google.com with SMTP id
 5614622812f47-3b84402923fso1880152b6e.0
 for <qemu-riscv@nongnu.org>; Mon, 27 Nov 2023 03:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1701085104; x=1701689904; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tmRYxbcrT44VCzWYmzhlhuQ/rR3RdlkH5p1bUIHDcZI=;
 b=ce+6E2/PlMKeV6iigaewFB0/Q1zaD8XXkPbAPkA4hsJ3ebvEFg6csHdS+dSbxrKa+O
 dnr+kIbgS6ym9a25LijO5w24SYVQVpRtGqWgebedBlZK9HR0q+lv/UCZk7isGuBqZFWj
 L4qjOQjW+pIdRiBFEIusAEhG5gcP57duEgPVU61tctiRp5XAFiBuOjpEE6WK0vKrsX3v
 PzVUaEGWm0eE/yimWkT4haSDt4aRbQQobvcV9yodf7Zib+N958faHvOw1fAjKhy/Q0jb
 WI9pUJf7uPcAUt20W1fNSQRvkr+VK8SGgxwWcyybX8ghaBQW9YCbTI/y3dYRenEtyCuN
 Zdcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701085104; x=1701689904;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tmRYxbcrT44VCzWYmzhlhuQ/rR3RdlkH5p1bUIHDcZI=;
 b=qiw4CIuA07MM1j5oROGez3wbzlBck1wq/7MeRoH217LwX5jTuyIBb+SB8BPpGXTnty
 crDzyIcz4bTANOboG7Pvdrezz6wmIc62uEcs4wQ5ESMF4X2tDb7qDpWdghM9HkZem9HA
 YZyfZhVZTvpnP+mmIn33rZw3iJCyI2TtLBFHNmPJ03AOT8g5G6/YpY85giikP3tFKtlf
 Nj3yf+TJ7Rk3xxazR+AciR+f4jzbRXNXt4uOdhinlN3eDhVIKKS9Okl3sPQ/4TUeIiPq
 FWVJFUazrZSuNBVWYEGL3bP1hqRMeMnOd0oX4188UR/LHu/6qjkROCNPkO2h+jhKpGvM
 5uAQ==
X-Gm-Message-State: AOJu0YwmAAImEKF2pC0UMetSvz3XrfN7XCRrx5y2KRfG9q3d1LIHZA9p
 TkXNFZSEviO+EXlvVXcdIV9jIg==
X-Google-Smtp-Source: AGHT+IEdDLn4fANEtxaGtgSTCKtJtfHcr1BHcZmtfwltJCP0wiZnlQzWVfINsjoTTOckZUmkWoaYPA==
X-Received: by 2002:a05:6808:f90:b0:3a9:cfb5:462a with SMTP id
 o16-20020a0568080f9000b003a9cfb5462amr12354975oiw.36.1701085104231; 
 Mon, 27 Nov 2023 03:38:24 -0800 (PST)
Received: from grind.. ([2804:7f0:bdcd:fb00:6501:2693:db52:c621])
 by smtp.gmail.com with ESMTPSA id
 q15-20020a63e94f000000b00578b40a4903sm7618323pgj.22.2023.11.27.03.38.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 03:38:23 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-9.0 v2 8/8] target/riscv: add rva22s64 cpu
Date: Mon, 27 Nov 2023 08:37:52 -0300
Message-ID: <20231127113752.1290265-9-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231127113752.1290265-1-dbarboza@ventanamicro.com>
References: <20231127113752.1290265-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x233.google.com
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

Add a new profile CPU 'rva22s64' to work as an alias of

-cpu rv64i,rva22s64

Like the existing rva22u64 CPU already does with the RVA22U64 profile.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/cpu-qom.h | 1 +
 target/riscv/cpu.c     | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/target/riscv/cpu-qom.h b/target/riscv/cpu-qom.h
index 12fe78fc52..9219c2fcc3 100644
--- a/target/riscv/cpu-qom.h
+++ b/target/riscv/cpu-qom.h
@@ -36,6 +36,7 @@
 #define TYPE_RISCV_CPU_BASE128          RISCV_CPU_TYPE_NAME("x-rv128")
 #define TYPE_RISCV_CPU_RV64I            RISCV_CPU_TYPE_NAME("rv64i")
 #define TYPE_RISCV_CPU_RVA22U64         RISCV_CPU_TYPE_NAME("rva22u64")
+#define TYPE_RISCV_CPU_RVA22S64         RISCV_CPU_TYPE_NAME("rva22s64")
 #define TYPE_RISCV_CPU_IBEX             RISCV_CPU_TYPE_NAME("lowrisc-ibex")
 #define TYPE_RISCV_CPU_SHAKTI_C         RISCV_CPU_TYPE_NAME("shakti-c")
 #define TYPE_RISCV_CPU_SIFIVE_E31       RISCV_CPU_TYPE_NAME("sifive-e31")
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index fa056fb45f..99bdb96335 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1624,6 +1624,13 @@ static void rva22u64_profile_cpu_init(Object *obj)
 
     RVA22U64.enabled = true;
 }
+
+static void rva22s64_profile_cpu_init(Object *obj)
+{
+    rv64i_bare_cpu_init(obj);
+
+    RVA22S64.enabled = true;
+}
 #endif
 
 static const gchar *riscv_gdb_arch_name(CPUState *cs)
@@ -1968,6 +1975,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
     DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_BASE128,  rv128_base_cpu_init),
     DEFINE_BARE_CPU(TYPE_RISCV_CPU_RV64I, rv64i_bare_cpu_init),
     DEFINE_PROFILE_CPU(TYPE_RISCV_CPU_RVA22U64, rva22u64_profile_cpu_init),
+    DEFINE_PROFILE_CPU(TYPE_RISCV_CPU_RVA22S64, rva22s64_profile_cpu_init),
 #endif
 };
 
-- 
2.41.0


