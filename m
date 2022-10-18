Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1okf44-0004vo-TI
	for mharc-qemu-riscv@gnu.org; Tue, 18 Oct 2022 01:22:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1okf3x-0004uC-70
 for qemu-riscv@nongnu.org; Tue, 18 Oct 2022 01:22:51 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:41753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1okf3u-00007Z-GV
 for qemu-riscv@nongnu.org; Tue, 18 Oct 2022 01:22:47 -0400
Received: by mail-pl1-x631.google.com with SMTP id l4so12783613plb.8
 for <qemu-riscv@nongnu.org>; Mon, 17 Oct 2022 22:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CmfNFyK2GEYB504DNt4vCfQejiDdqFldsKIUHhJyDj8=;
 b=sIx8WMXbBTcxNakqbBATQKWCr/hNdsizejshAQMx2eQbGkM8G6KZwN349MVBbPX7em
 LMMw0qmJ5HGrzPDZ+TOjsyGr7xJhCWB3kfPPPDSV4owH9k4QQSlg5UtLtt4hfXTR3yfl
 iFIbnEbxAN/pFwOgY/PIWEz+kpVxtA4c2bq1wkF4+a0vu7tKyIyBgjc2tmKQq0YullZc
 vBzjwKuySkJD2Osv/bMUZIX6VL435emAzSnU1F5M56xCAsZ8GIq+p7Hh4AZx7hNKY6d6
 eU1nxwWEAPvtx/9dMhFEWqing80MvaRGOQ4heCXq3FAOhc95PBf76dtreXRSirrYlUY7
 zenA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CmfNFyK2GEYB504DNt4vCfQejiDdqFldsKIUHhJyDj8=;
 b=LzmEpVXCxALv6wkYNOVeS3apjdAwSeXNpGMG9Y0BOOtuQn4azb0Kcf315BWUYZ0iTC
 RTDgW4/T5QfAnMQpFdgIep2F/jcR5MvmVp90OonZpvEbflVCiRBariW9zI9lyNM2efEg
 mFbmnV/8O1AyI6ou1cTw+LueQKQ+kVX0/eOf1K6l9n8p/A3bckK5wJyYy+LZjbLUiFev
 XPrvTjVF3JLbseQVuAU4CwzHG3VLMpx2HP55K9Hf93iNDmDZ66d2QXvj8NWF2f5MukJp
 MCWmZkgQB7dte5fM2JT9cu3BSlqcno0JdA6/aIfHeN6M7MSQpbW5O/OX4GHuSwp2Yy2F
 9Sdg==
X-Gm-Message-State: ACrzQf2bIEWs+kzIKeUsVBRty8hQDvRzv/v3pN4jAuJAqTqegOZwcUDs
 kJHM16yVABBiQtRNPbFdSYngfA==
X-Google-Smtp-Source: AMsMyM5K2weTkudIDghUwe49vxDaiRQHh5ZtGmN7Fmo0tzDH8QQHXPY0WY4TQ1bEm+2/AmqFoTyfqA==
X-Received: by 2002:a17:903:22d2:b0:17f:7dea:985f with SMTP id
 y18-20020a17090322d200b0017f7dea985fmr1316420plg.68.1666070560457; 
 Mon, 17 Oct 2022 22:22:40 -0700 (PDT)
Received: from [192.168.1.107] ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 w9-20020a628209000000b0056276519e8fsm1445761pfd.73.2022.10.17.22.22.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Oct 2022 22:22:39 -0700 (PDT)
Message-ID: <b97a7b1a-f8cd-b0d5-bbde-1a06049281dd@linaro.org>
Date: Tue, 18 Oct 2022 15:22:22 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: Question about TCG backend correctness
Content-Language: en-US
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org
References: <4672400c-0084-3bf3-a596-7a42115301f0@linux.alibaba.com>
 <87lepeeno0.fsf@linaro.org>
 <4841b154-bd05-c677-cfb4-46a350ddd0aa@linux.alibaba.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <4841b154-bd05-c677-cfb4-46a350ddd0aa@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 18 Oct 2022 05:22:52 -0000

On 10/18/22 01:27, LIU Zhiwei wrote:
> Maybe I can run RISU on qemu-aarch64(x86) and qemu-aarch64(risc-v) to check the RISC-V 
> backend.

This is a good start for debugging a tcg backend. It's not comprehensive, because RISU 
executes one instruction at a time then raises an exception to check the results.  This 
means that the tcg optimizer doesn't have much to work with, which means that the tcg 
backend is not as stressed as it could be.

>> I've long wanted to have the ability to have TCG unit tests where a
>> virtual processor could be defined for the purpose of directly
>> exercising TCG.
> 
> We already have many ISAs as the front end of TCG. Will the virtual processor here be some
> different?

It wouldn't.  This is my argument against creating a new virtual processor.

I do think we should be better about creating regression tests for bugs fixed, in the form 
of small focused assembly test cases which get run via check-tcg.


r~

