Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oWGhs-00010Q-8X
	for mharc-qemu-riscv@gnu.org; Thu, 08 Sep 2022 08:32:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oWGhr-0000xY-9n; Thu, 08 Sep 2022 08:32:31 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:33663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oWGhp-0000RF-Hf; Thu, 08 Sep 2022 08:32:30 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 t6-20020a17090a950600b0020063f8f964so3385821pjo.0; 
 Thu, 08 Sep 2022 05:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=rsOTS9O6w6b2z6kMl2tkYg8/5be/k+2xy0ry/tWqwuw=;
 b=R4beVaqlreQUP2Db2M5AIo2Pljpf58+gJubd/8fLHq3JQaD2/gUlUiI+Dj3/yC77AF
 x6gIyJWyKErjjjGZZE2zgjYlhxw1LstTP74SL2vQ2/0YHqw8h/TXvBiXz4sVoZSZtJvS
 z+H1V2D0l7GKFPRjBJ6sG7ZjrumOsGJCK4Mlm6EfJHixb0ATMTqYkJgh8kxQEIHjA/1z
 ZTG59+XhFVi5NXnW79Snlfr/GmzpWLCu4hOFon/9Y+jQpkrS+AFzfUq3/QnpEsWhJiVw
 W3eevfF9dj4d4uLdt7pNAgM+eXbNWk2+c5nyTcPypqt9cLJZqI8jaH3iQkjhHJ8iMJrK
 hbdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=rsOTS9O6w6b2z6kMl2tkYg8/5be/k+2xy0ry/tWqwuw=;
 b=5pguHoJi9VjPXekzN6xffJ3ieXJgXgiCLZdsYJBhLlH3+9jeBWeMHuxFfxqlywqfFi
 R6iQwB6o61JTWuCyEXl3nqhLevhkOVkaMGXrdfiu9sMI77lQN+PCkb6dV9hXZ7Dbgd5G
 BstbQdxAVj4AAs/psnEhTyH5ti0GuusH2MFRVW6xfBR5+kgZHmXUlDHW3RWL6dpyNWJZ
 SYEnkVAlZg/aJ33/PzBDM8NfqnzN5SND00R/JwyqaM5JkxRuA9L4bHHbQ0iVkzg4i/Ja
 HmKwtBXrKhSCupUgy5Cm8NjNfFD6OlD4dd1vHSzwEnSRlv7KNJpEA+gatwTtpr0aBtaN
 lS1g==
X-Gm-Message-State: ACgBeo3clWpSNxwAahDd5qUD31j4roIw0/73tQbpTMM8/0I3OHTQZcEF
 2Ta3Q9G1IBgxS1nqDrC+J7pz/8KHOMqzNMuFIT30uxUDh9yC0yo7
X-Google-Smtp-Source: AA6agR6AC/hdYM/luxe29uTWtHephYKcDlWJU56lb/fwLdsPb3UZZsB/o2xTjHfAVNJX/fyccQCQR6Cy8u8xSTs2fRE=
X-Received: by 2002:a17:902:8603:b0:175:5d74:757f with SMTP id
 f3-20020a170902860300b001755d74757fmr8964111plo.99.1662640347777; Thu, 08 Sep
 2022 05:32:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220817083756.12471-1-liweiwei@iscas.ac.cn>
In-Reply-To: <20220817083756.12471-1-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 8 Sep 2022 14:32:01 +0200
Message-ID: <CAKmqyKM-8d1mEXMASaM5VV+CG+uh3vvCYfm_GFRSTyePXjmntA@mail.gmail.com>
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x1033.google.com
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
X-List-Received-Date: Thu, 08 Sep 2022 12:32:31 -0000

On Wed, Aug 17, 2022 at 10:39 AM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
> - modify check for mcounteren to work in all less-privilege mode
> - modify check for scounteren to work only when S mode is enabled
> - distinguish the exception type raised by check for scounteren between U
> and VU mode
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>

Thanks!

Applied to riscv-to-apply.next

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

