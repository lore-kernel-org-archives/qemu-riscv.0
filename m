Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 819E9C35274
	for <qemu-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 03:16:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rF47A-0001o1-Eg; Sun, 17 Dec 2023 22:16:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rF479-0001nl-8z; Sun, 17 Dec 2023 22:16:19 -0500
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rF477-0007oK-Ba; Sun, 17 Dec 2023 22:16:19 -0500
Received: by mail-qv1-xf2b.google.com with SMTP id
 6a1803df08f44-67f0d22e4faso24488156d6.3; 
 Sun, 17 Dec 2023 19:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702869375; x=1703474175; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uLOxfdvV98AGgoylDzxJfs6BejVcZBSEmEuVpPVuFL8=;
 b=GcKh4DFlBnidYSnIOJdlTIKvIrpWlfdbgPzLyC4N7JIjOjIIydCHF0Tcn7FIif4phZ
 1AYmy6RsU6G6U3jd+2I/4PacbF63EmhSt9H0B+vrshjGlLi08PS+hhYh4U+WcwzJejmK
 rLsEIoZshtXt0ZHULu6jrOOqhkt1FN/GLbAaQ1gwuPM7WqqZO42XS2GZ3/t0KZkTVoXT
 ir3+GqpkwiJSh5ElkPGtx4IRBnhHJTpqtZc8w411I/S2i+5EiLwbzLx4DlXHa2IzAzw7
 xHziTCAycRAdKjLNvfeRiRiOLv/YHaql3reE6WzdFdBDus25EifJcHvs4YAF2HW+gK4h
 RpQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702869375; x=1703474175;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uLOxfdvV98AGgoylDzxJfs6BejVcZBSEmEuVpPVuFL8=;
 b=JFnQHawoRRKkaTRZjB5xmSw0BWLpLZyqYcSJ+fG9cfGgiTwJbYbUfA+euLEL/Py28a
 692/fXjQx4AgjT3l2W2bqHLTUjlJcWL3m/a2rj88ZeevPhqYtQoXkd2E+FWLbrXZzPCW
 k47Pj8Qbqb2UhhAwp7dchMVAnTnSU714Hysf9fYR/+1CmhTJErWLqBHAl5rPH4jACYPy
 KVopEgI0IGIjlaBoLODw3RDAbzjMWpefDIt07zlo34FEsn+1paqofUWXWIGSZeSZ7gfx
 Tk0VSnPl8yRPyNmuY2zB7wOjY+9we6jnmXsDtzrtFd29+VHQZYIK8u0dF7H6psrhI0Yf
 e4Cw==
X-Gm-Message-State: AOJu0Yy/ns8hindf7U2av3JQPGKlcNp5/kHuOjR48QNZu2WQ8WEs2IlX
 jXdCKJ9oxKPMXhIvpx9h7Oi8bKvbU+s7bBcIe5g+siyXp6E=
X-Google-Smtp-Source: AGHT+IGraYof6UMmtTnHMNEWKCpzqLRoPOPk9c8Hr7yDIyCZgb1ziWpoCKxuzzp9sWXf35PlnoPzDjudrdeJlfL5LxI=
X-Received: by 2002:a05:620a:2989:b0:77e:fba3:a235 with SMTP id
 r9-20020a05620a298900b0077efba3a235mr20859192qkp.143.1702869375212; Sun, 17
 Dec 2023 19:16:15 -0800 (PST)
MIME-Version: 1.0
References: <20231030054834.39145-1-akihiko.odaki@daynix.com>
 <20231030054834.39145-2-akihiko.odaki@daynix.com>
 <CAKmqyKMo41GMJ0vVN2_CsfOVrfsz8H9AtxTe6-JbtX+Pi6B3DA@mail.gmail.com>
 <fcf3a810-7492-4f60-9126-63713d6a30bd@daynix.com>
 <CAKmqyKOvwZ71+pGz-HSvE29U9a2dbYVPLR0Li2ak5ji+_Ez4-A@mail.gmail.com>
 <946c24af-042c-43e5-8092-4488a32e549d@daynix.com>
In-Reply-To: <946c24af-042c-43e5-8092-4488a32e549d@daynix.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 18 Dec 2023 13:15:49 +1000
Message-ID: <CAKmqyKOOKKBh4gtRFQ6Uwyv9=XSQ=Gek__=LwHykaTrG9yrX=A@mail.gmail.com>
Subject: Re: [PATCH v6 1/5] hw/riscv: Use misa_mxl instead of misa_mxl_max
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Mikhail Tyutin <m.tyutin@yadro.com>, Aleksandr Anenkov <a.anenkov@yadro.com>,
 qemu-devel@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Fabiano Rosas <farosas@suse.de>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2b;
 envelope-from=alistair23@gmail.com; helo=mail-qv1-xf2b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Fri, Dec 15, 2023 at 4:34=E2=80=AFPM Akihiko Odaki <akihiko.odaki@daynix=
.com> wrote:
>
> On 2023/12/15 14:34, Alistair Francis wrote:
> > On Thu, Nov 23, 2023 at 5:24=E2=80=AFPM Akihiko Odaki <akihiko.odaki@da=
ynix.com> wrote:
> >>
> >> On 2023/11/23 12:04, Alistair Francis wrote:
> >>> On Mon, Oct 30, 2023 at 3:50=E2=80=AFPM Akihiko Odaki <akihiko.odaki@=
daynix.com> wrote:
> >>>>
> >>>> The effective MXL value matters when booting.
> >>>
> >>> This doesn't sound right. Surely the max is what matters here
> >>>
> >>> Also, this was specifically changed to misa_mxl_max in db23e5d981a
> >>> "target/riscv: Replace riscv_cpu_is_32bit with riscv_cpu_mxl".
> >>>
> >>> This needs a much better description of why this change should be mad=
e
> >>   >
> >>   > Alistair
> >>
> >> The kernel will be executed with the current MXL rather than the initi=
al
> >> MXL value so the current MXL should be used here.
> >>
> >> For example, if you are going to emulate a system that has a RV64 CPU
> >> and a firmware that sets the MXL to RV32, then mxl_max should be
> >> MXL_RV64 and mxl should be MXL_RV32, and the kernel should be assumed =
as
> >> a RV32 binary. Loading a 64-bit kernel will not work in such a case.
> >
> > But this is called before the firmware runs, so it won't be changed by =
firmware.
>
> It's more like QEMU emulates the firmware. It's the responsibility of
> the firmware to load kernels for the real hardware, but QEMU does it
> instead.
>
> The firmware can change the MXL to load a 32-bit kernel on a 64-bit
> system so if QEMU happens to emulate such a behavior, mxl should be used
> when loading the kernel instead of mxl_max. QEMU currently does not
> implement such a feature, but in such a case mxl =3D=3D mxl_max so it doe=
s
> not hurt to use mxl.
>
> >
> > Maybe it's worth putting what this fixes in the commit message?
>
> What about:
>
> A later commit requires one extra step to retrieve mxl_max. As mxl is
> semantically more correct and does not need such a extra step, refer to
> mxl instead.
>
> Currently mxl always equals to mxl_max so it does not matter which of
> mxl or mxl_max to refer to. However, it is possible to have different
> values for mxl and mxl_max if QEMU gains a new feature to load a RV32
> kernel on a RV64 system, for example. For such a behavior, the real
> system will need the firmware to switch MXL to RV32, and if QEMU
> implements the same behavior, mxl will represent the MXL that
> corresponds to the kernel being loaded. Therefore, it is more
> appropriate to refer to mxl instead of mxl_max when mxl !=3D mxl_max.

Great! That explains it really well. Can you include that in the
commit message in the next revision

Alistair

>
> Regards,
> Akihiko Odaki

