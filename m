Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n09u3-0005Y6-SZ
	for mharc-qemu-riscv@gnu.org; Wed, 22 Dec 2021 17:16:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n09u0-0005V5-DX; Wed, 22 Dec 2021 17:16:06 -0500
Received: from [2607:f8b0:4864:20::d29] (port=39842
 helo=mail-io1-xd29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n09ty-0005GT-QG; Wed, 22 Dec 2021 17:16:04 -0500
Received: by mail-io1-xd29.google.com with SMTP id c3so4734627iob.6;
 Wed, 22 Dec 2021 14:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aGtpWuMgp/6YVcQREcl/iH3N5qo1+Jb/iQByQLqv9M4=;
 b=GpfcyDXL/9h5auu+GC2FlCtcrAgVlgabmr5FzgyHuAnO6EBYrpOOUJl1Gfq3kzWbMP
 lN0yWkTiTWInUP6W6YcUhY+uAQ9kSM9ldFNg97iafOoMvqi+wP5A5eHwK3Bi1Juu6Hrr
 SPcb+JBqJ2ajLJ55K0QHVaQuEq0x6P6NozYiYBaTv7Ihod8LihsY0vtJxfxCjQOvMpOG
 SRc1CCUZNrhRO83l7Q9uzQlcLg4hYqwTdJekE5YlDrRrj1qRxUur+A1S1Aat2vtwNrGI
 Ni+tNzHql/RI1NkykQ1g7Sq+absy3EWuxOyzofWDnLv9BagF1VVYxh0ZeKFlcwt261CY
 gC3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aGtpWuMgp/6YVcQREcl/iH3N5qo1+Jb/iQByQLqv9M4=;
 b=1U3cfe1Jf4Ysmhm4SxPvrZVkLAMmu0DcJLKRqbitVdb2vaQNyb9FlwmiQQktXz40TO
 oUdE+D39aCmGiItzZq+Q/ukb85tnGZRrXJMlkb6sY6tJqebaCCdXOMLIkZGP3IOMOo3m
 jIgVRk4kFIfLzpX1yPZ8p3tCkTHYmFebQOlq0LaxNO4DyqgTWuT+YjvxtR1qXzW23I1N
 bcIcLD2SU33HRpcMNbiHr77gbW+X2IcKr8y6am8AbuUqioQw+H22mnI2fVpmVeOu5/ce
 NM9zHOVyXJicTdpgd0of6j53ouoSsihB8SPzYCoXjPLJD5eNCfDpKkh0Yg/X1Q01ZSFA
 mirA==
X-Gm-Message-State: AOAM531zeOpHlHSO6UqgMM1yunw+w8TSYNsrHOh4FSas0lb4fIFEotbX
 ep9Tef/VDTNntwB16DObeYb7y/+4RdOI3HYSb4I=
X-Google-Smtp-Source: ABdhPJz88tO2Xn9o79DquInlsqTQuzrgqKdoMndkKeJqkva9jojRT68xwIFebHIjLCQfpH7Moee+JUqe1YhHbUdRnDM=
X-Received: by 2002:a05:6638:1395:: with SMTP id
 w21mr2878187jad.125.1640211359474; 
 Wed, 22 Dec 2021 14:15:59 -0800 (PST)
MIME-Version: 1.0
References: <CAKmqyKOmKHjBYhBJP7EwDvKiV+H=y4jVheaJe8Wp46aBQWKgOA@mail.gmail.com>
 <20211221071324.6213-1-nikita.shubin@maquefel.me>
In-Reply-To: <20211221071324.6213-1-nikita.shubin@maquefel.me>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 23 Dec 2021 08:15:33 +1000
Message-ID: <CAKmqyKO3XfUb6R4QAckVFy_XXQ1GMqU-keamtPObTpSXF0W=+A@mail.gmail.com>
Subject: Re: [PATCH] target/riscv/pmp: fix no pmp illegal intrs
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Nikita Shubin <n.shubin@yadro.com>, Bin Meng <bin.meng@windriver.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d29
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d29;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd29.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 22 Dec 2021 22:16:06 -0000

On Tue, Dec 21, 2021 at 6:08 PM Nikita Shubin <nikita.shubin@maquefel.me> wrote:
>
> From: Nikita Shubin <n.shubin@yadro.com>
>
> As per the privilege specification, any access from S/U mode should fail
> if no pmp region is configured and pmp is present, othwerwise access
> should succeed.
>
> Fixes: d102f19a208 (target/riscv/pmp: Raise exception if no PMP entry is configured)
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/585
> Signed-off-by: Nikita Shubin <n.shubin@yadro.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/op_helper.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> index ee7c24efe7..58d992e98a 100644
> --- a/target/riscv/op_helper.c
> +++ b/target/riscv/op_helper.c
> @@ -146,7 +146,8 @@ target_ulong helper_mret(CPURISCVState *env, target_ulong cpu_pc_deb)
>      uint64_t mstatus = env->mstatus;
>      target_ulong prev_priv = get_field(mstatus, MSTATUS_MPP);
>
> -    if (!pmp_get_num_rules(env) && (prev_priv != PRV_M)) {
> +    if (riscv_feature(env, RISCV_FEATURE_PMP) &&
> +        !pmp_get_num_rules(env) && (prev_priv != PRV_M)) {
>          riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
>      }
>
> --
> 2.31.1
>
>

