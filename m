Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6B0CC02181
	for <qemu-riscv@archiver.kernel.org>; Sun, 26 Jan 2025 07:25:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tbwyR-00059U-G4; Sun, 26 Jan 2025 02:22:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonb@tenstorrent.com>)
 id 1tbwyH-00053X-8S
 for qemu-riscv@nongnu.org; Sun, 26 Jan 2025 02:22:17 -0500
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <antonb@tenstorrent.com>)
 id 1tbwyF-0004I9-E7
 for qemu-riscv@nongnu.org; Sun, 26 Jan 2025 02:22:16 -0500
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-2a8690dcb35so1139754fac.3
 for <qemu-riscv@nongnu.org>; Sat, 25 Jan 2025 23:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tenstorrent.com; s=google; t=1737876134; x=1738480934; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+smqj6hYDDDrzjm4GxtEQwSjZgHAIk2Z3L68pTCDUWg=;
 b=MzPbAK8aEGlGlrhnqJoxDimQdTUwvS3NEptFRdnUcsCBhZDRQxVvpZoJbVAnTCtUFA
 xa4HqQmsqN2Vxd2Sb2CO+l8mZb/O9Wqj3jsTxCqQmK7xTUIw29nxwtU03+YGGHob4Mlb
 GZdMSC5fdlnZPOZYTkSTF21CA5ITp+VebVmp/oqQ1KD+HE8r+iLbbNZX7S/4SWIG9eDk
 vdh/VbmhXmdE9Fo4zBXGvlsrjNr8FILLZMWwT5FkNOujKJoWlVDC5PYaSRRGw+INvPh0
 SXaTizmTXMOG+xQowxrxEqQrxAAvDSx3NaYKgE1hI4GiLu/HlwqlZdB6pmNrwEkpp2tU
 fVJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737876134; x=1738480934;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+smqj6hYDDDrzjm4GxtEQwSjZgHAIk2Z3L68pTCDUWg=;
 b=xN817xOlev35teAho12HLD9UiX1GW6czF40dEcPZ05Z1ah8kMSe47Belt+POs8EBin
 89aPswkeQKE67ZUMWEliQAD9LuC54sSbV1GH/gKtiP8QqPjrRxjdNG1hRdpqxkGurRLO
 VTWY/7cAuC+Pudo6QcdeSdH19fFep5LkFiBOkdshC+QofXBn9kRtAGuHM7+MviHtjc4z
 x2yBlMXIVg/UxMQmW6I/KPmhDjMUp6IZ/FM89e+IZfnetB0GCNA5XS5R51cIDAiyfW/r
 YhaymPgTn1UIvjR82/XEEVYhchpYp4ib92Tm5OYmS8LP9nDEh+0XSpqlfNcI1RUZYqjs
 ssnQ==
X-Gm-Message-State: AOJu0Yx0SVRFXVBOFpZUB0VQSIdsKa87aUbkxTRBYsomuSuXYMb44Hi/
 mlV4sYrDF+PPI+OLhfs8ZzlycVgvrIeKO77m6BgwDkSEwQybkhqeiarYtaOvSlZaKhJQVob+8H1
 d6aUqjw==
X-Gm-Gg: ASbGnctHbEbKnDpwSTYTf4rCt1oKaK0Un1snjg5B9Lpc9hiRK/rM5ZaQ0shMea0csea
 hc2NnOyhvAGmn2zkdi4hl/yzNjzNISAcb5Q6XtVyjjtbvrUEyDmE/oGpGEXPh2Ihk+rQmgmOXtN
 ZGpb4xPU0Lt/AG4+SroGGp3ym49yC3BsYm7UVUCzcIAFcQuJinEI7IsL8bW9H6ViAfgMmJvZzHW
 39KQIqaQzVsHccs8nBfyI6nNRdbNzdM4pNW5GOHGEN45xS5nBORFjYbFJewVVhiKbc6sKSfSLBF
 8PwjNzyS6tnCxpmPtS2N8k1iFoeBUMbkmrxc/Es=
X-Google-Smtp-Source: AGHT+IHr+XUaqBNZRwMPH8gM5DY/G1NCWelGpQolmMa5+SOYyiAtFM/3JK/XpixZSy9g6W2XJk4Paw==
X-Received: by 2002:a05:6870:6981:b0:29f:f1cc:12a5 with SMTP id
 586e51a60fabf-2b1c0c025c8mr21889251fac.31.1737876134110; 
 Sat, 25 Jan 2025 23:22:14 -0800 (PST)
Received: from ausc-rvsw-c-01-anton.tenstorrent.com ([38.104.49.66])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2b28f1d887csm1814281fac.29.2025.01.25.23.22.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jan 2025 23:22:13 -0800 (PST)
From: Anton Blanchard <antonb@tenstorrent.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Anton Blanchard <antonb@tenstorrent.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH 05/12] target/riscv: handle vslide1down.vx form mask and
 source overlap
Date: Sun, 26 Jan 2025 07:20:49 +0000
Message-Id: <20250126072056.4004912-6-antonb@tenstorrent.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250126072056.4004912-1-antonb@tenstorrent.com>
References: <20250126072056.4004912-1-antonb@tenstorrent.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=antonb@tenstorrent.com; helo=mail-oa1-x2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
index f5ba1c4280..a873536eea 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -609,6 +609,7 @@ static bool vext_check_slide(DisasContext *s, int vd, int vs2,
 {
     bool ret = require_align(vs2, s->lmul) &&
                require_align(vd, s->lmul) &&
+               require_vm(vm, vs2) &&
                require_vm(vm, vd);
     if (is_over) {
         ret &= (vd != vs2);
-- 
2.34.1


