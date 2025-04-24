Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 189E4C369D1
	for <qemu-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 07:57:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u7rSq-0008IP-SL; Thu, 24 Apr 2025 03:57:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1u7rSm-0008FZ-Kb
 for qemu-riscv@nongnu.org; Thu, 24 Apr 2025 03:57:40 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1u7rSk-0007Jv-0c
 for qemu-riscv@nongnu.org; Thu, 24 Apr 2025 03:57:39 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5f4d28d9fd8so930869a12.3
 for <qemu-riscv@nongnu.org>; Thu, 24 Apr 2025 00:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1745481455; x=1746086255; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nr6tgeCJH6Yvebf5yA+n4OxrfzRHl8dGiR49C15x2+E=;
 b=d4MDE5G8u10OaaYJCZ8rVan4xDwnKlaoZj9E9s0FOiEs5whTYH5jAhxS1f0shPMO5C
 BdUvYsQJkAGbb8rDln//7K26fmrxwcd+4t4pUUoUzA0KyZHsM95WizEbRsXXul2bqUjR
 Ysn5nV0za3K6C4S1PWx9xamWGFa6InZ6qwvbLRFNLykuDxI/xxzVYIF/HPggRSUolrrP
 uGKbeEQrcFRSg9Ro8O3/JYO66+84kDxfQ1NYigrhb8Yh/Fmz2LUC5Hv4msh5xcJV+MJs
 DRhclzpEXsbmVDEm/4V4SRNzTX0Lgw1fMuhb0hQ7kGyCX3oCfuvQpgJCCtdcB0bTXHAN
 753A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745481455; x=1746086255;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nr6tgeCJH6Yvebf5yA+n4OxrfzRHl8dGiR49C15x2+E=;
 b=twzdaWlmKy7klLqSRPHTGZWGj2Wp5l0lH4yTZAcI43sLHHGLVYEjpaF3mbEHTl3wxE
 L6p8xx1ijag1qnVZRgmba9xZt94HswQ2I08WAINFGau6ScpWhMHwORocumNOVO/k+8cK
 JdjtemfPJro8jgXaRcXggDUDyFUhypxlUiwahJq58BgD9w+utYy7hx0UhgvbOVbjVWph
 7oqQrGU65hiQU4mBJgHs9sMdCh9roPGcSeIHONjdYS54YCe3GV4Prj3evKcvAYFivcZV
 Zw5c2gJPa7WDoihwJj2wlVNHVtk/43J4znfGF3LKMej8Yvulc4TLKtzryzw2z5z4fvx1
 edvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIOcxK0LXuXU5Eh+0uvRXeCfDj9lWl44ezbwnlRTMKNVrbO/ZecN/I1VXBuwWFM3Ttyu3tiqf6lBBN@nongnu.org
X-Gm-Message-State: AOJu0YwmzDFS2eKFOC2Hva6zRCUPfmcSlNh3AZB+vC/6bIvRWp9f1O5X
 VMe95uvNVZKmBV/OBA9Rr+oEbQfjJbg88YGxpAWkEyx97wfDaQF3BeuQw4X0jZUGe5jYtfC5oP6
 kvQlKfyFxIOcE8QbK60+WlrOzp0PZdAuq2mhf/qakgqbWVuzYjPM=
X-Gm-Gg: ASbGncsA9DD53OktDUEh6/I6oeVLtmSshNtao8VR11/6KA5P4MbXrEbHeX0m02KBrhp
 ykle09C7u4ZV3+vtfrWD9Wpxr1q+P9ou/g0R/mLV2py7ZSA0U6d9f23V7+dG+fu+BjmpLEYGQoH
 mUTXJWtbgfa+PeZOM2TcV82tAp
X-Google-Smtp-Source: AGHT+IHkAejoE/50SwmX/ikiKVLNkyeXuF4UmOWZrqvJ4YMrzr91sYtUGpUPPmRnX6LM/iZ3/+nA3+wbvjxVXraprUA=
X-Received: by 2002:a17:907:26c3:b0:ac6:fc40:c996 with SMTP id
 a640c23a62f3a-ace5729b5d0mr151960166b.23.1745481454701; Thu, 24 Apr 2025
 00:57:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250302091209.20063-1-jason.chien@sifive.com>
 <20250302091209.20063-2-jason.chien@sifive.com>
 <20250414112346-mutt-send-email-mst@kernel.org>
In-Reply-To: <20250414112346-mutt-send-email-mst@kernel.org>
From: Jason Chien <jason.chien@sifive.com>
Date: Thu, 24 Apr 2025 15:57:23 +0800
X-Gm-Features: ATxdqUEENOOVfKAb-dvZiJWCkfjpifuQ2EvBz276dh5c4dU78k-YoLHVgK9cY60
Message-ID: <CADr__8pZ4RZ3Ny9oWx2noeUZAvVwSMAfwhWJOm+46cFbJPQ41A@mail.gmail.com>
Subject: Re: [PATCH 1/3] include/hw/pci: Attach BDF to Memory Attributes
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Fam Zheng <fam@euphon.net>, Hannes Reinecke <hare@suse.com>,
 qemu-block@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000011e56b0633819213"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=jason.chien@sifive.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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

--00000000000011e56b0633819213
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Adding requester_id here does not break anything, since pci_dma_map()
passes MEMTXATTRS_UNSPECIFIED to dma_memory_map() and requester_id is
unused.

I'll add the below for the comment:
Attach BDF here for use during subsequent IOMMU translation.

Michael S. Tsirkin <mst@redhat.com> =E6=96=BC 2025=E5=B9=B44=E6=9C=8814=E6=
=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=8811:28=E5=AF=AB=E9=81=93=EF=BC=
=9A

> On Sun, Mar 02, 2025 at 05:12:07PM +0800, Jason Chien wrote:
> > This commit adds the BDF to the memory attributes for DMA operations.
> >
> > Signed-off-by: Jason Chien <jason.chien@sifive.com>
> > ---
> >  include/hw/pci/pci_device.h | 10 ++++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> >
> > diff --git a/include/hw/pci/pci_device.h b/include/hw/pci/pci_device.h
> > index add208edfa..968f1ba3e9 100644
> > --- a/include/hw/pci/pci_device.h
> > +++ b/include/hw/pci/pci_device.h
> > @@ -244,6 +244,8 @@ static inline MemTxResult pci_dma_rw(PCIDevice *dev=
,
> dma_addr_t addr,
> >                                       void *buf, dma_addr_t len,
> >                                       DMADirection dir, MemTxAttrs attr=
s)
> >  {
> > +    attrs.unspecified =3D 0;
> > +    attrs.requester_id =3D pci_requester_id(dev);
> >      return dma_memory_rw(pci_get_address_space(dev), addr, buf, len,
> >                           dir, attrs);
> >  }
> > @@ -292,6 +294,8 @@ static inline MemTxResult pci_dma_write(PCIDevice
> *dev, dma_addr_t addr,
> >                                                 uint##_bits##_t *val, \
> >                                                 MemTxAttrs attrs) \
> >      { \
> > +        attrs.unspecified =3D 0; \
> > +        attrs.requester_id =3D pci_requester_id(dev); \
> >          return ld##_l##_dma(pci_get_address_space(dev), addr, val,
> attrs); \
> >      } \
> >      static inline MemTxResult st##_s##_pci_dma(PCIDevice *dev, \
> > @@ -299,6 +303,8 @@ static inline MemTxResult pci_dma_write(PCIDevice
> *dev, dma_addr_t addr,
> >                                                 uint##_bits##_t val, \
> >                                                 MemTxAttrs attrs) \
> >      { \
> > +        attrs.unspecified =3D 0; \
> > +        attrs.requester_id =3D pci_requester_id(dev); \
> >          return st##_s##_dma(pci_get_address_space(dev), addr, val,
> attrs); \
> >      }
> >
> > @@ -327,8 +333,8 @@ PCI_DMA_DEFINE_LDST(q_be, q_be, 64);
> >  static inline void *pci_dma_map(PCIDevice *dev, dma_addr_t addr,
> >                                  dma_addr_t *plen, DMADirection dir)
> >  {
> > -    return dma_memory_map(pci_get_address_space(dev), addr, plen, dir,
> > -                          MEMTXATTRS_UNSPECIFIED);
> > +    MemTxAttrs attrs =3D {.requester_id =3D pci_requester_id(dev)};
> > +    return dma_memory_map(pci_get_address_space(dev), addr, plen, dir,
> attrs);
> >  }
>
>
> Map is the only issue  - bdf can technically change between map and
> unmap.
> The use in hw/net/net_tx_pkt.c is fine as it's under BQL.
> I don't know about the use in megasas though.
> I think it is probably fine as it seems to deal with commands
> and I think any driver would flush these if changing BDF.
> Cc megasas maintainers just to make sure though.
>
> Also, adding a code comment here can't hurt.
>
>
> >  static inline void pci_dma_unmap(PCIDevice *dev, void *buffer,
> dma_addr_t len,
> > --
> > 2.43.2
>
>

--00000000000011e56b0633819213
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Adding requester_id here does not break anything, since pc=
i_dma_map() passes MEMTXATTRS_UNSPECIFIED to dma_memory_map() and requester=
_id is unused.<div><br></div><div>I&#39;ll add the below for the comment:<b=
r>Attach BDF here for use during subsequent IOMMU translation.</div></div><=
br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=
=3D"gmail_attr">Michael S. Tsirkin &lt;<a href=3D"mailto:mst@redhat.com">ms=
t@redhat.com</a>&gt; =E6=96=BC 2025=E5=B9=B44=E6=9C=8814=E6=97=A5 =E9=80=B1=
=E4=B8=80 =E4=B8=8B=E5=8D=8811:28=E5=AF=AB=E9=81=93=EF=BC=9A<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">On Sun, Mar 02, 2025 at 05:12:=
07PM +0800, Jason Chien wrote:<br>
&gt; This commit adds the BDF to the memory attributes for DMA operations.<=
br>
&gt; <br>
&gt; Signed-off-by: Jason Chien &lt;<a href=3D"mailto:jason.chien@sifive.co=
m" target=3D"_blank">jason.chien@sifive.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 include/hw/pci/pci_device.h | 10 ++++++++--<br>
&gt;=C2=A0 1 file changed, 8 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/include/hw/pci/pci_device.h b/include/hw/pci/pci_device.h=
<br>
&gt; index add208edfa..968f1ba3e9 100644<br>
&gt; --- a/include/hw/pci/pci_device.h<br>
&gt; +++ b/include/hw/pci/pci_device.h<br>
&gt; @@ -244,6 +244,8 @@ static inline MemTxResult pci_dma_rw(PCIDevice *de=
v, dma_addr_t addr,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void *=
buf, dma_addr_t len,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DMADir=
ection dir, MemTxAttrs attrs)<br>
&gt;=C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 attrs.unspecified =3D 0;<br>
&gt; +=C2=A0 =C2=A0 attrs.requester_id =3D pci_requester_id(dev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return dma_memory_rw(pci_get_address_space(dev), a=
ddr, buf, len,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0dir, attrs);<br>
&gt;=C2=A0 }<br>
&gt; @@ -292,6 +294,8 @@ static inline MemTxResult pci_dma_write(PCIDevice =
*dev, dma_addr_t addr,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint##_bits##_t *val, \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MemTxAttrs attrs) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 { \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 attrs.unspecified =3D 0; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 attrs.requester_id =3D pci_requester_id(d=
ev); \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ld##_l##_dma(pci_get_address_=
space(dev), addr, val, attrs); \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 } \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 static inline MemTxResult st##_s##_pci_dma(PCIDevi=
ce *dev, \<br>
&gt; @@ -299,6 +303,8 @@ static inline MemTxResult pci_dma_write(PCIDevice =
*dev, dma_addr_t addr,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint##_bits##_t val, \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MemTxAttrs attrs) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 { \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 attrs.unspecified =3D 0; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 attrs.requester_id =3D pci_requester_id(d=
ev); \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return st##_s##_dma(pci_get_address_=
space(dev), addr, val, attrs); \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; @@ -327,8 +333,8 @@ PCI_DMA_DEFINE_LDST(q_be, q_be, 64);<br>
&gt;=C2=A0 static inline void *pci_dma_map(PCIDevice *dev, dma_addr_t addr,=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dma_addr_t *plen, DMADirec=
tion dir)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 return dma_memory_map(pci_get_address_space(dev), addr,=
 plen, dir,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 MEMTXATTRS_UNSPECIFIED);<br>
&gt; +=C2=A0 =C2=A0 MemTxAttrs attrs =3D {.requester_id =3D pci_requester_i=
d(dev)};<br>
&gt; +=C2=A0 =C2=A0 return dma_memory_map(pci_get_address_space(dev), addr,=
 plen, dir, attrs);<br>
&gt;=C2=A0 }<br>
<br>
<br>
Map is the only issue=C2=A0 - bdf can technically change between map and<br=
>
unmap.<br>
The use in hw/net/net_tx_pkt.c is fine as it&#39;s under BQL.<br>
I don&#39;t know about the use in megasas though.<br>
I think it is probably fine as it seems to deal with commands<br>
and I think any driver would flush these if changing BDF.<br>
Cc megasas maintainers just to make sure though.<br>
<br>
Also, adding a code comment here can&#39;t hurt.<br>
<br>
<br>
&gt;=C2=A0 static inline void pci_dma_unmap(PCIDevice *dev, void *buffer, d=
ma_addr_t len,<br>
&gt; -- <br>
&gt; 2.43.2<br>
<br>
</blockquote></div>

--00000000000011e56b0633819213--

