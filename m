Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l1u0G-0000EL-42
	for mharc-qemu-riscv@gnu.org; Tue, 19 Jan 2021 11:37:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l1u0B-00009f-8Z; Tue, 19 Jan 2021 11:37:08 -0500
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:34407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l1u08-0007ei-Ro; Tue, 19 Jan 2021 11:37:06 -0500
Received: by mail-io1-xd32.google.com with SMTP id u17so40862221iow.1;
 Tue, 19 Jan 2021 08:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gsjRYwfGdghN2DKYlUIHWegNlgsR76pHPsztQrvMAoQ=;
 b=QRDUNXj1GkWjteMavwV6ae43LQCGQ7xTjriihO+mDEGj9z5OXCzqUEUFkAZy6DBGsZ
 gasgaT1rYXwuyrw3whs6z0NCe+Qa4jk0uY9Ez0CPkwzV4hdJssQnx7mhv0y6pv84Ed8w
 ho3KwBrTe+o9n8wr1SbsOxgqusgvMmnAolWnnK+iobjllhYjfvHHv2d5aiVN/8+CxXin
 c9TjSXXp0CCPXNaR0J2LPHSacKxbCaoo62hXJjlpyCPSIk/MtSAd5G91g+P/11aYbQfK
 c1jo3zv/bEVjgIr8yaRleRfDE2p05FZNBz1TYNVIZR1WinyPcXWJBCGwVpbvAeTs5mZN
 lMTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gsjRYwfGdghN2DKYlUIHWegNlgsR76pHPsztQrvMAoQ=;
 b=AZiXwz3jlRAZDUhnLytdj0K2K6jswPRQ6LYxQl0bUyi8C+TOAZW/sKjTqa38NYja2O
 sL5nk404fPo4oHniqJHkiT1/y8aR7X+VRjCjq1t2vCsAimfozEOx9YYloQelaoDrn8VY
 kk7r+AaOwLEHKwdwBAeM872rjPKpM7rXFrsxyhZjYgFiG0WtAzRL1AfhtCuBzIRN6U+d
 m2faEqFS5Owb5kzqCLia4ldJYJnAOvGKYE7p+v5J714BzAS/QJakiSNTHYpqTb+Zyb1u
 AHRCxJBNIf3RoGuMmOtoK9Epjxo5j+EG6rz8M1YTCfevYlPdzPg3y3+UDxNtG/I4ENxM
 saAQ==
X-Gm-Message-State: AOAM532lJUdcAxJ3OPuJ3DlZR9g5dyQ5lhp/lsbLtc2lqBnuk6j4GOvy
 ZGSyVqjXLbHG9EeFfqFA9Ed/B7s+3RopmNYiW1w=
X-Google-Smtp-Source: ABdhPJypgMRhdZOU2st8Dw3NDeZ+v4YvDyaZHKb1x9sabbz/qqFy/w60cReEBQILhwA8Bj2iodBQcitF7Fiy93O646E=
X-Received: by 2002:a02:2544:: with SMTP id g65mr4111769jag.91.1611074223478; 
 Tue, 19 Jan 2021 08:37:03 -0800 (PST)
MIME-Version: 1.0
References: <20210112093950.17530-1-frank.chang@sifive.com>
 <20210112093950.17530-5-frank.chang@sifive.com>
In-Reply-To: <20210112093950.17530-5-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 19 Jan 2021 08:36:37 -0800
Message-ID: <CAKmqyKOsn+vSRxWQYkHkST53F7G_sNR=3YAdT-QdF4M4DGY+mQ@mail.gmail.com>
Subject: Re: [PATCH v6 04/72] target/riscv: rvv-1.0: add sstatus VS field
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d32;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd32.google.com
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
X-List-Received-Date: Tue, 19 Jan 2021 16:37:09 -0000

On Tue, Jan 12, 2021 at 1:51 AM <frank.chang@sifive.com> wrote:
>
> From: LIU Zhiwei <zhiwei_liu@c-sky.com>
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu_bits.h | 1 +
>  target/riscv/csr.c      | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 82c48b7b9be..8edf81692e6 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -414,6 +414,7 @@
>  #define SSTATUS_UPIE        0x00000010
>  #define SSTATUS_SPIE        0x00000020
>  #define SSTATUS_SPP         0x00000100
> +#define SSTATUS_VS          0x00000600
>  #define SSTATUS_FS          0x00006000
>  #define SSTATUS_XS          0x00018000
>  #define SSTATUS_PUM         0x00040000 /* until: priv-1.9.1 */
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 50862df9e82..a70a78386da 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -448,7 +448,7 @@ static const target_ulong delegable_excps =
>      (1ULL << (RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT));
>  static const target_ulong sstatus_v1_10_mask = SSTATUS_SIE | SSTATUS_SPIE |
>      SSTATUS_UIE | SSTATUS_UPIE | SSTATUS_SPP | SSTATUS_FS | SSTATUS_XS |
> -    SSTATUS_SUM | SSTATUS_MXR | SSTATUS_SD;
> +    SSTATUS_SUM | SSTATUS_MXR | SSTATUS_SD | SSTATUS_VS;
>  static const target_ulong sip_writable_mask = SIP_SSIP | MIP_USIP | MIP_UEIP;
>  static const target_ulong hip_writable_mask = MIP_VSSIP | MIP_VSTIP | MIP_VSEIP;
>  static const target_ulong vsip_writable_mask = MIP_VSSIP;
> --
> 2.17.1
>
>

