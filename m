Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1641C7EE2E
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 10:05:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q8eQF-0007fN-Ll; Mon, 12 Jun 2023 06:05:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1q8eQA-0007ev-1E
 for qemu-riscv@nongnu.org; Mon, 12 Jun 2023 06:05:10 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1q8eQ8-00075U-73
 for qemu-riscv@nongnu.org; Mon, 12 Jun 2023 06:05:09 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-30e3caa6aa7so4075153f8f.1
 for <qemu-riscv@nongnu.org>; Mon, 12 Jun 2023 03:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull.eu; s=google; t=1686564306; x=1689156306;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0/OuYJ97zTgB7Z5ufUPWOSiKN+l/JdwBvKdEpZInCKs=;
 b=UVu9qrEkP0A+nAftSdv5LQtVa/8enjhz8WE5W88xUbVZMBYACj+ET4ybirfzhhn88P
 x7Z+5fygBWpq0TQ/yhNUX10iVeK6JMOcVuzDcurQPiaPIdHYMQDcl4HkJeRqbvT8SVdV
 MEHtkC3k8SkrB6AyyVWnN5AgLCvW+KkdZlTYMwW38pLhHbLxOLp0ACf7hI70eckhKgQ1
 hdVKOPUz5qr3kVwMhngXP998WAo3BYCEJIXYLjNgJRjWaV9yS6Vjwdt19o43FqoVdguF
 mXe0MbbzxOXkszecj8hakBTtv8IAjQ2BE2uxwUsji/KcL3RxZl5BwAbbcuURENzE3+l6
 UIGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686564306; x=1689156306;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0/OuYJ97zTgB7Z5ufUPWOSiKN+l/JdwBvKdEpZInCKs=;
 b=AD3neXcms1K52DBsz/d7u+6M1vScYHtulH//qVaGWsmJILQDw2ul2pFaba4zuyk8Bg
 0vzxfhGkV1h+Qij5P7mRul6WZHTfJUUacUImppHT6CnQOhVc64dVfzeOMgLH77GxloW0
 HAdkKWBPFssD91ktN1jo4uLsZFGVtyc5/kIafi/YHnHMBwWXSnuu8gAP+wDEX03Xiv18
 SwD5DTpFHIhx1SSmy1CxjJ3B1CBVQ1NAab7T+BX3hq43PSq1UtGxCSIzlARMlO+7ODGt
 gV3nIxEur/QRtdEamgpE2rllQCkc0VrMYkGDOPJqJEpCdpl6cm7sLk1nd+ztBVIWA8bK
 H9+A==
X-Gm-Message-State: AC+VfDwR6W6MiHtYE9G3BZKgqYZZeHfOz08FcX2vU/Ud0Hbzz0iCNJhe
 r1jXmECwK/9fVBzeIY3YTp0wCGEAuzDNoCYWNlLbMw==
X-Google-Smtp-Source: ACHHUZ5XVx5dIJuMLlxnHJM+m/WshVR80BWolyelcZQhUMj1J27hm9zkqUouhQIyjxeX1RkbIKUSbGUzZfQp2c2XGYw=
X-Received: by 2002:a5d:6a4c:0:b0:30f:bd48:682c with SMTP id
 t12-20020a5d6a4c000000b0030fbd48682cmr2430989wrw.12.1686564306096; Mon, 12
 Jun 2023 03:05:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230530131843.1186637-1-christoph.muellner@vrull.eu>
 <20230530131843.1186637-7-christoph.muellner@vrull.eu>
 <29c57d6a-247c-ef4c-da4c-f3021bb0ea54@gmail.com>
 <CAEg0e7iShmcrvqXJkfy+wv+v4e2y=S4go52aTs8cZ_+Lb6rvwg@mail.gmail.com>
 <18954fce-c08d-66f0-fe32-b6bdd4ac1892@gmail.com>
In-Reply-To: <18954fce-c08d-66f0-fe32-b6bdd4ac1892@gmail.com>
From: =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>
Date: Mon, 12 Jun 2023 12:04:52 +0200
Message-ID: <CAEg0e7iAjgRPGxOKEA9BmfZ5M8tc_CzyU4jogwM8d9LSMob0mg@mail.gmail.com>
Subject: Re: [PATCH 6/9] target/riscv/cpu: Share RISCVCPUConfig with
 disassembler
To: LIU Zhiwei <baxiantai@gmail.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>, 
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Mon, Jun 12, 2023 at 12:01=E2=80=AFPM LIU Zhiwei <baxiantai@gmail.com> w=
rote:
>
>
> On 2023/6/12 17:47, Christoph M=C3=BCllner wrote:
> > On Mon, Jun 12, 2023 at 8:25=E2=80=AFAM LIU Zhiwei <baxiantai@gmail.com=
> wrote:
> >>
> >> On 2023/5/30 21:18, Christoph Muellner wrote:
> >>> From: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>
> >>>
> >>> The disassembler needs the available extensions in order
> >>> to properly decode instructions in case of overlapping
> >>> encodings (e.g. for vendor extensions).
> >>>
> >>> Let's use the field 'disassemble_info::private_data' to store
> >>> our RISCVCPUConfig pointer.
> >>>
> >>> Signed-off-by: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>
> >>> ---
> >>>    target/riscv/cpu.c | 3 +++
> >>>    1 file changed, 3 insertions(+)
> >>>
> >>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> >>> index 5b7818dbd1..6f0cd9a0bb 100644
> >>> --- a/target/riscv/cpu.c
> >>> +++ b/target/riscv/cpu.c
> >>> @@ -819,6 +819,9 @@ static void riscv_cpu_disas_set_info(CPUState *s,=
 disassemble_info *info)
> >>>    {
> >>>        RISCVCPU *cpu =3D RISCV_CPU(s);
> >>>        CPURISCVState *env =3D &cpu->env;
> >>> +    RISCVCPUConfig *cfg =3D &cpu->cfg;
> >>> +
> >>> +    info->private_data =3D cfg;
> >> I don't know if this field will be overridden by the binutils. Can we
> >> extend the struct disassemble_info, and add some fields like supportin=
g
> >> for Capstone?
> >
> > Initially I wanted to add a new field, but then I noticed that the fiel=
d
> > 'disassemble_info::private_data' is used for a similar purpose by
> > disas/cris.c, disas/m68k.c, and dias/xtensa.c.
> > So I decided to not add yet another field, which only serves one archit=
ecture.
> I think you can CC these arch maintainers to see if it need some
> specially process before using the private_data.
> >
> > But if that's the preferred way, then I can change.
>
> I prefer this way, but not insist on  if it really works using the
> private_data.

This topic is already resolved by using the field 'info->target_info'.
So I dropped this patch anyway.

BR
Christoph

>
> Zhiwei
>
> >
> > Thanks
> > Christoph
> >
> >> Zhiwei
> >>
> >>>        switch (env->xl) {
> >>>        case MXL_RV32:

