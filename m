Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6250CC021A4
	for <qemu-riscv@archiver.kernel.org>; Mon, 24 Feb 2025 12:32:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tmXcd-0004c0-BN; Mon, 24 Feb 2025 07:31:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tmXcU-0004Zu-Cw
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2025 07:31:34 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tmXcP-0007dM-BU
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2025 07:31:34 -0500
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-220c8f38febso88287385ad.2
 for <qemu-riscv@nongnu.org>; Mon, 24 Feb 2025 04:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1740400286; x=1741005086; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=x6rm4GXx6Jgr9eT+eFtgubiIgTrgStWCgWFk58qaGbM=;
 b=j5AWiz3mKxUV2Wx9OkTduKFouhPT6IZnC2C8oWQkuGzkOT6NQPnVhUMamMTT4EbK+r
 6IvUf2Sf7Yi/4XM/FqoT4yoCevqjiUfZ/gLsb/T8zoDTBfebdybOEKAhvS9KyThmrsQ6
 JQXSnZzEi9ManM5x05L7g1u0XNGu2gtpMzyH0FvuQfBi5ADht4eiDqfdCWNRnF/wVxGJ
 HjgeuczbLqd9KUzWcisbMaZvUJRH4ZZnaCDSUSXJbm0+9+aTyRTCTeMHPu8Htm5Sq8Sy
 mbtZOTRMGci1TVZotkSQvYsPAg8axb8veM9yia8znmO2hZChPJvZL10EW+w8mPuf8DR4
 hsFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740400286; x=1741005086;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=x6rm4GXx6Jgr9eT+eFtgubiIgTrgStWCgWFk58qaGbM=;
 b=RwddYlyp/9v7ehyX7n40FQpDxHyHnqnK4N8JaGbYWthukKBpFScE9DYXwwl4ocIxGG
 rC2nhbcJ+WsXD2lDjuthR76+RL51wQnuyzGvYpq5OUQ/poOp89VbXXZYBxni2zDHRq+w
 cpfUqC2B2b92ZesF9Pi6cQDTNKy+LYhEQca0/e82ojnbumsPvqCvVr7MILtfQndFupb0
 cgDrshgMzx6iohLc3NbqEFmogrcEq8YUYxDbifEek/CkPCxNLWmi39QwU/GgTeSUN9e3
 y1n1cmD+KVIhWpYxnl8JOjH2ZxdJqvTU8WoCwS1leRdiQrgs7NiJDvNPxsGkC2mpbjwZ
 yDqg==
X-Gm-Message-State: AOJu0YzKZsy+3CYR4BmmVS/yliudTw+Oqs/u8WkHthoxJnaGWh0Zaq+j
 qwQHjiLVWI5+FbphylWDqp3llfhFnDbbiDEbi0/0pfsRU+May8AJ51+53JyC/aU=
X-Gm-Gg: ASbGncty2TdW+SE2Px/yMWCotD1+naUeWMDpVdMtfTg2mxjQmiGJDHfaDwYE9S8ySjt
 Vove5ywOochvtriGGQkO7Z0DqHvsuAKvhxQvwJkyKqR3bpHEFcWxJco218JWt4ggOX9LgUIqr4D
 Pf0HU1TCf9GYLwTm3GaxDqiDnSDJSr53aBAzy2nm6q0AJUqc5wke/XGXmvNzgS9rMSkgfaHwp5R
 2te41fOr4jzEZQiHZvqdqOFN94PN/cT6J4wlozJIQpzecZIvj6UDVC6BoR1gv2LvAm6qMWTaL7c
 v5JbLvWAVyWQZ+3NdH3vchqDVQo/bA==
X-Google-Smtp-Source: AGHT+IE22EB6n6wwdAaIYvKMxxrIIqq9DSsux8dIeYX01+LdntWfNVwIRTVjRd8knGjsNonJkSlROw==
X-Received: by 2002:a05:6a21:113:b0:1ee:c7c8:ca4 with SMTP id
 adf61e73a8af0-1eef3daaa22mr26563166637.36.1740400286491; 
 Mon, 24 Feb 2025 04:31:26 -0800 (PST)
Received: from grind.. ([177.170.227.219]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73242568af8sm20554470b3a.48.2025.02.24.04.31.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2025 04:31:26 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 0/3] target/riscv/kvm: reset time changes
Date: Mon, 24 Feb 2025 09:31:17 -0300
Message-ID: <20250224123120.1644186-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

In this version I rolled back on the riscv_cpu_reset_hold() changes made
in patch 1. Peter made an argument about keeping the design the same
across architectures and I agreed. Patches 2 and 3 are already taking
care of everything that KVM needs during reset, thus this doesn't incur
in any functional changes.

Drew said it was ok to keep his ack on patch 1 so his ack is kept.

Patches based on alistair/riscv-to-apply.next. All patches acked.

Changes from v2:
- patch 1:
  - do not do an early exit in riscv_cpu_reset_hold() if kvm_enabled()
- v2 link: https://lore.kernel.org/qemu-riscv/20250221122623.495188-1-dbarboza@ventanamicro.com/


Daniel Henrique Barboza (3):
  target/riscv/cpu: remove unneeded !kvm_enabled() check
  target/riscv/kvm: add kvm_riscv_reset_regs_csr()
  target/riscv/kvm: add missing KVM CSRs

 target/riscv/kvm/kvm-cpu.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

-- 
2.48.1


