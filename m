Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hEYfQ-0006On-GI
	for mharc-qemu-riscv@gnu.org; Thu, 11 Apr 2019 08:18:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56428)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hEYfJ-0006Nj-Kr
	for qemu-riscv@nongnu.org; Thu, 11 Apr 2019 08:18:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hEYfF-0001pS-Qn
	for qemu-riscv@nongnu.org; Thu, 11 Apr 2019 08:18:49 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:39143)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hEYfE-0001mT-3T
	for qemu-riscv@nongnu.org; Thu, 11 Apr 2019 08:18:45 -0400
Received: by mail-oi1-x242.google.com with SMTP id n187so4684004oih.6
	for <qemu-riscv@nongnu.org>; Thu, 11 Apr 2019 05:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5uDn2ZUjwTyOqfDEKC5PGB65jziL38BFw27hm01Tnro=;
	b=uB3A2tMUhvUkfXdbmXmds+5m0eo7PbAq2vCNG/tfMnsPAx5TSEKLLXg6GjgJWj2cxT
	ovW9NuLcwNmXVTAgeShePvpFJKnGNfcs5qkTuS/9dO8WHgmaCs5PiafjWcv7t5s81A9/
	t1YQzq3cmNzrs6kjg6VmnSRmC9ZsiDQQ5SqZm88GB9lsiKi1eN0IIo39yKiWelSboHFn
	81JA3C3GUraKaotzFgXXc+3fYeyf9WwEpGA+YYjUtmEjhPDcK7/X19yqG1RPb75RGIVp
	ydLaleLdwNeC3uzuQ0zgPacWCrZA9Fwmev0YZJr0pPUOUYJHCDtPypPiQbRoUhqeCM5N
	+1dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5uDn2ZUjwTyOqfDEKC5PGB65jziL38BFw27hm01Tnro=;
	b=CFxeOfwrfEHe0ZsowXMi/Kyfm5ImUmHy7pFuuBl5FjXFcz60bjB4+EEjrz8UaWUoyB
	8BzXyfdu4iN5a3ef38ZD1YincvEIq67x742qRJ0un/ImhwJRv2WZJVG/Eug3/3xiwq6I
	ag2rE6ziqzl6UuezVUI+hUYiBAm7BdEzNVnw4oI3Gbf7/Tv1QVa0LGJTL5CbSK22jnzm
	zl3thOmaDyKVurWe9hF3R8zJC+tRqAYvvQ8bcr7MfhfWLzkQxZZjiZEGHm+P6IzAoJ9L
	Q2VOGAIjS8daaDC/zrWDfVkDqj968xicnmv2imo4IGT7/6VYiEDhEAebxobX6nGLkxej
	M4Rw==
X-Gm-Message-State: APjAAAW2hXgDyOcX5y6rogqu4YztCOwk9PjLpJ34dmLVZPU6a1L8SV26
	8p+PbJZOVlLvYUY2OMze1dS7cRxVzpLIEEfxznwEpA==
X-Google-Smtp-Source: APXvYqwoJCLsDnUs9nsSHz1AfXCGntkb4a6dm7kQoNg/yXwiShyGXXazL7vKnPOidT/ohDPEHo2mkicXTJ7LdJNZKQI=
X-Received: by 2002:aca:e84c:: with SMTP id f73mr5957965oih.163.1554985121752; 
	Thu, 11 Apr 2019 05:18:41 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1554937288.git.alistair.francis@wdc.com>
	<9043c3a6bc54faa98ed9fedc0c6c929c993a0bf9.1554937288.git.alistair.francis@wdc.com>
	<20190411140629.3a672b39@redhat.com>
In-Reply-To: <20190411140629.3a672b39@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Apr 2019 13:18:30 +0100
Message-ID: <CAFEAcA-oOfZD=tas4QP3SeSOJJ+eM_9o=v05U=scsc78Z4p3FQ@mail.gmail.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
	"alistair23@gmail.com" <alistair23@gmail.com>, 
	"palmer@sifive.com" <palmer@sifive.com>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>, 
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"ijc@hellion.org.uk" <ijc@hellion.org.uk>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH for 4.1 v3 6/6] riscv: Add a
 generic spike machine
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Apr 2019 12:18:51 -0000

On Thu, 11 Apr 2019 at 13:07, Igor Mammedov <imammedo@redhat.com> wrote:
>
> On Wed, 10 Apr 2019 23:11:00 +0000
> Alistair Francis <Alistair.Francis@wdc.com> wrote:
> > +    /* register system main memory (actual RAM) */
> > +    memory_region_init_ram(main_mem, NULL, "riscv.spike.ram",
> > +                           machine->ram_size, &error_fatal);
> do you really care about migration? if not then _nomigrate flavor would
> be more suitable.

Every machine model should care about migration, at least to
the extent of making savevm/loadvm snapshots work. Using
memory_region_init_ram_nomigrate() is a bad idea in new
code: it exists only for the benefit of older code which
is handling the migration of the backing RAM by hand for
migration-compatibility reasons.

> >      /* Initialize SOC */
> >      object_initialize_child(OBJECT(machine), "soc", &s->soc, sizeof(s->soc),
> >                              TYPE_RISCV_HART_ARRAY, &error_abort, NULL);
> > @@ -254,6 +343,12 @@ static void spike_v1_09_1_board_init(MachineState *machine)
> >      MemoryRegion *mask_rom = g_new(MemoryRegion, 1);
> >      int i;
> >
> > +    if (!qtest_enabled()) {
> > +        info_report("The Spike v1.09.1 machine has been depreceated. "
> > +                    "Please use the deneric spike machine and specify the ISA "

"generic"

> > +                    "versions using -cpu.");
> > +    }
> > +

thanks
-- PMM

