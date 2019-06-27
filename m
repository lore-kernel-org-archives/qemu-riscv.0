Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hgXll-0004k0-VJ
	for mharc-qemu-riscv@gnu.org; Thu, 27 Jun 2019 13:01:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56774)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hgXlb-0004f5-Ev
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 13:01:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hgXlZ-00039O-Sw
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 13:00:59 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:40281)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hgXlZ-00038K-Lr
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 13:00:57 -0400
Received: by mail-wr1-x431.google.com with SMTP id p11so3384514wre.7
 for <qemu-riscv@nongnu.org>; Thu, 27 Jun 2019 10:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SnSainN7M3Jy3O1rgRnoNBqbG4J9t9BpOQidGj9hFwY=;
 b=EtP5PnZk571qKEmx7oyF0sYqGj3PXCw7XpKQ+9ORcJiqQK2uCURDIA8ecVTG1WYT6C
 6PE/7YRbOmmX0QvjLGmw1nrl6gHCnVpdbdGnhQFEoxr1kRn8yLHXZBQ4Be90gigdtcl/
 HzFiJRh4P6Y/WJCMw9iEzalL5nn2hRzHRw6ajk8octp1qmEvrK6mh6fBLVyagVngUsE+
 b3RSnYVT1L2fSScIP8hRKmIXB54bAd/uhz8ZAtyTJLjna6DkB9HyLtmB6PmSmXKx46qE
 8cJnk5GcIyEIuLJzDv1Q7FxuVLTO8/rwiAzbH9tz48esWGBu4CTKKSHuqA0rW2umz65J
 /QTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SnSainN7M3Jy3O1rgRnoNBqbG4J9t9BpOQidGj9hFwY=;
 b=W1fchA5Ouz3uYN2uXNM2iTSpElKwDwe5n4kcXs+3UWXlfU4En2XMFi1WvLTZuNxGIY
 mO134KvTOfxtT1wBrWB4KIhc3Nr5qImoyuqBIkxweqpUn+SaN1s4gj7XIS+9ny0A4saY
 YOKug0wVZXcd0bPUVtuv+OSfHSlWmxQUT2Z4h1j1SsdppZbklMqtiorlQrTzRa322WSQ
 PKGcosO3TSbpvSaEYj54vtHmtMOnsUJBMP5011M4Dosu+9KvVidcKAgRLYim2+ZflnyF
 ZoInH0fzRS9vhYlEFeVhBxrt7CVPfx8AoCxAJ6UvZwFLdJnu+dccsPqWRui48LBfAuyw
 QcRw==
X-Gm-Message-State: APjAAAUSdBUR6iqzTlLhtYOmysBqgk8Wtvf3AY+kMsersOVhi7q9r+9L
 hA3aZpt0RDs6OxBok2XlrxDzMg==
X-Google-Smtp-Source: APXvYqxWsHKtIWMoWUp6unAcBKIkpxQuCFIsm2HWhI5LMEWf0lHUskV1L+M5/hC6+ze0dxi6+dBetA==
X-Received: by 2002:a5d:5542:: with SMTP id g2mr3982796wrw.232.1561654856051; 
 Thu, 27 Jun 2019 10:00:56 -0700 (PDT)
Received: from [192.168.2.137] (93-34-153-63.ip50.fastwebnet.it.
 [93.34.153.63])
 by smtp.gmail.com with ESMTPSA id u18sm4918271wmd.19.2019.06.27.10.00.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 27 Jun 2019 10:00:55 -0700 (PDT)
To: Hesham Almatary <Hesham.Almatary@cl.cam.ac.uk>, qemu-riscv@nongnu.org
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@sifive.com>, qemu-devel@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>
References: <20190627121828.8376-1-Hesham.Almatary@cl.cam.ac.uk>
 <20190627121828.8376-3-Hesham.Almatary@cl.cam.ac.uk>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <77c4044f-93dc-0608-496e-edf8bd8f77d7@linaro.org>
Date: Thu, 27 Jun 2019 19:00:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190627121828.8376-3-Hesham.Almatary@cl.cam.ac.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::431
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCHv4 3/6] RISC-V: Check for the
 effective memory privilege mode during PMP checks
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
X-List-Received-Date: Thu, 27 Jun 2019 17:01:07 -0000

On 6/27/19 2:18 PM, Hesham Almatary wrote:
> @@ -392,19 +392,27 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>      int prot;
>      bool pmp_violation = false;
>      int ret = TRANSLATE_FAIL;
> +    int mode = mmu_idx;
> 
>      qemu_log_mask(CPU_LOG_MMU, "%s ad %" VADDR_PRIx " rw %d mmu_idx %d\n",
>                    __func__, address, access_type, mmu_idx);
> 
>      ret = get_physical_address(env, &pa, &prot, address, access_type, mmu_idx);
> 
> +    if (mode == PRV_M && access_type != MMU_INST_FETCH) {
> +        if (get_field(env->mstatus, MSTATUS_MPRV)) {
> +            mode = get_field(env->mstatus, MSTATUS_MPP);
> +        }
> +    }

This hunk looks like it belongs in riscv_cpu_mmu_index instead.
Passing the (corrected) mmu_idx on to pmp_hart_has_privs looks right.


r~

