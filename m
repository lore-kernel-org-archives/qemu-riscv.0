Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iSmyq-0005XD-PR
	for mharc-qemu-riscv@gnu.org; Thu, 07 Nov 2019 13:58:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40652)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iSmyo-0005Vu-DZ
 for qemu-riscv@nongnu.org; Thu, 07 Nov 2019 13:58:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iSmym-0003BK-39
 for qemu-riscv@nongnu.org; Thu, 07 Nov 2019 13:58:02 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:39995)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iSmyl-0003An-QY
 for qemu-riscv@nongnu.org; Thu, 07 Nov 2019 13:58:00 -0500
Received: by mail-wr1-x442.google.com with SMTP id i10so4284735wrs.7
 for <qemu-riscv@nongnu.org>; Thu, 07 Nov 2019 10:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=GHI5HQzc4dTPtyOqevl5tAFDZbmdfE4/h7ldKV7LJwk=;
 b=xruopFXKVoQcPdV4hzX1U56zyQqyj47TZiGcYqnj2K9JEulvVPb8BfdmdP44MhwqaZ
 9rRexMrncPCUBlVXyIOi30OcBtOs+TqOGjXcVocZ2DfOBBruHot6YQMQ1W49h9wepNjF
 Bi1mdvGbCEj165lFs5rXV3QEL9U9C+bQSr5ngVr4mqMR8/hV+v4repTGfJ8/Wu5XY/lz
 +ycoU7sA0DxnWyX6T6FMn/SoZSWtyMKHjB7DJA8676bcG+7I9ssSRpeqwn95cy4ufbXy
 Rn5CPOTsY6y0tk97ELEjQTjyyBSCwvXD6HJAxMqRHmc2JyZJvEVKX9Zt7G/+2tfBeefE
 dflw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=GHI5HQzc4dTPtyOqevl5tAFDZbmdfE4/h7ldKV7LJwk=;
 b=gNvTyqqY4YrBykrbh9IPcQz1neGwXs79w4Dresx5ETrYmpY7+vtoekuNI4N4TEejNK
 N4RqVGmF2N5jQzqoISSKsTEELWmpJBebtYAx1CZofc5WQjHqImoT7QaDhGKeGbAoVbHt
 wq35A94NlBMmFzK8S0NBJzVkq58SiJgV5f5LumPB0HgZb+AkNPjp/S1iVctCmrmUkwJa
 2oTEPoXKu2v2ocMhDQJDJZKh7w6KnUSS4DP9IfpRtYPJAgcA1/3xXBZzrDhkvvbKMREV
 6g1wzSPqvGTnzSH8gmBENckJ/xfJGRFOnzC/3YA5HiIBiJ/JF939WX0eoXfz0oZAWaFj
 Szzw==
X-Gm-Message-State: APjAAAX4xZc/EtIOUqjGh4Cxy158uhaxVAN4xQ+6gXkj1E8W1LZVsqKX
 Ba01RtoPJ4+zeNOMHH8mhJRiXg==
X-Google-Smtp-Source: APXvYqy8GO8l0G0/9tShgMFG3ftMRbm/Sx+axkbMFtpr2QRBDd9b434wVihNaqV4+yQlDXK3VHIE7A==
X-Received: by 2002:a5d:4585:: with SMTP id p5mr4521392wrq.134.1573153076682; 
 Thu, 07 Nov 2019 10:57:56 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y15sm2822825wrh.94.2019.11.07.10.57.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2019 10:57:55 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D627C1FF87;
 Thu,  7 Nov 2019 18:57:54 +0000 (GMT)
References: <03c2f42b32fb4e304319c241122ae83584f085e0.1573087610.git.alistair.francis@wdc.com>
 <mhng-35530489-a164-4825-90da-e550083fef9d@palmer-si-x1c4>
 <CAFEAcA8YU5pp5xwqJSBqLtChp1WFmGFLUsHjnWPGk6+k1MtV3Q@mail.gmail.com>
 <CAKmqyKPy4e_Q6iS63Zuqk2fTwMcVAznACrU+0-NN0BCVbh0pDw@mail.gmail.com>
User-agent: mu4e 1.3.5; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Alistair Francis
 <Alistair.Francis@wdc.com>, Palmer Dabbelt <palmer@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, "open list\:RISC-V" <qemu-riscv@nongnu.org>
Subject: Re: [PATCH for 4.2 v1 1/1] riscv/virt: Increase flash size
In-reply-to: <CAKmqyKPy4e_Q6iS63Zuqk2fTwMcVAznACrU+0-NN0BCVbh0pDw@mail.gmail.com>
Date: Thu, 07 Nov 2019 18:57:54 +0000
Message-ID: <87ftizh5u5.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Nov 2019 18:58:03 -0000


Alistair Francis <alistair23@gmail.com> writes:

> On Thu, Nov 7, 2019 at 10:01 AM Peter Maydell <peter.maydell@linaro.org> =
wrote:
>>
>> On Thu, 7 Nov 2019 at 17:09, Palmer Dabbelt <palmer@dabbelt.com> wrote:
>> >
>> > On Wed, 06 Nov 2019 16:47:20 PST (-0800), Alistair Francis wrote:
>> > > Coreboot developers have requested that they have at least 32MB of f=
lash
>> > > to load binaries. We currently have 32MB of flash, but it is split in
>> > > two to allow loading two flash binaries. Let's increase the flash si=
ze
>> > > from 32MB to 64MB to ensure we have a single region that is 32MB.
>> > >
>> > > No QEMU release has include flash in the RISC-V virt machine, so this
>> > > isn't a breaking change.
>> >
>> > Even if we had, I wouldn't consider it a breaking change because it ad=
ds to
>> > the memory map so existing programs will continue to run fine.
>>
>> I have a feeling you may find that some old command lines won't
>> work any more because they specified a flash contents binary
>> that was the old 32MB and now it needs to be padded out to 64MB.
>
> Yes, that is correct. Everyone using -pflash will need to change the
> size of their binaries. This was only just merged into QEMU master
> though and hasn't been in a release so I don't think many people are
> using it.
>
> I only know of two users, one is me and someone from Coreboot who
> requested the larger size. It doesn't seem like a problem users will
> see.

At least the error message they get will be more informative now ;-)

--
Alex Benn=C3=A9e

