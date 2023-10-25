Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49CC9C0032E
	for <qemu-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 15:17:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qvfbD-0005n7-8R; Wed, 25 Oct 2023 11:15:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qvfbA-0005kU-2H
 for qemu-riscv@nongnu.org; Wed, 25 Oct 2023 11:15:08 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qvfb8-0003su-Bf
 for qemu-riscv@nongnu.org; Wed, 25 Oct 2023 11:15:07 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-6bd96cfb99cso4827720b3a.2
 for <qemu-riscv@nongnu.org>; Wed, 25 Oct 2023 08:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1698246903; x=1698851703; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EQxS/JwxHLdYWpzHJADSbmar8UuUNSwycfcLuca+ygU=;
 b=kFCqCkmtn891jpho1ygFtxrCWZROp/b8sg3rz5tg2qLinFt0kZxgvaB8d/rdfJOnlQ
 5QZ1sPm4ciJ8Y8bi9foJSwo0PXUf0eiA9wVCh23LaNfOq/6f0jZ8r9ZSnvouFMJ+qLuM
 gKuTMoce7cdTPQfjVXe6tCAR22O68CZ9bUpxuh9pcgy+As9CB0VAlY6ohvw9b7kGFUj5
 T0N9QJicN4Qlc8bR/Y3xYrsGuPyWHjTdA/prCll+Wnb/eqJ1hKl+EZArp1ln7Hgznpnb
 TCYWDyFBMUaE09XSr4YGR4elWU4nKKZBML+FW6m+rLFDGI3G4ncG+Hw5LwANthCbtZvE
 nx2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698246903; x=1698851703;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EQxS/JwxHLdYWpzHJADSbmar8UuUNSwycfcLuca+ygU=;
 b=kowLzF05ABQx+EKUsogIMOMko5m3xjT6kl0MRu3WnMh38J67me0IPSjGUJobbT1zXK
 vgKo+wzuxXvrmw16DhR2wsZpdbu7HDNQ0DG71SRZr/gEV7HoI4U9NjONAXrQ7D/4iL7u
 mAmGYVsOsIa1LWKfDo4UiXqHd5BWBs5xyIj8pf+CU0JYohHFaEOWm7NK5bb6quzsUO20
 a8Fua3/PAiZ2KZWNdgzaphkTBTglBGosplHHd80PE9lyUU1NYZjJMYfLwonwqU38lK7a
 AfQsFyE5DqRoCK+BcWrwDvsOhUD2ZL0V0Ua+IfNoQFpBosivKt0VIZzt9GT4aeppg/S1
 56OA==
X-Gm-Message-State: AOJu0Yy+bFqkvvOFcHfUEGkasasBMIRjWXrav/e/44OI8yCALAWAD+AG
 2iSsPZS1eNDy6uP9kg69uyZ11Q==
X-Google-Smtp-Source: AGHT+IGBuIN27VxHeU9Z9zDUK+BtKRu1HMiFK3chBLzki+R/08ewJv370qCikaV0MtxCBR8dFgTuqQ==
X-Received: by 2002:a05:6a20:e195:b0:16b:bbca:4a5d with SMTP id
 ks21-20020a056a20e19500b0016bbbca4a5dmr5448489pzb.62.1698246902874; 
 Wed, 25 Oct 2023 08:15:02 -0700 (PDT)
Received: from duncan.localdomain (125-228-20-175.hinet-ip.hinet.net.
 [125.228.20.175]) by smtp.gmail.com with ESMTPSA id
 w14-20020a63160e000000b005b8ebef9fa0sm2677807pgl.83.2023.10.25.08.15.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 08:15:02 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Max Chou <max.chou@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>
Subject: [PATCH 14/14] disas/riscv: Replace TABs with space
Date: Wed, 25 Oct 2023 23:13:38 +0800
Message-Id: <20231025151341.725477-15-max.chou@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231025151341.725477-1-max.chou@sifive.com>
References: <20231025151341.725477-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=max.chou@sifive.com; helo=mail-pf1-x433.google.com
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

Replaces TABs with spaces, making sure to have a consistent coding style
of 4 space indentations.

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 disas/riscv.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index 5bfa9390c45..128478a3a09 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -3136,12 +3136,12 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
                 }
                 break;
             case 89:
-		switch (((inst >> 12) & 0b111)) {
+                switch (((inst >> 12) & 0b111)) {
                 case 0: op = rv_op_fmvp_d_x; break;
                 }
                 break;
             case 91:
-		switch (((inst >> 12) & 0b111)) {
+                switch (((inst >> 12) & 0b111)) {
                 case 0: op = rv_op_fmvp_q_x; break;
                 }
                 break;
@@ -4578,7 +4578,7 @@ static void decode_inst_operands(rv_decode *dec, rv_isa isa)
         break;
     case rv_codec_zcmt_jt:
         dec->imm = operand_tbl_index(inst);
-	break;
+        break;
     case rv_codec_fli:
         dec->rd = operand_rd(inst);
         dec->imm = operand_rs1(inst);
-- 
2.34.1


