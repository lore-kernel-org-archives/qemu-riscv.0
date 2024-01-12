Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55437C4706C
	for <qemu-riscv@archiver.kernel.org>; Fri, 12 Jan 2024 14:03:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rOI74-0003xC-JA; Fri, 12 Jan 2024 09:02:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rOI72-0003vc-32
 for qemu-riscv@nongnu.org; Fri, 12 Jan 2024 09:02:20 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rOI6z-0005lp-Td
 for qemu-riscv@nongnu.org; Fri, 12 Jan 2024 09:02:19 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-28c0536806fso5624573a91.0
 for <qemu-riscv@nongnu.org>; Fri, 12 Jan 2024 06:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1705068131; x=1705672931; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HeqYAzowMgjT9v7vCCjTcj7UZNPggSTt/OKl7QchW4A=;
 b=aN/iGag6tUHzUT3dII5Lkz9P8yhbIGidI+8kpAaZPiu/QmvcuNYqhQKWlv9zQlpyO6
 UQCg0iP1vIlUdGIzc0FTupM6BLpFwba+8eSaOytlHRYpeO8a/z7VwGiQqq3BlkDN9TyL
 Cx89m8uVVz4cy1UrHJ6hKezdmnoOHS0P+11WnFNzou05CSbdR+NMYQg8Z2WyC43d1GYn
 0BCGAmMHxzFtu48kw3gj65IKnbgA2U6d7J07ufzkQMfyo2I0jMIMiMy6848AoLWjPBUp
 FpGQB4J+w2ClhhSK9M39dzRcTrF4fraWC5Na9PTEAZ4xXaN5QkCwBr0XhMtDjVqKeSsb
 Vv1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705068131; x=1705672931;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HeqYAzowMgjT9v7vCCjTcj7UZNPggSTt/OKl7QchW4A=;
 b=HwqY3jwgBos1FjNro5OObJafgCG+C3ZD6e51b1BbkYiShkhWy2fZD+G1JkmbJ11UAM
 7qlNNZwKd2ByEZzTMedYaMOXhtENHIsj5+MH61cV4UPODBkEN8ELwnrAn+lGhePj/Rar
 K0Zy/tfxUVogueqjTUtUhiLAXa8utwhaqPgET5ScwaGh+RIwLU0ZdAvqA2oPz3JF7Ce4
 ro2ojy2Ja+iW3ZuOAjKBPo86Ne37iITjRmhhQ2oK6y8eXOE7f/LkN0u6ONzG6k65jxwl
 uztxeET6WD26ejucDofqqg7LZQ+lWDN5NVr2ajCTE3AxVh3SZJTkDKXmHOy6QpSFvdAO
 61gQ==
X-Gm-Message-State: AOJu0Yyi5yZIqVMAq5gH6U5CtzVM7WnmkZKDlOFvWha13ouwBqEpaQg+
 i7gY63krAU9cVpOKYlnnZPk9UUokrolfTw==
X-Google-Smtp-Source: AGHT+IEsolmOWSiZFkvcZXO0XrXQOyLTbEOd4lyLT7LPZpYssxkTSY1iIRQhsIDDOZDXYDuxy3i4Og==
X-Received: by 2002:a17:90b:1c91:b0:28b:d596:39d9 with SMTP id
 oo17-20020a17090b1c9100b0028bd59639d9mr1372296pjb.82.1705068130677; 
 Fri, 12 Jan 2024 06:02:10 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([152.234.123.64])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a1709028c8500b001cf6453b237sm3116927plo.236.2024.01.12.06.02.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jan 2024 06:02:10 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v5 0/8] target/riscv: deprecate riscv_cpu_options[]
Date: Fri, 12 Jan 2024 11:01:53 -0300
Message-ID: <20240112140201.127083-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pj1-x1034.google.com
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

This version is a resend of patches 10 to 17 from v4, reviewed-by and
tested-by tags added, rebased with Alistair's riscv-to-apply.next.
Patches 01 to 09 of v4 are already queued.

All patches acked.

Changes from v4:
- patches 1 to 9: already queued
- patches 10 to 17: reviewed-by and tested-by tags added (tested-by
  not added in KVM specific patches)
- v4 link: https://lore.kernel.org/qemu-riscv/20240105230546.265053-1-dbarboza@ventanamicro.com/

Daniel Henrique Barboza (8):
  target/riscv: create finalize_features() for KVM
  target/riscv: move 'cbom_blocksize' to riscv_cpu_properties[]
  target/riscv: move 'cbop_blocksize' to riscv_cpu_properties[]
  target/riscv: move 'cboz_blocksize' to riscv_cpu_properties[]
  target/riscv: remove riscv_cpu_options[]
  target/riscv/cpu.c: move 'mvendorid' to riscv_cpu_properties[]
  target/riscv/cpu.c: move 'mimpid' to riscv_cpu_properties[]
  target/riscv/cpu.c: move 'marchid' to riscv_cpu_properties[]

 target/riscv/cpu.c           | 377 +++++++++++++++++++++++------------
 target/riscv/cpu.h           |   2 +-
 target/riscv/kvm/kvm-cpu.c   | 100 ++++++----
 target/riscv/kvm/kvm_riscv.h |   1 +
 target/riscv/tcg/tcg-cpu.c   |   4 -
 5 files changed, 311 insertions(+), 173 deletions(-)

-- 
2.43.0


