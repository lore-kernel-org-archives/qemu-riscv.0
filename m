Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nZiU4-0004JD-LO
	for mharc-qemu-riscv@gnu.org; Wed, 30 Mar 2022 20:16:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nZiTx-0004HX-8S; Wed, 30 Mar 2022 20:16:13 -0400
Received: from [2607:f8b0:4864:20::d30] (port=46627
 helo=mail-io1-xd30.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nZiTs-0007qj-FW; Wed, 30 Mar 2022 20:16:08 -0400
Received: by mail-io1-xd30.google.com with SMTP id g21so13598588iom.13;
 Wed, 30 Mar 2022 17:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K8qERt5R7F2hK+J9vzyc16FKWVR/fWN92Sgap/dQ39E=;
 b=CCyYh3x1FEqCgyi+uz7sZmVRjlyxsh4ryEYs3ixOyf4HpUXonSVILvJY/wTxD31mfO
 a/xS/Jqp1C6JuQnjLkq7jbXPjjvYMbK5ntZqqraef56KgnmGNZHexPrtzejNUj/rL8cl
 XRXPYLdZOWMmOfiby7xSTYMduZtuymiIr6Ui6ZqbgkuzKLnte2YFsjm0Zyr4lsoy2EbE
 HKinqORd7HPju1/yo3w0HfU60RZfJpzt/AAQGsxO36/ko0n76NY8QoMBVqzW2qb7/T7w
 0turG8ByjDygxKisWRQkjFNEyvo94YeFAjEic9otj1TZ7ZEyiaOWAPFuyQf4SLX5DSFp
 RYRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K8qERt5R7F2hK+J9vzyc16FKWVR/fWN92Sgap/dQ39E=;
 b=CU/Y/XgJW6b5V7zR0ERcD8muza+3VTlP5ISn57QfDTG56hOvworcrLNRijlPVrDL68
 W5NOUDUnHZIw23C8WUHflz21+OoafpCv9No0ZdT6DVpbvNYS0VeLINC+3KvzCERvMe3j
 BTNgWe7Q/PAjv+sxvPl9WQYWfQpujaF7ZzB/tBoLfVXZHw2v4tuDcHfafaKtBgjC21sz
 NQYi4FmRhZlNbzFXWPgUbvq7GQDSbidTRYDLKnpiYB3J5FWcmwQPrdPHPmhMUkSLGMd2
 Bl08cgAzguicHnorT9JDY4iA6A6EY+GzTddNwoe1eDKQpJ/X4zqRuFEpyKsNEkj/JhJj
 ukqA==
X-Gm-Message-State: AOAM533rfP3nxImWxcmAIk2mVWxpu42XXY1HqmHsFw0gkdxfvHun9JPE
 GL4Q6LJhYtMDk+0TGtfoxVWYgDu8uWW9gc/l6kk=
X-Google-Smtp-Source: ABdhPJzqi7+lUz3lb2Vuq6Oc8w2sk9TS3EfBQ4HvY35uJgIA73NJEjxbHDIoaqvYoF+L2pcbT90HH2m4K9qipR5j6t0=
X-Received: by 2002:a02:a88f:0:b0:323:6ce5:fb36 with SMTP id
 l15-20020a02a88f000000b003236ce5fb36mr1473949jam.21.1648685762830; Wed, 30
 Mar 2022 17:16:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220330021316.18223-1-liweiwei@iscas.ac.cn>
In-Reply-To: <20220330021316.18223-1-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 31 Mar 2022 10:15:36 +1000
Message-ID: <CAKmqyKNy2yjOjpofJQRepF=xtf8aBbw19P274EknWfXfoFO_+g@mail.gmail.com>
Subject: Re: [RESEND PATCH] target/riscv: fix start byte for vmv<nf>r.v when
 vstart != 0
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d30
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d30;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd30.google.com
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
X-List-Received-Date: Thu, 31 Mar 2022 00:16:14 -0000

On Wed, Mar 30, 2022 at 12:14 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
> The spec for vmv<nf>r.v says: 'the instructions operate as if EEW=SEW,
> EMUL = NREG, effective length evl= EMUL * VLEN/SEW.'
>
> So the start byte for vstart != 0 should take sew into account
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/vector_helper.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 1d4982ef7f..b5fbdabbb1 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -4890,13 +4890,15 @@ GEN_VEXT_VCOMPRESS_VM(vcompress_vm_d, uint64_t, H8)
>  /* Vector Whole Register Move */
>  void HELPER(vmvr_v)(void *vd, void *vs2, CPURISCVState *env, uint32_t desc)
>  {
> -    /* EEW = 8 */
> +    /* EEW = SEW */
>      uint32_t maxsz = simd_maxsz(desc);
> -    uint32_t i = env->vstart;
> +    uint32_t sewb = 1 << FIELD_EX64(env->vtype, VTYPE, VSEW);
> +    uint32_t startb = env->vstart * sewb;
> +    uint32_t i = startb;
>
>      memcpy((uint8_t *)vd + H1(i),
>             (uint8_t *)vs2 + H1(i),
> -           maxsz - env->vstart);
> +           maxsz - startb);
>
>      env->vstart = 0;
>  }
> --
> 2.17.1
>
>

