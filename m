Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m1ku1-0000Ct-KF
	for mharc-qemu-riscv@gnu.org; Fri, 09 Jul 2021 03:26:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m1ktx-00005Z-SC; Fri, 09 Jul 2021 03:26:22 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:34703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m1ktw-0004Q1-Fc; Fri, 09 Jul 2021 03:26:21 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso5978408wmc.1; 
 Fri, 09 Jul 2021 00:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4Qq69g0e+yVrhJMF6s2Nmr8ghkt7A+j9U6FMgyribrw=;
 b=kS/02LRPm+chadPJQ2EhiH2iEFTF0FPpGjN5hJgLPieY7g80HeGIC9UJuBKf8sxr+Z
 04U9GUd/rx7N5Zuv6huak8dbdJED1VJ8c9cAU8uMZ6349Sl+kbjYAuEqTBYmGKYX07xB
 C2kyFcV8lAlO1/M3zwkPPgacfj7fHk5woyJ8RW4A6BXw5BaLzS0aK4mSotzJgVlFqR3G
 G4Am88N5sxkRjP2IGI4EoexKeLG3JrGcN3UOnT1TYaFn7xAXJDp614Y1UAF5ET4fUiBV
 erIjxOxug8JrBmDkpzmWGMMUobw3GbROy58imMMeL4s3t3+pqv8W8xnl2F+3x9j5R/8z
 ZzYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4Qq69g0e+yVrhJMF6s2Nmr8ghkt7A+j9U6FMgyribrw=;
 b=HUCro3j3qocQKgG4lDjLgX5VW2psxZVlm8uOWU3mLTfvn+f9SFmRJKGBxfv6W2Tqh2
 1+80KFWz26DmHcQePQ09tBnd8QkyxkfKajLHDURWZohdH8hsPefhrjmjCAP+mArtAMkv
 CYkhbjVZOHJ8bFiqYsHdRBfKWTi4UcKjCTBUFKUf44A4+LxtLauUGyaB9oVcGklPzxon
 1UZD70DRJWofzUQaoLV8WXEzKAlCEDfFccAYU8G87UMibuPoi8/YfExAd31xetVP5tmW
 w9PhO9RStUGp3XX1+YmbDMf7niNAxqG3SAm5Rp1zraFF65lKbDqCU1Mv3afRYYMlUGJZ
 WYCA==
X-Gm-Message-State: AOAM532vxwL63V+IcbGtbZ0ll5nQvZ1VNdYq20ZO5twhnl2w/i8q4R1P
 WgpHApn7xDjY+BwyW3SXwJQ=
X-Google-Smtp-Source: ABdhPJxTCT78liyimIeZORK814ZWi/b+E7XwM4DcXfvlQOPSXpECIxpHfRBHk2feDF4W4HG3L/R84w==
X-Received: by 2002:a1c:4603:: with SMTP id t3mr7489659wma.178.1625815578899; 
 Fri, 09 Jul 2021 00:26:18 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id u1sm11571331wmn.23.2021.07.09.00.26.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jul 2021 00:26:18 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v1 4/5] hw/intc: sifive_plic: Convert the PLIC to use
 RISC-V CPU GPIO lines
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair23@gmail.com
References: <37f8680b1ae39de82f9594d8e7a0d9596de9be8b.1625801410.git.alistair.francis@wdc.com>
 <a5f2909ca7fd9637ad90da0be9661f1e718e3dc5.1625801410.git.alistair.francis@wdc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2e32830c-b506-378e-f16c-e67c44803fca@amsat.org>
Date: Fri, 9 Jul 2021 09:26:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <a5f2909ca7fd9637ad90da0be9661f1e718e3dc5.1625801410.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Fri, 09 Jul 2021 07:26:22 -0000

On 7/9/21 5:31 AM, Alistair Francis wrote:
> Instead of using riscv_cpu_update_mip() let's instead use the new RISC-V
> CPU GPIO lines to set the external MIP bits.
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  include/hw/intc/sifive_plic.h |  4 ++++
>  hw/intc/sifive_plic.c         | 38 ++++++++++++++++++++++++++++-------
>  hw/riscv/microchip_pfsoc.c    |  2 +-
>  hw/riscv/shakti_c.c           |  3 ++-
>  hw/riscv/sifive_e.c           |  2 +-
>  hw/riscv/sifive_u.c           |  2 +-
>  hw/riscv/virt.c               |  3 ++-
>  7 files changed, 42 insertions(+), 12 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

