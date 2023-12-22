Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B91C2C46CD8
	for <qemu-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 12:23:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rGeY9-0001UF-JV; Fri, 22 Dec 2023 07:22:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rGeY8-0001Tu-9o
 for qemu-riscv@nongnu.org; Fri, 22 Dec 2023 07:22:44 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rGeY6-0005kS-HC
 for qemu-riscv@nongnu.org; Fri, 22 Dec 2023 07:22:44 -0500
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-6d532e4f6d6so1136616b3a.2
 for <qemu-riscv@nongnu.org>; Fri, 22 Dec 2023 04:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1703247761; x=1703852561; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yy17GAX+dhVN3LfZ5BcAmjluYdS7Pglp6Hw9dnl9U8E=;
 b=T+3Pw78t9x/4aUkk3q25/egSVs7HROs4gQaUp5hxVaaIm9p81q+bpTEUBR2E/xsWUT
 LQC4xQkr8Mwxun7JNjuRyptp9puuN1jRalS2XeQPFkwZ9d5I43BaNYGQPxBKu4ohW7bp
 GScbjEM/S7jfn7s0PmndcznTN1N9ryrqWtiwxaom/Xtg/DYtX65Xc71myXmXHh5hmmV7
 G25UgsYlt+2crCNE6fyAzMEjVjGDtclvGVOraaEPk4rY9dWjVBiLHXPOdVSN5xpS7kmk
 fXDS3f0ylapECcRCtA2Vc6AtxKaz1pWSjPxtifLjxmYveNDvTff3g+Y07hkKNF4mDumM
 G0Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703247761; x=1703852561;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yy17GAX+dhVN3LfZ5BcAmjluYdS7Pglp6Hw9dnl9U8E=;
 b=Jzhgov6C66yYfMm+bwdhRpkO/0ksRDKmWRlKRfU0Ub6arVdn0rqbFooDBnfGFc4Osx
 cVitWsXnRuwTwlSsRkg/KAAUblwXgDGj+w0ZPQScX8PMCLPfamb4Y7axyyXtq3WT4jZZ
 4hfVBpWfqKPrKjoBybtk8jZVUPq4iFsKoZCFEwxSIF3rgGvujShaQY6ssegVkhJMnWJD
 Q4OlD8j0p4kd0QTrdsyznGC6XUNwr3nwVSlHEto9dWMhDkGcactOj1cDwegQmnLv/XUG
 Q0WF5tYv6wT3pv30XzmV4AsLjo3tJsX6JmOET40r3B7QOP9dprt63leFrkH+FblhAIjq
 5wlw==
X-Gm-Message-State: AOJu0YwOjXnHijnDvm65BtuqpzBxhAnUWg8IleQkewpsvqC1oGCqpZS9
 SaJJxFSiTOZ9C1QDxbfdYMNBtKwtlJO01Q==
X-Google-Smtp-Source: AGHT+IG6TbqijRh1w5fiOyJXi+e5d8IXFsCYitNUZ6NGdi2UI9984BFIiE8In5lRI8vMaprWwOvIGw==
X-Received: by 2002:aa7:8045:0:b0:6d9:8b95:9b52 with SMTP id
 y5-20020aa78045000000b006d98b959b52mr405283pfm.55.1703247760790; 
 Fri, 22 Dec 2023 04:22:40 -0800 (PST)
Received: from grind.dc1.ventanamicro.com (201-69-66-51.dial-up.telesp.net.br.
 [201.69.66.51]) by smtp.gmail.com with ESMTPSA id
 g14-20020aa7874e000000b006ce7ad8c14esm3274901pfo.164.2023.12.22.04.22.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 04:22:40 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 00/16] target/riscv: deprecate riscv_cpu_options[]
Date: Fri, 22 Dec 2023 09:22:19 -0300
Message-ID: <20231222122235.545235-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x432.google.com
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

Hi,

This new version fixes all instances of 'const PropertyInfo' added,
changing it to 'static const PropertyInfo', like suggested by Richard in
v1.

Patches based on Alistair's riscv-to-apply.next. Series is also found
here:

https://gitlab.com/danielhb/qemu/-/tree/fix_cpu_opts_v2

Changes from v1:
- changed 'const PropertyInfo' to 'static const PropertyInfo' in all
  relevant patches.
- v1 link: https://lore.kernel.org/qemu-riscv/20231221175137.497379-1-dbarboza@ventanamicro.com/

Daniel Henrique Barboza (16):
  target/riscv/cpu_cfg.h: remove user_spec and bext_spec
  target/riscv: move 'pmu-mask' and 'pmu-num' to riscv_cpu_properties[]
  target/riscv: make riscv_cpu_is_generic() public
  target/riscv: move 'mmu' to riscv_cpu_properties[]
  target/riscv: move 'pmp' to riscv_cpu_properties[]
  target/riscv: rework 'priv_spec'
  target/riscv: rework 'vext_spec'
  target/riscv: move 'vlen' to riscv_cpu_properties[]
  target/riscv: move 'elen' to riscv_cpu_properties[]
  target/riscv: create finalize_features() for KVM
  target/riscv: move 'cbom_blocksize' to riscv_cpu_properties[]
  target/riscv: move 'cboz_blocksize' to riscv_cpu_properties[]
  target/riscv: remove riscv_cpu_options[]
  target/riscv/cpu.c: move 'mvendorid' to riscv_cpu_properties[]
  target/riscv/cpu.c: move 'mimpid' to riscv_cpu_properties[]
  target/riscv/cpu.c: move 'marchid' to riscv_cpu_properties[]

 target/riscv/cpu.c           | 584 +++++++++++++++++++++++++++++------
 target/riscv/cpu.h           |   7 +-
 target/riscv/cpu_cfg.h       |   4 -
 target/riscv/kvm/kvm-cpu.c   |  94 +++---
 target/riscv/kvm/kvm_riscv.h |   1 +
 target/riscv/tcg/tcg-cpu.c   |  63 ----
 6 files changed, 561 insertions(+), 192 deletions(-)

-- 
2.43.0


