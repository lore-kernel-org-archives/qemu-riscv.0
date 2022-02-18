Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nL7LW-00028x-AG
	for mharc-qemu-riscv@gnu.org; Fri, 18 Feb 2022 12:47:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nL7LU-00025M-NE
 for qemu-riscv@nongnu.org; Fri, 18 Feb 2022 12:47:04 -0500
Received: from [2607:f8b0:4864:20::b34] (port=41924
 helo=mail-yb1-xb34.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nL7LS-0007zz-E1
 for qemu-riscv@nongnu.org; Fri, 18 Feb 2022 12:47:04 -0500
Received: by mail-yb1-xb34.google.com with SMTP id j12so20961288ybh.8
 for <qemu-riscv@nongnu.org>; Fri, 18 Feb 2022 09:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BiLrJTo54Uq8rT0eOhIhDRqP3XJVbUzDQSuCjUzi2CA=;
 b=DxGWiKyvj9baFevpdJU60mBiP7ozZAoKqz5tk11ticjR9rpyTql48z9rCJUGDPt+D5
 EIFcolECWvxKRfai83Lg5TULgUZPiqCX4ZSkx26YHPqbsZUMKYU5jJpLNT7k8yoBU7HR
 /W6uePTsObH+Y0fUWgpyuUyY8RuRMFfPQkgmhzq5aRWkfgUKNpTB2jriseTIM8J8diHS
 EGe9KPxpDq+e7Co2Z+eSfc/uHZS1l8U8cgGZtl2SETuIXC0W6yKicUrMZ0Ag3u+1vxdj
 gEy3mFCLKQfJqD8Zaios1dW1EyfeArBcgIRMwEScUf5s+ksHqn+8YEkYZamlPvG11Orq
 8oOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BiLrJTo54Uq8rT0eOhIhDRqP3XJVbUzDQSuCjUzi2CA=;
 b=VAF9veunZ8hTyhy8PTABHVmls6XQdZJ9VSdOOxfy8aTaqm4d4gNQ0uVUc1LYK/L7jW
 +n4+9SOGMuz6umkGu8OKnCRrEz73TUab4UlUpsHYp5O0P+QfY7wxwtoaKorOHKM7gm5u
 C4zBVKuCMCRT38neQWOkfOv7Dn+5Mgb5mukIevHk8sUhIv1Zqv+25JO4RsQ/oELuP+6Z
 Y+en51AGfjyHYJQzfksQoKHe0g00E84+WsGFPEwCa1f6RiRbpkGUCwNfBX/V558eDJso
 kRHD4y9eaAyypHMVlqWMl/UVAKJF0+AKjqnE2FmrnV1ZIxernU7kSvJTpwcl3sCfNkDe
 +NAA==
X-Gm-Message-State: AOAM532nJo/C1qecx5MpH/PIFZkLdh5qpaD7qybJ9L1tUH4pvwr94bq3
 lVG4W3PKXGkK0VwbDUrHNrkMFpTjLqk7gI1amdSlZg==
X-Google-Smtp-Source: ABdhPJzdDvvcy9/WkRvACQs8PxpBNTSX6SYCy2vOBbH03MtTUInVJ29Ag/N5UHA+4IRwH3z59ACO/6DZP6qVJmuiAYU=
X-Received: by 2002:a25:69c4:0:b0:624:4ee4:a142 with SMTP id
 e187-20020a2569c4000000b006244ee4a142mr2421875ybc.85.1645206421306; Fri, 18
 Feb 2022 09:47:01 -0800 (PST)
MIME-Version: 1.0
References: <20220218164646.132112-1-damien.hedde@greensocs.com>
 <20220218164646.132112-2-damien.hedde@greensocs.com>
 <CAFEAcA_xtf-LtvhNqxMEtZs1Z6NePkVKOp6Kh+tN_HZTkFiuTQ@mail.gmail.com>
 <af1de21c-bccf-58f9-4941-e88eca6c1a5c@greensocs.com>
In-Reply-To: <af1de21c-bccf-58f9-4941-e88eca6c1a5c@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Feb 2022 17:46:49 +0000
Message-ID: <CAFEAcA_=ORjLU7_T51Jau6DNh8hM_T+XbKbMuh4QjfC03uH4pw@mail.gmail.com>
Subject: Re: [PATCH 1/5] hw/riscv/riscv_hart: free the harts array when the
 object is finalized
To: Damien Hedde <damien.hedde@greensocs.com>
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <alistair.francis@wdc.com>,
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b34
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb34.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 18 Feb 2022 17:47:04 -0000

On Fri, 18 Feb 2022 at 17:39, Damien Hedde <damien.hedde@greensocs.com> wrote:
> You're right. I was confused when re-writing the message.
> This leaks happen on
> init -> realize-failure -> finalize
> Because the array is allocated, then every cpu is initialized (and an
> error failure may happen for any of them).

"Failure during realize" is one of those cases I don't think we
handle very well. I'd like to see a view by one of our QOM experts
on what the best way to handle this is -- should one do the
cleanup in realize itself, or in instance_finalize? Do the
sub-objects that are being initialized and realized need to
be manually cleaned up in the realize-is-failing case, or is
that part automatic?

Which is to say that maybe this patch is the best way to do this,
but it would be nice to be sure about that...

thanks
-- PMM

