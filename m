Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mN7Gg-00073s-3c
	for mharc-qemu-riscv@gnu.org; Mon, 06 Sep 2021 01:34:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mN7Gd-0006xu-Lp; Mon, 06 Sep 2021 01:34:03 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:38417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mN7Gc-00024q-3k; Mon, 06 Sep 2021 01:34:03 -0400
Received: by mail-io1-xd30.google.com with SMTP id a13so7233716iol.5;
 Sun, 05 Sep 2021 22:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yU8Xvlh1pBP/EXy8vrt075uOYV6VUj8mMUr38FpIECI=;
 b=OEebZj2Zw64CoW7ebv5MGju25tS+N/4xXWFc0nHTtZWWeh3y+mfl5/RkDJWuYhv9S3
 nUh9syqOCIJGQRzVB21ZJC090+9oliMo9yeoS37pNlOW8LW7Ns+9EgPL89Ua4I+hDpoc
 hLIXYquywav2IrtJvZMf1ofhTlwaGRjhv6X4CUgEcFMqvEFzp5MEm5T8oXzq8m5t6WMa
 8k/HTMBpzHQVy3OJvnIXuJhuLCVzv6PDzBM2dWryqA+LoI5zNxwQua1eQe4neZsNJjz/
 q8JMWiFU6mfdHjo1hHr++MBbiTDdN74XwGUv2W4k706UrLFie0zuh3rCTRrJFhmv1qC5
 Nm9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yU8Xvlh1pBP/EXy8vrt075uOYV6VUj8mMUr38FpIECI=;
 b=b0KU68PW9nseQoIbeoI5i17LLTHBe2WcZaOHzage/mcgi7vYUPpjQMnJM2MSGWlb3y
 NLpXR8fCsSKE506x601FN+drslXG+81oyBJVO/WLB1BU1I6OCD1zmkLMqsn10YMhSYVR
 qAn+VYANTkwOGbASqjcWhAdgzY8S1OrukjLvaxBzPadp6LyxchuRfyzKNrtEq0gWLVsw
 7stgsVJ+gl2AwSDw3sMzNNOuGgE8gK45/noAYli+EvH2kRvGFqwJn14f20rmm0fcXsQC
 33bI0/pOceivCY8siRUDex56wOEAUixi3byQcDldIDbWFzalPVv/B+dJTh2xsHNFulKZ
 2I8A==
X-Gm-Message-State: AOAM530Hq4iMG47wN3p+YDMOp4TmkT4nPXWxpeDT79xfJpVHBJ6SQic1
 BcEhr7xoiBPzt3pnzRrEgprblY234Wc2oc/p/UJE5D6lZh3hlA==
X-Google-Smtp-Source: ABdhPJzj0aIwa58r4FVzRoDVccCtioDbynmD+DYA+ErTykJkPDGoCL+wUtVqYuteQJO6hE26TdYu+d/Ov4vFNJL9QkI=
X-Received: by 2002:a6b:2b43:: with SMTP id r64mr8291050ior.187.1630906439828; 
 Sun, 05 Sep 2021 22:33:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210902112520.475901-1-anup.patel@wdc.com>
 <20210902112520.475901-7-anup.patel@wdc.com>
In-Reply-To: <20210902112520.475901-7-anup.patel@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Sep 2021 15:33:33 +1000
Message-ID: <CAKmqyKPyErqG2JrOhbQFxPzS-kOe7_b7BwdoqAjF1t5YBGvSZQ@mail.gmail.com>
Subject: Re: [PATCH v2 06/22] target/riscv: Add AIA cpu feature
To: Anup Patel <anup.patel@wdc.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Atish Patra <atish.patra@wdc.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Anup Patel <anup@brainfault.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d30;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd30.google.com
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
X-List-Received-Date: Mon, 06 Sep 2021 05:34:03 -0000

On Thu, Sep 2, 2021 at 9:52 PM Anup Patel <anup.patel@wdc.com> wrote:
>
> We define a CPU feature for AIA CSR support in RISC-V CPUs which
> can be set by machine/device emulation. The RISC-V CSR emulation
> will also check this feature for emulating AIA CSRs.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 6fe1cc67e5..2cde2df7be 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -77,7 +77,8 @@ enum {
>      RISCV_FEATURE_MMU,
>      RISCV_FEATURE_PMP,
>      RISCV_FEATURE_EPMP,
> -    RISCV_FEATURE_MISA
> +    RISCV_FEATURE_MISA,
> +    RISCV_FEATURE_AIA
>  };
>
>  #define PRIV_VERSION_1_10_0 0x00011000
> --
> 2.25.1
>
>

