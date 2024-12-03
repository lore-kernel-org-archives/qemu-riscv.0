Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6044E74ACF
	for <qemu-riscv@archiver.kernel.org>; Tue,  3 Dec 2024 20:09:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tIZCM-0006UV-SO; Tue, 03 Dec 2024 15:08:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tIZCG-0006Nq-BW
 for qemu-riscv@nongnu.org; Tue, 03 Dec 2024 15:08:36 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tIZCE-0003DS-Qa
 for qemu-riscv@nongnu.org; Tue, 03 Dec 2024 15:08:36 -0500
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-385dfb168cbso2929702f8f.1
 for <qemu-riscv@nongnu.org>; Tue, 03 Dec 2024 12:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733256512; x=1733861312; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=k3ec28toM0ExcpIaS6qGzhnP7uN1HiA2sQ1YWBmAsU8=;
 b=fdcT3WYfHrFvNGHE7wFA0/8AqDdce/W+cHqCQIhT0weR5DsBc2kjUCHzRVZ5crms4b
 sPe60Sz6pUJ0vDzWsuSTy7NJQgre+0+wVekH0U9/FXVLzeVsWYwqaoff9CAbwvfcQDbQ
 ZEJCRPM8OaEtx17HcVDXabdub8JsDjicjx9il4GJWvPjun4QF5VCxmJkHRYXpvc/NY7U
 yw/N9ZJ+bR3d7OFlIBampvY3blVWdvhkTgZ1E3j2EdV6uZMmFeScNGQeiVIi9Rb956tV
 LomEGz08nV9VG3PUCJoeBm/uE4UFQejBkzmx+rGhrGG6cluMD7horPDx5XqCnY9ad/zY
 wLlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733256512; x=1733861312;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=k3ec28toM0ExcpIaS6qGzhnP7uN1HiA2sQ1YWBmAsU8=;
 b=sMW34zB3GMLfHRE55Qp4Aac7dvH1Noq+Cp5hDoN5+zA6vcI8pjXcBdj++0JThVdSnd
 aFn+tuP9rtifKDiitMY7VRRbNQNTTMv27+Z6MWxigwOYyygYN4vp7dNx0BiR5WqkaltI
 0Hx0sPNgTAuM+sPYiluLAUFcrOnBJTTij/iE+FyEdcTauYllPTzkOYTD9HJxN7AU8Az7
 CNN2m3nkZFFq6fTIpkSb62oyehDYa/fbGTxlsEtK95vF9lTesitPJfIiPei4dzchLUq5
 T+vnjxBvtQvvgbho8OAHcN0NMLD7OarUlU5zJ2jd6LJi+h940RpJaTjunEeo+JwYdNYg
 zuYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcOQzuBp1PTxRJj31zhEWWv4Mcsrhb9rfa2cu06GH55wH1yo2gFC2HIEx09t33miKpbB9bfZ7JCE2a@nongnu.org
X-Gm-Message-State: AOJu0YwXrfd5vUeOXWjVyeO0h7DIjSNP28ME0o7x5Z8NjYgK3HU+gjMO
 4WU+zL+oZCTY1vfHu47XOnoirucY7gL1/giLNVPnFOyXbmBXoeyvdcEwC1hZZ4k=
X-Gm-Gg: ASbGncvXhIIf9XDC75LL/ngAX41IHxP9S71eH25ecT7sFxIK1O9uRN7o0s5iVbUuA4d
 KRQQekYJdQjhIcqjTWEjKqESAWgH+/WJwyId8U4glM25kwp68Hsvc7ZhJLS4fnQUKmHP9xdQq+U
 2JzV5GZAHVyVu08to2GD2/WaD8AZTZ60bPdHdFJxP5X3vJgcChg4Ty4DnZ3eRbcZYEDf7+wSGvU
 BtllLz3mCGTsVvy98gkgf2vkVmv7BoYurZHgUcAtVvkG1Ih6vpXYkbypApjwgxOYCu8AIGWl0KR
 kw==
X-Google-Smtp-Source: AGHT+IHvgrG+Vxh80aESNK0fAoUiCqDs2x5KkfWQpFmbuQ13VFeS9UXuUUm3mkhFv7zgGZelF326cw==
X-Received: by 2002:a05:6000:490a:b0:385:f821:e97e with SMTP id
 ffacd0b85a97d-385fd3c5a6emr3479698f8f.9.1733256511602; 
 Tue, 03 Dec 2024 12:08:31 -0800 (PST)
Received: from localhost.localdomain ([176.187.209.146])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385e940fef3sm10043546f8f.42.2024.12.03.12.08.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 03 Dec 2024 12:08:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Bin Meng <bmeng.cn@gmail.com>,
 qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/2] target/riscv: Include missing headers in '*internals.h'
Date: Tue,  3 Dec 2024 21:08:26 +0100
Message-ID: <20241203200828.47311-1-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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

2 trivial RISC-V oriented patches extracted from a bigger
series which refactor include/exec/ headers.

Philippe Mathieu-Daudé (2):
  target/riscv: Include missing headers in 'vector_internals.h'
  target/riscv: Include missing headers in 'internals.h'

 target/riscv/internals.h        | 3 +++
 target/riscv/vector_internals.h | 1 +
 2 files changed, 4 insertions(+)

-- 
2.45.2


