Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03158C4167B
	for <qemu-riscv@archiver.kernel.org>; Fri,  3 Nov 2023 13:47:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qyuVY-0001py-Sj; Fri, 03 Nov 2023 09:46:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qyuVV-0001oc-HC
 for qemu-riscv@nongnu.org; Fri, 03 Nov 2023 09:46:41 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qyuVP-0000rX-Mo
 for qemu-riscv@nongnu.org; Fri, 03 Nov 2023 09:46:40 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-5ac376d311aso24639647b3.1
 for <qemu-riscv@nongnu.org>; Fri, 03 Nov 2023 06:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1699019194; x=1699623994; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UEUb43zGREWXmRnscEGpDkVeGodNl30uqyQr3kuo7PI=;
 b=pcWTYgbj6cZjLRihhpIkCkcof/pJ0j7ex8dLhTy/BvPqGT6C5CLHRlCaL1a715tj64
 vLC6hM/G3s23JtDMZ9QHi/E3WNjWVgf3dM/YVpDgTrTwKSFQgnfIcqNzpCcoocakkiv7
 9Pcoanqc0dakzYyVxe/h0SyrhtAgUvJQMGAVzKC65vQ4igzG75dLheO0eha7yWyYX36q
 oetCq1J/tFCzZNo9VVjrV43F4vq9KQVSIBuHLn7OtzPyBb3gom6XNv89oXdW61F766CR
 51o2nGE83zAzK6G0nwjLKQNhyDBQ7X8DguP5hO+E2W4T76icLVQBBQPd+MCYUoLvxnX5
 FqVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699019194; x=1699623994;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UEUb43zGREWXmRnscEGpDkVeGodNl30uqyQr3kuo7PI=;
 b=kl+5HyLkOSw52eCYf3CDT66KrwOck3nLmmPuYsSLbSxYALuCeMHdWg96EjjIdCgGr6
 2fyVw1cdqsW7VlQb2bgOb4S2K1bWxl8I6Tz3W9hB0UpAJlZJa+O/icanjrkkL0Ox3GNR
 DO9kYf635Dl1GQstlGyeZ5y1pk8oznTh3yV1Bi3h2pZKYikw8BmlE0EQmtPY2Cfeemvq
 5vg7lAhaBHGwfR7mL+LGxkH5UWs0Vy4Adu2PO2PGEiJ/zy6Qf3DMXRNPPa7snfRP+0Va
 218VENWEXXYRUu2aOO09SAYecpczwXU+3KRjmJaA5VubNT26Va+eyoUGUp/6BxY7FDDG
 Xf8g==
X-Gm-Message-State: AOJu0YzkEG4aDLoB4u8/jDewXtYJGIQJ48rO46usnIGks9p2KBMbbj2F
 pVKeQ+xQkxloETMnKIt1KWnL6w==
X-Google-Smtp-Source: AGHT+IFmvOuiAqMRycQjRSdKMoOdlGD+WN2S45jGz35FSQK7AhNYmXBRFnJ6DmapiCPNG674r8PpHg==
X-Received: by 2002:a0d:e6cb:0:b0:5a7:b8d4:60e1 with SMTP id
 p194-20020a0de6cb000000b005a7b8d460e1mr3225017ywe.9.1699019194585; 
 Fri, 03 Nov 2023 06:46:34 -0700 (PDT)
Received: from grind.. ([179.193.10.161]) by smtp.gmail.com with ESMTPSA id
 j68-20020a0df947000000b00582b239674esm935814ywf.129.2023.11.03.06.46.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Nov 2023 06:46:34 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v10 00/18] rv64i and rva22u64 CPUs, RVA22U64 profile support
Date: Fri,  3 Nov 2023 10:46:11 -0300
Message-ID: <20231103134629.561732-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-yw1-x112d.google.com
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

This new version contains changes proposed by Drew in v9. The most
notable change is the drop of the 'max' CPU profile restriction. 

Patches based on Alistair's riscv-to-apply.next. 

All patches acked.

- patch 3:
  - move the 'priv_spec' comment to cpu_validate_multi_ext_priv_ver()
    right before the version is bumped
- patch 4:
  - Fixed 'Bare CPUs' comment in set_satp_mode_default_map()
  - Changed rv64i_bare_cpu_init() comment to "Set to QEMU's first
    supported priv version"
- patch 10:
  - removed 'priv_spec' comment from cpu_set_profile()
- patch 18:
  - added a DEFINE_PROFILE_CPU() macro
  - renamed rva22u64_bare_cpu_init() to rva22u64_profile_cpu_init()
- patch 19: dropped
- v9 link: https://lore.kernel.org/qemu-riscv/20231102224445.527355-1-dbarboza@ventanamicro.com/ 

Daniel Henrique Barboza (18):
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

 hw/riscv/virt.c               |   5 +
 target/riscv/cpu-qom.h        |   4 +
 target/riscv/cpu.c            | 134 ++++++++++++-
 target/riscv/cpu.h            |  13 ++
 target/riscv/cpu_cfg.h        |   3 +
 target/riscv/kvm/kvm-cpu.c    |   7 +-
 target/riscv/riscv-qmp-cmds.c |  44 ++++-
 target/riscv/tcg/tcg-cpu.c    | 350 ++++++++++++++++++++++++++++++----
 8 files changed, 507 insertions(+), 53 deletions(-)

-- 
2.41.0


