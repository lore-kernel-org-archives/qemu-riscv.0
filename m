Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gKpOa-0003uq-1c
	for mharc-qemu-riscv@gnu.org; Thu, 08 Nov 2018 13:51:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33541)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gKpOW-0003tD-Ke
	for qemu-riscv@nongnu.org; Thu, 08 Nov 2018 13:51:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gKpOV-00007S-8M
	for qemu-riscv@nongnu.org; Thu, 08 Nov 2018 13:51:08 -0500
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:43632)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gKpOU-0008PA-Qz
	for qemu-riscv@nongnu.org; Thu, 08 Nov 2018 13:51:07 -0500
Received: by mail-pf1-x441.google.com with SMTP id g7-v6so7435171pfo.10
	for <qemu-riscv@nongnu.org>; Thu, 08 Nov 2018 10:50:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
	:content-transfer-encoding;
	bh=DOLf+z/3OyQnfNfAO48jofcJl9YL1kuYOnmMXoTIfIg=;
	b=Ah63dOpkrTAntkKZnNOJpdTsjvopsBzFV3X71LnAUv+BpSaKUYpHxC2U+x8dr/KgEB
	QE2Fw9GmlI0HLd6xK1xiHsP5WDQJa5R75dfWdc8EaT8ffnyV9+9oXUg/d49gasLWwz+Y
	tzV8u2br7HUxZzhBZV1I3jl0vCkQzYR7l5mI61mdR/FUYZ2kIR9klK87wa9rTvmyxtz/
	c4tUxQFCz1YQILGYlK961LfxqzfTJCve0KYlvPhmdRq9u+SpP7j+wivrx2L7tdpz/pRF
	wXt5O+AlqgwfyFtzEryJzuSyLiXtr42aWFJqYRW8Y9hiTLOq8bvZwOZHFWThz4t/YQ06
	6now==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=DOLf+z/3OyQnfNfAO48jofcJl9YL1kuYOnmMXoTIfIg=;
	b=mPgBCiD+WAv+zWiA/BdSnrgtcPig6UWZQYELu6eFl58c70C3asv/JkJL2jao5mPf1o
	Em7QyspTZnp8FvSt3WE65cprukqdeV+cMeKKZudDDOXunG2ve+Ny8ubbw4qSAMEJgXeO
	RvY8pRSfrkbd+aVVDAtIWrWvn1zEw68iRI8VNePkrfLds/QBPpxnoJVRpD1dc1RSqhPa
	C9xQ8lczY6wC3x0S3ixU4IwNDyavjxM3YG61WT4V5FSYMAn4So3IGl5KnWodtgTpqEgA
	/KjFoColqA0od+S/VHdph0oH41gAgmDqh96HtL0DB+DOhws7XVhWwa2xz5qavjXGuEOm
	jd4A==
X-Gm-Message-State: AGRZ1gJe/aTF/uhxUrdWQx/ySnmsXA5nqhaJ6c5yJ5NJB359d30OCsqT
	NBEm6XTiqK+CqF1QX2oY3KBhVQ==
X-Google-Smtp-Source: AJdET5dyNqVRW2ts5PvZUnrWMVRPDfFasl/cWkVvjM/lFvjmhF6qrvsWjs90vQCEClR5sW0wpYSUFw==
X-Received: by 2002:a63:1d10:: with SMTP id
	d16-v6mr4578811pgd.228.1541703051503; 
	Thu, 08 Nov 2018 10:50:51 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	v185-v6sm4573442pfv.48.2018.11.08.10.50.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Nov 2018 10:50:50 -0800 (PST)
Date: Thu, 08 Nov 2018 10:50:50 -0800 (PST)
X-Google-Original-Date: Thu, 08 Nov 2018 10:50:48 PST (-0800)
In-Reply-To: <CAKmqyKOXRVE_9fvrXMTXgtruV=UndnBC2oPPS7Qowqt=aqWP1g@mail.gmail.com>
CC: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: alistair23@gmail.com
Message-ID: <mhng-3b5fe601-654c-4aba-b678-62dc8898cef7@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: Re: [Qemu-riscv] [PATCH for 3.1 v1 1/1] hw/riscv/virt: Free the
 test device tree node name
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
X-List-Received-Date: Thu, 08 Nov 2018 18:51:10 -0000

On Thu, 08 Nov 2018 10:37:28 PST (-0800), alistair23@gmail.com wrote:
> On Wed, Nov 7, 2018 at 6:38 PM Palmer Dabbelt <palmer@sifive.com> wrote:
>>
>> On Wed, 07 Nov 2018 13:51:45 PST (-0800), Alistair Francis wrote:
>> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>> > ---
>> >  hw/riscv/virt.c | 1 +
>> >  1 file changed, 1 insertion(+)
>> >
>> > diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
>> > index 4a137a503c..2b38f89070 100644
>> > --- a/hw/riscv/virt.c
>> > +++ b/hw/riscv/virt.c
>> > @@ -240,6 +240,7 @@ static void *create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
>> >      qemu_fdt_setprop_cells(fdt, nodename, "reg",
>> >          0x0, memmap[VIRT_TEST].base,
>> >          0x0, memmap[VIRT_TEST].size);
>> > +    g_free(nodename);
>> >
>> >      nodename = g_strdup_printf("/uart@%lx",
>> >          (long)memmap[VIRT_UART0].base);
>> > --
>> > 2.19.1
>>
>> Thanks.  I got a bit behind this week so I didn't send the pre-PR, but I indent
>> to send a PR tomorrow.  That PR currently only contains this patch.
>
> There should be two patches. One for spike and one for the virt machine.

Oh, sorry about that -- I thought they were the same patch!

Peter: let me know if you want me to submit a new copy of this PR with both 
patches or a follow-on PR.  Sorry for the noise!

