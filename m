Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jr39S-0002eB-K6
	for mharc-qemu-riscv@gnu.org; Thu, 02 Jul 2020 13:37:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jr39R-0002bj-Dx
 for qemu-riscv@nongnu.org; Thu, 02 Jul 2020 13:37:33 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:33975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jr39P-0006AG-M4
 for qemu-riscv@nongnu.org; Thu, 02 Jul 2020 13:37:33 -0400
Received: by mail-pg1-x541.google.com with SMTP id t6so13817789pgq.1
 for <qemu-riscv@nongnu.org>; Thu, 02 Jul 2020 10:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MhMg4rPf1u+L6cvVhFXqDVElEDNcAbRtLEvG8y507Rk=;
 b=WblYSB8lVQVWEhhXwagbDAO5PTOKP1az66mjxsULRdLoggcc8lF07bJHGNGFWq9Q8M
 A0AbgW6flt6p/M4kPuDvcPZvITYmID/o63ArRtzy0zXUPh7rJxur59hbmH49euKy1tXr
 BB//a/qXbN9sHk+5J9LUA325Y8rQ6trckdMD4UWqW9lJzrWtOK5/RG0zV9ausRrrvn3t
 8ifHJrxKOfDxwkHrYXzCELgiCCSIcka8oy2prG6xJZ8CO2cuNnKFDf5Q29n74vpBmmt4
 JUgIeP4tJmzT1ADux/mJ8wKAKbUpD1ac9t5fWHfuSUzqnDtLqIbO4DTxCHqA7l9PL1mW
 n5Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MhMg4rPf1u+L6cvVhFXqDVElEDNcAbRtLEvG8y507Rk=;
 b=si5xsoRKgaxsMhoCqDt6yGrirg2VsFXyplOurJBL+4HY3C8nRL+9wQceP6dtZ8KfJv
 ZpLRqQC1zSHxOxZZ6WQszZlQjY9BYv6P7YwtISIldf0vVijXKCPmrX5RdDV/cZ818olu
 uXaoIb/CYcxNQRbXUyTKwRk/itH9cZSCvMJ2Z+OgL2JZdB9M4FYxR4ctjFIfjZB1SsmV
 vE+rFYD+PXwuQN93winJNA8lMjr8n6Bw1eIHSEPiBFvBaK0OhOrohgoTQhKhxfHMR1T7
 MUoGFc1zaR9qCeNm2CVacq8DjooYAPqxRvN8NdIF3r5SwBZ1Iuhg2tjVxLxvDie950C/
 8ovg==
X-Gm-Message-State: AOAM533J/aTyoR+ZY6MJusKn6JHjvCYXXZCkRKliZncRrAWunZjg4iGK
 11AUfHf8g8LRm/0gFf0NcX9BGw==
X-Google-Smtp-Source: ABdhPJz0a2XTjLSXfX9YuvOVIpKCaHK9zP6zPR1cCUj2KvGR0Yz1I7XUuksqQeXkR8JdBY35gv6Jxw==
X-Received: by 2002:a05:6a00:1342:: with SMTP id
 k2mr28924874pfu.32.1593711449822; 
 Thu, 02 Jul 2020 10:37:29 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id p10sm3783746pgn.6.2020.07.02.10.37.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jul 2020 10:37:29 -0700 (PDT)
Subject: Re: [PATCH 0/6] target/riscv: NaN-boxing for multiple precison
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, wenmeng_zhang@c-sky.com,
 wxy194768@alibaba-inc.com, ianjiang.ict@gmail.com
References: <20200626205917.4545-1-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6d2e6876-18a8-b32a-0879-565693b6d446@linaro.org>
Date: Thu, 2 Jul 2020 10:37:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200626205917.4545-1-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x541.google.com
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
X-List-Received-Date: Thu, 02 Jul 2020 17:37:33 -0000

On 6/26/20 1:59 PM, LIU Zhiwei wrote:
> Multiple precison shoule be supported by NaN-boxing. That means, we should
> flush not valid NaN-boxing input to canonical NaN before effective
> calculation and we should NaN-boxing the result after the effective
> calculation.
> 
> In this patch set, split the implementation to three steps for compute,
> sign-injection, and some covert insns, which are check_nanboxed,
> effective calculation and gen_nanbox_fpr.
> 
> Check_nanboxed checks the inputs and flushes not valid inputs to cancical NaN.
> Effective calculation is direct calculation on fp32 values.
> Gen_nanbox_fpr does the NaN-boxing, writing the 1s to upper 32 bits.

I know I just reviewed a couple of these, but then I got to thinking about
patch 3 more closely.

I think it would be better to do all of the nan-boxing work inside of the
helpers, including the return values.

Since we must have a helper call for the actual fp arithmetic, we might as well
put the rest of the logic in there too.  That way the JIT code is smaller.

If, for RVF && !RVD, we always maintain the invariant that the values are
nanboxed anyway, then we do not even have to check for RVD at runtime.

Thoughts?


r~

