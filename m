Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mKOy0-0000uY-Po
	for mharc-qemu-riscv@gnu.org; Sun, 29 Aug 2021 13:51:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mKOxy-0000s9-IC; Sun, 29 Aug 2021 13:51:34 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:35608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mKOxw-0003L7-L9; Sun, 29 Aug 2021 13:51:34 -0400
Received: by mail-ej1-x636.google.com with SMTP id i21so26077177ejd.2;
 Sun, 29 Aug 2021 10:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tFsyR1ZM/a4IV0JjcI3Zce2929CdzFZ411s2ZRs6mW0=;
 b=FP3qnpY6pajqqV1S/o76K3xUM0S7+Ree8Hn4HMYWPQZoi7PV25H5REHdQo5XDRrR7m
 8CL2snBgYwIGitWzlVLGqnIvPm4Gkwt7lNrcqkEib5H0W1fBgUhh2S5dYJWDCMrFoN/x
 N405nvhXPoo20B8Xcno9Ej+Km2Ptrhh7VUnhrx32rXVwDyN6n3N1KyAGGhPFYxpchAoA
 U+4thUWI2BWI1LC4i8iLYx7pkuJwOlvrgCASk9IRE9Gf/bXmLzTKmeA1gSil3KinzW8H
 /TDPDh6QSIU4koBa/wH/WsJofZ/TR6sG10VphA/0IHu5S4Cx3Nim6XLeKogha/iKjFQQ
 uCcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tFsyR1ZM/a4IV0JjcI3Zce2929CdzFZ411s2ZRs6mW0=;
 b=l0kY07RjqdlmMF2TIsZ/LxjZ0aMXDmlDbkZwL2dHdbnhqkh6JGreTNNpj+t6RIrbAv
 cQ8iKxeiDIiwsCxEiqNSacPtAJQyA+exLGD37w/TMVtqSqtNUUEzHv0GOLgUxGdlkxgi
 fS5wXs7dzsHiUdDo15lCk61AOGqIEjBSdns9iS+LN+NLMvSUNl1SFOE+RonoH4HdXhsW
 tvLd/K8MNw+/FCxG/EUEGlF4o2FRP1IReW1QowAHRW0Jz2MGuEKLPPWZam1tN0qid9JQ
 9AG0rJt7xv+gyoOD0hJ1wMhug0Qzr3Mt0AjhnTwRmhLndIOSgVq+VLz0gmhzsLbvyPoY
 6rHQ==
X-Gm-Message-State: AOAM532j8mIVNeaM857xosBeVwySkEpivEMDSlWHMkDs0deMR7HIE6qx
 rxj+3w1GmXy1Ayy9fume1MY=
X-Google-Smtp-Source: ABdhPJzz2rZkR43iMdtfsy50GWa8Tl+BfIjdKT59Pp/+ObzOhmK/I/VfXnyDfblEyXH3E/bU3dckcw==
X-Received: by 2002:a17:906:c52:: with SMTP id
 t18mr20969300ejf.148.1630259490131; 
 Sun, 29 Aug 2021 10:51:30 -0700 (PDT)
Received: from neptune.lab ([46.39.229.233])
 by smtp.googlemail.com with ESMTPSA id e22sm6564361edu.35.2021.08.29.10.51.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Aug 2021 10:51:29 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v10 0/7] RISC-V Pointer Masking implementation
Date: Sun, 29 Aug 2021 20:51:13 +0300
Message-Id: <20210829175120.19413-1-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ej1-x636.google.com
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
X-List-Received-Date: Sun, 29 Aug 2021 17:51:34 -0000

v10:
Hi folks,

For this iteration I fixes some minor things Alistair mentioned in review and splitted one of patches into two:
one with preliminary CSR numbers(unfortunately there're still no final ones) and another with actual CSR implementation.

As for not raising the exception on writing into PM CSRs in wrong mode, it's expected behavior and reflected in the spec, but I agree that it's odd.

Thanks

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

 target/riscv/cpu.c                      |  33 +++
 target/riscv/cpu.h                      |  33 +++
 target/riscv/cpu_bits.h                 |  96 +++++++++
 target/riscv/csr.c                      | 276 ++++++++++++++++++++++++
 target/riscv/insn_trans/trans_rva.c.inc |   3 +
 target/riscv/insn_trans/trans_rvd.c.inc |   2 +
 target/riscv/insn_trans/trans_rvf.c.inc |   2 +
 target/riscv/insn_trans/trans_rvi.c.inc |   2 +
 target/riscv/translate.c                |  42 ++++
 9 files changed, 489 insertions(+)

-- 
2.20.1


