Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oEJvp-0005L1-Ch
	for mharc-qemu-riscv@gnu.org; Wed, 20 Jul 2022 20:20:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oEJvn-0005JZ-Hx; Wed, 20 Jul 2022 20:20:43 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:41768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oEJvl-0001mB-UI; Wed, 20 Jul 2022 20:20:43 -0400
Received: by mail-pf1-x42c.google.com with SMTP id l124so253158pfl.8;
 Wed, 20 Jul 2022 17:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x2FBdvZkAudmWOCw/Jvmdu4nbVLuiInyBGrOEu0Mckk=;
 b=O3/tc4KCz3J2V5TYis57vflfI6cuugMv9JzoLVCMW7/eZSUBfUFga+gB+RWiFi9/Wd
 9icrjiUVYVezUntDaJ4lMo3YQc4lDqe9ybyYBn/r63sAO+31XhnPAym5biOIOJAFtkda
 fFEEe5RM09qPJpBC06pIIepjE2/rZuEd0e9pHzkio6yc1Nir8IQHeI5SAVeOw2WuBzMP
 sNgvwTHXPRt4dzgtnumFtZwniCauAax1MOE2MpoSfwI7D42FJF/uhsoKCVI7KbtV8GQn
 NZQpCCEM7B0hqUM7frRZzoU+CDjFlfS7FrHryeyi85MmIG1LJwL53GpbcM1VjiHIdgO6
 2tVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x2FBdvZkAudmWOCw/Jvmdu4nbVLuiInyBGrOEu0Mckk=;
 b=6J8+sDhg0fR97JIytFNMSKJ07QLkJ2mVLMmuahto3LorH7n4GKejMAjy47VzxdrAuq
 gF99yIVK5ctPuXsphpbjoGsQTQ6580LXQi4c7rJj9R0rfhyic5vykyhjaQPpLOfQ+9Jj
 gUqsvWFoNJO6dKcWmjc5GgRUnw6iNxgEmuUJCYDdP5mA7NfTDOFOAQPtv7LR9fvj/O5+
 xwyQe9zEl8S8i1UShu8wWBt0Ei1Bct1g2UsFUO2HAtkncYMyxiSkqnN+4kDK3GW+ZwGp
 ODhqBv4qhEuYaXR/eqBJ8bZsfnbrJMZqlypHopU/f4bygBI4/Ln2gWcNUnaKhsuVHnZt
 Tf5g==
X-Gm-Message-State: AJIora9SHr9c1wk21YdpbJEc98GmMOgy9Xryzhy0+cBwlG+9rL275QxC
 0D83imb6vvUnlwtrhfoNR9eYiaXP5XpSM7SxJdk=
X-Google-Smtp-Source: AGRyM1tTSh/VlqChEGmmwqjGVowNgw7F8iZm+nmZRBJjkmPUlhmnv5U2j5hZiY2gUBJXDXjs8BCAE16ZOyf0zTMsCIc=
X-Received: by 2002:a65:6b8a:0:b0:3db:7dc5:fec2 with SMTP id
 d10-20020a656b8a000000b003db7dc5fec2mr34887464pgw.223.1658362840030; Wed, 20
 Jul 2022 17:20:40 -0700 (PDT)
MIME-Version: 1.0
References: <165570784143.17634.35095816584573691-0@git.sr.ht>
 <165570784143.17634.35095816584573691-6@git.sr.ht>
In-Reply-To: <165570784143.17634.35095816584573691-6@git.sr.ht>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 21 Jul 2022 10:20:13 +1000
Message-ID: <CAKmqyKN6=9SAoSc+oLQu+f9==m09TbXsBZ-KxHw8mCGuA+G4RQ@mail.gmail.com>
Subject: Re: [PATCH qemu v6 06/10] target/riscv: rvv: Add mask agnostic for
 vector fix-point arithmetic instructions
To: "~eopxd" <yueh.ting.chen@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Frank Chang <frank.chang@sifive.com>, 
 WeiWei Li <liweiwei@iscas.ac.cn>, eop Chen <eop.chen@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=alistair23@gmail.com; helo=mail-pf1-x42c.google.com
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
X-List-Received-Date: Thu, 21 Jul 2022 00:20:43 -0000

On Mon, Jun 20, 2022 at 4:56 PM ~eopxd <eopxd@git.sr.ht> wrote:
>
> From: Yueh-Ting (eop) Chen <eop.chen@sifive.com>
>
> Signed-off-by: eop Chen <eop.chen@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/vector_helper.c | 26 ++++++++++++++++----------
>  1 file changed, 16 insertions(+), 10 deletions(-)
>
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 07ce671879..597fa9c752 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -2129,10 +2129,12 @@ static inline void
>  vext_vv_rm_1(void *vd, void *v0, void *vs1, void *vs2,
>               CPURISCVState *env,
>               uint32_t vl, uint32_t vm, int vxrm,
> -             opivv2_rm_fn *fn)
> +             opivv2_rm_fn *fn, uint32_t vma, uint32_t esz)
>  {
>      for (uint32_t i = env->vstart; i < vl; i++) {
>          if (!vm && !vext_elem_mask(v0, i)) {
> +            /* set masked-off elements to 1s */
> +            vext_set_elems_1s(vd, vma, i * esz, (i + 1) * esz);
>              continue;
>          }
>          fn(vd, vs1, vs2, i, env, vxrm);
> @@ -2150,23 +2152,24 @@ vext_vv_rm_2(void *vd, void *v0, void *vs1, void *vs2,
>      uint32_t vl = env->vl;
>      uint32_t total_elems = vext_get_total_elems(env, desc, esz);
>      uint32_t vta = vext_vta(desc);
> +    uint32_t vma = vext_vma(desc);
>
>      switch (env->vxrm) {
>      case 0: /* rnu */
>          vext_vv_rm_1(vd, v0, vs1, vs2,
> -                     env, vl, vm, 0, fn);
> +                     env, vl, vm, 0, fn, vma, esz);
>          break;
>      case 1: /* rne */
>          vext_vv_rm_1(vd, v0, vs1, vs2,
> -                     env, vl, vm, 1, fn);
> +                     env, vl, vm, 1, fn, vma, esz);
>          break;
>      case 2: /* rdn */
>          vext_vv_rm_1(vd, v0, vs1, vs2,
> -                     env, vl, vm, 2, fn);
> +                     env, vl, vm, 2, fn, vma, esz);
>          break;
>      default: /* rod */
>          vext_vv_rm_1(vd, v0, vs1, vs2,
> -                     env, vl, vm, 3, fn);
> +                     env, vl, vm, 3, fn, vma, esz);
>          break;
>      }
>      /* set tail elements to 1s */
> @@ -2250,10 +2253,12 @@ static inline void
>  vext_vx_rm_1(void *vd, void *v0, target_long s1, void *vs2,
>               CPURISCVState *env,
>               uint32_t vl, uint32_t vm, int vxrm,
> -             opivx2_rm_fn *fn)
> +             opivx2_rm_fn *fn, uint32_t vma, uint32_t esz)
>  {
>      for (uint32_t i = env->vstart; i < vl; i++) {
>          if (!vm && !vext_elem_mask(v0, i)) {
> +            /* set masked-off elements to 1s */
> +            vext_set_elems_1s(vd, vma, i * esz, (i + 1) * esz);
>              continue;
>          }
>          fn(vd, s1, vs2, i, env, vxrm);
> @@ -2271,23 +2276,24 @@ vext_vx_rm_2(void *vd, void *v0, target_long s1, void *vs2,
>      uint32_t vl = env->vl;
>      uint32_t total_elems = vext_get_total_elems(env, desc, esz);
>      uint32_t vta = vext_vta(desc);
> +    uint32_t vma = vext_vma(desc);
>
>      switch (env->vxrm) {
>      case 0: /* rnu */
>          vext_vx_rm_1(vd, v0, s1, vs2,
> -                     env, vl, vm, 0, fn);
> +                     env, vl, vm, 0, fn, vma, esz);
>          break;
>      case 1: /* rne */
>          vext_vx_rm_1(vd, v0, s1, vs2,
> -                     env, vl, vm, 1, fn);
> +                     env, vl, vm, 1, fn, vma, esz);
>          break;
>      case 2: /* rdn */
>          vext_vx_rm_1(vd, v0, s1, vs2,
> -                     env, vl, vm, 2, fn);
> +                     env, vl, vm, 2, fn, vma, esz);
>          break;
>      default: /* rod */
>          vext_vx_rm_1(vd, v0, s1, vs2,
> -                     env, vl, vm, 3, fn);
> +                     env, vl, vm, 3, fn, vma, esz);
>          break;
>      }
>      /* set tail elements to 1s */
> --
> 2.34.2
>
>

