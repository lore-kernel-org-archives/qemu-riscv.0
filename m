Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jyy9j-0005BG-2c
	for mharc-qemu-riscv@gnu.org; Fri, 24 Jul 2020 09:54:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <green.wan@sifive.com>)
 id 1jyuMo-0004wp-F4
 for qemu-riscv@nongnu.org; Fri, 24 Jul 2020 05:51:50 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:35901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <green.wan@sifive.com>)
 id 1jyuMl-0002om-EU
 for qemu-riscv@nongnu.org; Fri, 24 Jul 2020 05:51:50 -0400
Received: by mail-pl1-x643.google.com with SMTP id t6so4169168plo.3
 for <qemu-riscv@nongnu.org>; Fri, 24 Jul 2020 02:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=VrIzcegVqGZqnujnuKczVriGy3clDNfKz9O0N+B95RE=;
 b=FQEtZVA+RBLH50gOlUpMbaiWBAjxCw6RBMQx2IL/msW09V4t5iseNP5p5/2a0Ap9a1
 AsgNKw4YLJnH4lvlDpKgaaW4vS2FPTFGuZ25Z11L0xm6llE7NRt06txwBps4boTtxr6V
 YoE1VaKJorUW/7l5oyCx2PGPNHbzI96rdRb9a1aMARsos+HJFLSirrNScQlTRHkxhXhD
 m7qK4i/6rSMUEZr25Z80/jSe7jSNSFdPkuF/siry6v4fqHZ3Okmozdn118GlHR61sYO1
 zJWjGhMGpmN131pdmkWZDUvt3gLUCgsHhLcbSCx+HtvT3SYnEjsdMiSp+KNKxZgA4ZWd
 S1iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=VrIzcegVqGZqnujnuKczVriGy3clDNfKz9O0N+B95RE=;
 b=NB6wkqv7rSrzAPLhRHgcuxrvsMzix5Jzt6/7SQGBmbvQ+rhKiEfZBXjoKTYv+sdumI
 5CtWJ0WJi7yF05y7F/27F2Qs/VkW1LzsAHbnCzxxXzAcd7LifqVFyroiOB9na2I5zR0S
 7mWVqcTjIbfXPl8hEV91cmQJFTK4fShLyl9uL6lhx/uQH2tXNSG30ajX4UwCF0lkTtSG
 hkUYecFwY4JjEVb/u9N/pLOND72N87/EacyId32qma+L8efX8S9p9Nm4rozcw7qBn42y
 kjxn4CxnJiw2hJd6F7PKO7amny8BcLo5jmuVGlyfLehoMUquL5mPyewJElIg2U0HaFtK
 hZTQ==
X-Gm-Message-State: AOAM5330mYnmbydfqJK9gwMgt4FIQ4l5tlE2dvtWTQ7iInZcX+pTrlLF
 RZ+NrpPUqhepYw3Yfb4AIZ8BlA==
X-Google-Smtp-Source: ABdhPJxMCSqOmlCOtofSzHKyyXpsSXk19bFR/uY5dYYvtoWiiKQwXjbZ2yWN00RIn9BmU+YMsbfklQ==
X-Received: by 2002:a17:90a:f00d:: with SMTP id
 bt13mr2836578pjb.109.1595584304882; 
 Fri, 24 Jul 2020 02:51:44 -0700 (PDT)
Received: from localhost.localdomain (111-243-186-54.dynamic-ip.hinet.net.
 [111.243.186.54])
 by smtp.gmail.com with ESMTPSA id x23sm5581636pfn.4.2020.07.24.02.51.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jul 2020 02:51:44 -0700 (PDT)
From: Green Wan <green.wan@sifive.com>
To: 
Cc: bmeng.cn@gmail.com, Green Wan <green.wan@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Subject: [RFC PATCH 0/2] Add write-once and file-backed features to OTP
Date: Fri, 24 Jul 2020 17:51:10 +0800
Message-Id: <20200724095112.2615-1-green.wan@sifive.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=green.wan@sifive.com; helo=mail-pl1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 24 Jul 2020 09:54:34 -0400
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
X-List-Received-Date: Fri, 24 Jul 2020 09:51:50 -0000

Add file-backed implementation to allow users to assign an OTP image
file to machine. If '-boot otp-file=filename' is specified, OTP 
device uses otp image file instead of fuse array. In order to keep data
up-to-date due to unexpected crash or CTRL+a-x, every read/write to OTP
memory involves file open, mmap and close operation to the image file.

Add write-once feature to block second write operation to the OTP
memory. Only keep the 'written' state for non-control register range
from 0x38 to 16KB.

Tested on sifive_u for both qemu and u-boot.

Green Wan (2):
  hw/riscv: sifive_u: Add file-backed OTP. softmmu/vl: add otp-file to
    boot option
  hw/riscv: sifive_u: Add write-once protection.

 hw/riscv/sifive_u_otp.c         | 122 ++++++++++++++++++++++++++++++--
 include/hw/riscv/sifive_u_otp.h |   3 +
 qemu-options.hx                 |   3 +-
 softmmu/vl.c                    |   6 +-
 4 files changed, 128 insertions(+), 6 deletions(-)

-- 
2.17.1


