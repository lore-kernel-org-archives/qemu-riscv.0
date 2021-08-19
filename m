Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mGdz5-0005bl-Oz
	for mharc-qemu-riscv@gnu.org; Thu, 19 Aug 2021 05:05:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGdz3-0005bV-Bl
 for qemu-riscv@nongnu.org; Thu, 19 Aug 2021 05:05:09 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:45026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGdz1-0008Rf-Pp
 for qemu-riscv@nongnu.org; Thu, 19 Aug 2021 05:05:09 -0400
Received: by mail-pg1-x52e.google.com with SMTP id s11so5275927pgr.11
 for <qemu-riscv@nongnu.org>; Thu, 19 Aug 2021 02:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o/M0d2JI2nO7fBGehGFTHCD8j+KFwKIjiYqeQiFEWkI=;
 b=mxZleVa8tCreg+zN13Mj6vTCAIg4rkglUgMYqrVhbLV1ReKuwOi5pQzOGOfItUDJDc
 dMps6jFjgUyle4I13uXB07o8Bhcq8YVVU/gfMGmn6Vcj9TeACBHeoCVguIHAbWGhbEFS
 0G/6IJb4KlsBHmEer+OwlYmYUPkZG4Uw9QEs1nOFGDJsfcgJSPTfZtoTZuTbgEEm1KH1
 /ihdJl730NjyVDsXqE+8PLMM510gf2Au/gSxeIRFoVYvRJulQnI2qCkEpL+8y0hXV4vq
 g/PVer3WzLYN17cl9SaVTnXjrQT/FJzHsX/DcNn9sOnYz6ijAZCjYeDu4MciNVH+rjnt
 zgjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o/M0d2JI2nO7fBGehGFTHCD8j+KFwKIjiYqeQiFEWkI=;
 b=cvxsb+UKyPP8ydpmzfE+ooob2wqE6+OhA3Le6bI33OS0typIhW4rEUeTB6uKTOpcDL
 AVlPFoH1PHHSQGDfKeaWgodaDYd7bBil+jZK8W7ExPYUgqjmiCDzZAkQh/9XOxw1Jam4
 IL4TtjqGToy75Ca8vj1KGymkjBzWzW+RaZUlpS+gQZc5AlVp2f73DeyGMK3eyUH3zMXK
 CY1TSsq7BL+2hf5cRnoKx+RaIJa/N5vayPGHoxuOe0oQwlGpJic2DEREgqJ4DveA2xxz
 vv0Wz2ESvFMrZ3+Bmg5mDGzlLWaBSfRKz7BCGu+3UNqAMkijdgOj3nQzER68T0lBOToD
 JMlw==
X-Gm-Message-State: AOAM531opL620PZBBbCsM0nUftZlIuyBwWK36SYY95qA4lWu0/nm0e5W
 SJr/hS5l1gVKEShZYwEUPXd8rw==
X-Google-Smtp-Source: ABdhPJwQTtWPGTziNILrlug+B/Y5Pgjtdt1VExT8PYO4DIu4eJapxm872x7m543PN3+gaWFW0Sc5pg==
X-Received: by 2002:a62:7b50:0:b029:3cd:e227:3486 with SMTP id
 w77-20020a627b500000b02903cde2273486mr13811393pfc.74.1629363906027; 
 Thu, 19 Aug 2021 02:05:06 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id j13sm2944707pgp.29.2021.08.19.02.05.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 02:05:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	bin.meng@windriver.com,
	alistair.francis@wdc.com
Subject: [PATCH v3 00/21] target/riscv: Use tcg_constant_*
Date: Wed, 18 Aug 2021 23:04:41 -1000
Message-Id: <20210819090502.428068-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 19 Aug 2021 09:05:09 -0000

Replace use of tcg_const_*, which makes a copy into a temp which must
be freed, with direct use of the constant.  Reorg handling of $zero,
with different accessors for source and destination.  Reorg handling
of csrs, passing the actual write_mask instead of a regno.  Use more
helpers for RVH expansion.

Patches lacking review:
  02-target-riscv-Clean-up-division-helpers.patch
  10-target-riscv-Add-DisasExtend-to-gen_unary.patch
  12-target-riscv-Add-gen_greviw.patch
  17-target-riscv-Use-gen_shift_imm_fn-for-slli_uw.patch
  21-target-riscv-Use-get-dest-_gpr-for-RVV.patch

Though I guess patch 12 could be dropped, given what I learned today
about the Zbb 1.0.0 public review document.

Changes for v3:
  * Fix an introduced remainder bug (bin meng),
    and remove one extra movcond from rem/remu.
  * Do not zero DisasContext on allocation (bin meng).

Changes for v2:
  * Retain the requirement to call gen_set_gpr.
  * Add DisasExtend as an argument to get_gpr, and ctx->w as a member
    of DisasContext.  This should help in implementing UXL, where we
    should be able to set ctx->w for all insns, but there is certainly
    more required for that.

r~

Richard Henderson (21):
  target/riscv: Use tcg_constant_*
  target/riscv: Clean up division helpers
  target/riscv: Add DisasContext to gen_get_gpr, gen_set_gpr
  target/riscv: Introduce DisasExtend and new helpers
  target/riscv: Add DisasExtend to gen_arith*
  target/riscv: Remove gen_arith_div*
  target/riscv: Use gen_arith for mulh and mulhu
  target/riscv: Move gen_* helpers for RVM
  target/riscv: Move gen_* helpers for RVB
  target/riscv: Add DisasExtend to gen_unary
  target/riscv: Use DisasExtend in shift operations
  target/riscv: Add gen_greviw
  target/riscv: Use get_gpr in branches
  target/riscv: Use {get,dest}_gpr for integer load/store
  target/riscv: Reorg csr instructions
  target/riscv: Use {get,dest}_gpr for RVA
  target/riscv: Use gen_shift_imm_fn for slli_uw
  target/riscv: Use {get,dest}_gpr for RVF
  target/riscv: Use {get,dest}_gpr for RVD
  target/riscv: Tidy trans_rvh.c.inc
  target/riscv: Use {get,dest}_gpr for RVV

 target/riscv/helper.h                   |   6 +-
 target/riscv/insn32.decode              |   1 +
 target/riscv/op_helper.c                |  18 +-
 target/riscv/translate.c                | 701 ++++++------------------
 target/riscv/insn_trans/trans_rva.c.inc |  51 +-
 target/riscv/insn_trans/trans_rvb.c.inc | 382 ++++++++++---
 target/riscv/insn_trans/trans_rvd.c.inc | 127 +++--
 target/riscv/insn_trans/trans_rvf.c.inc | 149 +++--
 target/riscv/insn_trans/trans_rvh.c.inc | 266 ++-------
 target/riscv/insn_trans/trans_rvi.c.inc | 360 ++++++------
 target/riscv/insn_trans/trans_rvm.c.inc | 179 ++++--
 target/riscv/insn_trans/trans_rvv.c.inc | 151 ++---
 12 files changed, 1062 insertions(+), 1329 deletions(-)

-- 
2.25.1


