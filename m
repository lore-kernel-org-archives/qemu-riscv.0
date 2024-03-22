Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A8A5C47DD9
	for <qemu-riscv@archiver.kernel.org>; Fri, 22 Mar 2024 09:33:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rnbGw-0006qK-He; Fri, 22 Mar 2024 05:33:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1rnbGu-0006p1-GN
 for qemu-riscv@nongnu.org; Fri, 22 Mar 2024 05:33:08 -0400
Received: from mail-vk1-xa33.google.com ([2607:f8b0:4864:20::a33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1rnbGr-00082L-Ul
 for qemu-riscv@nongnu.org; Fri, 22 Mar 2024 05:33:08 -0400
Received: by mail-vk1-xa33.google.com with SMTP id
 71dfb90a1353d-4d436ab8a36so783734e0c.0
 for <qemu-riscv@nongnu.org>; Fri, 22 Mar 2024 02:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1711099985; x=1711704785; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NK+9yRKUKzgO+toUFNyttunP9TjjWWzFsOj48XWUWIU=;
 b=HwEPhK+Dh9+HMsKQISU3pYZMOmygOlDP+cjo2Btu8IwxPxuJ+KqBSoAj1YQglxXS3k
 PJGpcg8Ww1axw6cYSkDwoUlODAykSiItMCi32Gne5YyTah4O8/lcGHtvqx6m3KxqAhM6
 xV2Ch9KvXp/wm17vKU9xe+K4JI1vCORIXlEq/BLwYuaqrGHQj1Igyct4741C4xM2LfER
 fLZVW/fEMclAJoEJg4QyCtmNzSrT4RfzPPGvAqY0Dk3ACxHrtIcuK1J8Vw5ggxD/K/VW
 LW+MhX9/wNxOWRcDLvL8icdXbmKut/80s4RS8SOrmH6pr7rF8r/FbBAUZu8n5zVQbYun
 /X8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711099985; x=1711704785;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NK+9yRKUKzgO+toUFNyttunP9TjjWWzFsOj48XWUWIU=;
 b=iv/bUmql3g/d3xgXM2o1KOTjZ84AtnQvJGSH4omjDbNbJm4cXCbbq6LnRoKCYCT1Yo
 q2LIq5VJ1TC3bSpvKPCtoyKqDqSrjnblFcbIEWSdw7acQhJoSVhqbelu7nDFuYSLdwCr
 YTxBN93BEbGLSlOO1J23+oQM/lFltWDI9mjM0tamcPymgcVuADwiIMS7LAgk27PT8r9K
 FbZxnJvK87cWKdflLfN/FMCXZCiHxeAuVrBhYUXahEkzZ1GJgSrzWSdR2e6gKh//wuvq
 QPePkVDUw4lH7cUq3eAJSphU0pLT3HtNPQt7YyU6qXvJTCdJWsu4gjmohEsXulrtKyY0
 9Aog==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDjKnaSNU09AeSS1bn2N0ENHGzwfzbTXBS2QuHXCfxJWJBd9GsBgIcn0n34vx4p0hAn1GalCS/7joORkmCa1nGofJoOy0=
X-Gm-Message-State: AOJu0YwowmRhq9CqgloVfJlwEtHWw0EUnnn486L/wctfQ+3JskTRyQd3
 /RGs8E4o9HX0kK8CzFuJ3IvEK7IjphUhSqA97ET4TVx9UsvhMN3mzp1wNUasUyJfVZo1EZyrd/9
 ZjuU=
X-Google-Smtp-Source: AGHT+IFFJCsdCgR5DUtw1hd2CwOyWmrOEhbETvWEYEROB7qnCvIBf4WgLwDNwQL5ZlvLFBkDw+G/Sg==
X-Received: by 2002:a05:6a20:1b27:b0:1a3:703c:c809 with SMTP id
 ch39-20020a056a201b2700b001a3703cc809mr1743467pzb.21.1711099580884; 
 Fri, 22 Mar 2024 02:26:20 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 z14-20020a170903018e00b001e088a9e2bcsm1380380plg.292.2024.03.22.02.26.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Mar 2024 02:26:20 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Max Chou <max.chou@sifive.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 3/4] target/riscv: rvv: Check single width operator for
 vfncvt.rod.f.f.w
Date: Fri, 22 Mar 2024 17:25:57 +0800
Message-Id: <20240322092600.1198921-4-max.chou@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240322092600.1198921-1-max.chou@sifive.com>
References: <20240322092600.1198921-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a33;
 envelope-from=max.chou@sifive.com; helo=mail-vk1-xa33.google.com
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

The opfv_narrow_check needs to check the single width float operator by
require_rvf.

Signed-off-by: Max Chou <max.chou@sifive.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 6cb9bc9fde8..19059fea5f7 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2817,6 +2817,7 @@ static bool opffv_narrow_check(DisasContext *s, arg_rmr *a)
 static bool opffv_rod_narrow_check(DisasContext *s, arg_rmr *a)
 {
     return opfv_narrow_check(s, a) &&
+           require_rvf(s) &&
            require_scale_rvf(s) &&
            (s->sew != MO_8);
 }
-- 
2.34.1


