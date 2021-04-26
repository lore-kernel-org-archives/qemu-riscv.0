Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1latt0-0005zS-Pk
	for mharc-qemu-riscv@gnu.org; Mon, 26 Apr 2021 01:34:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1latsz-0005z2-1E; Mon, 26 Apr 2021 01:34:21 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:39701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1latst-000813-LP; Mon, 26 Apr 2021 01:34:20 -0400
Received: by mail-io1-xd36.google.com with SMTP id k25so11744648iob.6;
 Sun, 25 Apr 2021 22:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e1d9KK5A6+4yqiq51W9ir0tnDfaqHmtth897i6IAG0o=;
 b=t+DvE6EcY88aRe3jQjFa7WibGF/0P4H2j6k+Od/2baQoQAfWrTAytyL/lkeYJB2SJg
 e1X67+midD+guQ2q53DISyqLbjbzPBq7n7DdEXT7U2GsbL2+ICVAuQhTUfIgJNZ2BYy6
 WjjKhsr8BrgVk/TFNECzBoxlJyl3MWfdFxoIj16gYuG+ZEXXXfJ/iBFfvmfXzWQYejfA
 mvu1dBpfB+Ojs6PvkPVMqJP8p0oHL+6cZ+ZE4iRL2lduj9IovkLZArhbKOJWnqG/FaOv
 O6WN9BQR9F7t1iC+ENVrdT/EnkdTosodbespoXbZycneGCUGEc73r8EDgq6FFCXeYR/C
 g+eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e1d9KK5A6+4yqiq51W9ir0tnDfaqHmtth897i6IAG0o=;
 b=h/ry24LoLWFxs7PABW1LioVIIyylamRt5Rxjyjd972A04wfSqBjGWADL6w1dFjoxON
 DrvTwZohJb/vN4EATwfQQnd8c6GB75EM4AreIp1DwlIsnuQNK8Mz1n1yst400fnQeWca
 BByLjjnag5J4tpSthqRx1Fll/6f5yOcAxSUKOgZ8CN6IOrK8u7VWeMBDz4znuN2cmgWX
 4LEokDKmyRgCHR6h0UlESZYQLlrqhTxnlBq6j94XimxZ+dU1VsZtDjElrZB+S3zGPkWG
 dLG9tknHXtPxllk81CrEF0lhzhlMcy0YyLI2UxOXJAOK0eKUP0VQaHtiB22YFyiYFlaN
 zdGg==
X-Gm-Message-State: AOAM5304+nCNrXfJ1SzFeaaOhU/xX/PPqeEpHdnjJR7PDpXWjA0Ovy0P
 o9ZQV/wyYBQXNH+6+Ymz6mL0kH0SDSFrtmS1Vvk=
X-Google-Smtp-Source: ABdhPJymt5SGv4OVUv8+8ZimhZr5kybYHPRlbm1C/y0PCg7CyrmpyFwCybNfTaThGcrLM5eZedimgst9zGzQymC18Qg=
X-Received: by 2002:a5d:878e:: with SMTP id f14mr12934721ion.176.1619415253094; 
 Sun, 25 Apr 2021 22:34:13 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1619234854.git.alistair.francis@wdc.com>
 <db709360e2be47d2f9c6483ab973fe4791aefa77.1619234854.git.alistair.francis@wdc.com>
 <2ea910ea-690a-bdac-bcdf-436bbe28964e@linaro.org>
 <CAKmqyKP5tuddPKiSOt1V6YyDjV+9VAM2vU=F1BvLgwXWHm=VKg@mail.gmail.com>
 <13a345dc-4143-339e-1c7c-5f9a1cd7eac3@linaro.org>
In-Reply-To: <13a345dc-4143-339e-1c7c-5f9a1cd7eac3@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 26 Apr 2021 15:33:46 +1000
Message-ID: <CAKmqyKMScfXi1h4FyknrKx=LzmrFO5s5b40a+zvF3O6UYfDb6g@mail.gmail.com>
Subject: Re: [PATCH v3 08/10] target/riscv: Consolidate RV32/64 32-bit
 instructions
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bmeng.cn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd36.google.com
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
X-List-Received-Date: Mon, 26 Apr 2021 05:34:21 -0000

On Mon, Apr 26, 2021 at 9:53 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 4/25/21 3:58 PM, Alistair Francis wrote:
> > On Sun, Apr 25, 2021 at 3:08 AM Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> On 4/23/21 8:34 PM, Alistair Francis wrote:
> >>> --- a/target/riscv/translate.c
> >>> +++ b/target/riscv/translate.c
> >>> @@ -74,8 +74,6 @@ static inline bool has_ext(DisasContext *ctx, uint32_t ext)
> >>>
> >>>    #ifdef TARGET_RISCV32
> >>>    # define is_32bit(ctx)  true
> >>> -#elif defined(CONFIG_USER_ONLY)
> >>> -# define is_32bit(ctx)  false
> >>>    #else
> >>>    static inline bool is_32bit(DisasContext *ctx)
> >>>    {
> >>
> >> Rebase error?
> >
> > This is required to avoid warnings/errors before this commit as
> > `is_32bit()` isn't called until this patch.
>
> If !defined(TARGET_RISCV32) && defined(CONFIG_USER_ONLY), then is_32bit *is*
> false.  This isn't system mode and it can't be changed.

Ah ok. I have reverted this removal then.

Alistair

>
>
> r~

