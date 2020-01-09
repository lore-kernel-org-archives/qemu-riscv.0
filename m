Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ipNe2-0004vc-FY
	for mharc-qemu-riscv@gnu.org; Wed, 08 Jan 2020 21:33:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60058)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1ipNdy-0004pO-6v
 for qemu-riscv@nongnu.org; Wed, 08 Jan 2020 21:33:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1ipNdr-0008DP-Nf
 for qemu-riscv@nongnu.org; Wed, 08 Jan 2020 21:33:52 -0500
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:36643)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1ipNdr-00089w-1I
 for qemu-riscv@nongnu.org; Wed, 08 Jan 2020 21:33:47 -0500
Received: by mail-pg1-x544.google.com with SMTP id k3so2468099pgc.3
 for <qemu-riscv@nongnu.org>; Wed, 08 Jan 2020 18:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dzbZeJ1AmuhqCmb+aBieEB+CAtkvNLr1xBssq6CpAf0=;
 b=Vtb6BQbGYLY2s+0W7WooxVUejGgs6eHG2iQBswd40q2aawdXKcYNUd+rLiI4qF6D+V
 cQwLh2Ud0yimPHVsmEpVTLvl3g6Es2YwmBSUTYDhNE8XBLgaKbY4OTNufpNWrWqqtK1J
 3rU24YUqN8567GCZaT/W+sWnmwHWO48/2bl+BNQzhB32PjS1Tn8pcyYJpb9Q4XDoXLB4
 TlpFS1Cbbd5tNA/2edFIoY1UxnwDT9OM3hzlYaVqgyDMDn5HBYB9E27arV8NkBNzngbg
 Wx5t3MuXDnR2Lyq92k7BBJ8MqpNz3BYHHWN5jjMCvet+/mfpkj4sC5klo1t0lZt6bFXw
 ebEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dzbZeJ1AmuhqCmb+aBieEB+CAtkvNLr1xBssq6CpAf0=;
 b=uaeQeTKfaek7APsKebNCjmZwkL+RpgJmUMPJtUJeSv5a4IiP6Sped4a52ySWljqxwE
 E4jMVPUoL9PGE+UHHOUtfooU31YZyxONGtXLlk2nc5ilmNpPrzzidJ+zQ++VqRmYrw4N
 3zH5NiTXvXvpIq1PrrrWqYteZudT5PPWu3hy8f9qvGn12NTrkftTPq9Tot2eh3Omtm3Q
 BWJg7mhxOpe1QEnaJqC8XePCIse74WjVSaCmTZvf+y5ERJffeFnMc29Q2byG4V5mcBR8
 xS25mh9xZl5DO7Nw+wp4JsMzXPNF9brKmuA/L1u2qqoWHPNAhLk7e/HHQ0n+bpu6ZnYS
 pFQg==
X-Gm-Message-State: APjAAAUCFgDA2KBH8E2mnBB4/4wpn4spkgkmbHwPIuCpiQN0NEYAP9vr
 hoQeDL+uxBnGJtVsvLHWNwrY0A==
X-Google-Smtp-Source: APXvYqy13ScqvGzA0BpAqddmBg1gNyMf6JOmLtEHTs34w37xSfEg25z2i9/aaJrlOzcTah1Uz9OVdg==
X-Received: by 2002:a63:5818:: with SMTP id m24mr8733836pgb.358.1578537225660; 
 Wed, 08 Jan 2020 18:33:45 -0800 (PST)
Received: from [192.168.15.12] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id k12sm4853409pgm.65.2020.01.08.18.33.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jan 2020 18:33:45 -0800 (PST)
Subject: Re: [PATCH v1 20/36] target/riscv: Add support for virtual interrupt
 setting
To: Palmer Dabbelt <palmerdabbelt@google.com>,
 Alistair Francis <Alistair.Francis@wdc.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair23@gmail.com
References: <2389483485d4642a6e5670e2546c62e493e91fd6.1575914822.git.alistair.francis@wdc.com>
 <cover.1575914822.git.alistair.francis@wdc.com>
 <mhng-6814f8b9-d54a-4663-900c-83023307a658@palmerdabbelt-glaptop>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <200650e5-cb77-0518-8f27-30d0cf23de22@linaro.org>
Date: Thu, 9 Jan 2020 13:33:40 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <mhng-6814f8b9-d54a-4663-900c-83023307a658@palmerdabbelt-glaptop>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
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
X-List-Received-Date: Thu, 09 Jan 2020 02:33:56 -0000

On 1/9/20 11:49 AM, Palmer Dabbelt wrote:
>> +    irqs = (pending & ~env->mideleg & -mie) | (pending &  env->mideleg & -sie);
> 
> Isn't "-unsigned" implementation defined?  I can't get GCC to throw a warning
> and it was already there, so maybe I'm just wrong?

(1) You're confusing implementation defined with undefined, and unsigned
arithmetic is the former not the latter.

(2) There is no such thing as ones-compliment or sign-magnitude integer
hardware anymore, so for this case "implementation defined" is in fact universal.

(3) We build with -fwrapv, so we're explicitly asking for sane behaviour from
our signed types as well.


r~

