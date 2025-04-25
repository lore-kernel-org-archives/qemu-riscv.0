Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B23A7C369C2
	for <qemu-riscv@archiver.kernel.org>; Fri, 25 Apr 2025 15:25:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u8Kta-0001cL-8f; Fri, 25 Apr 2025 11:23:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1u8KtZ-0001c1-6N
 for qemu-riscv@nongnu.org; Fri, 25 Apr 2025 11:23:17 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1u8KtX-0002oU-EE
 for qemu-riscv@nongnu.org; Fri, 25 Apr 2025 11:23:16 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-73bf5aa95e7so2184511b3a.1
 for <qemu-riscv@nongnu.org>; Fri, 25 Apr 2025 08:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745594593; x=1746199393; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XsIdeYda1erw7LbBUV6axRJk82z+kY+iFWtGvqMba+A=;
 b=cJFM2zlyQ8Sgso5vfrxb8uLqdH7SkwGH3bUGHpR/H3bHH7PHflvRAUZ+0WIa+kKu83
 qsyGacH+h08EDrx1RadxooUjHke7ZxsOfuxcgj9iF37vDAAfNHtWpNDV8x7Dg06v4kty
 1SMfsTW1fkePs1MzBqtQ8vmDCVdFnPiHQD9xrqfqMHtXDoxaWlx+S7TJNvLegq0yCfBv
 m2r/Zad8vpEpKWmy1E06ReMhj07zW4aGsdXoBYwlapUvypUQNFYkvZsW2T5kTG9+0H1L
 P/IOHoj6yLqrTlAQlCvJuFuJe9gQFV+U/WRILUshCdWRg2d25rrYnPymgb+UfJMBF1pp
 sAhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745594593; x=1746199393;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XsIdeYda1erw7LbBUV6axRJk82z+kY+iFWtGvqMba+A=;
 b=Hy8kbgr8mnrqc3RBV4jTCHAB47krWvqiXbr5hSxb6rpqC0TNcLPbUhWaD4e2dy5A+/
 4R1UJWVaczj7UOoHnfk2KRBoQxMLoc+jzZDDWDubSfwY9932xJHTmdKimvnQhCm4kiS4
 NtjxQynxA3k0DN4XDW6sdIVhqFxMQLCMfjAMaqXhtatdlKIeLX/4MqQ8jhpffvLayZQc
 Wvhpq6+0uqT0cT+acQoG7CAH91SZVk4nNtUT/Gp31umgOLTVuSyVQEzQ2n4REBwA93SU
 lkmZ6vLdlpdCPiiAwo6DpwJi+sd6BgcgvzE9Fdb8emOt7EfqdYCuhbdvM9tC0Gb10jgP
 AghQ==
X-Gm-Message-State: AOJu0YxnCN+TiZyS1g1V9ItxfnCCrxAtS0V5t+BWE5SiABzd/uuYzYO9
 uQTOqS4cdSUcp4XlHfljhkDhhkagDWvbBGz0MOG3GMKcupQER86OX6asB7snknGHHdvOff8fAEh
 6
X-Gm-Gg: ASbGncshIxy9Ed8StirhtEWdXGzwGgmorBmfNr6lRgVvjzLsv7UX+A8+y+byA3l9o1s
 e8vafQlv32EnjG3y6TWRERUtMwAYsVP9Dy3c/Qb7NcAf0RAaEmE5XUtkSxl9Q2joXxTYo6YJ9FK
 4XpNXxU2wJHb5HcpdFVlRK6CKyObtabDRlrl5wGut4xOEkthlxb+fJ7BUO+D11cIRdtrOcfjExw
 NSG7ERnPlRK1hUqHtznDJtmcsfb88W/1japR3TfaFgNVUmzL38WhxqD2mckSsfr/r3zTTp3aNaJ
 yDneLeNmXqnG+WtlS9dY0yidkKa/mfU0ifdC8GVjSbm4d+DTvdfg+2W70IbUkqVzc3Wq43xsikQ
 =
X-Google-Smtp-Source: AGHT+IG5v//cncY6cjtb4Wpg6QILbJyWY+jch8sq3RxRUvkqBoR7RkAm8vRtzB3aVtLMa7gplqG4QA==
X-Received: by 2002:a05:6a00:acc:b0:736:6151:c6ca with SMTP id
 d2e1a72fcca58-73fd6807122mr4010391b3a.4.1745594593121; 
 Fri, 25 Apr 2025 08:23:13 -0700 (PDT)
Received: from stoup.. (71-212-47-143.tukw.qwest.net. [71.212.47.143])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73e25a6a49esm3390466b3a.106.2025.04.25.08.23.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 08:23:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, dbarboza@ventanamicro.com
Subject: [PATCH 0/7] target/riscv: Fix write_misa vs aligned next_pc
Date: Fri, 25 Apr 2025 08:23:04 -0700
Message-ID: <20250425152311.804338-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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

As discussed, the use of GETPC() within write_misa is wrong.
I've done just enough plumbing to get the helper return address
piped down to write_misa, so that we can make use of unwind data.

AFAIK, nothing in check-tcg or check-functional would test this.
It shouldn't be too hard to write a test akin to issue1060.S,
but I'm going to leave that to someone else.


r~


Richard Henderson (7):
  target/riscv: Pass ra to riscv_csr_write_fn
  target/riscv: Pass ra to riscv_csrrw_do64
  target/riscv: Pass ra to riscv_csrrw_do128
  target/riscv: Pass ra to riscv_csrrw
  target/riscv: Pass ra to riscv_csrrw_i128
  target/riscv: Move insn_len to internals.h
  target/riscv: Fix write_misa vs aligned next_pc

 target/riscv/cpu.h       |  15 ++-
 target/riscv/internals.h |   5 +
 hw/riscv/riscv_hart.c    |   2 +-
 target/riscv/csr.c       | 278 +++++++++++++++++++++------------------
 target/riscv/op_helper.c |  13 +-
 target/riscv/translate.c |   5 -
 6 files changed, 169 insertions(+), 149 deletions(-)

-- 
2.43.0


