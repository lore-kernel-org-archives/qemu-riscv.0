Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB770C05024
	for <qemu-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 21:38:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qj4tO-0004wz-IP; Wed, 20 Sep 2023 17:37:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qj4tO-0004wi-2V
 for qemu-riscv@nongnu.org; Wed, 20 Sep 2023 17:37:54 -0400
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qj4tM-0006SR-7Z
 for qemu-riscv@nongnu.org; Wed, 20 Sep 2023 17:37:53 -0400
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-6b9e478e122so209302a34.1
 for <qemu-riscv@nongnu.org>; Wed, 20 Sep 2023 14:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1695245870; x=1695850670; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PrbVKF2ZzMXknOTG5z2ypC+xhOlDu7nrAAmZFumz1q4=;
 b=nZJGiWlvNds3q3o7B/2ySp8Tm7UGZypWfYS+D4xS7wQklI8uD9ubqAOZJErnmqgZZ0
 JyV1oxMKwowuyVcniGUbHIxQAwe8fE+UwjnUMr9jIVaGBXmAA/AD6u0IUEvmOrh6MBfF
 tQkIx5YINOo1PbHBLzJ/VpyFkkp4Mdz2RohNpsShTrh/3t6gphWXu3IKT8KLPC1lUD+N
 GpiFaIJsEsjQ6ZVk/41g7hVYchZduSboHuTEUX26nR01RGeV1aVziXt0xJTfqb7XLqc4
 U7E2TP3bc5CKlGzCL4yWaEoGNpklbbdR3B2/3PJ96IRTZrox/TNneI+/g0VPSOl+cnVs
 ReGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695245870; x=1695850670;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PrbVKF2ZzMXknOTG5z2ypC+xhOlDu7nrAAmZFumz1q4=;
 b=pKzxdhwSC2b621UC0bIU+Mib4Hxgh1+ad3qkxD0/f8RTK6fXX3nF/gNUtY2IeQ4bwg
 liWLS7wadW5QK4+S6stqX1t6IrGnCtmqEb96L2i8NoBukZHjqMpwIY6ZXG0z0lF48KtD
 1BAhAqIbQ4pv5mqnmzw1uR7ZcJAVISQ2GMIUJ49bFLOjko5JacoWwfCp8H+acqJ+iY3N
 gxH8/qD8pI9v9EB+edYds9GRDc/1KXgVG49vhP0phTWRdfoSQeyvIvQ5PdBP3NvoSbOM
 m99DeCCVSXJyfDweFWIazUgicyfsZi305G/7FunN0p5VdG5hxHwzVIuxCL3QgllMlQTL
 CGLg==
X-Gm-Message-State: AOJu0YwUZLTeopS7+2H71mvTz1Kj5vPdi0ZnVzdhrQNf9Bm0ZGpDH1qs
 LN/2dq7B5l4ipGv7+nc5/OmjRA==
X-Google-Smtp-Source: AGHT+IFZA6gxPRRaut1dmGKmXoyGmVVHgzaO+7Wk0y6WX2O2aC+k3URH/O7/M7dH3AdLCLlxHW1GVg==
X-Received: by 2002:a9d:7ac7:0:b0:6bf:178f:aade with SMTP id
 m7-20020a9d7ac7000000b006bf178faademr4132639otn.11.1695245870507; 
 Wed, 20 Sep 2023 14:37:50 -0700 (PDT)
Received: from grind.. ([177.94.42.59]) by smtp.gmail.com with ESMTPSA id
 e1-20020a9d7301000000b006b83a36c08bsm64415otk.53.2023.09.20.14.37.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Sep 2023 14:37:50 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 0/8] riscv: query-cpu-model-expansion API
Date: Wed, 20 Sep 2023 18:37:35 -0300
Message-ID: <20230920213743.716265-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x330.google.com
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

Based-on: 20230920112020.651006-1-dbarboza@ventanamicro.com
("[PATCH v3 00/19] riscv: split TCG/KVM accelerators from cpu.c")

Hi,

The parent series is in a more stable state so I decided to go ahead
and post this work.

This series implements query-cpu-model-expansion for RISC-V. The
implementation was based on the ARM version of the same API in
target/arm/arm-qmp-cmds.c.

A couple of changes were made in the first 3 patches. The most impactful
is in patch 2, where we're now exposing extension properties for vendor
CPUs. This was done to allow the API to retrieve the extension state for
those CPUs, which were otherwise hidden inside cpu->cfg. The result is
that users will have a little more power because we're now allowing
vendor CPU extensions to be disabled. Enabling extensions for those CPUs
is still forbidden. Patch 2 commit msg gives more details on what is now
possible to do.

The first 3 patches can be pushed/merged separately from the API since
they can stand on their own.

A small tweak in the extension validation in the TCG driver was also
needed. We're now centralizing all extension validation in
finalize_features(), and exporting finalize_features() to be usable by
the new API. This will allow us to validate model properties and report
back if the desired model is valid or not.

This series can be tested directly using this branch:

https://gitlab.com/danielhb/qemu/-/tree/qmp-cpu-expansion_v1


Here's an usage example. Launch QEMU with "-S" to be able to issue QMP
query commands before the machine starts:

$ ./build/qemu-system-riscv64 -S -M virt -display none -qmp  tcp:localhost:=
1234,server,wait=3Doff

Then use QMP to access the API:

$ ./scripts/qmp/qmp-shell localhost:1234
Welcome to the QMP low-level shell!
Connected to QEMU 8.1.50

(QEMU)  query-cpu-model-expansion type=3Dfull model=3D{"name":"rv64"}
{"return": {"model": {"name": "rv64", "props": {"zicond": false, "x-zvfh": =
false, "mmu": true, "x-zvfbfwma": false, "x-zvfbfmin": false, "xtheadbs": f=
alse, "xtheadbb": false, "xtheadba": false, "xtheadmemidx": false, "smstate=
en": false, "zfinx": false, "Zve64f": false, "Zve32f": false, "x-zvfhmin": =
false, "xventanacondops": false, "xtheadcondmov": false, "svpbmt": false, "=
zbs": true, "zbc": true, "zbb": true, "zba": true, "zicboz": true, "xtheadm=
ac": false, "Zfh": false, "Zfa": true, "zbkx": false, "zbkc": false, "zbkb"=
: false, "Zve64d": false, "x-zfbfmin": false, "zk": false, "x-epmp": false,=
 "xtheadmempair": false, "zkt": false, "zks": false, "zkr": false, "zkn": f=
alse, "Zfhmin": false, "zksh": false, "zknh": false, "zkne": false, "zknd":=
 false, "zhinx": false, "Zicsr": true, "sscofpmf": false, "Zihintntl": true=
, "sstc": true, "xtheadcmo": false, "x-zvbb": false, "zksed": false, "x-zvk=
ned": false, "xtheadsync": false, "x-zvkg": false, "zhinxmin": false, "svad=
u": true, "xtheadfmv": false, "x-zvksed": false, "svnapot": false, "pmp": t=
rue, "x-zvknhb": false, "x-zvknha": false, "xtheadfmemidx": false, "x-zvksh=
": false, "zdinx": false, "zicbom": true, "Zihintpause": true, "svinval": f=
alse, "zcf": false, "zce": false, "zcd": false, "zcb": false, "zca": false,=
 "x-ssaia": false, "x-smaia": false, "zmmul": false, "x-zvbc": false, "Zife=
ncei": true, "zcmt": false, "zcmp": false, "Zawrs": true}}}}



Daniel Henrique Barboza (8):
  target/riscv: add riscv_cpu_get_name()
  target/riscv/tcg-cpu.c: add extension properties for all cpus
  target/riscv/kvm/kvm-cpu.c: add missing property getters()
  qapi,risc-v: add query-cpu-model-expansion
  target/riscv/tcg: add tcg_cpu_finalize_features()
  target/riscv: handle custom props in qmp_query_cpu_model_expansion
  target/riscv: add riscv_cpu_accelerator_compatible()
  target/riscv/riscv-qmp-cmds.c: check CPU accel in
    query-cpu-model-expansion

 qapi/machine-target.json      |   6 +-
 target/riscv/cpu.c            |  38 +++++++-
 target/riscv/cpu.h            |   3 +
 target/riscv/kvm/kvm-cpu.c    |  40 ++++++++-
 target/riscv/riscv-qmp-cmds.c | 160 ++++++++++++++++++++++++++++++++++
 target/riscv/tcg/tcg-cpu.c    | 122 ++++++++++++++++++--------
 target/riscv/tcg/tcg-cpu.h    |   2 +
 7 files changed, 327 insertions(+), 44 deletions(-)

--=20
2.41.0


