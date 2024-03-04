Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B553BC5478C
	for <qemu-riscv@archiver.kernel.org>; Mon,  4 Mar 2024 19:14:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rhDl0-0003Cb-2j; Mon, 04 Mar 2024 14:13:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rhDkw-0003Aq-Se
 for qemu-riscv@nongnu.org; Mon, 04 Mar 2024 14:13:47 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rhDku-0001bz-Er
 for qemu-riscv@nongnu.org; Mon, 04 Mar 2024 14:13:46 -0500
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-33e1878e357so2300491f8f.3
 for <qemu-riscv@nongnu.org>; Mon, 04 Mar 2024 11:13:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709579623; x=1710184423; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RFv1Gg6gA8Qr+9Dbaf2GkmDesAIrFACbf0XWoLRsE8I=;
 b=J4cn3dx6fZAbWYckMf16E2GYMTcGuvzP74DVuBmGGpl3kfefi4IC0EDAOt5hgk4dxh
 5I/o9G2zQP2KK6a/ws1Yu/LjVmYIni+XTA50XzqWaoaFA35u9Eht95PahPbRLjMwJ+fm
 1fIO0U3LXvUwyDKeR5CibE4yV3WdB5ReDYyP+CGpAXBp2SCGX7vhqtQ97W+jrTFAvVyj
 sX8DbK1vwAgEXw6LL5HIC1j51izGeGotmhkj+eUCi2yfgHH4p4GpbBcS3OKy0ovhlDWv
 zwr5uhcUspefzqEPtLxTKUloIHuBvU6r2NZvcLiHSyyilkxSoGIGg2cgvDwNHjaxU7Ye
 xBrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709579623; x=1710184423;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RFv1Gg6gA8Qr+9Dbaf2GkmDesAIrFACbf0XWoLRsE8I=;
 b=Ui82nl3V6jrbqdOhv991Pl6F/cxoHLfCL7L/YPRHxgregKvenhYkAFtNBv2thXl+TV
 R04JUzpGovxIbt7FdE/0zmXFwEiW9FIEhpNRwyOLn9f0yOzGjPOM1vKbH2UO1li5IJMp
 ee1uWFYShdETH7dl7GwPzBR42q1gQzW0o0mqkxw3wS5f+8EIQL3iylhbtY8KRJqf27Kg
 DvUhl9SPYxM4JH9RxNuNbr86JWmroau8bx5QOoNcuGeAzT4PxTr3ikXJJa7oUSnylS2R
 jQZLet5f1jN2gdTEz6G+CmSInmSYflEJMG8LWdHAgFLe5n20nCqg4FnqI3UqD7OpsjhE
 MDtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrgNVqIQZZDlYMTtUh+PP8Jw6/y8nBHmGabc3prz943uwr/a2eQZwounJsICI8k3BoB645kl0GHkicpZJLtw7AbKmYfgA=
X-Gm-Message-State: AOJu0Yziatp1ZpX3OCN845psUnXwrfNa9tSimNij6/252iejBqlnayUT
 0YSBFBDsGpJyzjL8gvOZglPWcnIdKMWGBXmw2P0ac7m2bbUulF2KLPdJdNj9tnw=
X-Google-Smtp-Source: AGHT+IEXzN5mE96WQlQwTYzjKo/vAf4kKYmUWPHJym8ktnTOijgEa0mcI4op1ZDJXBwECVSykzHA7Q==
X-Received: by 2002:adf:9dc3:0:b0:33e:3ec2:a22f with SMTP id
 q3-20020adf9dc3000000b0033e3ec2a22fmr2047866wre.42.1709579623041; 
 Mon, 04 Mar 2024 11:13:43 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 bw1-20020a0560001f8100b0033d6bc17d0esm13241010wrb.74.2024.03.04.11.13.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 11:13:38 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 2382D5F754;
 Mon,  4 Mar 2024 19:13:37 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 0/4 for 9.0] Clean-up disassembler handling for plugins
Date: Mon,  4 Mar 2024 19:13:33 +0000
Message-Id: <20240304191337.3101411-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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

I was overly optimistic with my last RFC that HPPA was the only
affected architecture by this issue. I've introduced a new flag in
disassemble_info and fixed up those arches that include raw bytes by
default.

It would be nice to get this in for 9.0

Alex.

Alex Bennée (4):
  disas: introduce no_raw_bytes
  disas/hppa: honour no_raw_bytes
  target/loongarch: honour no_raw_bytes when disassembling
  target/riscv: honour no_raw_bytes when disassembling

 include/disas/dis-asm.h  |  7 +++++++
 disas/disas.c            |  1 +
 disas/hppa.c             |  8 +++++---
 disas/riscv.c            | 28 +++++++++++++++-------------
 target/loongarch/disas.c | 13 +++++++++----
 5 files changed, 37 insertions(+), 20 deletions(-)

-- 
2.39.2


