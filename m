Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nyh0v-0006G5-FL
	for mharc-qemu-riscv@gnu.org; Tue, 07 Jun 2022 17:45:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nyh0s-0006CI-Nz; Tue, 07 Jun 2022 17:45:22 -0400
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e]:44848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nyh0q-0001zn-Jd; Tue, 07 Jun 2022 17:45:22 -0400
Received: by mail-oi1-x22e.google.com with SMTP id i66so25638076oia.11;
 Tue, 07 Jun 2022 14:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l1ODZxGZ+O8p1LF2TKsryp2FNeroVk6V8r89PMf0cBs=;
 b=clsn0+5uTQZ2jQkkLwK47YqihBa0pkD2LG7eYHYm7fuWvbFl7Kp+qshWUYTtrD22Df
 p83JJFLKcJkTac/HYjHvF+onNOGyDGE7LP9Oiiqe1yJ2SntB95Qey5WEBlFD6UGEjQWK
 1oIXTvUSwll6CionYQN4IlLJq+AOz9qhyC4dLLnnhMH9ojqmf5SUVUoObTJl7URiwbBN
 cN+F1AMIyF+5UCTQYekQQG3V+XHM2QZBYC59EcuOgEhX/YO3xg99UEiwf6OM8xGnvonl
 SaRjHPbaxYuFniXdxgONbq5sPX2mmhEfoDw/VIXXzx2KQDbIz6n2tMHOVF3GWWp6FFQP
 Ncyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l1ODZxGZ+O8p1LF2TKsryp2FNeroVk6V8r89PMf0cBs=;
 b=TleifSjrEIN4tYdwpPkGQCNgYyBo9o05n7I/xXU52WgyjCJ3XRdBiTAIDTByTQDsDC
 Bqyiz4kv8kczlMYGdn431YvxUIX+wmERFpXni4RCZxURy7nOQ1QSl7tVh0gGv2+mnXry
 hPWt6Gswzlpgsf46S8xzBztuLAiVMOFcThAFUO8MBNS8hx7jc5aHl1HjFUnbB0uj3E1o
 ETzEfeeGCpitChs+onaXIgRgGDHlFZ29Ib6DAWEq0d6hFmdiW0J2W/i3PB90W7X/kBOY
 qHZtUKiKD7g9jnJ9XxWHCZhjrwosyiZr3RoJBed+nzLD3/1UAaC28IPaoaoVFw/HQk8a
 zORQ==
X-Gm-Message-State: AOAM532hLXOO9OMoj29uuLWzZdclvC/gkIJp78lMyhPKO9AiqJHrNZum
 0bCbZVc6a2nno8F75vAvpeGeLeFUWZuATgFYYUU=
X-Google-Smtp-Source: ABdhPJx47BLC9RwDBCcucRJXpeuBuWavJS8EP9sY6f/56UUdRzgr+aJHRwgUyuvJ9Y3UFomR96RtI4m2ALJevYx2sCs=
X-Received: by 2002:a05:6808:2126:b0:32e:a750:f8b4 with SMTP id
 r38-20020a056808212600b0032ea750f8b4mr590456oiw.278.1654638318619; Tue, 07
 Jun 2022 14:45:18 -0700 (PDT)
MIME-Version: 1.0
References: <165449614532.19704.7000832880482980398-0@git.sr.ht>
In-Reply-To: <165449614532.19704.7000832880482980398-0@git.sr.ht>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 8 Jun 2022 07:44:52 +1000
Message-ID: <CAKmqyKMBqcFjYaaE-cuVNGrKDkYJLZfjAb70MFfsa7aC_KAQsg@mail.gmail.com>
Subject: Re: [PATCH qemu v19 00/16] Add tail agnostic behavior for rvv
 instructions
To: "~eopxd" <yueh.ting.chen@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Frank Chang <frank.chang@sifive.com>, 
 WeiWei Li <liweiwei@iscas.ac.cn>, eop Chen <eop.chen@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=alistair23@gmail.com; helo=mail-oi1-x22e.google.com
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
X-List-Received-Date: Tue, 07 Jun 2022 21:45:23 -0000

On Mon, Jun 6, 2022 at 4:22 PM ~eopxd <eopxd@git.sr.ht> wrote:
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
> - Add missing space in WeiWei's Reviewed-by tag
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
> - Tag Alistair as Acked-by for commit 04 ~ 14
> - Tag Alistair as Acked-by for commit 15
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
> v19 updates:
> - Tag Alistair as Reviewed by for commit 02
> - Rebase to alistair23/qemu/riscv-to-apply.next
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
>
>  target/riscv/cpu.c                      |    2 +
>  target/riscv/cpu.h                      |    2 +
>  target/riscv/cpu_helper.c               |    2 +
>  target/riscv/insn_trans/trans_rvv.c.inc |   94 +-
>  target/riscv/internals.h                |    6 +-
>  target/riscv/translate.c                |    4 +
>  target/riscv/vector_helper.c            | 1587 ++++++++++++++---------
>  7 files changed, 1054 insertions(+), 643 deletions(-)

Thanks!

Applied to riscv-to-apply.next

Alistair

>
> --
> 2.34.2
>

