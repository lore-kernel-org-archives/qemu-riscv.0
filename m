Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kVVac-00087b-7r
	for mharc-qemu-riscv@gnu.org; Thu, 22 Oct 2020 04:04:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1kVVaY-000870-V1; Thu, 22 Oct 2020 04:04:46 -0400
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144]:37059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1kVVaX-0006su-7U; Thu, 22 Oct 2020 04:04:46 -0400
Received: by mail-lf1-x144.google.com with SMTP id j30so1110745lfp.4;
 Thu, 22 Oct 2020 01:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Z+NfY8aVGlMJqARH9WMsBcDgAzwTThmmJiicXC1vCYc=;
 b=lPRtHXprLgs5b2jHZB63A6gL8DrSmScND3YuORQmgmNMIxonKzkAw4EwWTc1Wwn2hp
 U93X6Z3gAu2vxhyUyWxRRLNx39XCIh72vtjVJMizqfk7co0aSybK/cIyogrKKHO9gig8
 1fZFfejLIe8rLVT0XDn/eVGUpgZa0UZ8R+O15M2cmcJZ8FFMrPeks9KC+XU+EJ47Tj1f
 Ah3EBzq9PKZ3hDxzh6OQqoKtn26w7u4qwgexWWDbIdZslhdej+SwZhF61Z6ZPUtwgJNo
 lRT5LhcvYH1KKdekDSZt0pJ09yJSnGSn29/N4L1aZr+Oehgli7HuxNs9p8dQRgF0ItUk
 t7kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Z+NfY8aVGlMJqARH9WMsBcDgAzwTThmmJiicXC1vCYc=;
 b=PuwnDQmxOV44M/thADQegvOCpAQlhsJ/1tJNM9bkk17eHssJ8NXWC1J8ljC9h5emAh
 wd2FXqQzdxqrkh9dm1ob/wjMdueNerkGwcz4ZjiK2YqmSpZkmphrKdwLNkgkBm3ayiYa
 c4Xc1O8eHSndO9KzO/rE5ZEmv2r7qUY3yU/uuylUZS9f6LAdJgGIDT4ZRXMTY6DKVKAG
 egNtn6lEfKkD7KHsUeJLF9DiURpEnxmcxv1nFSIVrhljFdmCNJajmEabHAb5P9K5o0AS
 NgtEfZwwlpwGZzwSR593JGQSRQAVtHWE8xKGlzHf4WcrMLyVTuqQDyzFKvU+2OzMBwn5
 Ldxw==
X-Gm-Message-State: AOAM533jxel1x55fYiW9a/3CsyfHvsz7fSLMqtkCdG6eBuvd//Oi5P4E
 3pzy5c7x1QF0ik2jgLFH5S4=
X-Google-Smtp-Source: ABdhPJyLoVe5DQvoS0R+NmcNxo1HiDjPYyY/tY/HQ3uP3qcu+oefCJZmmqCsdDAe8ZnEpJtEOfUUaQ==
X-Received: by 2002:a19:4c45:: with SMTP id z66mr404030lfa.168.1603353882964; 
 Thu, 22 Oct 2020 01:04:42 -0700 (PDT)
Received: from neptune.lab ([46.39.229.104])
 by smtp.googlemail.com with ESMTPSA id l8sm143682lfk.203.2020.10.22.01.04.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Oct 2020 01:04:42 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v6 0/6] RISC-V Pointer Masking implementation
Date: Thu, 22 Oct 2020 11:04:34 +0300
Message-Id: <20201022080440.10069-1-space.monkey.delivers@gmail.com>
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
X-List-Received-Date: Thu, 22 Oct 2020 08:04:48 -0000

Hi,

Added missing sign-off on the first patch.

Thanks

Alexey Baturo (5):
  [RISCV_PM] Add J-extension into RISC-V
  [RISCV_PM] Support CSRs required for RISC-V PM extension except for
    ones in hypervisor mode
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


