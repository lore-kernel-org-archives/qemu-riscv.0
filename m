Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54680C48260
	for <qemu-riscv@archiver.kernel.org>; Tue, 13 Feb 2024 14:53:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rZu9r-00081H-Uu; Tue, 13 Feb 2024 09:53:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1rZu9r-000811-4j
 for qemu-riscv@nongnu.org; Tue, 13 Feb 2024 09:53:15 -0500
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1rZu9p-0002mG-4X
 for qemu-riscv@nongnu.org; Tue, 13 Feb 2024 09:53:14 -0500
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2d09cf00214so58529121fa.0
 for <qemu-riscv@nongnu.org>; Tue, 13 Feb 2024 06:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1707835990; x=1708440790;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aB3yMP8wgqYcqXjs290lUlN66b0J0Lpn5adamSav2OI=;
 b=RBKJMySjWRdnWo/pAN8TD/KVIdCa9HN+Mvza46BQOE1qna1P3aj09uVqmszYOPb4hw
 J3IazMvWkEndw7uBAXJL8hAYuc3z9Vb41FhGA0N6/TQwyp/UjR8E3WNowgxCFj+t/tUc
 NzXEW4Xx47K3qI0hHoaLaUEtCfJQbbMMEbMljptVoGrFrLmxhJFHUputGGKU41l1iio7
 viqgAz2l44Z9IHGLfodTrOrdiVVOd7qdwhuoDhqdIZFUiP7vc7xf5nqEUv8wI+HsDrQ2
 Ahj4qggwBT1PuxS3PPbML4qV/Htz4Hom1fkSgBgADwSWDCxy5tGkdSzJYWYEGGQjlJPR
 4xCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707835990; x=1708440790;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aB3yMP8wgqYcqXjs290lUlN66b0J0Lpn5adamSav2OI=;
 b=ZnN/VHPbubaAEam6rrXBmSOPri28Y5zYhD+7+ddkcakfkBOgx8vkQNfW1Jf4U+E0RZ
 Z4Z74j3T9dLO3lEj9ROQx6NNX77Uq7WJBcMjNqARF2MOl+u7dV/DyyJlBqhFQRnVqHld
 7OqU0bFIOwrjsO9zX6xHG2wdtEu00Kk6+H0a5mLOQxpah5lFc2L8UH2bTHgqVTyj+sFT
 Jrbxc7D+KMFWNPnVyREKysB22jd9r/s0qwhwAmnf1QbbsC74kPEQSSTXqEol9cFBrWQw
 BIk7hRDIcN2sy3I9qIp1PcAYJ7SzMVjEDac/7/LKBS5Y8j/v3/g+MzY59WzIsLn0YJiu
 RGJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVttIeHX4h69Zyv106+sqHhuQ/MgOn6WRQOVo4AwUhWqQhw5wKAQoflL0HAyWJDZmkLVC2ORZsX9ESsaGSWRWWEjfWF05Y=
X-Gm-Message-State: AOJu0Yyl9r8wiOcsjXODi3UZJzlEr6Pke6aC2O8XGibXyN7Je9yDiLP5
 /eam8AomSSV29V6FumH9FQt/F0WJXJmklXVnitkXcFEt2D4XSnTmXnRwOZSGmmI=
X-Google-Smtp-Source: AGHT+IGOM3le0JjiDcPW1FJcSOGGaopEcnwW5b1vzkjkZWxXZwpPkAmxaXh6oMr2mTL6o/8BPYZhsA==
X-Received: by 2002:a2e:a0cb:0:b0:2d0:9210:fd57 with SMTP id
 f11-20020a2ea0cb000000b002d09210fd57mr6313420ljm.18.1707835990634; 
 Tue, 13 Feb 2024 06:53:10 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUuXZBd656DWpt1tHHR7Lftdlf88NB9XQ83IgRKXbfl9qWS2Fc24XXVRm4oc+X6dEWEj29Kzw8S+TQ/s9fjAXEEuHO1yPVT2B2jTeoCkO2td9H9d2wVJW72tMpIMb9LZwhCi+97ocxIFIPVWzjK2OV8yxpqXcIlE25yTNhM56tFLFnU+u87TOlOE6/peF4YVySBXvTZ2u4tEivOrGJXTsZaKFC3G9krcAUf3Ttr5/PzOCdLsC/J21MqnH3AvAtYBlGD3edsoq2o8ByYJzuWlBcppXBXikLz4Lm4iMH0
Received: from alex-rivos.ba.rivosinc.com
 (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
 by smtp.gmail.com with ESMTPSA id
 t6-20020a05600c450600b0040fc56712e8sm12074899wmo.17.2024.02.13.06.53.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 06:53:10 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH RFC] target: riscv: Add Svvptc extension support
Date: Tue, 13 Feb 2024 15:53:08 +0100
Message-Id: <20240213145308.869874-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::236;
 envelope-from=alexghiti@rivosinc.com; helo=mail-lj1-x236.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The Svvptc extension describes a uarch that does not cache invalid TLB
entries: that's the case for qemu so there is nothing particular to
implement other than the introduction of this extension, which is done
here.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---

That's an RFC since the extension has not been ratified yet.

 target/riscv/cpu.c     | 2 ++
 target/riscv/cpu_cfg.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1b8d001d23..4beb5d0350 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -178,6 +178,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(svinval, PRIV_VERSION_1_12_0, ext_svinval),
     ISA_EXT_DATA_ENTRY(svnapot, PRIV_VERSION_1_12_0, ext_svnapot),
     ISA_EXT_DATA_ENTRY(svpbmt, PRIV_VERSION_1_12_0, ext_svpbmt),
+    ISA_EXT_DATA_ENTRY(svvptc, PRIV_VERSION_1_12_0, ext_svvptc),
     ISA_EXT_DATA_ENTRY(xtheadba, PRIV_VERSION_1_11_0, ext_xtheadba),
     ISA_EXT_DATA_ENTRY(xtheadbb, PRIV_VERSION_1_11_0, ext_xtheadbb),
     ISA_EXT_DATA_ENTRY(xtheadbs, PRIV_VERSION_1_11_0, ext_xtheadbs),
@@ -1467,6 +1468,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
     MULTI_EXT_CFG_BOOL("svinval", ext_svinval, false),
     MULTI_EXT_CFG_BOOL("svnapot", ext_svnapot, false),
     MULTI_EXT_CFG_BOOL("svpbmt", ext_svpbmt, false),
+    MULTI_EXT_CFG_BOOL("svvptc", ext_svvptc, false),
 
     MULTI_EXT_CFG_BOOL("zicntr", ext_zicntr, true),
     MULTI_EXT_CFG_BOOL("zihpm", ext_zihpm, true),
diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index 833bf58217..c973693b6e 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -77,6 +77,7 @@ struct RISCVCPUConfig {
     bool ext_svinval;
     bool ext_svnapot;
     bool ext_svpbmt;
+    bool ext_svvptc;
     bool ext_zdinx;
     bool ext_zaamo;
     bool ext_zacas;
-- 
2.39.2


