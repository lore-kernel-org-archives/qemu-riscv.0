Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kVVFy-000139-0S
	for mharc-qemu-riscv@gnu.org; Thu, 22 Oct 2020 03:43:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1kVVFr-00012M-6n; Thu, 22 Oct 2020 03:43:23 -0400
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142]:45203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1kVVFn-0007cF-FH; Thu, 22 Oct 2020 03:43:22 -0400
Received: by mail-lf1-x142.google.com with SMTP id r127so1003165lff.12;
 Thu, 22 Oct 2020 00:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8ARzpJg8p5t8932EqX1FVkuQXZUB7UQJa9J/tgPPydA=;
 b=nKbu9XDUOCmGOIZom/WY6fOC8ohoQi4OpdTnQ19FQG8ccPnxpEwU27SUnVuI0QE/iy
 E/aLZdEN9bJ0qg5QnZ9FrM5tZCwo0gN9xjspwSKe124ZAF+8LmDtQfolYTcySmvVHPHr
 0plpgLILP1a/43r7D4Eq6gY/tTJUi2I/J7cMCVWN3UUpsxdr4HxEMUd13yFMvxvw+wJP
 4yfAmIvvO49bCciZZMAC1MquNSeGUqYbPchUMkWolC+MWYrjktUvAwUMpYahOmJ/B9ra
 Zkpwc9Xu1wJxRPyPxTCxPcRftPuUZH1+3ftgRY52Q/SxlJMxSZyN9gJHkr6omNDHDCj/
 E+nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8ARzpJg8p5t8932EqX1FVkuQXZUB7UQJa9J/tgPPydA=;
 b=PUVnRysO/kQ4YzsoUQ5hf+LCchtzC/97xVE4sPewa338BLOxpYjAC+t2DoUFBFL/TC
 fFlAe7ey7d+rfbcypaOdyMgn63WnFA7b8xDdooaYPf3dF/P3Vv/lnny3GP8zNMUzCh1p
 9jNQl8B3oyYkBcBVanEn3VxFK/1ojm3Ko8eQyV0ZKV4Bm4hIZ14f/POe3wJQkDooUj9c
 4lcDkS8OumE3seAXOJAX9yaXrycvoVzer0oGbafZoVg9MFN0W718y4HKkR1Yu4evkxlt
 xXWKcnBXcjC0xpRMXUbWQGO0cDtvE849FvmqANAxnDrRvZM7myWrDkU7GcG0fvpK6EDf
 tAyg==
X-Gm-Message-State: AOAM533NSUGmoNTdYTEcoI1cwiTw1s/XSs3eWtafJ6vrWHIaTb1+VWQz
 vgTsMVJZ1tgSlN8Zyr5Ltks=
X-Google-Smtp-Source: ABdhPJzJl5irWc9omFz8ShfR8hjYS5zKpCR0vzTReN16P4RSTXFwSFcdg4CijNaQoaLkZxec9Auo/A==
X-Received: by 2002:a05:6512:3455:: with SMTP id
 j21mr443821lfr.135.1603352595237; 
 Thu, 22 Oct 2020 00:43:15 -0700 (PDT)
Received: from neptune.lab ([46.39.229.104])
 by smtp.googlemail.com with ESMTPSA id n19sm138887lfe.142.2020.10.22.00.43.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Oct 2020 00:43:14 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v5 0/6] RISC-V Pointer Masking implementation
Date: Thu, 22 Oct 2020 10:43:03 +0300
Message-Id: <20201022074309.3210-1-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::142;
 envelope-from=baturo.alexey@gmail.com; helo=mail-lf1-x142.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Oct 2020 07:43:27 -0000

Hi,

Addressing Alistair comment: J-ext enabling patch is now the last one in the series.

Thanks

Alexey Baturo (5):
  [RISCV_PM] Add J-extension into RISC-V
  [RISCV_PM] Support CSRs required for RISC-V PM extension except for
    ones in hypervisor mode
  [RISCV_PM] Print new PM CSRs in QEMU logs
  [RISCV_PM] Support pointer masking for RISC-V for i/c/f/d/a types of
    instructions
  [RISCV_PM] Allow experimental J-ext to be turned on

Anatoly Parshintsev (1):
  [RISCV_PM] Implement address masking functions required for RISC-V
    Pointer Masking extension

 target/riscv/cpu.c                      |  30 +++
 target/riscv/cpu.h                      |  33 +++
 target/riscv/cpu_bits.h                 |  66 ++++++
 target/riscv/csr.c                      | 271 ++++++++++++++++++++++++
 target/riscv/insn_trans/trans_rva.c.inc |   3 +
 target/riscv/insn_trans/trans_rvd.c.inc |   2 +
 target/riscv/insn_trans/trans_rvf.c.inc |   2 +
 target/riscv/insn_trans/trans_rvi.c.inc |   2 +
 target/riscv/translate.c                |  44 ++++
 9 files changed, 453 insertions(+)

-- 
2.20.1


