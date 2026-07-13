Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBFF8C44501
	for <qemu-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 03:53:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wj7iE-0006yx-0G; Sun, 12 Jul 2026 23:52:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1wj7i7-0006xk-Sh
 for qemu-riscv@nongnu.org; Sun, 12 Jul 2026 23:52:03 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1wj7i6-0001O1-Aw
 for qemu-riscv@nongnu.org; Sun, 12 Jul 2026 23:52:03 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-8487088510aso2447785b3a.0
 for <qemu-riscv@nongnu.org>; Sun, 12 Jul 2026 20:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1783914720; x=1784519520; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=O5v+4E6AH085JvEW/ulDh5E/YMq66y/1MyNCyiZh4NQ=;
 b=RHBEsj2fgNJ5NbGrxK9K/7mASENqFPJ5Gfg1VNxuhnq1LNgpGpkWDc1y7ir/IoAQZf
 cVsDCbOWjD9z9ZdqXuOeajsV3SZECuXJoCrybBTkqy/dWy7oLFo/wfDJnDTL6xQK1PDD
 S5lf0C1yCTG/nk5cmqL4brssv92mTWVSDhkjxFfktjyitU3x3fM7fMpIpBe9beKZbnvS
 ew77pc5mlxXhIBfh0yIEQpCqPtth9X4S3LsIcdf8R3hHjQmrvOxV1l1EY+4IdOLXwzEE
 NE/r4n9w92/zjXqRFmpBSR9hnQixitpnG55vzYdMfDd0qGvp6N2UY0hPB4Xq2mbewzbm
 hfjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783914720; x=1784519520;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=O5v+4E6AH085JvEW/ulDh5E/YMq66y/1MyNCyiZh4NQ=;
 b=RheRsTCe85OPcnvZHCzdDYKFYr1SmMDt76Q+VW/oFGLG7eTDjUK+aaf409xmXt8L+9
 3FkqEAGRj795gfs26Oq0j36HeFX5wI04D8HiislIFQG98Q+gquLelavnP1CNXOdsi2li
 S8xvhhEenR67B6DtOSjA3jD+JyRK2HAlgNRDFoGobtv43ODi8sbkiW9jv5W9hhPoJUUN
 ahRv1rHqgXTI/x0AE16pla9SRmGEBY9F2kVkwRCjuPFFNaoxVDHHz6GnPVtDplKpvhM0
 SN8Z3HdHQysSlUSq3140bLFvoxh8V3JqonUP5bEY0iTg5h7OnYkKqcPFU8XRV7oGvM5w
 fsWA==
X-Forwarded-Encrypted: i=1;
 AHgh+RqLBOTxfbpAipKq2wj7Q2UwF0OYzn/q+KJ/L2V2KlCCJFN881jc2qm0drI0JtgApziRBFFCH3y/Sv3e@nongnu.org
X-Gm-Message-State: AOJu0YxbeeGcJdKEbCsx0eAkJyTNE3/LkrPfYXgEr/GJWvOVuVnPkmQS
 DcCNIJzB2G9T/GNy3tEGH7rHnCypZ0rWT4q6YUc2M2HKoWLgmLbex3Q/SiBEoPZanDo=
X-Gm-Gg: AfdE7cmF5yUq4d4OpPuh2vy5jNY2R2WKt2BnsrvJ2gtK0NAGbi+1mRvWsrC16F1VS10
 3PInPwrl86AW/mBg7HB4UETJgw5E1SP9QXr3k0lUNpL64CET85JGpT63eh5qBYEzkZq93Cqax6g
 a29gAQQ+WuQ268H9qXsBhqCIt3fnIZKpveGH/2ki5qvXqUF8QtcKnYhqfjnvIGCF+8+Xkpurjq4
 dWzTVTIbw6vFYpSkb2YgcMusk2awdsDfqYrkUbiXELFpVTNqal40IUMK9gTs+rYmLYVbyESsLji
 g2JtsWbec9YC+rTg03Qq5WKF9nJvUhKSkYBEW4grz5N8fyTUdbf++VII1ELSiok/Wo/bOoU5x3A
 PaUZ4fC8pkptJxhV6BKj9X3TSTADt7yw8I3NQeZ7HUsmIfLp2dKTnzy7G/mrmz3t1hoWAnXT+fh
 N9kPa8m1DlE0d7xVJuDOqMlohfapWdllAse/IAlSE=
X-Received: by 2002:a05:6a00:6c9a:b0:848:2f73:9000 with SMTP id
 d2e1a72fcca58-848897b5315mr6807930b3a.73.1783914720120; 
 Sun, 12 Jul 2026 20:52:00 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-ca5b3162d3csm7739884a12.18.2026.07.12.20.51.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jul 2026 20:51:59 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 qemu-riscv@nongnu.org (open list:SiFive Machines),
 Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v6 6/6] target/riscv: Expose Zicclsm as a CPU property and
 update RVA22U64 profile
Date: Mon, 13 Jul 2026 11:51:35 +0800
Message-ID: <20260713035135.3996990-7-frank.chang@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713035135.3996990-1-frank.chang@sifive.com>
References: <20260713035135.3996990-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Frank Chang <frank.chang@sifive.com>

Update Zicclsm ISA string and expose it as a CPU property to allow user
to turn on/off Zicclsm extension.

In addition, Zicclsm extension is mandatory for the RVA22U64 profile.
Previously, Zicclsm was enabled automatically when has_priv_1_11 was true.
Now that Zicclsm has been converted to an explicit CPU option, it must be
explicitly added to the RVA22U64 profile's extension list to ensure the
profile remains compliant with the specification.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 7ee89f6fc4b..19b93f9c979 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -164,7 +164,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zicboz, PRIV_VERSION_1_12_0, ext_zicboz),
     ISA_INTERNAL_EXT_DATA_ENTRY(ziccamoa, PRIV_VERSION_1_11_0, has_priv_1_11),
     ISA_INTERNAL_EXT_DATA_ENTRY(ziccif, PRIV_VERSION_1_11_0, has_priv_1_11),
-    ISA_INTERNAL_EXT_DATA_ENTRY(zicclsm, PRIV_VERSION_1_11_0, has_priv_1_11),
+    ISA_EXT_DATA_ENTRY(zicclsm, PRIV_VERSION_1_11_0, ext_zicclsm),
     ISA_EXT_DATA_ENTRY(ziccrse, PRIV_VERSION_1_11_0, ext_ziccrse),
     ISA_EXT_DATA_ENTRY(zicfilp, PRIV_VERSION_1_12_0, ext_zicfilp),
     ISA_EXT_DATA_ENTRY(zicfiss, PRIV_VERSION_1_13_0, ext_zicfiss),
@@ -2237,6 +2237,7 @@ static RISCVCPUProfile RVA22U64 = {
         CPU_CFG_OFFSET(ext_zkt), CPU_CFG_OFFSET(ext_zicntr),
         CPU_CFG_OFFSET(ext_zihpm), CPU_CFG_OFFSET(ext_zicbom),
         CPU_CFG_OFFSET(ext_zicbop), CPU_CFG_OFFSET(ext_zicboz),
+        CPU_CFG_OFFSET(ext_zicclsm),
 
         /* mandatory named features for this profile */
         CPU_CFG_OFFSET(ext_zic64b),
-- 
2.43.0


