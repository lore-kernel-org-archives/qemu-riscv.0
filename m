Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jHbyy-0002TV-82
	for mharc-qemu-riscv@gnu.org; Thu, 26 Mar 2020 19:32:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37101)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jHbyv-0002RT-7R
 for qemu-riscv@nongnu.org; Thu, 26 Mar 2020 19:32:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jHbyt-00085y-Ru
 for qemu-riscv@nongnu.org; Thu, 26 Mar 2020 19:32:12 -0400
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:34585)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jHbyt-000842-Mb
 for qemu-riscv@nongnu.org; Thu, 26 Mar 2020 19:32:11 -0400
Received: by mail-pj1-x1041.google.com with SMTP id q16so3768818pje.1
 for <qemu-riscv@nongnu.org>; Thu, 26 Mar 2020 16:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pU1lNeZmeol/IzGK+YUex2ZmlBph/TYtG4Nj8RjZ7Bo=;
 b=c5uzQ7r2xn431cJPDfv9yS8fjWFpAiWJhoxbRhvlg/2AWVIPDa4KrumdYHVPTVcAzp
 CapAgRGasyZc3Pr/HZKbv4bwPF8zxFIWEut6Z3Wx8VAxIxMOnOGOG5KihBplgUvEmiq7
 VY0mNUVrQ/5XKoKsh9gr41lG6bhmSBbMhy0nhDIrOJnel4+T8ckiFPsKX4SF982mFntV
 zWAtcwKixqGJdzVJx2n3c2RwLinuDQJ1EiEQTpN9pWpW9z0yTbhPw8Oax4fXnIvHFzRj
 2e9RPrDmOePuJPPxJ0IzajZ8a/N3F1shgMxrTGXIWrvwzo5Xm/8eBR7a92g2H5nZx4p5
 L8Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pU1lNeZmeol/IzGK+YUex2ZmlBph/TYtG4Nj8RjZ7Bo=;
 b=TjL0EWPvd4YEpIkHjvv8oWtcW6FO2eWsmnH/6dmNEjKMnO00v8P3pHq7cceXtndqaZ
 IugwLy/qPqFB1QBSESg3zOVHSodaSwclrwNWDUqERAOOqdBoMdeZTaT2V685/onSk4ZW
 qLJR7uCnWCLzcL9d9zwrES5PW4vhK+p6XVfWUl1BSO1XnB7iwA3vo3bdygL/dKjRQfDo
 bMPd4d21Ra2Zi9Ct9ZZN9oXjk6Snu+9RIaYMGm27+0bYkhem/D/f4pjyADZ794fuh+br
 F1acDV5h4GT3K74uOgG/c2t2rpC5262r40QN/YaQsuJrIh63XhYSQkaAKLrKwoP9zhRn
 thzA==
X-Gm-Message-State: ANhLgQ2iVt0zRO/gV0tKv3nd5aOUEmcvbdKgKWs2q9XFVij6muEx1ghR
 QAMmOAcwj58BVGy9mdSrGV+OPw==
X-Google-Smtp-Source: ADFU+vsPtNs7SJAT2UJjddGUB4AepNhTtjsjFxdxJMQitLf7ogn1lTAyBDC5YieWWkvSesGnaE8qog==
X-Received: by 2002:a17:902:4b:: with SMTP id 69mr9903224pla.97.1585265530319; 
 Thu, 26 Mar 2020 16:32:10 -0700 (PDT)
Received: from [192.168.1.11] (174-21-138-234.tukw.qwest.net. [174.21.138.234])
 by smtp.gmail.com with ESMTPSA id d71sm2616691pfd.46.2020.03.26.16.32.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Mar 2020 16:32:09 -0700 (PDT)
Subject: Re: [PATCH for 5.0 v1 2/2] riscv: AND stage-1 and stage-2 protection
 flags
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com, alistair23@gmail.com
References: <cover.1585262586.git.alistair.francis@wdc.com>
 <846f1e18f5922d818bc464ec32c144ef314ec724.1585262586.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c835ef40-6e7a-7639-236c-5fb939bf7fc2@linaro.org>
Date: Thu, 26 Mar 2020 16:32:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <846f1e18f5922d818bc464ec32c144ef314ec724.1585262586.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1041
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
X-List-Received-Date: Thu, 26 Mar 2020 23:32:14 -0000

On 3/26/20 3:44 PM, Alistair Francis wrote:
> Take the result of stage-1 and stage-2 page table walks and AND the two
> protection flags together. This way we require both to set permissions
> instead of just stage-2.
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu_helper.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index f36d184b7b..50e13a064f 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -707,7 +707,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>  #ifndef CONFIG_USER_ONLY
>      vaddr im_address;
>      hwaddr pa = 0;
> -    int prot;
> +    int prot, prot2;
>      bool pmp_violation = false;
>      bool m_mode_two_stage = false;
>      bool hs_mode_two_stage = false;
> @@ -757,13 +757,15 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>              /* Second stage lookup */
>              im_address = pa;
>  
> -            ret = get_physical_address(env, &pa, &prot, im_address,
> +            ret = get_physical_address(env, &pa, &prot2, im_address,
>                                         access_type, mmu_idx, false, true);
>  
>              qemu_log_mask(CPU_LOG_MMU,
>                      "%s 2nd-stage address=%" VADDR_PRIx " ret %d physical "
>                      TARGET_FMT_plx " prot %d\n",
> -                    __func__, im_address, ret, pa, prot);
> +                    __func__, im_address, ret, pa, prot2);
> +
> +            prot &= prot2;
>  
>              if (riscv_feature(env, RISCV_FEATURE_PMP) &&
>                  (ret == TRANSLATE_SUCCESS) &&
> 

Whee!  Yes, I think this is what you've been looking for.
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

