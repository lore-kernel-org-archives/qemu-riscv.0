Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23A41CA0ECA
	for <qemu-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 13:25:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qg3Np-0002cG-QO; Tue, 12 Sep 2023 09:24:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qg3Nc-0002Xc-6h
 for qemu-riscv@nongnu.org; Tue, 12 Sep 2023 09:24:37 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qg3NY-0003Tu-4s
 for qemu-riscv@nongnu.org; Tue, 12 Sep 2023 09:24:34 -0400
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-6bd04558784so3709376a34.3
 for <qemu-riscv@nongnu.org>; Tue, 12 Sep 2023 06:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1694525070; x=1695129870; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=j94k47ahItJbf8qxlmTIrtDRqzP/zEHFhkf80A1QfNQ=;
 b=CQFsTZ15IsydszOtYFXz2aI4h4OOuwf/kMg+BDHB6j9uWd7QEqudY2T0kYQkJYWcW6
 UYNW3sipf/lkTwIzxqH/5Zg88kt5+oTERJqN8fogE05ZjpinDeJbnE1bFtoyPQhQjiCL
 6IQQ+6MWODBiLX+W8wETgkbfHtOELiSgKeYeVlSpPdacjiyxsB1l4shxyvldCtY3QQvc
 e7MClbR/YhGWK4Tqjwrvy7gsOgtJy0ODCBlCg0E2MGgj352IN6m7aihkx9OXEJ7Ag2hz
 JyUqwEgvOoh42s2voXsx7NFVYVHPDhhaJSF+lxRe8PDhT4Rn3iS+AEu6xFXQSemCKWyf
 LjjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694525070; x=1695129870;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=j94k47ahItJbf8qxlmTIrtDRqzP/zEHFhkf80A1QfNQ=;
 b=OyyEpNBgbGTq2z52f6DighR+qZepaAY8kt9nO/+yy5ZlIk0PSy0AKV0BNZvvAiGeKv
 OIGtCFlpUYoeQf/umuCG3pFgf0CRZ2H6qnbb52E2VySmvi4jdwECur3GQ7q7uSeOXiwG
 0TAfB2vLWHQRJptaVxusIDj1MLidkT58D9y6npC3mrcLkR8pGU2ZuNmkLZSNT+but4DF
 WD6W7p5l4r7GkALjnwmK0N9Jv1dhvyKLhcwflMZSbV1CkSPA7RNMUUioV+mv5knP1DqI
 fq5ksoheGZq/APt8zoRk+dS9BVPKXxQCEls1nhASUd13WxVdvK57g+oK5uV4xKVW/kY2
 BPaQ==
X-Gm-Message-State: AOJu0Yz8nVj2YW0GAPrnQaNRfAXFtRghqIwsKylCG/VP0RJg3OKK5u5v
 Ogi+iyxe2H3qTTV1o67h3Dp5VA==
X-Google-Smtp-Source: AGHT+IHPFzMvlE2oid6FZqjVc67DxRUo6i5bBit7Fcun1huf1Rqt3ehjk2OODNX2iTtmhXglalw9ag==
X-Received: by 2002:a05:6830:22dc:b0:6b7:5452:df79 with SMTP id
 q28-20020a05683022dc00b006b75452df79mr15374169otc.0.1694525070449; 
 Tue, 12 Sep 2023 06:24:30 -0700 (PDT)
Received: from grind.. ([177.9.182.82]) by smtp.gmail.com with ESMTPSA id
 p15-20020a0568301d4f00b006af9d8af435sm3991255oth.50.2023.09.12.06.24.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Sep 2023 06:24:30 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com, philmd@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v10 00/20] riscv: 'max' CPU, detect user choice in TCG
Date: Tue, 12 Sep 2023 10:24:03 -0300
Message-ID: <20230912132423.268494-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x332.google.com
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

Hi,

In this version we have a change in patch 3. It was causing a build
break with --enable-debug builds that weren't being detected by regular
gitlab CI but was detected when running the merge CI [1]. The problem is
reproducible by any risc-v --enable-debug build.

I ended up leaving kvm_riscv_cpu_add_kvm_properties implementation
inside cpu.c, since it can't be easily moved to kvm.c at this point,
while adding its function declaration in kvm_riscv.h since it's a KVM
only function. This is temporary, not a pattern we want to promote.
We'll move the function to kvm.c when splitting accelerators logic in
"riscv: split TCG/KVM accelerators from cpu.c", patch 08 in the current
version of that series [2].

Series rebased on top of master. Only patch 3 is missing acks.

Changes from v9:
- patch 3:
  - use #ifdef CONFIG_KVM instead of #ifndef CONFIG_USER_ONLY
  - helper renamed to kvm_riscv_cpu_add_kvm_properties
  - helper is declared in kvm_riscv.h 
- v9 link: https://lore.kernel.org/qemu-riscv/20230901194627.1214811-1-dbarboza@ventanamicro.com/

[1] https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01729.html
[2] https://lore.kernel.org/qemu-riscv/20230906091647.1667171-9-dbarboza@ventanamicro.com/

Daniel Henrique Barboza (20):
  target/riscv/cpu.c: split CPU options from riscv_cpu_extensions[]
  target/riscv/cpu.c: skip 'bool' check when filtering KVM props
  target/riscv/cpu.c: split kvm prop handling to its own helper
  target/riscv: add DEFINE_PROP_END_OF_LIST() to riscv_cpu_options[]
  target/riscv/cpu.c: split non-ratified exts from
    riscv_cpu_extensions[]
  target/riscv/cpu.c: split vendor exts from riscv_cpu_extensions[]
  target/riscv/cpu.c: add riscv_cpu_add_qdev_prop_array()
  target/riscv/cpu.c: add riscv_cpu_add_kvm_unavail_prop_array()
  target/riscv/cpu.c: limit cfg->vext_spec log message
  target/riscv: add 'max' CPU type
  avocado, risc-v: add tuxboot tests for 'max' CPU
  target/riscv: deprecate the 'any' CPU type
  target/riscv/cpu.c: use offset in isa_ext_is_enabled/update_enabled
  target/riscv: make CPUCFG() macro public
  target/riscv/cpu.c: introduce cpu_cfg_ext_auto_update()
  target/riscv/cpu.c: use cpu_cfg_ext_auto_update() during realize()
  target/riscv/cpu.c: introduce RISCVCPUMultiExtConfig
  target/riscv: use isa_ext_update_enabled() in
    init_max_cpu_extensions()
  target/riscv/cpu.c: honor user choice in cpu_cfg_ext_auto_update()
  target/riscv/cpu.c: consider user option with RVG

 docs/about/deprecated.rst         |  12 +
 target/riscv/cpu-qom.h            |   1 +
 target/riscv/cpu.c                | 564 +++++++++++++++++++++---------
 target/riscv/cpu.h                |   2 +
 target/riscv/kvm.c                |   8 +-
 target/riscv/kvm_riscv.h          |   3 +
 tests/avocado/tuxrun_baselines.py |  32 ++
 7 files changed, 452 insertions(+), 170 deletions(-)

-- 
2.41.0


