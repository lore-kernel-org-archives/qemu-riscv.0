Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mo3E7-0003wE-Ka
	for mharc-qemu-riscv@gnu.org; Fri, 19 Nov 2021 07:42:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mo3E5-0003te-1V; Fri, 19 Nov 2021 07:42:45 -0500
Received: from [2607:f8b0:4864:20::d36] (port=33685
 helo=mail-io1-xd36.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mo3E3-0004Gp-79; Fri, 19 Nov 2021 07:42:44 -0500
Received: by mail-io1-xd36.google.com with SMTP id m9so12653730iop.0;
 Fri, 19 Nov 2021 04:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2KZIoCF7BhzSQOaGIyBGlnLPP7rr4vErC3ItZkTiii4=;
 b=iyF8JpesdG50oOJuz6ItvqR9J+jM6R/LaB8V+RSySwumO+H2RzqXzr/vGn4pT8cZuQ
 1Uo2Iu/XIOmPiqhLs1dO9nT74MclCWvl0c3KRS3F23sf5LnyqaZZ9pYgB9drFCCPqomO
 4gNd42qb2WYb8rMlpTPbMs3TeAY7ZphzHRYWAstLMXqLg0QGUozhAE/ffrMebe5Y0zac
 4VYZRCoGPWD90CnAf6nmpCEDhU/P40NSb8vWVdOpvEULLJrJtM9c3objOYfs6NAW2Eg9
 e0zzLV/db+8dDD1uqOzDUAWY7/G2MnFfzA20YKxBxSVAhPda6Db2h4A/fgwl0KUDlz5O
 E/kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2KZIoCF7BhzSQOaGIyBGlnLPP7rr4vErC3ItZkTiii4=;
 b=WLFTQPDqPiCAy1usgjj+dzGTI3FKCf2wK1R65kSEi1DnLM+hOe6EKQoFZJjTgwmqQT
 X5+94xmwtH28y4OS46ro8OPKEGOuDqlZuEZW8UAbNEZKzgeEQYXEw2m1cfjgITC2OOTT
 K5g6Fr0nySC2BVmSPHEJZrLLVH1/NS9U3VENSYobLWdnvbmhWep+D9hYJ1/vaTn0wNzR
 cCrX8/ZHPyBGv4mhn6+kfnfpMKcZDYljmcjGLWWl9bxt14Ql7aKydzXNaZRm+bzJORSS
 qkM0/KK3DA1UZbAxGx27Au+tDeiXafHNKgJEsYUTrO8Ven4WL/FJNQymHPKQYBGb5qVa
 2mnA==
X-Gm-Message-State: AOAM533nralIJd5ZEeXPoy6TCjY3XqfvtkwDPRSVREW5FdRtG7MjdGeL
 v9OKumntv6bCpcIUqwev2mEl+AkQuRUhA5ijffA=
X-Google-Smtp-Source: ABdhPJxP6XS/oDUGXqcO7d/RqqkTIN1IJpFBBih6OTtOnM0LAVt60tul6pyxcHMv27vrDOexeS/eH3UVt9DbShAXRVU=
X-Received: by 2002:a05:6638:32a2:: with SMTP id
 f34mr26937763jav.63.1637325761679; 
 Fri, 19 Nov 2021 04:42:41 -0800 (PST)
MIME-Version: 1.0
References: <20211111155149.58172-1-zhiwei_liu@c-sky.com>
 <20211111155149.58172-18-zhiwei_liu@c-sky.com>
In-Reply-To: <20211111155149.58172-18-zhiwei_liu@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 19 Nov 2021 22:42:15 +1000
Message-ID: <CAKmqyKPBtn5ac5YjO_izdGCazDppS2hcoGxBq2hNfc6uxQdo3A@mail.gmail.com>
Subject: Re: [PATCH v4 17/20] target/riscv: Fix check range for first fault
 only
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d36
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd36.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
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
X-List-Received-Date: Fri, 19 Nov 2021 12:42:45 -0000

On Fri, Nov 12, 2021 at 2:05 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
> Only check the range that has passed the address translation.
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/vector_helper.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index e49b431610..4cd6476b82 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -630,12 +630,12 @@ vext_ldff(void *vd, void *v0, target_ulong base,
>                                           cpu_mmu_index(env, false));
>                  if (host) {
>  #ifdef CONFIG_USER_ONLY
> -                    if (page_check_range(addr, nf * msz, PAGE_READ) < 0) {
> +                    if (page_check_range(addr, offset, PAGE_READ) < 0) {
>                          vl = i;
>                          goto ProbeSuccess;
>                      }
>  #else
> -                    probe_pages(env, addr, nf * msz, ra, MMU_DATA_LOAD);
> +                    probe_pages(env, addr, offset, ra, MMU_DATA_LOAD);
>  #endif
>                  } else {
>                      vl = i;
> --
> 2.25.1
>
>

