Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kT5xp-0008Pp-2i
	for mharc-qemu-riscv@gnu.org; Thu, 15 Oct 2020 12:18:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1kT5xn-0008NK-Dr; Thu, 15 Oct 2020 12:18:47 -0400
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:46111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1kT5xl-0005PJ-LV; Thu, 15 Oct 2020 12:18:47 -0400
Received: by mail-ej1-x641.google.com with SMTP id t25so4402297ejd.13;
 Thu, 15 Oct 2020 09:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xOi6udjgz0JwJO/WEcAmWIX4jLmkdSG7Qe4LLaXgX04=;
 b=S0drZSfN1poQ9Ol3TDXnL1YE54MFlJu5w0uXFo7XjQqBnLN4NXSqL0HMuB8WNvV9ye
 a/k9jc3SAYkXu1txnbv1s5pDhQUZWsffy80YJfe9DHVfRRxZ5psJ5vgWTYuY5b9mmJ+1
 97u8qEhUdM4Bd2Os9Q+kNNG5uWAoQ/QstFt20/bGESpf0Du5Q2XPipGVMjrqSBR0qdsq
 Cso8FCd8nelEw+Ry2P4pSravA7m/Xy6bqTOWhXmbGbCeCw06AckdMlckyYJSSxZxB7pK
 +CJGis9F2OcUJelBINr8exbf6Paw6qHlotRlJ1BJlqUrLQtZY7L7Nbi/d9GcMy6nNRxu
 HGBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xOi6udjgz0JwJO/WEcAmWIX4jLmkdSG7Qe4LLaXgX04=;
 b=FgBsXoeLMw3Slen9LoNNvdhSKF649PVg5pucNtvqfq/FVWQs4wgsrv5uQaIztRA358
 cJOuIFPGGFZhqNeWv+kEaV16jyZRhA670BRbTsITjn75YJ+L56XhnE852Oj+zepynhtA
 FfnHmeyI1HdkNVQ2nkfs9yus7X5rDNt0g6UwR6BBqNopCzvSrjTlkkdmh8Tm8TjEc0jT
 xd3/fsfd/8sHNwS0gH6Egwqh6EEZnsXr5zmHFvW7J4keOVbytMYHgKBgNw3WTy7cCqAn
 TZiAPXcFSB+PCZdOCm35UMJwE3u0QUSMscHYb8412fVbnRAeIKfbXEHMJ+OqkjXPfaMg
 yEYw==
X-Gm-Message-State: AOAM531LDIhpKcC6XaMoIP8uzN0RXzYxvGTFW6KEmoUMNLDdtXdK2T0T
 CR4GK4bY2D46+LfabJQRwxk=
X-Google-Smtp-Source: ABdhPJwAlgPa39YecEFRlumLF3FpFUvpfn74gumIUiEia748h4gG8hJi93C88apUPKU8v/P4tLnTyw==
X-Received: by 2002:a17:906:2bc5:: with SMTP id
 n5mr5180875ejg.476.1602778723426; 
 Thu, 15 Oct 2020 09:18:43 -0700 (PDT)
Received: from neptune.lab ([46.39.229.194])
 by smtp.googlemail.com with ESMTPSA id i23sm1861005eja.66.2020.10.15.09.18.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2020 09:18:41 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v2 0/5] RISC-V Pointer Masking implementation
Date: Thu, 15 Oct 2020 19:18:33 +0300
Message-Id: <20201015161833.17107-1-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ej1-x641.google.com
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
X-List-Received-Date: Thu, 15 Oct 2020 16:18:47 -0000

Hi all,

This patch series adresses comments and suggestions from v1.
I hope that I managedd to address all of them.

Thanks

Alexey Baturo (4):
  [RISCV_PM] Add J-extension into RISC-V
  [RISCV_PM] Support CSRs required for RISC-V PM extension except for
    ones in hypervisor mode
  [RISCV_PM] Print new PM CSRs in QEMU logs
  [RISCV_PM] Support pointer masking for RISC-V for i/c/f/d/a types of
    instructions

Anatoly Parshintsev (1):
  [RISCV_PM] Implement address masking functions required for RISC-V
    Pointer Masking extension

 target/riscv/cpu.c                      |  24 ++
 target/riscv/cpu.h                      |  32 +++
 target/riscv/cpu_bits.h                 |  66 ++++++
 target/riscv/csr.c                      | 277 ++++++++++++++++++++++++
 target/riscv/insn_trans/trans_rva.c.inc |   3 +
 target/riscv/insn_trans/trans_rvd.c.inc |   2 +
 target/riscv/insn_trans/trans_rvf.c.inc |   2 +
 target/riscv/insn_trans/trans_rvi.c.inc |   2 +
 target/riscv/translate.c                |  49 +++++
 9 files changed, 457 insertions(+)

-- 
2.20.1


