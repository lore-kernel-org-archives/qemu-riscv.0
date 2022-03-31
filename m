Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nZlLM-000535-PT
	for mharc-qemu-riscv@gnu.org; Wed, 30 Mar 2022 23:19:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nZlLL-00052t-DT; Wed, 30 Mar 2022 23:19:27 -0400
Received: from [2607:f8b0:4864:20::d2c] (port=39871
 helo=mail-io1-xd2c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nZlLJ-0000pF-LL; Wed, 30 Mar 2022 23:19:27 -0400
Received: by mail-io1-xd2c.google.com with SMTP id q11so27143000iod.6;
 Wed, 30 Mar 2022 20:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ymgJvkVQetMvTufNXDdfBD08xbB6CjT1rRu6h0GDiOw=;
 b=iV9VU5d7eiRFdxKTtwIJcOEro5xCNIMkJ8dHdDrjyVKH4yLMfLXsiVUzijF4Ibq3ZZ
 2P0Ahdnf03K00FgjFYTPf5zX4aXH0aIS1cEnnLwuvdhiA1EE/TpnTmxAZkuEe2/sjhTG
 67YUOeQtS9/jZY7aI5N19iwm4SqKwa+HPdFxVOUi6lHksxZMuaJE6Vlna/N3/5KSqHY3
 wyLdCiQf18aA//al8FwvUY2hSnsLQx0zLGNHoNX6TGuL7csS4P62RH6aFsrzmWU0tAlT
 T3HAfwm799iriSom1fsjtHz+gX/rg4ovuQ2WoIISXowFRwnhcWQwm5fZIrb/Egr8wuCG
 N47Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ymgJvkVQetMvTufNXDdfBD08xbB6CjT1rRu6h0GDiOw=;
 b=sGgT8TuYoeverFMMfaLwNWgba/b3ReVQ10zlhbk6N7SDa2xkRiM9hOzZtBZSH4cEA+
 tHDIKL/EP493HTaKoAl0LVPx2LGoRfQOdBWl79r2QNVHqfjo4KBezjcAwYYiDLpr8KTA
 jHI01azwnTWBKljYX1orswj5J7WlhGuRu1qQrUWZHLjA7PP10XOINxBWY4QPqvBDoQ6W
 k/MyO3BQO03UN9IEdCTIUfT5EjoyvmsJT9TWN8tnmgaWhNCUj2zx7LZBqshBJEjAXJyl
 91WCsSYr5zs11DjndVcXdavTSAKGufDnt5UNCncIpAfRFchky4+DKTFM5vxWJQI8knnW
 mGdg==
X-Gm-Message-State: AOAM530BqBdWcI5mJ7otaskFC0E4idZnr/ggHnabGaGS0RdjES/v299q
 cJN/NFomZmtN5CBXw7JXC3SQuTN0BXsdvCRlDxU=
X-Google-Smtp-Source: ABdhPJzvc+9erPqgRnD3sB0EGHpZDVPvkMzhMTHgtQ8p50AtVZ6jrC2xlwTVEguCYH4qOzx//vIcu3a04aWlMXxBK7Q=
X-Received: by 2002:a05:6638:2401:b0:323:7234:5217 with SMTP id
 z1-20020a056638240100b0032372345217mr1835378jat.68.1648696764052; Wed, 30 Mar
 2022 20:19:24 -0700 (PDT)
MIME-Version: 1.0
References: <164863587444.17401.9965527486691250478-0@git.sr.ht>
 <937de10f-be69-247b-562f-be34c17ca945@iscas.ac.cn>
 <CAKmqyKPtyKub=MChc_C7JpoXP7+bBwTSX_c4WhuRXaoWwWjehg@mail.gmail.com>
 <1b4004ea-68f9-b0ff-58e1-581eca7be182@iscas.ac.cn>
In-Reply-To: <1b4004ea-68f9-b0ff-58e1-581eca7be182@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 31 Mar 2022 13:18:57 +1000
Message-ID: <CAKmqyKNch1gN+3ieHF5p15AZki3NZjrpMcwjfpuz6n91HJZ2AA@mail.gmail.com>
Subject: Re: [PATCH qemu v7 00/14] Add tail agnostic behavior for rvv
 instructions
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: "~eopxd" <yueh.ting.chen@gmail.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 eop Chen <eop.chen@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2c.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 31 Mar 2022 03:19:27 -0000

On Thu, Mar 31, 2022 at 11:24 AM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
>
> =E5=9C=A8 2022/3/31 =E4=B8=8A=E5=8D=888:11, Alistair Francis =E5=86=99=E9=
=81=93:
> > On Wed, Mar 30, 2022 at 10:52 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote=
:
> >>
> >> =E5=9C=A8 2022/3/30 =E4=B8=8B=E5=8D=886:24, ~eopxd =E5=86=99=E9=81=93:
> >>> According to v-spec, tail agnostic behavior can be either kept as
> >>> undisturbed or set elements' bits to all 1s. To distinguish the
> >>> difference of tail policies, QEMU should be able to simulate the tail
> >>> agnostic behavior as "set tail elements' bits to all 1s". An option
> >>> 'rvv_ta_all_1s' is added to enable the behavior, it is default as
> >>> disabled.
> >>>
> >>> There are multiple possibility for agnostic elements according to
> >>> v-spec. The main intent of this patch-set tries to add option that
> >>> can distinguish between tail policies. Setting agnostic elements to
> >>> all 1s makes things simple and allow QEMU to express this.
> >>>
> >>> We may explore other possibility of agnostic behavior by adding
> >>> other options in the future. Please understand that this patch-set
> >>> is limited.
> >>>
> >>> v2 updates:
> >>> - Addressed comments from Weiwei Li
> >>> - Added commit tail agnostic on load / store instructions (which
> >>>      I forgot to include into the patch-set)
> >>>
> >>> v3 updates:
> >>> - Missed the very 1st commit, adding it back
> >>>
> >>> v4 updates:
> >>> - Renamed vlmax to total_elems
> >>> - Deal with tail element when vl_eq_vlmax =3D=3D true
> >>>
> >>> v5 updates:
> >>> - Let `vext_get_total_elems` take `desc` and `esz`
> >>> - Utilize `simd_maxsz(desc)` to get `vlenb`
> >>> - Fix alignments to code
> >>>
> >>> v6 updates:
> >>> - Fix `vext_get_total_elems`
> >>>
> >>> v7 updates:
> >>> - Reuse `max_elems` for vector load / store helper functions. The
> >>>      translation sets desc's `lmul` to `min(1, lmul)`, making
> >>> `vext_max_elems`
> >>>      equivalent to `vext_get_total_elems`.
> >>>
> >>> eopXD (14):
> >>>     target/riscv: rvv: Prune redundant ESZ, DSZ parameter passed
> >>>     target/riscv: rvv: Rename ambiguous esz
> >>>     target/riscv: rvv: Early exit when vstart >=3D vl
> >>>     target/riscv: rvv: Add tail agnostic for vv instructions
> >>>     target/riscv: rvv: Add tail agnostic for vector load / store
> >>>       instructions
> >>>     target/riscv: rvv: Add tail agnostic for vx, vvm, vxm instruction=
s
> >>>     target/riscv: rvv: Add tail agnostic for vector integer shift
> >>>       instructions
> >>>     target/riscv: rvv: Add tail agnostic for vector integer compariso=
n
> >>>       instructions
> >>>     target/riscv: rvv: Add tail agnostic for vector integer merge and=
 move
> >>>       instructions
> >>>     target/riscv: rvv: Add tail agnostic for vector fix-point arithme=
tic
> >>>       instructions
> >>>     target/riscv: rvv: Add tail agnostic for vector floating-point
> >>>       instructions
> >>>     target/riscv: rvv: Add tail agnostic for vector reduction instruc=
tions
> >>>     target/riscv: rvv: Add tail agnostic for vector mask instructions
> >>>     target/riscv: rvv: Add tail agnostic for vector permutation
> >>>       instructions
> >>>
> >>>    target/riscv/cpu.c                      |    1 +
> >>>    target/riscv/cpu.h                      |    2 +
> >>>    target/riscv/cpu_helper.c               |    2 +
> >>>    target/riscv/insn_trans/trans_rvv.c.inc |  164 +++
> >>>    target/riscv/internals.h                |    5 +-
> >>>    target/riscv/translate.c                |    2 +
> >>>    target/riscv/vector_helper.c            | 1562 ++++++++++++++-----=
----
> >>>    7 files changed, 1121 insertions(+), 617 deletions(-)
> >>>
> >> The patchset looks good to me.
> > Do you want to add a reviewed-by or acked-by tag?
> >
> > Alistair
>
> Is there any other prerequirement to add these tags?  If not, It's OK
> for me to add reviewed-by on this patchset.

There is no single rule, it's a personal decision. Generally if you
have read through the code, understand it and think it works (matches
QEMU style and architecture, bug free, matches hardware spec, etc)
then you review it.

>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Thanks!

Alistair

>
> Regards,
>
> Weiwei Li
>
> >> Regards,
> >>
> >> Weiwei Li
> >>
> >>
>

