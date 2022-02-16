Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nKMY7-0003t5-6X
	for mharc-qemu-riscv@gnu.org; Wed, 16 Feb 2022 10:48:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christophm30@gmail.com>)
 id 1nKMXv-0003pc-I3; Wed, 16 Feb 2022 10:48:47 -0500
Received: from mail-ed1-f45.google.com ([209.85.208.45]:41954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christophm30@gmail.com>)
 id 1nKMXt-0002Cl-ER; Wed, 16 Feb 2022 10:48:47 -0500
Received: by mail-ed1-f45.google.com with SMTP id w3so4619675edu.8;
 Wed, 16 Feb 2022 07:48:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B2LvU4DARiT2QkDkCD5x8wYO9mjKLVGNZYSdk3BEnAc=;
 b=2zHseHzcOGYyUKQhV+uyBMxIpHQP4oVZBeMuRH20cRKeIbdSgC0h58WabRSPAgWUJ2
 toPhZgMeg2VIIBSkTy9n4kAZcosLWlw9Hb3mZ8/o095Y8tSUrrGDl+LHKFugQYWCdCqM
 i0trfUTEmlO5b626qDwGajJHEz4gh8MJPeIZTD/gW+fdp9dbOR8UmMyvCKSW/rYDyihk
 h1ri9PLneaBmK7hA0bdiIGoXrKotzK/9TtTTCaoS3Twi/TjA2nJTXc+i+8zzQad992s2
 AP7Q/O3v9K/ghnYwO4aCCbeT48LSfm9Sv+jhHLZHsIBoJxzzA8nG40LqX6TlGX39mMoh
 eH2w==
X-Gm-Message-State: AOAM532ExueXczjfk7ww1xgNkcYYrSHrzN+ylv5Oz3ny6FKqPHolCADH
 UzXz3RSAk1+4EuLIn3R5lUA=
X-Google-Smtp-Source: ABdhPJxGMZNjpQwgRP5rtk50wxtkxZ9RRyCz5/ecqrPItIgCx23TzwWoYS+89YFWAQKQFMNUkg9Qvw==
X-Received: by 2002:a50:d79d:0:b0:410:82a0:5d76 with SMTP id
 w29-20020a50d79d000000b0041082a05d76mr3731301edi.130.1645026523607; 
 Wed, 16 Feb 2022 07:48:43 -0800 (PST)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172])
 by smtp.gmail.com with ESMTPSA id b15sm1895570edd.60.2022.02.16.07.48.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 07:48:43 -0800 (PST)
From: Christoph Muellner <cmuellner@linux.com>
To: Atish Patra <atishp@rivosinc.com>, Anup Patel <anup@brainfault.org>,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Christoph Muellner <cmuellner@linux.com>
Subject: [PATCH v4 0/2] riscv: Add support for Zicbo[m,z,p] instructions
Date: Wed, 16 Feb 2022 16:48:37 +0100
Message-Id: <20220216154839.1024927-1-cmuellner@linux.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.208.45;
 envelope-from=christophm30@gmail.com; helo=mail-ed1-f45.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Feb 2022 15:48:47 -0000

The RISC-V base cache management operation ISA extension has been
ratified [1]. This patchset adds support for the defined instructions.

As the exception behavior of these instructions depend on the PMP
configuration, the first patch introduces a new API to probe the access
of an address range with a specified size with optional nonfaulting
behavior.

The Zicbo[m,z,p] patch should be straight-forward and has been reviewed
in previous versions of this patchset.

The series is rebsed on top of github-alistair23/riscv-to-apply.next plus
the Priv v1.12 series from github-atishp04/priv_1_12_support_v3.

[1] https://wiki.riscv.org/display/TECH/Recently+Ratified+Extensions

v4:
- Add patch to add probe_access_range_flags() interface
- Rename cbozelen -> cboz_blocksize
- Introduce cbom_blocksize
- Remove RISCV_CPU() calls from trans_*()
- Use probe_access_range_flags() to improve exception behavior

v3:
- Enable by default (like zb*)
- Rename flags Zicbo* -> zicbo* (like zb*)
- Rename ext_zicbo* -> ext_icbo* (like ext_icsr)
- Rename trans_zicbo.c.inc -> trans_rvzicbo.c.inc (like all others)
- Simplify prefetch instruction support to a single comment
- Rebase on top of github-alistair23/riscv-to-apply.next plus the
  Priv v1.12 series from github-atishp04/priv_1_12_support_v3

v2:
- Fix overlapping instruction encoding with LQ instructions
- Drop CSR related changes and rebase on Priv 1.12 patchset

Christoph Muellner (2):
  accel/tcg: Add probe_access_range_flags interface
  target/riscv: Enable Zicbo[m,z,p] instructions

 accel/tcg/cputlb.c                          | 17 +++-
 accel/tcg/user-exec.c                       | 15 +++-
 include/exec/exec-all.h                     | 24 +++++
 target/riscv/cpu.c                          |  4 +
 target/riscv/cpu.h                          |  4 +
 target/riscv/helper.h                       |  5 ++
 target/riscv/insn32.decode                  | 16 +++-
 target/riscv/insn_trans/trans_rvzicbo.c.inc | 57 ++++++++++++
 target/riscv/op_helper.c                    | 97 +++++++++++++++++++++
 target/riscv/translate.c                    |  1 +
 10 files changed, 232 insertions(+), 8 deletions(-)
 create mode 100644 target/riscv/insn_trans/trans_rvzicbo.c.inc

-- 
2.35.1


