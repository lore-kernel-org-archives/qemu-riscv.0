Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nL5Tq-0007ML-3X
	for mharc-qemu-riscv@gnu.org; Fri, 18 Feb 2022 10:47:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nL5Tp-0007JH-1N; Fri, 18 Feb 2022 10:47:33 -0500
Received: from [2a00:1450:4864:20::635] (port=38820
 helo=mail-ej1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nL5Tm-0007ET-RW; Fri, 18 Feb 2022 10:47:32 -0500
Received: by mail-ej1-x635.google.com with SMTP id k25so15979389ejp.5;
 Fri, 18 Feb 2022 07:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tUspLoosayPzAlzgOJvmnRsJVz3fYizL8nWqce0JyyQ=;
 b=LDxvp61kD/PRqbT4S6YI8/xznyFD1rOAhbb7JfEm91dPMAfeBG97KLFXMQZ6Ze+2ui
 HNvL3TnuhI50DueU11pd0tFllI+KiVrigDbQJ6wQ/OFyce4+1fPTTSN+ePf0rOT4A296
 Y6eL6/hZTJLP87EvJQWHyxnZWM7PKbhQQe1ABl/DXd1vQ97wj23Vizu9uzh6077BOt/p
 BQ8nDiEBoUn8ve1bDB6AcWeogoZhr5br0J5ucVuWUdZSr6lVsbxQCEbG43vICgEPzQQV
 1GRToRrxO/smbIFjXR6qydkbq08tAzo4oGE9NhDvN7FMFO4At9J0h/q1/OSpgVgu5HRd
 h20Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tUspLoosayPzAlzgOJvmnRsJVz3fYizL8nWqce0JyyQ=;
 b=x3oP9NGBbH1Amye+Ko8if3pJTE6Z5vhrcaS0LUajJlhcgcKzGOB+B9WY4HVlVjL0Wq
 MCFRG2NnoHNqxrwmSpnxYENvLRxMsNqFh7L/MF4N4uwlZB/le9p+QyZ9clfH0/xx3hgj
 5RqZ4Xa0Hkzp1oVbhKITUgMYJTzXysxJJCRW7L1RF+WLM1b763qtCUT4Z2FlFNsqrT2U
 yw25v05hprW01piB2QjlDzymwSIfaHKHBPg4Vs2KU/qtjeW0FzWsZdSfhQJ0Z0cXOQKm
 iH6Cs9bogDTkvSPVJHd2ZBmtidSFLW90icumWUHxjb5Px3kJz2joAb4zv3K3IwG03Rf3
 Pqfw==
X-Gm-Message-State: AOAM532Ofp5fSvgZEWsd4FvBTwzDAzk2LIMYn2tGJq33z1IcoqQulvqt
 KzLt2wb/e5oJYwYkchFLtukXCP3yihU=
X-Google-Smtp-Source: ABdhPJz8kDA1/zUy21/H8i9WfClf4/uvf02mTUH2cv05uigulSvXk54Z8do63SX6uOKsjBaZwQb+EA==
X-Received: by 2002:a17:906:2b93:b0:6cf:bb48:5a80 with SMTP id
 m19-20020a1709062b9300b006cfbb485a80mr6675524ejg.681.1645199249005; 
 Fri, 18 Feb 2022 07:47:29 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id v5sm4880911edb.15.2022.02.18.07.47.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Feb 2022 07:47:28 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <335a7af3-b5af-3117-2647-783a217d75a2@redhat.com>
Date: Fri, 18 Feb 2022 16:47:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] build: fix build failure with gcc 11.2 by disabling
 -fcf-protection
Content-Language: en-US
To: Vineet Gupta <vineetg@rivosinc.com>, qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-riscv@nongnu.org,
 gnu-toolchain@rivosinc.com
References: <20220208211937.79580-1-vineetg@rivosinc.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220208211937.79580-1-vineetg@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::635
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 18 Feb 2022 15:47:33 -0000

On 2/8/22 22:19, Vineet Gupta wrote:
> When doing RV qemu builds with host gcc 11.2, ran into following build failure
> 
> | cc -MMD -MP -MT linuxboot_dma.o -MF ./linuxboot_dma.d -O2 -g -march=i486 -Wall \
> |   -Wstrict-prototypes -Wredundant-decls -Wundef -Wwrite-strings -Wmissing-prototypes \
> |   -Wold-style-declaration -Wold-style-definition -Wtype-limits -Wformat-security \
> |   -Wformat-y2k -Winit-self -Wignored-qualifiers -Wempty-body -Wnested-externs \
> |   -Wendif-labels -Wexpansion-to-defined -Wimplicit-fallthrough=2 -Wno-missing-include-dirs \
> |   -Wno-shift-negative-value -Wno-psabi -fno-pie -ffreestanding -IQEMU/include \
> |   -fno-stack-protector   -m16   -Wa,-32 \
> |   -c QEMU/pc-bios/optionrom/linuxboot_dma.c -o linuxboot_dma.o
> |cc1: error: ‘-fcf-protection’ is not compatible with this target
> 
> Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
> ---
> This might be a crude fix to the problem
> ---
>   pc-bios/optionrom/Makefile | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/pc-bios/optionrom/Makefile b/pc-bios/optionrom/Makefile
> index 5d55d25acca2..8f843ee803c1 100644
> --- a/pc-bios/optionrom/Makefile
> +++ b/pc-bios/optionrom/Makefile
> @@ -22,6 +22,9 @@ override CFLAGS += $(CFLAGS_NOPIE) -ffreestanding -I$(TOPSRC_DIR)/include
>   override CFLAGS += $(call cc-option, -fno-stack-protector)
>   override CFLAGS += $(call cc-option, -m16)
>   
> +# issue with gcc 11.2
> +override CFLAGS += $(call cc-option, -fcf-protection=none)
> +
>   ifeq ($(filter -m16, $(CFLAGS)),)
>   # Attempt to work around compilers that lack -m16 (GCC <= 4.8, clang <= ??)
>   # On GCC we add -fno-toplevel-reorder to keep the order of asm blocks with

This is a problem in the Ubuntu compiler that you're using.  If 
-fcf-protection is not compatible with -m16, Ubuntu should not enable it 
instead of breaking -m16.

Besides, QEMU is not at all compatible with -fcf-protection, not just 
the ROMs.  So it should be added to QEMU_CFLAGS in configure as well.

Paolo

