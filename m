Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1llxnT-0002lB-7b
	for mharc-qemu-riscv@gnu.org; Wed, 26 May 2021 13:58:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1llxnN-0002fi-73; Wed, 26 May 2021 13:58:18 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:34805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1llxnL-0006xe-DI; Wed, 26 May 2021 13:58:16 -0400
Received: by mail-ed1-x52f.google.com with SMTP id w12so2618488edx.1;
 Wed, 26 May 2021 10:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MBy0H9wE7rqO7vHBNJzDbkVZtaY9vwfIyRi9b13WtNQ=;
 b=YK3oT8Hqh9eMWJ8afjypUS6wcNMXY4ZYzkVsY159LkBi8IH5uMRIk5jBjg8J1tXb/Y
 HrLcMdXH0usH9TOrKJ6/qSvi85gcF13xxiumicspY+Yhn3GcRdVMfWtvaSVdfWtP6fei
 3e854QOL325hB2ddCWWTIP0AoJLlJSxaCEU75lQfZUTcYaP/pFJsgVHqZcT8DeeNEUlE
 9b+nquYzA08PXsYWQWfynzxirifUABXJDvBA633EgT1aPg5ymOOpMeVdTN/K2jTymmch
 m29ELtD9POqjNjWOHqwmOsj8AqrITGRrPzuwTiEqVKTxlkutHqWQnnl7HMCk98kiD7oM
 PoGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MBy0H9wE7rqO7vHBNJzDbkVZtaY9vwfIyRi9b13WtNQ=;
 b=FaDJPkRh8DFuVGelBLtlEL7ycN7CxDZEibNH1+Miu+ZKvS4IvQbRDbXHzCgAjWQrkm
 ggoevEHN/DS0znRkGVAv6HJ/v4SMUomJf0/lZvD+tb3pLvE/THCe1wNj911ARGn+v01a
 bHRQXhT9BUZFeNCFn0ndsk5clY6PZukirKq48GEYF56tTZ4ob1HQNbAiO3S6QQVSea84
 y3PPCU6GWwd0MuEtWK3Szwfxxu5JmzmG9lXgMiFwkkUuWRkC4P4eefe+L0j/U7/t75Zb
 tMfJV9Opsm1BHMHUFpRsa5uz8193WVZFwaa1KESDLrVK061gEWX2EKPGCzpRFuo8wvPf
 1QJA==
X-Gm-Message-State: AOAM530QRcbWuMIVmrIScGu42Bk6KmWnwwumCWDX+z1t7bmaq1z1pbhK
 jGJSk+202bI3S9JpO74OcSQ=
X-Google-Smtp-Source: ABdhPJyG+TM0dAk8Mfp+F6rflxZRxUbPN1RHeE37fCKR+42q/TmV8WFmVopCxOE3xXEYAsz8D0Z6IQ==
X-Received: by 2002:a05:6402:2789:: with SMTP id
 b9mr39007187ede.122.1622051892679; 
 Wed, 26 May 2021 10:58:12 -0700 (PDT)
Received: from neptune.lab ([81.200.23.112])
 by smtp.googlemail.com with ESMTPSA id hp1sm10407449ejc.96.2021.05.26.10.58.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 10:58:12 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v9 0/6] RISC-V Pointer Masking implementation
Date: Wed, 26 May 2021 20:57:42 +0300
Message-Id: <20210526175749.25709-1-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ed1-x52f.google.com
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
X-List-Received-Date: Wed, 26 May 2021 17:58:22 -0000

v9:
Hi folks,

Finaly the J-ext spec has table with preliminary CSR numbers.
Rebased and updated CSR machinery for recent changes.
Addressed Alistair's comments.

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

 target/riscv/cpu.c                      |  33 +++
 target/riscv/cpu.h                      |  34 +++
 target/riscv/cpu_bits.h                 |  93 ++++++++
 target/riscv/csr.c                      | 288 ++++++++++++++++++++++++
 target/riscv/insn_trans/trans_rva.c.inc |   3 +
 target/riscv/insn_trans/trans_rvd.c.inc |   2 +
 target/riscv/insn_trans/trans_rvf.c.inc |   2 +
 target/riscv/insn_trans/trans_rvi.c.inc |   2 +
 target/riscv/translate.c                |  42 ++++
 9 files changed, 499 insertions(+)

-- 
2.20.1


