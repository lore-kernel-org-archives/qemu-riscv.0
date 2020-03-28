Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jI2Uf-0006Gq-Of
	for mharc-qemu-riscv@gnu.org; Fri, 27 Mar 2020 23:50:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60218)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jI2Uc-0006Gb-SE
 for qemu-riscv@nongnu.org; Fri, 27 Mar 2020 23:50:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jI2Ub-0008BN-En
 for qemu-riscv@nongnu.org; Fri, 27 Mar 2020 23:50:42 -0400
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:34240)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jI2Ub-0008Av-79
 for qemu-riscv@nongnu.org; Fri, 27 Mar 2020 23:50:41 -0400
Received: by mail-pj1-x1041.google.com with SMTP id q16so4914358pje.1
 for <qemu-riscv@nongnu.org>; Fri, 27 Mar 2020 20:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vYSK+QZGTfqXcI0RKza85sUIJZRikjtw45NuTzVCe+E=;
 b=MjsgDJ9g/+E7oGWY8QpluUXI7fMtDnGU4T0RBbM11u8QQmtk2xMML8KHiQOr62B79A
 cv8yUuAwMyoUkQTfbjFB2m0mSHpqHfBi3YsPS35kUbyFesuQCkOj2MuDVd5YfgJ9RM1H
 99IdMLVSO1KefxzvjWrzfkXyEBoGWNK8bOIg3QsQ19hD+Wq3NbxTK/dkY0cNiqy8LdWS
 JkU5F21S1owepNzoZBsoTdTlB1F/M2ziHeDG5tjypiN9b2Gq5oqkpV0rRT3VDkMBW9hU
 yfMq0z+gE+9poesU6q0NMq9dyAzUeERM3F2jUkBX9VyzhUSMUpZ7qzXA6dHhLkURGR65
 bFfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vYSK+QZGTfqXcI0RKza85sUIJZRikjtw45NuTzVCe+E=;
 b=Zr9gKxvCWJylWwaijLyI2IfilbOpjo62z6AxUfdHyIbDbduH7qnadGOGeKHkv6HeOF
 qHiNawiTnVX+Aft466lW5Y8WdT/O2CV0fArSYXy4eQh8H6eVfshE3VUvBco7hB45og0i
 uI6V/vWwu08FToH0tdMygwv0S/0ys2yeyKbNZorQ75xr78EFqMLSV6IN9AosTAf7vQ6F
 YxuVETgT86Fv0wxCklf+QVWiXwrG8h1E+sFlDMIdizC34IM16pVF8pnct55MT5OYUVSS
 rAPG3UHbojwXUfJr9cj0+2PTVtiUAQUpmhGzFbHidp7lAlT1WW5/S3jBYpEYh98/utT2
 TCpg==
X-Gm-Message-State: ANhLgQ0oW6KR+nzer0ZEV9Z973BBOyWnXzPR/jUXS0HFSVJQzrfR4sus
 ma1teSCU8v7GGsFKeF/JuaJKPcTb/DM=
X-Google-Smtp-Source: ADFU+vveCbNEF7eiOG6NaXWevzWCYUPo6azrIL4HVTk01Bzy04OcqkJCIIHGeV+XiAJfbfkPl7tNGw==
X-Received: by 2002:a17:902:7445:: with SMTP id
 e5mr2151242plt.308.1585367439744; 
 Fri, 27 Mar 2020 20:50:39 -0700 (PDT)
Received: from [192.168.1.11] (174-21-138-234.tukw.qwest.net. [174.21.138.234])
 by smtp.gmail.com with ESMTPSA id w5sm5242658pfq.80.2020.03.27.20.50.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Mar 2020 20:50:38 -0700 (PDT)
Subject: Re: [PATCH v6 58/61] target/riscv: vector slide instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200317150653.9008-1-zhiwei_liu@c-sky.com>
 <20200317150653.9008-59-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fb54142a-7e99-e456-f8b2-f7ca1c99ca80@linaro.org>
Date: Fri, 27 Mar 2020 20:50:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200317150653.9008-59-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1041
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
X-List-Received-Date: Sat, 28 Mar 2020 03:50:44 -0000

On 3/17/20 8:06 AM, LIU Zhiwei wrote:
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/riscv/helper.h                   |  17 ++++
>  target/riscv/insn32.decode              |   7 ++
>  target/riscv/insn_trans/trans_rvv.inc.c |  17 ++++
>  target/riscv/vector_helper.c            | 128 ++++++++++++++++++++++++
>  4 files changed, 169 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


