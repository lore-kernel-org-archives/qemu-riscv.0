Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE0ADC35274
	for <qemu-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 12:54:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rFD85-0002Y0-Gb; Mon, 18 Dec 2023 07:53:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rFD84-0002Xl-Na
 for qemu-riscv@nongnu.org; Mon, 18 Dec 2023 07:53:52 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rFD81-0004oC-O9
 for qemu-riscv@nongnu.org; Mon, 18 Dec 2023 07:53:51 -0500
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1d389fb3f64so10036725ad.1
 for <qemu-riscv@nongnu.org>; Mon, 18 Dec 2023 04:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1702904026; x=1703508826; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LpMJQ+/cgJo00rJY1/O13ZEMaIV4JJ4lfLy+owWo5iM=;
 b=nogELr2xYsIfBUM/iIYW4NVyws1NrBr70FD9ap1oNOjrx3K8yyh+d3MHLmYzZzUSXo
 f+WlAPrtE3JgceHk8RjfygNCheoXaMx/KLEvFV+09hh/y7NFuzeCrz3kC5DNfxvmAlZ+
 CoZLJYVnR/NZTUMn0bAU2EK7/cRVHCsgRV7fq3oW2rdmHA0dE+J+agoDYdtX1g2R9/kX
 ywHXv2wg7uOibuv3nfuJ8v5GooSC3aHE+f0I8VbAenySyi9rUI3kUADF6AaxJNjdGL4a
 Je6y5WH2+w9mIwlLGmOOupZB0CLd1oe/uHj+mhoY4oVSTT6mXqlwPFmRCvF5nDdPmsOT
 1wqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702904026; x=1703508826;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LpMJQ+/cgJo00rJY1/O13ZEMaIV4JJ4lfLy+owWo5iM=;
 b=PrulrOEIAqdV0/4jVsJyP119Da2jd1uNJCQl9L/IDJnO2sOJm77+j+XxMlNr//yRRp
 4ibjOaejSrIG6IYYzkioKz7WXlEIb8F6Y8Z3r7CDzYIvatQ6814+AbtUjYSxlH6AXN39
 qW+vV/tT8ZAf3sVx87PHBWZkVrXZXAeDs/BrMfJyXBUj5TOKWSpSDrsFByWc3vsGpfhr
 QmH2rlwc21vLGOMKuaKjSKkCQotrL7cKRfIjeE7TUAOWQ614LW1UO7voTZi20jT+hwUo
 CMzoq6TvMtbDCEJi+enivfd4VYA3WUBJgVIJQUYHHZCHD0GljTep/1eoToL87YMyZcPC
 OACQ==
X-Gm-Message-State: AOJu0YyEKBu5zP7CxPmtbMBdVP2lVDKMgkINkmC08ifGwFVbsRIrPx6q
 0fdzyspigZZmthZXsidVtYUblg==
X-Google-Smtp-Source: AGHT+IGY6EAOB1V1Qe5cP7Qtq0xhREAgZ/OWFxnNEqYifbPulL3JmxziVhHrWahMjq7mAwLLJfaoOw==
X-Received: by 2002:a17:903:189:b0:1d2:ffba:2d47 with SMTP id
 z9-20020a170903018900b001d2ffba2d47mr8923401plg.77.1702904026314; 
 Mon, 18 Dec 2023 04:53:46 -0800 (PST)
Received: from grind.. ([179.93.21.205]) by smtp.gmail.com with ESMTPSA id
 c2-20020a170902848200b001d09c539c96sm7494897plo.229.2023.12.18.04.53.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 04:53:45 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v13 00/26] riscv: RVA22 profiles support
Date: Mon, 18 Dec 2023 09:53:08 -0300
Message-ID: <20231218125334.37184-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62d.google.com
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

Hi,

This is a merge of the two profile series:

"[PATCH for-9.0 v12 00/18] riscv: rv64i/rva22u64 CPUs, RVA22U64 profile support"
"[PATCH for-9.0 v2 0/8] target/riscv: implement RVA22S64 profile"

I'm sending them together since the second series is dependent on the first.

Quick summary of the major features added:

- A new rv64i CPU type. This is a CPU that has only RVI enabled;

- 'rva22u64' and 'rva22s64' profile flags. They were designed to be used
  with the 'rv64i' CPU but can be used with other generic CPUs like
  rv64;

- Two new profile CPUs: 'rva22u64' and 'rva22s64'. A profile CPU is an
  alias of '-cpu rv64,profile=on' and it's the most convenient way of
  using profiles. E.g to launch an rva22s64 'virt' machine:

  ./qemu-system-riscv64 -M virt -cpu rva22s64  (...)

  To test an application with an rva22u64 profile with linux-user mode:

  ./qemu-riscv64 -cpu rva22u64  (...)


The series can also be fetch via:

https://gitlab.com/danielhb/qemu/-/tree/rva22_v13

Patches rebased on top of Alistair riscv-to-apply.next.

All patches acked.

Daniel Henrique Barboza (26):
  target/riscv: create TYPE_RISCV_VENDOR_CPU
  target/riscv/tcg: do not use "!generic" CPU checks
  target/riscv/tcg: update priv_ver on user_set extensions
  target/riscv: add rv64i CPU
  target/riscv: add zicbop extension flag
  target/riscv/tcg: add 'zic64b' support
  riscv-qmp-cmds.c: expose named features in cpu_model_expansion
  target/riscv: add rva22u64 profile definition
  target/riscv/kvm: add 'rva22u64' flag as unavailable
  target/riscv/tcg: add user flag for profile support
  target/riscv/tcg: add MISA user options hash
  target/riscv/tcg: add riscv_cpu_write_misa_bit()
  target/riscv/tcg: handle profile MISA bits
  target/riscv/tcg: add hash table insert helpers
  target/riscv/tcg: honor user choice for G MISA bits
  target/riscv/tcg: validate profiles during finalize
  riscv-qmp-cmds.c: add profile flags in cpu-model-expansion
  target/riscv: add 'rva22u64' CPU
  target/riscv: implement svade
  target/riscv: add priv ver restriction to profiles
  target/riscv/cpu.c: finalize satp_mode earlier
  target/riscv/cpu.c: add riscv_cpu_is_32bit()
  target/riscv: add satp_mode profile support
  target/riscv: add 'parent' in profile description
  target/riscv: add RVA22S64 profile
  target/riscv: add rva22s64 cpu

 hw/riscv/virt.c               |   5 +
 target/riscv/cpu-qom.h        |   5 +
 target/riscv/cpu.c            | 201 +++++++++++++--
 target/riscv/cpu.h            |  18 ++
 target/riscv/cpu_cfg.h        |   4 +
 target/riscv/kvm/kvm-cpu.c    |   7 +-
 target/riscv/riscv-qmp-cmds.c |  44 +++-
 target/riscv/tcg/tcg-cpu.c    | 450 +++++++++++++++++++++++++++++++---
 8 files changed, 672 insertions(+), 62 deletions(-)

-- 
2.43.0


