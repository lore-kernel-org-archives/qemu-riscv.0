Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56A2FC624A4
	for <qemu-riscv@archiver.kernel.org>; Thu,  3 Sep 2026 17:00:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x2AnY-0000PX-Ap; Thu, 03 Sep 2026 13:00:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1x2AnX-0000P0-8e
 for qemu-riscv@nongnu.org; Thu, 03 Sep 2026 13:00:23 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1x2AnV-0002R0-3p
 for qemu-riscv@nongnu.org; Thu, 03 Sep 2026 13:00:23 -0400
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-cc147d86bebso65024a12.0
 for <qemu-riscv@nongnu.org>; Thu, 03 Sep 2026 10:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1788454818; x=1789059618; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=xMzA1Edr4/9AcwAAKxC0Ug+VONOQc457rjo8K3c+xXg=;
 b=hvbMfTSGQaAbY6d8/40j1+oPQJwtIQx3vGVcgHa6yH3hIvckZGYz1/3bieIpx7Ki98
 Uu29h1P9YYoQAtCG2kX77BcGXuMzoBgYQgRqSPlIVuPHGMVcc0fjahQlpC9FSQ3vT3Dz
 zqah4hWPPKBBju16WK6CivvLj73bJdoDJrhcc9FjD27E6DCuBiiVLcnPyWyLXucY3F3h
 9sB/osyNDCoxB0WQ63wOy7EI0bQApi4WswnzL7iyylgaxZIM5bZj67wiHxKUcATxLNya
 Vh2Q9rn9XLm5qqXRnPgHIILm/Cs+REc52nvV2fzrQN32dbhwOuhEqtK/OdtrRVPrK1+/
 59Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788454818; x=1789059618;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=xMzA1Edr4/9AcwAAKxC0Ug+VONOQc457rjo8K3c+xXg=;
 b=hiCm30ub+nvVfInQPUcsiVj39FCD6Juo1NPnkl6/rVhhjRBXZW9kKGHHyQdMtQVKoz
 3X/05JE4705SZXHEsNWw53E6fX5S/tCTE2JE5H0XYWJAZXy8KZXCPMjzHar9WIZ+OZ6z
 JYRFgk2jZhudck4Q9YjRYGKTKDaswnMWyytn+MMQZZC+d0qUCh3CyhJidffuGZT28jeP
 ctpseDD6PRKP2G+3qrPCh6KR3u5zib3WGCT0cmrF7cdbefBHcSHSl6x2Q+SPVEbxsXY6
 bxoXFXGCnPQgJ54sFtU8q2MMbq+P6UFA9z2VvZFyFlGo7ShF6tAvnXwdvkljaRKJCF7k
 0mCQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBypCVzcsDXkM2RKY10+2sRe9fguupWz2cyhzygYN6XbGID2HoywgFmv0FnIGeSzhnAmmep5mCVWsatF@nongnu.org
X-Gm-Message-State: AFuF++l724hVwAgujnC4ItWC9OmWuUYOXEgdIrlGQCyyXtQF7fQGua5j
 YuMRSILOeRMxfSAarTbIzCcCz4HFWcyHtnfHdTPA9KOki94NLIaA6JQnHlqBtSWTA4g=
X-Gm-Gg: AYBFou1DjUT5k8zULj0+HmJaXrIUHJ9ELdgwlaTwNV8twZlHOVOjqXYAZmPdoERiq5c
 HxOefu5LZtUK9BAJaxkp3yuGPfDfq8nXEZ7O9EaiHUxkhSRAPZZKpChpA1H+Ld/kfPYLS7ChRrK
 eVgfGDuW7pcEBBvr2hb4NuKT5s4A7tJp8ZIRZSkakiFnKGz2fQAWZp6sqNW41udEw7eNv6MeWTH
 mjqYNTBX89kvLRn7C3TFs9rYz9+HqnbqC8LkCFDWsFHWA47lIVEeAybetuP5/FbY5MYRXFuZqEK
 0LIGOd2rQyTktr56TeEpIB5ETYT7zTtkKRGAh9YpljcMwvA/iu9QFBAvHXAVquUOLaUpJqtPpDC
 m2zCs4jsBrPFR1Yjz3EWy7BcaXAE5YVpvYtgU5dhquI2PZHoOORob28Y15mCQMmfmKibplQcPUn
 yr/pTIb6OfW4O3wEZPHT9rPBp2kKbKWWSQij3wrYmBGKXjSwMgUiYWn1NMtt4Eh1zaXKZFiOAKF
 H7obD26HbYwWMpJBhdhvSrbN09pFpuRZvkTZAb62phrjjwPjZPan5cW9Rb+thA=
X-Received: by 2002:a17:90a:c106:b0:398:9bd3:d6d6 with SMTP id
 98e67ed59e1d1-39b13324513mr3809123a91.16.1788454817550; 
 Thu, 03 Sep 2026 10:00:17 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-39b087b59a0sm6592159a91.17.2026.09.03.10.00.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2026 10:00:17 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Max Chou <max.chou@sifive.com>
Subject: [PATCH] tcg/riscv64: Set vtype before whole-register vector moves
Date: Fri,  4 Sep 2026 01:00:11 +0800
Message-ID: <20260903170011.3627720-1-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=max.chou@sifive.com; helo=mail-pg1-x531.google.com
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

According to the RISC-V unpriviledge spec,
  "vset{i}vl{i} and whole register loads and stores do not depend upon
   vtype."
The whole-register vector move instructions reuqire legal vtype that
trap when VILL is set.

The tcg_out_mov in tcg/riscv64 missed the vtype setup before emitting the
OPC_VMVNR_V.

Fixes: d4be6ee1111 ("tcg/riscv: Implement vector mov/dup{m/i}")
Signed-off-by: Max Chou <max.chou@sifive.com>
---
 tcg/riscv64/tcg-target.c.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tcg/riscv64/tcg-target.c.inc b/tcg/riscv64/tcg-target.c.inc
index 2ce9d47a633..fbfb4c44470 100644
--- a/tcg/riscv64/tcg-target.c.inc
+++ b/tcg/riscv64/tcg-target.c.inc
@@ -778,6 +778,8 @@ static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg)
         {
             int lmul = type - riscv_lg2_vlenb;
             int nf = 1 << MAX(lmul, 0);
+
+            set_vtype_len(s, type);
             tcg_out_opc_vi(s, OPC_VMVNR_V, ret, arg, nf - 1);
         }
         break;
-- 
2.43.0


