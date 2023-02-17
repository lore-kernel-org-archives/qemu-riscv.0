Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pT7Ra-0002YO-4N
	for mharc-qemu-riscv@gnu.org; Fri, 17 Feb 2023 15:34:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pT7RY-0002Wx-AE
 for qemu-riscv@nongnu.org; Fri, 17 Feb 2023 15:34:56 -0500
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pT7RW-0006Qj-69
 for qemu-riscv@nongnu.org; Fri, 17 Feb 2023 15:34:55 -0500
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-1718a459283so2257757fac.9
 for <qemu-riscv@nongnu.org>; Fri, 17 Feb 2023 12:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Wm+SPmSLrsiqq43ULxNXDhBLuQ5+qCkd8ia2VXxhs0k=;
 b=FT8viDve+uQ1RME7amCy5WSiId6BUxCsUAFR3zy0bEuybmeB/OLZxcIqieK8tSH0vq
 MbtGMiwibXlfmcRo9I44iSWuw4u3p4RZwWkF+jyIwwRe0xSJX1A+ZNwBInPhLCa7GKhw
 gKnEG+BrAApkIV883AfT60xOkXhHGDTgASo3Y/g/myqfitrNTL0naRn/D4jvGzeWgD8n
 IJOw2HnHebsXq9EbWnxAen0h42+swI+jQHtfw+o4BTffak0K6PMwjNoxTvbXKgZTc+iR
 hRQd2Wm4kyuA4r56/8+9wqZrV55y7fAGABHMXLUOxu6SkZEBKl5pn3CzxmPZ3Q74fzys
 MojA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Wm+SPmSLrsiqq43ULxNXDhBLuQ5+qCkd8ia2VXxhs0k=;
 b=noHeUvdGEIr3+w331PNbHc7pq4D41uiDXP4pvECWsLxU4+HsA4MjxNaxuU4nZ9jXlJ
 hW3cs5guY0FA54YbGktcPLV4GYLeVDx0Y8Ve6bOIQ9jITW1ZtUSRqRPy4IO9n6EkMGZw
 tPczPt5ZclYOe82xlEdv+v4EvHO6Vh+75rnv8qDJXztiSgemzMIzyQHRqgc2xCX+h6dr
 qNeGa/CZaJnASgRXVyrHRgJeX4F8R+vhN11MioJrZekigI3K8/YUSzwoKvOmsZ/19d6w
 jamaRNPhTkM/LFKX368kPwYadq6FRcPwsZROYYqdhnfaLxom83ULwVeWu3YaVC/5ZnBD
 EN4A==
X-Gm-Message-State: AO0yUKUPvPsTcvIuNU96HzHzdbRRQsDtN/lQXQtOwxix+GXpHD/rSoHz
 /x3y1SOJUAxhJ+Ox7KRzKJ69dQ==
X-Google-Smtp-Source: AK7set/pi1TELKzTKWhXgftl8a9qTS6Dwgvsyf5BvB1LLyGhyxieRlThXsZuWPjHl/OlgjiIugsbYg==
X-Received: by 2002:a05:6870:ac25:b0:16a:30af:f211 with SMTP id
 kw37-20020a056870ac2500b0016a30aff211mr609771oab.36.1676666092279; 
 Fri, 17 Feb 2023 12:34:52 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 ef5-20020a0568701a8500b00152c52608dbsm1125616oab.34.2023.02.17.12.34.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 12:34:51 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 dbarboza@ventanamicro.com, richard.henderson@linaro.org
Subject: [PATCH v6 0/4] riscv: Add support for Zicbo[m,z,p] instructions
Date: Fri, 17 Feb 2023 17:34:41 -0300
Message-Id: <20230217203445.51077-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 17 Feb 2023 20:34:56 -0000

Hi,

This new version contains a change in patch 2 based on Richard's
feedback in v5 [1].

Changes from v5:
- patch 2:
  - check if 'mem' is mapped into RAM with 'tlb_vaddr_to_host' before
    zeroing it.
- v5 link: https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg04414.html

[1] https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg04414.html

Christoph Muellner (4):
  accel/tcg: Add probe_access_range_flags interface
  target/riscv: implement Zicboz extension
  target/riscv: implement Zicbom extension
  target/riscv: add Zicbop cbo.prefetch{i,r,m} placeholder

 accel/tcg/cputlb.c                          |  19 +++
 accel/tcg/user-exec.c                       |  15 +-
 include/exec/exec-all.h                     |  24 +++
 target/riscv/cpu.c                          |   7 +
 target/riscv/cpu.h                          |   4 +
 target/riscv/helper.h                       |   5 +
 target/riscv/insn32.decode                  |  16 +-
 target/riscv/insn_trans/trans_rvzicbo.c.inc |  57 +++++++
 target/riscv/op_helper.c                    | 162 ++++++++++++++++++++
 target/riscv/translate.c                    |   1 +
 10 files changed, 306 insertions(+), 4 deletions(-)
 create mode 100644 target/riscv/insn_trans/trans_rvzicbo.c.inc

-- 
2.39.2


