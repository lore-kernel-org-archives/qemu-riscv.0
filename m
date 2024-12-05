Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3639FE7716C
	for <qemu-riscv@archiver.kernel.org>; Thu,  5 Dec 2024 11:36:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tJA8I-0006lF-1x; Thu, 05 Dec 2024 06:34:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rkanwal@rivosinc.com>)
 id 1tJA87-0006fZ-Vi
 for qemu-riscv@nongnu.org; Thu, 05 Dec 2024 06:34:49 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rkanwal@rivosinc.com>)
 id 1tJA86-0001W6-CK
 for qemu-riscv@nongnu.org; Thu, 05 Dec 2024 06:34:47 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4349fb56260so5328505e9.3
 for <qemu-riscv@nongnu.org>; Thu, 05 Dec 2024 03:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1733398485; x=1734003285;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AdfctVdNv45/VmWP+SA5e4bfBEoBz0UqYA7wpbj9RiY=;
 b=A8dafCU34EWZcJq7ecYvbLZjjM4INtQHCSJgajlDn22H0YEpp/vQz/ebr95Df+9BgW
 IhFdiPPPc+HjhrygSpB5VNneuHcF+7Cwl1ZqqBZySun50LvamC1tnH/5Gz50G46W0RnY
 laN9W+y1v0jdgpU1jmvs4HusMs7nT4hPq1/Or0QD4iImDDLlX6IAvYn8OMSrxSVXvHQP
 lWHlfMeG8Au46kh2UHpqD2Kkk2O4KzsKYTFWkMd62fMcrwUnfVh2FUNv/QGOVXU6NBvf
 W9GvYJfCigCsR2x1QPf7l66e600uhtlKe/s6ignkp7YjBK+rGp7omOcNZz2lhtUE9+E8
 WK7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733398485; x=1734003285;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AdfctVdNv45/VmWP+SA5e4bfBEoBz0UqYA7wpbj9RiY=;
 b=qg1UWdD8+9FUwJefMnV+HJP9AdbXhWt54vn6MBVAEhiGzQPP4Dl01kHCRSx37eVUDi
 bGf5PPKFupLPkbx3DUjI1i9tcuYHqICqy+6BWA4d5tpgH2F2hPrX0L5eTe6uaLvGMrec
 qbKy31sl2qehju4J5F6aIVdDML/NTfoIefj6EK2VxtSQU1m+q4LTKH6Jq/u7cSE3SFIa
 2kESEdv9V19LXQBw4NAJr6FrJKdenxVarq0K8BUZ9md2y+g40sfhoc7eDYrHYYuz3+f+
 oXtD+/HoqqvPCCOScPw9Bg8kDOkjnlZgIliAhxtSoEJxMu7TIOT9SZN/tY3Z5p+vjn6M
 nEJg==
X-Gm-Message-State: AOJu0Yx+1CK7snSQ3t84IXBo/wMpznNwkKs2R09vQu5HIduAG57CSotr
 vtAVzvlWVqZHeWL2uGJIOt5KM2efbsSza9vRsHsLpJJA5CEva60DZcyli3jpGqhd1WsA8TyPAp+
 6EaM=
X-Gm-Gg: ASbGncv81WOp1AF8mS8V1GedxypmWyiFQcbUhvN5t066DFeO9F1Fzchg9GNPb5p69Nz
 0zVjqfOVHFxij5yw6DLfr7Ri+faj39Iqpmd4u2UCcjWTUXCQ4wnmkAl3hKbwSZ5LnMp9eBbRDSh
 UxZVWXtAp1iWN3ohKpbxP1dSp7hV04BTx49JKejVFkCFgeJ5++aYq4hPFgXSDXvU7idR7crWAm6
 xDBbZ4yBIz29XbGmtGVTxiPTDOv9Go+XNiUZB4ToZnBABH29z+SvYwKlZEK4kHDxy66xpADHJ2y
 gc4ZeQ==
X-Google-Smtp-Source: AGHT+IGtdTVDhfQCI/57FiKb9MvtBzXjQfobjfrjTBbMkb+9Ak6lzRxhrM6BHtPAxrcBV/pOtjQXLw==
X-Received: by 2002:a05:6000:471d:b0:385:cf9d:2720 with SMTP id
 ffacd0b85a97d-385fd3f2fa7mr7747186f8f.23.1733398484708; 
 Thu, 05 Dec 2024 03:34:44 -0800 (PST)
Received: from rkanwal-XPS-15-9520.ba.rivosinc.com ([137.59.223.84])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434d527395csm57943255e9.17.2024.12.05.03.34.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2024 03:34:44 -0800 (PST)
From: Rajnesh Kanwal <rkanwal@rivosinc.com>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Rajnesh Kanwal <rkanwal@rivosinc.com>
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 atishp@rivosinc.com, apatel@ventanamicro.com, beeman@rivosinc.com,
 jason.chien@sifive.com, frank.chang@sifive.com,
 richard.henderson@linaro.org
Subject: [PATCH v5 7/7] target/riscv: machine: Add Control Transfer Record
 state description
Date: Thu,  5 Dec 2024 16:34:12 +0500
Message-Id: <20241205-b4-ctr_upstream_v3-v5-7-60b993aa567d@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241205-b4-ctr_upstream_v3-v5-0-60b993aa567d@rivosinc.com>
References: <20241205-b4-ctr_upstream_v3-v5-0-60b993aa567d@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.14.2
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=rkanwal@rivosinc.com; helo=mail-wm1-x32c.google.com
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

Add a subsection to machine.c to migrate CTR CSR state

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
---
 target/riscv/machine.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index e1bdc31c7c53a8a4f539113d501c8e46f7a914e9..b67e660ef03b6053fa00d5a79e2ab20ecf3331b8 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -311,6 +311,30 @@ static const VMStateDescription vmstate_envcfg = {
     }
 };
 
+static bool ctr_needed(void *opaque)
+{
+    RISCVCPU *cpu = opaque;
+
+    return cpu->cfg.ext_smctr || cpu->cfg.ext_ssctr;
+}
+
+static const VMStateDescription vmstate_ctr = {
+    .name = "cpu/ctr",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = ctr_needed,
+    .fields = (const VMStateField[]) {
+        VMSTATE_UINT64(env.mctrctl, RISCVCPU),
+        VMSTATE_UINT32(env.sctrdepth, RISCVCPU),
+        VMSTATE_UINT32(env.sctrstatus, RISCVCPU),
+        VMSTATE_UINT64(env.vsctrctl, RISCVCPU),
+        VMSTATE_UINT64_ARRAY(env.ctr_src, RISCVCPU, 16 << SCTRDEPTH_MAX),
+        VMSTATE_UINT64_ARRAY(env.ctr_dst, RISCVCPU, 16 << SCTRDEPTH_MAX),
+        VMSTATE_UINT64_ARRAY(env.ctr_data, RISCVCPU, 16 << SCTRDEPTH_MAX),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static bool pmu_needed(void *opaque)
 {
     RISCVCPU *cpu = opaque;
@@ -461,6 +485,7 @@ const VMStateDescription vmstate_riscv_cpu = {
         &vmstate_jvt,
         &vmstate_elp,
         &vmstate_ssp,
+        &vmstate_ctr,
         NULL
     }
 };

-- 
2.34.1


