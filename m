Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1piPhI-0003Dr-9V
	for mharc-qemu-riscv@gnu.org; Fri, 31 Mar 2023 21:06:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piPhG-0003DU-V0
 for qemu-riscv@nongnu.org; Fri, 31 Mar 2023 21:06:23 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piPhF-0001Em-2b
 for qemu-riscv@nongnu.org; Fri, 31 Mar 2023 21:06:22 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 mp3-20020a17090b190300b0023fcc8ce113so27232661pjb.4
 for <qemu-riscv@nongnu.org>; Fri, 31 Mar 2023 18:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680311178;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=91wvJ6cxHZmm/KkL/Yxe171RrLkqIyhQT2fZbByREqs=;
 b=Envm8FQj3XgQ3X/xFoa8yK9NqJK5hFxx8nXAjbyrBDW+vl8o3+19Ojuwi3bgK592Ys
 /lRzhFye4Z9LF4vXfRnktDb56o1EUlNZwEG8js6rixkNU6UWGeEQIx5+FZ5qXx5KJGO7
 QVXB4wKwvPmsCRcGZOjn5gqVyTHfhsenU9g3DfBMT25ROLAEqQGrUZ/VqdZvKn+V5epp
 slaH/MXcw28I9qXW+xYdsj0RSmRtk1mFOdY3g57f3YGp8esCJObVRSj2ETp/aqYARJjc
 5Fpwmu9/Pngy4gDSVQj+JmRgKenCCu4HWHusO5sR6qWxJ3/7t1hLCttW4nqC8s1NrSL+
 eopg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680311178;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=91wvJ6cxHZmm/KkL/Yxe171RrLkqIyhQT2fZbByREqs=;
 b=FyW3nexDN+JB3gVKAJtJRaeJf3V6bf4g1hWsndkgVdujWk/iJOoYX+VKQm4RAg2j9b
 ggn7H2d9byhLwuz84N9mT36N+B7puZrpExfAZ5K9h1WEa1KkwP+8vy5gblT4hGzrlTBn
 z4snvlAaGrV2ORp2l6DvXgdSbLUre7+BsoDruJTLuLMr2r1B62biRSpCFSQmXj/d0jPG
 TvKEStgc6cscy5rTl07DY0jJSx2qKdWGv5rmF7+IFphjcZ5tyGBit0s6EWxet/ommU66
 +soqCJmexXC9J3DzhHGbR8mkmM3KhkmazrrsvZSNWGbihODWW18IAt5RaliZd7X0jMJf
 VUeA==
X-Gm-Message-State: AAQBX9eWAPb9gNW40ysDOrImtEeH+LXZmebTBd7YK8cmKyt2PjuxLdm3
 wjsV/zit556Tvn5iofMecnJqFA==
X-Google-Smtp-Source: AKy350bTSJ1rjdR4IjDUvCOMW+qIoj7vIK7+W8gbxSSp50K/peALHKuPlRVgx005ZGEJAxNCOMqjoA==
X-Received: by 2002:a17:902:ce8e:b0:1a0:65ae:df32 with SMTP id
 f14-20020a170902ce8e00b001a065aedf32mr38015428plg.37.1680311178304; 
 Fri, 31 Mar 2023 18:06:18 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:b714:1fce:85fa:2fc7?
 ([2602:ae:1541:f901:b714:1fce:85fa:2fc7])
 by smtp.gmail.com with ESMTPSA id
 jc20-20020a17090325d400b0019aa4c00ff4sm2130797plb.206.2023.03.31.18.06.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Mar 2023 18:06:17 -0700 (PDT)
Message-ID: <a256aa68-8cff-337d-bc33-401d8e39d387@linaro.org>
Date: Fri, 31 Mar 2023 18:06:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 3/8] target/riscv: Fix target address to update badaddr
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230331150609.114401-1-liweiwei@iscas.ac.cn>
 <20230331150609.114401-4-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230331150609.114401-4-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Sat, 01 Apr 2023 01:06:23 -0000

On 3/31/23 08:06, Weiwei Li wrote:
> Compute the target address  before storing it into badaddr
> when mis-aligned exception is triggered.
> Use a target_pc temp to store the target address to avoid
> the confusing operation that udpate target address into
> cpu_pc before misalign check, then update it into badaddr
> and restore cpu_pc to current pc if exception is triggered.
> 
> Signed-off-by: Weiwei Li<liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang<wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/insn_trans/trans_rvi.c.inc | 23 ++++++++++++++++-------
>   target/riscv/translate.c                | 21 ++++++++++-----------
>   2 files changed, 26 insertions(+), 18 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

