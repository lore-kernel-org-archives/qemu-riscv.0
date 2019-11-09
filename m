Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iTT6L-00038k-SS
	for mharc-qemu-riscv@gnu.org; Sat, 09 Nov 2019 10:56:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49757)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iTT6J-00036o-B7
 for qemu-riscv@nongnu.org; Sat, 09 Nov 2019 10:56:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iTT6I-0007Ll-7q
 for qemu-riscv@nongnu.org; Sat, 09 Nov 2019 10:56:35 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:36415)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iTT6I-0007L7-27
 for qemu-riscv@nongnu.org; Sat, 09 Nov 2019 10:56:34 -0500
Received: by mail-oi1-x243.google.com with SMTP id j7so7960711oib.3
 for <qemu-riscv@nongnu.org>; Sat, 09 Nov 2019 07:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V0J39ZP+gqYtH1FsiwOzOQMPVqG43LmtvsVt/9EATI0=;
 b=lhw4tYnxaLtJhVn/kv0pYyxVffeF3PaUuxP7p9Fpbt2/GNC3uU+Ck1KADCeI4ku2Z5
 Xzw7gam0h72lV02AGEqBW7aWk7HyHggOxmMZdD0MF9uBExKZpC5pQlxz2vVC2Ci3KRIB
 TJ9kSjXLyo5d+vy8j2gDrYX3i8WXv4sWQodFw88rDUSewzKOpH1LRoR3HGoGHZwPYVBv
 u4eDtFqF+Blm0DpTqdlV0gMy+wxhy9VIeHG0k1OCB69MAhanpZbpAfxPkR6wgBYnD3Ed
 Q/ZWFmOWHVGfqT2Fc1XiGoKdDvj6gIwCM7cEbhdv/nFK5jy2OBvnkQEVl6XMzjxyQAyl
 thMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V0J39ZP+gqYtH1FsiwOzOQMPVqG43LmtvsVt/9EATI0=;
 b=B0kmFNpXdxv0bxTcrehvNDugN8YVLWlAEyi1rGQyPgm+K5xiFuU1ZtOxZ4jtQp/Kq/
 Fd9UV+EIl8gaXTesH3reioYNZIWdho9IuZhmCONMI5C6ZgMX5LVH7e2SLHv/MtDOQMYf
 9PW5mouYTjcW1vZqSO3ypIFZY8zsXhq8XG2Tbkonfoy4YA5eDWRi1tozKONkfA2oB4d7
 nGGJltvMQCzMNuLoPvJRhzgeYvutlMOo1wMfOAKx2Ig+rqzcsO14dMZymoPwxwI70kPB
 5e+DGFU3a1aw4vXbeONEXl/36vjZdaG9aFepJvn9h7cE4r32FNTqlKcKhUtNLnZtg5Z8
 PfQw==
X-Gm-Message-State: APjAAAX1mLySoax1SQdLO9cDXf0k8q2TVcHzOYUVHGYIChxwnDqeGSj8
 IgTbsqsMSQbqSAsQJ9EeghmpQdkD4zRao/bjcNrlUA==
X-Google-Smtp-Source: APXvYqwXLfMPazDakHpZ1f42MzE2uWF80g/h7LXsMxSCtr0+m1Yh0ZRS+Ovm0y3B/4Yu55S3pJED+7jptfFAe4vmlC0=
X-Received: by 2002:a05:6808:7d1:: with SMTP id
 f17mr16124762oij.163.1573314992944; 
 Sat, 09 Nov 2019 07:56:32 -0800 (PST)
MIME-Version: 1.0
References: <20191108194758.17813-1-palmer@dabbelt.com>
 <20191108194758.17813-3-palmer@dabbelt.com>
In-Reply-To: <20191108194758.17813-3-palmer@dabbelt.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 9 Nov 2019 15:56:21 +0000
Message-ID: <CAFEAcA_Lj2SmxMTEN06+FxwQrkuR80Vw5=Dkh1achFUySSFAxA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] ARM/virt: Use fdt_setprop_strings()
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 QEMU Developers <qemu-devel@nongnu.org>, 
 David Gibson <david@gibson.dropbear.id.au>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
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
X-List-Received-Date: Sat, 09 Nov 2019 15:56:36 -0000

On Fri, 8 Nov 2019 at 19:48, Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> This new helper function encodes the idiom used by the ARM virt board to
> set a string array.  I don't currently have a working ARM userspace, so I haven't tested
> this, but I made the helper function because I wanted to use it for the
> RISC-V virt board where I have tested it.
>
> Signed-off-by: Palmer Dabbelt <palmer@dabbelt.com>
> ---
>  hw/arm/virt.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index d4bedc2607..4dc00f54d5 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -304,9 +304,8 @@ static void fdt_add_timer_nodes(const VirtMachineState *vms)
>
>      armcpu = ARM_CPU(qemu_get_cpu(0));
>      if (arm_feature(&armcpu->env, ARM_FEATURE_V8)) {
> -        const char compat[] = "arm,armv8-timer\0arm,armv7-timer";
> -        qemu_fdt_setprop(vms->fdt, "/timer", "compatible",
> -                         compat, sizeof(compat));
> +        qemu_fdt_setprop_strings(vms->fdt, "/timer", "compatible",
> +                                 "arm,armv8-timer\0arm,armv7-timer\0");
>      } else {


This seems to be changing the property we put in -- in
the old code it is 'foo\0bar\0', but in the new code
there will end up being two \0 at the end: 'foo\0bar\0\0'.

thanks
-- PMM

