Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pPndC-000717-Cy
	for mharc-qemu-riscv@gnu.org; Wed, 08 Feb 2023 11:49:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1pPnd5-00070e-RF
 for qemu-riscv@nongnu.org; Wed, 08 Feb 2023 11:49:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1pPnd1-0001x6-PW
 for qemu-riscv@nongnu.org; Wed, 08 Feb 2023 11:49:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675874941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1rBO6BPxX2JsKKWVKM4Id2mvZ/jNawONjRxMddbGT9k=;
 b=Rp9w0X+gHColNrxjfAyDYpULnQZGI+qBzj419lVbNEUfWY+deG//PHq2rlRAigBFzk+GlI
 i1CBzKPsahKga5l1F6SU+slXRg8KRIPvcjAg5gUi0mRbNu+Q9a1WR53VJNai/IAHBW73+l
 h6q65qBIbgzfYQjXKbyvGWReLNXL6VQ=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-619-UQM9edNJPmqg6NssET3nBg-1; Wed, 08 Feb 2023 11:49:00 -0500
X-MC-Unique: UQM9edNJPmqg6NssET3nBg-1
Received: by mail-pj1-f70.google.com with SMTP id
 c4-20020a17090a674400b00230c06f525bso1550831pjm.2
 for <qemu-riscv@nongnu.org>; Wed, 08 Feb 2023 08:49:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:in-reply-to
 :mime-version:references:from:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=1rBO6BPxX2JsKKWVKM4Id2mvZ/jNawONjRxMddbGT9k=;
 b=V+S7yv9wg5XQ670RdhwDZ7FrbQAQEmgDnEjQ8obYgxqCL0awRox5fg/Pp0LCdJXpZQ
 j8NAGpN55rJ9YjxWLuFRLLLYotNIAxtMigJT4DA/J0AOQpbLJib/AKD3gzBzf19wunMg
 l81OnLlliWbNrTDwy+n5Ee2suerw+RDhY1Jz/NkBHVAdi+JMUY1fbG/9YDqQ1Wh/Ron0
 kMF/cENm0arKige4oCkARMpL2JxOBbijjjePETkWkk6QQnnJkofip8uB/GjipT/Sj6Th
 k5LcaF6Fjdt/D9oAetaf1g4Pk8SmNePq3xmftsWdPG1pZOvprGmADmBLQhsMiFoz5xko
 oetw==
X-Gm-Message-State: AO0yUKWlxvVMGBNoZTMzbYTDaxZOUioTnvn7o2CeRHwMAbmURpCnZvHJ
 BKeQDqlEL70navGjo/CpWNYR89sLMBZIqPI1YpbjU2m8yaxzGxmRgfRJxidNsvGOtmJP0dBHDn3
 yZKA9EjLr9H9T+2oy55wVQg89qLYtFE0=
X-Received: by 2002:a62:1c08:0:b0:590:762f:58bc with SMTP id
 c8-20020a621c08000000b00590762f58bcmr1755528pfc.50.1675874939214; 
 Wed, 08 Feb 2023 08:48:59 -0800 (PST)
X-Google-Smtp-Source: AK7set9xRAGJcNCX+DiKV/md7TdgznjA3jdrc0kaqctbi7+Ms62lfu2n/YwfLrNsEeASkGIbEnrQVoGKlaNr6lqA2p8=
X-Received: by 2002:a62:1c08:0:b0:590:762f:58bc with SMTP id
 c8-20020a621c08000000b00590762f58bcmr1755504pfc.50.1675874938886; Wed, 08 Feb
 2023 08:48:58 -0800 (PST)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Feb 2023 08:48:58 -0800
From: Andrea Bolognani <abologna@redhat.com>
References: <20230202045223.2594627-1-sunilvl@ventanamicro.com>
 <20230202045223.2594627-3-sunilvl@ventanamicro.com>
 <CABJz62PFGT1H-AArbfTkpiX24mHU=q3wk7h-bpduZhJyy7tTLw@mail.gmail.com>
 <fe3b5794-be2a-eec7-9d4e-9a13eab48378@linaro.org>
 <20230207102353.hpg2gxh22urjbebu@orel>
 <CABJz62M+n4DFqMPttzaDrSRzDcjkyEduX_NAv=-9J58mmUe+Ng@mail.gmail.com>
 <9c05b850-ae25-12aa-c6d0-b7a813a5ee03@redhat.com>
 <CABJz62PuT+kG2X9OEBQRfybWn2ESJ3aNaEBkvDG=XK_43ZC_8w@mail.gmail.com>
 <20230207192031.pu5uy2yppv3htjw5@orel>
MIME-Version: 1.0
In-Reply-To: <20230207192031.pu5uy2yppv3htjw5@orel>
Date: Wed, 8 Feb 2023 08:48:58 -0800
Message-ID: <CABJz62O6U88GzAuVT78wVOk0f232hhTw35CjOBJL+eBAUfbpCg@mail.gmail.com>
Subject: Re: [PATCH 02/10] hw/riscv/virt: Add a switch to enable/disable ACPI
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Sunil V L <sunilvl@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-riscv@nongnu.org, 
 qemu-devel@nongnu.org, Anup Patel <apatel@ventanamicro.com>, 
 Atish Kumar Patra <atishp@rivosinc.com>, Ani Sinha <ani@anisinha.ca>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>, Bernhard Beschow <shentey@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=abologna@redhat.com;
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
X-List-Received-Date: Wed, 08 Feb 2023 16:49:09 -0000

On Tue, Feb 07, 2023 at 08:20:31PM +0100, Andrew Jones wrote:
> On Tue, Feb 07, 2023 at 06:38:15AM -0800, Andrea Bolognani wrote:
> > Well, it looks like -no-acpi will come for free after all, thanks to
> > the code you pasted above, as long as the machine property follows
> > the convention established by x86, arm and (I just noticed this one)
> > loongarch.
>
> Not quite, because we also have
>
> $ grep -A1 '"no-acpi"' qemu-options.hx
> DEF("no-acpi", 0, QEMU_OPTION_no_acpi,
>            "-no-acpi        disable ACPI\n", QEMU_ARCH_I386 | QEMU_ARCH_A=
RM)
>
> So that means neither riscv nor loongarch get -no-acpi just by adding
> the "acpi" machine property.
>
> If the plan is to deprecate -no-acpi, then riscv can be like loongarch
> and only have the "acpi" property from the start.

Makes sense.


For the libvirt integration, do I understand correctly that the
machine property was added by commit

  commit 17e89077b7e3bc1d96540e21ddc7451c3e077049
  Author: Gerd Hoffmann <kraxel@redhat.com>
  Date:   Fri Mar 20 11:01:36 2020 +0100

    acpi: add acpi=3DOnOffAuto machine property to x86 and arm virt

    Remove the global acpi_enabled bool and replace it with an
    acpi OnOffAuto machine property.

    qemu throws an error now if you use -no-acpi while the machine
    type you are using doesn't support acpi in the first place.

    Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
    Message-Id: <20200320100136.11717-1-kraxel@redhat.com>
    Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
    Acked-by: Paolo Bonzini <pbonzini@redhat.com>
    Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
    Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

included in QEMU 5.0? libvirt still officially supports QEMU 4.2, so
we'll have to make the use of the machine property conditional.

--=20
Andrea Bolognani / Red Hat / Virtualization


