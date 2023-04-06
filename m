Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkETO-0004f4-2S
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 21:31:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pkETM-0004er-Kh; Wed, 05 Apr 2023 21:31:32 -0400
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pkETJ-0003zr-QV; Wed, 05 Apr 2023 21:31:32 -0400
Received: by mail-vs1-xe2a.google.com with SMTP id h27so33180750vsa.1;
 Wed, 05 Apr 2023 18:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680744688;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ctUs3MzTui+okTJ3mCbg4M/Da7D0SyDITyJTP6DgU68=;
 b=Z645zwmtXhQofx6XTJ/8vg++QXVDGvzBslux+l4lMLb8USVI/Vmhgr4/+rd9663kPa
 J4uWKh3OdZgfGUjIraUAL6RJ6IJKdvNBGia5/DQzZMuX4Ty1BGtNlOBIDut9xejRjxrg
 KzpkkdQlWpnOa41rOo8j2GcnR6SdoXMTAoVO4GOr4gqaFBeNzx6fHVfvkr7ZsrTHRqf3
 ph8czNGBMOkc4H6yRiXDaIHrFy3cknfqNXwXKlbed4U3PP3oeu9ilCNXdUWzF4YAqkGo
 cw59xvRAbwyRXh6b6/nSNVi1ssRjL3btD7GvClnFpyMHb0jDfGf3lGTK0vtVhU3yBprt
 MQ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680744688;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ctUs3MzTui+okTJ3mCbg4M/Da7D0SyDITyJTP6DgU68=;
 b=oBSv4SE+4X86azmt7Vwa/UzF8gc7jjZKBi4xmqWf6AKpPEUVdJwc0bPBrbSS3QOX5u
 cvHiEpvN2TV7EWfOpMNTqzDVSaFi4P25opH9Hm6XL+25bHwQrn+P1ru3W/9Qo6Zj4S4t
 WUQ1abWbmsf48eG5RVCUAqE8tTIwrk33WEjeJHiGfuQ/4aO0/1G2KYwz3tEfRc6MOdNU
 AnrfjfH6F/0o1XA7pru4I9NwYgP8/Of+S7T/335whhRE4K9lrZ05jb0jZ7/kF6S9HWhr
 YUHip/XCi2g9c5CStLGBKGEDA6MCrKU9YaLDrYuSpt5vlCeLWmQ/nIp2pKejWWqXXWx4
 p8LQ==
X-Gm-Message-State: AAQBX9fqvSvnCGGt19t8wbbzTW7sNTaJ/gOWAEzd8p/+Zwvz88CsL2Bb
 Sw1QARjtafNN6iXYFwPU2uu0EQYosc86f3DIqxA=
X-Google-Smtp-Source: AKy350ZSOdGjn9lZY5KX46zGRZ887uhpiSg4dInva2elGIxxO4/q/hkZhD17pyx6ImWDGY+6mZI3O87Ivl7Fwg6kmrY=
X-Received: by 2002:a05:6102:3d29:b0:425:ddcf:69b3 with SMTP id
 i41-20020a0561023d2900b00425ddcf69b3mr4783021vsv.0.1680744687927; Wed, 05 Apr
 2023 18:31:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230405095720.75848-1-liweiwei@iscas.ac.cn>
In-Reply-To: <20230405095720.75848-1-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 6 Apr 2023 11:31:01 +1000
Message-ID: <CAKmqyKMpjhnVjq=mXSx_te6OA-29uL0iM4m3a6Ptq8LoHnB0TA@mail.gmail.com>
Subject: Re: [PATCH v4 0/1] hw/riscv: Add ACT related support
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2a;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2a.google.com
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
X-List-Received-Date: Thu, 06 Apr 2023 01:31:32 -0000

On Wed, Apr 5, 2023 at 7:58=E2=80=AFPM Weiwei Li <liweiwei@iscas.ac.cn> wro=
te:
>
> ACT tests play an important role in riscv tests. This patch tries to
> add related support to run ACT tests.
>
> The port is available here:
> https://github.com/plctlab/plct-qemu/tree/plct-act-upstream-v2
>
> The ACT tests can be run on qemu-system-riscv32/64 with machine argument
> "-M spike,signature=3D<FILE>,signature-granularity=3D<granurity>".
>
> v4:
> * update error message for opening signature file failed
> * add check for existence of begin/end_signature symbols when trying to u=
pdate signature file.
>
> v3:
> * move definition of signature related parameters from spike.c to riscv_h=
tif.c
>
> v2=EF=BC=9A
> * move "extern ..." declaration from riscv_htif.c to riscv_htif.h
>
> Weiwei Li (1):
>   hw/riscv: Add signature dump function for spike to run ACT tests

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  hw/char/riscv_htif.c         | 44 +++++++++++++++++++++++++++++++++++-
>  hw/riscv/spike.c             | 13 +++++++++++
>  include/hw/char/riscv_htif.h |  3 +++
>  3 files changed, 59 insertions(+), 1 deletion(-)
>
> --
> 2.25.1
>
>

