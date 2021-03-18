Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lMzNk-0000Jp-4d
	for mharc-qemu-riscv@gnu.org; Thu, 18 Mar 2021 16:36:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lMzNi-0000Hh-DG; Thu, 18 Mar 2021 16:36:34 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:41688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lMzNf-0006MJ-Rw; Thu, 18 Mar 2021 16:36:34 -0400
Received: by mail-io1-xd30.google.com with SMTP id z3so3741408ioc.8;
 Thu, 18 Mar 2021 13:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YxGICG2iv7SWaF/CvHir33v2sf5FsLV0yZvRnxcbFsE=;
 b=edArSLHwJU2iIZqxOOrA+GpV9rmDwIwAFxfeCLDievdyW7mX4YI3LGIbHWEp+w4JYk
 JIjCehIUeggysp+PXMjrx9JGhEu1ZFHpNumbMJ5QgG9XIWfca/sRBvtKAUilmFFZ8okZ
 cv74N23WUmoyknYaACpKWAxW3EalIcHVvYwx4l3oo3nquLCJT2lw27/mZ9zo0ESlQi73
 j8mdpoVE5M8hqke66tbcVQRc2dyUv3Ecb06aTH8wsvg0WdZf/ZGJmeZWQfRDdMAVLm2S
 VRq2ohGqiOBeOibflHZoIWddkkH576hsgtg7Pa8Sg8zG0szE7+uDU3hfaDtoZNQGjjJO
 caBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YxGICG2iv7SWaF/CvHir33v2sf5FsLV0yZvRnxcbFsE=;
 b=WbZNyRzSoPrmlsRCUUqApHVzMkOpOMOqtfx//xw1WWuQ3q1AgpSR+uDkHccmOUjqWa
 0uuqd9sJmAFiNO7laNiUQjqETSSsx7kbDSiEwM3iYAuQRm1ui+7x7bs58kwjUlfYPFEl
 MrFjN9XHjaFMKk8Ds978uuPTQMJsLnGh9aWOqxdi05iQUkmbN6e/YoTdJtTEdwdDq4EY
 U6y9gzybwxTN73XSeuxGl/PJ1YTcONgs9gYrG+pAx5UvWuW3DWkTdsBPOR26nSxgE5Wn
 3xQlzO0aXjs8Ykzo6fLHUsBFZJjExUtfgoXO5a7eEf3SZlk8oRqQPI9SwA+WwQ52YeTE
 sSSA==
X-Gm-Message-State: AOAM532odaXFC4kR+9HR74bIB0l8OVDUhMFpp7yWsND9X/4M29xj0YOU
 xPp1cRQjovCOOrUZQHIcx2GhHZfXwo/GtAoB1KA=
X-Google-Smtp-Source: ABdhPJzaYnUqnpmQwvuhIOMeTaLheYIK6DASeBXfZtLByV0HlYAPhdw7XuoCltAvuOeugmBx3ZCZswcZ6r02FvfAisE=
X-Received: by 2002:a5d:87d5:: with SMTP id q21mr295264ios.105.1616099790521; 
 Thu, 18 Mar 2021 13:36:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210311094902.1377593-1-georg.kotheimer@kernkonzept.com>
In-Reply-To: <20210311094902.1377593-1-georg.kotheimer@kernkonzept.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 18 Mar 2021 16:34:42 -0400
Message-ID: <CAKmqyKPP0ZEJSVbZ75fsB1_xiYvHk-EvQqM-dL8tkJetwh5u1Q@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Make VSTIP and VSEIP read-only in hip
To: Georg Kotheimer <georg.kotheimer@kernkonzept.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d30;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd30.google.com
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
X-List-Received-Date: Thu, 18 Mar 2021 20:36:35 -0000

On Thu, Mar 11, 2021 at 4:49 AM Georg Kotheimer
<georg.kotheimer@kernkonzept.com> wrote:
>
> Signed-off-by: Georg Kotheimer <georg.kotheimer@kernkonzept.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/csr.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index fd2e6363f3..00a3ab72af 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -420,7 +420,8 @@ static const target_ulong sstatus_v1_10_mask = SSTATUS_SIE | SSTATUS_SPIE |
>      SSTATUS_UIE | SSTATUS_UPIE | SSTATUS_SPP | SSTATUS_FS | SSTATUS_XS |
>      SSTATUS_SUM | SSTATUS_MXR | SSTATUS_SD;
>  static const target_ulong sip_writable_mask = SIP_SSIP | MIP_USIP | MIP_UEIP;
> -static const target_ulong hip_writable_mask = MIP_VSSIP | MIP_VSTIP | MIP_VSEIP;
> +static const target_ulong hip_writable_mask = MIP_VSSIP;
> +static const target_ulong hvip_writable_mask = MIP_VSSIP | MIP_VSTIP | MIP_VSEIP;
>  static const target_ulong vsip_writable_mask = MIP_VSSIP;
>
>  static const char valid_vm_1_10_32[16] = {
> @@ -962,9 +963,9 @@ static int rmw_hvip(CPURISCVState *env, int csrno, target_ulong *ret_value,
>                     target_ulong new_value, target_ulong write_mask)
>  {
>      int ret = rmw_mip(env, 0, ret_value, new_value,
> -                      write_mask & hip_writable_mask);
> +                      write_mask & hvip_writable_mask);
>
> -    *ret_value &= hip_writable_mask;
> +    *ret_value &= hvip_writable_mask;
>
>      return ret;
>  }
> --
> 2.30.1
>
>

