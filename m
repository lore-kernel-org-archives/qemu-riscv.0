Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pmXPB-0007N7-3Q
	for mharc-qemu-riscv@gnu.org; Wed, 12 Apr 2023 06:08:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmXP9-0007Mg-65
 for qemu-riscv@nongnu.org; Wed, 12 Apr 2023 06:08:43 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmXP7-0006bo-C7
 for qemu-riscv@nongnu.org; Wed, 12 Apr 2023 06:08:42 -0400
Received: by mail-wr1-x432.google.com with SMTP id v27so1088317wra.13
 for <qemu-riscv@nongnu.org>; Wed, 12 Apr 2023 03:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681294119; x=1683886119;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Jwh6tjaX95EY2R1QvZ0DUQ4zm0KmrHEBJYJyQfYQibE=;
 b=Mej3x+PEspNXyW/TFDL8SonT7XWXTpJAdP3gU5eP48on4V3zGprT1P+nklP2XVTq+A
 jAo+nXQpsLFPmb1Iymr/o9FoTI/idgWTEYkq3K3JuJSgs6Zs7kmLPFD4DITT+ompvqw4
 ZK2UbblnzEHzrpqUqMR8dF7Hkr3thQsr80Wa6hcIxYfWTLn8Lx9kLFtRAEnZJ1LcBDJp
 OHBQMTxzj6k/SF4oy15OS4zrvwc3Pwfil6XDhrx5JJAWsaC37Cxcbm3LbfyAvs6+UFMh
 0HE8aa22lccZ32gn3p5gaNyNg+40706yagE0lns+LTSrVtlBTkv7aOViO24YEBHu4nw0
 S9HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681294119; x=1683886119;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Jwh6tjaX95EY2R1QvZ0DUQ4zm0KmrHEBJYJyQfYQibE=;
 b=oVjyfcQL2rU3yQ2vv22LInn/wY2X3kkoi9JHEi2BONJDr36YjeTQzSs7DBCd7dxF7K
 5Si9XycxKNNyFp/g4oK+ZdxNBxwScf7d5/KF9GHaortLfDxRLLTOnAGDNwmNz3oLqG6Q
 StUFBzyWSL6xCjDLDZR5xGaFdDAbofNsKsbwCLDqG9cSuyxaEtv2kNv4jSMwUAjo077X
 xztxGlKY1PPFTZioMcV57Dosjf4KhWTIttxUqiIqlxuB1Ft+57dbkDUdvBzQCVmKr98k
 rYe1d+XmNRHl00AjqbsK3rxyNqlV3HuduEJ5nNbpwDCydkRIFl7iH3snrCec63eZc/4A
 xY2g==
X-Gm-Message-State: AAQBX9c0bQU6f4ljv5TDUe79F1CvgiTBQ+ydmtdiVSuoo3OuE0cB25kF
 ckn7FQfEx4lpWPNEdIEtkqf6Hw==
X-Google-Smtp-Source: AKy350YmIvttlWNTicrzj4NhRuMh7muqShdQljEPmwUQgIzcnBCsKL3NJJHMBkEXJQ5A/GYjq6bJXQ==
X-Received: by 2002:a5d:6451:0:b0:2ef:ac55:1e92 with SMTP id
 d17-20020a5d6451000000b002efac551e92mr4430090wrw.25.1681294119580; 
 Wed, 12 Apr 2023 03:08:39 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.216.226])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a05600c365000b003f049a42689sm1820552wmq.25.2023.04.12.03.08.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 03:08:39 -0700 (PDT)
Message-ID: <8b6684f0-6ee1-5446-7937-5d466f6baca3@linaro.org>
Date: Wed, 12 Apr 2023 12:08:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH] target/riscv: Restore the predicate() NULL check behavior
Content-Language: en-US
To: "Wu, Fei" <fei2.wu@intel.com>, Bin Meng <bmeng@tinylab.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Palmer Dabbelt <palmer@dabbelt.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20230411090211.3039186-1-bmeng@tinylab.org>
 <b0d06bc4-d8f1-30ff-9bc1-252c7f15df89@intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <b0d06bc4-d8f1-30ff-9bc1-252c7f15df89@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.17,
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
X-List-Received-Date: Wed, 12 Apr 2023 10:08:43 -0000

On 12/4/23 03:04, Wu, Fei wrote:
> On 4/11/2023 5:02 PM, Bin Meng wrote:
>> When reading a non-existent CSR QEMU should raise illegal instruction
>> exception, but currently it just exits due to the g_assert() check.
>>
> I verified that 'csrr t3, 0x4' in user space didn't cause qemu exit but
> raised illegal instruction after applying this patch.

Good candidate to add in tests/tcg/riscv64/ :)

>> This actually reverts commit 0ee342256af9205e7388efdf193a6d8f1ba1a617,
>> Some comments are also added to indicate that predicate() must be
>> provided for an implemented CSR.
>>
>> Reported-by: Fei Wu <fei2.wu@intel.com>
>> Signed-off-by: Bin Meng <bmeng@tinylab.org>
>> ---
>>
>>   target/riscv/csr.c | 11 +++++++++--
>>   1 file changed, 9 insertions(+), 2 deletions(-)


