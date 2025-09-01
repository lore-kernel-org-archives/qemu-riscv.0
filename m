Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D257CA1002
	for <qemu-riscv@archiver.kernel.org>; Mon,  1 Sep 2025 13:39:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1ut4kD-0006dM-Rp; Mon, 01 Sep 2025 09:38:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1ut4kD-0006bi-0J
 for qemu-riscv@nongnu.org; Mon, 01 Sep 2025 09:38:49 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1ut4kA-0002w8-RE
 for qemu-riscv@nongnu.org; Mon, 01 Sep 2025 09:38:48 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-24a1274cfb1so11550445ad.2
 for <qemu-riscv@nongnu.org>; Mon, 01 Sep 2025 06:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1756733924; x=1757338724; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5ZowQdyvRwHsml+bgujSkjckmEz+MBBensDiSah6jtI=;
 b=j9EfbDK/mN46zWvV0Q6TkAoflAmkjkdZVblDsk1LipJAgwGaXZzpR7NAaESg1lkPa7
 Hhhd5dI3rSt9eyLyh/K/qOYGcS+izeCjM0cWj8BIFt1QDfcElUfpkxIg2leufx1DF4lm
 wvcH4aImGcTPbAT23q3xFD0/ZFpPdQMENHKJNmZmuTOWPkWbSSsZa4m3zCKaRU1XmVTS
 qrPwkzrtLC9XWZso+LM07R3FPgIrH+yJukfhs5k9FpMuRDmmMI9m+JqeS6puQiNYYmEX
 AcgCyAKVzhBt/O46plsUFX02RHRJc5uUwLobUdvHIrBQXv2mZKm3RRrWhTqjSz2i/Vlt
 X+IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756733924; x=1757338724;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5ZowQdyvRwHsml+bgujSkjckmEz+MBBensDiSah6jtI=;
 b=n7i/XlCGK6EO8rFj/JneVdOIyh117ccy7oOD1wBhNc6BNpruEjD8tRZgC0/l9rBUQC
 BYG8IPLKKkwH7Wc9m3f2he+OyXDJylEA4w6rmCS91646rQ9YyYWfXEJUrxbjRudu4pIy
 X+E7HyZ+OsT2Mfpkgb64cuyudbscgYuC8wFcx597nyCzXUvF4pO+ZXXdOHM92EnMEbUm
 vuLs9Km5dCQcUMLoyTxMpuSH4+QEeiraiAUpHArAjX7AG2Ano8n191ZXVChHBRyCQXvd
 mhY7LNtti6G+uNXlM6wEyDbXn9dCuRQfVBQjk11KQFznIUYn/6svmC50Ofr6LbQnBe4I
 PV3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfPYwVnfPSbafG19WcX0GaTzy+XOpG/DNDyfz1Jqh0wB3iZ0Sh51yxeLfb/NBYLoL48U7vh3oUxtaP@nongnu.org
X-Gm-Message-State: AOJu0YwRZYCJutcL3S0mBXqE3xD3vNfUeJHcQzibkLKEb6eQ6Mfm0FRz
 x/N7kJHpG+Jz0OLEyBd5qm7O76OAIpG7G+KW1e4LBQTjvoz2zQy54jwjijkf4mBB8tA=
X-Gm-Gg: ASbGnctbhXs5bjqUhDtEVa+C+7rAF/koTpFn4O3bxNTCoQq8Vzc3ttvfBNbJExUTGqA
 bHFT4V2jEkEwUObeH+mt6DijKMJqmaCt8S0h8vbp7dax6agd/Q6zamE+/lxnKzXD6v/lgPfEwAG
 5nEQrRayMW9S3z/JBnAbfEAgywBmucbNaV5kMvz7SFM+N72FQqxPOyJfrvw/VRNCASxvhDHb9Mk
 AiYmBnST2cAu+Xy1ObWVvi4UzXok4CBo7FLXRibAZWp4TTCwB480bK7Jx6avhidNGQpF7cjBVuC
 57KbS+eUMba8dBwDl1xiksg4LzBqmQKlrcY6fgtHPN9tmjw/i5ZSsZiBWezC+gHwiQA2Oa1kXJm
 grwQgAv7e//gtfvkc1SOH+EsaSNOX2sO6/8XIEh0ulI+/KV/X2UGGvraHqSAfCz3TmTA=
X-Google-Smtp-Source: AGHT+IHM014xf+YvdOuscE9kzw/u9kI7adweaxblznyhxRsYxtfEyHAp+OUftFuItwH+Gljk/Khl1Q==
X-Received: by 2002:a17:903:2347:b0:24a:8e36:420a with SMTP id
 d9443c01a7336-24a8e364377mr96213125ad.40.1756733924344; 
 Mon, 01 Sep 2025 06:38:44 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24905da3bbfsm103106375ad.70.2025.09.01.06.38.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 06:38:44 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Max Chou <max.chou@sifive.com>
Subject: [RFC PATCH 0/3] Support RISC-V Zvqdotq vector dot-product extension
Date: Mon,  1 Sep 2025 21:38:12 +0800
Message-ID: <20250901133815.1693077-1-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=max.chou@sifive.com; helo=mail-pl1-x62e.google.com
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

This patch series introduces support for Zvqdotq extension.

The Zvqdotq extension's ISA specification is not yet ratified, so this
patch series is based on the latest draft (v0.0.2) and treats the
Zvqdotq extension as an experimental extension.

The draft of the Zvqdotq ISA specification:
https://github.com/riscv/riscv-dot-product

Max Chou (3):
  target/riscv: Add Zvqdotq cfg property
  target/riscv: rvv: Add Zvqdotq support
  target/riscv: Expose Zvqdotq extension as a cpu property

 target/riscv/cpu.c                            |  2 +
 target/riscv/cpu_cfg_fields.h.inc             |  1 +
 target/riscv/helper.h                         | 10 +++
 target/riscv/insn32.decode                    |  9 +++
 target/riscv/insn_trans/trans_rvzvqdotq.c.inc | 61 ++++++++++++++++++
 target/riscv/tcg/tcg-cpu.c                    |  5 ++
 target/riscv/translate.c                      |  1 +
 target/riscv/vector_helper.c                  | 63 +++++++++++++++++++
 8 files changed, 152 insertions(+)
 create mode 100644 target/riscv/insn_trans/trans_rvzvqdotq.c.inc

-- 
2.43.0


