Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nzWxp-0003Hp-62
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jun 2022 01:13:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nzWxn-0003Gu-H8
 for qemu-riscv@nongnu.org; Fri, 10 Jun 2022 01:13:39 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:39560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nzWxk-0007Zw-9S
 for qemu-riscv@nongnu.org; Fri, 10 Jun 2022 01:13:37 -0400
Received: by mail-pl1-x635.google.com with SMTP id o17so21938005pla.6
 for <qemu-riscv@nongnu.org>; Thu, 09 Jun 2022 22:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u/vrdhjyLfaKj7Nv4G7Qd5U5Uphg/2yMjXcpJTdPxfY=;
 b=SMjb/TD0Gd/romf3WBrsJnkjjoN5W9DBWPPAM8PQSh/zs7VYzJBCXTkibc5HWPAYf9
 mq07C83kd9Hp0CLPu1Qi/+Aj45KSuM2J6Pc/wORWn2tiHN+/Vb9ety/4jfWXmcyaRFYd
 /96wewUj23zqKrXJa+ITTySVIPIJaz5FQbVWE+/jrY8MB9ByBuv4iOSHyL4sR6UXPQgZ
 s+1SSQvqjYvcMfExOZ6s25eMYAv0EvrrfucNqzUsvp3N1Z/E2cbZxvk6kIaYc3c1Pm9X
 9LDdZtlZdynLu39Qi6m0rPk9W6ams7lSqIcDpuihh4koB9fpQ0/EUclv3xW4V9fElxFs
 O9Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u/vrdhjyLfaKj7Nv4G7Qd5U5Uphg/2yMjXcpJTdPxfY=;
 b=MOcBzAZbrlucdLiGHpT2R1tuEFgT77Tqm0R3M2IOnGRMker8AmaQTs2MySN5DlgRY/
 srm+OAMAtNiZ5gI/r5uEl3hHTLKQq6gsjihLK7/02TVE1EoTw+qoeL2RyJRYjWipHRDV
 mLCEUiU5BhUQ92gF90+iorhNMbfzx0xCCGBpNheuwL5JPWgiDt5FZNh/fydrkB0k6Nt+
 7WGIqUiCk+hYTPH8vJJg48GSAoysLMMdgC9PfmOWEBkg4UGVjlibBiw9EmzOIoXCR2or
 80TkIvU3vIy8uuj6ufxTvZ/49FnXPdj+RzvsHkIp0naUH+0u4ngOW30hI86D6fywna4a
 /fhQ==
X-Gm-Message-State: AOAM530xrqUYctO4zrxtjnZuvgfZkDpUTdMLbBL8Z9V7RLnCIXps1a+i
 zrzYVtsuq24wP/Sa5D9+y6Ongg==
X-Google-Smtp-Source: ABdhPJyaPEDWwc8wv9pAxrMg70sg/4ffmkphCvNVOCAhxbctUXDPftpLTK8H0vwOzkuIBle2lEW2Qw==
X-Received: by 2002:a17:902:e484:b0:164:1c:57a with SMTP id
 i4-20020a170902e48400b00164001c057amr42993105ple.12.1654838012882; 
 Thu, 09 Jun 2022 22:13:32 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 i13-20020a170902c94d00b0016362da9a03sm17853534pla.245.2022.06.09.22.13.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 22:13:32 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	Frank Chang <frank.chang@sifive.com>
Subject: [PATCH 0/9] Improve RISC-V Debug support
Date: Fri, 10 Jun 2022 13:13:17 +0800
Message-Id: <20220610051328.7078-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Fri, 10 Jun 2022 05:13:39 -0000

From: Frank Chang <frank.chang@sifive.com>

This patchset refactors RISC-V Debug support to allow more types of
triggers to be extended.

The initial support of type 6 trigger, which is similar to type 2
trigger with additional functionality, is also introduced in this
patchset.

Frank Chang (9):
  target/riscv: debug: Determine the trigger type from tdata1.type
  target/riscv: debug: Introduce build_tdata1() to build tdata1 register
    content
  target/riscv: debug: Introduce tdata1, tdata2, and tdata3 CSRs
  target/riscv: debug: Restrict the range of tselect value can be
    written
  target/riscv: debug: Introduce tinfo CSR
  target/riscv: debug: Create common trigger actions function
  target/riscv: debug: Check VU/VS modes for type 2 trigger
  target/riscv: debug: Return 0 if previous value written to tselect >=
    number of triggers
  target/riscv: debug: Add initial support of type 6 trigger

 target/riscv/cpu.h      |   7 +-
 target/riscv/cpu_bits.h |   1 +
 target/riscv/csr.c      |  10 +-
 target/riscv/debug.c    | 483 ++++++++++++++++++++++++++++++++--------
 target/riscv/debug.h    |  55 +++--
 target/riscv/machine.c  |  20 +-
 6 files changed, 445 insertions(+), 131 deletions(-)

--
2.36.1


