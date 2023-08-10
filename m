Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D41B1C001B0
	for <qemu-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 17:22:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qU9Mg-0002BS-Uf; Thu, 10 Aug 2023 13:22:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1qU9Mg-0002AT-10
 for qemu-riscv@nongnu.org; Thu, 10 Aug 2023 13:22:26 -0400
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1qU9Md-0000WO-Ba
 for qemu-riscv@nongnu.org; Thu, 10 Aug 2023 13:22:25 -0400
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2b9b904bb04so18760651fa.1
 for <qemu-riscv@nongnu.org>; Thu, 10 Aug 2023 10:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1691688140; x=1692292940;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PSeeQm5hOzYG69om09iFvOi2iheMqgd5hVC2Tb48j8M=;
 b=Rn++KWw/2v8bCYOj+d5GaIxOa654vxC02y6scbEUXXmjp06x/eqcDA2i2SHRiQe7qC
 AvhaUsKpCLjSb0ViWNwGzDrBluE1fubG/iMvSV1vDjSwtRJJGsGH1gALFmkoqA6EcLng
 fWWytnIoWeIHfelA/Ns9FLe9ocB0m3wS4pmqftgmvPzcB2pzhc7zNvLko5xVkRE6dXNu
 uZc+oC4EEljfsf9W9COv+R1EvoRskHUxe+f81E/DRRlff/Jq9/TmpTWlKEvKgp/jw44t
 ZwZjNW0qM2VGFG9cEoaAYQ+txq7tCIb7GfVeKESl9+tXml4Gt3yYhfnTaH82gRtmGEUm
 Hteg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691688140; x=1692292940;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PSeeQm5hOzYG69om09iFvOi2iheMqgd5hVC2Tb48j8M=;
 b=YvWCyLPeED83cCmsjyEK9HyBkk7MYedG7LmTlkfr6D2B/ExZ2UwqiL2t/ezRynqsvB
 aVYzcxNdGfgPB+iM25YDEFNsFe/gTjWE9nGCXYvRa/g7IgPPLDZchmPmfjelKcKtlkz4
 k8uMJ3kh2VRvcfB1siMhPHDWGUFbjFiwfXV13M6UWA6g/iKFWYnHZland4ai0ntinGMq
 vVTdUy43yiqwUAsSTQV7WjXANUzX67GVuXwHRrmGibwY1d7o1qxFBTx6Vxcb0DZYQGhf
 mVLzBvu/W/D7kKEDkEkcSSvi8FwA/XK0PBVEbNPDKrU/lnzMbUHmKOfFSZEwK8XnBunU
 9/kQ==
X-Gm-Message-State: AOJu0Yz9AeH1deD7I4IE4LNsnU9TR7OiPbNBswtysOLlxtqivUgdqCNP
 RX0fbrli6xBIlbTON8AjFGj1t2I84VLT+pt9yafsnQ==
X-Google-Smtp-Source: AGHT+IFkoqKWA4x35pzdTpBFe50CsT3ajT7byepwHWE82FJ/0lv4AOhigxcwPAX7v9qrKdhBIYXrTlA/D5fO8USnSEQ=
X-Received: by 2002:a2e:3817:0:b0:2b6:a827:164f with SMTP id
 f23-20020a2e3817000000b002b6a827164fmr2400012lja.10.1691688140153; Thu, 10
 Aug 2023 10:22:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230809102257.25121-1-jason.chien@sifive.com>
 <20230809172413-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230809172413-mutt-send-email-mst@kernel.org>
From: Jason Chien <jason.chien@sifive.com>
Date: Fri, 11 Aug 2023 01:22:08 +0800
Message-ID: <CADr__8ohzCfEYkXz+6u06hDQZNM8q9Cp9eehtcBFhdKtnySPBA@mail.gmail.com>
Subject: Re: [PATCH] hw/pci-host: Allow extended config space access for
 Designware PCIe host
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000aa4ef6060294d628"
Received-SPF: pass client-ip=2a00:1450:4864:20::22d;
 envelope-from=jason.chien@sifive.com; helo=mail-lj1-x22d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

--000000000000aa4ef6060294d628
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

As far as I know, the order issue is caused by nested device realization.
In this case, realizing TYPE_DESIGNWARE_PCIE_HOST will also
realize TYPE_DESIGNWARE_PCIE_ROOT(see designware_pcie_host_realize()).
device_set_realized() is the function that realizing a device must go
through, and this function first realizes the device by dc->realize() and
then realizes the device's child bus by qbus_realize(). Whether there is
any child bus of the device may depend on dc->realize(). The realization
flow will be like a recursive call to device_set_realized(). More
precisely, the flow in this case is: qdev_realize() --> ... --> FIRST
device_set_realized() --> FIRST dc->realize() --> ...
--> designware_pcie_host_realize() --> qdev_realize() --> ... --> SECOND
device_set_realized() --> SECOND dc->realize() --> ...
--> designware_pcie_root_realize() --> ...--> back to the SECOND
device_set_realized() --> SECOND qbus_realize() the CHILD bus "dw-pcie" -->
... --> back to the FIRST device_set_realized() --> FIRST qbus_realize()
the PARENT bus "pcie".

I also found this patch
<https://lists.gnu.org/archive/html/qemu-devel/2021-11/msg02162.html> that
solves the same bus issue.

Do you have any suggestions on the order of realization? Thanks!

On Thu, Aug 10, 2023 at 5:24=E2=80=AFAM Michael S. Tsirkin <mst@redhat.com>=
 wrote:

> On Wed, Aug 09, 2023 at 10:22:50AM +0000, Jason Chien wrote:
> > In pcie_bus_realize(), a root bus is realized as a PCIe bus and a
> non-root
> > bus is realized as a PCIe bus if its parent bus is a PCIe bus. However,
> > the child bus "dw-pcie" is realized before the parent bus "pcie" which =
is
> > the root PCIe bus. Thus, the extended configuration space is not
> accessible
> > on "dw-pcie". The issue can be resolved by adding the
> > PCI_BUS_EXTENDED_CONFIG_SPACE flag to "pcie" before "dw-pcie" is
> realized.
> >
> > Signed-off-by: Jason Chien <jason.chien@sifive.com>
>
> I think we should fix the order of initialization rather than
> hack around it.
>
> > ---
> >  hw/pci-host/designware.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/hw/pci-host/designware.c b/hw/pci-host/designware.c
> > index 9e183caa48..388d252ee2 100644
> > --- a/hw/pci-host/designware.c
> > +++ b/hw/pci-host/designware.c
> > @@ -694,6 +694,7 @@ static void designware_pcie_host_realize(DeviceStat=
e
> *dev, Error **errp)
> >                                       &s->pci.io,
> >                                       0, 4,
> >                                       TYPE_PCIE_BUS);
> > +    pci->bus->flags |=3D PCI_BUS_EXTENDED_CONFIG_SPACE;
> >
> >      memory_region_init(&s->pci.address_space_root,
> >                         OBJECT(s),
> > --
> > 2.17.1
>
>

--000000000000aa4ef6060294d628
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">As far as I know, the order issue is caused by nested devi=
ce realization. In this case, realizing=C2=A0TYPE_DESIGNWARE_PCIE_HOST will=
 also realize=C2=A0TYPE_DESIGNWARE_PCIE_ROOT(see designware_pcie_host_reali=
ze()). device_set_realized() is the function that realizing a device must g=
o through, and this function first realizes the device by dc-&gt;realize() =
and then realizes the device&#39;s child bus by qbus_realize(). Whether the=
re is any child bus of the device may depend=C2=A0on dc-&gt;realize(). The =
realization flow will be like a recursive call to=C2=A0device_set_realized(=
). More precisely, the flow in this case is: qdev_realize() --&gt; ... --&g=
t; FIRST device_set_realized() --&gt; FIRST dc-&gt;realize() --&gt; ... --&=
gt;=C2=A0designware_pcie_host_realize() --&gt;=C2=A0qdev_realize() --&gt; .=
.. --&gt; SECOND device_set_realized() --&gt; SECOND dc-&gt;realize() --&gt=
; ... --&gt;=C2=A0designware_pcie_root_realize() --&gt; ...--&gt; back to t=
he SECOND device_set_realized() --&gt; SECOND qbus_realize() the CHILD bus =
&quot;dw-pcie&quot; --&gt; ... --&gt; back to the FIRST device_set_realized=
() --&gt;=C2=A0FIRST qbus_realize() the PARENT bus &quot;pcie&quot;.<br><br=
>I also found this <a href=3D"https://lists.gnu.org/archive/html/qemu-devel=
/2021-11/msg02162.html">patch</a>=C2=A0that solves the same bus issue.<br><=
br>Do you have any suggestions on the order of realization? Thanks!</div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, =
Aug 10, 2023 at 5:24=E2=80=AFAM Michael S. Tsirkin &lt;<a href=3D"mailto:ms=
t@redhat.com">mst@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">On Wed, Aug 09, 2023 at 10:22:50AM +0000, Jason=
 Chien wrote:<br>
&gt; In pcie_bus_realize(), a root bus is realized as a PCIe bus and a non-=
root<br>
&gt; bus is realized as a PCIe bus if its parent bus is a PCIe bus. However=
,<br>
&gt; the child bus &quot;dw-pcie&quot; is realized before the parent bus &q=
uot;pcie&quot; which is<br>
&gt; the root PCIe bus. Thus, the extended configuration space is not acces=
sible<br>
&gt; on &quot;dw-pcie&quot;. The issue can be resolved by adding the<br>
&gt; PCI_BUS_EXTENDED_CONFIG_SPACE flag to &quot;pcie&quot; before &quot;dw=
-pcie&quot; is realized.<br>
&gt; <br>
&gt; Signed-off-by: Jason Chien &lt;<a href=3D"mailto:jason.chien@sifive.co=
m" target=3D"_blank">jason.chien@sifive.com</a>&gt;<br>
<br>
I think we should fix the order of initialization rather than<br>
hack around it.<br>
<br>
&gt; ---<br>
&gt;=C2=A0 hw/pci-host/designware.c | 1 +<br>
&gt;=C2=A0 1 file changed, 1 insertion(+)<br>
&gt; <br>
&gt; diff --git a/hw/pci-host/designware.c b/hw/pci-host/designware.c<br>
&gt; index 9e183caa48..388d252ee2 100644<br>
&gt; --- a/hw/pci-host/designware.c<br>
&gt; +++ b/hw/pci-host/designware.c<br>
&gt; @@ -694,6 +694,7 @@ static void designware_pcie_host_realize(DeviceSta=
te *dev, Error **errp)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;s=
-&gt;<a href=3D"http://pci.io" rel=3D"noreferrer" target=3D"_blank">pci.io<=
/a>,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00, 4,<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_P=
CIE_BUS);<br>
&gt; +=C2=A0 =C2=A0 pci-&gt;bus-&gt;flags |=3D PCI_BUS_EXTENDED_CONFIG_SPAC=
E;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 memory_region_init(&amp;s-&gt;pci.address_space_ro=
ot,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0OBJECT(s),<br>
&gt; -- <br>
&gt; 2.17.1<br>
<br>
</blockquote></div>

--000000000000aa4ef6060294d628--

