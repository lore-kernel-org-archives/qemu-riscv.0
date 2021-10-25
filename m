Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mf3tr-0000Gg-8q
	for mharc-qemu-riscv@gnu.org; Mon, 25 Oct 2021 13:36:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mf3tZ-0008VD-0g; Mon, 25 Oct 2021 13:36:25 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:34649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mf3tU-0001rg-Lz; Mon, 25 Oct 2021 13:36:24 -0400
Received: by mail-ed1-x529.google.com with SMTP id g10so2369645edj.1;
 Mon, 25 Oct 2021 10:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/2VvYf3kELGSHPIOCQ4VcVucaPwKYuo7QF7akFllZfA=;
 b=GgfdgTKLMsb4TpIYWY5U259NHJFSgVy/FBVYCRpkOUBdIeVn219evhf55Mg8bTdLe7
 pBeqHMvswfusumbY4NFax+8XBhWvmSHKe4SuX2TcvpqhlfcNwr9nPuXgP464yTrJkV5g
 D+ZUxhWn6Nt7+T4/z06OUt0wSAcy2E+PU7nKxcpPajHua83Z7JL/FZwuuwG9sswIJIY/
 nrj/N48ETHMXGjWFMUGYTihakxB4eQlSWlrvJhYD2vReXYTFb++dAq+vGYgQPoUZXpne
 82Hj3TcCGbHGUy0+qHEDBRz4SxB2nQiD69zxYn45W4nhblZtS9tCIKwYMLd67HZvi+uT
 BiOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/2VvYf3kELGSHPIOCQ4VcVucaPwKYuo7QF7akFllZfA=;
 b=TgAHL6+KINGyeIIA6YUGS1UA7cTqNMTrwmp1KuMDslq9w26C69Zdr3cnvSLBmYzIyQ
 8QKSPRsm6vvbo9eYRImZg/RnS71zzq2vzy7c+TwsLlHvfyba3gwSleauzouINT1A1J5i
 PY7iL18ajulPjBWdFCZtXUVLp1LZCxuvaxdLllhp7mLE2Jpz9WeeiGM7wZfDZhPE/FBm
 p2765jBn+jPjmatTrtO7Co9LOD3ewlBQc4WekyWN0wyoIVJUO4BW+NvRP5b8NApLwysE
 VFpbz7EXMMqu4GGX/TvMmTLgOHNAbQcEYFfAzQ/I6VFr8RVsUkT9efvPcTa9haCq7abw
 r+zA==
X-Gm-Message-State: AOAM531WJloBvvZNJBlJbCIXgoc4UajYCuSpsGJTbdSBM/Dd+qZ/Iyw5
 qFF9hxiKnVVemAE37H+yXDk=
X-Google-Smtp-Source: ABdhPJyrD8ewpNgxKNMrToK+pVLc++FeXPi/0RkZ9AbedgjmoEUMxf6HJRE7xN/j2c0ChG1J1EMJ9w==
X-Received: by 2002:a17:906:44b:: with SMTP id
 e11mr16297860eja.146.1635183377279; 
 Mon, 25 Oct 2021 10:36:17 -0700 (PDT)
Received: from neptune.lab ([46.39.229.76])
 by smtp.googlemail.com with ESMTPSA id q14sm9718871edj.42.2021.10.25.10.36.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 10:36:16 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v17 0/8] RISC-V Pointer Masking implementation
Date: Mon, 25 Oct 2021 20:36:01 +0300
Message-Id: <20211025173609.2724490-1-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ed1-x529.google.com
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
X-List-Received-Date: Mon, 25 Oct 2021 17:36:30 -0000

v16:
Rebased against the latest tree

v15:
Renamed pm into pointer_masking in machine state.

v14:
Addressed Richard's comments from previous series.

v13:
Rebased QEMU and addressed Richard's comment.

v12:
Updated function for adjusting address with pointer masking to allocate and use temp register.

v11:
Addressed a few style issues Alistair mentioned in the previous review.

Alexey Baturo (7):
  target/riscv: Add J-extension into RISC-V
  target/riscv: Add CSR defines for RISC-V PM extension
  target/riscv: Support CSRs required for RISC-V PM extension except for
    the h-mode
  target/riscv: Add J extension state description
  target/riscv: Print new PM CSRs in QEMU logs
  target/riscv: Support pointer masking for RISC-V for i/c/f/d/a types
    of instructions
  target/riscv: Allow experimental J-ext to be turned on

Anatoly Parshintsev (1):
  target/riscv: Implement address masking functions required for RISC-V
    Pointer Masking extension

 target/riscv/cpu.c                      |  13 ++
 target/riscv/cpu.h                      |  15 ++
 target/riscv/cpu_bits.h                 |  96 ++++++++
 target/riscv/cpu_helper.c               |  18 ++
 target/riscv/csr.c                      | 285 ++++++++++++++++++++++++
 target/riscv/insn_trans/trans_rva.c.inc |   3 +
 target/riscv/insn_trans/trans_rvd.c.inc |   2 +
 target/riscv/insn_trans/trans_rvf.c.inc |   2 +
 target/riscv/insn_trans/trans_rvi.c.inc |   2 +
 target/riscv/machine.c                  |  27 +++
 target/riscv/translate.c                |  43 ++++
 11 files changed, 506 insertions(+)

-- 
2.30.2


