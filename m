Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2D36CD6E4A
	for <qemu-riscv@archiver.kernel.org>; Sat, 30 May 2026 04:27:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wTBIG-0001C4-SC; Sat, 30 May 2026 00:27:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <314abh@gmail.com>) id 1wTBI9-0001Bb-FR
 for qemu-riscv@nongnu.org; Sat, 30 May 2026 00:27:22 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <314abh@gmail.com>) id 1wTBI7-0006GM-QO
 for qemu-riscv@nongnu.org; Sat, 30 May 2026 00:27:21 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-83538fbd0b2so5972160b3a.0
 for <qemu-riscv@nongnu.org>; Fri, 29 May 2026 21:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780115237; x=1780720037; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Blw7Wt7/kwkfq4BhOBbc+EN9q32F8MK44+Dv0iHWibw=;
 b=enYudFdJtjm1m3lm6cc2Nj3JwiFsizjHrTbP85CghnDcB2Gh9gBt2GqQA0pQvHmRky
 GQXOyYztc8LJ78nDQ/VPgK1it2DGJv0+IlhQpPPGK8XQnvuvrg93wFKOhVK3Bklei6Fh
 WzZA4KppeUzXN2BrFrQcd54TEbP3CcCZYr1fO7QqQhIzMuZwA4LyBCrOxWU/ISUnAcN0
 2y3Ipg+P5hxGGWxIwM+LeHp99eDA0c/xFMF9S5IEWi2XGK0VsamNQvzLf9q2bYtTdTiW
 gEMYBwcljKrJJ+5kXqo9HI/1aI/dKtAPxSe+eJwXriIY0q9xatnpzgFAgcTJvDSFo6oy
 mhYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780115237; x=1780720037;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Blw7Wt7/kwkfq4BhOBbc+EN9q32F8MK44+Dv0iHWibw=;
 b=jz2jTeMRF1AqEC/xp4WXiheekjQks8rwMpFdChBwtoJoQOdbXegAbeGASo4UGUHLxR
 qWhA52fq/s8Hb3tu741aO1l6d7KfpgE13s8JVVFxG+KXHWyA3n3N0pSPhtsOT/YzaxNz
 XhQD45y+PGHJbv+HwMj6THWb4uYD7AsIe/HPWdfhis9XCnTp3hchm7Lz1k6UYCh7sVlB
 aSJl41zxAu54C1IdXLNcPKBBViI9FKbydEpBxELshhC54mOLKvE1NwaQRWoiRy6tJkxs
 P2er6hRp8uOMfYcfPgMNbaIsIkzPDoO8vRMpiZQEthOo/Fwk/xTFNkl/TKIlMHIzRMPd
 k1jw==
X-Gm-Message-State: AOJu0YzkQgOdSa/nmecowOnNPORCcHnu4DuzMzQ8YiVC0XVBk/GWPVv7
 pgb9lkRcllDuA4X0eYMFu03YyqgbvR4uG0MzIBnBSXOtk7b5K1VfkFeC
X-Gm-Gg: Acq92OE2tqsyZMX1YqevjNC1PqcUVI0Ofh4u8hqLHOAJsQFyDoonWy2NKaKaPfw4or9
 OVtqr7p5QDe2SQ5EQ8pml7mEII3KEnLxBkXl8MTpdwEnOpaq/455JrlE8cIFMIFoNdjyxvc+WFJ
 QJTZeCYyaZ9eY8M3ULbAXYTZxp2lnaVZN/rggQIfKgV2t3LdvA1YQFyI8my9yraHqjbST0qKe2J
 yPeDVjew6c/9yAJQe8U4PKWQWRcisxvqB/OkBebTGKnsIUKZUX7TXXTjMRbkFAf8eA6ktReoSBG
 0TCGlTacCMHs1+7IUxxMt8a5n2a8wBhkDXJ0jBs5n7DaLiOjYNFGNGCLHYD9sU6VVIs00NvxWX0
 5DoLmh12ARe5yBuwrFm59fi+nuKk1mc1XnJD+MmHALKrg7xh/cw/r2Y5I7XRj/t1pNOvzvix9A+
 4pTIbJBYX6HUuDK9+He5s=
X-Received: by 2002:a05:6a00:4296:b0:839:e27c:6cce with SMTP id
 d2e1a72fcca58-842257601a5mr2250866b3a.37.1780115236661; 
 Fri, 29 May 2026 21:27:16 -0700 (PDT)
Received: from arch ([112.133.246.1]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84214b31933sm3481899b3a.23.2026.05.29.21.27.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 21:27:16 -0700 (PDT)
From: Abhigyan Kumar <314abh@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Abhigyan Kumar <314abh@gmail.com>
Subject: [PATCH] target/riscv: mask vxrm csrw write to the low 2 bits
Date: Sat, 30 May 2026 09:56:57 +0530
Message-ID: <20260530042657.844880-1-314abh@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=314abh@gmail.com; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_STARTS_WITH_NUMS=0.738, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Citing the RISC-V specification:

    "The vector fixed-point rounding-mode register holds a two-bit
    read-write rounding-mode field in the least-significant bits
    (vxrm[1:0]). The upper bits, vxrm[XLEN-1:2], should be written as
    zeros."

QEMU wrote full value into env->vxrm causing read of upper bits too. The
2-bit mask has been added with this change to prevent it.

Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3470
Signed-off-by: Abhigyan Kumar <314abh@gmail.com>
---
 target/riscv/csr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 5514e0f45..f5b0895fd 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -977,7 +977,7 @@ static RISCVException write_vxrm(CPURISCVState *env, int csrno,
 #if !defined(CONFIG_USER_ONLY)
     env->mstatus |= MSTATUS_VS;
 #endif
-    env->vxrm = val;
+    env->vxrm = val & 0x03;
     return RISCV_EXCP_NONE;
 }
 
-- 
2.54.0


