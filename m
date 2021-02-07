Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l8tMO-0006FW-4K
	for mharc-qemu-riscv@gnu.org; Sun, 07 Feb 2021 18:20:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l8tMI-0006BF-GD; Sun, 07 Feb 2021 18:20:51 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:33396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l8tMG-0000EQ-Ri; Sun, 07 Feb 2021 18:20:50 -0500
Received: by mail-wr1-x433.google.com with SMTP id 7so15189883wrz.0;
 Sun, 07 Feb 2021 15:20:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WgV+kHH/S/YA1VmTAwZu8b/S8Cw7rfFLiBYVcrQauLU=;
 b=Zd3n9uSwTd9grh/58L8h/xT1ItavP71+S0AroHITHVVcy7NvYkDjgWJnlhjYW6qGCo
 oeqqNwm5HoIitnsk69hn7f78miH2NQZID9eBo9yhAmcL/wDmm0duZRPnunq7G5h52g5v
 MtnOfPAWrJsIbqvaVqB9J7wMFVilSV2jmL08DFfBXWDOsgg5xEP9W8b6PupMuo5WIV2+
 8ChQ+014aPWeF7++rGKj7+NPSOLT2ip/BmLfJIj7AysKLOyEPJO+WmHmCuXBtxmesGar
 OeMVPHaT+NTFGzZMKklswl8jPqMLBjEenD+UARjkxzFE/tomNafJCWTuvoBeGiLbb431
 +/zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WgV+kHH/S/YA1VmTAwZu8b/S8Cw7rfFLiBYVcrQauLU=;
 b=AbHHUB0B7CXffvVxkL5xE0WGzAOKIRgrVyIWOgEgYcYSfhcmF902BzqFJPWRwx2qII
 Q93rnaxU4SweZYDqbrvjYYtx5iPzI36ZeL1gR/yaChlYNB68bx4RocJh/BmgQfp2/3hz
 KzbzZSG4jONhb5WKoarUelgR5vhGqDlEgKhKsVZo05y4rPXIA0mN8RSH8vP6xfEGg6PO
 AK3xsf9lZr4c9mprEu3p/WHFwDxpCDG8PSo9FxG7pJm0C0zaZ4VNG3VtrgT4Wmp49CZK
 brzdOvAUWKhvaYk10/VpZCVnMy7urJuOuDE0Dsa8NFIHoN9nXbCAPudqgkfRtVgImkm5
 8oHg==
X-Gm-Message-State: AOAM530J0mDSJacIYx4mzSqDRRkh478kt8iCkOJWyghjJGcxCiGdjhOL
 04AINKQZ0YNvpqlR/aabx5g=
X-Google-Smtp-Source: ABdhPJwwlydMhmACrG2USSA9g2CN7ecsihb6UGP0qTJeL/nzqRqkzEJW03ImAwR+ZqLb/PBbj1ijqw==
X-Received: by 2002:adf:e490:: with SMTP id i16mr4513097wrm.87.1612740046616; 
 Sun, 07 Feb 2021 15:20:46 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id i10sm411272wrp.0.2021.02.07.15.20.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Feb 2021 15:20:45 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH 6/6] exec/cpu_ldst: Move tlb* declarations to
 "exec/exec-all.h"
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-riscv@nongnu.org,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20210207225738.2482987-1-f4bug@amsat.org>
 <20210207225738.2482987-7-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <280b19a4-44d6-9005-58a8-fb033bf958d6@amsat.org>
Date: Mon, 8 Feb 2021 00:20:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210207225738.2482987-7-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Sun, 07 Feb 2021 23:20:52 -0000

On 2/7/21 11:57 PM, Philippe Mathieu-Daudé wrote:
> Keep MMU functions in "exec/cpu_ldst.h", and move TLB functions
> to "exec/exec-all.h". As tlb_addr_write() is only called in
> accel/tcg/cputlb.c, make move it there as a static function.
> 
> Doing so we removed the "tcg/tcg.h" dependency on "exec/cpu_ldst.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  include/exec/cpu_ldst.h | 52 -----------------------------------------
>  include/exec/exec-all.h | 38 ++++++++++++++++++++++++++++++
>  accel/tcg/cputlb.c      |  9 +++++++
>  3 files changed, 47 insertions(+), 52 deletions(-)

> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
> index c5e8e355b7f..5024b9abd4a 100644
> --- a/include/exec/exec-all.h
> +++ b/include/exec/exec-all.h
> @@ -297,6 +297,38 @@ void tlb_set_page(CPUState *cpu, target_ulong vaddr,
>                    hwaddr paddr, int prot,
>                    int mmu_idx, target_ulong size);
>  
> +/**
> + * tlb_vaddr_to_host:
> + * @env: CPUArchState
> + * @addr: guest virtual address to look up
> + * @access_type: 0 for read, 1 for write, 2 for execute
> + * @mmu_idx: MMU index to use for lookup
> + *
> + * Look up the specified guest virtual index in the TCG softmmu TLB.
> + * If we can translate a host virtual address suitable for direct RAM
> + * access, without causing a guest exception, then return it.
> + * Otherwise (TLB entry is for an I/O access, guest software
> + * TLB fill required, etc) return NULL.
> + */
> +void *tlb_vaddr_to_host(CPUArchState *env, abi_ptr addr,
> +                        MMUAccessType access_type, int mmu_idx);

Non-TCG build failure because abi_ptr is defined in "exec/cpu_ldst.h":

  typedef target_ulong abi_ptr;

