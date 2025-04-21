Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64732C369AB
	for <qemu-riscv@archiver.kernel.org>; Mon, 21 Apr 2025 09:47:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u6nk9-0005U4-Rb; Mon, 21 Apr 2025 05:47:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1u6nk6-0005Pk-Qe
 for qemu-riscv@nongnu.org; Mon, 21 Apr 2025 05:47:11 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1u6nk3-0000CN-UD
 for qemu-riscv@nongnu.org; Mon, 21 Apr 2025 05:47:09 -0400
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-af51596da56so2945755a12.0
 for <qemu-riscv@nongnu.org>; Mon, 21 Apr 2025 02:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1745228825; x=1745833625; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3Nad+WAcJCv81mPXXpYfzqn0f7wf5xLa/T3oOAxCWsY=;
 b=jSVVjLgKh1will015R5TGGeApglLcnofKZKSwbwnesyQNa3TY1ovmfKVFsgciedz7b
 l31XaivtoTqJyfsMJjq9nT1vapDFSLScpmH92V1+V39u/Jp9CrpcJH8Jhq7/AyglOaOo
 QBvBatQ+eqFF9/x+KauVzG7xNG2REqpMI7MLA5+pZRePNGxYzZQSyCI3tv9tfN1Y+gDK
 HwYM5EBXavpiEvgjdYkaZ22N+RKoJq1vInFwXh/YvDanGwOFYjhZ9IhaWFs3oS/h4805
 kuu37KJQR7AiJfnnZLgT+owZ95HAx1H7U+6lmcqZYaXNFJCyUf5KLTMVBHy96hbuKGPQ
 sbvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745228825; x=1745833625;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3Nad+WAcJCv81mPXXpYfzqn0f7wf5xLa/T3oOAxCWsY=;
 b=wgHa2snSiWHnzR9hXEPq9eBHg0mdwt5rq8rwr7vFUr7jJga86b7epLgA9iKzgWpGXy
 TVr+Ptwa7JcQxj3kw9DqPdJfvhiULs0E6xATv31MfTjtUGMic4mu70eOhfeLPbNK//ZD
 BRSJxEiZnx2e0f2Vbziz5mdb5E3VhwLQJELsZqyyQFrOqOz7IddL84i0TGUbyfSqwAsp
 XmbYaGbKnPiWHNwmy6+n3+iCl2a8aK+hBi8D+SOTt4Woo07AiNmm7EGn4b0mP1XpAHFh
 rZRI6zQLdmCIxA2Q8dr5JZapLumfVSXtvxZ3kmHMkcZjf5kkCcjS6Un+bpr/34FTEadV
 MIpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0dVVqrp0lOuq8UxmtQAwqn5bKG0lZ+L0RQ86y5yoDFdZaEfseu8yjIR3FlZo0nq+Bnkdkib49adVp@nongnu.org
X-Gm-Message-State: AOJu0YwHjUf08MivPPXSxWGt1sNhRiRz15LaXKBFFyiWfpz26XkLVRjN
 LgXMmgZpgm5+76xQkjsLZR5iVsIhvSn4kN1ybHGSwjDEBBoFEn1GRcgC6jlBcsQ=
X-Gm-Gg: ASbGncuLTfEJOGKwqQ4ZeFipNHlpt8CIGRrp9dYMIopM04vNGwPCtiAcZfSYuw6kQ3i
 18qRszSPCuNfoVCj55qSUrx/64sSDPvO3cQgYTFGRmCZyVxZw6G78xbbvwlwuhd2kB0KSuraSGP
 5y8YTtLX0gu1sp0OwrYggyD2GVGjHmMEjJ1tUqlHZMpLL/TGniS7tdQjOs0QG4FtqUY3DCm8rNp
 8NErn4Zu+lLgemK/3jtavtzINDWnCv5JzoqYbcKrNy2WHJ0CIUMnBfOHZyl4jvvbPFVw9QF0zV3
 IV4ZzlUgINunN3Guh7Ngc9J18TLqC32f9qLLDFN1ilmfcSzn4Aw5Up8RMFRPfzNWMbihY4aOHWo
 82q37+QpwBwFtoWY=
X-Google-Smtp-Source: AGHT+IE65yt5yqbPlVvLzXxv9cE7sEYf57l1gkwWZKLACTxA/xl2IMR3SfrU+nhruAF+5KM5efk0Rg==
X-Received: by 2002:a17:90b:2dc6:b0:2ef:114d:7bf8 with SMTP id
 98e67ed59e1d1-3087bb39b13mr14801794a91.6.1745228824854; 
 Mon, 21 Apr 2025 02:47:04 -0700 (PDT)
Received: from jchang-1875.internal.sifive.com ([147.161.192.170])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3087dee330bsm6162137a91.3.2025.04.21.02.47.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 21 Apr 2025 02:47:04 -0700 (PDT)
From: Jay Chang <jay.chang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Jay Chang <jay.chang@sifive.com>
Subject: [PATCH 0/2] Extend and configure PMP region count
Date: Mon, 21 Apr 2025 17:46:54 +0800
Message-ID: <20250421094656.48997-1-jay.chang@sifive.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=jay.chang@sifive.com; helo=mail-pg1-x534.google.com
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

The first patch extends the number of PMP regions supported up to 64,
following the RISC-V Privileged Specification (version >1.12), where
RV32 can have up to 64 PMP regions configured through 16 CSRs.

The second patch makes the PMP region count configurable via a new
CPU parameter `num-pmp-regions`. This allows platforms to adjust
the number of PMP regions without relying on a fixed default value.
If unspecified, the default remains 16 to preserve compatibility.

Jay Chang (2):
  target/riscv: Extend PMP region up to 64
  target/riscv: Make PMP region count configurable

 target/riscv/cpu.c      |  46 ++++++++++++++
 target/riscv/cpu.h      |   2 +-
 target/riscv/cpu_bits.h |  60 +++++++++++++++++++
 target/riscv/cpu_cfg.h  |   1 +
 target/riscv/csr.c      | 129 +++++++++++++++++++++++++++++++++++++++-
 target/riscv/machine.c  |   3 +-
 target/riscv/pmp.c      |  28 ++++++---
 7 files changed, 255 insertions(+), 14 deletions(-)

-- 
2.48.1


