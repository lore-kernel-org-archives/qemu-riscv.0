Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pPSVI-00069W-7Y
	for mharc-qemu-riscv@gnu.org; Tue, 07 Feb 2023 13:15:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pPSVD-00068W-Up
 for qemu-riscv@nongnu.org; Tue, 07 Feb 2023 13:15:36 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pPSVC-0003Pi-91
 for qemu-riscv@nongnu.org; Tue, 07 Feb 2023 13:15:35 -0500
Received: by mail-pl1-x634.google.com with SMTP id r8so16550295pls.2
 for <qemu-riscv@nongnu.org>; Tue, 07 Feb 2023 10:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=bTFMhpW/ICrjAdAfa2iboE6OQItLKAmRMMZON/DuZ2Q=;
 b=KXbHWWRJtQl2RrKQ/ZMieGZvOzMd8cAdbF6HbOVByeC4vkDYhElxwH8VT4V2rYifAO
 tE6CjS16HeXuF6hhdrKBbEqiWSFbfPDdJU7RjGBkT4RvKMD0o4yf2ReSl6XXyv6thnMg
 4Cmy1pmpRdyLZULU7hWY+LXMKShc1NF5B2/1JmUd1RWBISm53bqilYdmZlMSWl+3fSc3
 t2jgDV3PbBaTDxlbIiAHu6HnGyZ5uPnzZgUSYIcPK9dC1rAL8h40ur398QJzSMi4RV98
 Mi7FoVAZu+c8lRIkEno80qArTCsmMFay7JtPQCsYPMDSmgjf8WXMJLrOqXWt0uy0afgA
 zVTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bTFMhpW/ICrjAdAfa2iboE6OQItLKAmRMMZON/DuZ2Q=;
 b=p9ttKiG4fjzfEh3uusnFA8L2ZYroe8XJ/OJM3NutIZ8vAnPtfBJ1IVPg70fiLxGEa0
 yuMuEx+DsXM1RDu6hh5rvORVgJnkMHDZyIx/9iw9AlF2aH3dBV0Lm9VhlIl+P7aX+I9W
 tr+UYJe47MpH2N9CthVFaYLRpB/xkAAnMC7GQOP2d1WR8uMcb+B6gkWAoP0TwWdpbufp
 Mj1/9jvWunhWEwj/kNb42WVP/z+w0V/5gFLpOBx7eXAAZbJ4AeszPo4DVSekVi7Om3cv
 s+2DIkHqtit0gdW2u4PMZR42+OsK0KVHIpSVRLSjQxnKyUl9yRT00VHTiMwyQ2yK0Sy6
 Tk5g==
X-Gm-Message-State: AO0yUKUsNjegRVDJBnpasLZZci0uhpN8wbeuHecgOhh40BRULTcxKW/2
 GItE7HgcYGPnwxIaGp+txCNG2g==
X-Google-Smtp-Source: AK7set/pw2H0H0kiiD3xZEVWlXliRXPXbSo7rDsaXx3+wXIiKvjgqN5+U7f7GCu3E0O6eyTDduG0yQ==
X-Received: by 2002:a05:6a21:2c91:b0:bf:ae32:5ed0 with SMTP id
 ua17-20020a056a212c9100b000bfae325ed0mr3180906pzb.13.1675793731993; 
 Tue, 07 Feb 2023 10:15:31 -0800 (PST)
Received: from sunil-laptop ([49.206.14.226]) by smtp.gmail.com with ESMTPSA id
 e11-20020aa78c4b000000b00581dd94be3asm9551306pfd.61.2023.02.07.10.15.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 10:15:31 -0800 (PST)
Date: Tue, 7 Feb 2023 23:45:25 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>
Subject: Re: [PATCH 04/10] hw/riscv/virt: virt-acpi-build.c: Add basic ACPI
 tables
Message-ID: <Y+KVPaVQPcoItBbV@sunil-laptop>
References: <20230202045223.2594627-1-sunilvl@ventanamicro.com>
 <20230202045223.2594627-5-sunilvl@ventanamicro.com>
 <CAEUhbmXhXw7juMQTW7-XxSLwhcJrOiZ=4fiwFFAyoXj+sL0jUQ@mail.gmail.com>
 <Y+D/frPU/TE1aj7y@sunil-laptop>
 <CAEUhbmU2cofq767-9Lfs2CF+DzpZ6FCHz1ox1TC1siPs5uUdWQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEUhbmU2cofq767-9Lfs2CF+DzpZ6FCHz1ox1TC1siPs5uUdWQ@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Tue, 07 Feb 2023 18:15:37 -0000

On Wed, Feb 08, 2023 at 12:10:55AM +0800, Bin Meng wrote:
> On Mon, Feb 6, 2023 at 9:24 PM Sunil V L <sunilvl@ventanamicro.com> wrote:
> >
> > On Mon, Feb 06, 2023 at 06:17:50PM +0800, Bin Meng wrote:
> > > On Thu, Feb 2, 2023 at 12:54 PM Sunil V L <sunilvl@ventanamicro.com> wrote:
> > > >
> > > > Add few basic ACPI tables and DSDT with few devices in a
> > > > new file virt-acpi-build.c.
> > > >
> > > > These are mostly leveraged from arm64.
> > >
> > > There are lots of same ACPI codes existing in x86/arm/riscv. I believe
> > > some refactoring work is needed before ACPI support fully lands on
> > > RISC-V.
> > > For example, we can extract the common part among x86/arm/riscv into a
> > > separate file, like hw/acpi/acpi-build.c?
> > >
> >
> > While it appears like there is same code in multiple places, those
> > functions take architecture specific MachineState parameter. Some tables
> > like MADT though with same name, will have different contents for
> > different architectures.
> >
> > Only one function which Daniel also pointed is the wrapper
> > acpi_align_size() which can be made common. I am not
> > sure whether it is worth of refactoring.
> >
> 
> It's more than that. For example,
> 
> With acpi_dsdt_add_cpus(), the only meaningful parameter is the number
> of cpus, so there is no need to pass the architecture specific
> MachineState as the parameter.
> 
I would not make this function common. The reason is, an architecture may
choose to attach different ACPI objects under the CPU node.

> Likewise, acpi_dsdt_add_fw_cfg() can be made generic as well.
> 
The issue is, these things are not exactly common across all architectures.
x86 has bit different data in these objects. While today it appears they
are same for riscv and arm, in future things may change for an architecture.
It doesn't look like it is a standard practice to build files under
hw/acpi for specific architectures. Hence, IMO, it is better to keep these
things in architecture specific folders to allow them to do differently in
future.

But I look forward for the feedback from other architecture maintainers on
this topic. My experience in qemu is very limited. So, I need help from
experts.

Thanks!
Sunil

