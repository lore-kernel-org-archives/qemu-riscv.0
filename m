Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF2DAC3DA45
	for <qemu-riscv@archiver.kernel.org>; Thu, 11 Jul 2024 22:33:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sS2KC-00008R-Lb; Thu, 11 Jul 2024 18:31:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1sS2K9-0008Tv-Sg
 for qemu-riscv@nongnu.org; Thu, 11 Jul 2024 18:31:37 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1sS2K6-0001Yt-Rq
 for qemu-riscv@nongnu.org; Thu, 11 Jul 2024 18:31:37 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1fbc0a1494dso9816375ad.3
 for <qemu-riscv@nongnu.org>; Thu, 11 Jul 2024 15:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1720737093; x=1721341893;
 darn=nongnu.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=f8QHwF44NvxQcnjRolSS0dOFflbNqvfMMklGCqgsPP0=;
 b=cJzfKVBSTAUN2OW8Z1wC/Ot8ddbKl8T5KVzBT7OZjVZP+bHbLTuHu0Tcryb9gk22oi
 w+vOymwa6BR3TZU2nl7RUXbICR+vFhcSJEH++0VtJBBO/dVCp6h/fBR9aAk5AZEIR1nh
 wDXoWAsicCrB4QYkG4iRFIDtxyTeJ2RpCjz49BaY13I0luB+0N5nZWO4lhjtQdf3bRfU
 G1Fz/cgeSQRM/77tHOllu65w+tlK8T14og947pRoA9B4oGq7b1S67QCbcCalRPbseA8y
 EgVyp9vW0hKcHKQExuvqif3Q63AKYiXnTJIzMdxjt78q5Ao6yx1rQnB9rUV4g9XpZPZj
 24AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720737093; x=1721341893;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f8QHwF44NvxQcnjRolSS0dOFflbNqvfMMklGCqgsPP0=;
 b=fTuBHZkHAZu90lMLOWfmc40gVEnnw4EI0IZjMrihYxBo3o+U8KsZO9gw0VEuv4OdBU
 3CDT4wQPsPgy2eehFOA9osfos+csn+pTtfEdPmo6ju6OInViqJGFGvHYT79ndCyUY2uA
 9Yl7r5Pvk30ZbolGlO7Ok2Ibb+aWNhGINGIEW4kYyiEOQ4DH9EQiDD+uh3teisAeokLX
 h+Y7NsiRRym97PBCRMZ7VgKNFHM73KgAWrSPuwqZ9iNMHY8dkWGIsuZMpHu9JwkDJ+KF
 mXVuiUqZpidHITcnHd3UH/i5x+KJyFJMaPjflYf9AEgHwpPj09dWgC6lOFzLB4Px4zHz
 G2iQ==
X-Gm-Message-State: AOJu0YzAlnHVvTrE/71j4NmPsaeqlTmQ4aX3QYlBDPbtqcdWbQFGzPYd
 IrDVJ0Ouj+m7MOYBV73+wXJgDap79rdvWBBA1LIMzNwYlVnki8ScYnrKI+Y3Q2c=
X-Google-Smtp-Source: AGHT+IHxc825754wmtmEFTXYjtGfYwPdZ5jKu1/R3sQNPmVIv72V6tlg2avirzNcZB1kmhxb0Q6vOA==
X-Received: by 2002:a17:902:dacd:b0:1fb:d335:b0bf with SMTP id
 d9443c01a7336-1fbd335bc88mr50793445ad.25.1720737093326; 
 Thu, 11 Jul 2024 15:31:33 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fbb6b34ca2sm55161565ad.53.2024.07.11.15.31.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jul 2024 15:31:32 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 11 Jul 2024 15:31:06 -0700
Subject: [PATCH v8 03/13] target/riscv: Add cycle & instret privilege mode
 filtering properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240711-smcntrpmf_v7-v8-3-b7c38ae7b263@rivosinc.com>
References: <20240711-smcntrpmf_v7-v8-0-b7c38ae7b263@rivosinc.com>
In-Reply-To: <20240711-smcntrpmf_v7-v8-0-b7c38ae7b263@rivosinc.com>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 bin.meng@windriver.com, dbarboza@ventanamicro.com, alistair.francis@wdc.com
X-Mailer: b4 0.15-dev-13183
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=atishp@rivosinc.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Kaiwen Xue <kaiwenx@rivosinc.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/cpu.c     | 1 +
 target/riscv/cpu_cfg.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 4760cb2cc17f..63f553c92b00 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -178,6 +178,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zhinx, PRIV_VERSION_1_12_0, ext_zhinx),
     ISA_EXT_DATA_ENTRY(zhinxmin, PRIV_VERSION_1_12_0, ext_zhinxmin),
     ISA_EXT_DATA_ENTRY(smaia, PRIV_VERSION_1_12_0, ext_smaia),
+    ISA_EXT_DATA_ENTRY(smcntrpmf, PRIV_VERSION_1_12_0, ext_smcntrpmf),
     ISA_EXT_DATA_ENTRY(smepmp, PRIV_VERSION_1_12_0, ext_smepmp),
     ISA_EXT_DATA_ENTRY(smstateen, PRIV_VERSION_1_12_0, ext_smstateen),
     ISA_EXT_DATA_ENTRY(ssaia, PRIV_VERSION_1_12_0, ext_ssaia),
diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index fb7eebde523b..b1376beb1dab 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -74,6 +74,7 @@ struct RISCVCPUConfig {
     bool ext_ztso;
     bool ext_smstateen;
     bool ext_sstc;
+    bool ext_smcntrpmf;
     bool ext_svadu;
     bool ext_svinval;
     bool ext_svnapot;

-- 
2.34.1


