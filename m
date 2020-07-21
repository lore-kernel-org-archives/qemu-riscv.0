Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jxuEH-0002Qw-0I
	for mharc-qemu-riscv@gnu.org; Tue, 21 Jul 2020 11:30:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jxuEF-0002Qe-3Y
 for qemu-riscv@nongnu.org; Tue, 21 Jul 2020 11:30:51 -0400
Received: from mail-oo1-xc42.google.com ([2607:f8b0:4864:20::c42]:45810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jxuEC-0006rx-Ld
 for qemu-riscv@nongnu.org; Tue, 21 Jul 2020 11:30:50 -0400
Received: by mail-oo1-xc42.google.com with SMTP id a9so3989430oof.12
 for <qemu-riscv@nongnu.org>; Tue, 21 Jul 2020 08:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0QQ9LSjKCX7WYfKLzfQabmF5yYVgASKsc0PsMjohddU=;
 b=S0AtwJrznVS77udcGXJ6C+rq3sgZI8k+bnHvUNZyX6VQqwZ1x/qJs1wNJUnzCXb92/
 1OpxsqwN5mvqE8srAHyaK1sWp4v9C6VVKXq6Vjynf7I53FZFd1kNiZoK5bfs/UMeMmSe
 5eUQQPkIbx59CTCfSCOrvZzg3Jq58Eoz65TlBMUcoxwHtmU+C0FiFQW9aLRITpM6B3Qo
 8VywssrIkMCr/SFfBJyI8BoYwkXFHwX7fEVeEmkugvjBoaYK6OndodGuSeL7rudzBhnz
 N3Tkmb5xV7K0LrrD0B1zlw9tbtZo0868QA93/q23DC6MWjS+7ZgzUfBgyZIvqZKZswur
 q7dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0QQ9LSjKCX7WYfKLzfQabmF5yYVgASKsc0PsMjohddU=;
 b=Nd49D6pD7sJk9T+I85hx41F6GEcBh5LZ6kIx1LKK0phh70OQt/AlmM8yiMQPkYsV5R
 N5yRKHipx3aj0MMeLkRkNMkrCY5FoYoT9fdr20cuS5cQL+MAUITYlBXPey3Q7KBJPur2
 iBi5epqisR8jPIrH8xQC8nPcWrjJL81hQVKV2uab4b3iS5+R8Tr2W3d5DuJ3b2xQ+PkV
 wc7RlFRxHp5wqDjxSxwvGP4HjcrcZq/iiYhChJI5ZIqHL5N8Uv6R2QYb3mDUBXGQZXER
 rU2LA0vxS2BeHAdoVb+4GWq9asRUzetZyAUUufAeQbsenMwWftvjiiVj59XyIAoHJ5J6
 R6UQ==
X-Gm-Message-State: AOAM5332xalxiFUh6HGjwSRxA8YQKUgRNby52ouAFZjv41r4lo6Gf4Zo
 DCA7rgj9eBxzWFz3oHpcbQ1q4/NFcodP9bvL6vCDHQ==
X-Google-Smtp-Source: ABdhPJwEjUKRlt7/9Vtm0V732JItyLB8ucoLbon6TSCrWXVf40El/VPo4d24LA7VfHXNFRChdTBcy2hmqZ5DTtAE/KY=
X-Received: by 2002:a4a:a685:: with SMTP id f5mr14420256oom.85.1595345447041; 
 Tue, 21 Jul 2020 08:30:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200721133742.2298-1-zhiwei_liu@c-sky.com>
 <CAKmqyKMPrwkxhXgfWqEofGUdKTJ3jAi7hQ7h6hEP-zFDN3Yt9w@mail.gmail.com>
In-Reply-To: <CAKmqyKMPrwkxhXgfWqEofGUdKTJ3jAi7hQ7h6hEP-zFDN3Yt9w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Jul 2020 16:30:35 +0100
Message-ID: <CAFEAcA87pws6QNEoJk4B-+vQiE3Pe7munfJiWgQZuTDZ+uBZwg@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/riscv: Quiet Coverity complains about vamo*
To: Alistair Francis <alistair23@gmail.com>
Cc: LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::c42;
 envelope-from=peter.maydell@linaro.org; helo=mail-oo1-xc42.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Tue, 21 Jul 2020 15:30:51 -0000

On Tue, 21 Jul 2020 at 16:19, Alistair Francis <alistair23@gmail.com> wrote:
>
> On Tue, Jul 21, 2020 at 6:38 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
> >
> > Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Interestingly Coverity's latest scan has decided all these
issues are 'fixed', even without the assert. I guess that the
online version of Coverity has had an improvement to its
checking and so is now able to figure out that it's not going
to overrun the array? Still I think the assert is worth having.

thanks
-- PMM

