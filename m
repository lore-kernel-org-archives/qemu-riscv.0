Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kyfoK-0004wL-5E
	for mharc-qemu-riscv@gnu.org; Sun, 10 Jan 2021 13:51:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1kyfoG-0004r2-Dw; Sun, 10 Jan 2021 13:51:29 -0500
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231]:41336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1kyfo9-0006ef-7k; Sun, 10 Jan 2021 13:51:28 -0500
Received: by mail-lj1-x231.google.com with SMTP id f11so1157054ljm.8;
 Sun, 10 Jan 2021 10:51:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6SemjBIwjpXuOfoEY2veCoBfp8YfJTJwjg1tzL1XKKs=;
 b=Ws3GpzGJYYZAMit5SG+lNseTPl/d8FoYbDJz3z5pPI0y8+8Jltn/OtvOpEYtkZtHRx
 CZATSzi/Squ5kkHARbvdHeMHCGpe4Zwcf17H5WmIIAH0y49wkeIKI6Qbsl2FFBSdoFdE
 RZcxE+fQDYGGlAZJMKX0w2wfOtpA3E3azmoMst98iQBlJQJgf2NwS7YAqVNGXq2Ov45m
 BCWt0j5fy5ovhVU5r6MhCVJhTB8ge+M+QQRARN8b+FlmlDSA/XV8px4ecuYCpsUsoIen
 xdRX7n+F9KY9oW27CcArRgwjOE4XpHNA/EpOq1YqL29SBcqZAGTsjReMWS2cPlO0e2W9
 jqYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6SemjBIwjpXuOfoEY2veCoBfp8YfJTJwjg1tzL1XKKs=;
 b=D3EMvNt3L32mt2OBdrMaCNQWjs4WqsIPIygvnBDzkAw21GpkxqCngsfvmh6zkIwcgK
 kuVWGd/Ebbu4bDAlGlWOgadlnaPxlY8Hcg3jPqZ0qaxnM9wIySXObflS1cOMsSO8kxss
 pJCbeLXLtXPnoEk1H2ctYuuOhOMj5y01jVGvnyy29anf9trssOnzHZqnZqrul5uBp0TB
 NTolAMIiuy0OuhBOZQOBumvyNb3+tZDQfhSsQoz+NULaOkSiMiER6Q5rzSJFLWMLJRhB
 Y2wLXm5jJJ5XyHtJiyGdBw6kxJHOKwnPF0rYPz42EbXw9wR7UXfz4ux2zOtpI4jQKHCd
 URIA==
X-Gm-Message-State: AOAM531Ej8zasopff3pJ/v2WuyReYcdIvGo5oH+uhdMXzQSJcuzUID+6
 RlVCZwKjqUeZE0g6wNWHoEk=
X-Google-Smtp-Source: ABdhPJxCHOIDEUGeaAfHffK/kLwzWDA2dpKcxq2QwQ79E1b1eJj08ZXvR7sWiNKOdJpZCahNc2LiXw==
X-Received: by 2002:a2e:8947:: with SMTP id b7mr6300703ljk.116.1610304678749; 
 Sun, 10 Jan 2021 10:51:18 -0800 (PST)
Received: from neptune.lab ([46.39.229.36])
 by smtp.googlemail.com with ESMTPSA id l1sm2795267lfk.201.2021.01.10.10.51.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jan 2021 10:51:18 -0800 (PST)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v7 0/6] RISC-V Pointer Masking implementation
Date: Sun, 10 Jan 2021 21:51:03 +0300
Message-Id: <20210110185109.29841-1-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::231;
 envelope-from=baturo.alexey@gmail.com; helo=mail-lj1-x231.google.com
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
X-List-Received-Date: Sun, 10 Jan 2021 18:51:29 -0000

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
    the ones required for hypervisor mode
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


