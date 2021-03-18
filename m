Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lMseZ-0007r3-PR
	for mharc-qemu-riscv@gnu.org; Thu, 18 Mar 2021 09:25:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMseY-0007qM-TY
 for qemu-riscv@nongnu.org; Thu, 18 Mar 2021 09:25:30 -0400
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b]:36501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMseX-0000X2-DU
 for qemu-riscv@nongnu.org; Thu, 18 Mar 2021 09:25:30 -0400
Received: by mail-qv1-xf2b.google.com with SMTP id x16so3153640qvk.3
 for <qemu-riscv@nongnu.org>; Thu, 18 Mar 2021 06:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WExaGAKqF3gAJ7vqHPPLyDjFWie/MELjUvyG4RcAJjU=;
 b=V0J3V7p0Oc/6emESNB9fpV8fKVzflnX/LzPD61UFkOnNAAsJt79Q+i+Zb6l9ww1Si6
 Cq1Ore7XVH6WbpKqhdi+A/ZR5xcll/JB7HSmZmI9Nsw99VjMXVmaqSCQ0xiiHZRpgE++
 7GlGf8CxSfXj4XExKK99tNlREVr9PpcfMjuVMuUTiaJWq/Vn1WMfvXF3GhviSiExjzBL
 JU8xLwnkORnlnIl8tWjYpTWBGCqFYA6sWnCUTpaR+QuEouIwh61os6fQ2rCMdo66rw2o
 R+oB8BriP9iinuZ+R7iEODrLk/YCRSmiN643SOXhoWtipjBIOYWpCCaIjyYSBhSWAwsY
 RNgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WExaGAKqF3gAJ7vqHPPLyDjFWie/MELjUvyG4RcAJjU=;
 b=ek7mTsAEgw2csO/0+fEcxmhpuD7eSUBnTJmlIKvCGfEOo1LNISG5gXiowiV+x10FMZ
 t3Ow3WiI8b9wMuYCTJn5uJM93UOuu6S09qJqgzeITugYIx1OKaTEqbOPzIsgOpsNoCsM
 M0hD+gT6FJVMyhuxYLRHnSVJcjNLOjkWFiRx3iIoxdDNwNQiHp4+bTM6XlDB3hPPek3R
 b+kY7qOzng4uahwphDrqdEruX8T453/MoqoEWp5Be44i+Ox4h92y48+BfnZL2OdDYFIe
 acCB2bT8jxnFb2kVDAtQ5nGM7vzcDaAYTUaQsPLLhl1nCWtElbqnCNx+bhOjvaNPAxCT
 Cr7w==
X-Gm-Message-State: AOAM533bCpEydHFK6BUi4npwSrE5y/0CUJ6EdjP80T/aAZViVGrZSg5S
 MwBvbJJhGdS2kbCtivuvOUAVlA==
X-Google-Smtp-Source: ABdhPJwE3X8VUbGQrTS3mOAQvqfGbynUfG91vz0pErawkCRi9lJWWW6VAT9mlmtFuY1KsGyir1ucJg==
X-Received: by 2002:a05:6214:b27:: with SMTP id
 w7mr4277613qvj.34.1616073928127; 
 Thu, 18 Mar 2021 06:25:28 -0700 (PDT)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id i25sm1712984qka.38.2021.03.18.06.25.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 06:25:27 -0700 (PDT)
Subject: Re: [PATCH v1 5/5] target/riscv: Use RiscVException enum for CSR
 access
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair23@gmail.com
References: <cover.1616002766.git.alistair.francis@wdc.com>
 <6834cb79431f394b05b06a26317799c9066ccd4f.1616002766.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <20c52b91-3ddb-f384-3094-7efb344ca5ef@linaro.org>
Date: Thu, 18 Mar 2021 07:25:22 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <6834cb79431f394b05b06a26317799c9066ccd4f.1616002766.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 18 Mar 2021 13:25:31 -0000

On 3/17/21 11:40 AM, Alistair Francis wrote:
>           result = riscv_csrrw_debug(env, n - 32, &val,
>                                      0, 0);
> -        if (result == 0) {
> +        if (result != RISCV_EXCP_NONE) {

This was intending == NONE.  I.e. no exception raised, let gdb proceed.


r~

