Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbStm-0008J8-1j
	for mharc-qemu-riscv@gnu.org; Fri, 15 Oct 2021 15:29:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mbStk-0008HI-Eo; Fri, 15 Oct 2021 15:29:44 -0400
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134]:36809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mbSth-0008NS-Do; Fri, 15 Oct 2021 15:29:44 -0400
Received: by mail-lf1-x134.google.com with SMTP id g36so29182557lfv.3;
 Fri, 15 Oct 2021 12:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=04bEthCUQPKfIsrRCyhoLnsbykv6M47szB8HVstjgJ4=;
 b=gic1ZTsfbdWf6fvu2p43+rb4XBaqHgsxkUZRd+aHejiuWuZj+LPR1XfPQSYRqgdItt
 x+lk/AXn+kOZ7pijSPZefWtnPmrMVMfbTo1bVPfNuy1sWsd3Uc0DAB+p+Xad/IH7fwJU
 XCKjZWEJRWN1l4AWLExQ7zdlIGJ5BnLaLFy6aZAMEnP2be9tw+49maE/LcaMsjwtByVm
 2+hZENcoUc4nE7fXatryNKQxSPEf0pBGvCebKRt5mm7UsRuWit1ubqJZzbiAqMdYp7H+
 3Xdmtpu85332j0yUqrpWUiTFPjDYEXOgd1zLwBSDiDb1gEiryw4ne/ZaK93BWMP2mJ6B
 NC4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=04bEthCUQPKfIsrRCyhoLnsbykv6M47szB8HVstjgJ4=;
 b=Z7QTOE0PjM0OhpJAR4IBUoHIZK7OQe6mbYvcyfzsMNnri7jrTDyHLPsl40xvJypSMl
 kgnVWYHBZ9IAzkjFQ3avnzuvZyJjxtkTU8ngjw6AJeqOZLc8DR1+U5scYPSei6+Mc7PR
 2AUSElKx2OfyrqSNLBlWA5luBknkvP7eOkT/bt3dhrWUJwvjOrOQdKUeFxRIqhqBwNDf
 TXxKDnLPhEz3dLH2Vf364wwLDS95/MmXFbDZVu9vYKvRiTDeU73K/nxGHkt0xR2gCxOh
 O31il5Z+N7IWViPIO2fV6tDvsN/DS2ifOiAugEfnSY3H/cM7mfM4TFOh6kdlFLvyuda/
 hqBA==
X-Gm-Message-State: AOAM530FuXMNbXLMhwYSen3KIPP2JuDmjuhWIYKKe7jUGDYDLSQCG4wt
 MbgBGeD4ztbhnJAapRsCtq4=
X-Google-Smtp-Source: ABdhPJxAzD6uc2crO8ppb0tCE10vOfUGWOlp8ffbcn+LYMZIQXbqNxCwYeP4xXZWN9LrYcwef8wkLw==
X-Received: by 2002:a05:651c:1024:: with SMTP id
 w4mr3491780ljm.17.1634326178481; 
 Fri, 15 Oct 2021 12:29:38 -0700 (PDT)
Received: from neptune.lab ([46.39.228.224])
 by smtp.googlemail.com with ESMTPSA id n19sm527261lfu.207.2021.10.15.12.29.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 12:29:38 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v13 0/7] RISC-V Pointer Masking implementatio
Date: Fri, 15 Oct 2021 22:29:24 +0300
Message-Id: <20211015192931.227387-1-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=baturo.alexey@gmail.com; helo=mail-lf1-x134.google.com
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
X-List-Received-Date: Fri, 15 Oct 2021 19:29:44 -0000

v13:
Rebased QEMU and addressed Richard's comment.

v12:
Updated function for adjusting address with pointer masking to allocate and use temp register.

v11:
Addressed a few style issues Alistair mentioned in the previous review.

If this patch series would be accepted, I think my further attention would be to:
- Support pm for memory operations for RVV
- Add proper csr and support pm for memory operations for Hypervisor mode
- Support address wrapping on unaligned accesses as @Richard mentioned previously

Thanks!

Alexey Baturo (6):
  [RISCV_PM] Add J-extension into RISC-V
  [RISCV_PM] Add CSR defines for RISC-V PM extension
  [RISCV_PM] Support CSRs required for RISC-V PM extension except for
    the h-mode
  [RISCV_PM] Print new PM CSRs in QEMU logs
  [RISCV_PM] Support pointer masking for RISC-V for i/c/f/d/a types of
    instructions
  [RISCV_PM] Allow experimental J-ext to be turned on

Anatoly Parshintsev (1):
  [RISCV_PM] Implement address masking functions required for RISC-V
    Pointer Masking extension

 target/riscv/cpu.c                      |  31 +++
 target/riscv/cpu.h                      |  33 +++
 target/riscv/cpu_bits.h                 |  96 ++++++++
 target/riscv/csr.c                      | 285 ++++++++++++++++++++++++
 target/riscv/insn_trans/trans_rva.c.inc |   3 +
 target/riscv/insn_trans/trans_rvd.c.inc |   2 +
 target/riscv/insn_trans/trans_rvf.c.inc |   2 +
 target/riscv/insn_trans/trans_rvi.c.inc |   2 +
 target/riscv/translate.c                |  46 ++++
 9 files changed, 500 insertions(+)

-- 
2.30.2


