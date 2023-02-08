Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pPYvQ-0005B5-HX
	for mharc-qemu-riscv@gnu.org; Tue, 07 Feb 2023 20:07:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pPYvP-0005As-HX; Tue, 07 Feb 2023 20:07:03 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pPYvN-00016t-PS; Tue, 07 Feb 2023 20:07:03 -0500
Received: by mail-ed1-x529.google.com with SMTP id q19so18528756edd.2;
 Tue, 07 Feb 2023 17:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RobN1nWl/FYx2H9lclz+ZMaymj9B+Fo8BlmYb6oMOV4=;
 b=piP2WERGOJq4ptNrzUvS5OVvrPGIDPbFe0DfkuDZonbIHTUcFaLba1ha3l/KQyJSjS
 HJuaXMh7Qyt1NhZ5rQnkWz6VuaJZRJNI/gDU/37EK/Us5Ra+zrSSUujEycRj0+IgnGtN
 ZW+zvjEOwdBX6IgwQkflhn0mCsf/BSq3x6mXhMp4YicpdZqrRz7bBpsnqdn3Lmuy7YRz
 ClB16k88+4HvBj4MrOE66ksoz/0k2oUWwHiAIWQAFloTUCzqwjBkVrgl60Li6geyf6/K
 wVTIrrAF/ey8CizdZh2I2y2cLmJ9HO5aU3vIOKKLJ5Q0pmi+H5kh5iYUhev0QzlQojkR
 tfRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RobN1nWl/FYx2H9lclz+ZMaymj9B+Fo8BlmYb6oMOV4=;
 b=y7rjdn2ZzfLca3tkbOIzZ+59DmRS4ZTaDPi3sUdI9Umv5RV5KVDRQ+r7lVr1RdMpvH
 L+jquNvK02JFgz3WEo9QKKsKh3EsK9494qSknmC/UQEkOY2f4s9gjcLIXr3BFSw7MNeR
 YCBdjGfZ+VNCTBtQx384uw98UYC+sYJUF63UDDNSFMxw62J5hLXLG/9eSvGImlKEdfLk
 ymM07DLhp+oqtFHljmWvPlTjKynanKm1zeGP7xOnK9JRpgDQwPTWKpBM8Qn2jMPOoTed
 IKBxLExqbNllmiOrWsOzlIgTFEX/CP5Dxf6+nOBTxKAo0DsaWMYPALY7Bn7dRXKseGXO
 td0w==
X-Gm-Message-State: AO0yUKURuFc0VPmtF2k7kiYByhglmrGdIvPT9VMoviETqFsZRs/cl79w
 WtHr6W4wNzTwT4+PZsUTYLW90U68qrq4LL2wmCU=
X-Google-Smtp-Source: AK7set8hfD800+CMctZwdEmg4qmbmbt+F+BrD34D8Z0KGd4sBAabMtpYP0mIb0BetLeXwVDsaNPPJqKtWpBckp8dpB0=
X-Received: by 2002:a50:f689:0:b0:4a3:fc00:9d69 with SMTP id
 d9-20020a50f689000000b004a3fc009d69mr1203259edn.6.1675818419689; Tue, 07 Feb
 2023 17:06:59 -0800 (PST)
MIME-Version: 1.0
References: <20230202045223.2594627-1-sunilvl@ventanamicro.com>
 <20230202045223.2594627-5-sunilvl@ventanamicro.com>
 <CAEUhbmXhXw7juMQTW7-XxSLwhcJrOiZ=4fiwFFAyoXj+sL0jUQ@mail.gmail.com>
 <Y+D/frPU/TE1aj7y@sunil-laptop>
 <CAEUhbmU2cofq767-9Lfs2CF+DzpZ6FCHz1ox1TC1siPs5uUdWQ@mail.gmail.com>
 <Y+KVPaVQPcoItBbV@sunil-laptop>
In-Reply-To: <Y+KVPaVQPcoItBbV@sunil-laptop>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 8 Feb 2023 09:06:48 +0800
Message-ID: <CAEUhbmX6J5ja+_zdRQ8wuqKyU4uquM6ytnJMtqSfN2CSfLv=MA@mail.gmail.com>
Subject: Re: [PATCH 04/10] hw/riscv/virt: virt-acpi-build.c: Add basic ACPI
 tables
To: Sunil V L <sunilvl@ventanamicro.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Andrew Jones <ajones@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>, 
 Atish Kumar Patra <atishp@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x529.google.com
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
X-List-Received-Date: Wed, 08 Feb 2023 01:07:03 -0000

On Wed, Feb 8, 2023 at 2:15 AM Sunil V L <sunilvl@ventanamicro.com> wrote:
>
> On Wed, Feb 08, 2023 at 12:10:55AM +0800, Bin Meng wrote:
> > On Mon, Feb 6, 2023 at 9:24 PM Sunil V L <sunilvl@ventanamicro.com> wrote:
> > >
> > > On Mon, Feb 06, 2023 at 06:17:50PM +0800, Bin Meng wrote:
> > > > On Thu, Feb 2, 2023 at 12:54 PM Sunil V L <sunilvl@ventanamicro.com> wrote:
> > > > >
> > > > > Add few basic ACPI tables and DSDT with few devices in a
> > > > > new file virt-acpi-build.c.
> > > > >
> > > > > These are mostly leveraged from arm64.
> > > >
> > > > There are lots of same ACPI codes existing in x86/arm/riscv. I believe
> > > > some refactoring work is needed before ACPI support fully lands on
> > > > RISC-V.
> > > > For example, we can extract the common part among x86/arm/riscv into a
> > > > separate file, like hw/acpi/acpi-build.c?
> > > >
> > >
> > > While it appears like there is same code in multiple places, those
> > > functions take architecture specific MachineState parameter. Some tables
> > > like MADT though with same name, will have different contents for
> > > different architectures.
> > >
> > > Only one function which Daniel also pointed is the wrapper
> > > acpi_align_size() which can be made common. I am not
> > > sure whether it is worth of refactoring.
> > >
> >
> > It's more than that. For example,
> >
> > With acpi_dsdt_add_cpus(), the only meaningful parameter is the number
> > of cpus, so there is no need to pass the architecture specific
> > MachineState as the parameter.
> >
> I would not make this function common. The reason is, an architecture may
> choose to attach different ACPI objects under the CPU node.
>

Is it possible to insert architect specific CPU nodes after this
common API builds the basic CPU node in DSDT?

> > Likewise, acpi_dsdt_add_fw_cfg() can be made generic as well.
> >
> The issue is, these things are not exactly common across all architectures.
> x86 has bit different data in these objects. While today it appears they
> are same for riscv and arm, in future things may change for an architecture.
> It doesn't look like it is a standard practice to build files under
> hw/acpi for specific architectures. Hence, IMO, it is better to keep these
> things in architecture specific folders to allow them to do differently in
> future.
>

It looks like hw/acpi/ghes.c is for Arm from MAINTAINERS.

> But I look forward for the feedback from other architecture maintainers on
> this topic. My experience in qemu is very limited. So, I need help from
> experts.

+ Michael and Igor

Regards,
Bin

