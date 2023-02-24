Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVLoI-0002r3-HC
	for mharc-qemu-riscv@gnu.org; Thu, 23 Feb 2023 19:19:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVLoG-0002oB-Dm
 for qemu-riscv@nongnu.org; Thu, 23 Feb 2023 19:19:36 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVLoE-0006V5-F8
 for qemu-riscv@nongnu.org; Thu, 23 Feb 2023 19:19:35 -0500
Received: by mail-pj1-x1036.google.com with SMTP id l1so4447247pjt.2
 for <qemu-riscv@nongnu.org>; Thu, 23 Feb 2023 16:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=u7JRiclnGqGAdrNbsBR7z4ezjVJSG0UWXLx2KM2/FAw=;
 b=hb5U6Vu6S3R+PTwdKfBl0u6r6Pj6vgsZJ3yqYaKin/m52erFGbz5yL2tHs9gB4rW7Z
 9FydpALnKkQTAHNCzKpX37gWdMdVKffvi47BUx35ekkaRccMhIRWPbnNdBVRqPYoYqKR
 0ajC15OpjNjPzR499R5Vi/nhd4vuBAHHKKTTD8MB8KnTT5dGAB+e8Crm56lCEEv5Jvus
 +9oaoQOzAPQo5/+NyRR7ZRUQw25KCK0oZn6WD4jXbbJFl1mgYO/wO4Ok76mbW3aPzqlc
 r0VeEyctWzcXbBCf4U6QFuk4QviUk2hwhRxGZYuhuGYghtsVua+fRrsNP5ZMGK2c1yrP
 FNnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=u7JRiclnGqGAdrNbsBR7z4ezjVJSG0UWXLx2KM2/FAw=;
 b=rsEOOfnruGcdpKlk62qMrFtnxQPoGumC+x9IjWjQjl4I2c1vF+/y1s2ONuod3IBogn
 zcbnZYCdRQHsZPxs1BfmUhflf3mOvb1wRt9NJoJMuDV4XiAP1F7zWuXzL8HRrKdOmuNZ
 UJlVFLjwuvthvScG5xCKsG7fJJZfBI5br1fTqoB7Ucy1vPw2M6bDvFll4ieiZ1tKumhR
 +lLIclDXwcPTFe815hTOCBsYkYHDynNq5HNSdpPvby5h9uXhpKL4onSA515+XQogWyUr
 1uXM7AKnxzF/9GmMWyiP0jmw2+FlOGRS06WO6CSlRATB5fuUXpZmUa0Al/23FjNPEZzZ
 wiRQ==
X-Gm-Message-State: AO0yUKWp/EG4kbRwyTHoiZOO5uqu4AhLsv6G2l1eNlW0/a0CVBG3zBGi
 s7n0IWIenJSaUSt/tHY7F/BwrQ==
X-Google-Smtp-Source: AK7set9v5az8rWqZ03hfnmVZSrqO9eW6Fq8FGZw69ez9lb5H02xcd92L2YlPwfWKtIjhkWi/yt/1JA==
X-Received: by 2002:a17:903:2344:b0:19b:98ce:490e with SMTP id
 c4-20020a170903234400b0019b98ce490emr16843595plh.45.1677197972636; 
 Thu, 23 Feb 2023 16:19:32 -0800 (PST)
Received: from [192.168.54.227] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 x24-20020a170902821800b001947222676csm8174226pln.249.2023.02.23.16.19.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 16:19:32 -0800 (PST)
Message-ID: <78a0f5a5-c2da-c016-1f15-981cf80bf676@linaro.org>
Date: Thu, 23 Feb 2023 14:19:28 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v7 1/4] tcg: add 'size' param to probe_access_flags()
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com
References: <20230223234427.521114-1-dbarboza@ventanamicro.com>
 <20230223234427.521114-2-dbarboza@ventanamicro.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230223234427.521114-2-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
X-List-Received-Date: Fri, 24 Feb 2023 00:19:36 -0000

On 2/23/23 13:44, Daniel Henrique Barboza wrote:
> +    if (unlikely(flags & TLB_NOTDIRTY)) {
> +        notdirty_write(env_cpu(env), addr, 1, full, retaddr);

That '1' should be 'size'.  Fixed locally.


r~

