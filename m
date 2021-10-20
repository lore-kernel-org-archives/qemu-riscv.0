Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1md8hQ-0003pf-Kd
	for mharc-qemu-riscv@gnu.org; Wed, 20 Oct 2021 06:19:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1md8hK-0003ad-IA; Wed, 20 Oct 2021 06:19:50 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:40878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1md8hI-0002vI-F4; Wed, 20 Oct 2021 06:19:50 -0400
Received: by mail-ed1-x530.google.com with SMTP id 5so23540121edw.7;
 Wed, 20 Oct 2021 03:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7g0itDDTe+xtO3AVn6KLaMvpY80eg7ZVZXv/91r/MG0=;
 b=P1wE+JN50B24ChDIPgBsKunUYIdRlM4KlGydDmNk94cowghyfmzsJ/VAt7mJ6q5xQ5
 Ag6+f7ju+srhNj9AdW2ulvCkQLbI9XXvQ/bbkBlBpUH2MYJYgbt10L9OdYjj2xt3CZhK
 zOk4UmMnC5uSBxJNGCA/yKlljcYbXi68msecqZ8e2aap1WcvSJZ/dzg6Psr8Fenp4aIV
 CsLl/eTTljKbRCBZ3lC8nz4w1CiDRjSfWGjHcEMD0URet4hoSOViOZ5Fs2cnK3Bl4Cei
 DHNBxC2+b3Un03bwjc/xJtEMPLYO5NwDqO05nBPLGjn1tLLQrQoHiZyF8FYeo8vR7Svv
 8NPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7g0itDDTe+xtO3AVn6KLaMvpY80eg7ZVZXv/91r/MG0=;
 b=w0LRJUG6YdRgg+cv4iMg5ftiDevAstWCDiPydxhmWfSH6mv3Ce/Y5r0hAybBQLbNgU
 QcQiLa1XbfXrh0HN8YLu49MHDzqOGwrBEbkgUf/M0ccxzq7dQBa7/cBcJlSMYVAGrb8w
 ThG/3QNDfy6dcGMx9L1OFxJv42nJIZkYVaYKNY7upo5ICAaL0po0xSwjXb3clmcnfdGj
 XkaNDDTQzHoMIhKNjHl4pBdK2StqBXLHVWNg3H33z8jgQvcNq03PvorJgJlLcexRuxH6
 TJpQCs2fIJADK9Hw+OC4evI2Qb0PFv1NULCez170Od1Zs83MI2Y3g6UhpmBH/wsdVydS
 bKOQ==
X-Gm-Message-State: AOAM531bgsi5kpgj0FfU9wNuZ+Hd0UoH89EeqSnWcHTrJ49pwknEYIRY
 SCl6HmrfVEhUtlFnNmdHqRc=
X-Google-Smtp-Source: ABdhPJwtbNmBptfJS1++CHcQAjbCzPD1H+O/A3AxF+d8MUedBf6fD18NdYLqjNZq6eW8x52OLQCTNg==
X-Received: by 2002:a50:d8cf:: with SMTP id y15mr61240746edj.66.1634725182846; 
 Wed, 20 Oct 2021 03:19:42 -0700 (PDT)
Received: from neptune.lab ([46.39.228.224])
 by smtp.googlemail.com with ESMTPSA id k19sm821284ejg.13.2021.10.20.03.19.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 03:19:42 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v15 0/8] RISC-V Pointer Masking implementation
Date: Wed, 20 Oct 2021 13:19:27 +0300
Message-Id: <20211020101935.1369682-1-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ed1-x530.google.com
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
X-List-Received-Date: Wed, 20 Oct 2021 10:19:51 -0000

v14:
Addressed Richard's comments from previous series.

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

Alexey Baturo (7):
  [RISCV_PM] Add J-extension into RISC-V
  [RISCV_PM] Add CSR defines for RISC-V PM extension
  [RISCV_PM] Support CSRs required for RISC-V PM extension except for
    the h-mode
  [RISCV_PM] Add J extension state description
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
 target/riscv/machine.c                  |  27 +++
 target/riscv/translate.c                |  43 ++++
 10 files changed, 524 insertions(+)

-- 
2.30.2


