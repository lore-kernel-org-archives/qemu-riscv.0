Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mzYjU-0005XR-ID
	for mharc-qemu-riscv@gnu.org; Tue, 21 Dec 2021 01:34:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mzYjS-0005Vo-0Y; Tue, 21 Dec 2021 01:34:42 -0500
Received: from [2607:f8b0:4864:20::d2f] (port=33618
 helo=mail-io1-xd2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mzYjQ-0007Nj-DQ; Tue, 21 Dec 2021 01:34:41 -0500
Received: by mail-io1-xd2f.google.com with SMTP id m9so16485548iop.0;
 Mon, 20 Dec 2021 22:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=87jO2CGfdDyFX4fYvkxb0eoRWzthkWRvONFVUUzPEzM=;
 b=c79H1m3J2JPc5eCj09YWohAROZuHcGH5niYfLCI+Kqb8ry8FRpbYNA1AwXKBmrupyR
 v3yKZBsK19RkglHabSdZ1BUJ2+81r63bFxjb6Y9rgdm6rzKDC3DwEsccg9hw2PjVkfGn
 RytRfl8qYZrwPH/+psbL7X6QrwNY7pLoQRDsLumzXGLbMjr5xN8/dytYBgCwldAhNCle
 I4ZDGpS2fptF3uo2KKxKxNT1vFdi/Bp6EM7NEbJsV9WyV65DpebCBCVdWz+QuScHCMtB
 JxcC90CIySVU5SI3l6ThIjPfd4t2+MTZYVt2E/8p45WsKStlw8vQUTyVjeWliS4trq9B
 2ieg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=87jO2CGfdDyFX4fYvkxb0eoRWzthkWRvONFVUUzPEzM=;
 b=KDvsqlqzZnYEaV+lpp6e5CwTKFvh7EEdQPzHy2llpp2Mnc4ii8BQZpn57fEUixZUJu
 L3a6FX/Ya8ss+OnK5r60hB4Ju+wwPMTyTEuzPuc0frGTtnxEnD7oOoAc1W4fVuQnbNXB
 0GblulJakqEQRiRpQ/EH4HM7TNE0hq5/vKkGoXkQ+JRe9cf302dGuwaJqfIFK/xbE2kc
 3NVxJQn/0CN1lFCkIRLIb46uztYuhbhO1rq5G5IqijwUggF570rE6kfTZ9f92k5gakul
 nKec+304i93RXi2x9H4k211u4RKUY4fJLrZQN1fK9jt06+X2mpT60Bv/8V0w7ld70LE/
 JCWw==
X-Gm-Message-State: AOAM531HxxJZjVOs5pG+xicMELmRDKf/Gjm3JwT4orlgF8UVyQVvorKP
 uK4QWSlqHDpItTy+xjxGX3VCl5xZVryv3oLBwFk=
X-Google-Smtp-Source: ABdhPJz1gAMu5lwTp6aLexg5qx6dmHlFi6qW04ko+ycua0c7Ysx68XTHarI2DtzTIWSJHOnT8K8HclPdi2X6Mo6zmB8=
X-Received: by 2002:a02:aa8f:: with SMTP id u15mr1025532jai.63.1640068478643; 
 Mon, 20 Dec 2021 22:34:38 -0800 (PST)
MIME-Version: 1.0
References: <20211214092659.15709-1-nikita.shubin@maquefel.me>
In-Reply-To: <20211214092659.15709-1-nikita.shubin@maquefel.me>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 21 Dec 2021 16:34:12 +1000
Message-ID: <CAKmqyKOmKHjBYhBJP7EwDvKiV+H=y4jVheaJe8Wp46aBQWKgOA@mail.gmail.com>
Subject: Re: [PATCH] target/riscv/pmp: fix no pmp illegal intrs
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Nikita Shubin <n.shubin@yadro.com>, Bin Meng <bin.meng@windriver.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2f.google.com
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
X-List-Received-Date: Tue, 21 Dec 2021 06:34:42 -0000

On Wed, Dec 15, 2021 at 1:00 AM Nikita Shubin <nikita.shubin@maquefel.me> wrote:
>
> From: Nikita Shubin <n.shubin@yadro.com>
>
> As per the privilege specification, any access from S/U mode should fail
> if no pmp region is configured and pmp is present, othwerwise access
> should succeed.
>
> Fixes: d102f19a208 (target/riscv/pmp: Raise exception if no PMP entry is configured)
> Signed-off-by: Nikita Shubin <n.shubin@yadro.com>

Whoops!

I sent a patch to fix the exact same issue :)

I'll drop mine and we can merge yours. Do you mind adding this and
resending the patch

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/585

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

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

