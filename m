Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52549C87FD1
	for <qemu-riscv@archiver.kernel.org>; Mon,  4 Aug 2025 19:31:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uj0uQ-0001az-Uj; Mon, 04 Aug 2025 15:31:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uj06K-00012e-Va
 for qemu-riscv@nongnu.org; Mon, 04 Aug 2025 14:40:04 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uj06I-0000ra-LL
 for qemu-riscv@nongnu.org; Mon, 04 Aug 2025 14:40:00 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-76b77a97a04so2734353b3a.1
 for <qemu-riscv@nongnu.org>; Mon, 04 Aug 2025 11:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754332796; x=1754937596; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/YP7H+skmVEbiTBDchbdeF2EpV3qFqgl9BUJ7WkvewA=;
 b=cn3Ysu3bIOUP9ITJfz5JZJyBwJUKjLVAefKuKrf1++CBp7SLX1ssDAGnY981D7AWB0
 ao9/cjtsxs9krXmn6IINNxXEGv5Iq+pNBM7zUUjBj/BKWKl4cdOxV53EN6Ntpjvy0qxq
 JUkpER0+ShJuyiC5SP1pS0cptdCGCDsaYFY+u/IuZXcaCTjTDJfel1il6fH3GzwkDh+v
 Y9q84SybRBs/WNP5YJ4SZDtGGQasQCCKzmv+8hN8PO1ZP6hEq1ugYY19bBtKgYxHHl3s
 LQSpd0XjS0oxX+Hl3FkcExriaZ2MpgvLsXyvVgWl0iyJMdltbvLLSz00seXm2ExHrGji
 mJKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754332796; x=1754937596;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/YP7H+skmVEbiTBDchbdeF2EpV3qFqgl9BUJ7WkvewA=;
 b=HvoxW0S5r7IoA613itUQuO8qkhyKS9Tkw90YQxzwP1Qlg1Oj8E0APtNlDA5+tFpUaQ
 FOvyNgrA56GVbUpQwHRZp2V1HRoXJdjA88DBeIj7LQkHD7Wg/IqyuNQ0PJkCVOdSsCk9
 gp41pBG2ar/zKiCaH3WRW56Sa17JXDUgdjOnWG1JDNu/pQ8gfqPVrBsIkEHbam87gBGR
 mbB9iuC/hwabN+VXrL1tZEAiM62XG6g4Md+uDJuk938EOAVNYsb7xkrQ5XTf3cHjeqxx
 SCav24XDYpnqbGzdRIpAHJk9oqmog4yz+bRY0D7nQTEqrD38LgmNXGli4OPjeBDtqzRw
 G59w==
X-Gm-Message-State: AOJu0YxY+ltJp5q+/UqEiJxbDjCo9c96/lv6i2r/nvrofyGttanCaLPp
 XChHAeGsvR91aaDUm05ycQLaI3Rj9tSz+/s+q98g7p7fQcBomMCQgeNU+sYmLNaoflo=
X-Gm-Gg: ASbGncsYzCMLgRk6ggXvaFwjgUf/EY4H+xJDyAhgPPcYVGbFbp6rTSxgiGpSoHBv8q5
 AAF7LeE5RC4UtbGs6xX/ZoLdDcv73wIrjZkmUgn1XblSHOqDo873HFtYLl6P9tmmgZ53jqkN+Wr
 ZaJqLnKpch/tBJJpwuIbCfV6put1ZOnjxoBaFPKwTdw7q410ZoIYcm6VFa192RAG6l2V/c3j66G
 OOWrvfa4Syl7K6+ja00zqSESCshmtdj736If2d5/+awDAyj7aFfwlS2ZOmGslJQHz2G8PtzA7/R
 MjMsHySgg+yNmXZYd9I12w/yF9da9QkgTZuBpr/SAjI5eV639G2GrjsMbtKslYuBL+O8CF0rsTl
 BJestYr2Q/uPhh1KjRWKa9w==
X-Google-Smtp-Source: AGHT+IE9V5Ru91u8rQ7ca+11wT1UPMlrUkY4HZYosPbz4vMnLM626AX2Y/XVCXlVupbXYvRzG+b0eA==
X-Received: by 2002:a05:6a21:32a8:b0:240:af8:1784 with SMTP id
 adf61e73a8af0-2400af81b60mr6514471637.1.1754332796394; 
 Mon, 04 Aug 2025 11:39:56 -0700 (PDT)
Received: from pc.. ([38.41.223.211]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bd78875cesm9940171b3a.15.2025.08.04.11.39.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Aug 2025 11:39:56 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, philmd@linaro.org, Weiwei Li <liwei1518@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, richard.henderson@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 00/12] single-binary: compile once semihosting
Date: Mon,  4 Aug 2025 11:39:38 -0700
Message-ID: <20250804183950.3147154-1-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x436.google.com
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

This series compiles once semihosting files in system mode.
The most complicated file was semihosting/arm-compat-semi.c, which was carefully
cleaned in easy to understand steps.

v2
--

- use vaddr for syscalls.c/.h
- static qualifier for console_{in,out}_gf
- use vaddr for arm-compat-semi.c
- semihosting/arm-compat-semi: fix cast for common_semi_set_ret

v3
--

- keep common_semi_sys_exit_extended (Peter)

Pierrick Bouvier (12):
  semihosting/syscalls: compile once in system and per target for user
    mode
  semihosting/syscalls: replace uint64_t with vaddr where appropriate
  semihosting/guestfd: compile once for system/user
  semihosting/arm-compat-semi: change common_semi_sys_exit_extended
  target/riscv/common-semi-target: remove sizeof(target_ulong)
  target/{arm,riscv}/common-semi-target: eradicate target_ulong
  include/semihosting/common-semi: extract common_semi API
  semihosting/arm-compat-semi: eradicate sizeof(target_ulong)
  semihosting/arm-compat-semi: replace target_ulong with uint64_t
  semihosting/arm-compat-semi: eradicate target_long
  semihosting/arm-compat-semi: remove dependency on cpu.h
  semihosting/arm-compat-semi: compile once in system and per target for
    user mode

 include/semihosting/common-semi.h             |   6 +
 include/semihosting/guestfd.h                 |   7 --
 include/semihosting/semihost.h                |   2 +
 include/semihosting/syscalls.h                |  30 ++---
 semihosting/arm-compat-semi-stub.c            |  19 +++
 semihosting/arm-compat-semi.c                 |  65 ++++++++---
 semihosting/guestfd.c                         |  26 +----
 semihosting/syscalls.c                        | 109 +++++++++---------
 ...mon-semi-target.h => common-semi-target.c} |  22 ++--
 ...mon-semi-target.h => common-semi-target.c} |  27 +++--
 semihosting/meson.build                       |  18 +--
 target/arm/meson.build                        |   4 +
 target/riscv/meson.build                      |   4 +
 13 files changed, 190 insertions(+), 149 deletions(-)
 create mode 100644 semihosting/arm-compat-semi-stub.c
 rename target/arm/{common-semi-target.h => common-semi-target.c} (59%)
 rename target/riscv/{common-semi-target.h => common-semi-target.c} (53%)

-- 
2.47.2


