Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C53BE77166
	for <qemu-riscv@archiver.kernel.org>; Tue,  3 Dec 2024 23:17:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tIc6b-0001JZ-Lj; Tue, 03 Dec 2024 18:14:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1tIc6Y-0001Hd-2T
 for qemu-riscv@nongnu.org; Tue, 03 Dec 2024 18:14:54 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1tIc6W-0001JH-Cw
 for qemu-riscv@nongnu.org; Tue, 03 Dec 2024 18:14:53 -0500
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-7f4325168c8so3154137a12.1
 for <qemu-riscv@nongnu.org>; Tue, 03 Dec 2024 15:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1733267691; x=1733872491;
 darn=nongnu.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=FyiLgrScJsMZeBZ1bSE7OPq3hdaSp5RGPvZtqSAwd9A=;
 b=TJFXyVpAwEA+AURxZsP+8/xl+l541T+2tvSxpzBFBn90WCPOUcPeg5XS58e7h+16XC
 K03kPQmWuV2G5hVUUI4YFGvq6LYtx2Pzecf8s1ZP7EzYYFDSN0WHl7NNy3X1vtkqGn6t
 +xFPu3Qe5IFxVj+I6+Ko4iRu2RE8NmtYCz8DSkxSp196mfxsXWjhMJ+PUauw7iLZAIYN
 ZXj/8JCftE0MrgrdCvnmYz81AY1EYt2OB6UtgShxosfKWyy3GTkL3tw47z6omP/qNaT2
 KZ+vT+u11Bi/mYTGR/PTaqMKrdA6teucvO4yEaHJPta5U6viZrS0w6L1EIY4y3LHVAer
 NTsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733267691; x=1733872491;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FyiLgrScJsMZeBZ1bSE7OPq3hdaSp5RGPvZtqSAwd9A=;
 b=puiPmziArcmEXwBbbWxQ2r575BQ/LXTzqcZo3rBotNFOSkfYQ/1K7X1HJynVOdJEAS
 z5zUXLdR23yYIMS2dITnbXopTshimips5znJV6irmZ1jPgUCH0HSMKNgURIrw9Z2dT9h
 TPTTsCmnYc4+55xWeRDej3lYdtX+LRtiFttVROF8mn02b0/4MPbwg9cWRvMH40XnNHN2
 UH260llXSc5vb6oM0TRoMmguldM5UYm0twP0HvzoXM7NODEZRsLDSX9ONeXjuA/5qD9m
 djqn3jpuSBsTdnarkeIZUr6Z6zxwT5U/DlKiaYS/NzVn7nusdxUMhr2GvaLIGqNuUROZ
 reRA==
X-Gm-Message-State: AOJu0YwEjpTEO2M87ytBdSsQr7vQSnLj9+SyniI9THUl33MZ9/kxrFwy
 ptOndyA/Loi0Wp+D/P/6bnqRvDeB7Ngw6irPqbEMI3bZU0LFd2HN8WHBlFfAXEY=
X-Gm-Gg: ASbGncvhNQqZJ3cvevaMZt6PRjEYcYcvKlGnpmP7WvL2irlVIkcoi/ciI+KnlATAlni
 7Lyk60/xCaeZzLtIU/Fgba7syXCRzX9USwCrqkc3iOdhw3aZkFQ/icElTxvOOMtExsbegDkV1Jr
 Gl2NTTtwInH6YbfeE9B/41IzTS26LRpImn62v7XApzv7kks+5Yd/EeEzuj0EcXZ9qetI3yiJBWA
 nPrYnhR0rds4W+WD9TKVev9roZiy1NrXVwyg3PPJ10ysVcPj7s5tT65z06v1aU=
X-Google-Smtp-Source: AGHT+IEfbIvb8FoeZ5Y1G7BRUQ1hMVBquV2hB0NHd2V183vF8K7nU3w+h4tC7Zmj43pxEPqnrokZ8g==
X-Received: by 2002:a05:6a20:748f:b0:1db:d932:ddcc with SMTP id
 adf61e73a8af0-1e1653c4a75mr6491682637.19.1733267691121; 
 Tue, 03 Dec 2024 15:14:51 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7254180f78asm11032133b3a.133.2024.12.03.15.14.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2024 15:14:50 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 03 Dec 2024 15:14:43 -0800
Subject: [PATCH v4 05/11] target/riscv: Add properties for counter
 delegation ISA extensions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241203-counter_delegation-v4-5-c12a89baed86@rivosinc.com>
References: <20241203-counter_delegation-v4-0-c12a89baed86@rivosinc.com>
In-Reply-To: <20241203-counter_delegation-v4-0-c12a89baed86@rivosinc.com>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: kaiwenxue1@gmail.com, Atish Patra <atishp@rivosinc.com>, 
 palmer@dabbelt.com, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 bin.meng@windriver.com, dbarboza@ventanamicro.com, alistair.francis@wdc.com
X-Mailer: b4 0.15-dev-13183
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=atishp@rivosinc.com; helo=mail-pg1-x534.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

This adds the properties for counter delegation ISA extensions
(Smcdeleg/Ssccfg). Definitions of new registers and and implementation
will come in the next set of patches.

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/cpu.c     | 2 ++
 target/riscv/cpu_cfg.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 963f1f3af9ae..82edd28e2e1d 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -184,11 +184,13 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zhinx, PRIV_VERSION_1_12_0, ext_zhinx),
     ISA_EXT_DATA_ENTRY(zhinxmin, PRIV_VERSION_1_12_0, ext_zhinxmin),
     ISA_EXT_DATA_ENTRY(smaia, PRIV_VERSION_1_12_0, ext_smaia),
+    ISA_EXT_DATA_ENTRY(smcdeleg, PRIV_VERSION_1_13_0, ext_smcdeleg),
     ISA_EXT_DATA_ENTRY(smcntrpmf, PRIV_VERSION_1_12_0, ext_smcntrpmf),
     ISA_EXT_DATA_ENTRY(smcsrind, PRIV_VERSION_1_13_0, ext_smcsrind),
     ISA_EXT_DATA_ENTRY(smepmp, PRIV_VERSION_1_12_0, ext_smepmp),
     ISA_EXT_DATA_ENTRY(smstateen, PRIV_VERSION_1_12_0, ext_smstateen),
     ISA_EXT_DATA_ENTRY(ssaia, PRIV_VERSION_1_12_0, ext_ssaia),
+    ISA_EXT_DATA_ENTRY(ssccfg, PRIV_VERSION_1_13_0, ext_ssccfg),
     ISA_EXT_DATA_ENTRY(ssccptr, PRIV_VERSION_1_11_0, has_priv_1_11),
     ISA_EXT_DATA_ENTRY(sscofpmf, PRIV_VERSION_1_12_0, ext_sscofpmf),
     ISA_EXT_DATA_ENTRY(sscounterenw, PRIV_VERSION_1_12_0, has_priv_1_12),
diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index 8b974255f6fb..ae2b019703fe 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -78,6 +78,8 @@ struct RISCVCPUConfig {
     bool ext_ztso;
     bool ext_smstateen;
     bool ext_sstc;
+    bool ext_smcdeleg;
+    bool ext_ssccfg;
     bool ext_smcntrpmf;
     bool ext_smcsrind;
     bool ext_sscsrind;

-- 
2.34.1


