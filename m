Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oAnCY-00029R-6Y
	for mharc-qemu-riscv@gnu.org; Mon, 11 Jul 2022 02:47:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oAnCX-00029D-7t; Mon, 11 Jul 2022 02:47:25 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:53069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oAnCV-0005iD-Jl; Mon, 11 Jul 2022 02:47:24 -0400
Received: by mail-pj1-x1036.google.com with SMTP id fz10so4050209pjb.2;
 Sun, 10 Jul 2022 23:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SmFSn0zcdFBFJ595WqTzB4NVrkq8/po1m0dfZDwQs30=;
 b=LhTE+1BwM0ny54hES68NkmDoKJj+jbjYzffHUBQajXNDgPI1/Q77YMsGDBQsVn91kM
 0GAye6smMMy8KDrDUHW2L1Fs1HWieNJI9iYTyhVIVcli3dtgd+ftwQuFQexZiI6vX0rW
 Wrw7Xw8XtLBh1087SWs9y+nbq/oRKH/HaWLCeKqBywHnoVUB7uwaL4V2v5W9KVRGQdDq
 GFIvT7T4Af9WfA1QslQS6JgCXlipJ1yVedbCqURjceKs6jH5yM7QO4eW1wKKvNRQQJ0X
 hp+OqfXb/BVURs0fNwkJqL6NZYRs/Mtq/CMUOPcur6Ym97C2qja1WDr08tOw+fmnJH71
 iwHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SmFSn0zcdFBFJ595WqTzB4NVrkq8/po1m0dfZDwQs30=;
 b=VoeBxEhBAkI5dIgOv0aPkI2d7oEa3OswK69Z25Chb4VOUy2b5HXCeyz2bsad/y26Vq
 f69MAMp3LA4EmZ7vVTyn69UjfZpzJoEGfl4hjO0KwJ7rOeHJjAcCKNLe9gYK/EMQ930T
 TF3YiDidBZTerEb/fDVbL6veBTRDMSH4KUNndSQXXDoKGwRVjFSkWrgGzWOGIgUZgICy
 868DGMGIbX/LgRI3TsTMdbEJzgTVkrI5caUH2iq2CmpmwaUAfVN3MPVz80Tq2uj7hYUa
 DYZ+GHVxyg9leFEgo64xBPreUBZH0g65nOYeytjHxYV9v05UTHr509JyBdYv+HNFwo1H
 5YUA==
X-Gm-Message-State: AJIora+nZx1QECQ87Hz5nPYU6RPEGj+9Mc+KYGIAzLkV4oyjaiJkERU6
 4Jj4Uf6vOB1Wou9kkf9B3heM/gBhmEM6tg0yJ+c=
X-Google-Smtp-Source: AGRyM1tJBHrTay8WYbX093UbA5glEnommQ9acrji3uIEAZ2hg1sv7c/doL5vggg32Lt/JC2emNQjN9dcCEjN71dslPk=
X-Received: by 2002:a17:90a:e611:b0:1ef:92b6:d31 with SMTP id
 j17-20020a17090ae61100b001ef92b60d31mr15935569pjy.166.1657522041820; Sun, 10
 Jul 2022 23:47:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220710082400.29224-1-liweiwei@iscas.ac.cn>
 <20220710082400.29224-6-liweiwei@iscas.ac.cn>
In-Reply-To: <20220710082400.29224-6-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 11 Jul 2022 16:46:55 +1000
Message-ID: <CAKmqyKM2ghDn0=sBMuj-9-Uba7mBCNmCVps224c-2XUbBBSBsg@mail.gmail.com>
Subject: Re: [PATCH 5/6] target/riscv: fix checks in hmode/hmode32
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x1036.google.com
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
X-List-Received-Date: Mon, 11 Jul 2022 06:47:25 -0000

On Sun, Jul 10, 2022 at 6:24 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
> - It seems that there is no explicitly description about whether
> the Hypervisor CSRs requires S extension
> - Csrs only existed in RV32 will not trigger virtual instruction fault
> when not in RV32
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---
>  target/riscv/csr.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 0d8e98b7a9..975007f1ac 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -311,8 +311,7 @@ static int aia_smode32(CPURISCVState *env, int csrno)
>
>  static RISCVException hmode(CPURISCVState *env, int csrno)
>  {
> -    if (riscv_has_ext(env, RVS) &&
> -        riscv_has_ext(env, RVH)) {
> +    if (riscv_has_ext(env, RVH)) {

This doesn't seem right. The spec doesn't explicitly say this, but I
don't see how you can have the Hypervisor extension without S-mode

>          /* Hypervisor extension is supported */
>          if ((env->priv == PRV_S && !riscv_cpu_virt_enabled(env)) ||
>              env->priv == PRV_M) {
> @@ -328,11 +327,7 @@ static RISCVException hmode(CPURISCVState *env, int csrno)
>  static RISCVException hmode32(CPURISCVState *env, int csrno)
>  {
>      if (riscv_cpu_mxl(env) != MXL_RV32) {
> -        if (!riscv_cpu_virt_enabled(env)) {
> -            return RISCV_EXCP_ILLEGAL_INST;
> -        } else {
> -            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> -        }
> +        return RISCV_EXCP_ILLEGAL_INST;

Good catch

Alistair

>      }
>
>      return hmode(env, csrno);
> --
> 2.17.1
>
>

