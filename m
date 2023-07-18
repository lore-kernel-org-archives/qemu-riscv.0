Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AAF8EB64DC
	for <qemu-riscv@archiver.kernel.org>; Tue, 18 Jul 2023 21:03:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qLrr9-0002Tv-JA; Tue, 18 Jul 2023 17:03:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qLrr8-0002Th-4N
 for qemu-riscv@nongnu.org; Tue, 18 Jul 2023 17:03:38 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qLrr6-0007Aj-7W
 for qemu-riscv@nongnu.org; Tue, 18 Jul 2023 17:03:37 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 46e09a7af769-6b9ede6195cso169836a34.3
 for <qemu-riscv@nongnu.org>; Tue, 18 Jul 2023 14:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1689714215; x=1692306215;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iKmZ/gpa4rUX2TdIepaylDRDGOlOcgqrXaKT4AcwHa8=;
 b=TDcxEWnjC+hOfj7CGJ/DfFPswnBltzYFp/DkcPk/jmaQVaKHSEUoGiKZB47S60ZJIQ
 N8vK9tpkzGUlqFEXfxawoWeylt0L7ZbdmgItLonWUU3tsvJyRVpyUnrvIyFaUW36s+pt
 /HrXIfsvud3wTE6CqAZMY+QkfltB0jmIX+KS0k7MJzUbEjdOcxyZFjRNIHm9oRKxhBkd
 Vu+SzvCwlfKNbY88ZhNFPeoueu8PB5yGiWCJGow4S4hxenE0q43C61KXIAL3R4c3mP3m
 k9LpOvbSs2hZHhHa6J8TCNwtEoFmIL0GpVIZVyWg8G0o8O1F96qfQjGXEu5ubH0m/BTX
 YYOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689714215; x=1692306215;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iKmZ/gpa4rUX2TdIepaylDRDGOlOcgqrXaKT4AcwHa8=;
 b=bAU+Y7y+myYLhqCqaB+bHqWAF0lBqdw1cEOXBRa/3FYcUQJO/2+INR+7SiTRBvATc5
 kbL1W36nJcfPeW4+y4ymRxY4qHzHiVR/NjxBbqSwkOW63mVWO3iNopj6H9f8w6VlC0ow
 yTGTplnjOhNmdbMYnHXa+gVOq6+0iR5wrNmH3ZhMmykNJ8GUcQkzJaxJsGw4ikptwCu4
 /kT02QubfdBqGX/lYh3QnzkAtxocRcu5bx+vhGsGPhI6fNTlZJUd8OKmzjOBOpqsqg2L
 x3mVbS2fX2clE29p204TfYgxVlT7HZPetmRKf82ayvP8q9RN0LyBCZm6MOrN9+poWUBU
 KUgg==
X-Gm-Message-State: ABy/qLbFPzkJldvKmdBU9VqtckAFo8QS/BtSu9nfYSeI96ypwKlflzmV
 MvcRrCukVG49WpASMRAC1mD4+Q==
X-Google-Smtp-Source: APBJJlEMqMatPuAPvLxcXQcrABIglP/YEJibjvIYXI3I/zm5RDtKfhKJYKi5nYyOZsSB30d+yZzXJQ==
X-Received: by 2002:a9d:6c02:0:b0:6b7:53df:1db3 with SMTP id
 f2-20020a9d6c02000000b006b753df1db3mr15338991otq.0.1689714214970; 
 Tue, 18 Jul 2023 14:03:34 -0700 (PDT)
Received: from grind.. (201-69-66-211.dial-up.telesp.net.br. [201.69.66.211])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a056830140200b006b96384ba1csm1160657otp.77.2023.07.18.14.03.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jul 2023 14:03:34 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.2 v4 00/11] riscv: add 'max' CPU, deprecate 'any'
Date: Tue, 18 Jul 2023 18:03:18 -0300
Message-ID: <20230718210329.200404-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x334.google.com
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

This new version has some adjustments w.r.t the KVM code that got a bit
neglected in the last 3 versions. The most notable change is in patch 3,
a new patch where we're moving the KVM property handling into an
exclusive helper. This helped to unclog riscv_cpu_add_user_properties()
a lot, making it easier for future cleanups we're planning to do in this
code.

Patch 4 (new) helped to padronize the code even more, allowing for more
macro usages to reduce repetition. Patch 8 (new) is basically patch 7
for KVM properties.

Patches missing review: 3, 4, 8, 10, 11 

Changes from v3:
- patch 1:
  - skip existing riscv_cpu_options before calling qdev_prop_add_static()
- patch 3 (new):
  - move kvm CPU property handling to riscv_cpu_add_kvm_properties()
- patch 4 (new):
  - remove DEFINE_PROP_END_OF_LIST() for riscv_cpu_extensions[]
- patch 7 (former 5):
  - rename macro to ADD_CPU_QDEV_PROPERTIES_ARRAY()
- patch 8 (new):
  - add ADD_UNAVAIL_KVM_PROP_ARRAY macro
- v3 link: https://lore.kernel.org/qemu-riscv/20230714174311.672359-1-dbarboza@ventanamicro.com/

Daniel Henrique Barboza (11):
  target/riscv/cpu.c: split CPU options from riscv_cpu_extensions[]
  target/riscv/cpu.c: skip 'bool' check when filtering KVM props
  target/riscv/cpu.c: split kvm prop handling to its own helper
  target/riscv/cpu.c: del DEFINE_PROP_END_OF_LIST() from
    riscv_cpu_extensions
  target/riscv/cpu.c: split vendor exts from riscv_cpu_extensions[]
  target/riscv/cpu.c: split non-ratified exts from
    riscv_cpu_extensions[]
  target/riscv/cpu.c: add ADD_CPU_QDEV_PROPERTIES_ARRAY() macro
  target/riscv/cpu.c: add ADD_UNAVAIL_KVM_PROP_ARRAY() macro
  target/riscv: add 'max' CPU type
  avocado, risc-v: add opensbi tests for 'max' CPU
  target/riscv: deprecate the 'any' CPU type

 docs/about/deprecated.rst      |  12 +++
 target/riscv/cpu-qom.h         |   1 +
 target/riscv/cpu.c             | 169 +++++++++++++++++++++++++--------
 tests/avocado/riscv_opensbi.py |  16 ++++
 4 files changed, 160 insertions(+), 38 deletions(-)

-- 
2.41.0


