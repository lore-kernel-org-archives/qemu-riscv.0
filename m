Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oteWy-0004Gx-SR
	for mharc-qemu-riscv@gnu.org; Fri, 11 Nov 2022 19:37:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oteWu-0004GE-QP; Fri, 11 Nov 2022 19:37:52 -0500
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oteWt-0007mJ-0y; Fri, 11 Nov 2022 19:37:52 -0500
Received: by mail-qv1-xf34.google.com with SMTP id x15so4423276qvp.1;
 Fri, 11 Nov 2022 16:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=USg1Aag3wg9LFrigYRWoUppoxdh/+k904378jVDPTZ8=;
 b=c4YElFLxMqdH/kWHGZ+NyOM1sTETij5ZPo/9smzjA0IkjpKKp6ObJVdxPIymEy3dsw
 lTLda5MVPVZjTglkZhNrjhXPyQ4rRAb9SDi/eNQWq6A+wbb23Rw6+DLmc4WpkLRXIfCY
 TzJFYy+G+YHJ1HImyI3npB8pKw0mC16tP2qmnwKMlBbDoBMD/CGlDdTEzo06MAy0JQkx
 Wp0OxaC/6/tG0fx1BmT1+eiEy1vwATx0jrQKiNYZya1N/K4VqprALKtkNaZnwWcKJmFL
 vaMdvH+g0RYehpGz5fgVWZ3RoyNSwqK/UnZRvCi5xOVYPcoauhNV/TTg6L6CQP3XkL12
 9VWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=USg1Aag3wg9LFrigYRWoUppoxdh/+k904378jVDPTZ8=;
 b=5Y12iwil7oO3Jxm4AuDfyYYpaYgu8VlkhGNwqLOirrb/vl7E3SLFXja/nvFj/ibLF9
 D09Va+a7n/WDT2c6uztypvy8RZZNnVEuP/C3twbxBXld5J9H1l1vjBsXveOxJWB5CzGY
 d84WqSbqd+WHffsNGnyTsFTPpXLN0A6jFytIgEIowFnCW3G968Bjhx+KAcZqttVrsBOu
 NOa3V0ZrXpr6wgkKnqoXENaoluvChSFqKBvRwwOJ5UDiymlxf4BYGnRjYYyOAmu6kAOo
 j/UAmaTLAXi9MSImjtyy9KwVgpzrTo/KvFCLFrgD0V+pGNfeK1tsP3yrQCuyU+830L7h
 nasQ==
X-Gm-Message-State: ANoB5pkqz4wiYWkYgaujqEL+60OxY4QYuvEFjQbxKBr6yk0RD97enoPE
 yk9HLQdVhcXUP1qIxTXUTrPCEh1wFFZOteZF3TE=
X-Google-Smtp-Source: AA0mqf5XfDYAtYQdTNAiFAcamMJAzmmX0uRihKXGEfdCJJh0EWf1VCeOaELT7OO+4ClR21voInse449umQaw8yNwYA0=
X-Received: by 2002:a05:6214:2f13:b0:4b1:9317:fd3c with SMTP id
 od19-20020a0562142f1300b004b19317fd3cmr4151706qvb.114.1668213469553; Fri, 11
 Nov 2022 16:37:49 -0800 (PST)
MIME-Version: 1.0
References: <20221109190849.1556711-1-conor@kernel.org>
 <84b8985a-6fab-ff76-7058-f702203474c0@linaro.org>
 <Y27pKpA0jo67Ntlz@spud>
In-Reply-To: <Y27pKpA0jo67Ntlz@spud>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 12 Nov 2022 08:37:38 +0800
Message-ID: <CAEUhbmUoken26s8n95fn9jdVkCiz-vPrWzt6G-z7Q23AfZ3gWw@mail.gmail.com>
Subject: Re: [PATCH] hw/misc/pfsoc: add fabric clocks to ioscb
To: Conor Dooley <conor@kernel.org>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <alistair.francis@wdc.com>,
 qemu-riscv@nongnu.org, 
 qemu-devel@nongnu.org, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::f34;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Sat, 12 Nov 2022 00:37:53 -0000

Hi Conor,

On Sat, Nov 12, 2022 at 8:31 AM Conor Dooley <conor@kernel.org> wrote:
>
> On Thu, Nov 10, 2022 at 12:18:44AM +0100, Philippe Mathieu-Daud=C3=A9 wro=
te:
> > Hi Conor,
> >
> > On 9/11/22 20:08, Conor Dooley wrote:
> > > From: Conor Dooley <conor.dooley@microchip.com>
> > >
> > > @@ -168,6 +170,10 @@ static void mchp_pfsoc_ioscb_realize(DeviceState=
 *dev, Error **errp)
> > >                             "mchp.pfsoc.ioscb.cfg", IOSCB_SUBMOD_REG_=
SIZE);
> > >       memory_region_add_subregion(&s->container, IOSCB_CFG_BASE, &s->=
cfg);
> > > +    memory_region_init_io(&s->ccc, OBJECT(s), &mchp_pfsoc_dummy_ops,=
 s,
> > > +                          "mchp.pfsoc.ioscb.ccc", IOSCB_CCC_REG_SIZE=
);
> > > +    memory_region_add_subregion(&s->container, IOSCB_CCC_BASE, &s->c=
cc);
> >
> > Unrelated but using the TYPE_UNIMPLEMENTED_DEVICE would ease tracing al=
l
> > these block accesses, as the block name would appear before the
> > address/size. See for example aspeed_mmio_map_unimplemented();
>
> Certainly looks like a nice idea, and I gave it a go but kept running
> into issues due to my lack of understanding of QEMU :) I'm going to add
> this to my todo pile - while I have a v2 of this lined up, I'd rather
> not hold up adding the regions that prevent booting Linux etc as I
> fumble around trying to understand the hierarchy of devices required to
> set up something similar to your aspeed example.
>

Do you plan to bring QEMU support to the latest MSS_LINUX configuration [1]

Currently QEMU is supporting the MSS_BAREMETAL configuration. Do you
think it makes sense to support both?

[1] https://github.com/polarfire-soc/icicle-kit-reference-design

Regards,
Bin

