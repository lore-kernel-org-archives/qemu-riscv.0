Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nMGNr-0006fS-Uk
	for mharc-qemu-riscv@gnu.org; Mon, 21 Feb 2022 16:38:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nMGNq-0006em-LB; Mon, 21 Feb 2022 16:38:14 -0500
Received: from [2607:f8b0:4864:20::d36] (port=36358
 helo=mail-io1-xd36.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nMGNp-00088m-0r; Mon, 21 Feb 2022 16:38:14 -0500
Received: by mail-io1-xd36.google.com with SMTP id r7so12247456iot.3;
 Mon, 21 Feb 2022 13:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eYKYRqL/vIcm48gHi//eOgYYvA5rQgBBsV49gSdxmsU=;
 b=Vpfy/lLT38nXlKgEFiPad+4Q8cXxA4nkT6ujEyI8Nd5OKzpHWyf5VknWmW9DLoPqMd
 13/L7hMO9UirALlVx8NLAJjMkOKmOPMujal0mWgrZM5cbvt1cDfa7BZSK0kOpSIkVVF7
 2lZuu/0vaIdptRNfQsdPWiJB8QZgVO6FQKQHH6/pNpOk+b4PjE85yWJAF281zVju1eEo
 VhtQLCLaSqUqOW5PTC02uBd5rXu8pst9yDdrvyT8OhRZAxOTLQ7BPdjKoKTQPJRMbY0F
 GIpsIlCqBTzCoDYf7drVUYByWXaPGjstznYMPHrlKc2MhHNFYy7V9Xs309GeDMk4QKeO
 /gRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eYKYRqL/vIcm48gHi//eOgYYvA5rQgBBsV49gSdxmsU=;
 b=KogYwbUZg9YjpS7d1Fmyhg/YNhtGKouzwKK/lU4nclVcl3yZ/yyQ4svfQ/4vGpCIyh
 HzgVf9SYYEfwACv8arsOkIPxDUzJCOsJ8oucBrxkclqo/MCUTX0PUTXhEZFJIDQaQPfn
 BswIs2PVOR4setMy51OhMeZft9s3P0gdihnlJcuvMeo6ftbPwyAORON4Azwcs4IJt2lF
 CuqpNLRhmIQHNtBos+bavqO8+JsWkLDQItmcm3N7WVa+cZgAhj745QXktoFCWCuhit1X
 wmECPVmXBNT26MD6f5YMrdaNq8zyHCrKCOgC2OcEDrutEjgMpfwN+l02m67gf1BgCrDf
 FUEg==
X-Gm-Message-State: AOAM531FGfUp1RgfXwopcI58CxWbXYKHta7Rxrub+a2sjLby9qJ+1Fup
 EHLhn8zreerxYnUQs7x8GlL1X0WmZQWg6KhXeWs=
X-Google-Smtp-Source: ABdhPJyN+osDoNPkKyYInUFXfNWHIgjMVEQikkrZKsvgdxepuNJIuusS2OXnYXJ9v0MGj4Aa5jFL9lRDz0AtxehaKxI=
X-Received: by 2002:a05:6638:25b:b0:314:21b0:fb61 with SMTP id
 w27-20020a056638025b00b0031421b0fb61mr16476964jaq.66.1645479491748; Mon, 21
 Feb 2022 13:38:11 -0800 (PST)
MIME-Version: 1.0
References: <20220206091835.1244296-1-atishp@rivosinc.com>
 <20220206091835.1244296-2-atishp@rivosinc.com>
In-Reply-To: <20220206091835.1244296-2-atishp@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 22 Feb 2022 07:37:45 +1000
Message-ID: <CAKmqyKP5vBUZgpErXoJfWbAy5TD=mHZvFsNpkPiGwQR7S+SWnQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] target/riscv: Define simpler privileged spec
 version numbering
To: Atish Patra <atishp@rivosinc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d36
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd36.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 21 Feb 2022 21:38:15 -0000

On Sun, Feb 6, 2022 at 7:26 PM Atish Patra <atishp@rivosinc.com> wrote:
>
> Currently, the privileged specification version are defined in
> a complex manner for no benefit.
>
> Simplify it by changing it to a simple enum based on.
>
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.h | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 9d24d678e98a..e5ff4c134c86 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -82,8 +82,11 @@ enum {
>      RISCV_FEATURE_AIA
>  };
>
> -#define PRIV_VERSION_1_10_0 0x00011000
> -#define PRIV_VERSION_1_11_0 0x00011100
> +/* Privileged specification version */
> +enum {
> +    PRIV_VERSION_1_10_0 = 0,
> +    PRIV_VERSION_1_11_0,
> +};
>
>  #define VEXT_VERSION_1_00_0 0x00010000
>
> --
> 2.30.2
>
>

