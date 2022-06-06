Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ny63x-0002DF-VG
	for mharc-qemu-riscv@gnu.org; Mon, 06 Jun 2022 02:18:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eop.chen@sifive.com>)
 id 1ny63V-0001pq-0W
 for qemu-riscv@nongnu.org; Mon, 06 Jun 2022 02:17:38 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:50722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eop.chen@sifive.com>)
 id 1ny63S-0000xM-5n
 for qemu-riscv@nongnu.org; Mon, 06 Jun 2022 02:17:35 -0400
Received: by mail-pj1-x1031.google.com with SMTP id e24so12054376pjt.0
 for <qemu-riscv@nongnu.org>; Sun, 05 Jun 2022 23:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=dEEZtTwsUZEZ2S9BnsX4qE3eDYFKV1gMfVRTVWpPqx8=;
 b=NS6MVfAXJDWBWSwIMFKoPFM3yBrR/f8U1wm2MjgAPd/WcAeAwvuRds2XqIOlnFP+v5
 O1w3CuYD1Wk90ryoZI42ptYytvprOxLA2ewd68hOFQSGnO0IzeElQBMTR35RYpnNB5u8
 XcPCoj7AxJaIuGHPfvYNjNoMF+WKyMqWEJuQ1Gp2xS105ZvlWmm3CQ9xQ4XKlamLzirN
 blmZwsd8JdELMItK36yHMreO+Bs40b+bKnn6vcS0C1XJxR2Uj1Uglbu94O5IZBOgjJc4
 5sLhRK4RLc/cO807jOGfpjHE1eNq/pqPLHY9XQgc6k6dPsrO+AXRfxv9A+CzU6tXb6es
 XtXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=dEEZtTwsUZEZ2S9BnsX4qE3eDYFKV1gMfVRTVWpPqx8=;
 b=tw9iYfwMKir+8N6BWO5cqCxKXCO1hJos6saTkzs0FlYn3sl7Qc9hI4XJjfo9+aG4M8
 oOd1MEzwsLb65rWzvwjIszpqgY1TmxDzRCjdwevoao9hXg5U1KIWOuoagY8kyZjMfxuA
 Fk5kQhAq94judboxrNNw45Q6MHHnorDWijSun/gyDF3YmuzcQdshGeRz2cSg1QeHmyLw
 gE5j3k4OphKAHT1CcIaulq3PBTgG+khEzfkkvnCyeitjCEPLGLURpeVNZiMXOx13kgXW
 8ueCy77HY8SYapAALwLMnVpYExYboWU2dwIyJYs+o2xEhoAGI/I+P7KY00VuUJ5wPPXS
 OrFw==
X-Gm-Message-State: AOAM5313ki89ZwkGUjhFoQq48f0rgjeAjDxPpv5JE2OG+htUeG8Qf5Qu
 T8UwuQmhIE7QWiONQuHYoiGsmA==
X-Google-Smtp-Source: ABdhPJxJY7vt0Zw7OjMfRrzlCJSyb1gE6cPsziUzYAJsLFh1h4Boaqg9nTofjC2c/bYQ5qlkURfrIg==
X-Received: by 2002:a17:90b:4acb:b0:1e8:67df:6c61 with SMTP id
 mh11-20020a17090b4acb00b001e867df6c61mr8730760pjb.224.1654496252128; 
 Sun, 05 Jun 2022 23:17:32 -0700 (PDT)
Received: from smtpclient.apple
 (2001-b400-e431-5032-d8ed-28d5-0325-1f68.emome-ip6.hinet.net.
 [2001:b400:e431:5032:d8ed:28d5:325:1f68])
 by smtp.gmail.com with ESMTPSA id
 q6-20020a170902a3c600b00165105518f6sm9671144plb.287.2022.06.05.23.17.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 05 Jun 2022 23:17:31 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.60.0.1.1\))
Subject: Re: [PATCH qemu v18 00/16] Add tail agnostic behavior for rvv
 instructions
From: eop Chen <eop.chen@sifive.com>
In-Reply-To: <CAKmqyKOx4xMW9e+tYbbiYE1W96pDiAp-5UU7tccn8UFQHw6+XA@mail.gmail.com>
Date: Mon, 6 Jun 2022 14:17:28 +0800
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Frank Chang <frank.chang@sifive.com>,
 WeiWei Li <liweiwei@iscas.ac.cn>
Content-Transfer-Encoding: quoted-printable
Message-Id: <C3C50B1B-2BA8-4F81-BE20-F5BFFE318D05@sifive.com>
References: <165244259451.12806.1710403216414520477-0@git.sr.ht>
 <CAKmqyKOx4xMW9e+tYbbiYE1W96pDiAp-5UU7tccn8UFQHw6+XA@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
X-Mailer: Apple Mail (2.3693.60.0.1.1)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=eop.chen@sifive.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Mon, 06 Jun 2022 06:17:47 -0000

Rebased to riscv-to-apply.next and submitted v19.
Thank you WeiWei, Frank and Alistair for the reviews along the way.

Regards,

eop Chen

> Alistair Francis <alistair23@gmail.com> =E6=96=BC 2022=E5=B9=B46=E6=9C=88=
6=E6=97=A5 =E4=B8=8A=E5=8D=889:37 =E5=AF=AB=E9=81=93=EF=BC=9A
>=20
> On Fri, May 13, 2022 at 9:55 PM ~eopxd <eopxd@git.sr.ht> wrote:
>>=20
>> According to v-spec, tail agnostic behavior can be either kept as
>> undisturbed or set elements' bits to all 1s. To distinguish the
>> difference of tail policies, QEMU should be able to simulate the tail
>> agnostic behavior as "set tail elements' bits to all 1s". An option
>> 'rvv_ta_all_1s' is added to enable the behavior, it is default as
>> disabled.
>>=20
>> There are multiple possibility for agnostic elements according to
>> v-spec. The main intent of this patch-set tries to add option that
>> can distinguish between tail policies. Setting agnostic elements to
>> all 1s makes things simple and allow QEMU to express this.
>>=20
>> We may explore other possibility of agnostic behavior by adding
>> other options in the future. Please understand that this patch-set
>> is limited.
>>=20
>> v2 updates:
>> - Addressed comments from Weiwei Li
>> - Added commit tail agnostic on load / store instructions (which
>>  I forgot to include into the patch-set)
>>=20
>> v3 updates:
>> - Missed the very 1st commit, adding it back
>>=20
>> v4 updates:
>> - Renamed vlmax to total_elems
>> - Deal with tail element when vl_eq_vlmax =3D=3D true
>>=20
>> v5 updates:
>> - Let `vext_get_total_elems` take `desc` and `esz`
>> - Utilize `simd_maxsz(desc)` to get `vlenb`
>> - Fix alignments to code
>>=20
>> v6 updates:
>> - Fix `vext_get_total_elems`
>>=20
>> v7 updates:
>> - Reuse `max_elems` for vector load / store helper functions. The
>>  translation sets desc's `lmul` to `min(1, lmul)`, making
>>  `vext_max_elems` equivalent to `vext_get_total_elems`.
>>=20
>> v8 updates:
>> - Simplify `vext_set_elems_1s`, don't need `vext_set_elems_1s_fns`
>> - Fix `vext_get_total_elems`, it should derive upon EMUL instead
>>  of LMUL
>>=20
>> v9 updates:
>> - Let instructions that is tail agnostic regardless of vta respect =
the
>>  option and not the vta.
>>=20
>> v10 updates:
>> - Correct range to set element to 1s for load instructions
>>=20
>> v11 updates:
>> - Separate addition of option 'rvv_ta_all_1s' as a new (last) commit
>> - Add description to show intent of the option in first commit for =
the
>>  optional tail agnostic behavior
>> - Tag WeiWei as Reviewed-by for all commits
>> - Tag Alistair as Reviewed-by for commit 01, 02
>> - Tag Alistair as Acked-by for commit 03
>>=20
>> v12 updates:
>> - Add missing space in WeiWei's "Reviewed-by" tag
>>=20
>> v13 updates:
>> - Fix tail agnostic for vext_ldst_us. The function operates on input
>>  parameter 'evl' rather than 'env->vl'.
>> - Fix tail elements for vector segment load / store instructions
>>  A vector segment load / store instruction may contain fractional
>>  lmul with nf * lmul > 1. The rest of the elements in the last
>>  register should be treated as tail elements.
>> - Fix tail agnostic length for instructions with mask destination
>>  register. Instructions with mask destination register should have
>>  'vlen - vl' tail elements.
>>=20
>> v14 updates:
>> - Pass lmul information to into vector helper function.
>>  `vext_get_total_elems` needs it.
>>=20
>> v15 updates:
>> - Rebase to latest `master`
>> - Tag Alistair as Acked by for commit 04 ~ 14
>> - Tag Alistair as Acked by for commit 15
>>=20
>> v16 updates:
>> - Fix bug, when encountering situation when lmul < 0 and vl_eq_vlmax,
>>  the original version will override on `vd` but the computation will
>>  override again, meaning the tail elements will not be set correctly.
>>  Now, we don't use TCG functions if we are trying to simulate all 1s
>>  for agnostic and use vector helpers instead.
>>=20
>> v17 updates:
>> - Add "Prune access_type parameter" commit to cleanup vector load/
>>  store functions. Then add parameter `is_load` in vector helper
>>  functions to enable vta behavior in the commit for adding vta on
>>  vector load/store functions.
>>=20
>> v18 updates:
>> - Don't use `is_load` parameter in vector helper. Don't let vta pass
>>   through in `trans_rvv.inc`
>>=20
>> eopXD (16):
>>  target/riscv: rvv: Prune redundant ESZ, DSZ parameter passed
>>  target/riscv: rvv: Prune redundant access_type parameter passed
>>  target/riscv: rvv: Rename ambiguous esz
>>  target/riscv: rvv: Early exit when vstart >=3D vl
>>  target/riscv: rvv: Add tail agnostic for vv instructions
>>  target/riscv: rvv: Add tail agnostic for vector load / store
>>    instructions
>>  target/riscv: rvv: Add tail agnostic for vx, vvm, vxm instructions
>>  target/riscv: rvv: Add tail agnostic for vector integer shift
>>    instructions
>>  target/riscv: rvv: Add tail agnostic for vector integer comparison
>>    instructions
>>  target/riscv: rvv: Add tail agnostic for vector integer merge and =
move
>>    instructions
>>  target/riscv: rvv: Add tail agnostic for vector fix-point arithmetic
>>    instructions
>>  target/riscv: rvv: Add tail agnostic for vector floating-point
>>    instructions
>>  target/riscv: rvv: Add tail agnostic for vector reduction =
instructions
>>  target/riscv: rvv: Add tail agnostic for vector mask instructions
>>  target/riscv: rvv: Add tail agnostic for vector permutation
>>    instructions
>>  target/riscv: rvv: Add option 'rvv_ta_all_1s' to enable optional =
tail
>>    agnostic behavior
>=20
> Do you mind rebasing this on:
> https://github.com/alistair23/qemu/tree/riscv-to-apply.next
>=20
> Alistair
>=20
>>=20
>> target/riscv/cpu.c                      |    1 +
>> target/riscv/cpu.h                      |    2 +
>> target/riscv/cpu_helper.c               |    2 +
>> target/riscv/insn_trans/trans_rvv.c.inc |   94 +-
>> target/riscv/internals.h                |    6 +-
>> target/riscv/translate.c                |    4 +
>> target/riscv/vector_helper.c            | 1587 =
++++++++++++++---------
>> 7 files changed, 1053 insertions(+), 643 deletions(-)
>>=20
>> --
>> 2.34.2
>>=20


