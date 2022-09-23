Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1obb4R-0000jC-Uw
	for mharc-qemu-riscv@gnu.org; Fri, 23 Sep 2022 01:17:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1obb4N-0000hm-63; Fri, 23 Sep 2022 01:17:48 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:55837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1obb4L-0006OX-ET; Fri, 23 Sep 2022 01:17:46 -0400
Received: by mail-pj1-x1031.google.com with SMTP id fs14so11852643pjb.5;
 Thu, 22 Sep 2022 22:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=Wft0tjOby9p8eGPFkvFab8hyfFjURB/lF1A9p4xiTlQ=;
 b=iJOUGmwLE6XIWHE1mfWU9zU7hnq2Vua7vtjIvc6oilHpF3aIhEYh22ViUSYwP3/6qn
 geijy9HRRtV+4kRdvuhkXtQOuLmGbUjmxcNwFXEsKLhxluYlImEzslOdfZMmmm9/w0OR
 y7uhe2cVsXH9b10A6xndCfcAaGp17PvTAaUkTIZK1YAJziAYpd8jZMJlWgYCLxwjVNru
 5WEvzZkq4cO8vfLM0xx+ha0D1PuWbA9NASNFHZ/dE+KmrGX0RAjIMdus+MpmvVxbBEmW
 sElp0T/Y/3OFvNuGJZzooXn6BnXSI7Y1aTiV7Qqifwbi3hvXvT/oPBxbu5XY+UK3yFx2
 2uxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=Wft0tjOby9p8eGPFkvFab8hyfFjURB/lF1A9p4xiTlQ=;
 b=Gm/DABnWuhFOndUT96wq5uDIBMSkuWwjBGkROJk0yrfqiu1UrnpDjFDR12uO2LVDWH
 FKBUoURwC7HhEG+uNy0MRZGzXnLlcRXEZmFNpnDcgZdHpqXcyNEAUpxZtJLR2Dbe9dtg
 s6Y+BZzH8XaRGmk+CJSTsri9zU4An6KJ1lzG0hJWU6LB2oevWmFI9SDoY5EYGFAaXLWT
 veAlHBcLBFA0zyXDb3WP0YvmiKLsBJZxQy6dNzDsHU3eigkynpp+ZElJtVtITOTJ9lip
 ENQH+3bSOIpQThlMwXqTXg//KJENwmVZbiASi4Lv16gbaAU5D2j219pe6CtnplHSCf1p
 MR8Q==
X-Gm-Message-State: ACrzQf2d1DsA7biFG8jLdm/DWnMB33pBBBJnkefNTzP1mG4xcgjtzEQ5
 omfL/xQpI+MmopZjJSAChgAM64DLbDb/tUm4MSA=
X-Google-Smtp-Source: AMsMyM6u7+Ve2Gj0t5b1SLV3VDX70bJGOWxM+LndJE6zs9Anc6ldpXMeQpT0W2q/Zwgg7ow7MuebYhxxYpVMs6NuUY8=
X-Received: by 2002:a17:90b:1b50:b0:202:f495:6b43 with SMTP id
 nv16-20020a17090b1b5000b00202f4956b43mr19350037pjb.85.1663910263572; Thu, 22
 Sep 2022 22:17:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220819071137.1140627-1-tommy.wu@sifive.com>
 <CAKmqyKNidxPt-Bu81-Eex=g9ZWdTJ29geBdtg+w5sMTvy4hraA@mail.gmail.com>
 <CANj3q_nA5Gz82Re+-spcFXATsJ3YvtknzoULG4998=D5=pXhbw@mail.gmail.com>
In-Reply-To: <CANj3q_nA5Gz82Re+-spcFXATsJ3YvtknzoULG4998=D5=pXhbw@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 23 Sep 2022 15:17:00 +1000
Message-ID: <CAKmqyKMabgJV66=2Rt4Gk55zj=jx6+Ef4GvKQ_xzrDVp37Kskw@mail.gmail.com>
Subject: Re: [PATCH] include/hw/riscv/sifive_e.h: Fix the type of parent_obj
 of SiFiveEState.
To: Tommy Wu <tommy.wu@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <Alistair.Francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x1031.google.com
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
X-List-Received-Date: Fri, 23 Sep 2022 05:17:50 -0000

On Thu, Sep 22, 2022 at 6:12 PM Tommy Wu <tommy.wu@sifive.com> wrote:
>
> To the maintainers:
>
> Thank Alistair and Jim for the review.
> Bernhard Beschow sent the same patch : https://lists.gnu.org/archive/html/qemu-riscv/2022-09/msg00126.html
>
> It seems that this simple patch is helpful. Could you help us to merge this patch?
> Thanks for your great help!

Hey Tommy,

Sorry for the mixup!

This patch fell through the cracks after I had reviewed it. I just
applied the other patch as I had already run it through my testing
before I saw this.

This is my fault, I'm sorry your patch didn't get applied.

For next time, feel free to ping your patch if it hasn't had any
movement in a week. That helps ensure I don't miss anything

Alistair

>
> Regards,
> Tommy Wu
>
>
>
> On Mon, Aug 22, 2022 at 11:33 AM Alistair Francis <alistair23@gmail.com> wrote:
>>
>> On Fri, Aug 19, 2022 at 5:12 PM Tommy Wu <tommy.wu@sifive.com> wrote:
>> >
>> > Fix the type of parent_obj of SiFiveEState from 'SysBusDevice'
>> > to 'MachineState'. Because the parent of SiFiveEState is 'MachineState'.
>> >
>> > Signed-off-by: Tommy Wu <tommy.wu@sifive.com>
>>
>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>>
>> Alistair
>>
>> > ---
>> >  include/hw/riscv/sifive_e.h | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/include/hw/riscv/sifive_e.h b/include/hw/riscv/sifive_e.h
>> > index 83604da805..24359f9fe5 100644
>> > --- a/include/hw/riscv/sifive_e.h
>> > +++ b/include/hw/riscv/sifive_e.h
>> > @@ -41,7 +41,7 @@ typedef struct SiFiveESoCState {
>> >
>> >  typedef struct SiFiveEState {
>> >      /*< private >*/
>> > -    SysBusDevice parent_obj;
>> > +    MachineState parent_obj;
>> >
>> >      /*< public >*/
>> >      SiFiveESoCState soc;
>> > --
>> > 2.27.0
>> >
>> >

