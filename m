Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvcsG-0001wc-5h
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 05:11:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mvcsE-0001qS-1y; Fri, 10 Dec 2021 05:11:30 -0500
Received: from [2a00:1450:4864:20::530] (port=35494
 helo=mail-ed1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mvcsC-0007xK-If; Fri, 10 Dec 2021 05:11:29 -0500
Received: by mail-ed1-x530.google.com with SMTP id v1so28600801edx.2;
 Fri, 10 Dec 2021 02:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=l3qeEo+jWGYFV13NH3oOdulqHhDAMY2J0DO65Q819/8=;
 b=V84DNfMxZXBdpMkjS7DzgFDawHK00I0C+0iEewswkQ0JiNxPpciixx1vbYlDmTYs9s
 MqUOfXByP6cmtYHbyVuSa3Y0r9lTmxeSTBn3+nXXnHLP7drxQ4zkAF6dnXtya0H/oS2K
 iO2lAjSGQ5gza9CJlZEMuVgwohjUyTzW+JvEAo+YdVPL3HrdbWE21MX3wgyGwEE4omhg
 dmJzMlYDHXCjkGgMVa4611xpLiKzZBxocL13G1RkYxmX1/8IG8TqZ05yzzTcwV6GkS2T
 Sk9BTrkDVvZL4mswmYeEBFjTDLP/nMu6UHYMK4w4FMcMHNd+wveoFDqFM3py8N75HyME
 txvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=l3qeEo+jWGYFV13NH3oOdulqHhDAMY2J0DO65Q819/8=;
 b=HSS2c/1w6KziA1zVNsn7OtrSHeyUTtN+Rj5+VIsEgylzzEwcKwe2aFyeeCHtBkYLxw
 i8dbExJ76iGVpOEBLtQynzcZ5NMYh65LL8wYv8M55JyOSD5J7UXZH5FqaCegHIXYH/F8
 FjWOThomMBcSHrUMoBZfr8FcAy6He6iMA6TGocCUzfwq+aQr3NkuQXTcaMlLCX+AUmPY
 reKKxdIVMvQ3tzF2qnmuzpfUL09icZ9vwZE3SIMzEUd8rrnR9hGcz8kfz3rncj1OJvEF
 EXCued6t3EHotOligXDvZUCDMvl79rDVqvyz2YqJcaSurlk2SUAFtjaDTaANki8rByLF
 sDpQ==
X-Gm-Message-State: AOAM531dQf58qLaNeQEV/7iRNgzGLp+IQscMPjhNSI1qVj+XZvvgGHMc
 N+QtcnAbn5OR4z0UEKgfQLU=
X-Google-Smtp-Source: ABdhPJzdgCERPEsFn+0ltSoWI8Y11Ak6TqpEH8ksNhEUWGG4fYeeF0xqE5idxUN1Na+O6b+2YsqE3w==
X-Received: by 2002:a17:906:1599:: with SMTP id
 k25mr22566954ejd.298.1639131086120; 
 Fri, 10 Dec 2021 02:11:26 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312::973? ([2001:b07:6468:f312::973])
 by smtp.googlemail.com with ESMTPSA id jg32sm1336819ejc.43.2021.12.10.02.11.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Dec 2021 02:11:25 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <02a0ad69-4129-6e6c-06af-fc9c9e3047e1@redhat.com>
Date: Fri, 10 Dec 2021 11:11:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v1 12/12] target/riscv: Support virtual time context
 synchronization
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Yifei Jiang <jiangyifei@huawei.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: bin.meng@windriver.com, Mingwang Li <limingwang@huawei.com>,
 kvm@vger.kernel.org, libvir-list@redhat.com, anup.patel@wdc.com,
 wanbo13@huawei.com, Alistair.Francis@wdc.com, kvm-riscv@lists.infradead.org,
 wanghaibin.wang@huawei.com, fanliang@huawei.com, palmer@dabbelt.com,
 wu.wubin@huawei.com
References: <20211120074644.729-1-jiangyifei@huawei.com>
 <20211120074644.729-13-jiangyifei@huawei.com>
 <d9c9196a-692c-cbcf-339b-8e84ecde7cee@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <d9c9196a-692c-cbcf-339b-8e84ecde7cee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::530
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.317,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 10 Dec 2021 10:11:30 -0000

On 11/20/21 23:34, Richard Henderson wrote:
> On 11/20/21 8:46 AM, Yifei Jiang wrote:
>>   const VMStateDescription vmstate_riscv_cpu = {
>>       .name = "cpu",
>>       .version_id = 3,
>>       .minimum_version_id = 3,
>> +    .post_load = cpu_post_load,
>>       .fields = (VMStateField[]) {
>>           VMSTATE_UINTTL_ARRAY(env.gpr, RISCVCPU, 32),
>>           VMSTATE_UINT64_ARRAY(env.fpr, RISCVCPU, 32),
>> @@ -211,6 +221,10 @@ const VMStateDescription vmstate_riscv_cpu = {
>>           VMSTATE_UINT64(env.mtohost, RISCVCPU),
>>           VMSTATE_UINT64(env.timecmp, RISCVCPU),
>> +        VMSTATE_UINT64(env.kvm_timer_time, RISCVCPU),
>> +        VMSTATE_UINT64(env.kvm_timer_compare, RISCVCPU),
>> +        VMSTATE_UINT64(env.kvm_timer_state, RISCVCPU),
>> +
>>           VMSTATE_END_OF_LIST()
>>       },
> 
> Can't alter VMStateDescription.fields without bumping version.
> 
> If this is really kvm-only state, consider placing it into a 
> subsection.  But I worry about kvm-only state because ideally we'd be 
> able to migrate between tcg and kvm (if only for debugging).

Where is this state stored for TCG?

Paolo

