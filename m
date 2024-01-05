Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37468C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 22:14:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLsRl-0007P1-T7; Fri, 05 Jan 2024 17:13:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1rLsRk-0007NW-76
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 17:13:44 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1rLsRh-00010C-5L
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 17:13:43 -0500
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1d3eb299e2eso91935ad.2
 for <qemu-riscv@nongnu.org>; Fri, 05 Jan 2024 14:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1704492819; x=1705097619;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=icUnttxijHhXVlY//OcxsENx3d05O3jc8y9mTE1JkJE=;
 b=SICWYLrjU8obMpFph5XnDkf3BIffgGSWcJR9eM53Y9cp8db8en3YQs0iei6qEn+T9i
 10KrOcQtWWnTnZSSyUGjohxaIw3kOaYE6xPD2J2lyTyNGcLx65pUrw+MdHkwahRQluDC
 t9zmSUsl6BS8H8qB8t9npRF2rxWoDn0jHoe+5bxRR2/pji9WvB5nUVTJ0ohugOhPVCnE
 iov3xII/J0McWnFsvYvkdfCTwKq5x+KhhM14fz21Qka0TiKzPi94KIUSU+EFX71MntKP
 kXITK5IoCBwB/QsyOdyDN6eOOjY2jR40z0KwQYzIoGV6Lt6UIcMIdJwITEhkpnz6iC5j
 44kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704492819; x=1705097619;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=icUnttxijHhXVlY//OcxsENx3d05O3jc8y9mTE1JkJE=;
 b=Sytbm2IL6vlQmkpLZsClHZEHY//2pkLt8Ihr59uIb89cjrs2wM6rH8sta3MIQ2oeTe
 cjti4bLl9+uQ8ZShDPz9rh1IAvSqYt1ntp7iXsLVmZu5ja0hSpiG4TmcznuE8+PJx9V5
 9Li26TBVo3HKPVuig6Y4C3qZCVwwc92xl9BvrmPm4yeo/M4P40WxmiESotOzeubR67yR
 GOlHS0kGKfNbvlApYZM5VD/2d8AS8cz1DN4JvHRgwEf8ZrNzScGZRAZLEdal1Ad3cAOb
 DCjqY86VlcFyavLtoKPUv/3bYOpGq/Gwz3eC6zfYCBH8Va3sJ2ll+nnB6YQ2BiPRwTMb
 jemA==
X-Gm-Message-State: AOJu0Yz+KrSjNt3AbAda+YfmQQ4swWnpQ7ThZTDj/fP0AzsEjJairD28
 z7pI5fT1NxwiKA901gxtTVsrhxQdVY42bg==
X-Google-Smtp-Source: AGHT+IEkpBlwNcWqE55Mw0Z8UwH0wkYU83TYYldJuc5DMy3A33NUgXLym16cgUqOoawmzmEGHebpIQ==
X-Received: by 2002:a17:902:8bc7:b0:1d4:e04b:4742 with SMTP id
 r7-20020a1709028bc700b001d4e04b4742mr117462plo.58.1704492819578; 
 Fri, 05 Jan 2024 14:13:39 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 w22-20020a1709029a9600b001d35223d0besm1850524plp.251.2024.01.05.14.13.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jan 2024 14:13:39 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: 
Cc: Kaiwen Xue <kaiwenx@rivosinc.com>, Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Weiwei Li <liwei1518@gmail.com>,
 kaiwenxue1@gmail.com
Subject: [PATCH v3 2/5] target/riscv: Add cycle & instret privilege mode
 filtering properties
Date: Fri,  5 Jan 2024 14:13:24 -0800
Message-Id: <20240105221327.176764-3-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240105221327.176764-1-atishp@rivosinc.com>
References: <20240105221327.176764-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=atishp@rivosinc.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

From: Kaiwen Xue <kaiwenx@rivosinc.com>

This adds the properties for ISA extension smcntrpmf. Patches
implementing it will follow.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
Signed-off-by: Kaiwen Xue <kaiwenx@rivosinc.com>
---
 target/riscv/cpu.c     | 2 ++
 target/riscv/cpu_cfg.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 83c7c0cf07be..ea34ff2ae983 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -148,6 +148,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(smstateen, PRIV_VERSION_1_12_0, ext_smstateen),
     ISA_EXT_DATA_ENTRY(ssaia, PRIV_VERSION_1_12_0, ext_ssaia),
     ISA_EXT_DATA_ENTRY(sscofpmf, PRIV_VERSION_1_12_0, ext_sscofpmf),
+    ISA_EXT_DATA_ENTRY(smcntrpmf, PRIV_VERSION_1_12_0, ext_smcntrpmf),
     ISA_EXT_DATA_ENTRY(sstc, PRIV_VERSION_1_12_0, ext_sstc),
     ISA_EXT_DATA_ENTRY(svadu, PRIV_VERSION_1_12_0, ext_svadu),
     ISA_EXT_DATA_ENTRY(svinval, PRIV_VERSION_1_12_0, ext_svinval),
@@ -1296,6 +1297,7 @@ const char *riscv_get_misa_ext_description(uint32_t bit)
 const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
     /* Defaults for standard extensions */
     MULTI_EXT_CFG_BOOL("sscofpmf", ext_sscofpmf, false),
+    MULTI_EXT_CFG_BOOL("smcntrpmf", ext_smcntrpmf, false),
     MULTI_EXT_CFG_BOOL("zifencei", ext_zifencei, true),
     MULTI_EXT_CFG_BOOL("zicsr", ext_zicsr, true),
     MULTI_EXT_CFG_BOOL("zihintntl", ext_zihintntl, true),
diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index f4605fb190b9..00c34fdd3209 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -72,6 +72,7 @@ struct RISCVCPUConfig {
     bool ext_zihpm;
     bool ext_smstateen;
     bool ext_sstc;
+    bool ext_smcntrpmf;
     bool ext_svadu;
     bool ext_svinval;
     bool ext_svnapot;
-- 
2.34.1


