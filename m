Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oLKY0-0005aF-3p
	for mharc-qemu-riscv@gnu.org; Tue, 09 Aug 2022 04:25:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robh@kernel.org>)
 id 1oLBtw-00032w-Mq; Mon, 08 Aug 2022 19:11:12 -0400
Received: from dfw.source.kernel.org ([139.178.84.217]:45190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robh@kernel.org>)
 id 1oLBtu-00066F-Bb; Mon, 08 Aug 2022 19:11:12 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6C14A60FEA;
 Mon,  8 Aug 2022 23:11:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFEE0C433D7;
 Mon,  8 Aug 2022 23:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660000266;
 bh=jHSuHCtp6RDvJVvP/NS479tQWR2ltG97ra6kLxQO21E=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=pdQD+ZMD28AZ/EvgVscNpomgIUJDtNl7b/2+R9PQvRJi7BIxGEKn6ShqiMqUjaRQN
 AnbxNlmAcVzH5bLd7lURPD9Z1c0zu7OPK8Etf5J0oz+LXzx5bO09/EfeNHL/9f0cVP
 LJuv10nghovOYidRAoxH86tZQIYO8cRVPHFqCKG6em0kDfLJuBnnbzDAfiiuI+V3RF
 RQrNi+HHxFVd3cXhXBN7eW0njcGYrl0TOGwlU2fdTzUdSha7kvnGKIBk1qPrxEH35F
 0DAcbUlBZBGiSf9/IdKxbX1xMcT6bfedODOLKZ6k1Wb3Dh0tjCSE+NSMNJyrSoBIMn
 kNZ9bz1REDo6Q==
Received: by mail-vs1-f51.google.com with SMTP id s129so10313607vsb.11;
 Mon, 08 Aug 2022 16:11:06 -0700 (PDT)
X-Gm-Message-State: ACgBeo1qSKKnbct/PlL/nCs2r1n2WvW2MkHSot+chEpYQ298Zhq1pds1
 lCp7YyGmf8LXEe3UqkHI5LaPgPa9gSbMtunoEg==
X-Google-Smtp-Source: AA6agR47bM6PXZpdbPUPn1sGnCTqktT46MegrwfONsfHijrksV9DCm6sE3X3dlRmFEWMqFkZMMInWHQn3vKBNHFqLrA=
X-Received: by 2002:a67:a246:0:b0:388:7e82:1d80 with SMTP id
 t6-20020a67a246000000b003887e821d80mr7289670vsh.26.1660000265768; Mon, 08 Aug
 2022 16:11:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220808210643.2192602-1-mail@conchuod.ie>
 <20220808210643.2192602-4-mail@conchuod.ie>
 <4BA66590-3A82-4B5C-829B-67F8B5D5029D@jrtc27.com>
 <842525b8-2716-4d87-7024-070fe858da6f@microchip.com>
In-Reply-To: <842525b8-2716-4d87-7024-070fe858da6f@microchip.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 8 Aug 2022 17:10:54 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLa2xJN0oLaCzzE1fS-enRhv-XkLBsn_mHQ7kvXy6yWnQ@mail.gmail.com>
Message-ID: <CAL_JsqLa2xJN0oLaCzzE1fS-enRhv-XkLBsn_mHQ7kvXy6yWnQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] hw/riscv: virt: fix syscon subnode paths
To: Conor Dooley <Conor.Dooley@microchip.com>
Cc: Jessica Clarke <jrtc27@jrtc27.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org, 
 QEMU Developers <qemu-devel@nongnu.org>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=139.178.84.217; envelope-from=robh@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 09 Aug 2022 04:25:06 -0400
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
X-List-Received-Date: Mon, 08 Aug 2022 23:11:13 -0000

On Mon, Aug 8, 2022 at 4:10 PM <Conor.Dooley@microchip.com> wrote:
>
> On 08/08/2022 22:28, Jessica Clarke wrote:
> > On 8 Aug 2022, at 22:06, Conor Dooley <mail@conchuod.ie> wrote:
> >>
> >> From: Conor Dooley <conor.dooley@microchip.com>
> >>
> >> The subnodes of the syscon have been added to the incorrect paths.
> >> Rather than add them as subnodes, they were originally added to "/foo"
> >> and a later patch moved them to "/soc/foo". Both are incorrect & they
> >> should have been added as "/soc/test@###/foo" as "/soc/test" is the
> >> syscon node. Fix both the reboot and poweroff subnodes to avoid errors
> >> such as:
> >>
> >> /stuff/qemu/qemu.dtb: soc: poweroff: {'value': [[21845]], 'offset': [[=
0]], 'regmap': [[4]], 'compatible': ['syscon-poweroff']} should not be vali=
d under {'type': 'object'}
> >>        From schema: /home/conor/.local/lib/python3.9/site-packages/dts=
chema/schemas/simple-bus.yaml
> >> /stuff/qemu/qemu.dtb: soc: reboot: {'value': [[30583]], 'offset': [[0]=
], 'regmap': [[4]], 'compatible': ['syscon-reboot']} should not be valid un=
der {'type': 'object'}
> >>        From schema: /home/conor/.local/lib/python3.9/site-packages/dts=
chema/schemas/simple-bus.yaml
> >>
> >> Reported-by: Rob Herring <robh@kernel.org>
> >> Link: https://lore.kernel.org/linux-riscv/20220803170552.GA2250266-rob=
h@kernel.org/
> >> Fixes: 18df0b4695 ("hw/riscv: virt: Allow creating multiple NUMA socke=
ts")
> >> Fixes: 0e404da007 ("riscv/virt: Add syscon reboot and poweroff DT node=
s")
> >> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> >> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> >
> > This breaks FreeBSD=E2=80=99s driver (well, it just won=E2=80=99t probe=
/attach), which
> > is written to handle syscon-poweroff/reboot existing as a child of a
> > simplebus not a syscon.

It probably breaks Linux, too.

> I know next to nothing about FreeBSD unfortunately or how it handles
> buses. My understanding of simple-bus was that it is supposed to
> represent a bus with "things" mapped to addresses, relying on the "reg"
> property. And then syscon is used when there is some multifunction
> register region that controls multiple features of the hardware.
> Since simple-bus defines a reg property and the function nodes do not
> define one, I'd like to know how FreeBSD's driver handles that.
>
> > Moreover, what is the point of regmap in this
> > case? Its existence suggests the point is for them to *not* be children
> > of the syscon, otherwise you wouldn=E2=80=99t need an explicit phandle,=
 you=E2=80=99d
> > just look at the parent. Moving the nodes whilst keeping the property
> > doesn=E2=80=99t make sense to me.
>
> That's how syscon bindings are constructed, makes it easier to follow
> I suppose if they functions are children of the syscon node. Strictly
> I think they don't need to be under the syscon itself, I think they can
> also go at the top level - they just aren't valid under the /soc node
> as it has been defined as a "simple-bus".
>
> It would appear that the original patch 0e404da007 ("riscv/virt: Add
> syscon reboot and poweroff DT nodes") that added them put them at the
> top level and it was in the refactor that they got moved to the soc bus.*
> Maybe the solution would be to put them back at the top level?

Perhaps.

The other option is adding 'simple-mfd' to the 'test' node compatible.
That would work for Linux. Not sure for FreeBSD.

Rob

