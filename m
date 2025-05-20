Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18ECCC3ABDD
	for <qemu-riscv@archiver.kernel.org>; Tue, 20 May 2025 17:24:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uHQgt-0000t5-DG; Tue, 20 May 2025 13:23:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uHQgs-0000sY-FV
 for qemu-riscv@nongnu.org; Tue, 20 May 2025 13:23:46 -0400
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uHQgq-000592-LS
 for qemu-riscv@nongnu.org; Tue, 20 May 2025 13:23:46 -0400
Received: by mail-vs1-xe33.google.com with SMTP id
 ada2fe7eead31-4e15013bdc5so1323446137.1
 for <qemu-riscv@nongnu.org>; Tue, 20 May 2025 10:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1747761822; x=1748366622; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=73dnwvJmpiXV1HjI7uGxuEtw4e2T+HxBZsmOkSYPJOM=;
 b=BI2CaL8sYX6d+U5cwNulcIUbnEKe2hSwHyDp8XgGiBsk3BJYFshQhlJBEXFpRI1IZn
 oVIQa0Bw5Lm4i3boJifegkrx054y32KOADcwC39Zqh0Q6k0ZHMoeVpgHeuFoZ9H339b5
 nz6eMtb9uOoxT7J9O0SIM0DX3989unQkBfMp/DKyR92qwaBf+/8HSi59lT1nFNADnYLf
 g6MQHjnw0/c9ZITyn0WgQb40Yh/j4BDltv+hE1Iwa0sQBWzwEnmCwZ1mczXiqlomLwst
 q53aucMHFKx59mu5iqlfYL2paeQsltr+hV9bSBtTZQr2ajyrp101bsxRkPTffBpFWl7Q
 WO/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747761822; x=1748366622;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=73dnwvJmpiXV1HjI7uGxuEtw4e2T+HxBZsmOkSYPJOM=;
 b=KgS5HeCYNfAvDslWnGXlcGk3JlUdHIBJRult3RRaQYhANvReWfc5jlpne/HDlIUTB5
 BKTBTXy3qHiT2iC3Dut5cDJRLIEfEIxjaVj51mC7mG0zsuftnv0aM8EY7J3nWZJ1jckQ
 tqUJkiT46oT5eIlBnfuwePvIMc5xJwTE2xvCmcNo2caLHQpts75bVyK9UQbJV7dqLrmG
 sVkeZwh9dO4FN7laB2HaFdO/St5nu6hVRKhcehzHCfNK4guzAp8CsEvImcvfasW3iNGE
 pV4gjncH8+g+UJRRQFrupgQp3NxT+W51L9sc2R7TeaGWlErRnE30q44Gru41vS62Hln+
 LCJg==
X-Gm-Message-State: AOJu0YyryIYJPMIS12SMANDQ+ipWHyafKk0Cf8ZJGzd4Lm3IihRYsKWN
 yqdV2au31Zd0YN8fpDWAfBhj3RwVW+D15VJawOzNMZjgVGTptpk00Ub9vbWcxK3b1Rw=
X-Gm-Gg: ASbGncuHjgSWNS5rsEWVqzjllpjpH2cu1jJ3aDJwmngB9p0i8VCHX2NqfgerwND4aln
 c8U6mv7vgNlipGttkEipVSXnhcTm4Sp5DjekhR7zizdSBJgkLPocXOSQE1YISu0wEoF2f5j/PFl
 bZJhbx78p3eeMuiZxtWs7Kt79AI9qH1aE+LtHXpT7c/xG8KZvy2IgmcJrIK80XGyfG09tPDbrEP
 GDWcRgTExZTHDFpEODwXLn4bceuUodIqVcZl9VUV+QiZ85u33X0+1f/VF5UBoC0o/bCf6yV/Gql
 DmClPXBCulijY2FABGHhpBQ5w2f1Nnd3ExeCyiXEK3pv3v3JdzAQNFdfrZocXBupe4gQ48T0D9B
 Mppnu
X-Google-Smtp-Source: AGHT+IEL6mMxC+l95+/5BY8TzFsAAROkiu/bNfufQsQzMxc5QaamORT6q8iPCjjdI/1sy3eXSH4hVg==
X-Received: by 2002:a05:6102:e06:b0:4e2:a29d:ecb6 with SMTP id
 ada2fe7eead31-4e2a29ded6bmr6280497137.1.1747761822549; 
 Tue, 20 May 2025 10:23:42 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([152.250.131.100])
 by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-87bec155e21sm7698107241.17.2025.05.20.10.23.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 May 2025 10:23:42 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com, ajones@ventanamicro.com,
 bjorn@kernel.org, Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 0/3] target/riscv: profile handling fixes
Date: Tue, 20 May 2025 14:23:33 -0300
Message-ID: <20250520172336.759708-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e33;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-vs1-xe33.google.com
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

The motivation of this short series is to fix a reported in [1]. A
couple of bugs were fixed along the way.

Björn, these patches should remediate the situation you're experiencing.

Patches based on master.

[1] https://lore.kernel.org/qemu-riscv/87y0usiz22.fsf@all.your.base.are.belong.to.us/

Daniel Henrique Barboza (3):
  target/riscv/tcg: restrict satp_mode changes in cpu_set_profile
  target/riscv/tcg: decouple profile enablement from user prop
  target/riscv: add profile->present flag

 target/riscv/cpu.h            |  15 ++++
 target/riscv/riscv-qmp-cmds.c |   2 +-
 target/riscv/tcg/tcg-cpu.c    | 138 +++++++++++++++++-----------------
 3 files changed, 86 insertions(+), 69 deletions(-)

-- 
2.49.0


