Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mMCdy-0007kj-Aj
	for mharc-qemu-riscv@gnu.org; Fri, 03 Sep 2021 13:06:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMCdp-0007gJ-Bx
 for qemu-riscv@nongnu.org; Fri, 03 Sep 2021 13:06:15 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:44631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMCdl-0001Lo-MH
 for qemu-riscv@nongnu.org; Fri, 03 Sep 2021 13:06:12 -0400
Received: by mail-wr1-x42b.google.com with SMTP id g18so9124788wrc.11
 for <qemu-riscv@nongnu.org>; Fri, 03 Sep 2021 10:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SbhxO18hKA6LmoOoc7btkmv0ZNkhee8e8+KWqz+DPnk=;
 b=ZN6zlQ49xTUlzE6NqZFDeEvrgY/hRQDJ8C8KQwugV1q1G/vRPvlcx5JN+6tP1gJlSP
 WeUiZqew5J49NrEVye4MscalBayVyq+hY6DMamyxmW0229Fi5QMyTpIC7fYtxcwP9lzj
 p0rPfL6nhM9NlW0+4MoLT2AKvdd/tW+4x75JMLQw2BzFybyPnZzuYP/n44Jy/gMjqzjy
 CpG3VJI517OXZIrmUcXrTTxEQLep23EJH7ah8o311Cap+0zeHdZSHjSJQnrT68aodGIj
 XcSyLcppLoU0Uw5pYh+4zRiClr26hIDpwrDdXBQG1rV0iB0pf5wbbszuqkab/0YVlgos
 8xZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SbhxO18hKA6LmoOoc7btkmv0ZNkhee8e8+KWqz+DPnk=;
 b=ZzDyVOL0GNDhsQSJiMKdWwemwo+7Lesaqmilc6//IdUIk7yI566Rn16hXCX3mH8bvX
 GCNoonG5XWIqV6YjFyYPfw8aoMPS8Z97Tn2TErAq3DwgsK1TQTal3cmV43msck3l9wjZ
 X1GyuML+aPeRBpYmtz17+un0KwPkS+1XfjDnX11mLqnf5w310n+MFXQQ52nawfanQ27k
 b2oEtTDMKzp2GlLK2StAT2jZYtFYvFolmtqiP9eEwKBT2BtYlM6CbgyLk9Ew4GvKS/Fh
 1icXvazmwML95m27Yn1GuWvUbREvkEg/A/VRy6xRah93hbWzas11VKTycr5I0cOBbnuU
 ikgw==
X-Gm-Message-State: AOAM532rD1S7NPu540Z8YG1Ilo2LRshCqSqBdSpgR+S8WfULVBLRtMud
 MNIN1L9CHnakM8MdNrkuZVZUHw==
X-Google-Smtp-Source: ABdhPJyRk526hk9yJlTTuvsKA6KaisWLVYfcJM0KyDHoAXz/jEyjyKELaeB62YrbsIaR92taNBxkKg==
X-Received: by 2002:adf:c449:: with SMTP id a9mr86011wrg.256.1630688767445;
 Fri, 03 Sep 2021 10:06:07 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id k4sm5310801wrm.74.2021.09.03.10.06.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 10:06:07 -0700 (PDT)
Subject: Re: [PATCH v1 2/2] target/riscv: Set mtval and stval support
To: Alistair Francis <alistair.francis@opensource.wdc.com>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
References: <cover.1630624983.git.alistair.francis@wdc.com>
 <968ed1af9002f5f9f42f9efe8a5db5a1ed830a09.1630624983.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c2a74b35-70ad-d41a-26f9-3af2a8ce775d@linaro.org>
Date: Fri, 3 Sep 2021 19:05:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <968ed1af9002f5f9f42f9efe8a5db5a1ed830a09.1630624983.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 03 Sep 2021 17:06:18 -0000

On 9/3/21 1:23 AM, Alistair Francis wrote:
> +    DEFINE_PROP_BOOL("mtval_inst", RISCVCPU, cfg.mtval_inst, true),

Dash not underscore for the prop name, I think.


r~

