Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mIAoI-0006cv-M3
	for mharc-qemu-riscv@gnu.org; Mon, 23 Aug 2021 10:20:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changbin.du@gmail.com>)
 id 1mIAoG-0006Xp-CW; Mon, 23 Aug 2021 10:20:20 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:39691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <changbin.du@gmail.com>)
 id 1mIAoE-00031H-Q7; Mon, 23 Aug 2021 10:20:20 -0400
Received: by mail-pg1-x530.google.com with SMTP id q2so16787777pgt.6;
 Mon, 23 Aug 2021 07:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YtVdB5C8k0Qzn5lswuYfPJliMBYCJcEkDDFKWLRRXxk=;
 b=Ye8D5U6D5/t5pgn8Gw63JhzJjVgXCOEA1YSTznBGK+H2rtOL32awZ6ZuaYQK1US1/q
 Z2hrAodnKXxEsTk8bj81E+jbjsu/FRjT1BOyhKV493ZTxeCc0BXSl6oGbhGtZqV+JPUF
 5wflWMH9FSdBp5MfS0dTeLBMbTyXoLHrhvxJHV2FPhNr79PM6oqwbBgNl1h76lEz2rnl
 +WgdfkydDszopFrKzBcnKIUuUQaFvS0nwBuh/diZPLYrUaIhQCkE84Q3pq/A8KQNkMuT
 HO7tpuL6n03Yh0B9YM8O9KU9rxkAJ8u4p6B/ddrPDBfSQl5n+j4/VvAQrMncOPXoesy0
 a+bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YtVdB5C8k0Qzn5lswuYfPJliMBYCJcEkDDFKWLRRXxk=;
 b=ni78MQaAFQhEbHogcsedBITmDUf7jDhbrlqmFpuowuxaRd1p54wFVxh1iKJjYmb+wu
 E62bsDBVdvxazIE9yTCr+3C9CHny3x0Xm31E1v/MG2YxX0EI68UG3/o/Sgmk8CU9zkUI
 HytqrHkVtoUcXW6QmYKl5ELjendyFgRXYNdSqv5q6yt7XSFtxs1d7atZG7i5iaeZkSVd
 l1J2KUKYOqd/F92fvOQ9Zms9JFM4bdnwX37bRfmbMu1qaoVF06qOtLe9SJpNyFQbxxD+
 8cbFM+HMPUMNFYzeccuD331gMNRMKg+PbLQ2/Y8Vij8+AF7bLWUJUBdm2CcoTxg+yBS6
 4GrQ==
X-Gm-Message-State: AOAM531yS3kyePKZ0RQnhJlFBm8G4YPp3/FndlPSgl5nyhCtIjJWviOb
 ylkrDFqhfTlpfM4HR+G4poU=
X-Google-Smtp-Source: ABdhPJwx5C6+xoLc6Rx/A3CH5Udb3y4JB9pyG5tGPazxJZGawfLQsv049RKizHj9UDZ+PAujOJsduQ==
X-Received: by 2002:a63:a54f:: with SMTP id r15mr32298052pgu.212.1629728415703; 
 Mon, 23 Aug 2021 07:20:15 -0700 (PDT)
Received: from WRT-WX9.. ([141.164.41.4])
 by smtp.gmail.com with ESMTPSA id ev12sm4700796pjb.57.2021.08.23.07.20.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 07:20:15 -0700 (PDT)
From: Changbin Du <changbin.du@gmail.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Changbin Du <changbin.du@gmail.com>
Subject: [PATCH 0/3] gdbstub: add support for switchable endianness
Date: Mon, 23 Aug 2021 22:20:01 +0800
Message-Id: <20210823142004.17935-1-changbin.du@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=changbin.du@gmail.com; helo=mail-pg1-x530.google.com
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
X-List-Received-Date: Mon, 23 Aug 2021 14:20:21 -0000

To resolve the issue to debug switchable targets, this serias introduces
basic infrastructure for gdbstub and enable support for ARM and RISC-V
targets.

For example, now there is no problem to debug an big-enadian aarch64 target
on x86 host.

  $ qemu-system-aarch64 -gdb tcp::1234,endianness=big ...

Changbin Du (3):
  gdbstub: add basic infrastructure to support switchable endianness
  arm: gdbstub: add support for switchable endianness
  riscv: gdbstub: add support for switchable endianness

 configs/targets/aarch64-softmmu.mak |  1 +
 configs/targets/arm-softmmu.mak     |  1 +
 configs/targets/riscv32-softmmu.mak |  1 +
 configs/targets/riscv64-softmmu.mak |  1 +
 gdbstub.c                           | 11 +++++
 include/exec/gdbstub.h              | 72 +++++++++++++++++++++--------
 qemu-options.hx                     |  7 ++-
 softmmu/vl.c                        | 50 +++++++++++++++++++-
 target/arm/gdbstub.c                |  2 +-
 target/arm/gdbstub64.c              |  2 +-
 target/riscv/gdbstub.c              | 12 ++---
 11 files changed, 131 insertions(+), 29 deletions(-)

-- 
2.32.0


