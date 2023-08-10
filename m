Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8F56C001DE
	for <qemu-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 17:46:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qU9k5-0000lm-Rt; Thu, 10 Aug 2023 13:46:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1qU9k3-0000kN-SB
 for qemu-riscv@nongnu.org; Thu, 10 Aug 2023 13:46:35 -0400
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1qU9k0-0005p6-WF
 for qemu-riscv@nongnu.org; Thu, 10 Aug 2023 13:46:35 -0400
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2b9fa64db41so18491841fa.1
 for <qemu-riscv@nongnu.org>; Thu, 10 Aug 2023 10:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1691689591; x=1692294391;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VkqxCtuC2URbYPpM1G53qKid4kFeBBRfoZGZKOvydnY=;
 b=YrztI+uMDQ/CLHBwzbnRyqB2kAOBe1PFiuOC+VADWx3H8fzyfV/nOQA4Q2grVEbyhV
 g601zEzuzMcelMZjI970l488LPyFQ5DTHr8b4wBuz2zKeiKq4G0TBs5CHQSaLBnA32ys
 2NQVr9uqbXsBklc1e5rvecSH85hnPsfj3LxnSkVWEojs3ydYJIUGOzfQDi3MpSehYRjr
 vHB6NZDze0vSkkOl/qYnKs6zu9PygQ52GcLtDEK19OmCf0vW23EzYWV6/P6SXE4gZbYU
 Vxkqe7h9Ffaazq3gBuTVeMIQj76lj51QzBwoJB4KL1v4aEqn+ZLdNq9K3XC35SAWHTQ3
 9IGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691689591; x=1692294391;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VkqxCtuC2URbYPpM1G53qKid4kFeBBRfoZGZKOvydnY=;
 b=iSBz37Mv7kanzwyh1eyaWtrUBr75yNyKhlrbfFwYkHiBWMp05XwuGokKavLjobxTcP
 LMW1K89RvktgYo+IKIAuuwkKGhUrYePGaktkdSxdSW89BVH5Yai9HioKTz7/mx8mmpdX
 aVi6FE/4USdgvrCyTCcY/5letBVwABz1W2VQU3XNmgs3DJJb0C4k9vue4xmsYi2AonVP
 11KGaIwNyqb6fZFeJxpvk6FmOlmTRlKjyG2gjtyNwuuYyE47hFNU1DLSvOBA2+Bu2mV3
 udDQinoll+CNd62j37xPezpBXZDgwvNgWNP859NZMxwiQgEsyvTwjlUTPTtCx2GuwJuk
 gJMQ==
X-Gm-Message-State: AOJu0YzzDeWjIMZblBVH5/+POF46zTrzgyRSZDEc2y2rCtpUDUrG+Epu
 Pk8agetVUHJKmOzYqU4gsNtPrxiIAxPAWXJhGa0ILg==
X-Google-Smtp-Source: AGHT+IFG9CSe/O0ZLGXkTJlpCXMZ2KCYGHatmiqfBYsBLmMLk1cBeyeuB2WPL/Ch6f2sZfRtpoWK9FUdOlpgm5TC7+4=
X-Received: by 2002:a2e:720d:0:b0:2b9:7513:3596 with SMTP id
 n13-20020a2e720d000000b002b975133596mr2691234ljc.5.1691689590617; Thu, 10 Aug
 2023 10:46:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230809102257.25121-1-jason.chien@sifive.com>
 <20230809172413-mutt-send-email-mst@kernel.org>
 <CADr__8ohzCfEYkXz+6u06hDQZNM8q9Cp9eehtcBFhdKtnySPBA@mail.gmail.com>
 <20230810134315-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230810134315-mutt-send-email-mst@kernel.org>
From: Jason Chien <jason.chien@sifive.com>
Date: Fri, 11 Aug 2023 01:46:19 +0800
Message-ID: <CADr__8rS7v1v=Nr-OtOkqBEpeK5eCYrym73=eT5JJgi4D6qiYA@mail.gmail.com>
Subject: Re: [PATCH] hw/pci-host: Allow extended config space access for
 Designware PCIe host
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000001e9bcc0602952d5a"
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=jason.chien@sifive.com; helo=mail-lj1-x229.google.com
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

--0000000000001e9bcc0602952d5a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

the patch
<https://lists.gnu.org/archive/html/qemu-devel/2021-11/msg02162.html> link:
https://lists.gnu.org/archive/html/qemu-devel/2021-11/msg02162.html

On Fri, Aug 11, 2023 at 1:44=E2=80=AFAM Michael S. Tsirkin <mst@redhat.com>=
 wrote:

> On Fri, Aug 11, 2023 at 01:22:08AM +0800, Jason Chien wrote:
> > As far as I know, the order issue is caused by nested device
> realization. In
> > this case, realizing TYPE_DESIGNWARE_PCIE_HOST will also
> > realize TYPE_DESIGNWARE_PCIE_ROOT(see designware_pcie_host_realize()).
> > device_set_realized() is the function that realizing a device must go
> through,
> > and this function first realizes the device by dc->realize() and then
> realizes
> > the device's child bus by qbus_realize(). Whether there is any child bu=
s
> of the
> > device may depend on dc->realize(). The realization flow will be like a
> > recursive call to device_set_realized(). More precisely, the flow in
> this case
> > is: qdev_realize() --> ... --> FIRST device_set_realized() --> FIRST dc=
->
> > realize() --> ... --> designware_pcie_host_realize() --> qdev_realize()
> --> ...
> > --> SECOND device_set_realized() --> SECOND dc->realize() --> ... -->
> >  designware_pcie_root_realize() --> ...--> back to the SECOND
> > device_set_realized() --> SECOND qbus_realize() the CHILD bus "dw-pcie"
> --> ...
> > --> back to the FIRST device_set_realized() --> FIRST qbus_realize() th=
e
> PARENT
> > bus "pcie".
> >
> > I also found this patch that solves the same bus issue.
>
> Which patch?
>
> > Do you have any suggestions on the order of realization? Thanks!
>
>
> I see. It's not easy to fix. Worth thinking about but I guess your
> patch is ok for now.
>
> > On Thu, Aug 10, 2023 at 5:24=E2=80=AFAM Michael S. Tsirkin <mst@redhat.=
com>
> wrote:
> >
> >     On Wed, Aug 09, 2023 at 10:22:50AM +0000, Jason Chien wrote:
> >     > In pcie_bus_realize(), a root bus is realized as a PCIe bus and a
> >     non-root
> >     > bus is realized as a PCIe bus if its parent bus is a PCIe bus.
> However,
> >     > the child bus "dw-pcie" is realized before the parent bus "pcie"
> which is
> >     > the root PCIe bus. Thus, the extended configuration space is not
> >     accessible
> >     > on "dw-pcie". The issue can be resolved by adding the
> >     > PCI_BUS_EXTENDED_CONFIG_SPACE flag to "pcie" before "dw-pcie" is
> >     realized.
> >     >
> >     > Signed-off-by: Jason Chien <jason.chien@sifive.com>
> >
> >     I think we should fix the order of initialization rather than
> >     hack around it.
> >
> >     > ---
> >     >  hw/pci-host/designware.c | 1 +
> >     >  1 file changed, 1 insertion(+)
> >     >
> >     > diff --git a/hw/pci-host/designware.c b/hw/pci-host/designware.c
> >     > index 9e183caa48..388d252ee2 100644
> >     > --- a/hw/pci-host/designware.c
> >     > +++ b/hw/pci-host/designware.c
> >     > @@ -694,6 +694,7 @@ static void
> designware_pcie_host_realize(DeviceState
> >     *dev, Error **errp)
> >     >                                       &s->pci.io,
> >     >                                       0, 4,
> >     >                                       TYPE_PCIE_BUS);
> >     > +    pci->bus->flags |=3D PCI_BUS_EXTENDED_CONFIG_SPACE;
> >     >
> >     >      memory_region_init(&s->pci.address_space_root,
> >     >                         OBJECT(s),
> >     > --
> >     > 2.17.1
> >
> >
>
>

--0000000000001e9bcc0602952d5a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">the <a href=3D"https://lists.gnu.org/archive/html/qemu-dev=
el/2021-11/msg02162.html">patch</a> link:=C2=A0<a href=3D"https://lists.gnu=
.org/archive/html/qemu-devel/2021-11/msg02162.html">https://lists.gnu.org/a=
rchive/html/qemu-devel/2021-11/msg02162.html</a><br></div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Aug 11, 2023 at=
 1:44=E2=80=AFAM Michael S. Tsirkin &lt;<a href=3D"mailto:mst@redhat.com">m=
st@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">On Fri, Aug 11, 2023 at 01:22:08AM +0800, Jason Chien wrote:<b=
r>
&gt; As far as I know, the order issue is caused by nested device realizati=
on. In<br>
&gt; this case, realizing=C2=A0TYPE_DESIGNWARE_PCIE_HOST will also<br>
&gt; realize=C2=A0TYPE_DESIGNWARE_PCIE_ROOT(see designware_pcie_host_realiz=
e()).<br>
&gt; device_set_realized() is the function that realizing a device must go =
through,<br>
&gt; and this function first realizes the device by dc-&gt;realize() and th=
en realizes<br>
&gt; the device&#39;s child bus by qbus_realize(). Whether there is any chi=
ld bus of the<br>
&gt; device may depend=C2=A0on dc-&gt;realize(). The realization flow will =
be like a<br>
&gt; recursive call to=C2=A0device_set_realized(). More precisely, the flow=
 in this case<br>
&gt; is: qdev_realize() --&gt; ... --&gt; FIRST device_set_realized() --&gt=
; FIRST dc-&gt;<br>
&gt; realize() --&gt; ... --&gt;=C2=A0designware_pcie_host_realize() --&gt;=
=C2=A0qdev_realize() --&gt; ...<br>
&gt; --&gt; SECOND device_set_realized() --&gt; SECOND dc-&gt;realize() --&=
gt; ... --&gt;<br>
&gt; =C2=A0designware_pcie_root_realize() --&gt; ...--&gt; back to the SECO=
ND<br>
&gt; device_set_realized() --&gt; SECOND qbus_realize() the CHILD bus &quot=
;dw-pcie&quot; --&gt; ...<br>
&gt; --&gt; back to the FIRST device_set_realized() --&gt;=C2=A0FIRST qbus_=
realize() the PARENT<br>
&gt; bus &quot;pcie&quot;.<br>
&gt; <br>
&gt; I also found this patch=C2=A0that solves the same bus issue.<br>
<br>
Which patch?<br>
<br>
&gt; Do you have any suggestions on the order of realization? Thanks!<br>
<br>
<br>
I see. It&#39;s not easy to fix. Worth thinking about but I guess your<br>
patch is ok for now.<br>
<br>
&gt; On Thu, Aug 10, 2023 at 5:24=E2=80=AFAM Michael S. Tsirkin &lt;<a href=
=3D"mailto:mst@redhat.com" target=3D"_blank">mst@redhat.com</a>&gt; wrote:<=
br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On Wed, Aug 09, 2023 at 10:22:50AM +0000, Jason Chi=
en wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; In pcie_bus_realize(), a root bus is realized =
as a PCIe bus and a<br>
&gt;=C2=A0 =C2=A0 =C2=A0non-root<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; bus is realized as a PCIe bus if its parent bu=
s is a PCIe bus. However,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; the child bus &quot;dw-pcie&quot; is realized =
before the parent bus &quot;pcie&quot; which is<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; the root PCIe bus. Thus, the extended configur=
ation space is not<br>
&gt;=C2=A0 =C2=A0 =C2=A0accessible<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; on &quot;dw-pcie&quot;. The issue can be resol=
ved by adding the<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; PCI_BUS_EXTENDED_CONFIG_SPACE flag to &quot;pc=
ie&quot; before &quot;dw-pcie&quot; is<br>
&gt;=C2=A0 =C2=A0 =C2=A0realized.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Signed-off-by: Jason Chien &lt;<a href=3D"mail=
to:jason.chien@sifive.com" target=3D"_blank">jason.chien@sifive.com</a>&gt;=
<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0I think we should fix the order of initialization r=
ather than<br>
&gt;=C2=A0 =C2=A0 =C2=A0hack around it.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 hw/pci-host/designware.c | 1 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 1 file changed, 1 insertion(+)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; diff --git a/hw/pci-host/designware.c b/hw/pci=
-host/designware.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; index 9e183caa48..388d252ee2 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; --- a/hw/pci-host/designware.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +++ b/hw/pci-host/designware.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; @@ -694,6 +694,7 @@ static void designware_pci=
e_host_realize(DeviceState<br>
&gt;=C2=A0 =C2=A0 =C2=A0*dev, Error **errp)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0&amp;s-&gt;<a href=3D"http://pci.io" rel=3D"noreferrer"=
 target=3D"_blank">pci.io</a>,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A00, 4,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0TYPE_PCIE_BUS);<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 pci-&gt;bus-&gt;flags |=3D PCI_=
BUS_EXTENDED_CONFIG_SPACE;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 memory_region_init(&amp;s-=
&gt;pci.address_space_root,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0OBJECT(s),<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; --<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; 2.17.1<br>
&gt; <br>
&gt; <br>
<br>
</blockquote></div>

--0000000000001e9bcc0602952d5a--

