Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nPyUc-0002gd-53
	for mharc-qemu-riscv@gnu.org; Thu, 03 Mar 2022 22:20:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nPyUa-0002di-FQ
 for qemu-riscv@nongnu.org; Thu, 03 Mar 2022 22:20:32 -0500
Received: from [2607:f8b0:4864:20::236] (port=39779
 helo=mail-oi1-x236.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nPyUY-0001wg-8R
 for qemu-riscv@nongnu.org; Thu, 03 Mar 2022 22:20:32 -0500
Received: by mail-oi1-x236.google.com with SMTP id q5so6708078oij.6
 for <qemu-riscv@nongnu.org>; Thu, 03 Mar 2022 19:20:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e/27IOWraZjV9GMKoYulTmDrLr1cU7t1LiwpTba4cwE=;
 b=aBfHHjW8EdB3tdZnlllyFbaZ+bMGAcMyrxZxy6aB+GZ89o5e3SOa7cjAphWv59gw7t
 NbBO9z3qMUztLYri9dO0JwzfJLM/Yd3XAq0pllTgMPgxjbVBcV0SZiU3tVAPfcPkpgw3
 xXHSX0+vhqVUCpRDj1Gvx/2smVSmocfe44mHJ786E9RmHEzLuJP5Dj2f9Vrd185gkkk6
 +aXkuisLKm+vxUDsfWTXYZjOLXyKDIJEXEdrhHE5WvpX6uBD+Xub8Q/p5VFsCMdsLZOK
 4H2fV1hh/s3eAtXqXjBZAcsR1ocZD4Xa05lMmS0DL3qNjx18G/iOutnNBy3cwdc9tWVy
 IYmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e/27IOWraZjV9GMKoYulTmDrLr1cU7t1LiwpTba4cwE=;
 b=MD7579D3h607zcu5AiTUklYtE69SZ70E1s0Nl38FrAO6Wan5H6LHURnUfufJV4KRZo
 /DowqWcCOwEOeXXODpQUk7Y2Iyq7Kf9l/kMlYUgflXDlIrbC81k482AdeNC+XZ+PVaWL
 yVRktA+Ih1c/8N91DM9Ny1pUx2hTiUj+ShjvKNs3L0AxqW8woiYAlt7bSL64efDDKZEQ
 pPQLwqIw4R44itDxZuQ5pHCl5BCFTta3e52ifsnS/EIpgGrt9mbxCG174z7aqodjFTAI
 rAy0tE0AwQTOCBsn1P7e5fgBsagsq9QcCUkjfhZYsOn7x8oWGIxbw8zEIbFz659LaE6A
 EriQ==
X-Gm-Message-State: AOAM530gWkJ2EcDGosIpUwm7gbbCoWpNQiAFSxNuTa7GwPFr4FHiR6v9
 waS/VYBg0fRz35+2IoduGUGrpQ==
X-Google-Smtp-Source: ABdhPJwMVl2AyiU2jhPluK3Am89ij7syGUTHI2bU0d4SdrxWuN4pf0Frvq6Z86d++P5a9Cy8T257qg==
X-Received: by 2002:a05:6808:1183:b0:2d4:5eeb:1ca3 with SMTP id
 j3-20020a056808118300b002d45eeb1ca3mr7474840oil.8.1646364028645; 
 Thu, 03 Mar 2022 19:20:28 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190]) by smtp.gmail.com with ESMTPSA id
 u12-20020a056808114c00b002d72b6e5676sm2284052oiu.29.2022.03.03.19.20.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 19:20:27 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [RFC PATCH  0/3] Implement Sstc extension 
Date: Thu,  3 Mar 2022 19:20:20 -0800
Message-Id: <20220304032023.730344-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::236
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=atishp@rivosinc.com; helo=mail-oi1-x236.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Fri, 04 Mar 2022 03:20:32 -0000

This series implements Sstc extension[1] which was ratified recently.

The first patch is a prepartory patches while PATCH 2 adds stimecmp
support while PATCH 3 adds vstimecmp support. This series is based on
the ISA extension[2] & privilege version update series[3].

The series can also be found at
https://github.com/atishp04/qemu/tree/sstc_v1

It is tested on RV32 & RV64 with additional OpenSBI[4] & Linux kernel[5]
patches.

[1] https://drive.google.com/file/d/1m84Re2yK8m_vbW7TspvevCDR82MOBaSX/view
[2] https://lore.kernel.org/all/20220222220704.2294924-1-atishp@rivosinc.com/
[3] https://www.mail-archive.com/qemu-devel@nongnu.org/msg870659.html
[4] https://github.com/atishp04/opensbi/tree/sstc_v1
[5] https://github.com/atishp04/linux/tree/sstc_v2

Atish Patra (3):
target/riscv: Rename timer & timecmp to mtimer and mtimecmp
target/riscv: Add stimecmp support
target/riscv: Add vstimecmp support

hw/intc/riscv_aclint.c     |  20 ++--
hw/timer/ibex_timer.c      |  14 +--
target/riscv/cpu.c         |   7 ++
target/riscv/cpu.h         |  12 ++-
target/riscv/cpu_bits.h    |   8 ++
target/riscv/cpu_helper.c  |  11 ++-
target/riscv/csr.c         | 183 +++++++++++++++++++++++++++++++++++++
target/riscv/machine.c     |   4 +-
target/riscv/meson.build   |   3 +-
target/riscv/time_helper.c | 113 +++++++++++++++++++++++
target/riscv/time_helper.h |  30 ++++++
11 files changed, 381 insertions(+), 24 deletions(-)
create mode 100644 target/riscv/time_helper.c
create mode 100644 target/riscv/time_helper.h

--
2.30.2


