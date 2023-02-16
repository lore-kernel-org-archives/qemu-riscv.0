Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSRjr-00014s-IV
	for mharc-qemu-riscv@gnu.org; Wed, 15 Feb 2023 19:03:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSRjo-000140-CL
 for qemu-riscv@nongnu.org; Wed, 15 Feb 2023 19:03:01 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSRjm-0007sW-1D
 for qemu-riscv@nongnu.org; Wed, 15 Feb 2023 19:02:59 -0500
Received: by mail-pf1-x432.google.com with SMTP id j184so362198pfg.10
 for <qemu-riscv@nongnu.org>; Wed, 15 Feb 2023 16:02:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LOIkRH7TUPjDBmVuYMmdclpQs5reHe741TvewIhihM4=;
 b=ECKbQYKtp8z8uuEayZg8oQsfGn9NzdsD885TltVVUe1PKCdJcWjqmtejK4keY+sZ6N
 onwiJGIJ26ylja+ag6pJ6iA/6FJs6+I+1arRotW2q0nv5K0+UL3iPLjOuFVyF2TvTZ+U
 CU24EcNeFIBfepvnmZ8yS0JIC5u93xu8C6zpyIW9iqJdbdIPxSRC0Ug7p5tUVLR1o/ta
 1VkfebpCat34ZqR24ch+jVdD6cZBudF/sIwRmP8Ywxv9wAgNczC5mVb6IJyQyi91uphW
 BaX3IerHMlXQO8sUSjEQqOrFgHbEo0Jw/69AoKnaUsAaNHt1i4gWPkgz03As0K5ZBIhF
 AvyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LOIkRH7TUPjDBmVuYMmdclpQs5reHe741TvewIhihM4=;
 b=TAy9cYIFGOYpuOIysdtCWjPi2usKh6JojrwWgu9STVPcEL8pGXwfAC8bejwjHfqfc7
 ztd/W0IvXnMU6xKm2uV5IpgIr1VlO5oFL//MEqB5E13+VwEWw9d9jwDD3iKtwdMcTdGZ
 NjU36OkC19q0BcDmaDl44glxmkgQueaU6+A3fLJ7CzofrAbOxsCFuRVgZc2uE1jNILba
 EyL+iPYraQZwRuIjST8hLZcun4wGDW70ZLAscMaWe1Ddr4Hr9LmGWe6JFWX9rcbIti6b
 ZSwNDein9lS00xFtsD6NNX1SMNVS1Zw4+jsbtLXahywqqLdW+xvrZoyhyS4FDp7RAjDo
 D1EQ==
X-Gm-Message-State: AO0yUKVMdAR8hsnNpAzX+GUvqYSH6VM6jz9zv/Yh4GAiuJpnnFXERPjP
 ekdQYbwVz062nkX7kWWcNBLa2w==
X-Google-Smtp-Source: AK7set8Q9cqD16csvpvToEB3Ctyy1pzOgpqMHjj7T4KWbASozreC9JQuXW+l77TJ2fVgjlM/wA4wXw==
X-Received: by 2002:a62:1c47:0:b0:5a8:bc09:6430 with SMTP id
 c68-20020a621c47000000b005a8bc096430mr3471471pfc.23.1676505774875; 
 Wed, 15 Feb 2023 16:02:54 -0800 (PST)
Received: from [192.168.192.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 u10-20020aa7848a000000b005895f9657ebsm12179983pfn.70.2023.02.15.16.02.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 16:02:54 -0800 (PST)
Message-ID: <d9f692af-eb86-421d-f0cf-495f2a2e01b4@linaro.org>
Date: Wed, 15 Feb 2023 14:02:49 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v1 RFC Zisslpcfi 3/9] target/riscv: implements CSRs and
 new bits in existing CSRs in zisslpcfi
Content-Language: en-US
To: Deepak Gupta <debug@rivosinc.com>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com, Kip Walker <kip@rivosinc.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20230209062404.3582018-1-debug@rivosinc.com>
 <20230209062404.3582018-4-debug@rivosinc.com>
 <f68da758-a418-c528-6f7c-e6e0d0246255@linux.alibaba.com>
 <CAKC1njTbP0=H8w=izkMkEwVjq9=6m_Rw_ymgremjtbFYDGTrow@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAKC1njTbP0=H8w=izkMkEwVjq9=6m_Rw_ymgremjtbFYDGTrow@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 16 Feb 2023 00:03:02 -0000

On 2/15/23 13:33, Deepak Gupta wrote:
> On Tue, Feb 14, 2023 at 9:47 PM LIU Zhiwei <zhiwei_liu@linux.alibaba.com> wrote:
>> And MSTATUS_UBCFIEN field change don't need flush tlb.
>>
> 
> TCG code-gen would be different depending on whether ubcfi is enabled or not.
> As an example a TB might have code generated when bcfi was enabled.
> But if someone disables it,
> translation needs to happen again and zimops implementation should be
> generated this time.

tlb_flush does not affect translation.  TB are tied to physical addresses and are only 
flushed by writes or tb_flush().

The correct fix is to allocate a bit from FIELD(TB_FLAGS, X, Y, 1), and adjust 
cpu_get_tb_cpu_state to indicate when CFI is active in the current cpu mode.


r~

