Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mgops-0007kn-P3
	for mharc-qemu-riscv@gnu.org; Sat, 30 Oct 2021 09:55:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mgopX-0007Yx-Cw; Sat, 30 Oct 2021 09:55:33 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:42829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mgopQ-0000bC-SL; Sat, 30 Oct 2021 09:55:26 -0400
Received: by mail-pf1-x42b.google.com with SMTP id m14so11959236pfc.9;
 Sat, 30 Oct 2021 06:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o5AG5IlfD5i8gdj+03F3hZLSxXusazdbA0hkZzTXBnk=;
 b=BrBuZqBCPoxxZN0sREgxGQMoQ6oMZbaiS3lGNA1IL9C8K7cdx7AHX1CFuWLkfM0CAo
 dRVKmTp/gQsMqPyWJo+S70ZDQ6jCSUPqlkBXIslZe2B/C/8GBiV2ae8xCUab9gAKvJh1
 ug8lWLATmB0WvkKKm6gZcNwK5Q1HD42i1CP50BebmWIyX090IU0PHbX4uxXH5ubQPXYt
 xw7jxbc+l/KVwrarlcUSheskmXOajmDGESYhwvB/Fj0lhIorqRKOMCIV8BjvDRlBd2Az
 2uN5W2gDwrEUSz+fh0Ui0DeoLpo0DxJGBUYt97fq1zJxUcDIsAQAoMFHpGfFz6KUMl5y
 qB3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o5AG5IlfD5i8gdj+03F3hZLSxXusazdbA0hkZzTXBnk=;
 b=ZZhfMaBD+Asy5L86jssRpFTv2qCBLjcCTEjqGY4r7G5T6aXOSmv7vxusaIidPsE/KN
 +fAJNcGDtWG1T0Qc1Oc2SQLANjQAoEJ3WvhIWzawQVAmUzID9YleCn20hPR2vDYtAoba
 3U1VJazB+xu+UqyXyMkKyXkt4R89XPbQJm70QWAFtYxhBqaKIvR7pm2auJvjWYPrQ9nJ
 VeaQ0FAeETGk0eQxUlPaD7qhM41e6g/jZfHfX5lMOhtFu5MDiZJcR0SJekCo+TWayvbS
 TJT2oEgXM9zg+alYLPnREyLAfNqG4gf28oqqX1fC/KOJcdfbTRPmfsHLnVO3EsElEzkQ
 AEAA==
X-Gm-Message-State: AOAM533lTHXtLelFVN2Xo0VikMZeMz8hIsuGVf0t+IPM0F0Kg4MgfR+8
 2cVKL8DCmjL7J/Inb0Ki6WM=
X-Google-Smtp-Source: ABdhPJyyflh5mde0roA1nSlAlzIsnbuZtVLvxGpzq/0S1r5q9z0CHd7NMmTL31gB3prjKPHw9DcDSg==
X-Received: by 2002:a62:1b86:0:b0:47b:d112:96d4 with SMTP id
 b128-20020a621b86000000b0047bd11296d4mr17499056pfb.52.1635602122484; 
 Sat, 30 Oct 2021 06:55:22 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id f19sm3645911pfc.72.2021.10.30.06.55.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 06:55:21 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
X-Google-Original-From: Bin Meng <bin.meng@windriver.com>
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 0/7] target/riscv: Initial support for native debug feature
 via M-mode CSRs
Date: Sat, 30 Oct 2021 21:55:06 +0800
Message-Id: <20211030135513.18517-1-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FREEMAIL_REPLY=1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sat, 30 Oct 2021 13:55:44 -0000


This adds initial support for the native debug via the Trigger Module,
as defined in the RISC-V Debug Specification [1].

Only "Address / Data Match" trigger (type 2) is implemented as of now,
which is mainly used for hardware breakpoint and watchpoint. The number
of type 2 triggers implemented is 2, which is the number that we can
find in the SiFive U54/U74 cores.

[1] https://github.com/riscv/riscv-debug-spec/raw/master/riscv-debug-stable.pdf

Based-on: 20211030030606.32297-1-bmeng.cn@gmail.com

Changes in v2:
- new patch: add debug state description
- use 0 instead of GETPC()
- change the config option to 'disabled' by default
- new patch: enable native debug feature on virt and sifive_u CPUs

Bin Meng (7):
  target/riscv: Add initial support for native debug
  target/riscv: machine: Add debug state description
  target/riscv: debug: Implement debug related TCGCPUOps
  target/riscv: cpu: Add a config option for native debug
  target/riscv: csr: Hook debug CSR read/write
  target/riscv: cpu: Enable native debug feature on virt and sifive_u
    CPUs
  hw/core: tcg-cpu-ops.h: Update comments of debug_check_watchpoint()

 include/hw/core/tcg-cpu-ops.h |   1 +
 target/riscv/cpu.h            |   7 +
 target/riscv/debug.h          | 114 +++++++++
 target/riscv/cpu.c            |  18 ++
 target/riscv/csr.c            |  57 +++++
 target/riscv/debug.c          | 441 ++++++++++++++++++++++++++++++++++
 target/riscv/machine.c        |  33 +++
 target/riscv/meson.build      |   1 +
 8 files changed, 672 insertions(+)
 create mode 100644 target/riscv/debug.h
 create mode 100644 target/riscv/debug.c

-- 
2.25.1


