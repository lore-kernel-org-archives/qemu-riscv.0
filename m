Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B03C77B73
	for <qemu-riscv@archiver.kernel.org>; Tue, 30 May 2023 13:20:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q3zG9-0002E5-Tw; Tue, 30 May 2023 09:19:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1q3zFc-0001zT-Bg
 for qemu-riscv@nongnu.org; Tue, 30 May 2023 09:19:02 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1q3zFW-0006rW-6e
 for qemu-riscv@nongnu.org; Tue, 30 May 2023 09:18:57 -0400
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-969f90d71d4so640361066b.3
 for <qemu-riscv@nongnu.org>; Tue, 30 May 2023 06:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull.eu; s=google; t=1685452732; x=1688044732;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rNhs2cWe3WWDbIcCuDzbiMhM/8D8U5DOIPY2dNqFGL0=;
 b=aldwGaWj5Qwu3lwGO4b1Vjc4qgvbfHo78CEiqZf8qDF30XavvbqYqopv9sfKR5R6Wl
 WLgRr99hc/ep2vAgGLhwKJNqU68Qam6VCfbOuZ6Zgjn3OgU2PiJ8/MVODKht37pUwSsw
 4UULwct+P3C10nLAsFAbVlUfBp0Vq5Q+Xo1/ObnTz3ofgroIo4aeZ5+T8EfOl29L4wad
 cgRuMP/tedYgComguFo9VE/RPiqRkJigbPHqNIVrEDTw+2pgsgf9cc9H19IhWtxyFODE
 G1XchaTauUat+ZAIb0IzYqqsLWlLI+4S38PsdUcn9wUy1DujIFt3rPB3bFZmuvoZxYOY
 vWSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685452732; x=1688044732;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rNhs2cWe3WWDbIcCuDzbiMhM/8D8U5DOIPY2dNqFGL0=;
 b=h9YdTGpOqrnAPDHhi+Vgx/JlAbrQaZo9ot2Z8l/eKhTbuJhJgUpazxMWDiRTtS+ToD
 d2hmh4q8PkWxvFjLroMv0n08xHTjw0x5EFyp5K5Nv/Rb7/zW34X38nfYYLv97+io15kQ
 fFhugm9h4T7bi8GeGeyIbyC1z8zpdF7Ep8Yso1HJz/SSKOexddW5A6FbQCDcx8Mzzip9
 dWY3zkEHYfvZ+Rxwrv+vImbPrFYLcSz4bRK+ZvhwX9wjb7T3tMJSqB+JPY1xL4QLy9V4
 WcCzxThRDFMTTqpIiaZwVvSv/2KRjCd26e3u1h1ThV0T7Rpkwa1N31ayM+5ioW8/XEtn
 YNdQ==
X-Gm-Message-State: AC+VfDw57WpDEXbiWJvTFfg0E4yewbYKRLoJaIXKHtcCg1CCZevYCI8l
 fFKD33k1Qf8TbGxB4MTj7EXBr8P8o1Jyr3Lr9Uo=
X-Google-Smtp-Source: ACHHUZ69+43ynfUfl1dsyzPdOYAqUXA0spYS0AdeqXyXWS+bqveHCiv/r1bDQ6M9mVPkg8TbhEwA5Q==
X-Received: by 2002:a17:907:3e86:b0:95e:d3f5:3d47 with SMTP id
 hs6-20020a1709073e8600b0095ed3f53d47mr3026635ejc.48.1685452732330; 
 Tue, 30 May 2023 06:18:52 -0700 (PDT)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 le8-20020a170907170800b0096f803afbe3sm7376156ejc.66.2023.05.30.06.18.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 May 2023 06:18:51 -0700 (PDT)
From: Christoph Muellner <christoph.muellner@vrull.eu>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>
Cc: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>,
 Alistair Francis <Alistair.Francis@wdc.com>
Subject: [PATCH 4/9] disas/riscv: Make rv_op_illegal a shared enum value
Date: Tue, 30 May 2023 15:18:38 +0200
Message-Id: <20230530131843.1186637-5-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230530131843.1186637-1-christoph.muellner@vrull.eu>
References: <20230530131843.1186637-1-christoph.muellner@vrull.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-ej1-x634.google.com
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

From: Christoph Müllner <christoph.muellner@vrull.eu>

The enum value 'rv_op_illegal' does not represent an
instruction, but is a catch-all value in case we have
no match in the decoder. Let's make the value a shared
one, so that other compile units can reuse it.

Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
---
 disas/riscv.c | 2 +-
 disas/riscv.h | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index a062fb48cc..4cf477bc02 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -22,7 +22,7 @@
 #include "disas/riscv.h"
 
 typedef enum {
-    rv_op_illegal = 0,
+    /* 0 is reserved for rv_op_illegal. */
     rv_op_lui = 1,
     rv_op_auipc = 2,
     rv_op_jal = 3,
diff --git a/disas/riscv.h b/disas/riscv.h
index 0f34b71518..de2623e3cc 100644
--- a/disas/riscv.h
+++ b/disas/riscv.h
@@ -189,6 +189,10 @@ typedef struct {
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


