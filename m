Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pAPDT-0003KI-3i
	for mharc-qemu-riscv@gnu.org; Wed, 28 Dec 2022 00:43:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pAPDR-0003K4-Br; Wed, 28 Dec 2022 00:43:01 -0500
Received: from mail-vk1-xa36.google.com ([2607:f8b0:4864:20::a36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pAPDP-0001rM-Ej; Wed, 28 Dec 2022 00:43:01 -0500
Received: by mail-vk1-xa36.google.com with SMTP id i84so149152vke.7;
 Tue, 27 Dec 2022 21:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I45P6+0Tjclvu/5c/iDu/ILb+R3pHqV4V8ja7p1OqVI=;
 b=aM40hbpWsWdTTOmDO8mEcRUpdvXin+qKC5aAdEsyNAp8x1IpxW9EsZx6b+511dD01Q
 UCy67tGQok6O6DXL8KTMv6lZezVvpVDDZ7wkUYZs9Fw33f0lRl922fL9cIWa+UEMI7se
 tYxmeM9EMfXZen1+gpqrFs04kmc1wrgKYQElOUubL0UHyqEZ11r2ujWKW/XTXZv1Z2X3
 YR/WRAQjZZgjO0Q6kZl3yqzQGD8HM43/Cwtjl/UuXAQYHS73rXUoxaxNDf4kS5tg3FQf
 T9P2DMjT7xmyaU0MUOCSOlx0YQvM+vH+bkPf5S3IHILe8lq1Q4Ri4W5exGyhspz0aMMV
 JIFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I45P6+0Tjclvu/5c/iDu/ILb+R3pHqV4V8ja7p1OqVI=;
 b=Dmec7wY9SYf7H+0MET4S6CCjp7GSJPvKQV4uXP2PNepS6jvtvHE2n3a/lAgVe2kcXU
 rKtJqN3nmN9C9tFtJQYshc7lU1Xetoty8wRZ2EWSWhB2a5c5tj19UL4rw61mnoUZ5JDR
 070mRfIGGh+K/Gyr2JmanVCl7MyaBhAa6MSpoKMvJ66uzs7snRjhLwtnUbXt0PB2HzFm
 lD2S12FpiXq0JLCYsLqItaZbJHj4kNft327wxLVgDabcbLBK5Z6lsYcw22XfWxRyfWMA
 /DGpVewcsmPcZUqGtmGgX/+5VQjQwU5IT6OTS5vveJ7QVeEmswwwlZsnBw/NDm9WI6c5
 uz9w==
X-Gm-Message-State: AFqh2kpnSKH9Y96mmMIbOfdp5OygvK9riMSZdZkt1mb03Q5ocfeBGNXe
 K4h0IocI5USvmI1MSL3D3tQhLcvqi7RIOxz+dzg=
X-Google-Smtp-Source: AMrXdXuR5NuAscsz2AzVRjDVajpWG2SzCc80FXyLzjJRglkO9fouMW6PLzldjxdj311Voh9KSNBe3xLcjIH9XnoN37Y=
X-Received: by 2002:a1f:a954:0:b0:3b8:ba98:bd43 with SMTP id
 s81-20020a1fa954000000b003b8ba98bd43mr2660335vke.34.1672206177912; Tue, 27
 Dec 2022 21:42:57 -0800 (PST)
MIME-Version: 1.0
References: <20221130075001.19130-1-liweiwei@iscas.ac.cn>
In-Reply-To: <20221130075001.19130-1-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 28 Dec 2022 15:42:31 +1000
Message-ID: <CAKmqyKO0BpPbd7onPybSeyXaPxrMWm4tODjVj94ynKC7+aGdUg@mail.gmail.com>
Subject: Re: [PATCH v8 0/9] support subsets of code size reduction extension
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a36;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa36.google.com
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
X-List-Received-Date: Wed, 28 Dec 2022 05:43:01 -0000

On Wed, Nov 30, 2022 at 5:53 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
> This patchset implements RISC-V Zc* extension v1.0.0.RC5.7 version instru=
ctions.
>
> Specification:
> https://github.com/riscv/riscv-code-size-reduction/tree/main/Zc-specifica=
tion
>
> The port is available here:
> https://github.com/plctlab/plct-qemu/tree/plct-zce-upstream-v8
>
> To test Zc* implementation, specify cpu argument with 'x-zca=3Dtrue,x-zcb=
=3Dtrue,x-zcf=3Dtrue,f=3Dtrue" and "x-zcd=3Dtrue,d=3Dtrue" (or "x-zcmp=3Dtr=
ue,x-zcmt=3Dtrue" with c or d=3Dfalse) to enable Zca/Zcb/Zcf and Zcd(or Zcm=
p,Zcmt) extensions support.
>
>
> This implementation can pass the basic zc tests from https://github.com/y=
ulong-plct/zc-test
>
> v8:
> * improve disas support in Patch 9
>
> v7:
> * Fix description for Zca
>
> v6=EF=BC=9A
> * fix base address for jump table in Patch 7
> * rebase on riscv-to-apply.next
>
> v5:
> * fix exception unwind problem for cpu_ld*_code in helper of cm_jalt
>
> v4:
> * improve Zcmp suggested by Richard
> * fix stateen related check for Zcmt
>
> v3:
> * update the solution for Zcf to the way of Zcd
> * update Zcb to reuse gen_load/store
> * use trans function instead of helper for push/pop
>
> v2:
> * add check for relationship between Zca/Zcf/Zcd with C/F/D based on rela=
ted discussion in review of Zc* spec
> * separate c.fld{sp}/fsd{sp} with fld{sp}/fsd{sp} before support of zcmp/=
zcmt
>
> Weiwei Li (9):
>   target/riscv: add cfg properties for Zc* extension
>   target/riscv: add support for Zca extension
>   target/riscv: add support for Zcf extension
>   target/riscv: add support for Zcd extension
>   target/riscv: add support for Zcb extension
>   target/riscv: add support for Zcmp extension
>   target/riscv: add support for Zcmt extension
>   target/riscv: expose properties for Zc* extension
>   disas/riscv.c: add disasm support for Zc*

I think this series has been fully reviewed. Do you mind rebasing it
on https://github.com/alistair23/qemu/tree/riscv-to-apply.next and
then I'll apply it

Alistair

>
>  disas/riscv.c                             | 228 +++++++++++++++-
>  target/riscv/cpu.c                        |  56 ++++
>  target/riscv/cpu.h                        |  10 +
>  target/riscv/cpu_bits.h                   |   7 +
>  target/riscv/csr.c                        |  38 ++-
>  target/riscv/helper.h                     |   3 +
>  target/riscv/insn16.decode                |  63 ++++-
>  target/riscv/insn_trans/trans_rvd.c.inc   |  18 ++
>  target/riscv/insn_trans/trans_rvf.c.inc   |  18 ++
>  target/riscv/insn_trans/trans_rvi.c.inc   |   4 +-
>  target/riscv/insn_trans/trans_rvzce.c.inc | 313 ++++++++++++++++++++++
>  target/riscv/machine.c                    |  19 ++
>  target/riscv/meson.build                  |   3 +-
>  target/riscv/translate.c                  |  15 +-
>  target/riscv/zce_helper.c                 |  55 ++++
>  15 files changed, 834 insertions(+), 16 deletions(-)
>  create mode 100644 target/riscv/insn_trans/trans_rvzce.c.inc
>  create mode 100644 target/riscv/zce_helper.c
>
> --
> 2.25.1
>
>

