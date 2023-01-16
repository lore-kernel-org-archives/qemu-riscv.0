Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pHOkD-0005zo-U3
	for mharc-qemu-riscv@gnu.org; Mon, 16 Jan 2023 07:37:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHOk1-0005yj-JO
 for qemu-riscv@nongnu.org; Mon, 16 Jan 2023 07:37:41 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHOjz-0004xD-F9
 for qemu-riscv@nongnu.org; Mon, 16 Jan 2023 07:37:33 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 m26-20020a05600c3b1a00b003d9811fcaafso22043135wms.5
 for <qemu-riscv@nongnu.org>; Mon, 16 Jan 2023 04:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eW47mY/OYRqu0mDu9CrLv3LzjR+rtZK9WzKcoeZW9fg=;
 b=H6qNlLQ5aJ2XdZjdBD8wQzCtxiSPSlSLHU6VPCBmnWf6w0BBY+yxCC5rv1HKogp0oW
 hYQZKyKelkhdyjprAOdUzUe/HgJWgJqmYKbQEaddBNQt2VUzih9OUSeeqK+R3HpUpPCE
 +96zE+e9d7nmrb6PK4gsLRkuL0WEpesvM/nB/X8fwweRuOERi/P0hMnr4f7qO4xrzsih
 lGCfBtEJbFyoDjFzeeWkWFmT0bYTClDhJtcJBQ9OpjadlQK/RThAhkmJaxNShmyZKS8J
 DqqqJrEAm/y0xC9yhF853AJuYOtkh4uJN6aPSBHCkR1kJApX2jm0d7B9ic/jFnusEd/t
 QYWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eW47mY/OYRqu0mDu9CrLv3LzjR+rtZK9WzKcoeZW9fg=;
 b=X08PW89YSKo2RJpCSEXKYWvkzooxRSkOn9rJ5OVR4aF3UUUL8ZjjqM8aanuupT6Egq
 i3Tjau0Z7RN9uJnTn14gMGAfb8PteWMkvt2QT+/YcDqsGqRGS053B7N5sbw9j+c7elDO
 5x9gw+8GwX7cGn1u3RcOpdleVOFItEkxR0lmkYoqbhBvL24KcjDMs/+99icA9A0E5RfY
 k20F5I7IsBHngTV+JiRsQbwgwfHAOwRK17z7YqH5UmfhhWS8ComTb/esrZ/2bht4FjvF
 OtI2iURFKkYfoxDRMg4Jt997sG/llbslEKRDHnbBIE4wMI0ty/KOll2e5MViRzzxaLdG
 GZaA==
X-Gm-Message-State: AFqh2krcfH2aAIkUyl/hlup+exvPEz8czOmCd6C/zzEmDeByMxym/ohu
 jicRJNJ1GIAIbDx+KkX40vqQqA==
X-Google-Smtp-Source: AMrXdXuXBF8f+KKBKhs/4h8okGLGrPFMdqHd4gD9lcD9y2nKLkQp8UT+dihMxXvOWFlE4CXMO2vscA==
X-Received: by 2002:a05:600c:3d86:b0:3d1:e04f:9bfa with SMTP id
 bi6-20020a05600c3d8600b003d1e04f9bfamr69876549wmb.28.1673872649843; 
 Mon, 16 Jan 2023 04:37:29 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 bg23-20020a05600c3c9700b003d1de805de5sm37954277wmb.16.2023.01.16.04.37.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 04:37:29 -0800 (PST)
Message-ID: <a4b7fd13-4bd0-0e7a-4650-7164e1a76053@linaro.org>
Date: Mon, 16 Jan 2023 13:37:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v8 3/3] hw/riscv: clear kernel_entry higher bits in
 load_elf_ram_sym()
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Bin Meng <bmeng.cn@gmail.com>
References: <20230116122948.757515-1-dbarboza@ventanamicro.com>
 <20230116122948.757515-4-dbarboza@ventanamicro.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230116122948.757515-4-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
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
X-List-Received-Date: Mon, 16 Jan 2023 12:37:43 -0000

On 16/1/23 13:29, Daniel Henrique Barboza wrote:
> Recent hw/risc/boot.c changes caused a regression in an use case with
> the Xvisor hypervisor. Running a 32 bit QEMU guest with '-kernel'
> stopped working. The reason seems to be that Xvisor is using 64 bit to
> encode the 32 bit addresses from the guest, and load_elf_ram_sym() is
> sign-extending the result with '1's [1].
> 
> Use a translate_fn() callback to be called by load_elf_ram_sym() and
> return only the 32 bits address if we're running a 32 bit CPU.
> 
> [1] https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg02281.html
> 
> Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Suggested-by: Bin Meng <bmeng.cn@gmail.com>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   hw/riscv/boot.c            | 20 +++++++++++++++++++-
>   hw/riscv/microchip_pfsoc.c |  4 ++--
>   hw/riscv/opentitan.c       |  3 ++-
>   hw/riscv/sifive_e.c        |  3 ++-
>   hw/riscv/sifive_u.c        |  4 ++--
>   hw/riscv/spike.c           |  2 +-
>   hw/riscv/virt.c            |  4 ++--
>   include/hw/riscv/boot.h    |  1 +
>   target/riscv/cpu_bits.h    |  1 +
>   9 files changed, 32 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index e868fb6ade..0fd39df7f3 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -213,7 +213,24 @@ static void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry)
>       }
>   }
>   
> +static uint64_t translate_kernel_address(void *opaque, uint64_t addr)
> +{
> +    RISCVHartArrayState *harts = opaque;
> +
> +    /*
> +     * For 32 bit CPUs, kernel_load_base is sign-extended (i.e.
> +     * it can be padded with '1's) if the hypervisor is using
> +     * 64 bit addresses with 32 bit guests.
> +     */
> +    if (riscv_is_32bit(harts)) {

Maybe move the comment within the if() and add " so remove the sign
extension by truncating to 32-bit".

> +        return extract64(addr, 0, RV32_KERNEL_ADDR_LEN);

For 32-bit maybe a definition is not necessary, I asked before
you used 24-bit in the previous version. As the maintainer prefer :)

> +    }
> +
> +    return addr;
> +}

> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 8b0d7e20ea..8fcaeae342 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -751,6 +751,7 @@ typedef enum RISCVException {
>   #define MENVCFG_STCE                       (1ULL << 63)
>   
>   /* For RV32 */
> +#define RV32_KERNEL_ADDR_LEN               32
>   #define MENVCFGH_PBMTE                     BIT(30)
>   #define MENVCFGH_STCE                      BIT(31)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



