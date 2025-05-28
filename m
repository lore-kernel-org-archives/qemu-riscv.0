Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 015C0C3ABB2
	for <qemu-riscv@archiver.kernel.org>; Wed, 28 May 2025 20:10:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uKN5c-0001qY-Jv; Wed, 28 May 2025 16:09:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uKN5a-0001qG-Ty
 for qemu-riscv@nongnu.org; Wed, 28 May 2025 16:09:27 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uKN5U-0006OD-B6
 for qemu-riscv@nongnu.org; Wed, 28 May 2025 16:09:26 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id
 3f1490d57ef6-e7dcd60c092so135615276.3
 for <qemu-riscv@nongnu.org>; Wed, 28 May 2025 13:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1748462957; x=1749067757; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q75wCLLWuB7OvinkOcqG/BYvN2MthuDZnMoql8kakbM=;
 b=MoeoWzWWnEYgy95GRUnE8ZEC8Dq7S/8+vBVAVsYA6Vn0KIysLK/sv5InTjGDKy1vHU
 yxrxIFVNwnStCCvD4/GzILOVKVaOMzGG+M2Q74YOVmalumCdVHMx7zUiQVv1TE1MQbM/
 TwSeK2Lr4yom3NT+wkc1viv2VEpKvShCnRL/369DVnxnpAegaIczQT08aP7v5yr4vA9r
 RAuNLdSNOgNFKtvROM/uzruMSwwYA8eYXdUftw2EZh6cVDxg5JoD46dGUbcwoUX+oZ70
 MJWMQQjVoiireujVGT45SMt4H53oqy7J/HvVMTBkFCgPVa2s4wIEy7qfDgCFDkVeg0b9
 /iLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748462957; x=1749067757;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q75wCLLWuB7OvinkOcqG/BYvN2MthuDZnMoql8kakbM=;
 b=Bvs3izUiQBBg8H8O6DjvF262DIljyxLx4klK/0M87ugv1NtiTT8hYibT9ZEFBvTBm6
 vvD3VuQjWyx3Et/fvt3PS7pzbac1gufD5Oqp85Q9+/SGoi78OXkH4/NkmQzuaap2tTzT
 Zpa552P7CV+BZZb1hgurMebkRz7vuWIdmccGJ1/ShqeNl5tJ2MfDBwJ6hFHKVy8ZSo5h
 zQHat8FlsxgTr4bi0TzRueH7W/gdV8APbd+E8E1shpjrlJwj6PHbWLBTVNxW5CxuWfLa
 8UWzLMQPM8Y9NJlc+kXwmDmevhG/u33pgInHGpiscldD+IOEuT3etdLnBxZETEy2WW+w
 xFqg==
X-Gm-Message-State: AOJu0Yxt47S5NzpUmb62rf/LXOIcSejxQbw79kc5UPbpwxHBhl9aFx9v
 EeqMu5GwUV932voIxz1oU5I3rV7q3y9iN0g30NkVtWbusXh0fRscF68C9zeiTI27dx+BkUMotAJ
 3yFFF
X-Gm-Gg: ASbGncuNpAT/RfeZK2ln/JGWzGJ2tBaMNuM5PlTCOET00fXXT1/LFpmSiGR5Y0LLJZ4
 H8q17WS0950v7j4ZYc0kyKMVWzdZJSezRRL8ACjRrga0HqyELrOoCuQazF1g236m/ndCSPxEduU
 uNk+yvKbByAeGTe7v38AZ/gDwepJ4R3Z0YmnQMp3I9vy0AqBmRgm2a4CB8fOYRuyllZ4onINJd6
 gZFx5lX3v9khuekj4QISfwoYNn/fbmikNdhHTbRBIAVhn1gccGTM5UH+pm1Fnu9KEa1bH+Hp64x
 O6ah2nnXfcOkDHuOhW1khPagcTEbcgelPbKgHc0oqLwU0m9MYU61IudcSEJOxbsQ5Zz0qhdhMxe
 RXhZ4OCIFPGIrDQ==
X-Google-Smtp-Source: AGHT+IGluCsb2Vs7swpWUN18rUbgPCDEsX3yvQtgG8cJoAHquuW8ReHmLnmm6r98YJYpfUaLaBYmyw==
X-Received: by 2002:a05:6102:3a08:b0:4de:d08f:672a with SMTP id
 ada2fe7eead31-4e4240bc571mr14731267137.15.1748462509531; 
 Wed, 28 May 2025 13:01:49 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([191.255.35.190])
 by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-4e59fc11a95sm1393736137.3.2025.05.28.13.01.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 May 2025 13:01:49 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com, ajones@ventanamicro.com,
 Fei Wu <wu.fei9@sanechips.com.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 2/4] target/riscv: Add server platform reference cpu
Date: Wed, 28 May 2025 17:01:27 -0300
Message-ID: <20250528200129.1548259-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250528200129.1548259-1-dbarboza@ventanamicro.com>
References: <20250528200129.1548259-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-yb1-xb2c.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Fei Wu <wu.fei9@sanechips.com.cn>

The harts requirements of RISC-V server platform [1] require RVA23 ISA
profile support, plus Sv48, Svadu, H, Sscofmpf etc. This patch provides
a virt CPU type (rvsp-ref) as compliant as possible.

[1] https://github.com/riscv-non-isa/riscv-server-platform/blob/main/server_platform_requirements.adoc

Signed-off-by: Fei Wu <fei2.wu@intel.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu-qom.h |  1 +
 target/riscv/cpu.c     | 11 +++++++++++
 2 files changed, 12 insertions(+)

diff --git a/target/riscv/cpu-qom.h b/target/riscv/cpu-qom.h
index 1ee05eb393..70978fd53c 100644
--- a/target/riscv/cpu-qom.h
+++ b/target/riscv/cpu-qom.h
@@ -55,6 +55,7 @@
 #define TYPE_RISCV_CPU_VEYRON_V1        RISCV_CPU_TYPE_NAME("veyron-v1")
 #define TYPE_RISCV_CPU_TT_ASCALON       RISCV_CPU_TYPE_NAME("tt-ascalon")
 #define TYPE_RISCV_CPU_XIANGSHAN_NANHU  RISCV_CPU_TYPE_NAME("xiangshan-nanhu")
+#define TYPE_RISCV_CPU_RVSP_REF         RISCV_CPU_TYPE_NAME("rvsp-ref")
 #define TYPE_RISCV_CPU_HOST             RISCV_CPU_TYPE_NAME("host")
 
 OBJECT_DECLARE_CPU_TYPE(RISCVCPU, RISCVCPUClass, RISCV_CPU)
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 4a30cf8444..ec2fbc0e78 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -3166,6 +3166,17 @@ static const TypeInfo riscv_cpu_type_infos[] = {
         .cfg.max_satp_mode = VM_1_10_SV39,
     ),
 
+    DEFINE_RISCV_CPU(TYPE_RISCV_CPU_RVSP_REF, TYPE_RISCV_VENDOR_CPU,
+        .misa_mxl_max = MXL_RV64,
+        .profile = &RVA23S64,
+
+        /* ISA extensions */
+        .cfg.ext_zkr = true,
+        .cfg.ext_svadu = true,
+
+        .cfg.max_satp_mode = VM_1_10_SV57,
+    ),
+
 #if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
     DEFINE_RISCV_CPU(TYPE_RISCV_CPU_BASE128, TYPE_RISCV_DYNAMIC_CPU,
         .cfg.max_satp_mode = VM_1_10_SV57,
-- 
2.49.0


