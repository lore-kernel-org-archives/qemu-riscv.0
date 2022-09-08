Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oWDq1-00083g-9r
	for mharc-qemu-riscv@gnu.org; Thu, 08 Sep 2022 05:28:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oWDpz-00083G-Ms; Thu, 08 Sep 2022 05:28:43 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:41501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oWDpy-000209-2H; Thu, 08 Sep 2022 05:28:43 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 q15-20020a17090a304f00b002002ac83485so1806966pjl.0; 
 Thu, 08 Sep 2022 02:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=O7ZQ8+O9U0daQBUMho2iTgKEGNmBhDMDTuX2qh4KfMs=;
 b=GnVUeoTUTa7DbGmkE8ZCQLAuS3sfVODDkJFCrnVkWkVHmp5sHYz0oSn8mAid7hjwiY
 dx5bftvrfFVZd9EBPwANEIKlIbO0B2j8ymSKdvfKsPVSifH+1Vtc0Tns1L2xaUmXxFWr
 mRjUDWeV7NersEzuokQLfuCehhuVRvZRmWWi2SzHwyegm6IRd1y6TaaydZUfrrG/ZBt/
 juWogPL9G+9LByQ4bh2KsMVPcebrwJXioTIaNQag5MtRMRfRa3zr0PW+sq9HvTF8k4lL
 XMfpUmAkcVAT+3iadgU1sD90V/R3pShQbqnJttTWouA0KDrKCxrl59fn8aBrhvpl3jnf
 rUHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=O7ZQ8+O9U0daQBUMho2iTgKEGNmBhDMDTuX2qh4KfMs=;
 b=t8PXY0Fd04CGlRH+0VaQL0wlfot29poT1P50sjUFwGDHQyj0+1jNgfRLhOaAAVEg6J
 IlCcnaakF3V9wny7JyNNSxCWwD53ptWKD9cu2jMNHLwBwxWaMLHgDnG+mmUY5T/0MwlN
 OwkrlhoQPI6NfbwR8rsvkdimSAVyrq4IUC5CIItijwwXKQs93GxD3C2QTzE9jPsVmWLi
 FsnSocwEZ5jn+xZbhnsXkMOlJTM9wRkG+4Hc+81A3IJkxtgyp0X9nQkbtoox+FXJSKmV
 /sIXXIGzBOarZSthOwRuzsem81HA2vG1RgEuU4kRkkvOOf9uteay5pLI2/b//z2N/WJT
 5RIQ==
X-Gm-Message-State: ACgBeo1Gc7P8+vXO6k4Bg/XQVki3vp8xVBu5y/9z3X6a/x3dqxDIpfQp
 PL21ua0ri5lsLggmdOfh6YL1TAsEaSgrONLqfHk=
X-Google-Smtp-Source: AA6agR7ZZmR6Gr5gQWAVZmsR4yO3dml6BpZNP/czE+5NPs/gXjTV7IS0ZdeuTm6pOILi9ZMTqvU7EXFA4Kcd1kTU/30=
X-Received: by 2002:a17:90b:314b:b0:1fd:e5ba:3cab with SMTP id
 ip11-20020a17090b314b00b001fde5ba3cabmr3287119pjb.96.1662629319315; Thu, 08
 Sep 2022 02:28:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220817083756.12471-1-liweiwei@iscas.ac.cn>
In-Reply-To: <20220817083756.12471-1-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 8 Sep 2022 11:28:12 +0200
Message-ID: <CAKmqyKOK3ioCNuNQZSKnjqb+QDOWwFhjZbLV+W5ArsrcSibXew@mail.gmail.com>
Subject: Re: [PATCH v3] target/riscv: fix csr check for cycle{h}, instret{h}, 
 time{h}, hpmcounter3-31{h}
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x1030.google.com
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
X-List-Received-Date: Thu, 08 Sep 2022 09:28:43 -0000

On Wed, Aug 17, 2022 at 10:39 AM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
> - modify check for mcounteren to work in all less-privilege mode
> - modify check for scounteren to work only when S mode is enabled
> - distinguish the exception type raised by check for scounteren between U
> and VU mode
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> v3:
>  - remove unnecessary ()'s
>
> v2:
>  - Rebase on patches v13 for "Improve PMU support"
>
>  target/riscv/csr.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 2dcd4e5b2d..ca72b5df98 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -98,17 +98,22 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
>
>  skip_ext_pmu_check:
>
> -    if (((env->priv == PRV_S) && (!get_field(env->mcounteren, ctr_mask))) ||
> -        ((env->priv == PRV_U) && (!get_field(env->scounteren, ctr_mask)))) {
> +    if (env->priv < PRV_M && !get_field(env->mcounteren, ctr_mask)) {
>          return RISCV_EXCP_ILLEGAL_INST;
>      }
>
>      if (riscv_cpu_virt_enabled(env)) {
> -        if (!get_field(env->hcounteren, ctr_mask) &&
> -            get_field(env->mcounteren, ctr_mask)) {
> +        if (!get_field(env->hcounteren, ctr_mask) ||
> +            (env->priv == PRV_U && !get_field(env->scounteren, ctr_mask))) {
>              return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>          }
>      }
> +
> +    if (riscv_has_ext(env, RVS) && env->priv == PRV_U &&
> +        !get_field(env->scounteren, ctr_mask)) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
>  #endif
>      return RISCV_EXCP_NONE;
>  }
> --
> 2.17.1
>
>

