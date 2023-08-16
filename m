Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF516C001E0
	for <qemu-riscv@archiver.kernel.org>; Wed, 16 Aug 2023 06:17:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qW9q4-0002Hn-Du; Wed, 16 Aug 2023 02:17:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1qW9q2-0002Gx-JH
 for qemu-riscv@nongnu.org; Wed, 16 Aug 2023 02:17:02 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1qW9q0-0002kk-5a
 for qemu-riscv@nongnu.org; Wed, 16 Aug 2023 02:17:02 -0400
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-565ece9636eso565994a12.1
 for <qemu-riscv@nongnu.org>; Tue, 15 Aug 2023 23:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1692166617; x=1692771417;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vCBu2+Qo/HbMwf2WOdpk7YRQzn+i5wZoZtwY7MEU6q4=;
 b=Vi0ejLzGSDOHcbqV9+sYw9yF6PlV483n8rrPwJQXs4uETum7jUbPXyctNgZRdVjGct
 ZNf95Lasuyp8Asm15jU00N4YhwEDZRbwqTpr/Xs1+ckjRFpNAMHH1tf+yja0njPg1n3E
 4Q5WhOPtDqbqjKRV6SsABgm6R+WFvrqsFCAzjAxBR5y0e3pNlH12S+vlTKKEjfHC2aTF
 VE+2x6feo0XH+YraPT5bJrJkvIfrEaSxTVJDoQHtHYGXGEgBE6yrxqawv3H0CHJ2TOna
 K4rhCD5G5/bs9txbKASF80Sma9LCRP/WEJiDu/Hvr8Ibef0KKI2Qz0Ux74NlroY9KyLC
 tRVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692166617; x=1692771417;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vCBu2+Qo/HbMwf2WOdpk7YRQzn+i5wZoZtwY7MEU6q4=;
 b=Y9l9CbxFWyxDWcExDnC02+rHu8gwfBi/IgOZ9/Bq34asd9D8yKQCt0/rTmPTRUv+go
 /LRU50wPNqsoIs1nt67BZvRfF6NMEvochZSbHUFGq2a1KBuPNSvIKAf04yEvcWNxkZZ4
 h9ELbwkbWCSFsc+21QYveO5sc+m9sz+r7Tyzzume7MyyqzXk73gbtBO6IL+p2lNU6VIl
 Tkih2fmJFoVEerHxxoe7d6a86w56gw+bZnZUHZseTWjMZXXLA52hWBrLRd2gg6ZyUDYu
 n5OuraV0eF1sA/mpqNLyZbci6FPS2RDoLWUTX4YwzqB09hOTTTr9KZ90d4hVc1UzMjdI
 P3vg==
X-Gm-Message-State: AOJu0Yzf+3d9EBzdHfY9HwmnP0MABLwus6XgWHhBiLcMKGo7TimdlsoS
 Frh0XuzM5XFc0sXbUr8YXQJ/Tg==
X-Google-Smtp-Source: AGHT+IEJJTFuj+pWgS/BxJAjzVOuU4l//BgDpubvJ2scUAHIqo8MrImfPixRJjOYpc33XpQz0lT/CQ==
X-Received: by 2002:a05:6a21:601:b0:104:ad71:f080 with SMTP id
 ll1-20020a056a21060100b00104ad71f080mr974893pzb.34.1692166616673; 
 Tue, 15 Aug 2023 23:16:56 -0700 (PDT)
Received: from sw03.internal.sifive.com ([64.62.193.194])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a170902d90200b001b89b1b99fasm5722852plz.243.2023.08.15.23.16.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Aug 2023 23:16:56 -0700 (PDT)
From: Tommy Wu <tommy.wu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Tommy Wu <tommy.wu@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH] target/riscv: Align the AIA model to v1.0 ratified spec
Date: Tue, 15 Aug 2023 23:16:43 -0700
Message-Id: <20230816061647.600672-1-tommy.wu@sifive.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=tommy.wu@sifive.com; helo=mail-pg1-x534.google.com
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

According to the new spec, when vsiselect has a reserved value, attempts
from M-mode or HS-mode to access vsireg, or from VS-mode to access
sireg, should preferably raise an illegal instruction exception.

Signed-off-by: Tommy Wu <tommy.wu@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/csr.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index ea7585329e..e4244b8dac 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1685,7 +1685,7 @@ static int rmw_iprio(target_ulong xlen,
 static int rmw_xireg(CPURISCVState *env, int csrno, target_ulong *val,
                      target_ulong new_val, target_ulong wr_mask)
 {
-    bool virt;
+    bool virt, isel_reserved;
     uint8_t *iprio;
     int ret = -EINVAL;
     target_ulong priv, isel, vgein;
@@ -1695,6 +1695,7 @@ static int rmw_xireg(CPURISCVState *env, int csrno, target_ulong *val,
 
     /* Decode register details from CSR number */
     virt = false;
+    isel_reserved = false;
     switch (csrno) {
     case CSR_MIREG:
         iprio = env->miprio;
@@ -1739,11 +1740,13 @@ static int rmw_xireg(CPURISCVState *env, int csrno, target_ulong *val,
                                                   riscv_cpu_mxl_bits(env)),
                                     val, new_val, wr_mask);
         }
+    } else {
+        isel_reserved = true;
     }
 
 done:
     if (ret) {
-        return (env->virt_enabled && virt) ?
+        return (env->virt_enabled && virt && !isel_reserved) ?
                RISCV_EXCP_VIRT_INSTRUCTION_FAULT : RISCV_EXCP_ILLEGAL_INST;
     }
     return RISCV_EXCP_NONE;
-- 
2.27.0


