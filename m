Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jpJcq-0001Dx-Nf
	for mharc-qemu-riscv@gnu.org; Sat, 27 Jun 2020 18:48:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jpJcp-0001Di-F8
 for qemu-riscv@nongnu.org; Sat, 27 Jun 2020 18:48:43 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:35365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jpJcn-0004AC-Jf
 for qemu-riscv@nongnu.org; Sat, 27 Jun 2020 18:48:43 -0400
Received: by mail-pf1-x442.google.com with SMTP id a14so1687244pfi.2
 for <qemu-riscv@nongnu.org>; Sat, 27 Jun 2020 15:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iuU0t04uho3+u1jEWN4+Tj4+LjtiwVd4BX2d3/21QFI=;
 b=zSA9RRfvcdsjv5QDHpgxPcYTbHeDE6l4Ho7mY96KFmUWHhBKzAnpzs07x5uEcJUNq2
 SRxte3tmCo1xipezYMRCagzvW9smS8usZ4qyczs/67iO9y6sBJinlV1+W5yBsxLuk0wc
 bboBbb9fYADfa3r56oyV/4znIjtu8+QnyO/epdcWhrTRMw1gedJ39jsvl1obQzMKsu0l
 Rmy4EiCzrpvvw3CqpTfM+xB9Rh3QLC3+e3jjutNLajVEPwnTf0LdkCD5pblvE8job7ZH
 mlv6662bRJY/F+UYKhZBX4FWsSlORr1U6/QpXk5T345pFb28k6LFv0h5kwiPMDzSQRYZ
 ktmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iuU0t04uho3+u1jEWN4+Tj4+LjtiwVd4BX2d3/21QFI=;
 b=ul1FscwmqKnFx0C7mwpnVo/NkhXeEgbMfrRPcjQKePqzN1gAHeTawlFPI8fHLKweyB
 8/NwgcblDfDmXdwOA6Er5zW+4WYDc9LJnoDF+Pe9ICVacr3dynB2YgDAIb8jFVlS0FEo
 6LOBiz4iFrHLK/6btEcww2qUmAcTo/h8qEwIoygEE1k4Hbf/5Lz9PZvrsEVW+iaf1fx2
 Ym9JVyPMXRsCwaKitIjwzGIgHS6FlaJKAiNanqc0Lmp8pP5iOnyDh14ddyHhMYKcbwam
 V5UP6h6KNN2gJO65cQZOZLnPUzxe42SsNUALRpKTR+H7bnv88ubPtawfUris5FvLacZs
 qMcQ==
X-Gm-Message-State: AOAM533BSsFCJS4VIcUFkOI9LzV7cnfsX2tZZQFnFF05c3FkHuAmhko4
 sc4omTGqM1bQ8ucbjFRS8pRDbg==
X-Google-Smtp-Source: ABdhPJzeescqcgBy7xA57sZy1sl7pvVtA6NYsEXaSIc3Us6GyRRoSZMSIG7uh23jxlUwTbQtn5rtog==
X-Received: by 2002:a62:fc15:: with SMTP id e21mr7951012pfh.167.1593298119875; 
 Sat, 27 Jun 2020 15:48:39 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id e9sm489474pjr.49.2020.06.27.15.48.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 27 Jun 2020 15:48:38 -0700 (PDT)
Subject: Re: [PATCH for 5.0 v1 1/2] riscv: Don't use stage-2 PTE lookup
 protection flags
To: Alistair Francis <alistair23@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <cover.1585262586.git.alistair.francis@wdc.com>
 <931db85d6890ed4bc2b527fd1011197cd28299aa.1585262586.git.alistair.francis@wdc.com>
 <a7f32084-2060-1de5-8308-987bcddf1e6d@linaro.org>
 <CAKmqyKPdGp+5n_fRuzi74JK8z8rcXMU+KiJw5v2nTMApHqXauA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
X-Enigmail-Draft-Status: N11100
Message-ID: <cb8ccef8-4a5d-9689-5027-a697fa859746@linaro.org>
Date: Sat, 27 Jun 2020 15:48:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKPdGp+5n_fRuzi74JK8z8rcXMU+KiJw5v2nTMApHqXauA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Sat, 27 Jun 2020 22:48:43 -0000

On 6/25/20 12:02 PM, Alistair Francis wrote:
>> (3) Do we need to validate vbase_prot for write before updating the PTE for
>> Access or Dirty?  That seems like a loop-hole to allow silent modification of
>> hypervisor read-only memory.
> 
> That's a good point.
> 
> Updating the accessed bit seems correct to me as we did access it and
> that doesn't then provide write permissions.

I guess my first question is: Does the stage2 hypervisor pte provide read-only
memory?

If not, all of this is moot.

However, if it does, consider:

  (1) The guest os creates a stage1 page table with a leaf table
      within the read-only memory.  This is obviously hokey.

  (2) The guest os accesses a virtual address that utilizes the
      aforementioned PTE, the hardware (qemu) updates the
      accessed bit.

  (3) The read-only page has now been modified.  Oops.

>> I do wonder if it might be easier to manage all of this by using additional
>> TLBs to handle the stage2 and physical address spaces.  That's probably too
>> invasive for this stage of development though.
> 
> Do you mean change riscv_cpu_mmu_index() to take into account
> virtulisation and have more then the current 3 (M, S and U) MMU
> indexes?

I had been thinking that you might be able to use some form of mmu-indexed
load/lookup instead of address_space_ldq.  Which would require 1 mmuidx that is
physically mapped (same as M?) and another that uses only the hypervisor's
second stage lookup.


r~

