Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pPOT8-0008Ca-Tm
	for mharc-qemu-riscv@gnu.org; Tue, 07 Feb 2023 08:57:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1pPOT7-0008CF-Bo
 for qemu-riscv@nongnu.org; Tue, 07 Feb 2023 08:57:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1pPOT5-0000jD-S3
 for qemu-riscv@nongnu.org; Tue, 07 Feb 2023 08:57:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675778224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lYdA62YsY6ncUTQYB5leWThHrpMyQvhBe/YVwiz8p4U=;
 b=PUQNDJ0yJNQuiIqt8HtXtoAkihsNTTN2ew0ZbNAvmSVlW6hndi0otjAPwqPp5V7Rf+N6MY
 nXpbnO6mmU/FuwvEbENwpRngr/A6wA4W5r1ciJnuKaG2bLsB7TWxCdVfLJYTjJIxW1YXZt
 b/7CTSVcHMAZH7b5dCjTVRhibD62atw=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-606-kXMGlpvhPZ6A3sgKDIVCzA-1; Tue, 07 Feb 2023 08:57:03 -0500
X-MC-Unique: kXMGlpvhPZ6A3sgKDIVCzA-1
Received: by mail-pg1-f197.google.com with SMTP id
 q130-20020a632a88000000b004a03cfb3ac6so6711766pgq.6
 for <qemu-riscv@nongnu.org>; Tue, 07 Feb 2023 05:57:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:in-reply-to
 :mime-version:references:from:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=lYdA62YsY6ncUTQYB5leWThHrpMyQvhBe/YVwiz8p4U=;
 b=AYPDlDh6uLTNYLf33t68rLXXrI8TYzpeVaq5JagQrDdSsn9KHQ3y0HLnXTjT+KqC0P
 8KwYD9sMO2IdW82CHnXPDnL25vcyCekZBnehCOsEaBjz16WgH+GIjqPyRWvpZrC0Q0LH
 EOPFS1fp0dfWw4kMr+qrootut525LutDGJ8oh0KNN7gZA6tOjx7a+LhJSOSZuzItUGnC
 yfOp/9Bj1vYfTTPfHQ2W7XbqhARUdH28x2sclHEQrCM6J/BriGBH1VrtbzFr8xL85TAO
 p68QZ9O836DtLI/IUzrt+/ND+sc8FvgH+ZlkCSzB0/pxR1Kq8RlDoHov3cg8VNzv1tmg
 DDkA==
X-Gm-Message-State: AO0yUKVVNk1DJM1/e2AOf6UIb1aZ9HFJo0dhKUkrZrTNopP2imxGpIYR
 yMRgIOU9gailjgsujm6NFvVWuKyYnR+H3k55u5urqJB3Y5PmgW67kkyEdrzffR/z213dK+2T9sq
 ctSKEjOvlRMkMs/h9k2sjnHGSj7BqGI8=
X-Received: by 2002:a62:1cca:0:b0:5a7:8880:834a with SMTP id
 c193-20020a621cca000000b005a78880834amr521795pfc.37.1675778220350; 
 Tue, 07 Feb 2023 05:57:00 -0800 (PST)
X-Google-Smtp-Source: AK7set84531pFRTR7artQq3nXsJ0ghkhBE4V9Z1014qYLvoLwbACyEZ/dU+7PO8LS3d1LQbo9IrPjp5swQTuBVdCcLU=
X-Received: by 2002:a62:1cca:0:b0:5a7:8880:834a with SMTP id
 c193-20020a621cca000000b005a78880834amr521775pfc.37.1675778220060; Tue, 07
 Feb 2023 05:57:00 -0800 (PST)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 7 Feb 2023 05:56:59 -0800
From: Andrea Bolognani <abologna@redhat.com>
References: <20230202045223.2594627-1-sunilvl@ventanamicro.com>
 <20230202045223.2594627-3-sunilvl@ventanamicro.com>
 <CABJz62PFGT1H-AArbfTkpiX24mHU=q3wk7h-bpduZhJyy7tTLw@mail.gmail.com>
 <fe3b5794-be2a-eec7-9d4e-9a13eab48378@linaro.org>
 <20230207102353.hpg2gxh22urjbebu@orel>
MIME-Version: 1.0
In-Reply-To: <20230207102353.hpg2gxh22urjbebu@orel>
Date: Tue, 7 Feb 2023 05:56:58 -0800
Message-ID: <CABJz62M+n4DFqMPttzaDrSRzDcjkyEduX_NAv=-9J58mmUe+Ng@mail.gmail.com>
Subject: Re: [PATCH 02/10] hw/riscv/virt: Add a switch to enable/disable ACPI
To: Andrew Jones <ajones@ventanamicro.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Sunil V L <sunilvl@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-riscv@nongnu.org, 
 qemu-devel@nongnu.org, Anup Patel <apatel@ventanamicro.com>, 
 Atish Kumar Patra <atishp@rivosinc.com>, Ani Sinha <ani@anisinha.ca>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 Bernhard Beschow <shentey@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=abologna@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 07 Feb 2023 13:57:09 -0000

On Tue, Feb 07, 2023 at 11:23:53AM +0100, Andrew Jones wrote:
> On Mon, Feb 06, 2023 at 12:18:06PM +0100, Philippe Mathieu-Daud=C3=A9 wro=
te:
> > On 6/2/23 11:54, Andrea Bolognani wrote:
> > > On Thu, Feb 02, 2023 at 10:22:15AM +0530, Sunil V L wrote:
> > > > +    object_class_property_add(oc, "acpi", "OnOffAuto",
> > > > +                              virt_get_acpi, virt_set_acpi,
> > > > +                              NULL, NULL);
> > > > +    object_class_property_set_description(oc, "acpi",
> > > > +                                          "Enable ACPI");
> > >
> > > The way this works on other architectures (x86_64, aarch64) is that
> > > you get ACPI by default and can use -no-acpi to disable it if
> > > desired. Can we have the same on RISC-V, for consistency?
> >
> > -no-acpi rather seems a x86-specific hack for the ISA PC machine, and
> > has a high maintenance cost / burden.
>
> Can you elaborate on this? RISCV doesn't need '-no-acpi' specifically.
> If -no-acpi is problematic for some reason, then something like
> '-machine virt,acpi=3Doff' would be sufficient for switching to DT too.

I would greatly prefer it if the command line interface could be kept
consistent across architectures.

It looks like i440fx and q35 both have an 'acpi' machine property. Is
-no-acpi just sugar for acpi=3Doff? Is it considered desirable to get
rid of -no-acpi? If so, we should follow the usual deprecation
process and get rid of it after libvirt has had a chance to adapt.

In the scenario described above, it would make sense for RISC-V to
only offer the machine type option (assuming that -no-acpi doesn't
come for free with that) instead of putting additional effort into
implementing an interface that is already on its way out.

--=20
Andrea Bolognani / Red Hat / Virtualization


