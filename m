Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcfIF-0002RL-7F
	for mharc-qemu-riscv@gnu.org; Mon, 18 Oct 2021 22:55:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcfID-0002Qe-SR
 for qemu-riscv@nongnu.org; Mon, 18 Oct 2021 22:55:57 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:37856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcfIC-0005NZ-8T
 for qemu-riscv@nongnu.org; Mon, 18 Oct 2021 22:55:57 -0400
Received: by mail-pf1-x42f.google.com with SMTP id q19so16362026pfl.4
 for <qemu-riscv@nongnu.org>; Mon, 18 Oct 2021 19:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MKKSP9NC6BdMlcCy5Vpq+LZEIVHvncHsl4RqK0w/DTU=;
 b=Eex06PrjAiDlHSf/ezM1N9pGHgkpA1SnxMPLUx6cTb8Yydkqb9woniTFP7KeEL24Cy
 IGZtw0cMhyp/AuWM4HiHEVpsJq9x6OzLz4RQYBtb9NHFwCTFXcy0g52pk2zL47jbK7U5
 25Szb//Y9mQWVmf6gIhj0sRNoUTzaXJszZVGvKwUf/bxAVTRq6EaFsSu9bFdqnoOg/Gr
 yIFyKGI/JfBPtYZUt9IEGWqGzY9qw3ATPhfHlHFcogNIjAhmT7krT/gKYmHawE2EHDz7
 /qipgqBXkPjKHG3HTEqRE+XD2aIOatDw9clST/AroE6z5TrMV24tyhJxKKPPs1noKg1h
 08nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MKKSP9NC6BdMlcCy5Vpq+LZEIVHvncHsl4RqK0w/DTU=;
 b=v7wCoENlm8eAVgqDGzBeVT+DvGarcp+qzfTReb7f3bB2Om7ALpeP1uVhKJQPH8udel
 kYB4ePnJnkNIb5Ch+LE3A8dI177d+Jcged4g1LKRyjOlKGy2Z4NVPXMPHpMzuNcD5cet
 cPVvaQlO6lxKufSdHGtqpMvHMRWB3UPvaym43DhZIhS4pUBsKsMsMhgHmAtyAUtqa5w8
 qXcXID+MTSrv7b58zbffyFXtNd0D9p5hwycwOI+KKUPk+kCtSpBJ4io5L8ngPNRiHbmX
 t6EhGywby+EDNmQfMcr0/aN01tSkhoTqvnzU4khGFyw/lBRz/53pmbZk2JOOM/W2p744
 vGeA==
X-Gm-Message-State: AOAM530vDHe9P6ldBH2eHd/9iduKPH4HTpLQqYEjxvt8pLvBWxdWyGNW
 RSpnVirTIgU/v5KKtMdfvh5utA==
X-Google-Smtp-Source: ABdhPJwwAevXlCIKFZCIAZjBN41A8nEOc3977yWAkCxDmrMtvbZpdUkWP6sUbktA5IFbanRZbCqypQ==
X-Received: by 2002:a05:6a00:1407:b0:44c:d2cc:916e with SMTP id
 l7-20020a056a00140700b0044cd2cc916emr32700364pfu.64.1634612154545; 
 Mon, 18 Oct 2021 19:55:54 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id j126sm14795431pfd.113.2021.10.18.19.55.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Oct 2021 19:55:54 -0700 (PDT)
Subject: Re: [PATCH v4 15/16] target/riscv: Use riscv_csrrw_debug for cpu_dump
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, zhiwei_liu@c-sky.com
References: <20211019000108.3678724-1-richard.henderson@linaro.org>
 <20211019000108.3678724-16-richard.henderson@linaro.org>
Message-ID: <a92f732b-1ef2-1a53-c6d1-6ecf67f3ce28@linaro.org>
Date: Mon, 18 Oct 2021 19:55:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211019000108.3678724-16-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Tue, 19 Oct 2021 02:55:58 -0000

On 10/18/21 5:01 PM, Richard Henderson wrote:
> +            result = riscv_csrrw_debug(env, dump_csrs[i].csrno, &val, 0, 0);
> +            assert(result == RISCV_EXCP_NONE);
> +            qemu_fprintf(f, " %-8s " TARGET_FMT_lx "\n",
> +                         dump_csrs[i].name, val);

Ho hum, this assert fires under testing.
I'll have another look tomorrow.

r~

