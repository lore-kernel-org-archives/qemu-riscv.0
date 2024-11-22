Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 535AFE65D1B
	for <qemu-riscv@archiver.kernel.org>; Fri, 22 Nov 2024 03:25:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tEKFt-0005aC-KB; Thu, 21 Nov 2024 22:22:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1tEKFj-0005XT-V3
 for qemu-riscv@nongnu.org; Thu, 21 Nov 2024 22:22:40 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1tEKFi-0003xs-An
 for qemu-riscv@nongnu.org; Thu, 21 Nov 2024 22:22:39 -0500
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-21263dbbbc4so17286165ad.1
 for <qemu-riscv@nongnu.org>; Thu, 21 Nov 2024 19:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1732245757; x=1732850557; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ac5vpUHfFOddVJFriYu+6Qi8+wWX9FL8DoIUJSWkCVQ=;
 b=ImnPNExe34RLm4SjPbAiHqykZp/ON8aABTXWBv2qb9kLySrGNFbEDKX4WEYlTGCXgq
 wsuuc31P6gia8QyECvrlOjqje3gygDbeAnBfHr+QDjsD7cK0VldTLsW0U3TQ7SWkpH+9
 8E+QMcujElBy861m48z0GnZqy4PXFvL4RuQf5W0MFSVWqinCSApbSUd575yBeMuUb75X
 cHBigOPhZ1erchYmtLFWGhpNaWkEYqecMFmL/k4fqjftkH860sVMCVXD7KDb6+krFZES
 UcnJk/w4YN7RM9FkwWuamclW5IAEBZ63o7kSCAwNetfaUreZOZXGxJqAsgJ/8qlEnbZz
 hiLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732245757; x=1732850557;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ac5vpUHfFOddVJFriYu+6Qi8+wWX9FL8DoIUJSWkCVQ=;
 b=r9+1WKXUZYi3NYX95qUSJ3cfcCDUdal6rDjjxRy0tavXXO2jtoT3FktBJQV95w6hpY
 LyfKw9aHiaG6kefRNiyArG8NqfT91qU+f9SCg9WWD/oL1vnhz3rP2roEqmwmnC7MiBWa
 1Pwxr83HesAYjZTB7+1ENEaU2PazZa7qz/GIDzUaGikf3VSG871eakXRhV4ypHCYbzmN
 uFq2TOLSmIy6wozjarRd+3ALJssk6bSVRTEQ6UKYYULgouXBaOfK2pIA7W5iSudNxcT3
 Q+HFk81nxNQdhHq5sIT5VgyRKqMILC/PuZ+X10jRg8NBJa2ci1i+GqhF63vo/FfRw5uG
 BaFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQF1+55YDiqBlWSVdzTFZY1Gz1oGbhMMSjni8lHDOEO2k0/+Mz2b6iDvLsiGcC7gl1ztjtXMZwaKWL@nongnu.org
X-Gm-Message-State: AOJu0YxyM0lBX1s1o83BLEpMwN5UGdNos6VSNybsktpMAt3TOdQx5O3D
 +9I/80370UYn0tgK5M6ICzpRMxTMavE8Oi2j1qIgFq5dpiXQ0N3UbdZVmwumKLTAcGnwLJ/Ziw1
 lLEV03Q==
X-Gm-Gg: ASbGnct68mEZiF6HRSTOox6/bgJ9V7hhKcy34qproRlNasTf/7A1PMW1yhsvpDJc0LR
 VtUtaX3UTseeA+M2LEZ+ftwlt1V7SN2duhnj8QEnoDLi9/Lf5+76T2A9YuZ55bdstd9egtOg9Uh
 KTAAx8DmHN+cSvDAUnmEJcCkZi2fJiOhH/P3Q5tyhbOQmsQsJR1p/hPjQDiuTd9JIfPnhDetOuj
 r4+18/K/PPStIQsKVGY++vMH9DfApSPiz9YGwKHYoLG3fKKNKZMA/yf8x+/MCn8oIig44JTK8FY
 Tpf/Qw==
X-Google-Smtp-Source: AGHT+IGkQEQhtzFsufICB4DTLKiak+NF6QYZWdUlZIyTO2pwITRNoyLVMwo05qfQ7LnD6bOPsPTjQw==
X-Received: by 2002:a17:902:f64c:b0:212:6981:7587 with SMTP id
 d9443c01a7336-2129fd0fc42mr19001305ad.24.1732245756994; 
 Thu, 21 Nov 2024 19:22:36 -0800 (PST)
Received: from fchang-1826.internal.sifive.com ([136.226.240.187])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2129dc157f3sm5506905ad.203.2024.11.21.19.22.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 19:22:36 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Tommy Wu <tommy.wu@sifive.com>,
	Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v9 5/6] target/riscv: Add Smrnmi cpu extension
Date: Fri, 22 Nov 2024 11:22:16 +0800
Message-Id: <20241122032217.3816540-6-frank.chang@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241122032217.3816540-1-frank.chang@sifive.com>
References: <20241122032217.3816540-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x632.google.com
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

From: Tommy Wu <tommy.wu@sifive.com>

This adds the properties for ISA extension Smrnmi.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Signed-off-by: Tommy Wu <tommy.wu@sifive.com>
---
 target/riscv/cpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index b402d8545b..6c91464a00 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -186,6 +186,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(smaia, PRIV_VERSION_1_12_0, ext_smaia),
     ISA_EXT_DATA_ENTRY(smcntrpmf, PRIV_VERSION_1_12_0, ext_smcntrpmf),
     ISA_EXT_DATA_ENTRY(smepmp, PRIV_VERSION_1_12_0, ext_smepmp),
+    ISA_EXT_DATA_ENTRY(smrnmi, PRIV_VERSION_1_12_0, ext_smrnmi),
     ISA_EXT_DATA_ENTRY(smstateen, PRIV_VERSION_1_12_0, ext_smstateen),
     ISA_EXT_DATA_ENTRY(ssaia, PRIV_VERSION_1_12_0, ext_ssaia),
     ISA_EXT_DATA_ENTRY(ssccptr, PRIV_VERSION_1_11_0, has_priv_1_11),
@@ -1516,6 +1517,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
 
     MULTI_EXT_CFG_BOOL("smaia", ext_smaia, false),
     MULTI_EXT_CFG_BOOL("smepmp", ext_smepmp, false),
+    MULTI_EXT_CFG_BOOL("smrnmi", ext_smrnmi, false),
     MULTI_EXT_CFG_BOOL("smstateen", ext_smstateen, false),
     MULTI_EXT_CFG_BOOL("ssaia", ext_ssaia, false),
     MULTI_EXT_CFG_BOOL("svade", ext_svade, false),
-- 
2.34.1


