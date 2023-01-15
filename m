Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pH5XQ-0003v0-Jm
	for mharc-qemu-riscv@gnu.org; Sun, 15 Jan 2023 11:07:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pH5XH-0003tk-6G
 for qemu-riscv@nongnu.org; Sun, 15 Jan 2023 11:07:08 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pH5XD-0002ks-Da
 for qemu-riscv@nongnu.org; Sun, 15 Jan 2023 11:07:06 -0500
Received: by mail-pf1-x42c.google.com with SMTP id w2so3959158pfc.11
 for <qemu-riscv@nongnu.org>; Sun, 15 Jan 2023 08:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GZTFHxNlAhNRHDbBvjazOuY2CHtPtEz62uheZE/u1Xc=;
 b=EJcatYdOLfY+WlTy6Cmxm4tivhdP4s9IgPDXWZi7S89mmohLtbgEO1T4mXXse1llW6
 2tJR0DPvCEha7PDUSGRAztMGVAdx9lGsGL7Fjiu9kGL0g2vV83IeST49SndffxtyO2II
 G6FVQz4iYFnEa8YSldbaOr2fFagepzj0xUTvcHlEfQr8YcpdEgkUxrgpPZtd6e3nzgPW
 dbnZxDs4GniRq1WPa7xF9ToaOiqXQX8ge03Y6ukAJkSdQCH9Pma0JgRXoxlqWfuLCNvv
 +ae3Ju21UKwbmWAmInZ+xPeBbGnNNQjH6trGXcO0CZ+tJMGUJLR+By7ohdxtqKJ3//cN
 252A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GZTFHxNlAhNRHDbBvjazOuY2CHtPtEz62uheZE/u1Xc=;
 b=xgyttzuR+bDgVJJhpTzXVIkiw+5ZZBq5gdEJbCEGytEHXkK+xY5pM2MFpHDylAPfGk
 kFi2sqK/zatVHY0fVwbRUeynq5Gh7LukQTdC4NCg87qOj9sf4Q6GLyAsxSHcxwUrJaDG
 GKGiNBuW8GyHnvslwYnzYs9LPTgtS2Iwp0BB7lWzwHx7tv6J/BXO9RE7c6kek+gynbLQ
 8UFIqhjYX6vQP3DQ32z4/4fzTIOERfEv2ZgcHxztO8hliljxZdYLYiTQNDf1uY/X01hz
 du9CfV7uRol5N9aMPjjekiEBmVsPhCTJjkonO/E1fD7kytZCx4TxdcckCYd2jEbXvDYT
 yOXw==
X-Gm-Message-State: AFqh2konXyAXCoJQHu1WjqWevF/OTNJp9PeCEZj2YPNowg81U4GBRZf4
 SDemiEj53bxDu46mVvlCkB4P/Q==
X-Google-Smtp-Source: AMrXdXt1JiQNS04IGj+F/FyZyK57Ko3hRxGIC3Hm/2aWvMrY+3ktQx5h8CWp8rEXSmRSYVRg0iesTA==
X-Received: by 2002:a05:6a00:1d95:b0:58d:aac3:a8cb with SMTP id
 z21-20020a056a001d9500b0058daac3a8cbmr633460pfw.0.1673798821246; 
 Sun, 15 Jan 2023 08:07:01 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 c76-20020a624e4f000000b00589c467ed88sm11422735pfb.69.2023.01.15.08.06.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Jan 2023 08:07:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bin.meng@windriver.com,
 abdulras@google.com
Subject: [PATCH 0/2] target/riscv: Fix double calls to gen_set_rm [#1411]
Date: Sun, 15 Jan 2023 06:06:55 -1000
Message-Id: <20230115160657.3169274-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
X-List-Received-Date: Sun, 15 Jan 2023 16:07:11 -0000

These double calls tickle an assertion in decode_save_opc,
and isn't efficient anyway.  Introduce a new helper to do
exactly what was desired.


r~


Richard Henderson (2):
  target/arm: Introduce helper_set_rounding_mode_chkfrm
  target/riscv: Remove helper_set_rod_rounding_mode

 target/riscv/helper.h                   |  2 +-
 target/riscv/fpu_helper.c               | 36 +++++++++++++++++++++++--
 target/riscv/translate.c                | 21 ++++++++++++---
 target/riscv/insn_trans/trans_rvv.c.inc | 24 +++--------------
 4 files changed, 57 insertions(+), 26 deletions(-)

-- 
2.34.1


