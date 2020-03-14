Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jD26j-0008IL-KH
	for mharc-qemu-riscv@gnu.org; Sat, 14 Mar 2020 04:25:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49238)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jD26g-0008He-Is
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 04:25:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jD26f-0001P6-Iz
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 04:25:18 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:44712)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jD26f-0001O2-Dj
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 04:25:17 -0400
Received: by mail-pl1-x642.google.com with SMTP id d9so5425125plo.11
 for <qemu-riscv@nongnu.org>; Sat, 14 Mar 2020 01:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DKAdSIn18nL2qOH/s8IKICH6EQC4wBlD3mdDnlC9Q04=;
 b=mZhpvyylcr73Vav4cYN2f/qjgxel1kGg0pknAwG3jGJApfLSn+aAtU94qMhfdtMblT
 M5cCy1t9OOcM/Im8ESBnLE5+sp3O5GLn92gu7MYSnwD5YUHQE39oREh/loQXqRyvUYqu
 gcdBE50Jdf852fVsOjHApLjv5S7PAzdaSLoHCHhj+cqZu9hltlS16WxCwjWZ4zYwGvxV
 jrXnwsqHTjNnw9cdEe/vEbYvH7xgVpvTBibEnkm64PpBPAoU9xx94DnjAteKkfx91hIn
 u9QLIG3vw6QC8v1cuXuLcDlEGeamLW3G8Oh2lhCJd6nPvbfYTyeZ+yHooeYE5h4KVJur
 mHjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DKAdSIn18nL2qOH/s8IKICH6EQC4wBlD3mdDnlC9Q04=;
 b=DV2qLQvKSwFaFmP2hgBuxB1cdDhLTaSMMWMum7pX4Q3sVK3rVMgGA+AsdgQyey96i7
 G62h5h1fFh4ffrZTKh87QqRUOQF3e3yuMYk7bzqPWOFlMQgZcVno+KjbumX9dukceZzA
 dr+KrjQicmidvImtwqomoZxzHwXgXzSpAGb72QcFVcnz3RlymXZbuocR+fBVsF95OQKy
 aFm7g40UCJdQzMLRnluXRpG8V1WzSJFr+23ggqhtsQVhJ2HNCH2yNZzkxPm5+LR0dQGg
 OhbkQ2etJYZLp391YLJQOjQ0QOUCVRIpsQeEM4uSeTyFyIM0cmNMD09DivY77bubUPU+
 ziQg==
X-Gm-Message-State: ANhLgQ3Re8jCvTo8qyEot0FZMZtXiE5rLNzzVP55EzWMRBBLSeJO/KAx
 OEyC6SeKl8NfPu3zJZNzo0GvMv3z6X0=
X-Google-Smtp-Source: ADFU+vsiEN9dfdNLanVRHOEZLW2vheqpJRSnVIvRWeKbdC+7UVBf05Nvo5tU0fl/Lz+inJKORjC6tA==
X-Received: by 2002:a17:90a:8d86:: with SMTP id
 d6mr14111422pjo.119.1584174315762; 
 Sat, 14 Mar 2020 01:25:15 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 y7sm20510106pfq.159.2020.03.14.01.25.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Mar 2020 01:25:15 -0700 (PDT)
Subject: Re: [PATCH v5 24/60] target/riscv: vector single-width averaging add
 and subtract
From: Richard Henderson <richard.henderson@linaro.org>
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
 <20200312145900.2054-25-zhiwei_liu@c-sky.com>
 <834922de-5107-0d00-6d4d-47bd830129a5@linaro.org>
Message-ID: <2db448ea-f17f-e627-055d-fb3cdf6cfddc@linaro.org>
Date: Sat, 14 Mar 2020 01:25:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <834922de-5107-0d00-6d4d-47bd830129a5@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
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
X-List-Received-Date: Sat, 14 Mar 2020 08:25:19 -0000

On 3/14/20 1:14 AM, Richard Henderson wrote:
> I think you should have 4 versions of aadd8, for each of the rounding modes,
> 
>> +RVVCALL(OPIVV2_ENV, vaadd_vv_b, OP_SSS_B, H1, H1, H1, aadd8)
> 
> then use this, or something like it, to define 4 functions containing main
> loops, which will get the helper above inlined.

Alternately, a set of inlines, where a (constant) vxrm is passed down from above.

> Then use a final outermost wrapper to select one of the 4 functions based on
> env->vxrm.

The outermost wrapper could look like

    switch (env->vxrm) {
    case 0:  somefunc(some, args, 0); break;
    case 1:  somefunc(some, args, 1); break;
    case 2:  somefunc(some, args, 2); break;
    default: somefunc(some, args, 3); break;
    }

so that somefunc (and its subroutines) are expanded with a constant, and we
switch on that constant at the outermost level.


r~

