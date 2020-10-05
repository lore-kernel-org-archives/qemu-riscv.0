Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kPYr7-0004Lg-Au
	for mharc-qemu-riscv@gnu.org; Mon, 05 Oct 2020 18:21:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kPYr2-0004Kh-EW; Mon, 05 Oct 2020 18:21:14 -0400
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143]:38859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kPYqv-0006Xc-64; Mon, 05 Oct 2020 18:21:12 -0400
Received: by mail-il1-x143.google.com with SMTP id z5so9286715ilq.5;
 Mon, 05 Oct 2020 15:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/w3wO+trZ16Sgm70yMjg9eMipq82LDClQIJC/lTGDwU=;
 b=jxl0i+MpkP0FIRaWv/Ds20ytLAfRNS+3+qPDiaInEI8izeIJPir1vjtnVVc7oWfxou
 BmG1twcYpH0e16rFto/nOcJSZ4unKwRewHmNF5pnBy6lLdPBG3AYhkT3hMWjh6sNKGTc
 DjCT6fAKuBCRetu225VyokPYaMdNXbRkeeFDMuGeXXpZwDC/+2e3wc230hKGfEB6/YWS
 8sEG+S2h8t5LycPRTabX5XWAiTQSGQN5M+zzxIuVug1O7tTTn/qRKQ8PpTk3UKnWWymi
 6/c27OktIG1pfgooi6E32+u4h/sWKh1L6qO/ooua1u3wyhvJc47ZvXbFE/k5NZe/gjxJ
 DNgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/w3wO+trZ16Sgm70yMjg9eMipq82LDClQIJC/lTGDwU=;
 b=BxiRCjWleTtP/pR5cY/UcTR+Bsbe0G3grYjyDUhh2SWHj68LyfDp3oi53V8DSGIR6W
 uKDFKwy15vGJj2LHmxoao9Gui9VggScow18MVi9CAYHKxnfmXlzXLFyVwckD9QzxuLe6
 4KkGQoR0vLxNUFStb6ovpNsQDvnNC/+4d+yU7b3feu8DoUkMEjflOlB0or/+LpjW+jQt
 MDY8W6MjGHN/7yzC/akJkT/4+JUPpFMGblD5/djVfU9fM9YcGJfrcdksC2k6BbaE73bl
 HeFKa2+I+kKTNS3BEH7UOmotS0YEwI1zXLgzrSpWSFhr7mOv3AAfTK367bVMgGAwGrc0
 tIcQ==
X-Gm-Message-State: AOAM531e0SRxN+5p5bnDdMUA2BttoK0Z6vAM/r0lpoqxUY4jcUS2uVAN
 F0E6w1JJKfpyYUKytjl6Yq10/krKIcMMdsfVkM0=
X-Google-Smtp-Source: ABdhPJxfrVCWPNkb/DKLmE4YkeliPaIHTPQh9uxAmmdfXCVxTij1oaEtrOXjuzdqeAK/Xn6SID0zzBKitLpn+7ukuak=
X-Received: by 2002:a92:c5c2:: with SMTP id s2mr1261550ilt.177.1601936461828; 
 Mon, 05 Oct 2020 15:21:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200929020337.1559-1-jiangyifei@huawei.com>
 <20200929020337.1559-4-jiangyifei@huawei.com>
 <2e725e26-3952-dbd2-c4aa-d9e933406220@linaro.org>
In-Reply-To: <2e725e26-3952-dbd2-c4aa-d9e933406220@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 5 Oct 2020 15:09:34 -0700
Message-ID: <CAKmqyKMzZ3W130jG973PWBQ52zBLVfSP+=Xbp7Cdk4NpuHDkgw@mail.gmail.com>
Subject: Re: [PATCH 3/5] target/riscv: Add H extention state description
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Yifei Jiang <jiangyifei@huawei.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Zhanghailiang <zhang.zhanghailiang@huawei.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 "Zhangxiaofeng (F)" <victor.zhangxiaofeng@huawei.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, yinyipeng <yinyipeng1@huawei.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, "Wubin (H)" <wu.wubin@huawei.com>, 
 "dengkai (A)" <dengkai1@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::143;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x143.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-List-Received-Date: Mon, 05 Oct 2020 22:21:14 -0000

On Thu, Oct 1, 2020 at 10:56 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 9/28/20 9:03 PM, Yifei Jiang wrote:
> > +        VMSTATE_UINTTL(env.vsstatus, RISCVCPU),
> > +        VMSTATE_UINTTL(env.vstvec, RISCVCPU),
> > +        VMSTATE_UINTTL(env.vsscratch, RISCVCPU),
> > +        VMSTATE_UINTTL(env.vsepc, RISCVCPU),
> > +        VMSTATE_UINTTL(env.vscause, RISCVCPU),
> > +        VMSTATE_UINTTL(env.vstval, RISCVCPU),
> > +        VMSTATE_UINTTL(env.vsatp, RISCVCPU),
>
> So... if I understand things correctly, this is synthetic state, internal to
> QEMU.  It is generally better to only serialize architectural state, so that if
> qemu internals are rearranged, it is easy to decide on the correct sequence of
> operations.

I don't think the virtual registers are synthetic, they contain what
the guest Hypervisor/Hypervisor guest wrote to those CSRs. I don't
think we could re-generate them from anything else.

There are some other registers in this series that I think can be
re-generated. The PMP is a good example of that, where the PMP config
data could be re-generated from the CSRs.

Alistair

>
> It seems like this should be re-generated with a post_load hook, calling some
> of the code currently in riscv_cpu_swap_hypervisor_regs().  Note that some
> minor rearrangement would be needed to call that code from this new context.
>
>
> r~
>

