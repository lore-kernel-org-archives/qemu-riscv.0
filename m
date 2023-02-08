Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pPcOY-0002W9-RB
	for mharc-qemu-riscv@gnu.org; Tue, 07 Feb 2023 23:49:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pPcOX-0002V4-F5
 for qemu-riscv@nongnu.org; Tue, 07 Feb 2023 23:49:21 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pPcOV-00048x-SZ
 for qemu-riscv@nongnu.org; Tue, 07 Feb 2023 23:49:21 -0500
Received: by mail-pl1-x629.google.com with SMTP id m2so18029990plg.4
 for <qemu-riscv@nongnu.org>; Tue, 07 Feb 2023 20:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/qKMln83+m3EOuan2AfwQRkmnnBaN4eOAIbd9JnOpKM=;
 b=adduCvNbmIcLrfdobmYrxFYdU6gvDdqz+eovas3eFvI8I88wvmlHEwThTpaEb4+Wq3
 YnVRlPoqkN7ZmLnmuuYDdZuV7OlY/5u1fZaLpVU05KM1skwYGBIdl1Rp14r8PK0abXRn
 bnJG9+VUNMsJvtl+M6OxXEsmZnanqjgUMcGQT9EyChWHhPWsPvMDxa6qJZkYUPBG/YSC
 ORjQX9wnZCf4U3e5Mha5WMIIDw36y0/vGmU3ZQimgWtaopoFKZaR4spJmQgl3EtwC6K8
 ADFNt2q33beuMKoer13PrGVkEcmT155FIOgiIRMD1ieZeNEkvOvC57gGHhhokZc++8nN
 F8og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/qKMln83+m3EOuan2AfwQRkmnnBaN4eOAIbd9JnOpKM=;
 b=0wdEg7oVMTMzu0G8ncglOsrJuyXdh4lxhOm1TwR93EfV1tMfn/3JwVafw5y97uvwlB
 Xh6/aPIReEGVJ8N2OPNn7AXh3c8c0FQnmecd4lox5kvQFdJHuOVT92v2deQtC6z36XkW
 fkCLpc/TRMb3YBzVAxiBfAWA2+PGbQNZGnFcUfk1mnovJbttNhx3pAHeBGhicO6DbVrT
 Pp2xaBGIBph4RY04FDhwFNBjIor8O0lKnMiqkKrQR5Kxz0+oCixZcjHFkL6kDlXJBfu4
 rih1fh5x47ZfljVQ5nA5CjmxdoxiJBckcvgUim+UII+mvODXdDMNJfl2A9caLcqU2n5U
 tO2Q==
X-Gm-Message-State: AO0yUKV3EPWwSVxMHUO6CtHwRxuSMtapHu2VPOHK6aU+Pdpqf6efv7yK
 mqGDq/uAEMN9wuTB8GUbEn3LlQ==
X-Google-Smtp-Source: AK7set/6+ljbtBrlJRWIWM5mjpWwwPUlv7Fq/D8eQ5/X+UfVZywe1lJyrjZGxjwmJMztPIU5YiIiNQ==
X-Received: by 2002:a17:902:c20d:b0:199:3fcd:1755 with SMTP id
 13-20020a170902c20d00b001993fcd1755mr1566163pll.46.1675831758115; 
 Tue, 07 Feb 2023 20:49:18 -0800 (PST)
Received: from sunil-laptop ([49.206.14.226]) by smtp.gmail.com with ESMTPSA id
 v23-20020a1709028d9700b0019926c7757asm3206321plo.289.2023.02.07.20.49.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 20:49:17 -0800 (PST)
Date: Wed, 8 Feb 2023 10:19:10 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>
Subject: Re: [PATCH 04/10] hw/riscv/virt: virt-acpi-build.c: Add basic ACPI
 tables
Message-ID: <Y+Mpxv0rmHN4pZ9b@sunil-laptop>
References: <20230202045223.2594627-1-sunilvl@ventanamicro.com>
 <20230202045223.2594627-5-sunilvl@ventanamicro.com>
 <CAEUhbmXhXw7juMQTW7-XxSLwhcJrOiZ=4fiwFFAyoXj+sL0jUQ@mail.gmail.com>
 <Y+D/frPU/TE1aj7y@sunil-laptop>
 <CAEUhbmU2cofq767-9Lfs2CF+DzpZ6FCHz1ox1TC1siPs5uUdWQ@mail.gmail.com>
 <Y+KVPaVQPcoItBbV@sunil-laptop>
 <CAEUhbmX6J5ja+_zdRQ8wuqKyU4uquM6ytnJMtqSfN2CSfLv=MA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEUhbmX6J5ja+_zdRQ8wuqKyU4uquM6ytnJMtqSfN2CSfLv=MA@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Wed, 08 Feb 2023 04:49:21 -0000

On Wed, Feb 08, 2023 at 09:06:48AM +0800, Bin Meng wrote:
> On Wed, Feb 8, 2023 at 2:15 AM Sunil V L <sunilvl@ventanamicro.com> wrote:
> >
> > On Wed, Feb 08, 2023 at 12:10:55AM +0800, Bin Meng wrote:
> > > On Mon, Feb 6, 2023 at 9:24 PM Sunil V L <sunilvl@ventanamicro.com> wrote:
> > > >
> > > > On Mon, Feb 06, 2023 at 06:17:50PM +0800, Bin Meng wrote:
> > > > > On Thu, Feb 2, 2023 at 12:54 PM Sunil V L <sunilvl@ventanamicro.com> wrote:
> > > > > >
> > > > > > Add few basic ACPI tables and DSDT with few devices in a
> > > > > > new file virt-acpi-build.c.
> > > > > >
> > > > > > These are mostly leveraged from arm64.
> > > > >
> > > > > There are lots of same ACPI codes existing in x86/arm/riscv. I believe
> > > > > some refactoring work is needed before ACPI support fully lands on
> > > > > RISC-V.
> > > > > For example, we can extract the common part among x86/arm/riscv into a
> > > > > separate file, like hw/acpi/acpi-build.c?
> > > > >
> > > >
> > > > While it appears like there is same code in multiple places, those
> > > > functions take architecture specific MachineState parameter. Some tables
> > > > like MADT though with same name, will have different contents for
> > > > different architectures.
> > > >
> > > > Only one function which Daniel also pointed is the wrapper
> > > > acpi_align_size() which can be made common. I am not
> > > > sure whether it is worth of refactoring.
> > > >
> > >
> > > It's more than that. For example,
> > >
> > > With acpi_dsdt_add_cpus(), the only meaningful parameter is the number
> > > of cpus, so there is no need to pass the architecture specific
> > > MachineState as the parameter.
> > >
> > I would not make this function common. The reason is, an architecture may
> > choose to attach different ACPI objects under the CPU node.
> >
> 
> Is it possible to insert architect specific CPU nodes after this
> common API builds the basic CPU node in DSDT?
> 
No. They need to be added in the same loop. Otherwise, it will cause
issues to the AML interpreter.

> > > Likewise, acpi_dsdt_add_fw_cfg() can be made generic as well.
> > >
> > The issue is, these things are not exactly common across all architectures.
> > x86 has bit different data in these objects. While today it appears they
> > are same for riscv and arm, in future things may change for an architecture.
> > It doesn't look like it is a standard practice to build files under
> > hw/acpi for specific architectures. Hence, IMO, it is better to keep these
> > things in architecture specific folders to allow them to do differently in
> > future.
> >
> 
> It looks like hw/acpi/ghes.c is for Arm from MAINTAINERS.
> 
APEI is a standard feature but it is up to the architecture to use it or
not. Probably, it is maintained by ARM since they adopted first. But if
you look at hw/acpi/meson.build, it is not architecture specific.

> > But I look forward for the feedback from other architecture maintainers on
> > this topic. My experience in qemu is very limited. So, I need help from
> > experts.
> 
> + Michael and Igor
> 
Thanks!
Sunil

