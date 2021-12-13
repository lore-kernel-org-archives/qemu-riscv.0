Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mwn7K-0007Sg-9T
	for mharc-qemu-riscv@gnu.org; Mon, 13 Dec 2021 10:19:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwn7H-0007Pn-Uy
 for qemu-riscv@nongnu.org; Mon, 13 Dec 2021 10:19:52 -0500
Received: from [2607:f8b0:4864:20::102c] (port=42730
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwn7D-00077Y-UE
 for qemu-riscv@nongnu.org; Mon, 13 Dec 2021 10:19:50 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 fv9-20020a17090b0e8900b001a6a5ab1392so13619274pjb.1
 for <qemu-riscv@nongnu.org>; Mon, 13 Dec 2021 07:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wRQAdwlSSg+bW7hgiu0nEjyCka8fgmrwoXgoQdwAwg8=;
 b=Ma7t3l5fQrrhWhCF88CDY8aSKMwrsIT2PFUDhbJrSkkF75g91uGWjG9Zxe9VMgfttm
 w7lnEVeTmbF4fmyDP5ZlWJVaqWqxuo9jPJ9Q2nU1DKOciN0Idmsd0knN2G6acDyhucn4
 X5lhVsRs1HdLbXH21xDUBMMpQsC3gJ02ef0uha/mcucMYtkTOE7ZsHey0SNQhhltEBpZ
 khxTQHEh7RaLEGpObxPH9eHAHllyrcsZ6Jk5KDjN4BVCfIHDAs71B7ZliiLlzhsSZ3VB
 IvuQ96b3ScOQQYi6YqzYgN2826dx7xvq5x0ZsV+YU84vou0Zi602RlrsF5DCsZ1GV1d/
 IyQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wRQAdwlSSg+bW7hgiu0nEjyCka8fgmrwoXgoQdwAwg8=;
 b=V+7vYmNdXKGB8oZPQaibL6AKD8Dl9BC6EfBDUaXIk/XkAUqYzKTmCc13kulCyW81A9
 mJrUk11Ek5RpQmVgvs/6czXyyAitZpTH4FfU0up3dNx/o9ISZ8QuQ5Gz/WzkRWYkZlQl
 KJbue+neDTwdPqJIP0jB1UiiMfZQP4dpw7glMhrYhNqJaur9CQR4D0bhkF+gwKWaQ/wd
 w5GFlNwZQiztBeYOrWUq0lvUlRZeF0uZJ1mDZ3ysFcaRtG1d2+ER3VsKGXWBX1BNwgVT
 B11qacdao+9LajhA1OFWQicSVpZiXg1199+qnZMSdFrTWMNh5STQr4lxEimTy7GPUUOq
 5lTg==
X-Gm-Message-State: AOAM531XsAtzYTcyRKzWOiW7zN1l1TTHQjlNFTjXO+argyZ3UZFey2FB
 cb3XpUl09Lc2sAYpZ+ucDg8vXg==
X-Google-Smtp-Source: ABdhPJwbaG79dJScJWvcC0ogdKFfMMGqBdfnrx/CE72uqmWs8soTZH0BMziycvnXeMZf8h+kNZjtKg==
X-Received: by 2002:a17:902:7284:b0:142:728b:46a6 with SMTP id
 d4-20020a170902728400b00142728b46a6mr96313949pll.45.1639408786350; 
 Mon, 13 Dec 2021 07:19:46 -0800 (PST)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id e29sm10643082pge.17.2021.12.13.07.19.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Dec 2021 07:19:45 -0800 (PST)
Subject: Re: [PATCH v2 10/12] target/riscv: Add kvm_riscv_get/put_regs_timer
To: Anup Patel <anup@brainfault.org>, Yifei Jiang <jiangyifei@huawei.com>
Cc: Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Mingwang Li <limingwang@huawei.com>, KVM General <kvm@vger.kernel.org>,
 libvir-list@redhat.com, Anup Patel <anup.patel@wdc.com>,
 QEMU Developers <qemu-devel@nongnu.org>, wanbo13@huawei.com,
 Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org,
 wanghaibin.wang@huawei.com, Alistair Francis <Alistair.Francis@wdc.com>,
 fanliang@huawei.com, "Wubin (H)" <wu.wubin@huawei.com>
References: <20211210100732.1080-1-jiangyifei@huawei.com>
 <20211210100732.1080-11-jiangyifei@huawei.com>
 <CAAhSdy11yd+f6OZZxjX9mWxkVH4AC7Kz5Vp+RPUz6cCam9GvNQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dec3147b-24bc-7e48-680b-a7423b0640f9@linaro.org>
Date: Mon, 13 Dec 2021 07:19:43 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAAhSdy11yd+f6OZZxjX9mWxkVH4AC7Kz5Vp+RPUz6cCam9GvNQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.093,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 13 Dec 2021 15:19:52 -0000

On 12/12/21 9:05 PM, Anup Patel wrote:
>> +    ret = kvm_get_one_reg(cs, RISCV_TIMER_REG(env, state), &reg);
>> +    if (ret) {
>> +        abort();
>> +    }
>> +    env->kvm_timer_state = reg;
> 
> Please read the timer frequency here.

Yep.

>> +
>> +    env->kvm_timer_dirty = true;
>> +}
>> +
>> +static void kvm_riscv_put_regs_timer(CPUState *cs)
>> +{
>> +    int ret;
>> +    uint64_t reg;
>> +    CPURISCVState *env = &RISCV_CPU(cs)->env;
>> +
>> +    if (!env->kvm_timer_dirty) {
>> +        return;
>> +    }
> 
> Over here, we should get the timer frequency and abort() with an
> error message if it does not match env->kvm_timer_frequency
> 
> For now, migration will not work between Hosts with different
> timer frequency.

You shouldn't have to do this every "put", only on migration, at which point you can 
actually signal a migration error rather than aborting directly.


r~

