Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkTxt-0000ss-Jl
	for mharc-qemu-riscv@gnu.org; Thu, 06 Apr 2023 14:04:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pkTxs-0000sH-4F
 for qemu-riscv@nongnu.org; Thu, 06 Apr 2023 14:04:04 -0400
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pkTxp-0000Zf-JV
 for qemu-riscv@nongnu.org; Thu, 06 Apr 2023 14:04:03 -0400
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-17997ccf711so43249841fac.0
 for <qemu-riscv@nongnu.org>; Thu, 06 Apr 2023 11:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1680804239;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=n6B4Yi9cz99hxb6U4GBcfHGrnguBE8JWSocGRURZRi4=;
 b=bYoA7swvbP1tjuzF4QdSgpmQyC2BmFzusMxUOpUK6vW887Y0OkMsRU6n86hN39z6VV
 D5oNb2ixVGj1UiSgJD7IHaXSXoVW5BoUsZXXuqxHkdbo/YaOgXJmtO6YCP4I6yrgXfuT
 j72DqIfu2F6hdmwfM5y+gM3hF/l2zKRULZtwLo/BQnRQJu331aggb3mOUTQbcep5PnMh
 xmWn2429o3QnpwPfEUERzmOEEL4Q0ibvMdorE8Ohx8SXYXyW/8/7GEekAWfG8N+nm7dx
 Pesj/TyBL+FsrPaTVvoKMqL9nUuziSc8iByKGHyBnHG1WSRmXdOHRa23SampmLgwFUNb
 0Rbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680804239;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n6B4Yi9cz99hxb6U4GBcfHGrnguBE8JWSocGRURZRi4=;
 b=fB+zNXVP9vYaPqPXD/71eZQhX8QA8zPA12P9iSwC8/6ptGaSKZllu1egqCJTHuLiyW
 uBDG+wT+jZXEu9sLKaqttHSuQpWa7aus3KtoalFAe/NdTPqiwarnfibGSVHibBaIOxxE
 s73aEjIA/EU1jTfaX+ZVy54Ch8kDS1tnf8jSN95Fri4ayMG6fpNc6RADUaxJxUfRxDsK
 TF4nXI5r6HxAF0SjTYwcak7MK1s6pCJUZ/b8OPkiU8X/LSkrwBNopo+9dMzAQUPmQC9Q
 ihA6RhZlWugMMDQPmp9sWmJMSxcEO2YYDcjfy2Opsguw2J2usI7ckhj/TyKIs6szCA3p
 vsGA==
X-Gm-Message-State: AAQBX9eKvGc70VEN58OWrjCfwBzzVYCSHG7V0VAxu0r6ooJoCXpF8zaE
 OfRyZtiXW9ixVPPInzKkw5zLJA==
X-Google-Smtp-Source: AKy350Zu05bXDnkrID7M5d/yBEYvl5h7PwMbDDLz9rNbiaUFfJehRwTGtWUhT5pVTLbw4Ywr+jzC7w==
X-Received: by 2002:a05:6870:c0ca:b0:17a:e658:d954 with SMTP id
 e10-20020a056870c0ca00b0017ae658d954mr41252oad.49.1680804238984; 
 Thu, 06 Apr 2023 11:03:58 -0700 (PDT)
Received: from grind.. ([191.255.108.232]) by smtp.gmail.com with ESMTPSA id
 g4-20020a056870d20400b0018045663fc5sm906309oac.48.2023.04.06.11.03.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 11:03:58 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 00/20] remove MISA ext_N flags from cpu->cfg
Date: Thu,  6 Apr 2023 15:03:31 -0300
Message-Id: <20230406180351.570807-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 06 Apr 2023 18:04:04 -0000

Hi,

This new version was rebased on top of Alistair's riscv-to-apply.next @
9c60ca583cb ("hw/riscv: Add signature dump function ...").

No other changes made.

Changes from v3:
- rebased with riscv-to-apply.next @ 9c60ca583cb
- v3 link: https://lists.gnu.org/archive/html/qemu-devel/2023-03/msg06911.html

Daniel Henrique Barboza (20):
  target/riscv: sync env->misa_ext* with cpu->cfg in realize()
  target/riscv: remove MISA properties from isa_edata_arr[]
  target/riscv/cpu.c: remove 'multi_letter' from isa_ext_data
  target/riscv: introduce riscv_cpu_add_misa_properties()
  target/riscv: remove cpu->cfg.ext_a
  target/riscv: remove cpu->cfg.ext_c
  target/riscv: remove cpu->cfg.ext_d
  target/riscv: remove cpu->cfg.ext_f
  target/riscv: remove cpu->cfg.ext_i
  target/riscv: remove cpu->cfg.ext_e
  target/riscv: remove cpu->cfg.ext_m
  target/riscv: remove cpu->cfg.ext_s
  target/riscv: remove cpu->cfg.ext_u
  target/riscv: remove cpu->cfg.ext_h
  target/riscv: remove cpu->cfg.ext_j
  target/riscv: remove cpu->cfg.ext_v
  target/riscv: remove riscv_cpu_sync_misa_cfg()
  target/riscv: remove cfg.ext_g setup from rv64_thead_c906_cpu_init()
  target/riscv: add RVG and remove cpu->cfg.ext_g
  target/riscv/cpu.c: redesign register_cpu_props()

 target/riscv/cpu.c                        | 412 +++++++++++-----------
 target/riscv/cpu.h                        |  19 +-
 target/riscv/insn_trans/trans_rvzce.c.inc |   2 +-
 3 files changed, 216 insertions(+), 217 deletions(-)

-- 
2.39.2


