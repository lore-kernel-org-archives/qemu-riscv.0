Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F90BC7EE23
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 11:12:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q8fRm-0001gz-GR; Mon, 12 Jun 2023 07:10:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1q8fRf-0001d9-1Q
 for qemu-riscv@nongnu.org; Mon, 12 Jun 2023 07:10:48 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1q8fRd-0002Ml-DH
 for qemu-riscv@nongnu.org; Mon, 12 Jun 2023 07:10:46 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5147dce372eso6283045a12.0
 for <qemu-riscv@nongnu.org>; Mon, 12 Jun 2023 04:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull.eu; s=google; t=1686568243; x=1689160243;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0zgNWA5Q0Kl9DZsF6umj5xs+kEU0/rrvuCkR9VqJ004=;
 b=dtlc9drGbzbD4tm/3k0NPJIr3f2VFxgL+JbQTpfgZU3aooH7vF8jud9218Bhda7kkl
 WIetSC0fnkThqwTc7ZTs71cfNSYx0fNv/EjQWKdCY2taTZPBH+KnHI0TC2qT7vJRjaeX
 cf47lEsopV3n+PD4IhJmnE/DZo5tPHcYRHvCLWKkXpZmNpIMR9DdMqXj0OXjf7vbKXdv
 Gx9l970qt6lMH/ljGin2eRE5doF92YputbKtpIbhPgw+YjaVYNoLHTRxbG/MOrGb/3W/
 6wmHZKZ2ipfMDnIrRZipweND8yrVNCjLEIz4RJWDMVO4eSyPDZvXd4NSyV6deQcK+ohB
 GqPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686568243; x=1689160243;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0zgNWA5Q0Kl9DZsF6umj5xs+kEU0/rrvuCkR9VqJ004=;
 b=OSkUrFyx/Gnv7/jA4872ceoBkW1XqquTgN+94QzWDc97U2BoWfoZfnMl0iQS5ctkeO
 CS1OvymTmftsBHS8kZA2KNu6sJASmu5XeUYjUctrfR2mmuXw8OKkz8ecByR/lvy6geDo
 bTCQZ+pBY6ZU41fsKYoqnz3rVNCi5O4KePjzi40OAi8jWvNlkFF7BBwvlTrVeadPoww/
 u9dGwszrl4IVO0u+6nS87rDEzoqzxJwQGZkuTuGcQgPt92yE0F6JcH+U3tpLDh287oCJ
 hATodKNrdeI+9Wz1CPwLpTlaffm2GgIUGRlGS5w7NyAWKvxHlRzTMbWV3tcjm2zKcKWR
 I/cA==
X-Gm-Message-State: AC+VfDxhTq15OZpbPWD4nfUfm+PKP/XP9chs+fCoF/N3hQqORNDugiHU
 EgXPcMoMuC62AiFTKkTCW4BgWU+a/ToUllQ6diw=
X-Google-Smtp-Source: ACHHUZ5p2rICPyMI6Ly79mEa5Ff6u9WGrv6lq24G5ML2MvIZMkoQx/RSvr+Z/KmGJbPA254WqVM/wg==
X-Received: by 2002:a17:907:934b:b0:966:b4b:eb0 with SMTP id
 bv11-20020a170907934b00b009660b4b0eb0mr10106652ejc.30.1686568243510; 
 Mon, 12 Jun 2023 04:10:43 -0700 (PDT)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 w23-20020a1709064a1700b00978723f594bsm5000948eju.101.2023.06.12.04.10.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 04:10:43 -0700 (PDT)
From: Christoph Muellner <christoph.muellner@vrull.eu>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>,
 Alistair Francis <Alistair.Francis@wdc.com>
Subject: [PATCH v2 4/8] disas/riscv: Make rv_op_illegal a shared enum value
Date: Mon, 12 Jun 2023 13:10:30 +0200
Message-Id: <20230612111034.3955227-5-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230612111034.3955227-1-christoph.muellner@vrull.eu>
References: <20230612111034.3955227-1-christoph.muellner@vrull.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-ed1-x530.google.com
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

From: Christoph Müllner <christoph.muellner@vrull.eu>

The enum value 'rv_op_illegal' does not represent an
instruction, but is a catch-all value in case we have
no match in the decoder. Let's make the value a shared
one, so that other compile units can reuse it.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
---
 disas/riscv.c | 2 +-
 disas/riscv.h | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index 4a55348267..b6ced2a26a 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -23,7 +23,7 @@
 #include "disas/riscv.h"
 
 typedef enum {
-    rv_op_illegal = 0,
+    /* 0 is reserved for rv_op_illegal. */
     rv_op_lui = 1,
     rv_op_auipc = 2,
     rv_op_jal = 3,
diff --git a/disas/riscv.h b/disas/riscv.h
index 9288255915..debbe69239 100644
--- a/disas/riscv.h
+++ b/disas/riscv.h
@@ -191,6 +191,10 @@ typedef struct {
     const rvc_constraint *constraints;
 } rv_comp_data;
 
+enum {
+    rv_op_illegal = 0
+};
+
 enum {
     rvcd_imm_nz = 0x1
 };
-- 
2.40.1


