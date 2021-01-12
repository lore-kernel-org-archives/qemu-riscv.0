Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzBfF-0000zu-PT
	for mharc-qemu-riscv@gnu.org; Mon, 11 Jan 2021 23:52:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kzBfC-0000xi-EC; Mon, 11 Jan 2021 23:52:14 -0500
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:41897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kzBfA-0001hI-5M; Mon, 11 Jan 2021 23:52:14 -0500
Received: by mail-qk1-x72e.google.com with SMTP id 19so883388qkm.8;
 Mon, 11 Jan 2021 20:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=o+drKs7Fjj3+XOK6USpNt42SKZl44x4gNsfqshr4X/w=;
 b=onEbDYEHa4Oup1WWupF9nDXZNPoiHUFIM1Nt3UvB+tihTdVmT29xs9wh3PJ49OwxB+
 Gmyup9teIRA0brU7xEU2PlP5BJmUdIZNwWIyiA8VrPXVPmA9L6sfpJIb8GT7Uewb+n6Z
 ueGb994rhz6MHcTXZ/MU1uQll9Sa7TbD3j3xC/p6zVl8AZvbv/Puw8akc+XbGQyCxrq9
 IpTANYVBJXCcyRrK0gQ2Zn5pSKRZa8K6PTx7l8Z2HekPcTRPwKdfD36mZfBy6NEDYy7U
 wXzaW3uyYDWvx5vTjWi/Gk0otMGb4h1dXNLb2D1P/5iBQ2drNhu+0yXsp0WXOrEjDxcI
 IZMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=o+drKs7Fjj3+XOK6USpNt42SKZl44x4gNsfqshr4X/w=;
 b=TsVUNeY4b8Xg6vga5Zban1yje/Gfk027QFcnpfU9KMoy7NacGYkjsX3OaN9u+okXPo
 CDxmG4xbyuf5HPu1DLGWsjFqep5LMV3S2+ryOTz7mgLaPLnQ93hHjYnjU7OtwL1WolO6
 dnrg5Dmc6pFjm3BA6kreP9U3EVJEaRkOErVaQ+7lMWYg3ivLp4epCJYnmIH/XatFhSMR
 a/VWas+njjeaxjKwIb85sgsXkWm+TLUdVHnWL8QvWK8tiRxFGATzAnA+Mkqo5rdTr/+W
 U2roRRNNQEoLj5iUKX3KWFlnNsZes/oeRSZ/CWEAtndPVBMsl+K0UrcqdH3DeJpPvsQY
 KLqA==
X-Gm-Message-State: AOAM532Q/O+quDwECgzUqWHQSA0hjF8+w/gZ+hk0WIFrWWMcD0tIMn33
 QxJHFEIhIODyr0G+PosgFRY=
X-Google-Smtp-Source: ABdhPJyNuosDUq1yOz4Ryy62B1DK40w9paXdnqs2LAWifDDRebN0YWhyU5Ot53nSHTL1ehI8A6vtGw==
X-Received: by 2002:a37:c0b:: with SMTP id 11mr2832831qkm.32.1610427130893;
 Mon, 11 Jan 2021 20:52:10 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com (unknown-124-94.windriver.com.
 [147.11.124.94])
 by smtp.gmail.com with ESMTPSA id b67sm863814qkc.44.2021.01.11.20.52.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 11 Jan 2021 20:52:10 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jim Wilson <jimw@sifive.com>, Alistair Francis <alistair.francis@wdc.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 0/4] target/riscv: Generate the GDB XML file for CSR registers
 dynamically
Date: Tue, 12 Jan 2021 12:52:00 +0800
Message-Id: <1610427124-49887-1-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x72e.google.com
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
X-List-Received-Date: Tue, 12 Jan 2021 04:52:15 -0000

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


Bin Meng (4):
  target/riscv: Make csr_ops[CSR_TABLE_SIZE] external
  target/riscv: Add CSR name in the CSR function table
  target/riscv: Generate the GDB XML file for CSR registers dynamically
  target/riscv: Remove built-in GDB XML files for CSRs

 default-configs/targets/riscv32-linux-user.mak |   2 +-
 default-configs/targets/riscv32-softmmu.mak    |   2 +-
 default-configs/targets/riscv64-linux-user.mak |   2 +-
 default-configs/targets/riscv64-softmmu.mak    |   2 +-
 target/riscv/cpu.h                             |  11 +
 target/riscv/cpu.c                             |  12 +
 target/riscv/csr.c                             | 342 ++++++++++++++++++-------
 target/riscv/gdbstub.c                         | 308 ++++------------------
 gdb-xml/riscv-32bit-csr.xml                    | 250 ------------------
 gdb-xml/riscv-64bit-csr.xml                    | 250 ------------------
 10 files changed, 320 insertions(+), 861 deletions(-)
 delete mode 100644 gdb-xml/riscv-32bit-csr.xml
 delete mode 100644 gdb-xml/riscv-64bit-csr.xml

-- 
2.7.4


