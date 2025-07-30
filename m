Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01C50C87FCC
	for <qemu-riscv@archiver.kernel.org>; Wed, 30 Jul 2025 22:07:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uhEwz-0003Am-HY; Wed, 30 Jul 2025 18:07:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhEwV-0001BG-Ew
 for qemu-riscv@nongnu.org; Wed, 30 Jul 2025 18:06:36 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhEwQ-0002Xm-J5
 for qemu-riscv@nongnu.org; Wed, 30 Jul 2025 18:06:32 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-23fd3fe0d81so3333795ad.3
 for <qemu-riscv@nongnu.org>; Wed, 30 Jul 2025 15:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753913188; x=1754517988; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0WbwXVx3CiOVjOejevvWPnbgeJdqRzpt3t9W8AIJyWs=;
 b=wlfJNDQYhtDUnScWwxM8gazBU2/U34BRgDuVmAaUG6ASnfECGOY+RBDu65xuLwpRTM
 G/fPWNQ60a3gyTECtYYKLJe8IQ6cxL9XmBCqKhRvTd9HF1FzQO5zehYbVogNU4UVFQvd
 O89xAOlu1BBniewYBIPuj6S8waJ/Zwzy3p8a0hXz8T7jGPgp0ikicYtktjQ20AGs3IT8
 PUWir6+zjFWSXbh5RGNrbEV4TvUeF/tQfb8ca4wvxlopkKliGtisRWlteY66Zjs2KmGt
 3yRqelny9UGXMnf3At8DmRHT0om4+BSjMIKsHuheFOpATCgWE9H82Ih0SbM1ghCQkj40
 RmNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753913188; x=1754517988;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0WbwXVx3CiOVjOejevvWPnbgeJdqRzpt3t9W8AIJyWs=;
 b=lNUKNPvSaeutD1sXMyjOdzPcGrrwLbM+EO3rtZ0d1zoBOkcz99oIAmjeOaRX+jqr10
 Xxv3rbkPmJKJFqS2+tj2keNKDyWWWeWvVaQFU0EC7gz7fTTwyAHv9hdE8BEbb9m+b9VD
 GfLfOvtUNwYusXFuv58Of5Kzpdt+1k2T8Td6+fZXvlPLhRM0tKc22B+Nhn7kBSV5vYbq
 3Av93JLTfjsW2gBMC0D2cXkOaqfDTV1GcBR7vR89+zjmZ7ARNujybsGvO4ug4TtgmLJ2
 j39h+W9MVipxlQY7UU0geEECV4VqibFTewiJaxA6RopcK8Sjg6HM98pXsmDFb0BAb24D
 eiHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2KMyDPCxjeU+tdwWzKaK5i6z8NbOsBIWRj0BlCnBMjZhEX9mqfN2WxlVTXFo2RxCIQzW3RZcQeJqY@nongnu.org
X-Gm-Message-State: AOJu0Ywp8du57jVxZ1kNAyv2ahvWmCA2HKT3xURNsoIHqKwBtCC6rzQL
 V64mIKYWecUjf0reAjp5Fx5BB73xqYafqnzxb7AvYVa9DqPJtAaObqtNc1f4WK1q6hE=
X-Gm-Gg: ASbGncuV+VpAsg19+EQVR+bX0S5hkjot2IfSBv7dV5Ukye1R2W8zwD00iHo2/R9IyyQ
 Lj5z7NQ8fCKeW7voPOvqOLD5Oy1nLOapziA94pP5xbsnS8sMCNiMiumVTCrCesfqpXwDN9+dwVG
 vWj3NTqho6RO6sKqbRhX0P45MED+5WgwLQ8cZwmvrqpakGOd6jJRjZCTXGy1aEh4GpYFYGj6YIg
 uZDd5ZDKARlKH9+LSqxuCVFoGihc6Rnk1Gz5fJ8DLNzwkQ5ywIVmTBZX8yktgxKExBWeG0xKqGt
 i1wtsOI0v4u01XxNUmLz9a6y7cT/OYOcoTJME8/SMjV+ANTI0svxgsbFcE8YE+hhnydN0G5gZ7e
 A3MjSN0bXNplgKSrP4N/HrA==
X-Google-Smtp-Source: AGHT+IG2A/hPR8oq7ogamFhySjNoFe7ef6rhWYhPlyzw7srxMnS5S5VHMySDSnN6puSDYv54N6HcWA==
X-Received: by 2002:a17:902:e5cd:b0:234:f580:9ed with SMTP id
 d9443c01a7336-24096ab7485mr74544545ad.21.1753913188006; 
 Wed, 30 Jul 2025 15:06:28 -0700 (PDT)
Received: from pc.. ([38.41.223.211]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e899d272sm981535ad.135.2025.07.30.15.06.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jul 2025 15:06:27 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, philmd@linaro.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, richard.henderson@linaro.org,
 qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 00/10] single-binary: compile once semihosting
Date: Wed, 30 Jul 2025 15:06:11 -0700
Message-ID: <20250730220621.1142496-1-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x62c.google.com
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

This series compiles once semihosting files in system mode.
The most complicated file was semihosting/arm-compat-semi.c, which was carefully
cleaned in easy to understand steps.

Pierrick Bouvier (10):
  semihosting/syscalls: compile once in system and per target for user
    mode
  semihosting/guestfd: compile once for system/user
  semihosting/arm-compat-semi: remove common_semi_sys_exit_extended
  target/{arm,riscv}/common-semi-target: eradicate target_ulong
  include/semihosting/common-semi: extract common_semi API
  semihosting/arm-compat-semi: eradicate sizeof(target_ulong)
  semihosting/arm-compat-semi: replace target_ulong with uint64_t
  semihosting/arm-compat-semi: replace target_long with int64_t
  semihosting/arm-compat-semi: remove dependency on cpu.h
  semihosting/arm-compat-semi: compile once in system and per target for
    user mode

 include/semihosting/common-semi.h             |  5 ++
 include/semihosting/guestfd.h                 |  7 --
 include/semihosting/semihost.h                |  2 +
 include/semihosting/syscalls.h                | 29 +++---
 semihosting/arm-compat-semi-stub.c            | 19 ++++
 semihosting/arm-compat-semi.c                 | 61 +++++++++----
 semihosting/guestfd.c                         | 26 ++----
 semihosting/syscalls.c                        | 89 +++++++++----------
 ...mon-semi-target.h => common-semi-target.c} | 23 ++---
 ...mon-semi-target.h => common-semi-target.c} | 22 ++---
 semihosting/meson.build                       | 18 ++--
 target/arm/meson.build                        |  4 +
 target/riscv/meson.build                      |  4 +
 13 files changed, 168 insertions(+), 141 deletions(-)
 create mode 100644 semihosting/arm-compat-semi-stub.c
 rename target/arm/{common-semi-target.h => common-semi-target.c} (58%)
 rename target/riscv/{common-semi-target.h => common-semi-target.c} (52%)

-- 
2.47.2


