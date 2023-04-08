Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkyXx-0006v2-VX
	for mharc-qemu-riscv@gnu.org; Fri, 07 Apr 2023 22:43:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyXw-0006u8-MO
 for qemu-riscv@nongnu.org; Fri, 07 Apr 2023 22:43:20 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyXt-0005WU-Ab
 for qemu-riscv@nongnu.org; Fri, 07 Apr 2023 22:43:20 -0400
Received: by mail-pl1-x632.google.com with SMTP id h24so511316plr.1
 for <qemu-riscv@nongnu.org>; Fri, 07 Apr 2023 19:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680921795;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fm2Ro7+DC/VzvdVmtM9K9ziTTsUx1+HQJ4C+REwXt24=;
 b=R7PACTSVOT5JqWb3HbVL6D55u2ecy1t/u8lLsvHDX4dKg/gykVEUziAzeXunw2VB93
 BGgduIAzB/XUOY1xOs42ki5Sv+Mz//x9syxP5EwE4XcLUoyRs+UeNbV+hKrbirkel/RJ
 8B1xy6kDsXAY82CXIJWb4Y45Exo7uQ6NDoyMa1WLWL3Sc7hZ7QNmHUt+b1ABiFWpb27Y
 SpyYqAaQdVmP0yoQNjmQyK4npbOHe1uWg3CfmfA566Nri4ahCbwJDVOgvhmACgVzutUh
 89+4vEovjCSqhrsxo0iG0n5pPyEmz7fW9WVq9lhhc361QIYx9mweB5KPJUEGTjq0OHZv
 31dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680921795;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fm2Ro7+DC/VzvdVmtM9K9ziTTsUx1+HQJ4C+REwXt24=;
 b=QC0twWaduJKuDbLkLpR6cZVn0ypcf93I9ZgsyxgAbt3h7LJP4KaM02IWedm+UJGSL4
 aoQqho3vwJW9oLaMxy4wWYM8o0AhdNwFx1IlMmgzvA4mb2MB1dlV7SqIJSR3kQES06US
 vq27UpnFyfDvNbWWIIKPs32/CDs5f3rQ4KdLslRBgoDGEnSMATvUOh+ssblwZ1an4jST
 b3TB7QBgLjGgoqlkhtgr7vbvMgzEn42OSSubzvERbHVH8Qg+4rBOBkzKPBYZDYxcTsHf
 7fVMzGC2K4aejXO4ezsZnaoUwbQDg6r4NHRG9NOAkWEl8kBAERX0ngIhMaojDCxc2vQu
 9n+g==
X-Gm-Message-State: AAQBX9cSqB1jikFM/qwzv7X1XH9dMC3eL+ycUdz3Ak0dugd7rtMFuCz/
 zYmOV5FoX2UyxEHosJdjxG0/wA==
X-Google-Smtp-Source: AKy350ZqkLXWh4mQ1zxe3kT066FFZFS1MBYGJOj4lprXDbxd52Kt0+JSwegNScZ8iPSAgkaOaRuPgg==
X-Received: by 2002:a17:903:32cd:b0:1a1:dd2a:fe54 with SMTP id
 i13-20020a17090332cd00b001a1dd2afe54mr5464332plr.60.1680921795497; 
 Fri, 07 Apr 2023 19:43:15 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a170902c18900b0019d397b0f18sm3530780pld.214.2023.04.07.19.43.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 19:43:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH for-8.1 00/42] tcg: Simplify calls to load/store helpers
Date: Fri,  7 Apr 2023 19:42:31 -0700
Message-Id: <20230408024314.3357414-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sat, 08 Apr 2023 02:43:21 -0000

There are several changes to the load/store helpers coming, and
making sure that those changes are properly reflected across all
of the backends was harrowing.

I have gone back and restarted by hoisting the code out of the
backends and into tcg.c.  We already have all of the parameters
for the host function call abi for "normal" helpers, we simply
need to apply that to the load/store slow path.

Unlike the normal helpers, we cannot use tcg_gen_foo(), so we start
by creating additional required backend primitives for extension.
This is followed by putting them together with knowledge of the types,
and some functions to handle register move/extend with overlap.
Finally, top-level tcg_out_{ld,st}_helper_args which contains all
knowledge of the helper function signatures.

There will be additional backend unification coming for user-only,
and for sparc64, but that needs to wait for some of the changes within
my atomicity patch set.  And this is quite large enough for now.

One final note about patch 27, dropping support for riscv32 as a host.
This is driven by the existing

    /* We don't support oversize guests */
    QEMU_BUILD_BUG_ON(TCG_TARGET_REG_BITS < TARGET_LONG_BITS);

which causes the build to fail for all 64-bit guests.

One of the upcoming changes is to build TCG once, which means that the
build would fail entirely.  Which means we might as well drop it entirely.
Doing this first simplifies everything else.

I have not yet simplified top-level meson.build to match, because
I don't know if we should leave something to support riscv32 with
--enable-tcg-interpreter.  I first reaction is no, because there
really is no way to test it, because no one ships such an OS.


r~


Richard Henderson (42):
  tcg: Replace if + tcg_abort with tcg_debug_assert
  tcg: Replace tcg_abort with g_assert_not_reached
  tcg: Split out tcg_out_ext8s
  tcg: Split out tcg_out_ext8u
  tcg: Split out tcg_out_ext16s
  tcg: Split out tcg_out_ext16u
  tcg: Split out tcg_out_ext32s
  tcg: Split out tcg_out_ext32u
  tcg: Split out tcg_out_exts_i32_i64
  tcg/loongarch64: Conditionalize tcg_out_exts_i32_i64
  tcg/mips: Conditionalize tcg_out_exts_i32_i64
  tcg/riscv: Conditionalize tcg_out_exts_i32_i64
  tcg: Split out tcg_out_extu_i32_i64
  tcg/i386: Conditionalize tcg_out_extu_i32_i64
  tcg: Split out tcg_out_extrl_i64_i32
  tcg: Introduce tcg_out_movext
  tcg: Introduce tcg_out_xchg
  tcg: Introduce tcg_out_movext2
  tcg: Clear TCGLabelQemuLdst on allocation
  tcg/i386: Use TCGType not bool is_64 in tcg_out_qemu_{ld,st}
  tcg/aarch64: Rename ext to d_type in tcg_out_qemu_ld
  tcg/aarch64: Pass TGType to tcg_out_qemu_st
  tcg/arm: Use TCGType not bool is_64 in tcg_out_qemu_{ld,st}
  tcg/i386: Use TCGType not bool is_64 in tcg_out_qemu_{ld,st}
  tcg/ppc: Use TCGType not bool is_64 in tcg_out_qemu_{ld,st}
  tcg/s390x: Pass TCGType to tcg_out_qemu_{ld,st}
  tcg/riscv: Require TCG_TARGET_REG_BITS == 64
  tcg/riscv: Expand arguments to tcg_out_qemu_{ld,st}
  tcg: Move TCGLabelQemuLdst to tcg.c
  tcg: Introduce tcg_out_ld_helper_args
  tcg: Introduce tcg_out_st_helper_args
  tcg/loongarch64: Simplify constraints on qemu_ld/st
  tcg/mips: Reorg tcg_out_tlb_load
  tcg/mips: Simplify constraints on qemu_ld/st
  tcg/ppc: Reorg tcg_out_tlb_read
  tcg/ppc: Adjust constraints on qemu_ld/st
  tcg/ppc: Remove unused constraints A, B, C, D
  tcg/riscv: Simplify constraints on qemu_ld/st
  tcg/s390x: Use ALGFR in constructing host address for qemu_ld/st
  tcg/s390x: Simplify constraints on qemu_ld/st
  tcg/sparc64: Drop is_64 test from tcg_out_qemu_ld data return
  tcg/sparc64: Pass TCGType to tcg_out_qemu_{ld,st}

 include/tcg/tcg.h                    |   6 -
 tcg/loongarch64/tcg-target-con-set.h |   2 -
 tcg/loongarch64/tcg-target-con-str.h |   1 -
 tcg/mips/tcg-target-con-set.h        |  13 +-
 tcg/mips/tcg-target-con-str.h        |   2 -
 tcg/ppc/tcg-target-con-set.h         |  11 +-
 tcg/ppc/tcg-target-con-str.h         |   6 -
 tcg/riscv/tcg-target-con-set.h       |   8 -
 tcg/riscv/tcg-target-con-str.h       |   1 -
 tcg/riscv/tcg-target.h               |  22 +-
 tcg/s390x/tcg-target-con-set.h       |   2 -
 tcg/s390x/tcg-target-con-str.h       |   1 -
 target/i386/tcg/translate.c          |  20 +-
 target/s390x/tcg/translate.c         |   4 +-
 tcg/optimize.c                       |  10 +-
 tcg/tcg.c                            | 556 ++++++++++++++++++++++++++-
 tcg/aarch64/tcg-target.c.inc         | 156 ++++----
 tcg/arm/tcg-target.c.inc             | 242 ++++--------
 tcg/i386/tcg-target.c.inc            | 257 +++++--------
 tcg/loongarch64/tcg-target.c.inc     | 167 +++-----
 tcg/mips/tcg-target.c.inc            | 392 ++++++++-----------
 tcg/ppc/tcg-target.c.inc             | 319 +++++++--------
 tcg/riscv/tcg-target.c.inc           | 347 ++++++-----------
 tcg/s390x/tcg-target.c.inc           | 243 +++++-------
 tcg/sparc64/tcg-target.c.inc         | 125 +++---
 tcg/tcg-ldst.c.inc                   |  15 +-
 tcg/tci/tcg-target.c.inc             | 116 +++++-
 27 files changed, 1596 insertions(+), 1448 deletions(-)

-- 
2.34.1


