Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ny1gq-0004PF-R4
	for mharc-qemu-riscv@gnu.org; Sun, 05 Jun 2022 21:37:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ny1go-0004OQ-7W; Sun, 05 Jun 2022 21:37:54 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c]:38485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ny1gl-0008M1-9C; Sun, 05 Jun 2022 21:37:53 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-e5e433d66dso17552438fac.5; 
 Sun, 05 Jun 2022 18:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9S7+MhC0WSwuwPr9D1w78ndUfx3Q1totpMLBffYxiLM=;
 b=GRleAl2ze3D2x23vbcp+P+tCTkv4dI6ibXpBzVYZDmsCkgRU/yKwq4l7cmryQrhqF3
 Ron5yyL1nRIl0mnUtj+tvxeC9K/wFMJ/4XBxIXbpSHQW+WAnQc4MaYLa16h4/O8LpoeJ
 t/V6kE9jGNB4O6g8dNqr52PTQVNzGWCBB6VS0ioWXPMGp+2rljVenb6DgNtI73x1j/QX
 sPfhJRzlyK/jXjZMzkb0j0k5jOfk8ZghWvcba1Fq9xYpxO77IDd2sQfi49PoGfwAwvoO
 uqtMGqJ8LI6xRcXExyAsRd2twlzoBOqce/YTiGWYDucOzF/onXkG+Kp5YoyRbC7N+Z2n
 pFrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9S7+MhC0WSwuwPr9D1w78ndUfx3Q1totpMLBffYxiLM=;
 b=iMC+TV30RTPfEicyuAas6l+NdhS+i7pzPituuMAVsalLdB+zOQ4NH+pdqT7v0yycGj
 zF/Pj882VRgW0LptQ5sbomOAuQtdvyDZKfEMyzyzCY9loVjqSJxDBfWT5pE1Qz5Xc6mM
 49TV9NR6gfQapzuHZ0GQtp8xmjB8CbaPdeBb4SenZNp2Ibu5NeQEWpA2jhnpZmhVARgn
 o7+NWrrGq105oUOiM3TgnBvqsd3Rcpicd8IX6lmVKZ/IxTu4FBByoyPeOD8uTVhkT/iK
 P45iNgX4rjN0Ayx+ANzpOG5EVVaFemMoIOI9keN9Ux5pq5zyX8HC48rn9dlPLG5SXV8n
 dJrw==
X-Gm-Message-State: AOAM5324CCbXxK4oq+XnteuOK7Lf1vWGgrFbGPBlfxhHn3UA1XNSrvNe
 fLqxnDBZhyF4i48k3nH2muHCcyi6XIpoQyxzcfA=
X-Google-Smtp-Source: ABdhPJx1qyfTrE6BmZsCj+Thcwou1G/cgbOZNaVTFkLlfhQUBD4I71HTtCLjXiaeweXog7UF3EW0RqJV0esOo7wP3So=
X-Received: by 2002:a05:6870:458e:b0:fb:39b1:1afc with SMTP id
 y14-20020a056870458e00b000fb39b11afcmr4088494oao.64.1654479468454; Sun, 05
 Jun 2022 18:37:48 -0700 (PDT)
MIME-Version: 1.0
References: <165244259451.12806.1710403216414520477-0@git.sr.ht>
In-Reply-To: <165244259451.12806.1710403216414520477-0@git.sr.ht>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Jun 2022 11:37:22 +1000
Message-ID: <CAKmqyKOx4xMW9e+tYbbiYE1W96pDiAp-5UU7tccn8UFQHw6+XA@mail.gmail.com>
Subject: Re: [PATCH qemu v18 00/16] Add tail agnostic behavior for rvv
 instructions
To: "~eopxd" <yueh.ting.chen@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Frank Chang <frank.chang@sifive.com>, 
 WeiWei Li <liweiwei@iscas.ac.cn>, eop Chen <eop.chen@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=alistair23@gmail.com; helo=mail-oa1-x2c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 06 Jun 2022 01:37:54 -0000

On Fri, May 13, 2022 at 9:55 PM ~eopxd <eopxd@git.sr.ht> wrote:
>
> According to v-spec, tail agnostic behavior can be either kept as
> undisturbed or set elements' bits to all 1s. To distinguish the
> difference of tail policies, QEMU should be able to simulate the tail
> agnostic behavior as "set tail elements' bits to all 1s". An option
> 'rvv_ta_all_1s' is added to enable the behavior, it is default as
> disabled.
>
> There are multiple possibility for agnostic elements according to
> v-spec. The main intent of this patch-set tries to add option that
> can distinguish between tail policies. Setting agnostic elements to
> all 1s makes things simple and allow QEMU to express this.
>
> We may explore other possibility of agnostic behavior by adding
> other options in the future. Please understand that this patch-set
> is limited.
>
> v2 updates:
> - Addressed comments from Weiwei Li
> - Added commit tail agnostic on load / store instructions (which
>   I forgot to include into the patch-set)
>
> v3 updates:
> - Missed the very 1st commit, adding it back
>
> v4 updates:
> - Renamed vlmax to total_elems
> - Deal with tail element when vl_eq_vlmax == true
>
> v5 updates:
> - Let `vext_get_total_elems` take `desc` and `esz`
> - Utilize `simd_maxsz(desc)` to get `vlenb`
> - Fix alignments to code
>
> v6 updates:
> - Fix `vext_get_total_elems`
>
> v7 updates:
> - Reuse `max_elems` for vector load / store helper functions. The
>   translation sets desc's `lmul` to `min(1, lmul)`, making
>   `vext_max_elems` equivalent to `vext_get_total_elems`.
>
> v8 updates:
> - Simplify `vext_set_elems_1s`, don't need `vext_set_elems_1s_fns`
> - Fix `vext_get_total_elems`, it should derive upon EMUL instead
>   of LMUL
>
> v9 updates:
> - Let instructions that is tail agnostic regardless of vta respect the
>   option and not the vta.
>
> v10 updates:
> - Correct range to set element to 1s for load instructions
>
> v11 updates:
> - Separate addition of option 'rvv_ta_all_1s' as a new (last) commit
> - Add description to show intent of the option in first commit for the
>   optional tail agnostic behavior
> - Tag WeiWei as Reviewed-by for all commits
> - Tag Alistair as Reviewed-by for commit 01, 02
> - Tag Alistair as Acked-by for commit 03
>
> v12 updates:
> - Add missing space in WeiWei's "Reviewed-by" tag
>
> v13 updates:
> - Fix tail agnostic for vext_ldst_us. The function operates on input
>   parameter 'evl' rather than 'env->vl'.
> - Fix tail elements for vector segment load / store instructions
>   A vector segment load / store instruction may contain fractional
>   lmul with nf * lmul > 1. The rest of the elements in the last
>   register should be treated as tail elements.
> - Fix tail agnostic length for instructions with mask destination
>   register. Instructions with mask destination register should have
>   'vlen - vl' tail elements.
>
> v14 updates:
> - Pass lmul information to into vector helper function.
>   `vext_get_total_elems` needs it.
>
> v15 updates:
> - Rebase to latest `master`
> - Tag Alistair as Acked by for commit 04 ~ 14
> - Tag Alistair as Acked by for commit 15
>
> v16 updates:
> - Fix bug, when encountering situation when lmul < 0 and vl_eq_vlmax,
>   the original version will override on `vd` but the computation will
>   override again, meaning the tail elements will not be set correctly.
>   Now, we don't use TCG functions if we are trying to simulate all 1s
>   for agnostic and use vector helpers instead.
>
> v17 updates:
> - Add "Prune access_type parameter" commit to cleanup vector load/
>   store functions. Then add parameter `is_load` in vector helper
>   functions to enable vta behavior in the commit for adding vta on
>   vector load/store functions.
>
> v18 updates:
> - Don't use `is_load` parameter in vector helper. Don't let vta pass
>    through in `trans_rvv.inc`
>
> eopXD (16):
>   target/riscv: rvv: Prune redundant ESZ, DSZ parameter passed
>   target/riscv: rvv: Prune redundant access_type parameter passed
>   target/riscv: rvv: Rename ambiguous esz
>   target/riscv: rvv: Early exit when vstart >= vl
>   target/riscv: rvv: Add tail agnostic for vv instructions
>   target/riscv: rvv: Add tail agnostic for vector load / store
>     instructions
>   target/riscv: rvv: Add tail agnostic for vx, vvm, vxm instructions
>   target/riscv: rvv: Add tail agnostic for vector integer shift
>     instructions
>   target/riscv: rvv: Add tail agnostic for vector integer comparison
>     instructions
>   target/riscv: rvv: Add tail agnostic for vector integer merge and move
>     instructions
>   target/riscv: rvv: Add tail agnostic for vector fix-point arithmetic
>     instructions
>   target/riscv: rvv: Add tail agnostic for vector floating-point
>     instructions
>   target/riscv: rvv: Add tail agnostic for vector reduction instructions
>   target/riscv: rvv: Add tail agnostic for vector mask instructions
>   target/riscv: rvv: Add tail agnostic for vector permutation
>     instructions
>   target/riscv: rvv: Add option 'rvv_ta_all_1s' to enable optional tail
>     agnostic behavior

Do you mind rebasing this on:
https://github.com/alistair23/qemu/tree/riscv-to-apply.next

Alistair

>
>  target/riscv/cpu.c                      |    1 +
>  target/riscv/cpu.h                      |    2 +
>  target/riscv/cpu_helper.c               |    2 +
>  target/riscv/insn_trans/trans_rvv.c.inc |   94 +-
>  target/riscv/internals.h                |    6 +-
>  target/riscv/translate.c                |    4 +
>  target/riscv/vector_helper.c            | 1587 ++++++++++++++---------
>  7 files changed, 1053 insertions(+), 643 deletions(-)
>
> --
> 2.34.2
>

