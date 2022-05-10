Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1noOGD-0004jX-Ow
	for mharc-qemu-riscv@gnu.org; Tue, 10 May 2022 07:42:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1noOFS-0004ff-ES; Tue, 10 May 2022 07:41:56 -0400
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:47059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1noOFO-0007Xp-Kt; Tue, 10 May 2022 07:41:48 -0400
Received: by mail-io1-xd33.google.com with SMTP id s23so6624978iog.13;
 Tue, 10 May 2022 04:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MJIfS8Ua7p73W/CJnMObrCut8MeGs+AUorwZEu9Njt0=;
 b=JWhkrohukVtENqEefC7T88zYFPsk2X9nGDEFdbcZufMmr+UTV868SyMoVXh1gB/VIP
 ujQr0zCZZXv9H/ieTRXHZjb3kuQhIOujlVOHo8UBSBbmVTgMHr+fRG5kyiVbjlDoE+LD
 dz3HuxorxbHwEFXR1PreADHsuJX0y21CkzILlZ0lMY6YeHEFBp7OT5gRLbV2hpGGt/9F
 ji3fV/Isg7psp+XGr+zxgu8ku7K+EEvNySl3pbfY44KQ61UifSpbZE8DZF6DcL89pe/6
 AQUpGOeSDYGRGIXGx3n4fknCiWpYYOZ00pZJxGs7m9u+tYCLZVlYDwjDOljglGOs5YQP
 M+CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MJIfS8Ua7p73W/CJnMObrCut8MeGs+AUorwZEu9Njt0=;
 b=O+94UpUFvNB2rmMZoe0i0XmuzLGJVBL/3paStcQ8yD63H/DBOSDwkpkJlVvZh6jAOi
 xj0GYR5G6sTIlH9JykISmVjliQ9jrnXWu9P3TLRFMuWbbaqNxXF5x0s6MxSQqxf6e8c4
 XGW3LNLqJqNfXjs6YB5pkOTldRY8GGCTi7S/QL+f2FWOoj1/nOY+i2h3XfosHbmzJODa
 RKIh+GpHOyR+vyuFYzqx9sXGOmMrxJ/W1qek8IBMqDczT8Hl37z1z2/KJkn06UEyAnwV
 bbULQXv9IK99Y8LLxOei4EKpAJSeZQk4Pr2V/LVrJaLhjD3AZSd7bs7pVYvTFybyp58p
 LiAw==
X-Gm-Message-State: AOAM533GpE+ArZeyqe+kF+eNDMEbmfbPg2KEY/J/c+CfPhdf8o+5M8+Q
 9RIzkZdJz8I9lmFPBk+0Ztl0nXja+PJQJEHcx/E=
X-Google-Smtp-Source: ABdhPJzHWAK2pp+/LAtIplEZRmx6sTj/GGtYQRkZb9aSuBmElI6mWKMja4rcVuySKhHN5IHuMYpi4cLhyvQVxRph0/M=
X-Received: by 2002:a05:6638:3711:b0:32b:ca0b:8a32 with SMTP id
 k17-20020a056638371100b0032bca0b8a32mr9136308jav.267.1652182905180; Tue, 10
 May 2022 04:41:45 -0700 (PDT)
MIME-Version: 1.0
References: <165156202959.27941.9731161369415852149-0@git.sr.ht>
In-Reply-To: <165156202959.27941.9731161369415852149-0@git.sr.ht>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 10 May 2022 13:41:19 +0200
Message-ID: <CAKmqyKPyjpzYrSHFCjjWwCNzW5XHe_8pn-5Q8+fep1NHksUQcg@mail.gmail.com>
Subject: Re: [PATCH qemu v14 00/15] Add tail agnostic behavior for rvv
 instructions
To: "~eopxd" <yueh.ting.chen@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Frank Chang <frank.chang@sifive.com>, 
 WeiWei Li <liweiwei@iscas.ac.cn>, eop Chen <eop.chen@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d33;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd33.google.com
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
X-List-Received-Date: Tue, 10 May 2022 11:42:30 -0000

On Tue, May 3, 2022 at 10:20 AM ~eopxd <eopxd@git.sr.ht> wrote:
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
> eopXD (15):
>   target/riscv: rvv: Prune redundant ESZ, DSZ parameter passed
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

Thanks for the patches, do you mind rebasing them on master?

Alistair

>
>  target/riscv/cpu.c                      |    1 +
>  target/riscv/cpu.h                      |    2 +
>  target/riscv/cpu_helper.c               |    2 +
>  target/riscv/insn_trans/trans_rvv.c.inc |  179 +++
>  target/riscv/internals.h                |    6 +-
>  target/riscv/translate.c                |    4 +
>  target/riscv/vector_helper.c            | 1558 ++++++++++++++---------
>  7 files changed, 1135 insertions(+), 617 deletions(-)
>
> --
> 2.34.2
>

