Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pvCLa-0003ZE-WD
	for mharc-qemu-riscv@gnu.org; Sat, 06 May 2023 03:28:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pvCLT-0002sk-Ja
 for qemu-riscv@nongnu.org; Sat, 06 May 2023 03:28:45 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pvCLR-0006Qx-8X
 for qemu-riscv@nongnu.org; Sat, 06 May 2023 03:28:43 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-50bcb229adaso5013410a12.2
 for <qemu-riscv@nongnu.org>; Sat, 06 May 2023 00:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683358119; x=1685950119;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mjr+dUk/ZkwHWCLTUidpgZMvIzWIcBQNWf0MxO839Yc=;
 b=CLTZA9SX2FNmCyLslLtt2mxRB0pqE0b/kuYvN+vBAQo6KWWPfJ6cIbqiitEoa3NQdh
 4a0YEfP491FWh1Iz73Q+qOIwUzbKG39MfIrZLYBxWWFsEbXkfn1j0BIQKDwDO11LKYBf
 Cxzp6G0zB3z1DH7IN6P2Cl77l1K0TZqCbvCeF6Fnb0jIyxPHDHY8F9GUs4xkvrUgQztt
 uReZVVgMft0O+GETeMfPnVBL7K200swo9vU1iOILSMQMFJQSPUmCzxO2rrCdWc1NUZT6
 OHKFGcqadFME3bFG/wseMoUmqa+ew+LGPYVWe4Zyc0wgLEzPC8zDbKxSIV4Obu807VgD
 btOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683358119; x=1685950119;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mjr+dUk/ZkwHWCLTUidpgZMvIzWIcBQNWf0MxO839Yc=;
 b=IuQGsO7Jit+oHIClM2sLgKFcRFcoGTsuyIU18WdD1M3Tdsdlidj9jsyegh21NJDVUN
 rzrcebibjHeiw3qaCHcss+M+BdZR4jRM34AImTWdvD1fd8JmrjUyiv7wTJibaiQBo0t7
 l9NPOW9dcoRgfaNfczGrv8hV+IgTAFugfCfGfzy7MuI93O610IjxJ6Fc3xh3LN728y5H
 MzNlTttiLWmOFY2AyD8VWCSG9XZW4EILbekJiLwaOx8Mphs57VMvDUFDK08c4M77rVWD
 kXqsnhRhuVwpGifgtbgGZghAs3dv/+d2a3xvZPS8kWCyd4W4IIS1uD+F6AWw0ZjkVWuo
 +tvQ==
X-Gm-Message-State: AC+VfDzLDglvveXbCFmdVRGUU68Dk0K/viH3ul9j8CnK6E4s0H1UiomX
 QyQPvokMgmTH+vgbCW6fqEJvHUc0zdtTjjLaH4pT3A==
X-Google-Smtp-Source: ACHHUZ53wxupCnuEvEklvsTTFOwo5FBYVmx7ATFl4Ccts44C2+fejk2k2gQCYzLjCbOYyW6CDxNBKw==
X-Received: by 2002:a1c:ed03:0:b0:3ee:6d55:8b73 with SMTP id
 l3-20020a1ced03000000b003ee6d558b73mr2556302wmh.29.1683357757066; 
 Sat, 06 May 2023 00:22:37 -0700 (PDT)
Received: from stoup.. ([212.241.182.8]) by smtp.gmail.com with ESMTPSA id
 x9-20020adfec09000000b002faaa9a1721sm4481223wrn.58.2023.05.06.00.22.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 May 2023 00:22:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v5 00/30] tcg: Simplify calls to load/store helpers
Date: Sat,  6 May 2023 08:22:05 +0100
Message-Id: <20230506072235.597467-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x536.google.com
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
X-List-Received-Date: Sat, 06 May 2023 07:28:47 -0000

There are several changes to the load/store helpers coming, and making
sure that those changes are properly reflected across all of the backends
was harrowing.

I have gone back and restarted by hoisting the code out of the backends
and into tcg.c.  We already have all of the parameters for the host
function call abi for "normal" helpers, we simply need to apply that to
the load/store slow path.

Changes for v5:
  * 24 patches upstreamed; 6 of the remaining 30 have reviews, but
    could not be merged out of order.


r~


Richard Henderson (30):
  tcg/i386: Introduce prepare_host_addr
  tcg/i386: Use indexed addressing for softmmu fast path
  tcg/aarch64: Introduce prepare_host_addr
  tcg/arm: Introduce prepare_host_addr
  tcg/loongarch64: Introduce prepare_host_addr
  tcg/mips: Introduce prepare_host_addr
  tcg/ppc: Introduce prepare_host_addr
  tcg/riscv: Introduce prepare_host_addr
  tcg/s390x: Introduce prepare_host_addr
  tcg: Add routines for calling slow-path helpers
  tcg/i386: Convert tcg_out_qemu_ld_slow_path
  tcg/i386: Convert tcg_out_qemu_st_slow_path
  tcg/aarch64: Convert tcg_out_qemu_{ld,st}_slow_path
  tcg/arm: Convert tcg_out_qemu_{ld,st}_slow_path
  tcg/loongarch64: Convert tcg_out_qemu_{ld,st}_slow_path
  tcg/mips: Convert tcg_out_qemu_{ld,st}_slow_path
  tcg/ppc: Convert tcg_out_qemu_{ld,st}_slow_path
  tcg/riscv: Convert tcg_out_qemu_{ld,st}_slow_path
  tcg/s390x: Convert tcg_out_qemu_{ld,st}_slow_path
  tcg/loongarch64: Simplify constraints on qemu_ld/st
  tcg/mips: Remove MO_BSWAP handling
  tcg/mips: Reorg tlb load within prepare_host_addr
  tcg/mips: Simplify constraints on qemu_ld/st
  tcg/ppc: Reorg tcg_out_tlb_read
  tcg/ppc: Adjust constraints on qemu_ld/st
  tcg/ppc: Remove unused constraints A, B, C, D
  tcg/ppc: Remove unused constraint J
  tcg/riscv: Simplify constraints on qemu_ld/st
  tcg/s390x: Use ALGFR in constructing softmmu host address
  tcg/s390x: Simplify constraints on qemu_ld/st

 tcg/loongarch64/tcg-target-con-set.h |   2 -
 tcg/loongarch64/tcg-target-con-str.h |   1 -
 tcg/mips/tcg-target-con-set.h        |  13 +-
 tcg/mips/tcg-target-con-str.h        |   2 -
 tcg/mips/tcg-target.h                |   4 +-
 tcg/ppc/tcg-target-con-set.h         |  11 +-
 tcg/ppc/tcg-target-con-str.h         |   7 -
 tcg/riscv/tcg-target-con-set.h       |   2 -
 tcg/riscv/tcg-target-con-str.h       |   1 -
 tcg/s390x/tcg-target-con-set.h       |   2 -
 tcg/s390x/tcg-target-con-str.h       |   1 -
 tcg/tcg.c                            | 456 +++++++++++++-
 tcg/aarch64/tcg-target.c.inc         | 347 +++++------
 tcg/arm/tcg-target.c.inc             | 455 +++++---------
 tcg/i386/tcg-target.c.inc            | 451 +++++---------
 tcg/loongarch64/tcg-target.c.inc     | 313 ++++------
 tcg/mips/tcg-target.c.inc            | 870 ++++++++-------------------
 tcg/ppc/tcg-target.c.inc             | 510 +++++++---------
 tcg/riscv/tcg-target.c.inc           | 304 ++++------
 tcg/s390x/tcg-target.c.inc           | 314 ++++------
 20 files changed, 1766 insertions(+), 2300 deletions(-)

-- 
2.34.1


