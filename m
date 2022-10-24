Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1omo7b-0008Dg-3P
	for mharc-qemu-riscv@gnu.org; Sun, 23 Oct 2022 23:27:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1omo7W-00083L-7A; Sun, 23 Oct 2022 23:27:22 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1omo7U-0001t2-K7; Sun, 23 Oct 2022 23:27:21 -0400
Received: by mail-pg1-x530.google.com with SMTP id s196so7684010pgs.3;
 Sun, 23 Oct 2022 20:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IhU68T7agwgraIc4LW22Ga9zMClSUDXVB/0nz9E9o1U=;
 b=OxyW6d9VLP5471ymPjmEe3w0ZHJqi2uqGppk8/56lKiFf83J1LXCntNd3Dzh54Ex+D
 JhFnOrndnDtIM6/78HsZmQibMbVKlh6BFZ7NmwaNH+BJfgJqagbg5u5g3s2y6sW+zYiw
 ZiZcnqlXT69w1LGTLLyczplxwZm86k9eSwInv/u0CxFSYnZjJ3mJSfhTqQKFfuxfeQbZ
 +Xx7HI5MYHNuuoDNDIoBduaAZOV5p3G4f8OAIEzNAn4UvPN6+39f9kPWzEw+jb28XXVK
 ShEZXMVk0sC5dXkqwAjXyR1G2mVpZBlj7mvJXrLx3ShzrVFyCFeyWLDDr3QoJaE6dqLU
 Y56Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IhU68T7agwgraIc4LW22Ga9zMClSUDXVB/0nz9E9o1U=;
 b=7WiZIUV5HwdruBwbyT8Axor58lze8f6KMYqE0UrgSyXMZFkA9FZKwAkofNNV5DRtB6
 n5OTqK+lNfzeKyLA4fl7UdLnmj6t7Ft524cEHowNswKmvCjCSBBChokPTGNlpk5nmMhz
 UuTrifFIieub9zXm+scBuXSFoqlbkzAGshMui4zlWteNSq7tU8uCBB4jGEDOFifb5ptL
 HI20hycnt3wjCezhkziUBc4Kg0X19APEcBC7P+41Ix7fagSQd/rL2t6P+Oo3A2WI9/j/
 pqADBQL8eKDe0dW6gGBmuR3VbXsqjGs7fw9McosWv8sxllYdfyjeM6vmloXLq6/jE82u
 FA6Q==
X-Gm-Message-State: ACrzQf2pdEd85nWctjRi1PtKKuOHHMDSXNoaMCk3klyPI2cAbAI2DI9E
 Q4FBxZOqok/m0yo3u3e+lxyJjRxzkZCjFlcfH1Kd+VqchATn+A==
X-Google-Smtp-Source: AMsMyM6/yyCdmpvD8TwcAs/US4FpN4Er0m5my/NhWnYhHdAnwEvV0h9scGqhkoX4uhETFMRfEn8089I6iwDnb6dvXG4=
X-Received: by 2002:a63:ce43:0:b0:45b:d6ed:6c2 with SMTP id
 r3-20020a63ce43000000b0045bd6ed06c2mr26337068pgi.406.1666582038913; Sun, 23
 Oct 2022 20:27:18 -0700 (PDT)
MIME-Version: 1.0
References: <20221017054950.317584-1-wilfred.mallawa@opensource.wdc.com>
 <20221017054950.317584-2-wilfred.mallawa@opensource.wdc.com>
In-Reply-To: <20221017054950.317584-2-wilfred.mallawa@opensource.wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 24 Oct 2022 13:26:52 +1000
Message-ID: <CAKmqyKMYrRSDvmKG1Kz1AAMPWyE93PkKD8hFpA7HpD9kjm=fsg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] hw/registerfields: add `FIELDx_1CLEAR()` macro
To: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
Cc: alistair@alistair23.me, qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Wilfred Mallawa <wilfred.mallawa@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x530.google.com
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
X-List-Received-Date: Mon, 24 Oct 2022 03:27:24 -0000

On Mon, Oct 17, 2022 at 3:59 PM Wilfred Mallawa
<wilfred.mallawa@opensource.wdc.com> wrote:
>
> From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
>
> Adds a helper macro that implements the register `w1c`
> functionality.
>
> Ex:
>   uint32_t data = FIELD32_1CLEAR(val, REG, FIELD);
>
> If ANY bits of the specified `FIELD` is set
> then the respective field is cleared and returned to `data`.
>
> If the field is cleared (0), then no change and
> val is returned.
>
> Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/hw/registerfields.h | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/include/hw/registerfields.h b/include/hw/registerfields.h
> index 1330ca77de..0b8404c2f7 100644
> --- a/include/hw/registerfields.h
> +++ b/include/hw/registerfields.h
> @@ -115,6 +115,28 @@
>                    R_ ## reg ## _ ## field ## _LENGTH, _v.v);              \
>      _d; })
>
> +/*
> + * Clear the specified field in storage if
> + * any field bits are set, else no changes made. Implements
> + * single/multi-bit `w1c`
> + *
> + */
> +#define FIELD8_1CLEAR(storage, reg, field)                                \
> +    (FIELD_EX8(storage, reg, field) ?                                     \
> +    FIELD_DP8(storage, reg, field, 0x00) : storage)
> +
> +#define FIELD16_1CLEAR(storage, reg, field)                               \
> +    (FIELD_EX16(storage, reg, field) ?                                    \
> +    FIELD_DP16(storage, reg, field, 0x00) : storage)
> +
> +#define FIELD32_1CLEAR(storage, reg, field)                               \
> +    (FIELD_EX32(storage, reg, field) ?                                    \
> +    FIELD_DP32(storage, reg, field, 0x00) : storage)
> +
> +#define FIELD64_1CLEAR(storage, reg, field)                               \
> +    (FIELD_EX64(storage, reg, field) ?                                    \
> +    FIELD_DP64(storage, reg, field, 0x00) : storage)
> +
>  #define FIELD_SDP8(storage, reg, field, val) ({                           \
>      struct {                                                              \
>          signed int v:R_ ## reg ## _ ## field ## _LENGTH;                  \
> --
> 2.37.3
>
>

