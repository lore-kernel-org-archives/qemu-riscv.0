Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kTXx8-000361-DN
	for mharc-qemu-riscv@gnu.org; Fri, 16 Oct 2020 18:12:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1kTXx4-00034N-Jm; Fri, 16 Oct 2020 18:11:54 -0400
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144]:35498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1kTXwy-0004GO-8m; Fri, 16 Oct 2020 18:11:51 -0400
Received: by mail-lf1-x144.google.com with SMTP id 77so5065399lfl.2;
 Fri, 16 Oct 2020 15:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=THF7FWhjYVDTkO5fO/fdIAKdtpkLYhfyetBbNjSmlW4=;
 b=I8SUAPgT0/PmvU9yiYoRbwywu/P3hiLXz6mXykLMuPkFMimJPzMvD/Bq+HoLeBp5yR
 dechzXki0gXX8BXKrYU7/iLswphEMnIgVltQXrX8LQ9ygmvWUGR+DDcpaccLCHIueTjY
 /LTI9aXS7l70nup5D1N1rgZp/pZtE/gLM/D1n3lo5si9nGQzNs0IlM6gPHOmlkaABAhE
 Tv0avloCsv5WgsJzxqx2bs2YKiYR51s6XScBk0u+1TQ9cLseEhPpyZSoyJgf/81YctBq
 hHO6WTBjIk1HMDZLEj4pw7I1CUYLcjtyYReVjYwrmWAg6vjmt8f8Dkjfo4ZiDOvaF3AP
 Pxqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=THF7FWhjYVDTkO5fO/fdIAKdtpkLYhfyetBbNjSmlW4=;
 b=g+5d4hguKJORG8sE+9oa8foyJM/uZzxF+reM+LyCQ9c1wr23Js+TTR6fEgLywEalzv
 FXAWMAHee0ez1W/aBED4Lsb+sMDFfHNODt2BtEale9/KFSmWGKOrt2DOArLVOQrvUxRq
 gLQgRQP4NPpQou78p5FZ341KyVPdjHf29MfQJzSNMk2MzkK0KEON51OCsHXT0QRgLRUz
 Ha5gSF4+aN010c+vkHjxL+FQ8CrnD7XXY41Waex/KTCCjP6cVdg5p12/XVMMf45YJeXt
 0un2ltRPGu0c8FR0vi9/lDkRZ/XxqtRMDm82t8MOwiKCyIXs6oaAmm9rgBVFUCBgqs2c
 K9NQ==
X-Gm-Message-State: AOAM5317gK6o0IaGdwbPPlSLpaJVstMhGbNCRBFWNOkPS2em4gxnSmKs
 Ff4Z+5719goZNlm+CteH2V0=
X-Google-Smtp-Source: ABdhPJzk0LlVouqYVefXllv01hS+mtONG3FguF/hKCKSnqfe2/+ilZMJs0+jZHJQqF4Equs4kGH1CA==
X-Received: by 2002:a05:6512:360e:: with SMTP id
 f14mr2097481lfs.44.1602886304601; 
 Fri, 16 Oct 2020 15:11:44 -0700 (PDT)
Received: from neptune.lab ([46.39.229.194])
 by smtp.googlemail.com with ESMTPSA id d6sm1303010lja.63.2020.10.16.15.11.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 15:11:43 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v3 0/5] RISC-V Pointer Masking implementation
Date: Sat, 17 Oct 2020 01:11:32 +0300
Message-Id: <20201016221138.10371-1-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::144;
 envelope-from=baturo.alexey@gmail.com; helo=mail-lf1-x144.google.com
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
X-List-Received-Date: Fri, 16 Oct 2020 22:11:55 -0000

Hi folks,

This is third iteration of patches to support Pointer Masking for RISC-V.
Most of suggestions have been addressed, however some of them not:
- applying mask for return value while reading PM CSR has been kept to mask higher priv level bits
- check_pm_current_disabled is not placed into CSR predicate, since the spec expects to read zero from PM CSR if no PM extenstion is present

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

 target/riscv/cpu.c                      |  24 +++
 target/riscv/cpu.h                      |  32 +++
 target/riscv/cpu_bits.h                 |  66 ++++++
 target/riscv/csr.c                      | 264 ++++++++++++++++++++++++
 target/riscv/insn_trans/trans_rva.c.inc |   3 +
 target/riscv/insn_trans/trans_rvd.c.inc |   2 +
 target/riscv/insn_trans/trans_rvf.c.inc |   2 +
 target/riscv/insn_trans/trans_rvi.c.inc |   2 +
 target/riscv/translate.c                |  44 ++++
 9 files changed, 439 insertions(+)

-- 
2.20.1


