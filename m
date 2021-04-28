Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lbbf5-00012o-UM
	for mharc-qemu-riscv@gnu.org; Wed, 28 Apr 2021 00:18:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1lbbf5-00012e-1n; Wed, 28 Apr 2021 00:18:55 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:35528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1lbbf3-00062I-65; Wed, 28 Apr 2021 00:18:54 -0400
Received: by mail-ej1-x631.google.com with SMTP id u17so92651471ejk.2;
 Tue, 27 Apr 2021 21:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GrmLPHYpeRDGLVXBq7JGpx12BzAdRGWWpAXtkmLzF44=;
 b=py6A7KgQkSNenPmD01fS2hIGUmcZRPoG6H3jONfE2VkRXQKs27X6pmRa+g2UNHshvo
 wFly+/wEudJeZTKxKlWrFZG5KMEL6qG9ev50Bi7yxUSyN3OHeDk2gL0yhYRhMttRCcoK
 HBnYig2H0cSfI6+Mq0u3Op0PqluHIZ2qOBhXtTp+1ML6TjTuLJJvoxo5Sme8CcXCf/Wb
 xj5NiOn5kAdZDurrKvieNfXE/3KaUe/CHQbq2+hZ+LhYUo3uQE/TTLszZ7w8DmL/CN03
 dE4ZaOIprqYISKRH1zGI8UdlLA4QqNmZiqkyzemEarPztwclmFAdUbrHU4NBvw6PdWsy
 zqnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GrmLPHYpeRDGLVXBq7JGpx12BzAdRGWWpAXtkmLzF44=;
 b=OTsFR6EUr8fumpZ/M/TCOvZ2LYWdNROBQ4zjWCloM2g2itGtCEJsmO+JF51rOlyNX9
 LeqbPU2rQSH5hutTEZCLE8wFD00zZ1dmAWU0ATIP5ic88V1njV4gboOnqsls7hOrnQ2V
 TdueNLfyadZXpJI9y1OD4kR/F9G22aGVEBpyXwtjQWL0iaQ6e/l8jYWbP2NQbrWB5fPo
 Vo51lK1WHCxzfexHhMEebpPY3IL62+yIclN/lA7acxSgxMF4FFfm/IPNAqE2ojigGNDb
 pFC3Kld/3WA2NnhhcvM89cVfAh1Lev4yUsUjJKavZ5vXPGR5sNCPKdfslJ8+754xxfhI
 EXDQ==
X-Gm-Message-State: AOAM533szwLmjLzo4gbMcdFmzJ2+osaR9aOEktBr/+FewWBUD8z8mAPr
 MMow2oI9oRWe2L89WEOKwa8=
X-Google-Smtp-Source: ABdhPJwnRZ5WwOTnd6gkDNcR6HB+ewyXdFdDPp0DuDpFWThnPX1iBvSxqnph3bXmc/0g+yLAI38lPA==
X-Received: by 2002:a17:906:9146:: with SMTP id
 y6mr13500340ejw.107.1619583530971; 
 Tue, 27 Apr 2021 21:18:50 -0700 (PDT)
Received: from neptune.lab ([46.39.228.82])
 by smtp.googlemail.com with ESMTPSA id s20sm3759565edu.93.2021.04.27.21.18.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 21:18:50 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH RESEND v8 0/6] RISC-V Pointer Masking implementation
Date: Wed, 28 Apr 2021 07:18:42 +0300
Message-Id: <20210428041848.12982-1-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ej1-x631.google.com
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
X-List-Received-Date: Wed, 28 Apr 2021 04:18:55 -0000

v8-resend:
Resending to trigger recheck due to minor codestyle issues.

v8:
Hi folks,

Finally we were able to assign v0.1 draft for Pointer Masking extension for RISC-V: https://github.com/riscv/riscv-j-extension/blob/master/pointer-masking-proposal.adoc
This is supposed to be the first series of patches with initial support for PM. It obviously misses support for hypervisor mode, vector load/stores and some other features, while using temporary csr numbers(they're to be assigned by the committee a bit later).
With this patch series we were able to run a bunch of tests with HWASAN checks enabled.

I hope I've managed to addressed @Alistair's previous comments in this version.

Thanks!

v7:
Hi folks,

Sorry it took me almost 3 month to provide the reply and fixes: it was a really busy EOY.
This series contains fixed @Alistair suggestion on enabling J-ext.

As for @Richard comments:
- Indeed I've missed appending review-by to the approved commits. Now I've restored them except for the fourth commit. @Richard could you please tell if you think it's still ok to commit it as is, or should I support masking mem ops for RVV first?
- These patches don't have any support for load/store masking for RVV and RVH extensions, so no support for special load/store for Hypervisor in particular.

If this patch series would be accepted, I think my further attention would be to:
- Support pm for memory operations for RVV
- Add proper csr and support pm for memory operations for Hypervisor mode
- Support address wrapping on unaligned accesses as @Richard mentioned previously

Thanks!

Alexey Baturo (5):
  [RISCV_PM] Add J-extension into RISC-V
  [RISCV_PM] Support CSRs required for RISC-V PM extension except for
    the h-mode
  [RISCV_PM] Print new PM CSRs in QEMU logs
  [RISCV_PM] Support pointer masking for RISC-V for i/c/f/d/a types of
    instructions
  [RISCV_PM] Allow experimental J-ext to be turned on

Anatoly Parshintsev (1):
  [RISCV_PM] Implement address masking functions required for RISC-V
    Pointer Masking extension

 target/riscv/cpu.c                      |  32 ++++
 target/riscv/cpu.h                      |  34 ++++
 target/riscv/cpu_bits.h                 |  66 +++++++
 target/riscv/csr.c                      | 236 ++++++++++++++++++++++++
 target/riscv/insn_trans/trans_rva.c.inc |   3 +
 target/riscv/insn_trans/trans_rvd.c.inc |   2 +
 target/riscv/insn_trans/trans_rvf.c.inc |   2 +
 target/riscv/insn_trans/trans_rvi.c.inc |   2 +
 target/riscv/translate.c                |  42 +++++
 9 files changed, 419 insertions(+)

-- 
2.20.1


