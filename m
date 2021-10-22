Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mduzw-0002TG-3Q
	for mharc-qemu-riscv@gnu.org; Fri, 22 Oct 2021 09:54:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mduzc-0002Pw-E5; Fri, 22 Oct 2021 09:54:03 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:43672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mduza-00065a-9S; Fri, 22 Oct 2021 09:53:56 -0400
Received: by mail-yb1-xb34.google.com with SMTP id r184so7072763ybc.10;
 Fri, 22 Oct 2021 06:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SZ5ShOTi6MSqEUUSkRWJ6Lt3JbpYKaiBlGvax+LUzAc=;
 b=poW4iXeUDLk4hid2smDPaUXzCUUX/VikOvpXlOLF1tbC07WI0VHq0T6U2OtDUfvQvx
 OnZk5n/NY0M73yDnmzHuQeVgbb0swo7d0Vq6bqGWFY7ge2iEFjJKITNhiTxymraJKVEa
 KX2zVlp9ME0aqokz+w2rD7B8b+wBEqDZbcafcojijSiN3gZQ065X5p/RWvgZPvzNFGHN
 EJjXclHdHvfpgMWFyUOyF6VWjiWNlEfTtnqYMR/2fCKMYBPnvrVYprg58GvCZCa/a0q8
 VDcOrdvmI2v/gQoJZOn0GlTOd/D7dF92wDUuJjByf3/gNtMczrjAAYJNcA0a9lYkh+tk
 7f3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SZ5ShOTi6MSqEUUSkRWJ6Lt3JbpYKaiBlGvax+LUzAc=;
 b=jGfwhyNkcDj573F5ilE/h1L26ehcv1/MAyoDdkEt31Y0XREKIeovKFQF6oBgH3/Xv0
 llNiaYN2hEHzMDw6ehaHb51hb2MOqCFWvI/JGso8Cr4TUWGwlTiCE5qqUSV1v1ZJqcWb
 r0Z5n8x9RFMSPluYQPSrNUchfUh5SreUsjBCRV3+Jecb84V9lyncnWChZA329v5SiBH8
 UB+RTcRu6qgAzQiEQxLt0wOW0sRfb/WEL3tbc4khjvYoQemLVYSGLMzgtUF2Jn3T5qIm
 0++JshmuqPa1QKSg/sAsp8amN2q3AZjpFtCQcao+xAmwfOwxDT8eyTom7c0TldzfC2xh
 654g==
X-Gm-Message-State: AOAM531TVpx85XGzCFcpba6ho1xe+ylOTle8RMlvk+4ikh0pJ/ODTUg3
 cJyfzOurEgyvEMtQpAbT0x2vX59UJG0jLdq8LOo=
X-Google-Smtp-Source: ABdhPJzoCE8LOd1KjPS3f+ncoFTGfUjo97TrYbNqnKFYQsySLFTcz8W0Wso1IMTaVIuUF1U6E63PsG32UV45nB43/ac=
X-Received: by 2002:a25:3843:: with SMTP id f64mr13029637yba.313.1634910833110; 
 Fri, 22 Oct 2021 06:53:53 -0700 (PDT)
MIME-Version: 1.0
References: <20211022060133.3045020-1-alistair.francis@opensource.wdc.com>
 <20211022060133.3045020-2-alistair.francis@opensource.wdc.com>
In-Reply-To: <20211022060133.3045020-2-alistair.francis@opensource.wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 22 Oct 2021 21:53:42 +0800
Message-ID: <CAEUhbmXaeqbe+tAxomaPK8a+F3RvQ-hJN_66UoTQ6xmd7G_fag@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] hw/riscv: boot: Add a PLIC config string function
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair23@gmail.com>, Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Fri, 22 Oct 2021 13:54:03 -0000

On Fri, Oct 22, 2021 at 2:01 PM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> Add a generic function that can create the PLIC strings.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  include/hw/riscv/boot.h |  2 ++
>  hw/riscv/boot.c         | 25 +++++++++++++++++++++++++
>  2 files changed, 27 insertions(+)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

