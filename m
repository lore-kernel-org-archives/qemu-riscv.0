Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l0eLF-00014B-1U
	for mharc-qemu-riscv@gnu.org; Sat, 16 Jan 2021 00:41:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l0eLD-00013x-Pq; Sat, 16 Jan 2021 00:41:39 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:34649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l0eLB-0005OO-Qn; Sat, 16 Jan 2021 00:41:39 -0500
Received: by mail-pf1-x436.google.com with SMTP id m6so6866672pfk.1;
 Fri, 15 Jan 2021 21:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZROxoXlrun9OaOA5qjzcpat0eaMeekx5L3NbjA8Z/jE=;
 b=emtwbWxZ4QGD8V6FgGiq27g6i18uDeBcGdvJc9OVzOrjwDIWfxwoFZHELuzQubUon5
 BJbVxmlYV+Qqtq9biSeS8ktYUMN/ACc0YIfH1dXYoQE7kGArw74euj5tGs8KidG7Vd1o
 ++R62SnSwsopqFR8+HKCWx9VnmZQWYA7S3POl+AUzW/ScpKsvSNzHgHCVQKNcS4ew0xh
 T5yho4VIs3gSzMJIQW01y9Tf4YcrQmP44kZ1VE3Ewb2pEV3pp4t52eMVJvYA1w3l6FiY
 sTAVI9fOa3tR5PKk2VdgvBd93dw8xB9lRbyQH1GC00YQssJizkF++I6qgsnDGjT7Ujkh
 O7vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZROxoXlrun9OaOA5qjzcpat0eaMeekx5L3NbjA8Z/jE=;
 b=EFEbrQtk7G2UuwmT0Jv2Cmvgx1qW3i9xAS8dLgwIF2aQgH1dUe6sP5Ii/oOrrbDyEQ
 Dx1lUbOXMIf3pvsHLm6cPfLz/FJaz7NzhvzEpTbFPoX6ZFfuN21pscCfmOuhTnaoIyMR
 OTHfN5vLQk/1gDRnyW58Hfk6EUwiXdma95gZhChpQYOsO/X7NDtPT5ck58xqY2S5Qqat
 IKMQpjdMY5K3kssyLVqhg6REjZ/RFTflY+GtIilft6dDrlGK1hrikBNofLgqmQk49nVg
 qrNtt0uDCiPNsNYBCo1piM/ED5dunCEQA8/hGV/VgsZBO4hiCluOphfKw8GkUhREASUE
 68mQ==
X-Gm-Message-State: AOAM5320viDOfV8yNmK5mo6Op/GyZNYyw+u6JaLrFG3o03zsAf6koSHn
 ZgCiB5+Km6rjKGq3j+lch00=
X-Google-Smtp-Source: ABdhPJy/jW3hpUHcYmV5kwVJ8Tzn2BqmqBkbRzaL4pc5qfpy0rTs4MECHARu7NVcuBoLiQAhAKRRwg==
X-Received: by 2002:a65:4bc2:: with SMTP id p2mr16212195pgr.169.1610775695723; 
 Fri, 15 Jan 2021 21:41:35 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id v19sm9603798pjg.50.2021.01.15.21.41.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 21:41:35 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jim Wilson <jimw@sifive.com>, Alistair Francis <alistair.francis@wdc.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v2 0/2] target/riscv: Generate the GDB XML file for CSR
 registers dynamically
Date: Sat, 16 Jan 2021 13:41:21 +0800
Message-Id: <20210116054123.5457-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x436.google.com
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
X-List-Received-Date: Sat, 16 Jan 2021 05:41:40 -0000

From: Bin Meng <bin.meng@windriver.com>


At present QEMU RISC-V uses a hardcoded XML to report the feature
"org.gnu.gdb.riscv.csr" [1]. There are two major issues with the
approach being used currently:

- The XML does not specify the "regnum" field of a CSR entry, hence
  consecutive numbers are used by the remote GDB client to access
  CSRs. In QEMU we have to maintain a map table to convert the GDB
  number to the hardware number which is error prone.
- The XML contains some CSRs that QEMU does not implement at all,
  which causes an "E14" response sent to remote GDB client.

Change to generate the CSR register list dynamically, based on the
availability presented in the CSR function table. This new approach
will reflect a correct list of CSRs that QEMU actually implements.

[1] https://sourceware.org/gdb/current/onlinedocs/gdb/RISC_002dV-Features.html#RISC_002dV-Features

Changes in v2:
- rebase on top of riscv-to-apply.next branch
- drop the first 2 patches that are already applied on riscv-to-apply.next

Bin Meng (2):
  target/riscv: Generate the GDB XML file for CSR registers dynamically
  target/riscv: Remove built-in GDB XML files for CSRs

 .../targets/riscv32-linux-user.mak            |   2 +-
 default-configs/targets/riscv32-softmmu.mak   |   2 +-
 .../targets/riscv64-linux-user.mak            |   2 +-
 default-configs/targets/riscv64-softmmu.mak   |   2 +-
 target/riscv/cpu.h                            |   2 +
 target/riscv/cpu.c                            |  12 +
 target/riscv/gdbstub.c                        | 308 +++---------------
 gdb-xml/riscv-32bit-csr.xml                   | 250 --------------
 gdb-xml/riscv-64bit-csr.xml                   | 250 --------------
 9 files changed, 62 insertions(+), 768 deletions(-)
 delete mode 100644 gdb-xml/riscv-32bit-csr.xml
 delete mode 100644 gdb-xml/riscv-64bit-csr.xml

-- 
2.25.1


