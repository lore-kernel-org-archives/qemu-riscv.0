Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jCcpz-0007lK-1P
	for mharc-qemu-riscv@gnu.org; Fri, 13 Mar 2020 01:26:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59988)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jCcpw-0007kp-Pl
 for qemu-riscv@nongnu.org; Fri, 13 Mar 2020 01:26:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jCcpv-0004h1-L7
 for qemu-riscv@nongnu.org; Fri, 13 Mar 2020 01:26:20 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:33171)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jCcpv-0004fB-DO
 for qemu-riscv@nongnu.org; Fri, 13 Mar 2020 01:26:19 -0400
Received: by mail-pl1-x641.google.com with SMTP id ay11so3690828plb.0
 for <qemu-riscv@nongnu.org>; Thu, 12 Mar 2020 22:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+e4fyTDy0r9KzAFfSiWr6DhKCoTvO7zjWFgRj7An7YQ=;
 b=PzdIMajMaby/N9WxVfihw1viCtJ4LpuMMhd0qnhD7fCFwS+kw+T2TPOPxdUkfgRwzk
 c9T3+e8YQwP6CT5K/kD/EHLvwR/qLqtwJttI9foZiq80qkmbq+i9xX9USVcZEYxZg/ew
 kC9hN8uTa4FzOIl0tgX5T62yep3syMQI/O8rrWSLJhhrtgBWRAV7CD5bXorFyOCfaIrX
 4XEv5xAiZaNT8PS6heOEnaiXJvbNG92nQ/6ShlcoL9GOLyTYIGUgPLCFeMlgO1r4cCos
 iW9JuNuSy+ZWCKm6ga8erbgZiIC4KWPbpUFMjnBcxb0m308pniZyK6zrK+QdO4igc8xI
 yLrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+e4fyTDy0r9KzAFfSiWr6DhKCoTvO7zjWFgRj7An7YQ=;
 b=hyilLswqA4lqivlvdDG1djdCNWideTAUpTyBgbBesNP1G88y9L5W41C1QTrfkzf+yT
 qDlTm/hoVWo/S/gyHNmwWS284NX2p+xplGvUIWHdGgzOH3rHpV7/RhQP+a0y1HtsLKkb
 Q2z75vld2Qe7TxbLZUrhbSvYX1Fztp6E44EXnPrpvp3lBGepZB5YJOQUGB8yBvx7nlqQ
 8EJYcb6SLHxdw5WOwbH9uMEDJv+qFGKRF2r9xJatrjde/nulUPUfF2sPhtbM33o+ln49
 PMUSveo79hCU6YgQeIlFQZxSawTMXp54MKXYSTTmdBE3EcxbxSMKB+63n+fz8kbrymiI
 6c7A==
X-Gm-Message-State: ANhLgQ2x3XNSUWz7s5HCQ6r5S73f3e13GhtwwN/YjI/xoK2X1ZRUYQaH
 DT0iLn1eHOoniHJoQ/LQV7LrCg==
X-Google-Smtp-Source: ADFU+vuWX8zs/99Ab7pYAT0ImUYzl5YtT4f5xYcMUKY9HwI0YsALMcvlAnOa56GibgU9iMyJb/wFzA==
X-Received: by 2002:a17:90a:d103:: with SMTP id
 l3mr7984625pju.116.1584077178258; 
 Thu, 12 Mar 2020 22:26:18 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 ep10sm10467049pjb.26.2020.03.12.22.26.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Mar 2020 22:26:17 -0700 (PDT)
Subject: Re: [PATCH v1 1/1] target/riscv: Don't set write permissions on dirty
 PTEs
To: Alistair Francis <alistair23@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <c827880a47774cd3a6bcd59b79657f380da11d5d.1583284602.git.alistair.francis@wdc.com>
 <e8498727-03f8-7e04-efd3-c04763dcbfac@linaro.org>
 <CAKmqyKOnb+CpnugoUkeL_kabyiCfZCmWyNF9uV5GUBT_pek=0g@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <47b0bc38-6384-9ab4-7c3e-d5ed405ea90d@linaro.org>
Date: Thu, 12 Mar 2020 22:26:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAKmqyKOnb+CpnugoUkeL_kabyiCfZCmWyNF9uV5GUBT_pek=0g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
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
X-List-Received-Date: Fri, 13 Mar 2020 05:26:21 -0000

On 3/12/20 3:10 PM, Alistair Francis wrote:
>> I still think this must be a guest (or nested guest) bug related to clearing
>> PTE bits and failing to flush the TLB properly.
> 
> It think so as well now. I have changed the Linux guest and Hypervisor
> to be very aggressive with flushing but still can't get guest user
> space working. I'll keep digging and see if I can figure out what's
> going on.
> 
>>
>> I don't see how it could be a qemu tlb flushing bug.  The only primitive,
>> sfence.vma, is quite heavy-handed and explicitly local to the thread.
> 
> Yes, both sfence and hfence flush all TLBs, so that doesn't seem to be
> the problem.

Here's an idea: change the tlb_flush() calls to tlb_flush_all_cpus_synced().

If that works, it suggests a guest interprocessor interrupt bug in the tlb
shoot-down.


r~

