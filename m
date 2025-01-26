Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B0B1C02181
	for <qemu-riscv@archiver.kernel.org>; Sun, 26 Jan 2025 07:24:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tbwyP-000585-QG; Sun, 26 Jan 2025 02:22:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonb@tenstorrent.com>)
 id 1tbwyH-00053a-Af
 for qemu-riscv@nongnu.org; Sun, 26 Jan 2025 02:22:17 -0500
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <antonb@tenstorrent.com>)
 id 1tbwyF-0004Hn-Ms
 for qemu-riscv@nongnu.org; Sun, 26 Jan 2025 02:22:17 -0500
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-29f7b5fbc9aso1208319fac.3
 for <qemu-riscv@nongnu.org>; Sat, 25 Jan 2025 23:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tenstorrent.com; s=google; t=1737876133; x=1738480933; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IVUb6JglmtBwfEJB/7yRdjCHmmn4LU6M2mqcUPBTqCQ=;
 b=hBKJvcFo0JphyfkZq1vRvZvo6N+P30NDxvlTHeEvgNp4XB92DkdA1LfIfUZA3IvPU/
 WLrQM581hkUX9MjIkORCticwwkgBuOP82i0By2KMBVZMvNIZ0Em1fPS7LONAy4nIYBz5
 RlHknFsdN0HEEqHJVNEmWEpBLhZhKv9IOMU9ucr1ANM2zFrx0I0famq2exMJe/WXsADS
 IkK/pb6HfMH7DMPJNZbRrJlIgcb7obtRIi5xHQfCb7+ugjaVDXgJbpS2QS6yzE849Ocx
 V6NxqTA7Vkv9KZv/pDfnVBmttbWKiaR+PQQdFvl1VpO0YIs2jEKh1DroRYg5gric8vY2
 3fyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737876133; x=1738480933;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IVUb6JglmtBwfEJB/7yRdjCHmmn4LU6M2mqcUPBTqCQ=;
 b=L8Of6iSU7uI7evpXmxNVryLuQAxcz0yZUTjMoSinDoVYCl7H4cDm4Up7ny4vlEVLsB
 dk5FcYbryEBjq7fAlU/JzwftRr11zextxT35S2rDco6ZQzTn4uM4MAcexmcr/BEt9nrW
 Ch3GODWSCVNr7aTAHSJc50DaPYaMJbL+lNJqr4fJFVLs6BBP3K0mBm9nj8im+/4EZQuR
 doYLn0Lxja4fFk2lT/bbg2GJvjg2LcW1K4Nzwjh2dSwfjl35mpI0BSD8EV0EPqv3HSom
 K8Kkzt7dBQFAm2qG4UJYnzGcxad8Cgw3y3C0t3YYuIBRErY7cjD1K4gNUoM3BwFB+pqh
 wZ1w==
X-Gm-Message-State: AOJu0YyW1CZepduQnVvxAhTmpvgi7nKJfnFUbOaxwSO0XcUI8T7zNKSq
 oTECNjYmAJneXzxyyEJ1UFHrK8pbq4Q4HKRzbwm/D0rDJtBsAFUs+JviX1vXkdqxktT+W3t5RGv
 3pm5uLg==
X-Gm-Gg: ASbGncvWs4LspQU4uI1JGAkiHyz7wBQ9YySOr5U9wZq38k/780+J9tCbb2JgJJXWa8x
 0qu4toXvIutD/B/FgOdtgFh76LAtK6+19MBl8JLlshK8Tu5UK5SmpHd0FfwtIJaUqX9ib0Cmr70
 FVpKJnHe/7hyj2EN7gEbSg4jVq2BxBvpe+oMzS00JLTVmNpTPesXk2i0x/F9LMvZp8NoegEHBUH
 /qCMJ2ZXm0ZZBsmR9iEkFI/p4Q11TbkgCWnAOCNLEdHElElI6bpgNkU3TGHGEDaxRzpMK/UNc/0
 RpDOqE91rpQgw2ZJnL8lnZ8fMuHWBTyEiF8EnBU=
X-Google-Smtp-Source: AGHT+IG4P2wbRvGdjsmENxQyEpUr9zOJl5b1mqVCXt/0+eGHm9dLtnR6mgbUroISJRH4t19XGAXPfw==
X-Received: by 2002:a05:6871:62c2:b0:29f:97af:a1a0 with SMTP id
 586e51a60fabf-2b1c0c552eemr18804659fac.24.1737876133218; 
 Sat, 25 Jan 2025 23:22:13 -0800 (PST)
Received: from ausc-rvsw-c-01-anton.tenstorrent.com ([38.104.49.66])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2b28f1d887csm1814281fac.29.2025.01.25.23.22.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jan 2025 23:22:12 -0800 (PST)
From: Anton Blanchard <antonb@tenstorrent.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Anton Blanchard <antonb@tenstorrent.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH 04/12] target/riscv: handle vadd.vv form mask and source
 overlap
Date: Sun, 26 Jan 2025 07:20:48 +0000
Message-Id: <20250126072056.4004912-5-antonb@tenstorrent.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250126072056.4004912-1-antonb@tenstorrent.com>
References: <20250126072056.4004912-1-antonb@tenstorrent.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=antonb@tenstorrent.com; helo=mail-oa1-x2d.google.com
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

Signed-off-by: Anton Blanchard <antonb@tenstorrent.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index bc2780497e..f5ba1c4280 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -403,6 +403,7 @@ static bool vext_check_ss(DisasContext *s, int vd, int vs, int vm)
 static bool vext_check_sss(DisasContext *s, int vd, int vs1, int vs2, int vm)
 {
     return vext_check_ss(s, vd, vs2, vm) &&
+           require_vm(vm, vs1) &&
            require_align(vs1, s->lmul);
 }
 
-- 
2.34.1


