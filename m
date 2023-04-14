Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pnIiv-0005nm-C7
	for mharc-qemu-riscv@gnu.org; Fri, 14 Apr 2023 08:40:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pnIit-0005ms-5H
 for qemu-riscv@nongnu.org; Fri, 14 Apr 2023 08:40:16 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pnIiq-0002Rz-VY
 for qemu-riscv@nongnu.org; Fri, 14 Apr 2023 08:40:14 -0400
Received: by mail-oi1-x229.google.com with SMTP id x22so398425oiv.10
 for <qemu-riscv@nongnu.org>; Fri, 14 Apr 2023 05:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1681476010; x=1684068010;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Jfj1fPzM+3HYfYIDorwflGDqKUkISp58tDvUgAsf0j0=;
 b=Vqru1ejYoYAuBrt4OAtTuAlRK9tlHFAtNXcpFRGQt33XV3dSAqFEn0uu0oPUi5Ih4w
 5i3br7I8E4Sm3M7PKopVbEXcxX/5JVrw1ydO4VbHbO6Jg4dxWdPtzKnJXjT0SexipZuj
 oyG6OiL7kDX93jCLXrnjyQs+Oe03hqOs+tYP2IB3/F7zxYbQkmL8++J8MWPlpyyT8tWS
 0/2hmQHAKccKOGR63JePzJYSAcpphHRyc5x8x5abR6dwHhRL1hhjFHwrfj0lQJK+ZsfH
 ALi+geWsFWoyYTESQY5SzIE57YGPNxtIjEXKTfq8eAGTMlmxM2IIv2/04illke0ZZpui
 ErMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681476010; x=1684068010;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Jfj1fPzM+3HYfYIDorwflGDqKUkISp58tDvUgAsf0j0=;
 b=W4UPtx/pLdOXifJYzhakkp18pG6DiJpgJwMdZPpNjqqzo0rTF4Iel9KFakQJrePwt2
 19Zlwizw3qLDcNZYVBuKzhPPMmidEC/Cs5/fB7pJyBwha5Xo7Lx0Gw/mnRd1R6UQIgTb
 dEkrWCMd8O/lqRdl5nghxoTTlRi1A9bqsFzY9xq1qZkd8ZV9U9/u3GgktDhQ1bXq3K7W
 yGgPTUPnQv7Z1BouJjjd5AkxpV6NPD9oL2bLlYpoYE8Sg3sNRjk7oalritcFvI0pgNnZ
 LCkeBYywzddxMeS2/uGWcN7CoU8xsiAB0939PpUe6HYfx8ZPxINim4GpsGC6W60k1+pm
 SBQA==
X-Gm-Message-State: AAQBX9eaBz1nA+MZfPwBEreqjj0jWfpQpNzsKQeEoMDVx+4nxEHZgQFB
 HwV7ub+7ZTqXNdzAEZ34H62gng==
X-Google-Smtp-Source: AKy350axsTiQ/UbIc3bx+aQKV31F5Ip+dbcgUv92hoOFyURz/6tqPpHjEm4xi/DB+Z/AtRos6D0PvA==
X-Received: by 2002:a05:6808:2d1:b0:378:7dbd:6da7 with SMTP id
 a17-20020a05680802d100b003787dbd6da7mr2321139oid.29.1681476010217; 
 Fri, 14 Apr 2023 05:40:10 -0700 (PDT)
Received: from [192.168.68.107] ([191.255.108.232])
 by smtp.gmail.com with ESMTPSA id
 cg9-20020a056808328900b0038beb8c1289sm1647541oib.15.2023.04.14.05.40.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Apr 2023 05:40:09 -0700 (PDT)
Message-ID: <c021529c-67ce-fe7c-1acc-7753715c466f@ventanamicro.com>
Date: Fri, 14 Apr 2023 09:40:06 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: KVM QEMU AIA support for RISCV guests
Content-Language: en-US
To: Rajnesh Kanwal <rkanwal@rivosinc.com>, qemu-riscv@nongnu.org,
 anup@brainfault.org, alistair.francis@wdc.com,
 Atish Kumar Patra <atishp@rivosinc.com>, Palmer Dabbelt <palmer@rivosinc.com>
References: <CAECbVCt_+SCiUzv9cOR4KYC7BE_4TjRGqOndzDthUvara8OxMA@mail.gmail.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <CAECbVCt_+SCiUzv9cOR4KYC7BE_4TjRGqOndzDthUvara8OxMA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x229.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.282,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 14 Apr 2023 12:40:16 -0000



On 4/14/23 08:35, Rajnesh Kanwal wrote:
> Hi All,
> 
> I am starting to work on KVM-QEMU AIA support for RISCV guests to extend
> kvm accel support added in [0]. This is just to confirm if anyone else
> is actively
> working on it to avoid duplicate effort.

I was going to look into it eventually, but now that you've started I'll sit
back and help with reviews and testing and so on.


Thanks,

Daniel

> 
> [0]: https://lists.nongnu.org/archive/html/qemu-riscv/2021-08/msg00117.html
> 
> Thanks,
> Rajnesh
> 

