Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p2m5T-0002ql-0Q
	for mharc-qemu-riscv@gnu.org; Tue, 06 Dec 2022 23:31:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p2m5P-0002qN-Hk; Tue, 06 Dec 2022 23:31:13 -0500
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p2m5N-0005Jj-Rt; Tue, 06 Dec 2022 23:31:11 -0500
Received: by mail-vs1-xe2d.google.com with SMTP id t5so16169362vsh.8;
 Tue, 06 Dec 2022 20:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0zxh1DovzUYD3vbtHwGLbQle5lO4Uxz9yI1GeM1F0Hk=;
 b=H89G2FgIiw/WVi16uX4jqv71Udjowu9BZKvCENx853MRcN2R0LTRaK7YZ3xA5n9CWX
 xEjUa8OCtieh6RgRmIZOVHBplPXxXHlIN4hanneTBmOazKcF3SdPERjD96QvpTPSLGjj
 q/qDFgw5MZRD8wNjT3rS9aWp9ftEkdD0+cMeyqiti1NSuNkh+ReaijlAJD3p/IwN2azC
 Q7eZHfjXps4suL5UpsqwHOGqsiFmwcW4mQD8wPwhEMCtTKMCp6r5FAusMgFkdsZphdpc
 Z4NwiuhEkNBT02kkZH4C/ribZzj8diwcaK3WLdJUFyfhlKhhLhSBS56Naa+gyBC2tPkO
 BNSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0zxh1DovzUYD3vbtHwGLbQle5lO4Uxz9yI1GeM1F0Hk=;
 b=B5NVtqPWhyEwJA05Bpkb/X8tYkHLsiXKXljMvFp3NYfzzPLDl+pTUpClAiFTxIOvEC
 7Ko+7l2OwdMBna8UZkAlRsWGlatmeU+50GlBBTi7PjJ6piDy1vYo+KtUGygLF8BBil6X
 CgoBHwzIau24IZVLlCsT+aChH5kwWxo2GRolUu/8skL4Sc10nyJZl/1KOBKuFqLJe/Hr
 sUpVQOVOVqHvj1nFsNybIo0BXfCqlSbstCngT7gbzrnbYoRfY6xPOn6eyheo9YcCshxJ
 +JFnZr0+tZEN3v5c8Go/DYArCK3KN1fuMLwr61xY5zd2qxNA/WFhOV3x0nyJ23zjEs9O
 XoGw==
X-Gm-Message-State: ANoB5pkQVjYG5jKVLXxlhUELS9v7PvT/ENuXFXgb8uADQEOLmQwz4Hs0
 fjpHhifxH8vJYuNvQZMqr3SNF5NiAHx9iJcHWgzNjmh0Xb0=
X-Google-Smtp-Source: AA0mqf77wIo2pjjgzSGEWBGlOSmxg3aQUh7mkk2Feq7nP4n1/s3OznnDEwTxktbqYEPOh98KxbWnnT1nNyKaAXE5IqU=
X-Received: by 2002:a05:6102:302b:b0:3b0:f936:788b with SMTP id
 v11-20020a056102302b00b003b0f936788bmr14067536vsa.54.1670387468165; Tue, 06
 Dec 2022 20:31:08 -0800 (PST)
MIME-Version: 1.0
References: <20221201140811.142123-1-bmeng@tinylab.org>
 <20221201140811.142123-9-bmeng@tinylab.org>
In-Reply-To: <20221201140811.142123-9-bmeng@tinylab.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 7 Dec 2022 14:30:41 +1000
Message-ID: <CAKmqyKO_=Fp9cc8Z4z94zLPjgpOZbNnZzW5BOf42+dRWw2ij7Q@mail.gmail.com>
Subject: Re: [PATCH 09/15] hw/riscv: microchip_pfsoc: Fix the number of
 interrupt sources of PLIC
To: Bin Meng <bmeng@tinylab.org>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2d;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2d.google.com
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
X-List-Received-Date: Wed, 07 Dec 2022 04:31:13 -0000

On Fri, Dec 2, 2022 at 12:11 AM Bin Meng <bmeng@tinylab.org> wrote:
>
> Per chapter 6.5.2 in [1], the number of interupt sources including
> interrupt source 0 should be 187.
>
> [1] PolarFire SoC MSS TRM:
> https://ww1.microchip.com/downloads/aemDocuments/documents/FPGA/ProductDocuments/ReferenceManuals/PolarFire_SoC_FPGA_MSS_Technical_Reference_Manual_VC.pdf
>
> Fixes: 56f6e31e7b7e ("hw/riscv: Initial support for Microchip PolarFire SoC Icicle Kit board")
> Signed-off-by: Bin Meng <bmeng@tinylab.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  include/hw/riscv/microchip_pfsoc.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/hw/riscv/microchip_pfsoc.h b/include/hw/riscv/microchip_pfsoc.h
> index a757b240e0..9720bac2d5 100644
> --- a/include/hw/riscv/microchip_pfsoc.h
> +++ b/include/hw/riscv/microchip_pfsoc.h
> @@ -150,7 +150,7 @@ enum {
>  #define MICROCHIP_PFSOC_MANAGEMENT_CPU_COUNT    1
>  #define MICROCHIP_PFSOC_COMPUTE_CPU_COUNT       4
>
> -#define MICROCHIP_PFSOC_PLIC_NUM_SOURCES        185
> +#define MICROCHIP_PFSOC_PLIC_NUM_SOURCES        187
>  #define MICROCHIP_PFSOC_PLIC_NUM_PRIORITIES     7
>  #define MICROCHIP_PFSOC_PLIC_PRIORITY_BASE      0x04
>  #define MICROCHIP_PFSOC_PLIC_PENDING_BASE       0x1000
> --
> 2.34.1
>
>

