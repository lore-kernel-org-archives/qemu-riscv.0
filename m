Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kW2VX-0002wx-Sx
	for mharc-qemu-riscv@gnu.org; Fri, 23 Oct 2020 15:13:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kW2VV-0002uM-Ks
 for qemu-riscv@nongnu.org; Fri, 23 Oct 2020 15:13:45 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:45675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kW2VP-00068M-9Z
 for qemu-riscv@nongnu.org; Fri, 23 Oct 2020 15:13:44 -0400
Received: by mail-pf1-x443.google.com with SMTP id e7so2101662pfn.12
 for <qemu-riscv@nongnu.org>; Fri, 23 Oct 2020 12:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=w5+o7Fuw8mcegapYPtHZXN+EuScY7pbJOQkVwlCvtJs=;
 b=dDaBlkF+/AUn3FhKuL7sO5xhz2m86yVz52EqhxTwn0pFkv6jCoY01bAwruk4Zmm/qx
 SpMJwP/Rrlae0k81B3RX50KtoEAdUYRXAydgCpP6zdr8gMm5m/1ICI/ECFgyG/5FpH9L
 se/DMKxVFJ2W409wN+QK28acqhGf2bWdN3LFztFQEzY1nfsX+X0Oii+l1Z4kyCEz0n9Z
 EkVU8trMhC4cCoV3vFfjhPwIq1MWq95fu38udVOTCVd5QqLs5Fsy2+frcPyxr5T7hNui
 Xb4JXpu8fDT+aY4JecASTGMD9ptYl1tIxW2vg7hfegZr9fE53G+46or7CDyw+0sgSV7b
 uO6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=w5+o7Fuw8mcegapYPtHZXN+EuScY7pbJOQkVwlCvtJs=;
 b=q4efpXABwSqLvxDM1TU1eLK8DlO+r+XGg7Ayp+fFFjBB2DbHznjRdpk9Al9XKT4ZY5
 eXuKqQt48UFtI5oY8jGDKXEorF71IT86V5UVfhaTj5w4Uq1FjONIcfszIEMe9kaA3eM7
 NmKZpHG4EvUUM4rwBv7kFeO1VHEb4nZzuZZWywMkYoAhr0j/KXjavubEHSft/AMYRqQb
 ckdNX4sqUR0Saiaeqbp79r5nEPpQFJLgvEWN+L4miNKHHpwK33wykOrM4w4ZauQPH1nm
 lR3OzgCD8NGBBiHWNBOYhstRz3qWrCCME5fUdONZ6BlyG1MY0vnt5hqb0U5T4LfU8dzj
 PwbQ==
X-Gm-Message-State: AOAM533vtlIk+4KOVBGfY/fCOvryJwl6KeDU8KbfljorvarIQnTbQwRY
 dKbYdRLSPDXlnqZKcCPJZkd/IA==
X-Google-Smtp-Source: ABdhPJymzrAfSMf6sMXC7gPsBC8wRCCAOljLD3/aS3le+kOLrlA6LJkBj5tO025gwIBQo1ODKV2STQ==
X-Received: by 2002:a17:90a:17ad:: with SMTP id
 q42mr4417559pja.36.1603480417598; 
 Fri, 23 Oct 2020 12:13:37 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id s141sm3009701pfs.75.2020.10.23.12.13.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Oct 2020 12:13:36 -0700 (PDT)
Subject: Re: [PATCH v1 1/5] target/riscv: Add a virtualised MMU Mode
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair23@gmail.com
References: <cover.1603466725.git.alistair.francis@wdc.com>
 <16213739a6232aa4824c5a008e2f669e6e58fbcf.1603466725.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bec11f34-9cfe-4aa2-2f9c-3781d7f5e8ad@linaro.org>
Date: Fri, 23 Oct 2020 12:13:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <16213739a6232aa4824c5a008e2f669e6e58fbcf.1603466725.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.108,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 23 Oct 2020 19:13:45 -0000

On 10/23/20 8:26 AM, Alistair Francis wrote:
> +++ b/target/riscv/cpu-param.h
> @@ -18,6 +18,6 @@
>  # define TARGET_VIRT_ADDR_SPACE_BITS 32 /* sv32 */
>  #endif
>  #define TARGET_PAGE_BITS 12 /* 4 KiB Pages */
> -#define NB_MMU_MODES 4
> +#define NB_MMU_MODES 8

Is there really a PRV_M + virt enabled state?

> +#define TB_FLAGS_PRIV_MMU_MASK                3
...
> -    int mode = mmu_idx;
> +    int mode = mmu_idx & 0x3;

Use that MASK here?


r~

