Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1leTT0-0000aZ-3m
	for mharc-qemu-riscv@gnu.org; Wed, 05 May 2021 22:10:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1leTSo-0000Zw-Sx; Wed, 05 May 2021 22:10:11 -0400
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132]:44860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1leTSm-0008Oo-UQ; Wed, 05 May 2021 22:10:06 -0400
Received: by mail-il1-x132.google.com with SMTP id i22so3454829ila.11;
 Wed, 05 May 2021 19:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1YnX9Cm3enqdv0yfI/EdfbngfUVrtcH6oNGxderYxdE=;
 b=aYFRQHi6vpUdj8fNw9WPUz2AIqkPMK6H00cY13nURagG0VuNNPhuYN6qgC4du2legk
 vITSssWJMo9TdvBo54pZB9gMon/G/Mj3sQUCQIBs2YYzOggfLqaLBqhbSN+ejsN1Z7F0
 rzvBc6TEntOl/Qp1YMI7PS6nZ7PaQietZdXvhHBPCkPNgzeQ0W2HxAUOwXazmF+ZhDwS
 /MQhOcrRSuSmWlKwPmuGX+v+TC7fjXCD0yHXZkDK6IzCLMmpp+RRY0TcX27rKBg8qZ8I
 5dqBD6Hsqy6jHLgelCO6oyBBOeYFSxfrmlCTQU7i0Z2RepVDDEjdf7iyeqi5nNN5wp5O
 J7Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1YnX9Cm3enqdv0yfI/EdfbngfUVrtcH6oNGxderYxdE=;
 b=Bby5NkVb/02+EssXOaOYZozZL8QR4i0lBXLkGNqp/2tD3W6aDfW99aHmuJR4hm7GxO
 t/ZIYBwf/C/SwdRKgpeG9iNq5ulnCynVEB247uUcrkagevh2F4On57wai3RfE1OrQx4N
 FsFK2m5bJYIzmyqPp1GoLN0ew5HHXvIA56y00pkDfA7U48IyEKEPQXuT6jj9URp5jptg
 CTXLG9wDCL6pjD3pQ2Bn8ojYejLjoahCPynXSsJgiqWJKsq890vjj9NV01JHKD+LSlPo
 sUSfIfLLsIK0QtE/ksxwDQgAFgKk6ITZhjmNm4qDxm3ri8Y5p1EgF7t/TjE2pp1yzzGG
 FhBg==
X-Gm-Message-State: AOAM531WYE4LWnCi5MOZsWULkqZvcEW2slZOnYwD+fIif0FSAzBwi1ci
 SEs3fJclZBw01vAKXfQk80zPPrTn/I5XuSSNxQ0=
X-Google-Smtp-Source: ABdhPJwJbW0JHg5VJptvSmtlWVUujQ0bvv2CCinZHcKqEZ20hufV84k4IoAeA6gfywAsFOH0Ciy2zkXOa8LDqSJhuZo=
X-Received: by 2002:a05:6e02:eac:: with SMTP id
 u12mr1863475ilj.177.1620267003422; 
 Wed, 05 May 2021 19:10:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210420213656.85148-1-josemartins90@gmail.com>
In-Reply-To: <20210420213656.85148-1-josemartins90@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 6 May 2021 12:09:37 +1000
Message-ID: <CAKmqyKN-qaBqhqTKJ-RVQ4BXO++vxVYB1+WNK3atUmqZbNyWgg@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: fix wfi exception behavior
To: Jose Martins <josemartins90@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, 
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::132;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x132.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 06 May 2021 02:10:16 -0000

On Wed, Apr 21, 2021 at 7:37 AM Jose Martins <josemartins90@gmail.com> wrote:
>
> The wfi exception trigger behavior should take into account user mode,
> hstatus.vtw, and the fact the an wfi might raise different types of
> exceptions depending on various factors:
>
> If supervisor mode is not present:
>
> - an illegal instruction exception should be generated if user mode
> executes and wfi instruction and mstatus.tw = 1.
>
> If supervisor mode is present:
>
> - when a wfi instruction is executed, an illegal exception should be triggered
> if either the current mode is user or the mode is supervisor and mstatus.tw is
> set.
>
> Plus, if the hypervisor extensions are enabled:
>
> - a virtual instruction exception should be raised when a wfi is executed from
> virtual-user or virtual-supervisor and hstatus.vtw is set.
>
> Signed-off-by: Jose Martins <josemartins90@gmail.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
> Alistair, I hope you've agreed with my argumentis for the previous version
> of the patch. As promised, I submit this version which takes into account M/U
> only harts. It checks for the presence of the RVS extension. If it is
> not present mstatus.tw takes effect over the exection of wfi in user
> mode.
>
>  target/riscv/cpu_bits.h  |  1 +
>  target/riscv/op_helper.c | 11 ++++++++---
>  2 files changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 24b24c69c5..ed8b97c788 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -436,6 +436,7 @@
>  #define HSTATUS_HU           0x00000200
>  #define HSTATUS_VGEIN        0x0003F000
>  #define HSTATUS_VTVM         0x00100000
> +#define HSTATUS_VTW          0x00200000
>  #define HSTATUS_VTSR         0x00400000
>  #if defined(TARGET_RISCV64)
>  #define HSTATUS_VSXL        0x300000000
> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> index d55def76cf..15982a7a33 100644
> --- a/target/riscv/op_helper.c
> +++ b/target/riscv/op_helper.c
> @@ -173,10 +173,15 @@ target_ulong helper_mret(CPURISCVState *env, target_ulong cpu_pc_deb)
>  void helper_wfi(CPURISCVState *env)
>  {
>      CPUState *cs = env_cpu(env);
> +    bool rvs = riscv_has_ext(env, RVS);
> +    bool prv_u = env->priv == PRV_U;
> +    bool prv_s = env->priv == PRV_S;
>
> -    if ((env->priv == PRV_S &&
> -        get_field(env->mstatus, MSTATUS_TW)) ||
> -        riscv_cpu_virt_enabled(env)) {
> +    if (((prv_s || (!rvs && prv_u)) && get_field(env->mstatus, MSTATUS_TW)) ||
> +        (rvs && prv_u && !riscv_cpu_virt_enabled(env))) {
> +        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
> +    } else if (riscv_cpu_virt_enabled(env) && (prv_u ||
> +        (prv_s && get_field(env->hstatus, HSTATUS_VTW)))) {
>          riscv_raise_exception(env, RISCV_EXCP_VIRT_INSTRUCTION_FAULT, GETPC());
>      } else {
>          cs->halted = 1;
> --
> 2.25.1
>
>

