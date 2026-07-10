Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9584C43458
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 06:09:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wi4Qe-000166-65; Fri, 10 Jul 2026 02:09:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1wi4QW-00011x-6U
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 02:09:33 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1wi4QU-0001sR-Jc
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 02:09:31 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-2cab973140bso5942855ad.3
 for <qemu-riscv@nongnu.org>; Thu, 09 Jul 2026 23:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1783663769; x=1784268569; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=wB9IkbLd+/9g26Wp85Xdso+vR8MxlYjkBJN19PJbQeo=;
 b=KSkJmehoADmEhvkjWM6gQLTWWQlJfwxvAvy9hwjLgAA/9wYK9W0hBD7fjhVgH0NzLT
 qB39aohggusuLMC98V7gX/K+gaK6IZLqFcVtymLIXNdPIZ1XSItGkdzb26qOpG/Zyh+k
 l8sGjrJXXTrIIR7/1Ut5WGXyhDszeqWhaIT5lgHmM3ai/WTAK1eK+ZH9uQnGX2b9A6qj
 Opv5gHBEpK3zjlETkIhE3xUBIN0rwhAmzHMWa3j5R3HiRIoxwDe8ad74qtqfGzTA8KFx
 95JMeCBW+4AvSL4C9tFJdW3Ks+psbPsrGdnKSWUmkHsO+ET+QG/IAeb+ZdiWwJo0w3F1
 M6tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783663769; x=1784268569;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=wB9IkbLd+/9g26Wp85Xdso+vR8MxlYjkBJN19PJbQeo=;
 b=KxavygzqaaE/dQmiQ4wG4+xzjWqEVeXQ5pNCUxGpgF4cZaQqvMG+gTQZR7vB/LOZ4I
 tR7dQKqAC4xyi1e2tO6xXaDlByrK+NW8CS8hnuaaDmnsQETZpWxcUHd+YaM60U6LnB3x
 ZhhOe2lcn25M1WHJOSQb0pz1Nw7LuR80v/n9k1QPfIcgnfRJ7PsenK0C+d3DU7gt3sY2
 vFVHeprVPPlVS+OiT6mjVEHCh6wi3D8HJwxYguKVPYhBv6QNkQusvOLbUOH7CNP0w+lk
 F1V7KlgNxxYK5wUzKfHnBUlDggQV1LVKw5/3AbiskaKAeLZtYpd2J95/2+3z4mAvLhBm
 DY6A==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq9oXagKKd4VS91DeboAFt+gQqEF3IbPMZfCGXWX9np11B3/3Uw5UHAR3jO27ZZR5kLU5h6jruTzyda@nongnu.org
X-Gm-Message-State: AOJu0Yztx8NCoSG29T5e4Xtdq1PE6oWyz+DzVP4oN/vmhljjCRAOVWmv
 WSWm0sxn+pzIc7OHNmIJCbsg5rfbbFznTq46wMKu0i6DJ/a7pq1NPsrRFzj7Rfx6Aew=
X-Gm-Gg: AfdE7ck77FwBcvx+BkRCx6HOIH2OHVC4u13eLcPfqujJPnfhTv1RpLfeOrLaPQoNH3o
 x5xI8tgPBjszavgjyrGPIU3K/lusRMDFAeXdKdRO/MsbjCEkqPQG8U7o69x0uaYSatHIGJxrhw3
 3aHzXJ7JAv/BP8o2LU6jx8bXHXjTjbLytYs7GONqXRPFBGQEal3GE+7iwVhgwVGC3f0gf0dERaR
 9nyZ2lBYtverGOePSjrXr79cEemqrr5Nt9MfQTzKRp7oMojb+7QHSA2EWanpLeQE+T+3/o1hwZG
 q0GXiLP4LQfTjan4sWB/u1zLRBLlvKZnLiG4eci9Co2BzKb7S8xVqM/KoOM2BpE3uV42/e9vXXK
 ZqNtFvjQorJf2u43PUqlg/S8065Yinjn4KEc7Jg9ir88MI8mYkY4/LC0B6GZ+UMGsFBQ+hm+cXn
 PSCpc7uK2hHcQzvIjV/wFyRpV97F5hQoSJ89SOMU0Od4NPw4FjAw==
X-Received: by 2002:a17:902:e744:b0:2cc:f4d4:29a9 with SMTP id
 d9443c01a7336-2ccf4d46beamr95380495ad.23.1783663769020; 
 Thu, 09 Jul 2026 23:09:29 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ccc9d59e33sm53344255ad.74.2026.07.09.23.09.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2026 23:09:28 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 qemu-riscv@nongnu.org (open list:SiFive Machines),
 Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v5 0/7] target/riscv: Support the true Zicclsm extension
Date: Fri, 10 Jul 2026 14:09:07 +0800
Message-ID: <20260710060914.1227027-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x629.google.com
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

From: Frank Chang <frank.chang@sifive.com>

Support the true Zicclsm extension so that we can trap misaligned accesses
when Zicclsm is disabled.

To enable/disable Zicclsm, simply set zicclsm=[true|false], e.g.:
  -cpu rv64,zicclsm=[true|false]

QEMU will raise a misaligned load/store exception when executing misaligned
load/store instructions if Zicclsm is disabled.

Changelog:
  v5:
    * Add Zicclsm to RVA22U64 profile explicitly.
    * Rebase to the latest riscv-to-apply.next.
  v4:
    * Align ROM reset vector data at 8-byte aligned offsets.
  v3:
    * Enable Zicclsm for the compatible CPUs.
    * Rebase to the latest riscv-to-apply.next.
  v2:
    * Use (size_memop(size) | mo_endian_env(env)) to calculate MemOp.
    * Use (log2_esz << MO_ASHIFT) to calculate aligment MemOp for
      vector load/store whole register instructions.

Frank Chang (7):
  target/riscv: Add Zicclsm CPU option
  target/riscv: Support raising misaligned exceptions for scalar
    loads/stores
  target/riscv: Support raising misaligned exceptions for vector
    loads/stores
  target/riscv: Enable Zicclsm for the compatible CPUs
  hw/riscv: sifive_u: Align ROM reset vector data
  target/riscv: Update Zicclsm ISA string and expose it as a CPU
    property
  target/riscv: Enable Zicclsm for RVA22U64 profile

 hw/riscv/sifive_u.c                         | 11 ++--
 target/riscv/cpu.c                          | 10 +++-
 target/riscv/cpu_cfg_fields.h.inc           |  2 +
 target/riscv/tcg/insn_trans/trans_rvi.c.inc |  6 ++
 target/riscv/tcg/insn_trans/trans_rvv.c.inc | 18 +++++-
 target/riscv/tcg/vector_helper.c            | 65 ++++++++++++++++-----
 6 files changed, 88 insertions(+), 24 deletions(-)

--
2.43.0


