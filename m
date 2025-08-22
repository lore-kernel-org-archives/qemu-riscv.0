Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACFAFCA0EEB
	for <qemu-riscv@archiver.kernel.org>; Fri, 22 Aug 2025 15:02:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1upTGb-0001h3-F3; Fri, 22 Aug 2025 11:01:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1upTGZ-0001f4-2W
 for qemu-riscv@nongnu.org; Fri, 22 Aug 2025 11:01:19 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1upTGQ-0004zF-1d
 for qemu-riscv@nongnu.org; Fri, 22 Aug 2025 11:01:16 -0400
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-b49c622e598so388102a12.1
 for <qemu-riscv@nongnu.org>; Fri, 22 Aug 2025 08:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755874866; x=1756479666; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BScP7UxE/DcOjVr/rqH/MMGS4ER0irB8nkPoyURuy9k=;
 b=zL3wsVHBjzyofWBDSPycwkNRdL+gqqJ2IEb4yEt6TA+iLFkrct7rgkzEd34VkpR+MY
 kpjKuhcH6OIqynFJgVqACgQLVx0KW57rObwh/ABqA+eJOuyBwZLwEeSA1e/FuESFIhAq
 TQK8vf/mXwWL6fzTPrHfDcZtJw0wwAV3yzchQ52uCyGeXBlUE20ri537kyuo1XXb+lO9
 CXlGjAKV/A18xGeUqDYMnKWcZ+1roifWV54LY3g82avC5Pk8v5nY4996TQ6JVXiUZluZ
 jPHhV62BQQ5jiJoLr3xwwAwdbJXlrBCzDY1/zNPrE9yztZQG32yypTNuTmfCpGx1bOEs
 2PvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755874866; x=1756479666;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BScP7UxE/DcOjVr/rqH/MMGS4ER0irB8nkPoyURuy9k=;
 b=aCkF5fnvPXr63W3JImr+7uxmu5LeHyMvxJLNlvqmRjl6mXM9/UUIg84tadUXPUndNj
 18mifb9KtUkCT1VeLnnTtutofwJi7hPeuMCrRcri1iDQTL2OLueOacvqGfKJ9ggoWCJA
 rAVvOMx5InQEMZ+Vd0sZMBj3awpjcuNYgYDxYIuf5mH19WbyfHPoYQ70rKa/GUyu/+TJ
 72RPzG4zQOhW1U7bnrMIm30dUuNRoBcGusNcEqwGlx7i147iCmKzHLDtQ78fJH+sKTf8
 yvi2+5F61bWDB/JdHXP839BlNbgjPCPFN06LM5SLTymBzAdxqziJ4JY31TxiqEnF+5nA
 MO1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVxx9Rcm3WGiZe3hJuD1kTu/2J4TwMK65HOMn+3AhPXPIG1iYzGc7kOoTuDatFAb5+78v2WRTekmWu@nongnu.org
X-Gm-Message-State: AOJu0Yx+3PyU9gHfHDIgdaftNYBqci6dv+GRysrBcNUANM/1uIsaoMpG
 dL3qjiA1sv/pXjNLOXAFuoWloKms3jBFdeRCq+AK3UYD4FmA2Yo03LaxqTCUVd7+BM/a/kO/b0Y
 P9oI/O20kbA==
X-Gm-Gg: ASbGncuxl/CwTeRBeGqqL7Ol0fOO3rv3r1R19x2xhI1BJeWwaMXVHW5EtVgvmiFhOhJ
 iMGgXQFm5L1OCv8lMS4BIeg7WnFakWeZ2NsYNHjNrazUnUZSFxuk1NSNPpnBih8bNCMBEAVGV5C
 xc02GaR4QeHhaLG49H3u9OrdpbzPi51rBcFfgKX3QpGJekzSfbhhoPCLVtYaokB0AlvNWu1JFfA
 eRTsPPjFiimenH6QeklYa9uSBfL4zH8MMGTedDQ0Zb7UH1oZ9+1aux5G87VFpwCvWAE+JTmSefl
 qkKR9bwEJorIB19zUwlKYM9mmXqqbvVnL32Qw/7p2ANtxO7q2w5N8qwmxDmw2j+0Hv8P5c2cxVn
 6fT+RLuL+ZOK3PCa6VtnnaZpI2HU7CaE0YPhhqMwPjQc=
X-Google-Smtp-Source: AGHT+IGmxJMGxDy/SvLeF43ie/hot59tJhE2rbcfb6WXSbGYIMI34GZHff2zjx4DzMnajq1NyL2HfA==
X-Received: by 2002:a17:902:d502:b0:234:f580:a11 with SMTP id
 d9443c01a7336-2462ee78588mr53505785ad.19.1755874865295; 
 Fri, 22 Aug 2025 08:01:05 -0700 (PDT)
Received: from pc.taild8403c.ts.net ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed5406e4sm85929495ad.165.2025.08.22.08.01.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Aug 2025 08:01:04 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org, richard.henderson@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, philmd@linaro.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 00/12] single-binary: compile once semihosting
Date: Fri, 22 Aug 2025 08:00:46 -0700
Message-ID: <20250822150058.18692-1-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pg1-x52d.google.com
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

v4
--

- fix patch 9 commit message to s/uint64_t/vaddr (Phil)

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
  semihosting/arm-compat-semi: replace target_ulong with vaddr
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


