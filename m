Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C334ACAC597
	for <qemu-riscv@archiver.kernel.org>; Mon, 15 Sep 2025 08:42:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uy4ln-0007VB-Kr; Mon, 15 Sep 2025 04:41:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1uy4lk-0007Ur-2C
 for qemu-riscv@nongnu.org; Mon, 15 Sep 2025 04:41:04 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1uy4lb-0002OT-6B
 for qemu-riscv@nongnu.org; Mon, 15 Sep 2025 04:41:03 -0400
Received: by mail-pl1-x643.google.com with SMTP id
 d9443c01a7336-24cde6c65d1so32716405ad.3
 for <qemu-riscv@nongnu.org>; Mon, 15 Sep 2025 01:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1757925646; x=1758530446; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iih7xAbkIVwm8hs8ScdLl1IC5PFzgf682PIyp/aNopc=;
 b=bn9YJUQbIKpw6q3oNT/Luus4HhYcgGYmBWY0y+r3opN6DX6ChasmNhG/0GR+lMwvZt
 tlOk0VyDta0tLVDzuugXP6yMnkxgGOFqyLu3TCuUaj0L8tttX5f/VrWzPbPfMmMfGqtx
 kqEGp4hD4GqTpUkfqs5c3GG3QnNIiRPKETOJXEcq2ld+JNK9PBg4CeVXu5Ps638upO0k
 NBM8o2IbU8QAEw7mMxQmuhYIJOyK3bYqsHQ1EdfhCZudj9/MC9fSrj+F2n65gxzj/HW/
 CF5cFHTr0yQbdUfG39nkbvobqCTxWfqKwDPJYLoUBp7fUjrsABbdQ5vXQL8Q7D+0M5ae
 4cXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757925646; x=1758530446;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iih7xAbkIVwm8hs8ScdLl1IC5PFzgf682PIyp/aNopc=;
 b=Zkpvk54/uLl2bykyHvAmNIwvLyMxNKnOuWJed2uVk81wBIFDrmaVs8r9d1k8JAa6Pj
 KWbeYJT1ZpWoeUgjfiuzj+SgURvDKc/OUv8dOZ2jB8Mcttb23nTaq/en1La8aJAN2Kim
 L1x4NzTsMcmy1MaPJJpqnxe8AEt3V0bsM8nCJuCACPD/xSAMJQI3764/1grCZ4ygRnMA
 OByMQ5FKxlBTMzeXQ5Ms9YMqEFcYqruM/m7JYqSDKFOQK7pR4+bGmzQ38vFgpzmTcFzP
 66WPDyk3z+5t/ggpE3glfP734s0S5Kv5nEow1sTrLVsauRtV5sCp6k41SyXW6rpsOj5S
 oprA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhl1USbyCUaeXAhCBgXNfzXwQAYgSSxcC+9USPmjGk9LFJriagle79eTEZVr8HGKWfUbS/cuDc1yC5@nongnu.org
X-Gm-Message-State: AOJu0YxCSR9vOqw3VXlS7X0awA46Gh4CeKHhoR1/hYQ7AFICJwSwbnwL
 /1vbrPn7R8mG2sR1d3qHpNbBm49V9L+Mmkht0kwkb9YHiajLdBDIGBayeYYq9UYThyE=
X-Gm-Gg: ASbGnctp8LeqPbM4a+C4BHUE4G5PRhQlJy4qtj4WGHs6QE56kGIOhZqCOI/qqzowX0W
 4OQha/Vda748Zhk3ls6xmCGpWubiHQMwD6lB+obqVhDbLF+BCtjbeDRdQkOh3gzSaVEIKIUaOnD
 C/0GwTuVmG2huLqi0pNl9jp7wNv0ZRnO6qTkIuARb4QT/ESl/Hal8pno2dRaygnACzP+gvqYoOH
 WljpgVENX46kG7RdYNsT1mkmmIExKXJABhsSB6WqDifhuAo9TG1sbezMYLEekK5zzz1MSM/59D8
 ji+A4TAWMch8VNFv9W93XuM1ULZoTNiWWbPyn3HH50rfcedsT44yyOq46WzQfnAid9EghwGtRzz
 9ep6YO1zpz3MwR9ipKHABuFjBqGrDda7/vtMFOB8pIZfTr5afC17mifRRCwol1kKAgaPgKew5ZN
 pORw==
X-Google-Smtp-Source: AGHT+IF8GBKsn2E2IqWQIh9yf8BJT6AoeA++IiWEUePN6Gkc5Dd3heep8A/874CYVHPH0RbCWdip4g==
X-Received: by 2002:a17:902:ea09:b0:248:a4e2:e6d6 with SMTP id
 d9443c01a7336-25d268660d4mr128827905ad.39.1757925645542; 
 Mon, 15 Sep 2025 01:40:45 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-26295996ff6sm55852045ad.64.2025.09.15.01.40.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 01:40:45 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Max Chou <max.chou@sifive.com>
Subject: [RFC PATCH 0/8] Add Zvfbfa extension support
Date: Mon, 15 Sep 2025 16:40:28 +0800
Message-ID: <20250915084037.1816893-1-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=max.chou@sifive.com; helo=mail-pl1-x643.google.com
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

This patch series adds Zvfbfa extension support.

The isa spec of Zvfbfa extension is not ratified yet, so this patch series
is based on the latest draft of the spec (v0.1) and make the Zvfbfa extension
as an experimental extension.

The draft of the Zvfbfa isa spec:
https://github.com/aswaterman/riscv-misc/blob/main/isa/zvfbfa.adoc

Max Chou (8):
  target/riscv: Add cfg properities for Zvfbfa extensions
  target/riscv: Add the Zvfbfa extension implied rule
  target/riscv: rvv: Add new VTYPE CSR field - altfmt
  target/riscv: Use the tb->cs_bqse as the extend tb flags.
  target/riscv: Introduce altfmt into DisasContext
  target/riscv: Introduce BF16 canonical NaN for Zvfbfa extension
  target/riscv: rvv: Support Zvfbfa vector bf16 operations
  target/riscv: Expose Zvfbfa extension as an experimental cpu property

 include/exec/translation-block.h           |   1 +
 target/riscv/cpu.c                         |  15 +-
 target/riscv/cpu.h                         |   6 +-
 target/riscv/cpu_cfg_fields.h.inc          |   1 +
 target/riscv/helper.h                      |  60 ++
 target/riscv/insn_trans/trans_rvbf16.c.inc |   2 +-
 target/riscv/insn_trans/trans_rvv.c.inc    | 992 +++++++++++++--------
 target/riscv/internals.h                   |   1 +
 target/riscv/tcg/tcg-cpu.c                 |  14 +-
 target/riscv/translate.c                   |  11 +
 target/riscv/vector_helper.c               | 358 +++++++-
 11 files changed, 1064 insertions(+), 397 deletions(-)

-- 
2.43.0


