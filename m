Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8B02C7EE23
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 03:44:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q8YTt-0005Wj-Hg; Sun, 11 Jun 2023 23:44:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q8YTr-0005Vu-CV; Sun, 11 Jun 2023 23:44:35 -0400
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q8YTp-0001rt-Pv; Sun, 11 Jun 2023 23:44:35 -0400
Received: by mail-vs1-xe29.google.com with SMTP id
 ada2fe7eead31-4301281573aso844107137.3; 
 Sun, 11 Jun 2023 20:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686541472; x=1689133472;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oqs+P/Nsn5g1qJr9m0Yneg06WdyFWJnEgcVFmwJ7l/g=;
 b=UJncK/evUhHti89dBBuAk40iz87McWSAr4LjGrjwXKiWGT1uopH2O/jqOnbOM/uS7R
 Xgjf0v/ZdlnHRiKwTFzKVATl6JPuDlhbXH0FrN1JPJ9C4piValNIzH70L0ZMjLbDv1sE
 Zz0CpNJ5T48Y4H4FpMEmTdcwBk3p7V8GBtwpDYIMYTzL0w5olDM7aa+ylX8wqW2l7HFI
 30op8qyjxYDs543fGziZj+ODQCnXtR8s/3YSIeWg1dL5K2k/KT2nnra6K0cyVkvAVMHH
 B+Phx7l8j4JhLCf+Wm3DsO4b+gjDmWDeIoean+fd7XhhTDVWQ37OSs5ErfM9kmLH0dkX
 m1xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686541472; x=1689133472;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oqs+P/Nsn5g1qJr9m0Yneg06WdyFWJnEgcVFmwJ7l/g=;
 b=IHNZlyy1yrRDriEDf/IlXTnz1YSdOHiIMv8abTh0Ko2Azg18/we8gIz+KWjG3dyh3J
 2mHvngSdzoMorsRGCqgLHwZF0cNzrIvFgpBuBLAbk29DeWGZKUuoBrPkfopebX076Stt
 OpUneXC51iH7CBsQ2vrBzXiYPdTyAVhy6rNyxEYrSN8bHVxMIVhoyqj3MWL8Ly1EABlg
 kKcixHbUd6at9dp/4BWz+BHSAwhZDLfsBLttkEU+VoIo24KmJMH9VQtS1VGzUFwNzY4M
 8ufz0xWtWVkWXbpy8xyfbe8o23sj8zv39si57BbO4ZalYrPI9gPrrwbnjdtE1iCgqDK2
 OHKw==
X-Gm-Message-State: AC+VfDyOb2OCaM4qOmiKS6F9NOS8/d29koKyQM2/ZzmYaF1PGMf+9xCe
 kxnQh9C/sc+7917L94LOIo/KzBKhWzYgsXfvyKIYnNecj98=
X-Google-Smtp-Source: ACHHUZ7m6ayQCoHfehD0bwdJnUwU0ZBzzeDuRNlQaIEHxcNTjRM0J3zUbTITACRq2y5PTdaK0gNbwXkslEoZK9vqjLk=
X-Received: by 2002:a67:fd4d:0:b0:43b:32a7:a0b6 with SMTP id
 g13-20020a67fd4d000000b0043b32a7a0b6mr2518497vsr.16.1686541472416; Sun, 11
 Jun 2023 20:44:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230607091646.4049428-1-xiao.w.wang@intel.com>
In-Reply-To: <20230607091646.4049428-1-xiao.w.wang@intel.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 12 Jun 2023 13:44:06 +1000
Message-ID: <CAKmqyKM8njFnLif=yktCrk1WO+zUPQXFrDb+4Jf-o1t0ZhHvzg@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv/vector_helper.c: Remove the check for
 extra tail elements
To: Xiao Wang <xiao.w.wang@intel.com>
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e29;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe29.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Wed, Jun 7, 2023 at 7:13=E2=80=AFPM Xiao Wang <xiao.w.wang@intel.com> wr=
ote:
>
> Commit 752614cab8e6 ("target/riscv: rvv: Add tail agnostic for vector
> load / store instructions") added an extra check for LMUL fragmentation,
> intended for setting the "rest tail elements" in the last register for a
> segment load insn.
>
> Actually, the max_elements derived in vext_ld*() won't be a fraction of
> vector register size, since the lmul encoded in desc is emul, which has
> already been adjusted to 1 for LMUL fragmentation case by vext_get_emul()
> in trans_rvv.c.inc, for ld_stride(), ld_us(), ld_index() and ldff().
>
> Besides, vext_get_emul() has also taken EEW/SEW into consideration, so no
> need to call vext_get_total_elems() which would base on the emul to deriv=
e
> another emul, the second emul would be incorrect when esz differs from se=
w.
>
> Thus this patch removes the check for extra tail elements.
>
> Fixes: 752614cab8e6 ("target/riscv: rvv: Add tail agnostic for vector loa=
d / store instructions")
>
> Signed-off-by: Xiao Wang <xiao.w.wang@intel.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
> v2:
> * Rebased on top of Alistair's riscv-to-apply.next branch.
> ---
>  target/riscv/vector_helper.c | 22 ++++++----------------
>  1 file changed, 6 insertions(+), 16 deletions(-)
>
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 7505f9470a..f261e726c2 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -264,11 +264,10 @@ GEN_VEXT_ST_ELEM(ste_h, int16_t, H2, stw)
>  GEN_VEXT_ST_ELEM(ste_w, int32_t, H4, stl)
>  GEN_VEXT_ST_ELEM(ste_d, int64_t, H8, stq)
>
> -static void vext_set_tail_elems_1s(CPURISCVState *env, target_ulong vl,
> -                                   void *vd, uint32_t desc, uint32_t nf,
> +static void vext_set_tail_elems_1s(target_ulong vl, void *vd,
> +                                   uint32_t desc, uint32_t nf,
>                                     uint32_t esz, uint32_t max_elems)
>  {
> -    uint32_t total_elems, vlenb, registers_used;
>      uint32_t vta =3D vext_vta(desc);
>      int k;
>
> @@ -276,19 +275,10 @@ static void vext_set_tail_elems_1s(CPURISCVState *e=
nv, target_ulong vl,
>          return;
>      }
>
> -    total_elems =3D vext_get_total_elems(env, desc, esz);
> -    vlenb =3D riscv_cpu_cfg(env)->vlen >> 3;
> -
>      for (k =3D 0; k < nf; ++k) {
>          vext_set_elems_1s(vd, vta, (k * max_elems + vl) * esz,
>                            (k * max_elems + max_elems) * esz);
>      }
> -
> -    if (nf * max_elems % total_elems !=3D 0) {
> -        registers_used =3D ((nf * max_elems) * esz + (vlenb - 1)) / vlen=
b;
> -        vext_set_elems_1s(vd, vta, (nf * max_elems) * esz,
> -                          registers_used * vlenb);
> -    }
>  }
>
>  /*
> @@ -324,7 +314,7 @@ vext_ldst_stride(void *vd, void *v0, target_ulong bas=
e,
>      }
>      env->vstart =3D 0;
>
> -    vext_set_tail_elems_1s(env, env->vl, vd, desc, nf, esz, max_elems);
> +    vext_set_tail_elems_1s(env->vl, vd, desc, nf, esz, max_elems);
>  }
>
>  #define GEN_VEXT_LD_STRIDE(NAME, ETYPE, LOAD_FN)                        =
\
> @@ -383,7 +373,7 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVSta=
te *env, uint32_t desc,
>      }
>      env->vstart =3D 0;
>
> -    vext_set_tail_elems_1s(env, evl, vd, desc, nf, esz, max_elems);
> +    vext_set_tail_elems_1s(evl, vd, desc, nf, esz, max_elems);
>  }
>
>  /*
> @@ -504,7 +494,7 @@ vext_ldst_index(void *vd, void *v0, target_ulong base=
,
>      }
>      env->vstart =3D 0;
>
> -    vext_set_tail_elems_1s(env, env->vl, vd, desc, nf, esz, max_elems);
> +    vext_set_tail_elems_1s(env->vl, vd, desc, nf, esz, max_elems);
>  }
>
>  #define GEN_VEXT_LD_INDEX(NAME, ETYPE, INDEX_FN, LOAD_FN)               =
   \
> @@ -634,7 +624,7 @@ ProbeSuccess:
>      }
>      env->vstart =3D 0;
>
> -    vext_set_tail_elems_1s(env, env->vl, vd, desc, nf, esz, max_elems);
> +    vext_set_tail_elems_1s(env->vl, vd, desc, nf, esz, max_elems);
>  }
>
>  #define GEN_VEXT_LDFF(NAME, ETYPE, LOAD_FN)               \
> --
> 2.25.1
>
>

