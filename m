Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1onTUz-0008Fu-H4
	for mharc-qemu-riscv@gnu.org; Tue, 25 Oct 2022 19:38:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1onTUw-0008EO-8M; Tue, 25 Oct 2022 19:38:18 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1onTUu-0001IE-6J; Tue, 25 Oct 2022 19:38:17 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 m6-20020a17090a5a4600b00212f8dffec9so562530pji.0; 
 Tue, 25 Oct 2022 16:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/eH2094a61xp2ZKeBbfDM1XFXtuTt9DlJsfA+u/YX0Q=;
 b=hSoLzVPHG4f28ieob8wKYb4uo6/DFzaLmh/R/w2dP9Q4oAcw7CliWYxEedbSD6aA6G
 HM/4GAIEiZz/xdVKzgbu+eAJUEdylJW4dQy3nkiiUraDFwS/Eqh68OYlQ3d24zbHyHDa
 9NElP9crdVLKYDtfYNOnDhW+ohy/Nw08C7fmgNXdH6L7VrDLwG6NJgixLtejPCvnQlIP
 RVWm1ctkXnfo5RLB33tXV37/YJGej0t+LtR1BxUIp5x1UQstL+j5DxlmUoOY9y44Fxkl
 P5z/bOq5uiMy+EpeNu9qZJlrY05oSg08Ewck+9O2Vm7s5yluh0BVu/atrAVUtKPzkfyk
 6n4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/eH2094a61xp2ZKeBbfDM1XFXtuTt9DlJsfA+u/YX0Q=;
 b=hWYKUO2PWVZLCacB23GKqE6w2l7Sejc9NkSxSEgrv8W4zKr4FVxZKNBMDCaCwxPVQ/
 Ua3czMkDILNFL5pfVNQfuBuSq152G41lBZvdwPbqGTcJjvKGHU74nmZtwUEw9xsEasVH
 j1T72OxWpZuvhiSokht1NiKseDvMXZV1IEAWMtmf77SYGBZdhLS3wNwkguMeJVhTv451
 6DZzGlk398EOTwJswrxA/1kIVQ5PmwYoUzFe23u/jSpSUtHaxT0/+wB7MTb/rsKsAFHR
 /3uVweCVusSNvqtzwtsqhwdjNlZkBr7/FGjzNSU0bEsmx8wwcfqf9QYXN4i9Da1uRuns
 HEJQ==
X-Gm-Message-State: ACrzQf3+PLfIzVG43QskpHuPSXqKki/xNZAm5G6+vpOkKBGHDasPHDQv
 NvarErB9NniA4t11Z11JnewrhYdz5vdZI/P+CaQ=
X-Google-Smtp-Source: AMsMyM6UsgtLzxuhD2PDeFLDH33jcXXeOzdSnTlkzEOHz87vdfOyPMPseFu54OdTYswK2xNkEX3cQV1vCz0uJK+otXs=
X-Received: by 2002:a17:90b:314a:b0:20d:904b:18a8 with SMTP id
 ip10-20020a17090b314a00b0020d904b18a8mr912973pjb.96.1666741094404; Tue, 25
 Oct 2022 16:38:14 -0700 (PDT)
MIME-Version: 1.0
References: <20221025043335.339815-1-wilfred.mallawa@opensource.wdc.com>
In-Reply-To: <20221025043335.339815-1-wilfred.mallawa@opensource.wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 26 Oct 2022 09:37:47 +1000
Message-ID: <CAKmqyKMpiGeq5iomRrKMNU_Edh1p+JXgokq7wAuOQNX3Yr-Fbg@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] hw/riscv/opentitan: bump opentitan version
To: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com, 
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Wilfred Mallawa <wilfred.mallawa@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Tue, 25 Oct 2022 23:38:18 -0000

On Tue, Oct 25, 2022 at 2:36 PM Wilfred Mallawa
<wilfred.mallawa@opensource.wdc.com> wrote:
>
> From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
>
> This patch provides updates to the OpenTitan model to bump to RTL
> version <d072ac505f82152678d6e04be95c72b728a347b8>.
>
> A unique change here is the merger of hwip `padctrl` into `pinmux`, to
> reflect this change, any references to `padctrl` are removed.
> Additionally, an unimplemented device for `aon_timer` is added and IRQ
> numbers are updated.
>
> Patch was tested by running the latest master of
> TockOS as of this patch.
>
> Changelog V1:
>   - Added a comment specifying what
> git SHA of OT we are targeting in [1/2].
>
> Wilfred Mallawa (2):
>   hw/riscv/opentitan: bump opentitan
>   hw/riscv/opentitan: add aon_timer base unimpl

Thanks!

Applied to riscv-to-apply.next

For future patches, versioning starts at v1 (which can just be
[PATCH]) and then goes to v2 ([PATCH v2])

Alistair

>
>  hw/riscv/opentitan.c         | 24 ++++++++++++++++--------
>  include/hw/riscv/opentitan.h | 10 +++++-----
>  2 files changed, 21 insertions(+), 13 deletions(-)
>
> --
> 2.37.3
>
>

