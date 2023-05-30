Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB165C7EE23
	for <qemu-riscv@archiver.kernel.org>; Tue, 30 May 2023 13:23:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q3zGI-0002ND-AC; Tue, 30 May 2023 09:19:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1q3zFd-0001zX-HH
 for qemu-riscv@nongnu.org; Tue, 30 May 2023 09:19:02 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1q3zFa-0006sU-BH
 for qemu-riscv@nongnu.org; Tue, 30 May 2023 09:19:01 -0400
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-96fe88cd2fcso791243966b.1
 for <qemu-riscv@nongnu.org>; Tue, 30 May 2023 06:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull.eu; s=google; t=1685452735; x=1688044735;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uMqno0siykPsS3ZNDkSpUapOggK2PTxFDdGkbme8bUM=;
 b=c8+HMQP5Bj2WCCnmRERnLHO5xuREls8b3MiJCmy9ib4dc18XyGlxvOmhxwr9phDytO
 QFWYc8j7PkiGuYnXE/6y4PA3rpZeWWB76hs2Zwa3Wg7u7H1UR3S/Ue+pLCd7jMY7nu1U
 9ZSaEDB7crfzQY+hjaBWhC28Fl4kWhP9kFnWkOOnIjONSTQ0oG1oH5RqfR+tLjvdJY9Q
 e7qjNNGgLTkDROUMHPEN1K3aTfUTziUVfkYVQH+Qv/JwKzDIGfEytMW0al9wKYKcx8I2
 tSEVqgGReChwa16aiTrcQFi5j/o6yTO4gFLIc7iw28MKGHvbBNuyQX45t5xJkB2cAazy
 covA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685452735; x=1688044735;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uMqno0siykPsS3ZNDkSpUapOggK2PTxFDdGkbme8bUM=;
 b=jtUvVecAH1RM0u7h37gcdPGmanxMNG9m+ADB/8m8i4EvKFkqGm4328xyU8B/r9QcTH
 t2Vip2w0v0Hckqr0tb+otFDOxSXOzDmP4ZRJMqPctVUdhHsVvSuVkrQcFJVT9VM6ePI/
 nfjATL/7SyPBE3H8DFPZSL13U4dXWh5XCURLew+h3fAdGp2GwQsoCx7AZFpb1VJzfIhc
 lVXfzrCGesDTG2yKF4/it8PDsyPdb656GB6nxYQGi3RKGe3/vWVX6Cop4xhh9/aOUdFo
 p52u1BABmkAitrwcJfmypMrXFTR+5wmhyQgEKGqTjkpWjCurrxTkYNoqwUi1fP6RD93J
 Eb/A==
X-Gm-Message-State: AC+VfDzMLY5gZk5tqQDbl90sbQk12985q88fbZHhr90GFoTAlLWuoNEj
 jSPU5WmF40oiQb0007hquLw1ZBjaNooSqtqiGis=
X-Google-Smtp-Source: ACHHUZ58Ss1TseMMLkwOhpyNwWOTOvoX5Tn8nMQ/cLwTSMuqBJL8F3HVg7EhhpgvTY6lz6DSE4f4qw==
X-Received: by 2002:a17:907:7da4:b0:969:9fd0:7cee with SMTP id
 oz36-20020a1709077da400b009699fd07ceemr2108860ejc.10.1685452734790; 
 Tue, 30 May 2023 06:18:54 -0700 (PDT)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 le8-20020a170907170800b0096f803afbe3sm7376156ejc.66.2023.05.30.06.18.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 May 2023 06:18:54 -0700 (PDT)
From: Christoph Muellner <christoph.muellner@vrull.eu>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>
Cc: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 6/9] target/riscv/cpu: Share RISCVCPUConfig with disassembler
Date: Tue, 30 May 2023 15:18:40 +0200
Message-Id: <20230530131843.1186637-7-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230530131843.1186637-1-christoph.muellner@vrull.eu>
References: <20230530131843.1186637-1-christoph.muellner@vrull.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-ej1-x62d.google.com
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

The disassembler needs the available extensions in order
to properly decode instructions in case of overlapping
encodings (e.g. for vendor extensions).

Let's use the field 'disassemble_info::private_data' to store
our RISCVCPUConfig pointer.

Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
---
 target/riscv/cpu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 5b7818dbd1..6f0cd9a0bb 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -819,6 +819,9 @@ static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
 {
     RISCVCPU *cpu = RISCV_CPU(s);
     CPURISCVState *env = &cpu->env;
+    RISCVCPUConfig *cfg = &cpu->cfg;
+
+    info->private_data = cfg;
 
     switch (env->xl) {
     case MXL_RV32:
-- 
2.40.1


