Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nz9yg-0004qh-Da
	for mharc-qemu-riscv@gnu.org; Thu, 09 Jun 2022 00:41:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daolu@rivosinc.com>)
 id 1nz9yd-0004nB-Ai
 for qemu-riscv@nongnu.org; Thu, 09 Jun 2022 00:41:01 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:37787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <daolu@rivosinc.com>)
 id 1nz9yZ-00081c-V8
 for qemu-riscv@nongnu.org; Thu, 09 Jun 2022 00:40:58 -0400
Received: by mail-pf1-x42f.google.com with SMTP id bo5so20093503pfb.4
 for <qemu-riscv@nongnu.org>; Wed, 08 Jun 2022 21:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t/8m5suBi1R3jzjTjFMrS41uQao5H4WQ1lczme8ti8U=;
 b=SL2n1Ii2dsA/H/DKoKzg6IIo1bdbBfipGZ9o1hQM+heiSaf3Vk4jXueayNO4QsySNb
 HGq9WUgyr8YUSqyOL9QUM/fItHrILDFDRtgNo6SedQlnSu9YihK3NWWuFVOEWSZ05COm
 LctCGfGAExA1ioa0eb9oFcUzIaGJXZc50F+jgd3ETnEGk6XgPcdc3YzmmcsZ+6u+bGAb
 j2r3g4gHDh6dtIZshhAI2EhFVdccWiMRe050GtSChutW/7noc9zZ8TXkVfUxYgEcbodk
 iVNyfwUIpn5Qa5rdGmdp9YY0ygU4+TxYKRtdk0qEO4Dp2IiEYQgNRTfFv+QSt2XoaX/b
 QZvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t/8m5suBi1R3jzjTjFMrS41uQao5H4WQ1lczme8ti8U=;
 b=AKdZc/yTI4cho2koBLGdqckk5bPAHYpvuVdacpSaC+E6QwkD25ra5C9jsCMrdVI7F0
 YWKYFbkM8EfP3ONkvnlnNrfYurlOgLyH1c95kqj46bJ5TjsUJqv6suofcYLiLixa9ZJf
 Xc5D2kpQATJdpZHFxGjOwoWdG0RZt8DkkivcpdFMzeCAMn4VhkGbMjgQmPC3kB3QIWcU
 r4bpDdJJbJjqbMO9MSDNULj6eSCnlM1BQ11L6zgeTRhdMjfuic7gbQTzfUP9QC/2aiH7
 Q7P1Ni+c2nvD2TXQ9NLwKcOxGDQqwzCfLldKMSgGOzTMrk82yBd7000CD2xP60SCiNcN
 jL7Q==
X-Gm-Message-State: AOAM5331Mr1v+vGxEuEm7eDPATdCVU11/aDOybjIAGWshFSxQ4ZAu7hy
 kCRn0PYN3y3BWG1mpit4H9v1RQ==
X-Google-Smtp-Source: ABdhPJxev225ItuLMWWJMcDxApXTPSNDkoF9M+nuTzAQuzDxE7LRlZ0CFzhicNyUbCfxmOj5M1OsxQ==
X-Received: by 2002:a63:305:0:b0:3fc:7f18:8d7 with SMTP id
 5-20020a630305000000b003fc7f1808d7mr32771306pgd.186.1654749653050; 
 Wed, 08 Jun 2022 21:40:53 -0700 (PDT)
Received: from daolu.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 w2-20020a170902e88200b001634d581adfsm15934870plg.157.2022.06.08.21.40.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 21:40:52 -0700 (PDT)
From: Dao Lu <daolu@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Dao Lu <daolu@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PATCH v3 0/1] target/riscv: Add Zihintpause support
Date: Wed,  8 Jun 2022 21:40:44 -0700
Message-Id: <20220609044046.1903865-1-daolu@rivosinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=daolu@rivosinc.com; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 09 Jun 2022 04:41:01 -0000

This patch adds RISC-V Zihintpause support. The extension is set to be enabled
by default and opcode has been added to insn32.decode.

Added trans_pause for TCG to mainly to break reservation and exit the TB.

The change can also be found in:
https://github.com/dlu42/qemu/tree/zihintpause_support_v1

Tested along with pause support added to cpu_relax function for linux, the
changes I made to linux to test can be found here:
https://github.com/dlu42/linux/tree/pause_support_v1

--------
Changelog:

v1 -> v2
1. Pause now also exit the TB and return to main loop
2. Move the REQUIRE_ZIHINTPAUSE macro inside the trans_pause function

v2 -> v3
No changes, v2 was lost from the list

Dao Lu (1):
  Add Zihintpause support

 target/riscv/cpu.c                      |  2 ++
 target/riscv/cpu.h                      |  1 +
 target/riscv/insn32.decode              |  7 ++++++-
 target/riscv/insn_trans/trans_rvi.c.inc | 18 ++++++++++++++++++
 4 files changed, 27 insertions(+), 1 deletion(-)

-- 
2.25.1


