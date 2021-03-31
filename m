Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lRafN-0003vI-2Q
	for mharc-qemu-riscv@gnu.org; Wed, 31 Mar 2021 09:13:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lRafL-0003uW-HE; Wed, 31 Mar 2021 09:13:47 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:50824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lRafK-0002qx-03; Wed, 31 Mar 2021 09:13:47 -0400
Received: by mail-wm1-x32a.google.com with SMTP id g25so10179292wmh.0;
 Wed, 31 Mar 2021 06:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2imILVcWDhiWtLMyZB9g3JpmaqOWwGDkSEShu4U5JT0=;
 b=TkVpzMEdBkT0lZ456GlW7Xkm4iVez3wlB4axs37OBJ6hg8IggasKV6/iYc2LQlxFA+
 pAAGhP6Ga6/aNsU7poXMo/yIKgrOvCLn+IQ71dA6QX5BRY/fKK+MNoWaS+NnPEQd9817
 U3yXEtpH+sze2/5Zfs+XxboWa1oFqp4DFrD59+xViXXT8EnkNj1PpUbbkTWWYJa55fIu
 BOjWgNeBR2RlZGJN+hgzgV+LmM2XCX6g4nBJ9XoZno1AkSqU/eVurk+UrKCdfiJUpNQo
 eaGF0UxQUS3zo/qw66Rld49CiMIKh0MVTPGIUh0gGAazKCzsuuTHd4B7xb7mVMbvC2gu
 j6Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2imILVcWDhiWtLMyZB9g3JpmaqOWwGDkSEShu4U5JT0=;
 b=fLwc8o03jQXBDy07NNVdf5c/EWV9+gOv+BY+Q4ej1c8/qrin3iRasXloxItOrj98tM
 DFvcWDY8H4dHcGmvk3sf5iAIc5S0aNZ7dN1QKz2xC8087eD6/qEejrOWH2a7yfAApKDW
 Bk3XEMXEvrw8egL3QEBrZDy5KF9PUNAsYXVIkvliGX2czQpNYPAAlII0qv3SOoQ6pBsG
 JiAqr8qsR8xXqYgRqDXcMzQPJS+ULVPAK/PXpb6mWBdlOZ6n1VJjlUFZbIXGZVnfOpIm
 g//jEVMN2YYnXuc3l9nwKQVva6Y8RmMcWYGb1uH0le0GbCQkMCozrp3sIrEqZilm2BN/
 Vx3Q==
X-Gm-Message-State: AOAM533x+ChcY3Wo2bXycWpNqpGgDSZnOMJycXxBR6COPtAL+wiEgdJM
 U0D1xCKdd7ZYu0acGFtuklQ=
X-Google-Smtp-Source: ABdhPJzxbTjQO8IT0O2lwZq9fHL7mVaKa1tB8U2bZYT7dSSCOjIgOXvf0yAc199bKLSXczw1qZqukg==
X-Received: by 2002:a7b:c186:: with SMTP id y6mr3238175wmi.84.1617196424086;
 Wed, 31 Mar 2021 06:13:44 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id u8sm4764708wrr.42.2021.03.31.06.13.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Mar 2021 06:13:43 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH] hw/riscv: sifive_e: Add 'const' to sifive_e_memmap[]
To: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis
 <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Emmanuel Blot <eblot.ml@gmail.com>
References: <20210331103612.654261-1-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d107d524-db19-72d0-bcee-b741c6fcc4da@amsat.org>
Date: Wed, 31 Mar 2021 15:13:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210331103612.654261-1-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 31 Mar 2021 13:13:47 -0000

On 3/31/21 12:36 PM, Bin Meng wrote:
> This was accidentally dropped before. Add it back.
> 

Fixes: 732612856a8 ("hw/riscv: Drop 'struct MemmapEntry'")

> Reported-by: Emmanuel Blot <eblot.ml@gmail.com>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
> 
>  hw/riscv/sifive_e.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
> index f939bcf9ea..82096b3e5a 100644
> --- a/hw/riscv/sifive_e.c
> +++ b/hw/riscv/sifive_e.c
> @@ -50,7 +50,7 @@
>  #include "sysemu/sysemu.h"
>  #include "exec/address-spaces.h"
>  
> -static MemMapEntry sifive_e_memmap[] = {
> +static const MemMapEntry sifive_e_memmap[] = {
>      [SIFIVE_E_DEV_DEBUG] =    {        0x0,     0x1000 },
>      [SIFIVE_E_DEV_MROM] =     {     0x1000,     0x2000 },
>      [SIFIVE_E_DEV_OTP] =      {    0x20000,     0x2000 },
> 


