Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nOOd1-0007sc-Tl
	for mharc-qemu-riscv@gnu.org; Sun, 27 Feb 2022 13:50:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOOcx-0007oS-Nf
 for qemu-riscv@nongnu.org; Sun, 27 Feb 2022 13:50:39 -0500
Received: from [2607:f8b0:4864:20::102a] (port=36470
 helo=mail-pj1-x102a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOOcw-0005pZ-2c
 for qemu-riscv@nongnu.org; Sun, 27 Feb 2022 13:50:39 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 g7-20020a17090a708700b001bb78857ccdso12904636pjk.1
 for <qemu-riscv@nongnu.org>; Sun, 27 Feb 2022 10:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=xzduNgMDW5z7SEedhMhxumYg/Ic635OdJBUksogcrFw=;
 b=fBSnxtHAIDOUcOS77CWJBDPtlOpWjyPvD14iBefP64ULMeyuUQCLlDu8WMX+/wCQfd
 w9YyuEtQef+Qhfq/yIZVGNFO681Wd/e14yYoFmIh/O2yxbsBq1qIIwf2Ql/H0eF9PGVU
 c2OMJvoiH0cUO2kWV47a0ZRezkQIY/PvfiBByyXqHB0BR88xAPEfAod9LDTwLzqg7eal
 giC/RV5NDcQvltxra0ERifD0/pqJD3SimEqb6lXXc5co7C4Nrls4MBhqEJXBBOBkzIY7
 c3+fZuZMXLD5avzMTK9drGCTiBigyhYq4N/Obnl4GMYIAQK32OSy+XUi6giMr95DFEHC
 jPwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xzduNgMDW5z7SEedhMhxumYg/Ic635OdJBUksogcrFw=;
 b=f2of+Hs+ZzaupOtv8E344YA3kBVdd7gIFgJqJ0l9p/Zs3Gk3D3PCtXXyaJ5qN636d4
 n4gPtkdsVQar+zXTcIGxpgP6P7UtT+sC+/82/jklU5W+Jxi2tCAo+lf8dY3NPRHe548/
 Z5z3+2KwF82M2T/mhv34QMFl6GKbTvsvbqMeMe77O/k8/N0h3iDIHMBlpyNY//Kdx5sZ
 IIO5vDFZokZr915xf5fazpY/U/VPI8uy0yShn5NQyy06FJuo0Zxv6V/BUOy+89rkTtfV
 zoG2Nzskb0hI/qVCvpCGVkvlfM+CScN6dBS2a5gz5vp0wDMya/cUhwfEOWfbvIyPvh2t
 ewyQ==
X-Gm-Message-State: AOAM530G2SOVDauekBRo0U4AOFIJp51CvTv/5SSdFny9LCBOLYeO2Yuf
 kquq8NPmhytMJh0R4sSDH0jNgg==
X-Google-Smtp-Source: ABdhPJxAgMz9nBiec5yYGsiOAJQMI1tWAJ6PpAXRS5okETj+V6Cf4gq/UoJMzWePSqEEyFvzgQhyKg==
X-Received: by 2002:a17:902:b204:b0:14d:a8c8:af37 with SMTP id
 t4-20020a170902b20400b0014da8c8af37mr17196667plr.108.1645987836320; 
 Sun, 27 Feb 2022 10:50:36 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:23be:43d9:7006:705a?
 (2603-800c-1201-c600-23be-43d9-7006-705a.res6.spectrum.com.
 [2603:800c:1201:c600:23be:43d9:7006:705a])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a056a0015d100b004c59f7dc606sm10670597pfu.28.2022.02.27.10.50.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Feb 2022 10:50:35 -0800 (PST)
Message-ID: <29d8b5d3-2f48-656a-a868-37154c75f756@linaro.org>
Date: Sun, 27 Feb 2022 08:50:32 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 04/14] target/riscv: rvk: add support for zbkx extension
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, lustrew@foxmail.com,
 luruibo2000@163.com
References: <20220227142553.25815-1-liweiwei@iscas.ac.cn>
 <20220227142553.25815-5-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220227142553.25815-5-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sun, 27 Feb 2022 18:50:40 -0000

On 2/27/22 04:25, Weiwei Li wrote:
>   - add xperm4 and xperm8 instructions
> 
> Signed-off-by: Weiwei Li<liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang<wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/bitmanip_helper.c          | 27 +++++++++++++++++++++++++
>   target/riscv/helper.h                   |  2 ++
>   target/riscv/insn32.decode              |  4 ++++
>   target/riscv/insn_trans/trans_rvb.c.inc | 18 +++++++++++++++++
>   4 files changed, 51 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

