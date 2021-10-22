Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdz8Y-0007tT-Qr
	for mharc-qemu-riscv@gnu.org; Fri, 22 Oct 2021 14:19:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mdz8Y-0007rQ-0K; Fri, 22 Oct 2021 14:19:26 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:40535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mdz8V-0004mw-Pm; Fri, 22 Oct 2021 14:19:25 -0400
Received: by mail-ed1-x52a.google.com with SMTP id 5so1364441edw.7;
 Fri, 22 Oct 2021 11:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lHzgEXG3/YD3WW4mJQBxXeuz75UcEcN3M9kHi1eeONw=;
 b=BjuTm+rZem546rE5CQfOJbfiO+g2q2sNpZZUvfsnE8MiKQLp8x0Hg3D8PnDVGqqtXj
 Gt2pR8S+K8foLd0LCDWDJnHEEWG2ycVibKlD2ZG2+CtFEqA6b4fZgi/6gsR4m/P1kOzI
 fQ/iquQX8VxsncWkc2OTzIKCbciQ+BYzTfE0iqA2PSFd+Jna+e7GG1jIMBuQKok7WnMl
 y7r+h4vmOlqm0B9Ble+f8oH2EeFE5t4+wzupgL6LNNWIIHUTXy/HMExycw9rkHuSxxxz
 elw/0WhQyuiRUtxXjnWI3SvNpkmEhqiIMTdg2VL95DE0yMuKqy9gK9sT+gZQZo4RJCu+
 MEbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lHzgEXG3/YD3WW4mJQBxXeuz75UcEcN3M9kHi1eeONw=;
 b=tcUcsRQ3nLzeSvwFrWb1our2r0CRQKXe10tu2gc9MEVuC/jGB9kNl3ocz1LTaXiuHU
 01CeE44ma4SstCIxRSba7lj25+pDChL9Au4/OfNF7cbSZoy5B36DVGPbUyrlc78Lo+Eb
 VZTuzfYYRwt149Zh9Frj+VWvC3RtMWpDckAY5Dwgq9TakQQYSOrNr5zJFhzTJYMsXQPN
 N0q+RZKtT3M2DBLtaZnZGWrq+rJpvvjtb5tI+X8mYQxMFGKSiJm+3UyULeBXbtJR6HQy
 nx8iTeY74cCn/7vfXyB1Cc6sj7TqM3oxs6SkX0ytSUwMVifyRbxwu5qjkxsy40CghayP
 2GRQ==
X-Gm-Message-State: AOAM531tOvqSetoiqTbhtUa+CQS658kcxv43YFkMJtLSXoladzOnP+Eb
 UX4oFOlSIk8XKZhq6PctxRk=
X-Google-Smtp-Source: ABdhPJxTV9dJ0JdL33tFZY6CDqP37R4VtXcihgmGMMi3QaDHRnAKj8GrR5Z29e3W/skTqmSXqoiSmQ==
X-Received: by 2002:a50:da0a:: with SMTP id z10mr1960341edj.95.1634926760606; 
 Fri, 22 Oct 2021 11:19:20 -0700 (PDT)
Received: from neptune.lab ([46.39.229.76])
 by smtp.googlemail.com with ESMTPSA id p22sm4233079ejl.90.2021.10.22.11.19.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Oct 2021 11:19:20 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v16 0/8] RISC-V Pointer Masking implementation
Date: Fri, 22 Oct 2021 21:19:02 +0300
Message-Id: <20211022181910.1999197-1-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ed1-x52a.google.com
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
X-List-Received-Date: Fri, 22 Oct 2021 18:19:26 -0000

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


