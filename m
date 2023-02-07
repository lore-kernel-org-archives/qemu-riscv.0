Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pPQYq-0000Zs-6m
	for mharc-qemu-riscv@gnu.org; Tue, 07 Feb 2023 11:11:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pPQYo-0000ZR-3c; Tue, 07 Feb 2023 11:11:10 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pPQYm-0003vS-H8; Tue, 07 Feb 2023 11:11:09 -0500
Received: by mail-ed1-x530.google.com with SMTP id a10so9192678edu.9;
 Tue, 07 Feb 2023 08:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DaT0vzRLbS2uKSgkefjvaiCQs2y4tC1/K8IS5ehOzrI=;
 b=dGpkLOrwVsHnysDf7Wlq3gLOfgp4yoOMdJ6nh5e5TQIdvItjnGcDsBSCuGiu6NK7eC
 LZDVZrcieeu1P+k7FnIfu7MAKmDB+WYQBENqMiouBpB6sRFxlu9gNMh9+CcukS1DlhRF
 +7A9rOoNluK8ZNC4hYKo4XJlE9oAzv6fDL4IAoX1Gc63Rt7Zu5zPRbjOFDnQjMq5tt3M
 s6e2I6OKmzzzycIj9UNhNC1/1X12zu2zMHSvSdM6TFoQS5bmbwibecLYbZha74gxyDxK
 h/8kQ5dKa90LaT/L2Vfab4n7TFy5rB6oX7GpcNtNtNhCyHUlPfFiWlVxvaxqX4PZ16Qm
 Pgkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DaT0vzRLbS2uKSgkefjvaiCQs2y4tC1/K8IS5ehOzrI=;
 b=RaSMS6as0qCsuFihq0qQOfVvoJUjn0xBUpDhrZyLssREjYSN0lmY29d5BczFacQgZG
 KCCRRK9zW4J/oUR6YUIyJ4tnd9Br+/VyCKqnw0qoGvU8Cw0oUeDx9gDz3QGrv7sU+9aC
 1sL5y6qCL++0vVl7G0moo59HnXqDnowe7W+eFhSpXblf3P8GHiVqT7jEgp1qJhLOdTRB
 z5Im5cDWYYSQtAUVhTPthoYG2IYUwT5KISNYGiBxT/7+d/4QWa0c3gmbXJZaNcl8rDBb
 mySdnU6aLeiVprO8qysrsjUdlWiZ2CaSZSuZ48ulpP45o5DyfaZNJpP00LBY/984MtDa
 MjYg==
X-Gm-Message-State: AO0yUKUAUAsQNCQHyuWJgFMjJ0yZWjOm9KhUSyU9vIPAx+9J4P+3CfcM
 lCCgi57zQy89x1aHMMmgT4beQ2JATcXUz8nS4Qs=
X-Google-Smtp-Source: AK7set9c8aje7IEMwZbKRga7eyHTI3X3eM8qxS7hKoAjFXZ4q1WHDNzmwvcPAGCH3PHWOguyiRjeERWn9r/gAHmb8IY=
X-Received: by 2002:a17:906:7816:b0:888:f761:87aa with SMTP id
 u22-20020a170906781600b00888f76187aamr1062205ejm.163.1675786266634; Tue, 07
 Feb 2023 08:11:06 -0800 (PST)
MIME-Version: 1.0
References: <20230202045223.2594627-1-sunilvl@ventanamicro.com>
 <20230202045223.2594627-5-sunilvl@ventanamicro.com>
 <CAEUhbmXhXw7juMQTW7-XxSLwhcJrOiZ=4fiwFFAyoXj+sL0jUQ@mail.gmail.com>
 <Y+D/frPU/TE1aj7y@sunil-laptop>
In-Reply-To: <Y+D/frPU/TE1aj7y@sunil-laptop>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 8 Feb 2023 00:10:55 +0800
Message-ID: <CAEUhbmU2cofq767-9Lfs2CF+DzpZ6FCHz1ox1TC1siPs5uUdWQ@mail.gmail.com>
Subject: Re: [PATCH 04/10] hw/riscv/virt: virt-acpi-build.c: Add basic ACPI
 tables
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Andrew Jones <ajones@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>, 
 Atish Kumar Patra <atishp@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x530.google.com
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
X-List-Received-Date: Tue, 07 Feb 2023 16:11:10 -0000

On Mon, Feb 6, 2023 at 9:24 PM Sunil V L <sunilvl@ventanamicro.com> wrote:
>
> On Mon, Feb 06, 2023 at 06:17:50PM +0800, Bin Meng wrote:
> > On Thu, Feb 2, 2023 at 12:54 PM Sunil V L <sunilvl@ventanamicro.com> wrote:
> > >
> > > Add few basic ACPI tables and DSDT with few devices in a
> > > new file virt-acpi-build.c.
> > >
> > > These are mostly leveraged from arm64.
> >
> > There are lots of same ACPI codes existing in x86/arm/riscv. I believe
> > some refactoring work is needed before ACPI support fully lands on
> > RISC-V.
> > For example, we can extract the common part among x86/arm/riscv into a
> > separate file, like hw/acpi/acpi-build.c?
> >
>
> While it appears like there is same code in multiple places, those
> functions take architecture specific MachineState parameter. Some tables
> like MADT though with same name, will have different contents for
> different architectures.
>
> Only one function which Daniel also pointed is the wrapper
> acpi_align_size() which can be made common. I am not
> sure whether it is worth of refactoring.
>

It's more than that. For example,

With acpi_dsdt_add_cpus(), the only meaningful parameter is the number
of cpus, so there is no need to pass the architecture specific
MachineState as the parameter.

Likewise, acpi_dsdt_add_fw_cfg() can be made generic as well.

Regards,
Bin

