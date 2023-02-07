Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pPP73-0005hS-Sr
	for mharc-qemu-riscv@gnu.org; Tue, 07 Feb 2023 09:38:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1pPP6z-0005gX-Ji
 for qemu-riscv@nongnu.org; Tue, 07 Feb 2023 09:38:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1pPP6y-0000h3-6j
 for qemu-riscv@nongnu.org; Tue, 07 Feb 2023 09:38:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675780699;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EFtY7ec7mQocFsctKKKJRJ5Gd4uawOzZqJ3gbQS4dVg=;
 b=RthKyRiflssLrJW7sUXJAbRaOZ9P6rXd1sx45belhQ3tIZIT00zA3BAfQwUat9nTvhyx+x
 KotYYyVATgcX9SQuXldcVCCV11vq8yktmTcZKPqC5ggGK/ewuh3wDionyYVZ+Ezvqrt9VT
 7B5RSDti8oadza4+/Ce9nS9hCFU/V9U=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-141-HXaJXRzENCO_kgGaOzjKrg-1; Tue, 07 Feb 2023 09:38:18 -0500
X-MC-Unique: HXaJXRzENCO_kgGaOzjKrg-1
Received: by mail-pj1-f71.google.com with SMTP id
 gn18-20020a17090ac79200b0022bef1f49c9so1020466pjb.0
 for <qemu-riscv@nongnu.org>; Tue, 07 Feb 2023 06:38:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EFtY7ec7mQocFsctKKKJRJ5Gd4uawOzZqJ3gbQS4dVg=;
 b=YetCpYxbZBLv4Ii801DUS8OElfaOUAdEKqyUqkfsbB3pdj/vd4XTw117gevc7aZ0C0
 rVsB0dLjkSVTmHzFHPiHkRao6Ep0tPuFVYqnbDGahQpJfm7VhJRLCUlfE+ipJUAYdMsP
 WbJTQiHzacQaVW/02MGv15hqgEDSIdWYKioBqUUrnq7yT7wWG4GyVuFHQXSY5PL3VE/Y
 eSYJf1Q9HCtDKCOfjLeHRvibX2ODew9Rv/ZvdMEwnqUl4FFebAD1u3h4kipAqq6cICZw
 x3XQqrVygUZQLIRD6YVn/fuIteugvFAyEoKQgpY5cX1p5cXHbCM+jYHjdH2H0Uq7xrol
 7k2w==
X-Gm-Message-State: AO0yUKXLSYcFmfaDAxppFxuyvI7Ve3uJV2L+6iPz2sI5ElYyeFBfRkkz
 0a9Ow6P0YovXKLrQ2lr2ZGkuoESPkZOLmLUp31cFgTQxpBCT8ZbSSEXZunqRDGdqqKQjDvovXjl
 PY57yNX8PUYS088YINOzJwdIbbwc+O2o=
X-Received: by 2002:a17:902:b20f:b0:199:1e59:fdf6 with SMTP id
 t15-20020a170902b20f00b001991e59fdf6mr707850plr.29.1675780696559; 
 Tue, 07 Feb 2023 06:38:16 -0800 (PST)
X-Google-Smtp-Source: AK7set/ntBA+fYPv7QoIdjcUyEiEluIbww7kxzs35RlMBgUf0rkFvThOjpxM4LoKHyAq8TpW+h4Rc6Xxm80vHxW7Jp0=
X-Received: by 2002:a17:902:b20f:b0:199:1e59:fdf6 with SMTP id
 t15-20020a170902b20f00b001991e59fdf6mr707847plr.29.1675780696206; Tue, 07 Feb
 2023 06:38:16 -0800 (PST)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 7 Feb 2023 06:38:15 -0800
From: Andrea Bolognani <abologna@redhat.com>
References: <20230202045223.2594627-1-sunilvl@ventanamicro.com>
 <20230202045223.2594627-3-sunilvl@ventanamicro.com>
 <CABJz62PFGT1H-AArbfTkpiX24mHU=q3wk7h-bpduZhJyy7tTLw@mail.gmail.com>
 <fe3b5794-be2a-eec7-9d4e-9a13eab48378@linaro.org>
 <20230207102353.hpg2gxh22urjbebu@orel>
 <CABJz62M+n4DFqMPttzaDrSRzDcjkyEduX_NAv=-9J58mmUe+Ng@mail.gmail.com>
 <9c05b850-ae25-12aa-c6d0-b7a813a5ee03@redhat.com>
MIME-Version: 1.0
In-Reply-To: <9c05b850-ae25-12aa-c6d0-b7a813a5ee03@redhat.com>
Date: Tue, 7 Feb 2023 06:38:15 -0800
Message-ID: <CABJz62PuT+kG2X9OEBQRfybWn2ESJ3aNaEBkvDG=XK_43ZC_8w@mail.gmail.com>
Subject: Re: [PATCH 02/10] hw/riscv/virt: Add a switch to enable/disable ACPI
To: Thomas Huth <thuth@redhat.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=abologna@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 07 Feb 2023 14:38:21 -0000

On Tue, Feb 07, 2023 at 03:02:19PM +0100, Thomas Huth wrote:
> On 07/02/2023 14.56, Andrea Bolognani wrote:
> > It looks like i440fx and q35 both have an 'acpi' machine property. Is
> > -no-acpi just sugar for acpi=off?
>
> Yes, it is, see softmmu/vl.c:
>
>             case QEMU_OPTION_no_acpi:
>                 qdict_put_str(machine_opts_dict, "acpi", "off");
>                 break;
>
> > Is it considered desirable to get rid of -no-acpi?
>
> Sounds like a good idea, indeed!
>
> > If so, we should follow the usual deprecation
> > process and get rid of it after libvirt has had a chance to adapt.
> >
> > In the scenario described above, it would make sense for RISC-V to
> > only offer the machine type option (assuming that -no-acpi doesn't
> > come for free with that) instead of putting additional effort into
> > implementing an interface that is already on its way out.
>
> I agree. IMHO the machine parameter should be enough, no need to introduce
> "-no-acpi" here.

Well, it looks like -no-acpi will come for free after all, thanks to
the code you pasted above, as long as the machine property follows
the convention established by x86, arm and (I just noticed this one)
loongarch.

So I guess the -no-acpi deprecation can be handled separately, and
the only thing that needs changing in the current patch is making
sure that ACPI is opt-out rather than opt-in, as is the case for
other architectures :)

-- 
Andrea Bolognani / Red Hat / Virtualization


