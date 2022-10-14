Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ojCRc-0000ft-Du
	for mharc-qemu-riscv@gnu.org; Fri, 14 Oct 2022 00:37:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ojCRZ-0000da-WB; Fri, 14 Oct 2022 00:37:10 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:53985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ojCRY-0005Js-07; Fri, 14 Oct 2022 00:37:09 -0400
Received: by mail-pj1-x1036.google.com with SMTP id fw14so3857188pjb.3;
 Thu, 13 Oct 2022 21:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=86VuWO0I+xzUWhCqgIDPGQqTA52GuvpKE6PtyvtoOEc=;
 b=b8tRnk+MXVctTqeP3bIqdunxAACTN/okwqSLLrd5UmIwLxdBRjSPltabkmedmrl+aD
 H6t+EKq16zgNJJx4yDZI5BMZLw3myuIFtvgBp3k/kuxCRGNonjAFlBQmwmDubHJGQb24
 XLslN038opXAlz6/oE9i2Hi70WNVnJgjD3Jd2dSIcJgokpmfL5yKBG//lmaWMci5ALAg
 aXC+6GWntTS0JOXiZFMxNU+6hdKBKa2JRrxZPr5fuVQ7nOeV77oQHqR7JzTBleFUF/VB
 XxH5B7hv1ijyScm6pZNR59lPjAHzWPeF66fQ35YnvM0/f41ja07A5GnOm0Si/+s/EfaX
 yjcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=86VuWO0I+xzUWhCqgIDPGQqTA52GuvpKE6PtyvtoOEc=;
 b=ehJpc/jhOqwo+kSSP3pSkBX8DuX+9U/HHtHzIXYzgouW3FISjmfQCL3i7q58Jc7lnh
 NbUEigCEgJ64S9/vMhPYYb0eozgK80hlpyKQU15d8Y0wSQPQW1FmECss/2SuylJiEEl8
 esNxtYYvTmBym3idR9uOucaqwznUPcXHN1NIWy0vkHVA7C1tILHd3qbmxvXAah/jelr2
 cB3qK4cu6kLnEMF7tOcgK6dzOnYEBAJ0Vp4hVJfUL7uiA20txfKF6ywMxPBaJiQvH54G
 xn2IzYvDW9rNG+KCAIZL2WdXqQ6aLG7fyMRl80Wy/Ajl9YU+FuapoiTWsgVsNOz4c92C
 cfWw==
X-Gm-Message-State: ACrzQf0jEKAYMS9KRk7E9ugn3KQ8H79hQ5mVVnwQS9NOqWh+mQZ9nlfl
 m2/RK3bSPkhA9VnC03VDJUTGMoq/VtJBqNkMVNY=
X-Google-Smtp-Source: AMsMyM6+47u3hM4AleGnZzJ7uTYG1e5saSTVMMEvFA3FhAOlcc7dVdkW9/YFn4P2NdZQB7DSDaTwI7kqgQl5GlWHfSM=
X-Received: by 2002:a17:902:b092:b0:17b:833e:74f7 with SMTP id
 p18-20020a170902b09200b0017b833e74f7mr3124318plr.149.1665722224700; Thu, 13
 Oct 2022 21:37:04 -0700 (PDT)
MIME-Version: 1.0
References: <20221012011449.506928-1-alistair.francis@opensource.wdc.com>
In-Reply-To: <20221012011449.506928-1-alistair.francis@opensource.wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 14 Oct 2022 14:36:37 +1000
Message-ID: <CAKmqyKOXy9XPEVs3HEtrhN6g5k7SJtcEvVuowU74QHi9v3bwng@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: pmp: Fixup TLB size calculation
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, bmeng.cn@gmail.com, 
 palmer@dabbelt.com, alistair.francis@wdc.com, richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x1036.google.com
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
X-List-Received-Date: Fri, 14 Oct 2022 04:37:10 -0000

On Wed, Oct 12, 2022 at 11:15 AM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> Since commit 4047368938f6 "accel/tcg: Introduce tlb_set_page_full" we
> have been seeing this assert
>
>     ../accel/tcg/cputlb.c:1294: tlb_set_page_with_attrs: Assertion `is_power_of_2(size)' failed.
>
> When running Tock on the OpenTitan machine.
>
> The issue is that pmp_get_tlb_size() would return a TLB size that wasn't
> a power of 2. The size was also smaller then TARGET_PAGE_SIZE.
>
> This patch ensures that any TLB size less then TARGET_PAGE_SIZE is
> rounded down to 1 to ensure it's a valid size.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
> This is based on advice from Richard:
> https://patchwork.kernel.org/project/qemu-devel/patch/20221004141051.110653-9-richard.henderson@linaro.org/#25043166
>
>  target/riscv/pmp.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index ea2b67d947..2b43e399b8 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -628,6 +628,18 @@ bool pmp_is_range_in_tlb(CPURISCVState *env, hwaddr tlb_sa,
>      }
>
>      if (*tlb_size != 0) {
> +        /*
> +         * At this point we have a tlb_size that is the smallest possible size
> +         * That fits within a TARGET_PAGE_SIZE and the PMP region.
> +         *
> +         * If the size is less then TARGET_PAGE_SIZE we drop the size to 1.
> +         * This means the result isn't cached in the TLB and is only used for
> +         * a single translation.
> +         */
> +        if (*tlb_size < TARGET_PAGE_SIZE) {
> +            *tlb_size = 1;
> +        }
> +
>          return true;
>      }
>
> --
> 2.37.3
>

