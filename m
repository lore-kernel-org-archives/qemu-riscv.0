Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j76Hg-0006kS-Jb
	for mharc-qemu-riscv@gnu.org; Wed, 26 Feb 2020 18:40:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57668)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jimw@sifive.com>) id 1j76Hd-0006j9-JF
 for qemu-riscv@nongnu.org; Wed, 26 Feb 2020 18:40:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jimw@sifive.com>) id 1j76Hc-0007RR-Jy
 for qemu-riscv@nongnu.org; Wed, 26 Feb 2020 18:40:05 -0500
Received: from mail-ua1-x944.google.com ([2607:f8b0:4864:20::944]:36841)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jimw@sifive.com>) id 1j76Hc-0007QB-EP
 for qemu-riscv@nongnu.org; Wed, 26 Feb 2020 18:40:04 -0500
Received: by mail-ua1-x944.google.com with SMTP id y3so295940uae.3
 for <qemu-riscv@nongnu.org>; Wed, 26 Feb 2020 15:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JdiuV+GdGRCh1n9HezlTnphdYqvFzAF4vxfm9QBJHCo=;
 b=CGFSDCixgsNUv9iogiYVPW8enlLNSYoRLIgtGQBSi5HDygtN/LtrYZB3q9KR1FId6X
 zrd3CwXAYmOoHg2P5OkN1rvWSthxP267KO4L9CmbQU3DVHwun2VYhjfHp0KG54OdXaAe
 EDS7EezVpq9Sm1/yvwuoZi9jyX8icIbpVQPQD2WnuobqcK6WamR4wwFt38LPCY6DE/9a
 tiYKGCeMPRqi6l0PxFOoP5jCGXGUGjaKMSRN5pS1RTQHVfACuluBZ7dWZOOExs723jPF
 2RJ5Lsb0wmJTOgHtubXwsfPH95YBwBfFXeHNK/xLg8iC0bgMGmebxYlCUIjSxlSivdQk
 sc0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JdiuV+GdGRCh1n9HezlTnphdYqvFzAF4vxfm9QBJHCo=;
 b=Vt9QoFyMTzRIXbHESauTT4flzsBLNsHZ0ZWztT/+ls76f5/J8GMNfwWTZouIuwRWey
 aJtT5UNHcwR+hq9oSpxPmcgiETUaG41vmjo5HFSCBmUFQzfLauLZ/GpKbJjXCUw4i/Kr
 eH4mwMo6qJwNiAvkTB5bhKXv4hzYI07+K4xq2lIo8nBErNx6tVFEP5zvYmqXTb9gk4y7
 I/B9SVVnvVi56G0HkCD7GfuHtaPZN6hGV2TrNX9vuOIYbY6z/60MqX+Uny8mS+sb32KP
 H5nyV1cMr5028BxaKjzM/RoZ/fs0dLMZvBZ3f2av04szKTllnqk8CoWoX0e9FpLDVPWm
 jLOQ==
X-Gm-Message-State: APjAAAWCAshEtytESA5SnH0fUvYRNzeTpYvuwRAoM54I+65Y31pnoYWR
 NTf7tTOmBsvdqEs4QcLHOEw03GeifbK0VTs20K0C6A==
X-Google-Smtp-Source: APXvYqxT2YVADip6SD/ekxXKaVKMWt1dNY9HQCfnOMxpIQgfyQUNK+96L8idN3KwZF0BnC6wtihFOlLPBsIyWv+kMiI=
X-Received: by 2002:ab0:2302:: with SMTP id a2mr1047878uao.21.1582760403728;
 Wed, 26 Feb 2020 15:40:03 -0800 (PST)
MIME-Version: 1.0
References: <20200221094531.61894-1-zhiwei_liu@c-sky.com>
 <ac290e38-bb39-6551-0758-95d087fa568c@sifive.com>
 <CAKmqyKOedrW3HZFfep4ErJ8H86V=KXeBL8LN2Cy_+669a6c9gQ@mail.gmail.com>
In-Reply-To: <CAKmqyKOedrW3HZFfep4ErJ8H86V=KXeBL8LN2Cy_+669a6c9gQ@mail.gmail.com>
From: Jim Wilson <jimw@sifive.com>
Date: Wed, 26 Feb 2020 15:39:52 -0800
Message-ID: <CAFyWVabLp78M2RGe0TDF5TyW4sJpa6Rm0sJLnc3-CPv8pW+TzA@mail.gmail.com>
Subject: Re: [PATCH v5 0/4] target-riscv: support vector extension part 1
To: Alistair Francis <alistair23@gmail.com>
Cc: LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Chih-Min Chao <chihmin.chao@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 wenmeng_zhang@c-sky.com, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wxy194768@alibaba-inc.com
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::944
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
X-List-Received-Date: Wed, 26 Feb 2020 23:40:06 -0000

On Wed, Feb 26, 2020 at 2:36 PM Alistair Francis <alistair23@gmail.com> wrote:
> On Wed, Feb 26, 2020 at 12:09 PM Jim Wilson <jimw@sifive.com> wrote:
> > If this rvv 0.7.1 implementation is considered a temporary solution,
> > maybe we can just remove all of this work when the official rvv spec if
> > available?  But presumably it is better if we can have both this
>
> That is generally the plan. When the final spec comes out this will be
> updated and we will only support that.

This solves my problem, but maybe creates one for Alibaba.  They have
apparently fabbed a chip using the 0.7.1 draft of the vector spec
proposal.  So for qemu to properly support their asic, the 0.7.1 draft
support will have to be retained.  But I think SiFive and everyone
else is waiting for the official spec before building asics with
vector support.  If Alibaba will update their processor as the spec
evolves, then maybe this isn't a problem for them.

Jim

