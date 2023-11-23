Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64F9DC61D85
	for <qemu-riscv@archiver.kernel.org>; Thu, 23 Nov 2023 18:52:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r6EnY-0007rh-Ga; Thu, 23 Nov 2023 13:51:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r6EnU-0007qT-W9
 for qemu-riscv@nongnu.org; Thu, 23 Nov 2023 13:51:33 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r6EnS-0008F9-7X
 for qemu-riscv@nongnu.org; Thu, 23 Nov 2023 13:51:32 -0500
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1cf6bdf8274so15939835ad.1
 for <qemu-riscv@nongnu.org>; Thu, 23 Nov 2023 10:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1700765488; x=1701370288; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1YNp+4Cx+kEVtJDx/e1YmWMjcChTvtDhDJ8J5a420Fc=;
 b=OD3Ke2s0DvdhWX9x8LD0PXk6zS6O39k5YbP37ItTOSbzyAGY8Kru/AFEjS0Jvlhron
 rgngRAekDcZbT2jajiOrSQx1x7Wt7nnMIQY8dFshTZOszdZ7EHz5OX5HpGJAo/62RBVX
 sT7BKF4pLescrWgggTjuTpE3359XTJnhJyXYE9V3HXrwv7kCno9vawxkid4dGwyvgdtX
 SyRyYL3Gm60Awwj4KhSGT46MOsC9h5g7lry8+hkI4xr/grTksLs9JyY8R4+FnDeNfI2e
 kit3qsRymAm2QxjD778MWRDQ0gm/SX7qWeyz3lja7smdp1yrWFJqMRsl0tvPRfR8OX3f
 +i5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700765488; x=1701370288;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1YNp+4Cx+kEVtJDx/e1YmWMjcChTvtDhDJ8J5a420Fc=;
 b=rVCuQYSTYCEg9kOCR87c98IaqdCqngBAGonEpTvphBM0PHYrITzlN+Z3/JGY8K7dha
 Hn7DD1E8dLzSK8llPR9QorhqGMjWkzeBCypE0ADJww72+Gvrf3AcG7C9gNQq+wfBlAig
 aEa8P4apycANe9GVvm1XASBRpNH8K5gzYD/Bx28Qw3MuHE9tda4Vvq9zhLR5JEim5Il3
 T88kq+JG98UghzDGY7u6hF3iEo6uAZNElnx/NkM9H1ArbTz5G/a7oV+oQpk8ghgl5qU6
 KDYzdahogV+0KRor3VNjpzT1a1Q/zNEN+xrIDlFk2/qOJ/w2VK3f1EPTx53JMkzEbh/g
 u0qA==
X-Gm-Message-State: AOJu0YyEHCJ7sap2/6cpDVJNOZ4PYBfQJmgiKTQ83cLWLKZDx7u4nnmP
 J0zSt94+8Yeo0gmJ/h3HtNrOig==
X-Google-Smtp-Source: AGHT+IFCCHA9THkU31k54JLok3/Sf9L0tW5h+mKD1OGiDWx4dXgH0Ao9J9CpucKQvI4fbNCWupJsxA==
X-Received: by 2002:a17:903:2347:b0:1cf:837d:1e59 with SMTP id
 c7-20020a170903234700b001cf837d1e59mr4249364plh.25.1700765488370; 
 Thu, 23 Nov 2023 10:51:28 -0800 (PST)
Received: from grind.. ([2804:7f0:bdcd:fb00:6501:2693:db52:c621])
 by smtp.gmail.com with ESMTPSA id
 u4-20020a17090282c400b001bb1f0605b2sm1662638plz.214.2023.11.23.10.51.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Nov 2023 10:51:27 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-9.0 v11 00/18] rv64i and rva22u64 CPUs,
 RVA22U64 profile support
Date: Thu, 23 Nov 2023 15:51:04 -0300
Message-ID: <20231123185122.1100436-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62d.google.com
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

In this new version we added a new function, riscv_cpu_enable_named_feat(),
to allow profiles to enable named features.

This doesn't have much of an impact for this current work - the only
named feature we're using here is zic64b and the default block size
values already satisfies it.

The reason we're doing this change now is due to the incoming RVA22S64
support. A new named featured called 'svade' will be added for it, and
'svade' is NOT enabled by default in QEMU. Profiles will need to enable
named features to support RVA22S64, so might as well implement this
capability right from the start.

Series based on master.

Patches missing acks: patch 10

Changes from v10:
- patch 10:
  - add riscv_cpu_enable_named_feat()
  - enable named features during cpu_set_profile()
- v10 link: https://lore.kernel.org/qemu-riscv/20231103134629.561732-1-dbarboza@ventanamicro.com/


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
 target/riscv/riscv-qmp-cmds.c |  44 +++-
 target/riscv/tcg/tcg-cpu.c    | 367 ++++++++++++++++++++++++++++++----
 8 files changed, 524 insertions(+), 53 deletions(-)

-- 
2.41.0


