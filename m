Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C8EFCD5BD0
	for <qemu-riscv@archiver.kernel.org>; Sat, 30 May 2026 10:21:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wTGox-0005lV-43; Sat, 30 May 2026 06:21:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <314abh@gmail.com>) id 1wTGou-0005l1-Pp
 for qemu-riscv@nongnu.org; Sat, 30 May 2026 06:21:32 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <314abh@gmail.com>) id 1wTGos-00044S-4w
 for qemu-riscv@nongnu.org; Sat, 30 May 2026 06:21:32 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-84236f9b638so43598b3a.2
 for <qemu-riscv@nongnu.org>; Sat, 30 May 2026 03:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780136488; x=1780741288; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KGXs0zklixupHui+lUe2OoB4NdpP2UqJjahJ3jAoXkY=;
 b=LoaLEkwx50GdB2VoWDU76/ViLB1jtA/r2acFDCsD5wUfciOJPdCNDaYCAvhvk3ULET
 TewpX5BM2IXAOwrazJMwn+0MKo2kh6n10blXMV/QBTLphGYsTqlqA1yPfbblFki9pY2C
 bmJPaacoBUG/XDxeg2b8cmXUQHR7znoc6pCaDBadfDkmANZfrnq2y5VBWRS9WuX3L3Z8
 ZG8lybpDSanfshrzINb7Ntl3KFFqYWKMjtVkC8prNax2fgU0p2fz82sPlZ44tSQA6mX1
 5YSxbFD6w84JN285ipJy158Z+seObP17HR/NrCt0PKUhIbwg9kQlhkHrMUV2Jm5HQVs1
 lTIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780136488; x=1780741288;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KGXs0zklixupHui+lUe2OoB4NdpP2UqJjahJ3jAoXkY=;
 b=SByuKfh29AqA6ZmdmgiH1zR/D1L4+YA1r2FovWOn+6ELDecRApd8FKOrDUALLYp49l
 rV0J1FuILHEeMzt1c2aGKEO7DZGSS+33dfikZaBc3kBwXNMA5Co31ZtOferpdIQohtFo
 Ell45ll+AoJIcHQgxhbBiVc7CEAhFPkboNCVJ8VlN1V9qpa6MDWIV+pdz9ts/Cpm2uBu
 8ACTMNTQRJYckOXnSDsRT0uyqth308W97P8gG4KC2GLMZ+E60H0gUVv4DWFMKK/A8T8V
 66o4onThJQ8kGiicy6Py8KJDZVn0WRHEMya6hdKWwW+wu9BRcBmWPMzQ/A2Uu1Xu7A1j
 n76g==
X-Gm-Message-State: AOJu0YwAo0Y9KmtDjr9XnR3pjTGbv/UjxBZmvAWch1UyiVW0JOU3p7KF
 ooqdcd3W1gZiSxdZtTvV4qKWXNkWV5aQpUMBLDAVe5/B8Uz3CwOLhhcb
X-Gm-Gg: Acq92OGQ6Wj7XjLa8bYFdR0IAcDwSyiG7TwKZXI9dORPwa98eOae1m8N5B7oow5OUy1
 HEzwCfOqJ6re1w1+dKBSYBB/LUkST1zEyPoCZ4rB8wSO3E8Zp/AZmwXTqQobCzz/GYosSoqCRkw
 yjF64g4z0NpoC2GhNiU7qCkyi713jtwbfyNSd5sMC+HGf2Y2pJBEkPZ9H3eFT4AXsTgCd2hJkNy
 dZNlFpy5+v7I9ZE9RVB+m4Wa0fvxAfCROHhZgWAH6XGSkX87UdLOwLnjY9AS2e1XXD3UUi+y7TX
 8BWi2PKgrQL0PQS3An80gkGy9kv94Fyfd1HpJXhAfa0XA+rq6h52Nl+0gavulEcD/LtisZvmc2/
 eyvwPR76gwOpIZoiQq0MCgcFiyPrPpiRiCZ/AdpqzvIVM7hjWyucILuJgYHwrJiAWDAv/TlTeLj
 dwvZddKqUU5X72ngnk2ey/ASYaFmJ2Ce8=
X-Received: by 2002:a05:6a00:6f50:b0:842:2ae0:968d with SMTP id
 d2e1a72fcca58-8422ae09a48mr1844918b3a.32.1780136488439; 
 Sat, 30 May 2026 03:21:28 -0700 (PDT)
Received: from arch ([112.133.246.20]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84214c92fc6sm4364229b3a.36.2026.05.30.03.21.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 May 2026 03:21:27 -0700 (PDT)
From: Abhigyan Kumar <314abh@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Abhigyan Kumar <314abh@gmail.com>
Subject: [PATCH v2] target/riscv: mask vxrm csrw write to the low 2 bits
Date: Sat, 30 May 2026 15:51:00 +0530
Message-ID: <20260530102100.78150-1-314abh@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=314abh@gmail.com; helo=mail-pf1-x436.google.com
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

QEMU wrote full value into env->vxrm causing read of upper bits too.
Used existing macros for bit-masking. Previous had a hard-coded value.

Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3470
Signed-off-by: Abhigyan Kumar <314abh@gmail.com>
---
 target/riscv/csr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 5514e0f45..7b98d66db 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -977,7 +977,7 @@ static RISCVException write_vxrm(CPURISCVState *env, int csrno,
 #if !defined(CONFIG_USER_ONLY)
     env->mstatus |= MSTATUS_VS;
 #endif
-    env->vxrm = val;
+    env->vxrm = val & (VCSR_VXRM >> VCSR_VXRM_SHIFT);
     return RISCV_EXCP_NONE;
 }
 
-- 
2.54.0


