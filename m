Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jI0cK-00034I-AU
	for mharc-qemu-riscv@gnu.org; Fri, 27 Mar 2020 21:50:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48093)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jI0cH-00033i-85
 for qemu-riscv@nongnu.org; Fri, 27 Mar 2020 21:50:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jI0cF-0005zh-Jp
 for qemu-riscv@nongnu.org; Fri, 27 Mar 2020 21:50:28 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:46520)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jI0cF-0005zJ-9M
 for qemu-riscv@nongnu.org; Fri, 27 Mar 2020 21:50:27 -0400
Received: by mail-pf1-x443.google.com with SMTP id q3so5386137pff.13
 for <qemu-riscv@nongnu.org>; Fri, 27 Mar 2020 18:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gWmKuzIO0eGQZxONM3xGtiq+pSDoMpdstKtxTg8KvNQ=;
 b=sbAUoe24D0ptfOvRF7BXhCIyU6JtFTOQNfh25UwqMOC5EKVPEzJ8W4LUsqiCsAMSAK
 2d+KmP8+tyeNfADXylnu6Nm0UmJIsfAaj0RayThoMw7GHa7BKmW3WbUOMC89sYH70/no
 rtSKgkSvP7EiLsFMKFlQ7kEmsp9O0HVjqPAZR5NvHP9M0JnKt8l9WbI3ZQP7SxZb8/q5
 fgKv66YvpualGqaFY4x7myqLpfiGpjmCCPX2ZvaLxwFN53nD+eMS/IQAhdcT1DFaBR4f
 ebp3MCWe3qiDNl0oMhmyxIJEGCfIGkBnsIe8+rr9bNAWSjW9y3fnKfcH9nQGvX2ksw2D
 XzQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gWmKuzIO0eGQZxONM3xGtiq+pSDoMpdstKtxTg8KvNQ=;
 b=BX2RnqFGyNI/2Ts+TJ4yvslySmQPt5gVIOILLNOtwDhJZ1oOip9a5CwGS1d9iabAFq
 kkd859tkW9eu56IBlvm2tzuc0wVjIdSISC5QKE3b2RMeq4pSj5N+IPcp2WLbZkdNjgYd
 oWyIMJCUwduYQfWILvFjoFyng3zmgrm3XgsUVPpznSsbQcXYTIAC8Fu5ZUJx2UEX872/
 OZ5/P1w1BmKYP85bDCOuQuFJgHYMcuZoxf23x1dwqnJqpfhakLyL8VssjLJ7fWroxErT
 j1R09/p9rS0eFKxPvwa2rAdnPMiHb1DCg/08Z8nJMR8OMMmNleN0hMIz5KNGjLhPzooq
 I86g==
X-Gm-Message-State: ANhLgQ3luYh8B1wYm+T/AXcyzIbdElfCOaD9Xjw7Frbv4QVunP486+F8
 0NB9Tbe0NkBOOCJ97D9LisDjVEEhBsw=
X-Google-Smtp-Source: ADFU+vsRKpUW0aCEnujIwWi6GEvOiPQj4P+CRCJPrfOplH5AbQNFm38rWof9Hg1t51KQLR5y+b7nSA==
X-Received: by 2002:aa7:9433:: with SMTP id y19mr2122999pfo.233.1585360224833; 
 Fri, 27 Mar 2020 18:50:24 -0700 (PDT)
Received: from [192.168.1.11] (174-21-138-234.tukw.qwest.net. [174.21.138.234])
 by smtp.gmail.com with ESMTPSA id e14sm5047849pfn.196.2020.03.27.18.50.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Mar 2020 18:50:24 -0700 (PDT)
Subject: Re: [PATCH v6 29/61] target/riscv: vector narrowing fixed-point clip
 instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200317150653.9008-1-zhiwei_liu@c-sky.com>
 <20200317150653.9008-30-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6ca352a9-4fab-7b17-13ae-9074926685d9@linaro.org>
Date: Fri, 27 Mar 2020 18:50:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200317150653.9008-30-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
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
X-List-Received-Date: Sat, 28 Mar 2020 01:50:30 -0000

On 3/17/20 8:06 AM, LIU Zhiwei wrote:
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/riscv/helper.h                   |  13 +++
>  target/riscv/insn32.decode              |   6 ++
>  target/riscv/insn_trans/trans_rvv.inc.c |   8 ++
>  target/riscv/vector_helper.c            | 137 ++++++++++++++++++++++++
>  4 files changed, 164 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

