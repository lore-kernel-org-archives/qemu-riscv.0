Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1hyclQ-0003bG-OE
	for mharc-qemu-riscv@gnu.org; Fri, 16 Aug 2019 09:59:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41724)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1hyclM-0003Zi-PW
 for qemu-riscv@nongnu.org; Fri, 16 Aug 2019 09:59:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1hyclK-0003hI-Dc
 for qemu-riscv@nongnu.org; Fri, 16 Aug 2019 09:59:27 -0400
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:38116)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1hyclF-0003dF-5B; Fri, 16 Aug 2019 09:59:21 -0400
Received: by mail-ed1-x541.google.com with SMTP id r12so5222248edo.5;
 Fri, 16 Aug 2019 06:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hhbg35AbKNv8HefsVGrnprTBxEgOiyYkFgjkJJx5H6g=;
 b=TiquCwG6VJws6UUGtqaTyb+S5VA3vc9/lrapl6I+Jj1xvQ2yEhcmJxC5USEqpWgpak
 qccz20ZzUA+ofnTZRcr3aipyZcQ6rCWGOTHvFrQ2m5A45ifezKKVrVqd8auyLHr4zvmd
 DSR82pcY9+wPV7rqlxYnRC0/g47QXrTD4mDPpngloAHjhcJ0MfrkRJYRE2smJ+vB54VY
 rAZkX6Ku3eq2j7O1RJzFh85tM4crNHBTL99VgttXgNfg+q7/0vivMdp+r1ZGugU5mEn0
 ItgXS+n/2sKZbfC6ItWyRIYNEF107i2XuQPceyAfLL1W7jh4RHEUGrF1WEWIuu8G+6g1
 nk4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hhbg35AbKNv8HefsVGrnprTBxEgOiyYkFgjkJJx5H6g=;
 b=CQdgcYFUsf4RJbGuXDgmrBoCgOT0iEdUEznemP25gnAQh+F2D0shPBa7Dk3U9WVqkN
 O6ZSRT2JpqJ9XwSop7RRfH4jQTRuTvzfhbFrQHBmj6R6c2kZYVZZ1kuO+IMOo82S3RQw
 5DfLPtlCf1MkPfm0JhvxAHg1AtPSxQsN9IcyHxWoPKHmIorHneyJ5453plpkSCYSTKNq
 g+ssQM0MyoDGusflY+/MivxtfcykYpvaaa94QrMu09mSCeigg77zJ3+l23au9l+heSUZ
 W38IkIkukHH7n3pibtFAj08euGCLnZ5ftPTITmr3qUvBp909Bprrd+cA/C96j5wthT1U
 2RYQ==
X-Gm-Message-State: APjAAAU1MAwZnTuwWIfwPyJEMJoDG5/Z+MS4XMgPilvfwJXfybhJY8BR
 m8ivpm83kIxbWIjXdEaPYZC7t/pYmPQ8anOwEbM=
X-Google-Smtp-Source: APXvYqz0aRpWIJ9ayRWYodAahB1NK/joYq0JYtMRm3N6AiFEDuvD+TRTjiHqBVS0pAIpMCvEBBBwLWuTf88MF3F0sTk=
X-Received: by 2002:a05:6402:789:: with SMTP id
 d9mr10795851edy.25.1565963959734; 
 Fri, 16 Aug 2019 06:59:19 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1565904855.git.alistair.francis@wdc.com>
 <9ecf08f99b17a0547cc5cc7a427453ce20389b4b.1565904855.git.alistair.francis@wdc.com>
In-Reply-To: <9ecf08f99b17a0547cc5cc7a427453ce20389b4b.1565904855.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 16 Aug 2019 21:59:08 +0800
Message-ID: <CAEUhbmXq0oVL3epXs3tMyrum1BsYurb-T3D=H-W8Qe+sJ1vN0Q@mail.gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair23@gmail.com>, Palmer Dabbelt <palmer@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::541
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v3 2/7] riscv: plic: Remove
 unused interrupt functions
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
X-List-Received-Date: Fri, 16 Aug 2019 13:59:30 -0000

On Fri, Aug 16, 2019 at 5:44 AM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Jonathan Behrens <fintelia@gmail.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Reviewed-by: Chih-Min Chao <chihmin.chao@sifive.com>
> ---
>  hw/riscv/sifive_plic.c         | 12 ------------
>  include/hw/riscv/sifive_plic.h |  3 ---
>  2 files changed, 15 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

