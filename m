Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1otIKE-0005IK-EC
	for mharc-qemu-riscv@gnu.org; Thu, 10 Nov 2022 19:55:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1otIKC-00056e-7B; Thu, 10 Nov 2022 19:55:16 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1otIKA-0001y8-F6; Thu, 10 Nov 2022 19:55:15 -0500
Received: by mail-pf1-x430.google.com with SMTP id q9so3565923pfg.5;
 Thu, 10 Nov 2022 16:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UjvqnLjstwcuGX56iIcCKGJ3BEuf6YuY+U4Mik4ITnc=;
 b=oqC3E0gvI/KfL7FRB+BWVMAzHq0fasdoiuOSHOxVTqmAQG0L9RZRHEaoiZ0TeqyNyr
 0mehjbzjXqd6dDk5NpJhn9QhxOh/7tzispFepHusyJojQK2imgslk09X91mqvpR2Y+C0
 YbldejGkTw1b2yA1z8smVK2c0r+cyj9aBRlY+r/+Nh5iwk5PXfCo0gXE5u2zUlZjP5Dl
 hFbo1ZKf4gOmv16HWBmsKkdJ/z1A3hpSCoxaftJEPpX5aJuLCl9g/LsYWGwREOQ+iH35
 34Bdje4UbgkBpbrvbOegMJO/5zvbkoRQIorDQGnKD1IaClS5UuJbOiTTuCo0xO6sHDQk
 rYHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UjvqnLjstwcuGX56iIcCKGJ3BEuf6YuY+U4Mik4ITnc=;
 b=ofhv93SjX6TLDzR6hc1+fz4jjbwMKci0+jr1zWNvHaj3j+mR/VMBQXszVtfNxD3C9X
 6g9e2p8SDTBO8DSm7RD5kKmgrT0gHqUhxgEs1YTyROHQO7LFhfTbTiaBHWSd+WI1u89x
 cr5v7wwD+LaGVwQeGpTkRkHhsQWSsIxtwWh0CFpss3NIv/Bx3hxh+dPFBcI5qKrdqSm8
 R6z6s0SnLob4rn1c+WRsQnFPZ9y+DWwsDDzqEvGinqIUEdTwJ/g3dWlHnvONkAifHIu1
 N+DhGfTr6HCgjcfo6qyn0XuK5+pGRcujceCnBx1gWghVN7cGmgbQXx0fEeLAfR4TMAal
 H7Kw==
X-Gm-Message-State: ACrzQf2fPHiFuUkI1ds0xLLMJC3NVGe0lVdP5iiurILjcxmwgjIm7W4m
 fPEDA17ohep5pT+Hn5ZF2luovWNQkIdmpnDwC7A=
X-Google-Smtp-Source: AMsMyM42qusSBWdsmEqV4B3ee7ajhXfClmPKSkWPqyYK2tHI6DAbVHwbz4yd59u1nQXgCnc1IdJyWManFM8exxiCQtc=
X-Received: by 2002:a63:64c4:0:b0:46b:3c3d:f618 with SMTP id
 y187-20020a6364c4000000b0046b3c3df618mr3901729pgb.423.1668128112011; Thu, 10
 Nov 2022 16:55:12 -0800 (PST)
MIME-Version: 1.0
References: <20221013062946.7530-1-zhiwei_liu@linux.alibaba.com>
 <20221013062946.7530-5-zhiwei_liu@linux.alibaba.com>
 <CAKmqyKO0EUKg7k95RGnk3_=4BXynECBPfV5-_2VPW4A7p45daw@mail.gmail.com>
 <4fb639df-889f-a76d-6c62-126ec4d9e5e1@linux.alibaba.com>
 <f9600317-b40a-50fc-3f85-8ccae0c6790e@linaro.org>
In-Reply-To: <f9600317-b40a-50fc-3f85-8ccae0c6790e@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 11 Nov 2022 10:54:45 +1000
Message-ID: <CAKmqyKMfDvjAedv2TgnMUSiwRawvBVV5CbabkGh6=dnipM11ng@mail.gmail.com>
Subject: Re: [PATCH v1 4/4] target/riscv: Add itrigger_enabled field to
 CPURISCVState
To: Richard Henderson <richard.henderson@linaro.org>
Cc: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org, 
 qemu-riscv@nongnu.org, Alistair.Francis@wdc.com, palmer@dabbelt.com, 
 bin.meng@windriver.com, sergey.matyukevich@syntacore.com, 
 vladimir.isaev@syntacore.com, anatoly.parshintsev@syntacore.com, 
 philipp.tomsich@vrull.eu, zhiwei_liu@c-sky.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=alistair23@gmail.com; helo=mail-pf1-x430.google.com
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
X-List-Received-Date: Fri, 11 Nov 2022 00:55:16 -0000

On Thu, Nov 10, 2022 at 3:35 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 11/10/22 13:15, LIU Zhiwei wrote:
> >>> +static int debug_post_load(void *opaque, int version_id)
> >>> +{
> >>> +    RISCVCPU *cpu = opaque;
> >>> +    CPURISCVState *env = &cpu->env;
> >>> +
> >>> +    if (icount_enabled()) {
> >>> +        env->itrigger_enabled = riscv_itrigger_enabled(env);
> >>> +    }
> >>> +
> >>> +    return 0;
> >>> +}
> >>> +
> >>>   static const VMStateDescription vmstate_debug = {
> >>>       .name = "cpu/debug",
> >>>       .version_id = 2,
> >>>       .minimum_version_id = 2,
> >> The versions here should be bumped
> >
> > Hi Alistair and Richard,
> >
> > I am not sure if we should bump versions when just add post_load callback without adding
> > new fields.  I once upstreamed a patch
> > with a similar change but not bumping version.
>
> Simply adding a post_load does not require a version bump.

Ah, my mistake then

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
>
> r~

