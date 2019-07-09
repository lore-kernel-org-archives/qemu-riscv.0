Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hklct-0004k6-1N
	for mharc-qemu-riscv@gnu.org; Tue, 09 Jul 2019 04:37:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33282)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hklcq-0004jX-PU
 for qemu-riscv@nongnu.org; Tue, 09 Jul 2019 04:37:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hklcp-0006YN-S6
 for qemu-riscv@nongnu.org; Tue, 09 Jul 2019 04:37:24 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:41044)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hklcn-0006WV-Tv
 for qemu-riscv@nongnu.org; Tue, 09 Jul 2019 04:37:22 -0400
Received: by mail-oi1-x242.google.com with SMTP id g7so14757441oia.8
 for <qemu-riscv@nongnu.org>; Tue, 09 Jul 2019 01:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=en7JuXeewC1PJQ+dn18CZPtUz2HVgySyM2WeaGGQfzA=;
 b=i6638KnPqCv9KbxRUa9B5iXhjsG9cHe40m0ry2TVx1scMtwzsDEowXkzJKPw64WG5s
 Q1raZiHbu4bcKmgIE6P9amLTuPNMTvmYzb229oToISge0T2I/9KdFXIh86qUIip/gtJ2
 tqNHr3822uShQhnBujZP4MG/r8VTeWhwGhKyU03aaiuVoGRCDif+L+RxtpTnLL/eS4K9
 lLyFYYH2XysT3n/Ktv1tXmQJiqlSnwuLW060AWv3jBkqXBX2nQkn8Ob3VwoMLsxquQVt
 gv5xoy0YEicHctProoopKITBld9lK1IZIq1E3vztmuKVYGGPyAduWRgYfh5l9r8i1nZ2
 uZ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=en7JuXeewC1PJQ+dn18CZPtUz2HVgySyM2WeaGGQfzA=;
 b=sGha+Eer7qq+CDeynDkuaGMTs2wAqkQrzidGhpxPR1xvKgupxVf/xucN/XgvqrYC2J
 1Tuiku4ajEfgdz6b8o9LPBw8e6RpflXD4+Ijj9O5eLgyTKK5XOy/akTITwJm8nYjmc55
 kaGFTwfmT2lAxHDkunmsFqEvbNF5rhYPhUqsRoDda/D+27vMUrWQ6UnVSt9kW2+9+yWP
 HvAX8Ht3ZNABWq7srXhq0ov/r2jCzV/AG/nq1iQ/tIbhLqnaYZlWuRL5P/qBoMS7OKzT
 s+Ssl3kylU5Tr2YUFnxYJU4yJUxeqUY0Tt5G++zOZZNLam9q+g0YH1JD8U9tZMfSdqjc
 D58g==
X-Gm-Message-State: APjAAAXe9XwGSn1Ns08JRdRHaLVb3KUHyXxPaMSsHj5YvuDDRxRRplI9
 icBCegRP5CNaf1KILPcvgtpd/Tua5XRZFRU8hVx8dQ==
X-Google-Smtp-Source: APXvYqxPTenHjCQRzGctS/gh93DJMEIHCAJ5zw4LXPujZMnr1NSXdTM2uEyWJLhNkLtFHTstK5vtjYddGPflHXjRdSg=
X-Received: by 2002:a05:6808:d4:: with SMTP id
 t20mr1065721oic.170.1562661439441; 
 Tue, 09 Jul 2019 01:37:19 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1562611535.git.alistair.francis@wdc.com>
 <mhng-2211c89e-80c2-45d7-a471-ec0c30d871a4@palmer-si-x1e>
In-Reply-To: <mhng-2211c89e-80c2-45d7-a471-ec0c30d871a4@palmer-si-x1e>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Jul 2019 09:37:08 +0100
Message-ID: <CAFEAcA8Bf4Zt4U6p3uMsn8cwv+=7ZHxOt7y2FZzB8TYkyo8AHA@mail.gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 QEMU Developers <qemu-devel@nongnu.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Alistair Francis <alistair23@gmail.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 Bin Meng <bmeng.cn@gmail.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Anup Patel <anup@brainfault.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-riscv] [PATCH v1 0/2] RISC-V: Add default OpenSBI ROM
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
X-List-Received-Date: Tue, 09 Jul 2019 08:37:25 -0000

On Tue, 9 Jul 2019 at 09:35, Palmer Dabbelt <palmer@sifive.com> wrote:
> I haven't looked at the code yet, but as the last one was fine it's probably
> OK.  My only issue here is the timing: it's after the soft freeze so if I
> understand correctly we're not supposed to take any new features into 4.1.
> That's kind of unfortunate because it's somewhat unobtrusive and super useful.
>
> Peter: would you be OK taking this some time later this week?  I'd want to dig
> through it and then bang on it a bit first.  If not then I'll queue it up for
> 4.2.

The first attempt at putting this into master got onto the list before
freeze, so it's OK. Plus this clearly will only affect users using the
riscv boards, so it's a limited-scope change. So I think we're better
off putting it into 4.1 rather than not, assuming you're happy with
the level of testing it's had.

thanks
-- PMM

