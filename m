Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ncEke-0002xp-Ii
	for mharc-qemu-riscv@gnu.org; Wed, 06 Apr 2022 19:07:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ncEkd-0002xc-FO; Wed, 06 Apr 2022 19:07:47 -0400
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131]:33563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ncEka-0004nl-P3; Wed, 06 Apr 2022 19:07:47 -0400
Received: by mail-il1-x131.google.com with SMTP id k15so3091083ils.0;
 Wed, 06 Apr 2022 16:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IAAMWfjr6cOcn1F62KFRCjow64UD6jIn4reqHvTyRXY=;
 b=RryOHQ9UCotL4C3ihPMQMC+E7iXdbyeIRzUKVSzJIiHRHHZaRMuAbKnrsVldtlxbZG
 AarYNoBxFw+zp1BibfMSFfSEybGx3UP82X627ZitSObNcGH7+YSogW8D51qkIUtsNsrq
 ztVPl/ga2EaKwSumQyE7buEw42PTqLXzT4nXbTt9Y1oHE9Gb8ZZyW+JiZsvIq6/ZPZ3C
 s0jCdUiikajV/OR7ndbfE03Kvq3fI0z6h55OzfBMmKqRaxPMxxoSQE4HSzYLbMKqg6+L
 129K+eyfOlP1MbxN1HVZZmDAkdsub9uDHBiXM6uGjo5w/bQ43T8dbZbUqemzxMT+yt8/
 +mJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IAAMWfjr6cOcn1F62KFRCjow64UD6jIn4reqHvTyRXY=;
 b=NurGqIElEy2bAbP1l5LvbVqRCyGS/GqXb7Ae66YUVY74WVZiz9aGc/uh6lj2byzSVH
 SEpEZRc8xg/btF5QOiJUN+3ow5+okEHOXv0sbROYGbwUArl0/YcGZKo7tP1/z+uQdrx2
 LHMo5q0xMfV+aaDiJj+FRBYZx4wX+PhGeywmKxXVGzIug4zyveHc6NCKauyjSmbkdiMW
 s/L8jc1pa4TFHXw8mE9Gqhpb58HieWE/fDsjZ3KHCYYwLhTuETSCX4WypvQk3PbLgA3a
 FCpzCOkxhifGTFg/1pbG4TAtlE1Ot9PFkilkWd/BTe+5n7qLkyuj4S6a0QWEt9UG2RpB
 hXHA==
X-Gm-Message-State: AOAM531KKCyNXMFBsg69e0UkHQS/VNBNLBADzVWTjBPendyrtgwGZwtd
 usMrYb6HQKIl07a63ZhD4KgM/PyTV6PjyJEMqmE=
X-Google-Smtp-Source: ABdhPJz9DaBFEhsxc3+hCj4NSaI5bsiMrBTPkTNgDfoVfn6sDnoZug8DB9IooybDCn3LEuoj4I8HHOYajIoJZeZBWLs=
X-Received: by 2002:a05:6e02:219c:b0:2c9:a936:7a1 with SMTP id
 j28-20020a056e02219c00b002c9a93607a1mr5173504ila.55.1649286462858; Wed, 06
 Apr 2022 16:07:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220330021316.18223-1-liweiwei@iscas.ac.cn>
In-Reply-To: <20220330021316.18223-1-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 7 Apr 2022 09:07:16 +1000
Message-ID: <CAKmqyKMB4b_aY2d+QJa2R14gsT8o7uNVKSQjecRHbsRHTcz2Dw@mail.gmail.com>
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::131;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x131.google.com
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
X-List-Received-Date: Wed, 06 Apr 2022 23:07:47 -0000

On Wed, Mar 30, 2022 at 12:14 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
> The spec for vmv<nf>r.v says: 'the instructions operate as if EEW=SEW,
> EMUL = NREG, effective length evl= EMUL * VLEN/SEW.'
>
> So the start byte for vstart != 0 should take sew into account
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>

Thanks!

Applied to riscv-to-apply.next

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

