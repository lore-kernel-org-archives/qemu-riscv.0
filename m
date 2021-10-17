Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mc9wm-0001i3-NE
	for mharc-qemu-riscv@gnu.org; Sun, 17 Oct 2021 13:27:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mc9wk-0001bU-GE; Sun, 17 Oct 2021 13:27:42 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:35357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mc9we-0003A3-Gd; Sun, 17 Oct 2021 13:27:42 -0400
Received: by mail-ed1-x52e.google.com with SMTP id w19so60910625edd.2;
 Sun, 17 Oct 2021 10:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1q81MPHl8VEG9rwjhC5Xp4RSQo0CV4Uw80gPW19sdnw=;
 b=dT14tx7lEySI5skwuBwif0NiTYTEc27YoC2g+Xku8hQyixMBNc8ec1MaihHuxc4NCS
 +oJVGG2a4FuKZGHqUlD7KHt1OTUx5/wBqiPGOfty+TPBTpeLr/7W+hCv1j/GTAdK5BvC
 fS9UkX8fe1nn5d6m/VbIjEhiptvNDTecFnNuFtBCwY3duf+nzrqb9Cwcp6qAbixTkkHf
 ptrEwcEOzUgEzd716S8rFdWZ1+VRnkJTD3G1rP4VWnqWynE7K1ZISeO12rbB3K1xl5Wo
 BOne8CwDt3VuzVyFoEOl2zQjr4LTmIeDZS6T6g6SPBZqOSeBjrybEIAgUku/pGCjKsME
 wjmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1q81MPHl8VEG9rwjhC5Xp4RSQo0CV4Uw80gPW19sdnw=;
 b=XylHsL+YwUJFhcY00g79bHJsM2D3iy0dOqUG2mjwS5p+HZba7vAmFBUqKQvBjuN2zx
 ApPDzeMVAqmrs4lns8Kkyu+3cqJFS6iHG2tMGdCcoi8QvV6I0y24JKXGwiMwckK89N0t
 mi2qVJELFlt4UWZGtYcszgYQkDzP4m4R9jpc6i78a5NBHqtK+VsvIQN+THwM5hjEIIDa
 rxdTpCsKNpGje+P3qlDiYJUMF2pj1K71cMMpxnKCgL1RczlmmnvmjRJnBSFss5CckeXH
 KoL7dIa59vvPMqaCkRGDGktK4Kfk6oBVn+/OgKwMM2u2IY0FBRGRfeh/ZrIfqmVm4n/N
 Wp/Q==
X-Gm-Message-State: AOAM530ppton3dHzFUplS8MYmf6fwT/0LMljdTr3XYU4vCtbf7bSTEiD
 9SAoFBzYZHfKxQLIGhq4O7M=
X-Google-Smtp-Source: ABdhPJzzGgTm4sRsdmQ7vtSy6hHU32d4vu1sdlJoZX3BiFVLv5cXzDEVVAfT0vJffRGomFMdmxYqtQ==
X-Received: by 2002:a17:907:7f8e:: with SMTP id
 qk14mr23827735ejc.91.1634491654516; 
 Sun, 17 Oct 2021 10:27:34 -0700 (PDT)
Received: from neptune.lab ([46.39.228.224])
 by smtp.googlemail.com with ESMTPSA id v19sm7989814ejx.26.2021.10.17.10.27.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Oct 2021 10:27:34 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v14 0/8] RISC-V Pointer Masking implementation
Date: Sun, 17 Oct 2021 20:27:20 +0300
Message-Id: <20211017172728.759687-1-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ed1-x52e.google.com
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
X-List-Received-Date: Sun, 17 Oct 2021 17:27:43 -0000

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


