Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4C1606A31A
	for <qemu-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 20:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jZTokAkx
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xJd2D-0003zA-M7; Wed, 21 Oct 2026 16:35:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshit007k@gmail.com>)
 id 1xJc6p-0005lJ-0z
 for qemu-riscv@nongnu.org; Wed, 21 Oct 2026 15:36:23 -0400
Received: from mail-dl1-x1229.google.com ([2607:f8b0:4864:20::1229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <harshit007k@gmail.com>)
 id 1xJc6n-0000sH-AH
 for qemu-riscv@nongnu.org; Wed, 21 Oct 2026 15:36:22 -0400
Received: by mail-dl1-x1229.google.com with SMTP id
 a92af1059eb24-14394530ec6so1427485c88.1
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 12:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792611380; x=1793216180; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=21WVIi/PjHUROW6SHbbEbNpCKS+3a5GqVgwpiUZLdsY=;
 b=jZTokAkxa0AbTgHIIyj2YtEPaGuvVjV53sGFRQ8btBhHhjgKGD5AfWT/w0OqE6JeRz
 5F8kdn3kWuprI1ljAOvhzpTslJQQ+cNJ6T2pGSO/P3UyErkBbTXIDMGlo3YTBvnYWaYx
 MpBTF+iodG1YYFo2zpRyBcsWmSrgctfhPoTG/oGUNb1xPQsMR5H9aA58l+/H9tkRfp9j
 FL3vzDmI1dDYRQO031Ax42DGMNJ2ydEOb5K5c70/nGdE/Lo6zqWpaEGuSj8uOO7sGF5R
 MaajJZM18RMLwERu/YJK515d/FRKbK96APNwkkg+mrGSf6NlRNw98lSJeJcRd4UDgauh
 3a5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792611380; x=1793216180;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=21WVIi/PjHUROW6SHbbEbNpCKS+3a5GqVgwpiUZLdsY=;
 b=YUpz/zWSLmv7jlm/ZGtD6P8yCoCNEypDpLQIMitbt9YxG0wzcO79UcN466SmUAxRnO
 Eq16xNjhzY1td4NFe2I+0p+raiZoyYJo1Vwc5j6J88qBQ5k8CoCx+R9VIkU326/bXfVv
 kSMEHwgKMavz9W1emcC5h5VjX4PXtcrv5slR4gdRrwhhYQzliHmzvYLibhFG8o2RUj6T
 nBgoRGCZgQfOaI/tnSqcOAHahT2DcZu+beORa1F7rTxgsAhdCVcT5zKuY/bCyK8eMAN0
 PRs00Zb2/7Ek4gK7L1dcLjYTmu4ToZclw9yFCRbd2abLhJ7oT22+l5T+KSejsS6OKyAI
 Fqmw==
X-Gm-Message-State: AFq9FYLe3/JPL0Xy4RF/6MF0nlYxG9aWTgQQb9YobtBrF80wdwIKsjZk
 6KC3Z9K1CC1HQwKBCc7aR9eIe82wCiy8ehYl5zW8VYUTAZkAZ7vZb116
X-Gm-Gg: AYBFou2vxmDw55JubNLxyiJwa/DvBoGGZJ+HKj//rdws2J1EMdw1vme1boy3Diefujq
 HF+bz1JPCiKcY6j7lYMuJU0jZfh/8yOYfotZ11CTZVqmHHaj1ru4C6KpX7cWtoeSAJ2ljEtLbr+
 7Ej8Ji9UKCjBOPj0U6LlhxWl4DftL84vifnsK+lcnyfFtQpc8G/YqIHjccds9chmvoCQUeSsw3E
 nXv1Dxdefc+mPAnqWw7PGu1vSSB1VpUaQujpRYDjsNN+0knp1hS5nRZJ4++RDKMaHbfpAjq82r8
 XP9WlzcnIvZiSmjUgGWJu9DXp37rDngp/BxUK/LQsioEBOF9Uh4RlWmJKHWDkMxBlfFl9TwaWdF
 NqRJj+7XMXDzydG+76vp6sZ9vyDyIbCVBATzjyRocrcwDajbf/F34oBv58wWt4V3IF4V6f7yxTR
 HwH+wCym9PxZVPMBb91PcVWiZ2l+MvCSQ/MS3xBive1Y20WLI4H8FHg7vAXIX1ojYlXPjlu+NzF
 gyBW+fLEkCrBJZWAcGTDWJ3Dq0lZgN2SHhbnk2qTQmP6AaK0UhP3C4kKkyQm0qXQl++GpA/mT3d
 KijG
X-Received: by 2002:a05:7022:485:b0:18d:9eec:e0be with SMTP id
 a92af1059eb24-190a0612732mr5283381c88.2.1792611379525; 
 Wed, 21 Oct 2026 12:36:19 -0700 (PDT)
Received: from sys0 ([116.72.200.239]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-368b4b8e9c6sm754742eec.1.2026.10.21.12.36.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2026 12:36:18 -0700 (PDT)
From: Harshit Mukhedkar <harshit007k@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 liwei1518@gmail.com, daniel.barboza@oss.qualcomm.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Harshit Mukhedkar <harshit007k@gmail.com>, qemu-stable@nongnu.org
Subject: [PATCH] target/riscv: make sstateen1-3 reserved bits read-only zero
Date: Thu, 22 Oct 2026 01:05:38 +0530
Message-ID: <20261021193538.80383-1-harshit007k@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1229;
 envelope-from=harshit007k@gmail.com; helo=mail-dl1-x1229.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 21 Oct 2026 16:35:39 -0400
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

write_sstateen_1_3() passes SMSTATEEN_STATEEN (bit 63) as the write
mask to write_sstateen(). That bit is the SE control bit only in
mstateenN/hstateenN, where it gates access to sstateenN. The sstateen1-3
CSRs have no defined bits, and reserved bits must be read-only zero, so
bit 63 must not be writable on RV64.

Use a write mask of 0 for sstateen1-3 until bits are defined there.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/4726
Fixes: 3bee0e40106d ("target/riscv: Add smstateen support")
Cc: qemu-stable@nongnu.org
Signed-off-by: Harshit Mukhedkar <harshit007k@gmail.com>
---
 target/riscv/tcg/csr.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/riscv/tcg/csr.c b/target/riscv/tcg/csr.c
index 063590f56a..d9731421af 100644
--- a/target/riscv/tcg/csr.c
+++ b/target/riscv/tcg/csr.c
@@ -3941,7 +3941,12 @@ static RISCVException write_sstateen0(CPURISCVState *env, int csrno,
 static RISCVException write_sstateen_1_3(CPURISCVState *env, int csrno,
                                          target_ulong new_val, uintptr_t ra)
 {
-    return write_sstateen(env, csrno, SMSTATEEN_STATEEN, new_val);
+    /*
+     * sstateen1-3 have no defined bits yet, so they are read only zero.
+     * Bit 63 is the SE bit only in mstateenN/hstateenN, where it gates
+     * access to sstateenN.
+     */
+    return write_sstateen(env, csrno, 0, new_val);
 }
 
 static RISCVException rmw_mip64(CPURISCVState *env, int csrno,
-- 
2.56.0


