Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BDFCCDB474
	for <qemu-riscv@archiver.kernel.org>; Mon, 16 Oct 2023 04:07:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qsEtA-0006Fc-KI; Mon, 16 Oct 2023 00:07:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qsEt9-0006FN-FH; Mon, 16 Oct 2023 00:07:31 -0400
Received: from mail-ua1-x934.google.com ([2607:f8b0:4864:20::934])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qsEt7-0000RY-RC; Mon, 16 Oct 2023 00:07:31 -0400
Received: by mail-ua1-x934.google.com with SMTP id
 a1e0cc1a2514c-7ae1a075fc5so1654213241.3; 
 Sun, 15 Oct 2023 21:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697429248; x=1698034048; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=upMGy8JxWhHSSAFL+5BzrgByGgKwKmVLLUbrPzfjgjU=;
 b=U7mzhubbbnhYy+hD/ndLMBtK8kA4NaHmJQeunc0no8FgjqBG6A5MHpfBn9m6oDMkf5
 y/IBjjK14bVFugosUHy6wXVP+0KShnNWbtf+326NvAoTkmKUk++uv633Sn410KWUVjtS
 k5RkAHgHta0mVxP08llrC/AlFcmWeGSbd5Vykd+Ea5HPvpBg696mXEh7nTH/AY0X0DB3
 I/JkKgCzvoidcjLPbSHKEavNoraBxWUvFQs/BczmYns9UgfYuz28V9G8A9I3939A7SEp
 wpw4QplBsm0Tb5ylmTfj3vqpsly+B1JBqAnCflUzYo0FdfZDRpDcvstjBm3pgIuaf0gN
 a0bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697429248; x=1698034048;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=upMGy8JxWhHSSAFL+5BzrgByGgKwKmVLLUbrPzfjgjU=;
 b=ghRdkg0Bb/200nceEH2wFoGV4rsZcS+fAhZ91XeX+Uto3qbcPiV0qikzkFvy/Shu3S
 888nS/dVOjyA13ddykxIDPE5JLVu+1sq5SpB2+1NTbxIxPjOdVEhAG5C4BR/eatDq/hg
 KeoCliZYgR9edbd1M/vY+Yvky1uvIOojGFZpxEl3B2yW8xNlOjtriYey+6EibdfUFhtw
 ugnSpFjUIwNKhpoEIBJg7int03faxM3UMptl5+nLWWVx0+9e9gc4q1vPwEu4hGhd/zTk
 5RLJG1dXlOAEX1rYLbHAMWciMVpVYlNl7Zh40+bVTw5bBUq+/kCHyzfa2mEzXtxF+L2V
 z1Cg==
X-Gm-Message-State: AOJu0YzylBc5+AcgYZUT/73kQouYhSKxCdggzR2kIPz7KKwRRHvLTsXX
 xNf+VfoejoEk7WPuV7FaGN7xjpSIZv85ElZktBwiR17V5pY=
X-Google-Smtp-Source: AGHT+IEWWq99i3LK9JLaYD68yKOrGeQ2ci5MzhB3MRbObgIEqom5lCmVUPGYIheAIzpuOdi20oCm+yJmQuZBLTPmlgw=
X-Received: by 2002:a67:fe87:0:b0:452:da3d:e130 with SMTP id
 b7-20020a67fe87000000b00452da3de130mr25386878vsr.18.1697429248469; Sun, 15
 Oct 2023 21:07:28 -0700 (PDT)
MIME-Version: 1.0
References: <20231014033545.15220-1-akihiko.odaki@daynix.com>
 <20231014033545.15220-2-akihiko.odaki@daynix.com>
 <597bf4be-207b-400a-be49-bc18900809a0@ventanamicro.com>
 <CAKmqyKPqk1sURLQNBoH0MeSJVSut72XiN4H0uT=95S953o7Taw@mail.gmail.com>
 <5670669b-cdfa-4b8f-b02b-b009e7c16540@daynix.com>
In-Reply-To: <5670669b-cdfa-4b8f-b02b-b009e7c16540@daynix.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 16 Oct 2023 14:07:01 +1000
Message-ID: <CAKmqyKOuupgZV0=eS37mnwnGxiq=c90HFkC7T5MoZDfKAo9VzQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] target/riscv: Do not allow MXL_RV32 for
 TARGET_RISCV64
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Mikhail Tyutin <m.tyutin@yadro.com>, Aleksandr Anenkov <a.anenkov@yadro.com>,
 qemu-devel@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::934;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x934.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Mon, Oct 16, 2023 at 1:22=E2=80=AFPM Akihiko Odaki <akihiko.odaki@daynix=
.com> wrote:
>
>
>
> On 2023/10/16 10:51, Alistair Francis wrote:
> > On Sun, Oct 15, 2023 at 4:05=E2=80=AFAM Daniel Henrique Barboza
> > <dbarboza@ventanamicro.com> wrote:
> >>
> >>
> >>
> >> On 10/14/23 00:35, Akihiko Odaki wrote:
> >>> TARGET_RISCV64 does not have riscv-32bit-cpu.xml so it shouldn't acce=
pt
> >>> MXL_RV32.
> >>>
> >>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> >>> ---
> >>
> >> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> >>
> >>
> >>>    target/riscv/tcg/tcg-cpu.c | 3 ++-
> >>>    1 file changed, 2 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> >>> index a28918ab30..e0cbc56320 100644
> >>> --- a/target/riscv/tcg/tcg-cpu.c
> >>> +++ b/target/riscv/tcg/tcg-cpu.c
> >>> @@ -161,10 +161,11 @@ static void riscv_cpu_validate_misa_mxl(RISCVCP=
U *cpu, Error **errp)
> >>>        case MXL_RV128:
> >>>            cc->gdb_core_xml_file =3D "riscv-64bit-cpu.xml";
> >>>            break;
> >>> -#endif
> >>> +#elif defined(TARGET_RISCV32)
> >>>        case MXL_RV32:
> >>>            cc->gdb_core_xml_file =3D "riscv-32bit-cpu.xml";
> >>>            break;
> >>> +#endif
> >
> > This isn't the right fix. The idea is that riscv64-softmmu can run
> > 32-bit CPUs, so we instead should include riscv-32bit-cpu.xml
>
> In that case I can continue working on the previous version of this
> series, but is it really true? I see no 32-bit CPUs enabled for
> riscv64-softmmu. Is there a plan to enable them for riscv64-softmmu?

Yeah....

So last time I tried the 32-bit CPUs didn't work correctly. I didn't
figure out what the issue was, but the *idea* is to eventually enable
32-bit CPUs in the 64-bit builds.

Alistair

