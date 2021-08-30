Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mKeHT-0003Lt-MF
	for mharc-qemu-riscv@gnu.org; Mon, 30 Aug 2021 06:12:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mKeHR-0003L2-Hx; Mon, 30 Aug 2021 06:12:41 -0400
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a]:46673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mKeHP-0005Ce-Ey; Mon, 30 Aug 2021 06:12:41 -0400
Received: by mail-il1-x12a.google.com with SMTP id r6so15363003ilt.13;
 Mon, 30 Aug 2021 03:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HNIirtcW0rqC/C1IDeTCoVAvWL+UjMO4sZpjk7Cupk0=;
 b=oDpgKjJsqc+Eth1DknduE5Mk457YEePtS8/Xb6jPBCA6XR5TDveIldRhSIM7yD5Tbn
 imu0J+WXMe9jSgVvYNpiwN9reEu7CgqEXpvrtXWFQlViajdOuZ72Ml/+6NFwtlGbvvVl
 mfbZ9OkjDJZmhZ9+l7OEzqBPi9iF/S0GrHLMDtvfumokFaRjHgzqf+WwW+bxXe5x51dz
 46th346hTslTyeO6ryGxMIGUyzaXNYwvMHyCPvvivyt0Fwlf6CzD7KkM5RVsoSvB5Wao
 mh8EeuL1FmPhAvvkNtBWbp1P+xusCUYEKfQRaoV7XSYbK6WPej1ZAF4Ula8LlvcukzAW
 0vIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HNIirtcW0rqC/C1IDeTCoVAvWL+UjMO4sZpjk7Cupk0=;
 b=ZYayYDdHUbVVFR4Z+7mew7qeQ1gND+YbHA/MAOcC4o6DPvh7hKDZfoQ+hAEhNR01AG
 XFZYZN90sea2/B8NplRest+pULGZ1ThuPB4qT+qAjf0Sk7W3UqBEis/1lPY7w8bbCBz1
 PiWJKCd0ABr+6oanZfd+BEX6KZHQN94w52sBoc9caECRzWM+bbxGl1XLBCuLuc+AGfh+
 kCrK/apZOb56hiW4gGJyGkPOuxjMMwZvsGtHtveWJl6K8G9WOQdHGrk9mL+iXg8k+HAh
 Xa3o30XGej8ndGHvk32c2X0s36+6vHgWi11kGOWVrFMCNlRFyxzGhaG2tR+JfRBUcYcu
 6BOQ==
X-Gm-Message-State: AOAM5309EVyI/wu9uT83xtKbUeNv4dM37TzjeMzedMntkBTOj03uyJP+
 J77FrwpuKzDgX4kbhCuEbG00V74nHdvhH/P3PS4=
X-Google-Smtp-Source: ABdhPJy66pYGCeh068HSpAL80iKUe5pDDM98z3JNG9C1D5OK2/GN/bGyMhH6mbFkolHuFIrALLcIyVH4oN3nK5uskd0=
X-Received: by 2002:a92:6802:: with SMTP id d2mr15454990ilc.40.1630318357962; 
 Mon, 30 Aug 2021 03:12:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210820174257.548286-1-richard.henderson@linaro.org>
In-Reply-To: <20210820174257.548286-1-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 30 Aug 2021 20:12:11 +1000
Message-ID: <CAKmqyKM7aoT9a7rZnbNukZb7mO-2zJddnKr1XkA+WbkidHRoxQ@mail.gmail.com>
Subject: Re: [PATCH v4 00/21] target/riscv: Use tcg_constant_*
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12a;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Mon, 30 Aug 2021 10:12:41 -0000

On Sat, Aug 21, 2021 at 3:43 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Replace use of tcg_const_*, which makes a copy into a temp which must
> be freed, with direct use of the constant.  Reorg handling of $zero,
> with different accessors for source and destination.  Reorg handling
> of csrs, passing the actual write_mask instead of a regno.  Use more
> helpers for RVH expansion.
>
> Patches lacking review:
>   02-tests-tcg-riscv64-Add-test-for-division.patch
>   03-target-riscv-Clean-up-division-helpers.patch
>   11-target-riscv-Add-DisasExtend-to-gen_unary.patch
>   17-target-riscv-Use-gen_shift_imm_fn-for-slli_uw.patch
>   21-target-riscv-Use-get-dest-_gpr-for-RVV.patch

This should be all reviewed now. Do you want me to take it or do you plan on it?

Alistair

>
> Changes for v4:
>   * Add a test for division, primarily checking the edge cases.
>   * Dropped the greviw patch, since grev has been dropped from Zbb 1.0.0.
>
> Changes for v3:
>   * Fix an introduced remainder bug (bin meng),
>     and remove one extra movcond from rem/remu.
>   * Do not zero DisasContext on allocation (bin meng).
>
> Changes for v2:
>   * Retain the requirement to call gen_set_gpr.
>   * Add DisasExtend as an argument to get_gpr, and ctx->w as a member
>     of DisasContext.  This should help in implementing UXL, where we
>     should be able to set ctx->w for all insns, but there is certainly
>     more required for that.
>
> r~
>
>
> Richard Henderson (21):
>   target/riscv: Use tcg_constant_*
>   tests/tcg/riscv64: Add test for division
>   target/riscv: Clean up division helpers
>   target/riscv: Add DisasContext to gen_get_gpr, gen_set_gpr
>   target/riscv: Introduce DisasExtend and new helpers
>   target/riscv: Add DisasExtend to gen_arith*
>   target/riscv: Remove gen_arith_div*
>   target/riscv: Use gen_arith for mulh and mulhu
>   target/riscv: Move gen_* helpers for RVM
>   target/riscv: Move gen_* helpers for RVB
>   target/riscv: Add DisasExtend to gen_unary
>   target/riscv: Use DisasExtend in shift operations
>   target/riscv: Use get_gpr in branches
>   target/riscv: Use {get,dest}_gpr for integer load/store
>   target/riscv: Reorg csr instructions
>   target/riscv: Use {get,dest}_gpr for RVA
>   target/riscv: Use gen_shift_imm_fn for slli_uw
>   target/riscv: Use {get,dest}_gpr for RVF
>   target/riscv: Use {get,dest}_gpr for RVD
>   target/riscv: Tidy trans_rvh.c.inc
>   target/riscv: Use {get,dest}_gpr for RVV
>
>  target/riscv/helper.h                   |   6 +-
>  target/riscv/insn32.decode              |   1 +
>  target/riscv/op_helper.c                |  18 +-
>  target/riscv/translate.c                | 701 ++++++------------------
>  tests/tcg/riscv64/test-div.c            |  58 ++
>  target/riscv/insn_trans/trans_rva.c.inc |  51 +-
>  target/riscv/insn_trans/trans_rvb.c.inc | 370 ++++++++++---
>  target/riscv/insn_trans/trans_rvd.c.inc | 127 +++--
>  target/riscv/insn_trans/trans_rvf.c.inc | 149 +++--
>  target/riscv/insn_trans/trans_rvh.c.inc | 266 ++-------
>  target/riscv/insn_trans/trans_rvi.c.inc | 360 ++++++------
>  target/riscv/insn_trans/trans_rvm.c.inc | 191 +++++--
>  target/riscv/insn_trans/trans_rvv.c.inc | 151 ++---
>  tests/tcg/riscv64/Makefile.target       |   5 +
>  14 files changed, 1125 insertions(+), 1329 deletions(-)
>  create mode 100644 tests/tcg/riscv64/test-div.c
>  create mode 100644 tests/tcg/riscv64/Makefile.target
>
> --
> 2.25.1
>
>

