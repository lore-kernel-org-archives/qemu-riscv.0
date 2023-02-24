Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVY5F-0003ji-Sv
	for mharc-qemu-riscv@gnu.org; Fri, 24 Feb 2023 08:25:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pVY57-0003ib-Kh
 for qemu-riscv@nongnu.org; Fri, 24 Feb 2023 08:25:55 -0500
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pVY54-0005Rz-Lg
 for qemu-riscv@nongnu.org; Fri, 24 Feb 2023 08:25:48 -0500
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-1720433ba75so19702214fac.5
 for <qemu-riscv@nongnu.org>; Fri, 24 Feb 2023 05:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=x438lhnqLWnsij7LFZqkqujUA0LyPmecv6xNdpATafo=;
 b=XXDrAFKPf4wK/CftAoLaOuQjUBitVNcsog7KnQCky0ydPbWGRBT7J+3ayPWjQlndMh
 GSz6Mxgnf50OSDLDyNM9JhYp6KA0V75DATz7o6dGk1q4nG7vLz8xvnCppOXM33KwD7Pe
 Wa0K4pj+scxR6Lyde3iNASCGGfYAUMi2wEocMlp5vzPEjEZQoFqWlZ+jZ8Dlx1m5We4k
 XST0CWofTftvwpc8bc1aguLe7yRq4oS4IVCkk3eyu1YfPGsvx9obf6eSkV85U/Q4WUls
 0oBLQcjT9n87hvhc92GYMiBCKxTnixDawiJPdHp7jtz9JAxkMA84bkuRFIJru2SLOPte
 ROUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=x438lhnqLWnsij7LFZqkqujUA0LyPmecv6xNdpATafo=;
 b=AnbjL14mjP090SNwfNKCz37HmpyZUhUGPkvv9/e+81iSE83JoaOOYmgFpQc0vHI3fw
 yAsvmOKQoCFQyXXQnTcUhIECdz+cXu1PuvkznLMXcezcjG6az/dWzRsmVU6YB5lHGUma
 GS1IAW/OWBOYj9n1u8iR0z9Q8S7oppSMtuKudKS0yV7o/xUDmtjn8acBHpQc66a7EO43
 a2jYI9bgBE2nUAaLYFDk/Pp9719RvoUw5hpgbck7O3du7wVWvsl4NM3G8F04tLtOzso4
 nYEJtvid2IL65CkG5oCKBYUmDf7ab5+8zOapOf//IHw/mECJE9fsxGuLho4ErPYzMbYP
 EqQA==
X-Gm-Message-State: AO0yUKV1vDZu9ttSn28NarzOIl4/kpXK76ZbZseY5P1Ll+DG7bZHTNf/
 sNRXBTuuySwV7gNkTLXagkCPrQ==
X-Google-Smtp-Source: AK7set/wt9LJOOm7z/7XTQIP9e4UqZ/+31vJCRIHo3+TCx/8v8Lp0CZ6yBkS/sLkakJiZqk7dBWqAg==
X-Received: by 2002:a05:6870:b312:b0:172:1457:64d7 with SMTP id
 a18-20020a056870b31200b00172145764d7mr8693737oao.0.1677245145282; 
 Fri, 24 Feb 2023 05:25:45 -0800 (PST)
Received: from grind.. ([2804:18:18bc:fbbd:3c90:eebc:7544:73fd])
 by smtp.gmail.com with ESMTPSA id
 b5-20020a05687061c500b001435fe636f2sm3383763oah.53.2023.02.24.05.25.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 05:25:44 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 richard.henderson@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v8 0/4] riscv: Add support for Zicbo[m,z,p] instructions
Date: Fri, 24 Feb 2023 10:25:32 -0300
Message-Id: <20230224132536.552293-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2e.google.com
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
X-List-Received-Date: Fri, 24 Feb 2023 13:25:55 -0000

Hi,

This version has a change in patch 2, proposed by Weiwei Li, where we're
now triggering virt_instruction_fault before triggering illegal_insn
fault from S mode. 

Richard already queued patch 1 is queued in tcg-next already. I'm still
including it here to allow for easier testing of the remaining patches.

Changes from v7:
- patch 1: queued in tcg-next, included here to facilitate testing the
  other patches
- patch 2:
  - changed check_zicbo_envcfg() to trigger the virtual faults
    before triggering the illegal exception from S mode.
- v7 link: https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg07041.html

Christoph Muellner (3):
  target/riscv: implement Zicboz extension
  target/riscv: implement Zicbom extension
  target/riscv: add Zicbop cbo.prefetch{i,r,m} placeholder

Daniel Henrique Barboza (1):
  tcg: add 'size' param to probe_access_flags()

 accel/stubs/tcg-stub.c                      |   2 +-
 accel/tcg/cputlb.c                          |  17 ++-
 accel/tcg/user-exec.c                       |   5 +-
 include/exec/exec-all.h                     |   3 +-
 semihosting/uaccess.c                       |   2 +-
 target/arm/ptw.c                            |   2 +-
 target/arm/sve_helper.c                     |   2 +-
 target/riscv/cpu.c                          |   7 +
 target/riscv/cpu.h                          |   4 +
 target/riscv/helper.h                       |   5 +
 target/riscv/insn32.decode                  |  16 ++-
 target/riscv/insn_trans/trans_rvzicbo.c.inc |  57 +++++++++
 target/riscv/op_helper.c                    | 135 ++++++++++++++++++++
 target/riscv/translate.c                    |   1 +
 target/s390x/tcg/mem_helper.c               |   6 +-
 15 files changed, 250 insertions(+), 14 deletions(-)
 create mode 100644 target/riscv/insn_trans/trans_rvzicbo.c.inc

-- 
2.39.2


