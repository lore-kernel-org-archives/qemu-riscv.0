Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DAEAC3DA6E
	for <qemu-riscv@archiver.kernel.org>; Wed, 10 Jan 2024 04:02:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rNPnM-0003xK-Ft; Tue, 09 Jan 2024 23:02:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hchauhan@ventanamicro.com>)
 id 1rNPnJ-0003wL-6Y
 for qemu-riscv@nongnu.org; Tue, 09 Jan 2024 23:02:21 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hchauhan@ventanamicro.com>)
 id 1rNPnF-0007wJ-L4
 for qemu-riscv@nongnu.org; Tue, 09 Jan 2024 23:02:20 -0500
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-55b5a37acb6so273584a12.0
 for <qemu-riscv@nongnu.org>; Tue, 09 Jan 2024 20:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1704859331; x=1705464131; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=IaLEx32OdMoqBCO5aI8gHBzINiie6pzsOORbjY47syU=;
 b=AsWG3AQqbGyJ9feKTh6I81ibVN2ZMbB/3ToqxvTyT2AIZ95IiadbiW85+08zw28Zwc
 qVXd+NUn86P7+uEPpj3U2+29C1UcXnPoC7pPwCgXO34s9DbGANCPGwh/1OASFBZerlIl
 43XRMoeyPTrge3Y69xmdfAfHaGMwUzoB245T3qpcgOgBE8D91lMx8JyC+xQeeXzx4lbY
 WUtyO7NT41g2aaeaVlzvb6o9zdL8GtTXpSOMmxC6dyZ+Z+2Jb4/t3GupsXPaKvfvVW2x
 4P5l0bTbPiaTdbfMvBYWg0aICSMgKMVtvn5Y4PafqiKJs5PMfn2KnzHwI4KJydkd4WU/
 M5wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704859331; x=1705464131;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IaLEx32OdMoqBCO5aI8gHBzINiie6pzsOORbjY47syU=;
 b=HRPMQhDjfNEo7ZovdiDTPIV3nvmSdLwHIz9fT9CxxbiH7tg3PPjj4EF5s18WqeEOe0
 hjZgk+7lWgaqsV6rz3sa6dNPvHE2bEQTtWaZVNsqOMx9ncT0oMr5QkBymcrXB4r3+iI4
 G+rDAKE5leqOrjKiniyqHbXyBolNbE+UL0G9HCTVX9SGR7zUzb1F8EDV6dt+RXhziUei
 DyASU68MyW+0pH3NMosKYV3Ej0o3qukbbcsqOpr3pMOfhGMBhj5JyyKk4B9PVQvzlQyP
 ywFxPzrire6xPB9bIe32bNwENHOXV2oDkeMnUwwctP7F9WDJ9kfmD7Af5SQyc+bXegtI
 JIPQ==
X-Gm-Message-State: AOJu0YwE9ODmtf4Z6qznNKMqSP+W7rpvROlOCLWRDQlhj3sba+Ol9Py5
 aw7+Z3+J519M/US3V0icCglAiGCaSkC/vzUBlmh2iUBGQHo=
X-Google-Smtp-Source: AGHT+IET0+gGrULpaZMfIle4dA8foq6Jh/BacMhp5KHIbJsRMR4V2KMckXbgGMdiGwWjAF79pzDPLQ==
X-Received: by 2002:a05:6a20:20c5:b0:199:bbca:35ee with SMTP id
 t5-20020a056a2020c500b00199bbca35eemr580708pza.0.1704859331343; 
 Tue, 09 Jan 2024 20:02:11 -0800 (PST)
Received: from brahaspati.localdomain ([152.58.210.84])
 by smtp.gmail.com with ESMTPSA id
 ca8-20020a17090af30800b0028cf4cb2c85sm313893pjb.40.2024.01.09.20.02.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 20:02:11 -0800 (PST)
From: Himanshu Chauhan <hchauhan@ventanamicro.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/2] target/riscv: Export sdtrig as an extension and ISA string
Date: Wed, 10 Jan 2024 09:32:02 +0530
Message-Id: <20240110040203.1920924-2-hchauhan@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240110040203.1920924-1-hchauhan@ventanamicro.com>
References: <20240110040203.1920924-1-hchauhan@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=hchauhan@ventanamicro.com; helo=mail-pg1-x52c.google.com
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

This patch makes the debug trigger (sdtrig) capability
as an extension and exports it as an ISA string. The sdtrig
extension may or may not be implemented in a system. The
	-cpu rv64,sdtrig=<true/false>
option can be used to dynamicaly turn sdtrig extension
on or off.

Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
---
 target/riscv/cpu.c     | 2 ++
 target/riscv/cpu_cfg.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index b07a76ef6b..aaa2d4ff1d 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -143,6 +143,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zvkt, PRIV_VERSION_1_12_0, ext_zvkt),
     ISA_EXT_DATA_ENTRY(zhinx, PRIV_VERSION_1_12_0, ext_zhinx),
     ISA_EXT_DATA_ENTRY(zhinxmin, PRIV_VERSION_1_12_0, ext_zhinxmin),
+    ISA_EXT_DATA_ENTRY(sdtrig, PRIV_VERSION_1_12_0, ext_sdtrig),
     ISA_EXT_DATA_ENTRY(smaia, PRIV_VERSION_1_12_0, ext_smaia),
     ISA_EXT_DATA_ENTRY(smepmp, PRIV_VERSION_1_12_0, ext_smepmp),
     ISA_EXT_DATA_ENTRY(smstateen, PRIV_VERSION_1_12_0, ext_smstateen),
@@ -1306,6 +1307,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
     MULTI_EXT_CFG_BOOL("zve64d", ext_zve64d, false),
     MULTI_EXT_CFG_BOOL("sstc", ext_sstc, true),
 
+    MULTI_EXT_CFG_BOOL("sdtrig", ext_sdtrig, true),
     MULTI_EXT_CFG_BOOL("smepmp", ext_smepmp, false),
     MULTI_EXT_CFG_BOOL("smstateen", ext_smstateen, false),
     MULTI_EXT_CFG_BOOL("svadu", ext_svadu, true),
diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index f4605fb190..3d3acc7f90 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -113,6 +113,7 @@ struct RISCVCPUConfig {
     bool ext_ssaia;
     bool ext_sscofpmf;
     bool ext_smepmp;
+    bool ext_sdtrig;
     bool rvv_ta_all_1s;
     bool rvv_ma_all_1s;
 
-- 
2.34.1


