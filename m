Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C65D4C5CFC1
	for <qemu-riscv@archiver.kernel.org>; Fri, 14 Aug 2026 08:23:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wunBR-0001pd-Ip; Fri, 14 Aug 2026 04:22:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <314abh@gmail.com>) id 1wunBM-0001oz-Vg
 for qemu-riscv@nongnu.org; Fri, 14 Aug 2026 04:22:29 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <314abh@gmail.com>) id 1wunBL-0007c2-Gi
 for qemu-riscv@nongnu.org; Fri, 14 Aug 2026 04:22:28 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-3900e39d935so701256a91.0
 for <qemu-riscv@nongnu.org>; Fri, 14 Aug 2026 01:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786695745; x=1787300545; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=OzPTbr5W9I3uHTFntkfjo5xfeIQxbJCZBUMEDG07isQ=;
 b=Po8qtgSiaJuvWGjxMICDUf2RnD2u8UfDrxmd9Zk6VAGWqaJ4ttqVd/b7nP3+aICVhc
 rmTHYXvskv6p19DOGKavXRa2wX27zcx/CBJ9KQlDodXvIe2xt82Y1EgupZ8b89tdC2X5
 1OjCH/FHSorINfhc7vE++2/+g0b5ITkZU1Dx5NPAWZyXpY8fHt2IDOHKCT/Lh4nqYnTC
 3jg6iqGI/6nhvvTrcD54KPTtAFCXG0JSS8rjD8y/h9k+b/JarT2tYPe7JlzMbb8xDrl5
 u18c4fTRartLQ/nej5Ky9UxjZU8qxCnAQzW9tEu1ga8jjsam9jhgaSdNM5i9HJu9g7nx
 OhGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786695745; x=1787300545;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=OzPTbr5W9I3uHTFntkfjo5xfeIQxbJCZBUMEDG07isQ=;
 b=JWg/25iWt5aRuQAva03gH05DWjx28jBfGd8C5wj9qJhQPS/V//WT8quCA9kWXTz31Y
 vuSkom4zUk+SWVqvhrapak8YSBLK7uROQnZ1K7IIL5xPvud2NVUFJbfZx1803jb4aYi1
 QAi6pcYcAZmNLcAFxrnG8FZyjWcud9Bu9Z8QJIaHdkT0aBfueUBBjeZtIiZ1ZcKbXbtt
 ok3lwstBpWj35/Oc+liPLBaoUIONKzP5hQKFmd1SoO3dljfblhZiLATbUL6XWU4ZnF3V
 RfL2cRS908Dh5tUA3y7IraHvbXVHgz5vwBNZ23/b6RLyUNIRNmrgfYPqO/cIemotU0si
 UpRA==
X-Gm-Message-State: AOJu0YxmM7YXzh32JIM2SvWaPyqygWILGq/9iUsDwq2p4MGuRUDki5W3
 3uZJJlVFPorCt9DSVk+2GExo1F8CNIJ/pMYa9ThHt9u4R4Awt4QX501AzAQUuQ==
X-Gm-Gg: AR+sD13dTDh+K6HhBWv5It7hg9QHU4BmkFE/jPYVBXh1sCoDuvQyrenfEUrFfuav6RA
 0K7RIYMjoj+ShX2jL8ftiT2iWXFJEWmAOdVlw7ROKPKtQgPUKrzKtVB4I5LnP8/R6DUGNVt5Ffr
 ug2+R6zTdMXNcZJkXMhSwimCJIWQoXPPdthkFddxzwJxKxhbY0Rx910R+5de4evP7uuzwh86c4+
 S9zs5gfcw/BKIzDSXt00UmMYma0z7cAP1Zp49HiaACOK3lqxu21okZaWT3XJ5UxdRQF0tV8W31E
 QW6CvFl0zqYPQaMpI7nMcxTzAzLGfOjV5kDPDqpYmTvaxinHIubaTJL/yjKLdE8C1f83RguojXO
 rbTMLXbHlvXCzmDhQPdADGzqX/epzdZHjXtn9KNFAnTvHAkunzMBs8XKh07niiHyOdet82Ln/Hw
 PER7GOIJ0jBt/ASmKeN+Ej4+pcnXNPdeHnWsQ6TTzQBmMRHNDQqPs3ig7y
X-Received: by 2002:a17:90b:58e5:b0:381:a766:efc9 with SMTP id
 98e67ed59e1d1-3933caf3a05mr4347580a91.7.1786695745458; 
 Fri, 14 Aug 2026 01:22:25 -0700 (PDT)
Received: from arch ([112.133.246.3]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-320d60eb8eesm1829287eec.10.2026.08.14.01.22.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Aug 2026 01:22:24 -0700 (PDT)
From: Abhigyan Kumar <314abh@gmail.com>
To: qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Abhigyan Kumar <314abh@gmail.com>
Subject: [PATCH] target/riscv: make cbo helpers [ms]envcfg gating in user-mode
Date: Fri, 14 Aug 2026 13:52:17 +0530
Message-ID: <20260814082217.278685-1-314abh@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=314abh@gmail.com; helo=mail-pj1-x1030.google.com
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

Current implementation of check_zicbo_envcfg is wrapped in an if-else
macro that eliminates the function during compilation for user-modde.
But, the zicbo spec states that [ms]envcfg gating is to be used.

Fixes: https://gitlab.com/qemu-project/qemu/-/work_items/4107
Signed-off-by: Abhigyan Kumar <314abh@gmail.com>
---
 target/riscv/tcg/op_helper.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/riscv/tcg/op_helper.c b/target/riscv/tcg/op_helper.c
index ba3c7da..bc899c4 100644
--- a/target/riscv/tcg/op_helper.c
+++ b/target/riscv/tcg/op_helper.c
@@ -160,6 +160,11 @@ static void check_zicbo_envcfg(CPURISCVState *env, target_ulong envbits,
     if ((env->priv < PRV_S) && !get_field(env->senvcfg, envbits)) {
         riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, ra);
     }
+#else
+    if (!get_field(env->senvcfg, envbits) ||
+        !get_field(env->menvcfg, envbits)) {
+        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, ra);
+    }
 #endif
 }
 
-- 
2.55.0


