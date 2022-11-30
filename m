Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p0N7B-0003C4-Nh
	for mharc-qemu-riscv@gnu.org; Wed, 30 Nov 2022 08:27:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0N78-00036n-Lo
 for qemu-riscv@nongnu.org; Wed, 30 Nov 2022 08:27:02 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0N73-0006GG-Uv
 for qemu-riscv@nongnu.org; Wed, 30 Nov 2022 08:27:02 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 i81-20020a1c3b54000000b003d070274a61so958543wma.3
 for <qemu-riscv@nongnu.org>; Wed, 30 Nov 2022 05:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=63COJef6IAkH8xxnEAdJ5D3CnIx0YX0J2CyRLRnlx98=;
 b=t6cZ2ECp2YUMZba07nMyDNNaxEN0W33CoQ+VnlBxtdYwzBSBrvE1ACui8org9sMK70
 gwYq9hA1l8z0jDEN14x6nZcGErpa6MIBMbVPaoMwgvSlmwLkQ185bv9ataTXdxOSgafb
 limLlF1Q0NponTweN9EKAJXP5UeN37Ex+VagiAWe6Oh/h0ZKtaJrPAz1RmWNqbxw7Y05
 QJt6lkAK7I6tLRhGBfyAE0DAgVfbAoMGiPPfYEgg7SmyjIhTblCeLOyuczn9uj2wHR3U
 F16l3YFaNpCTiDknNix9HkJ2IsrKg9POOjYm4GKqa9AUIf3XX7JByaSVjHjh0kKkGYmb
 lpgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=63COJef6IAkH8xxnEAdJ5D3CnIx0YX0J2CyRLRnlx98=;
 b=duzdDlQxRN8u+hnneogDo2tUbdYtMxkHUWt3hQbEPL89Gcufh1l+5qxjXT5JuKLIbC
 U/NTkvE9ydt1WKA1pj/FZVDKCQQMLPZy+4qHhqe1q4+dMe7drkTzyBRwQ+ZVjGaup5Z+
 II3t7vy6GW1oQiup/+bwDC2lGZSSEvy41/5DOG8bKrbp8x4c9t5MPD3kyE3OHmimNO5y
 5JTdvnWn6mp1myc9M8X9tIHnTGJBeT8aIEnlVhmwaH6kqHY9GxxwQB20jXk5+Wc9KApT
 I9SOHEy+/i05PoNTyJkc65Uojhgo1PPYp7Ejduvi6Mf06IAnkkqvGo78GGKStNXeUex3
 SWfA==
X-Gm-Message-State: ANoB5pkvRWv5htF693/oBfABlmpqsYBnl/IaSZZyMzMaYnhCmejuK/58
 6XbDEFLGDmFSY6u/yK9tsFHWHg==
X-Google-Smtp-Source: AA0mqf7mHOQqv3d9aO5P0p+3/Bo/TzNuwqqqSGys6itBX9SJ+xLbmu5dP3Eec1L9Kch8vUhX+RYHWQ==
X-Received: by 2002:a05:600c:3503:b0:3cf:f0a8:d04e with SMTP id
 h3-20020a05600c350300b003cff0a8d04emr36400684wmq.45.1669814816469; 
 Wed, 30 Nov 2022 05:26:56 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 g13-20020a05600c310d00b003a2f2bb72d5sm6994144wmo.45.2022.11.30.05.26.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 30 Nov 2022 05:26:56 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, Thomas Huth <thuth@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, qemu-riscv@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, WANG Xuerui <git@xen0n.name>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-s390x@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-arm@nongnu.org
Subject: [PATCH-for-8.0 0/3] tcg: Replace tcg_target_[u]long -> [u]intptr_t
Date: Wed, 30 Nov 2022 14:26:51 +0100
Message-Id: <20221130132654.76369-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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
X-List-Received-Date: Wed, 30 Nov 2022 13:27:03 -0000

Trivial cleanup (99% mechanical) suggested by rth:
the tcg_target_[u]long type is redundant with [u]intptr_t.

Philippe Mathieu-Daudé (3):
  tcg/s390x: Fix coding style
  tcg: Replace tcg_target_long -> intptr_t
  tcg: Replace tcg_target_ulong -> uintptr_t

 accel/tcg/cputlb.c                    | 44 +++++++++----------
 accel/tcg/translate-all.c             | 12 +++---
 docs/devel/control-flow-integrity.rst |  2 +-
 include/tcg/tcg-ldst.h                | 40 ++++++++---------
 include/tcg/tcg-op.h                  | 62 +++++++++++++--------------
 include/tcg/tcg.h                     | 18 ++------
 tcg/aarch64/tcg-target.c.inc          | 16 +++----
 tcg/arm/tcg-target.c.inc              |  4 +-
 tcg/i386/tcg-target.c.inc             | 16 +++----
 tcg/loongarch64/tcg-target.c.inc      | 30 ++++++-------
 tcg/mips/tcg-target.c.inc             |  4 +-
 tcg/optimize.c                        |  8 ++--
 tcg/ppc/tcg-target.c.inc              | 16 +++----
 tcg/riscv/tcg-target.c.inc            | 18 ++++----
 tcg/s390x/tcg-target.c.inc            | 42 +++++++++---------
 tcg/sparc64/tcg-target.c.inc          | 14 +++---
 tcg/tcg-op-vec.c                      |  2 +-
 tcg/tcg-op.c                          | 16 +++----
 tcg/tcg-pool.c.inc                    | 32 +++++++-------
 tcg/tcg.c                             | 24 +++++------
 tcg/tci.c                             | 18 ++++----
 tcg/tci/tcg-target.c.inc              |  2 +-
 22 files changed, 214 insertions(+), 226 deletions(-)

-- 
2.38.1


