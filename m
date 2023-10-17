Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21785CDB474
	for <qemu-riscv@archiver.kernel.org>; Tue, 17 Oct 2023 03:57:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qsbBs-0001HW-PU; Mon, 16 Oct 2023 23:56:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qsbBq-0001GM-AP; Mon, 16 Oct 2023 23:56:18 -0400
Received: from mail-vk1-xa33.google.com ([2607:f8b0:4864:20::a33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qsbBo-0000cl-Js; Mon, 16 Oct 2023 23:56:18 -0400
Received: by mail-vk1-xa33.google.com with SMTP id
 71dfb90a1353d-49d9ef118a5so2332024e0c.1; 
 Mon, 16 Oct 2023 20:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697514974; x=1698119774; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8icchJzlSWKAfS5JolN6gMdmcrnmh65VzghGD7qByyI=;
 b=I2iYH28OucUplaEDyOvcVs+85DH7x8mC2wZHFmtM3sSJTyUOsri+mqsLQ0eYZ7b5Eb
 3K/JNUdruE3ZSQv0g8D5LGYmASslz7Xx1QJ7fQaqQiXGkslUTtgawZzvPs1owVyEpju+
 EK+tJGlBqjHJvvs+V1f9hm/APILgcOce5i30hpXzKzVIUZzASCcKeuwIdaBbkMkPOTtw
 Vxl0pTefwo7aVl++TKFQaQ01zPDkIIjRYodQdDbvALaRG+GpzAsJ+HGyjsrTVXobTF4M
 fyBPTOha72o0p2bhQc+adGF0pvC5BsU8SVgd5THrcoZQ9DRTxU/fzCLMrTYnCMXpFxSY
 LOZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697514974; x=1698119774;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8icchJzlSWKAfS5JolN6gMdmcrnmh65VzghGD7qByyI=;
 b=GSzU/oFMfx4Ol8arbyxP6pM2ieQBmdzHwoDVFnYWD2G3MRMOfTs/rfqeF6ACpFLrlu
 lTPHu+dmZ8NYdKvDekibKwctc4kFc7BdX8gb9YmtV9f/aGCE8PRO/Q2jrGBLd6AoCkr4
 fioz/lepBFWZHl73PbCsC5iR0OaQjwzxED0tViemrqpKw0Lh7J+djopoS5D6RYKXgoDK
 fmmNNKVANRNHQayxn2UvwtKnNlEf4ONbhw2hnXvKO8BL0V31UHDuKITIBMhCG9KfdJJ8
 f7LfVni5CS9iOwwmBEwSvpgqyIHV3Y4Oj8lOAL/twNWBlY0/cLUwsxd/5dxszFdnCFgy
 8Ozw==
X-Gm-Message-State: AOJu0YyxTimE0uXlJw8wcRcI1R4dOffV4A3AYtMsLhJKF3EI+WzivS/b
 K6nKnVTwnPPoV47EdCmRli3zmSDdZRqIGXuqTAmRnj1anOVxjQ==
X-Google-Smtp-Source: AGHT+IFpG51nM3OLIacrdzlLe21DEGJQfIfJBytcOERAzI7pMfLLTPC/4JJ8hjrwURDgXpLnEL5J5uiT81z7uglby5w=
X-Received: by 2002:a05:6122:90d:b0:493:7df9:bcc4 with SMTP id
 j13-20020a056122090d00b004937df9bcc4mr1450426vka.4.1697514974383; Mon, 16 Oct
 2023 20:56:14 -0700 (PDT)
MIME-Version: 1.0
References: <20231006132134.1135297-1-dbarboza@ventanamicro.com>
 <CAKmqyKP=4kGpO=8D13iJw7pJSkD9CFary_DHt236+e1GFMAngA@mail.gmail.com>
 <a89189d3-2975-487e-9d2e-bd8ea60feba5@ventanamicro.com>
 <20231016-cf26d23a1fe53ee3b5b68513@orel>
In-Reply-To: <20231016-cf26d23a1fe53ee3b5b68513@orel>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 17 Oct 2023 13:55:47 +1000
Message-ID: <CAKmqyKMg0VKRQ_kFLHJQCq19p-Yv4iJqJZF3XGZWxfuYPe3rbQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] riscv: RVA22U64 profile support
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, 
 alistair.francis@wdc.com, bmeng@tinylab.org, liweiwei@iscas.ac.cn, 
 zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a33;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa33.google.com
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

On Mon, Oct 16, 2023 at 7:03=E2=80=AFPM Andrew Jones <ajones@ventanamicro.c=
om> wrote:
>
> On Thu, Oct 12, 2023 at 04:07:50PM -0300, Daniel Henrique Barboza wrote:
> >
> >
> > On 10/11/23 00:01, Alistair Francis wrote:
> > > On Sat, Oct 7, 2023 at 12:23=E2=80=AFAM Daniel Henrique Barboza
> > > <dbarboza@ventanamicro.com> wrote:
> > > >
> > > > Hi,
> > > >
> > > > Several design changes were made in this version after the reviews =
and
> > > > feedback in the v1 [1]. The high-level summary is:
> > > >
> > > > - we'll no longer allow users to set profile flags for vendor CPUs.=
 If
> > > >    we're to adhere to the current policy of not allowing users to e=
nable
> > > >    extensions for vendor CPUs, the profile support would become a
> > > >    glorified way of checking if the vendor CPU happens to support a
> > > >    specific profile. If a future vendor CPU supports a profile the =
CPU
> > > >    can declare it manually in its cpu_init() function, the flag wil=
l
> > > >    still be set, but users can't change it;
> > > >
> > > > - disabling a profile will now disable all the mandatory extensions=
 from
> > > >    the CPU;
> > >
> > > What happens if you enable one profile and disable a different one?
> >
> > With this implementation as is the profiles will be evaluated by the or=
der they're
> > declared in riscv_cpu_profiles[]. Which isn't exactly ideal since we're=
 exchanging
> > a left-to-right ordering in the command line by an arbitrary order that=
 we happened
> > to set in the code.
> >
> > I can make some tweaks to make the profiles sensible to left-to-right o=
rder between
> > them, while keeping regular extension with higher priority. e.g.:
> >
> >
> > -cpu rv64,zicbom=3Dtrue,profileA=3Dfalse,profileB=3Dtrue,zicboz=3Dfalse
> > -cpu rv64,profileA=3Dfalse,zicbom=3Dtrue,zicboz=3Dfalse,profileB=3Dtrue
> > -cpu rv64,profileA=3Dfalse,profileB=3Dtrue,zicbom=3Dtrue,zicboz=3Dfalse
> >
> > These would all do the same thing: "keeping zicbom=3Dtrue and zicboz=3D=
false, disable profileA
> > and then enable profile B"
> >
> > Switching the profiles order would have a different result:
> >
> > -cpu rv64,profileB=3Dtrue,profileA=3Dfalse,zicbom=3Dtrue,zicboz=3Dfalse
> >
> > "keeping zicbom=3Dtrue and zicboz=3Dfalse, enable profile B and then di=
sable profile A"
> >
> >
> > I'm happy to hear any other alternative/ideas. We'll either deal with s=
ome left-to-right
> > ordering w.r.t profiles or deal with an internal profile commit orderin=
g. TBH I think
> > it's sensible to demand left-to-right command line ordering for profile=
s only.
>
> left-to-right ordering is how the rest of QEMU properties work and script=
s
> depend on it. For example, one can do -cpu $MODEL,$DEFAULT_PROPS,$MORE_PR=
OPS
> where $MORE_PROPS can not only add more props but also override default
> props (DEFAULT_PROPS=3D'foo=3Doff', MORE_PROPS=3D'foo=3Don' - foo will be=
 on).
> left-to-right also works with multiple -cpu parameters, i.e. -cpu
> $MODEL,$DEFAULT_PROPS -cpu $MODEL,$MY_PROPS will replace default props
> with my props.

That seems like the way to go then

>
> I don't think profiles should be treated special with regard to this. The=
y
> should behave the same as any property. If one does
> profileA=3Doff,profileB=3Don and there are overlapping extensions then a

But what does this mean? What intent is the user saying here?

For example if a user says:

    RVA22U64=3Doff,RVA24U64=3Don

They only want the extensions that were added in RVA24U64? What about
G and the standard extensions?

To me it just seems really strange to have more than 1 profile.
Profiles are there to help software and users have common platforms.
Why would a user want to mix-n-match them

Alistair

> sanity check in cpu-finalize should catch that and error out. Otherwise,
> why not. Profiles are just like big 'G' extensions and 'G' would behave
> the same way.
>
> Thanks,
> drew

