Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC315C83F12
	for <qemu-riscv@archiver.kernel.org>; Mon, 28 Aug 2023 15:35:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qaeH0-0002Em-JY; Mon, 28 Aug 2023 11:35:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qaeGx-0002Dw-Qj
 for qemu-riscv@nongnu.org; Mon, 28 Aug 2023 11:35:23 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qaeGv-0001QS-6k
 for qemu-riscv@nongnu.org; Mon, 28 Aug 2023 11:35:23 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 46e09a7af769-6bd0a0a675dso2602561a34.2
 for <qemu-riscv@nongnu.org>; Mon, 28 Aug 2023 08:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1693236920; x=1693841720;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qpdUjmkx4SYMchRsBu1q7VqBWSPgpL5+vPbbRAqUrzQ=;
 b=GhX/aPh1RnW10+yS8sQClJs9NnRQg66WncEgctUNPogjL3GMOz5axzyw9FyVSnbuVj
 2W6Mfa26SE9YIsZrm4tEPdYSwr4XpfHrIJLZnROWjFV9LvxoEhTgBL+5zcnvITpUZX54
 uF+SNPD4keSV936ozwmsWzECrEg9Pyn2zCHcLGxg20bYfOOC+V5WBRLhd+VxetZ4HEvr
 d/pXfqglM4nbJG1hNDzwBfCY9YQA7oNI6HjgAE3Sdym/qozwTb1l4K/SEWTSSYnP+Bfg
 CsYL4sJf964msJpJhuN0q/sWT2bnIfk87KspE+FesH45f4A0twFP6UOZGeb8uIW/Qj4H
 oiGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693236920; x=1693841720;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qpdUjmkx4SYMchRsBu1q7VqBWSPgpL5+vPbbRAqUrzQ=;
 b=agfKhF+F3vMoBFIAduX3CVW2RNuWD0cg3vStouZLLtQHZwM8cQX+bUcpz7ddcEgCc0
 k8bhECYaz3y+Ip+Vu1/DVcyjPUIW0ITdB0Kp9I6sVu2QgUjdu8EvrhVMVxJ2Y5hsSULj
 /QSPQqmPJFLOUoVe0gIchowZOG8Mfodt4YbckQ1y8oXzwCGILSe/lMQ+VzKF7CUccbS7
 7mdOJiP4Uy981AKpad7oo9A4zSB1e5vbu10K3jk8YYrIrOPZgPnE7qtuy+0BByelQoa+
 /C+z8Xaa+n8OnnRrDUkD+sLDkis0zzw5zu/fC9C6Kn3e89HYt5sOCxn9mFYR4hJkVCLb
 6rHA==
X-Gm-Message-State: AOJu0Yywqqi10MyttnmGCdL8NY1vc7sBWD7FjMXSIv0iztR5s83TzJRi
 4fcoWLfFeZVGXb0givSHKUaYbA==
X-Google-Smtp-Source: AGHT+IExJiWvIRwVJmtoE2H/UL55375wycJNB/4RJusKKUztFsieR9sXgwtN2TwphB9bvY6mkw3QQg==
X-Received: by 2002:a05:6830:e06:b0:6bc:fab5:e996 with SMTP id
 do6-20020a0568300e0600b006bcfab5e996mr13144820otb.31.1693236919922; 
 Mon, 28 Aug 2023 08:35:19 -0700 (PDT)
Received: from [192.168.68.108] ([177.94.15.194])
 by smtp.gmail.com with ESMTPSA id
 i26-20020a9d68da000000b006af7580c84csm3539484oto.60.2023.08.28.08.35.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Aug 2023 08:35:19 -0700 (PDT)
Message-ID: <84d2bb7c-aa4b-0965-1417-04b0f489683b@ventanamicro.com>
Date: Mon, 28 Aug 2023 12:35:13 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH v2 0/6] Add API for list cpu extensions
To: Igor Mammedov <imammedo@redhat.com>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: qemu-devel@nongnu.org, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 philmd@linaro.org, wangyanan55@huawei.com, pbonzini@redhat.com,
 berrange@redhat.com, richard.henderson@linaro.org, laurent@vivier.eu,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 liweiwei@iscas.ac.cn, qemu-riscv@nongnu.org,
 Jiri Denemark <jdenemar@redhat.com>, Tim Wiederhake <twiederh@redhat.com>
References: <20230828084536.231-1-zhiwei_liu@linux.alibaba.com>
 <20230828155828.561dc83e@imammedo.users.ipa.redhat.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230828155828.561dc83e@imammedo.users.ipa.redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x334.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.169,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org



On 8/28/23 10:58, Igor Mammedov wrote:
> On Mon, 28 Aug 2023 16:45:30 +0800
> LIU Zhiwei <zhiwei_liu@linux.alibaba.com> wrote:
> 
>> Some times we want to know what is the really mean of one cpu option.
>> For example, in RISC-V, we usually specify a cpu in this way:
>> -cpu rv64,v=on
>>
>> If we don't look into the source code, we can't get the ISA extensions
>> of this -cpu command line.
>>
>> In this patch set, we add one list_cpu_props API for common cores. It
>> will output the enabled ISA extensions.
>>
>> In the near future, I will also list all possible user configurable
>> options and all possible extensions for this cpu.
>>
>> In order to reuse the options parse code, I also add a QemuOptsList
>> for cpu.
>>
>> After this patch, we can output the extensions for cpu,
>> """
>> ./qemu-system-riscv64 -cpu rv64,help
>> Enabled extensions:
>>      rv64imafdch_zicbom_zicboz_zicsr_zifencei_zihintpause_zawrs_zfa_zba_zbb_zbc_zbs_sstc_svadu
> 
> It's not that easy to get features with values in general.
> (many factors influence defaults, which may include:
>   * properties set and/or added at realize time
>   * defaults amended by machine type version
>   * defaults amended by -global CLI options
> )
> 
> To do that consensus was to query features after CPU object is realized.
> Typically that implies starting dummy QEMU with needed CPU model and
> then using query-cpu-model-expansion command to get actual property values.

FWIW I have a working prototype of the query-cpu-model-expansion for RISC-V.
I'll send it to the ML when I'm done smoothing the rough edges (hopefully
end of this week).


>   
> The task is solved by implementing query-cpu-model-expansion
> command so that user (mainly management layer) could get defaults via QMP.
> So if your goal is to get the given cpu defaults to mgmt layer
> it is sufficient to implement query-cpu-model-expansion command for riscv.
> (CC-ing libvirt folks to see if it picks up the command
> automatically for every target or some more work would be needed
> on their side as well)
> 
> PS:
> no one cared about making -cpu name,help working till this moment
> and certainly not for linux-user part.
> 
> To make this option work reliably it's would be necessary to make sure
> that query-cpu-model-expansion work in user mode as well.

I can take a look into how much extra code we need to support
query-cpu-model-expansion for user mode, but no promises. If it's too much
work I'd rather implement the API as is (like ARM and x86 already does) and
worry about supporting it for user-mode later.


Thanks,

Daniel


> 
> Also the timing when 'help' is processed should ensure that
> machine is available/initialized (i.e. compat properties are in effect)
> 
> Once you have working query-cpu-model-expansion, your new -cpu foo,help handler
> can translate json to human readable format that everyone would agree upon.
> 
>> To get all configuable options for this cpu, use -device rv64-riscv-cpu,help
>> """
>>
>>
>> v1->v2:
>>
>> 1) Give a hint to use -device cpu,help for configualbe options on cpu
>> 2) Support list_cpu_props for linux user mode
>> 3) Add default to some properties to make -device cpu,help output better
>>
>>
>> Todo:
>> 1) Fix Daniel comments on KVM and cpu option check
>> 2) Add support for other archs
>> 3) Move qdev help function from qdev-monitor to qdev-property
>>
>> LIU Zhiwei (6):
>>    cpu: Add new API cpu_type_by_name
>>    target/riscv: Add API list_cpu_props
>>    softmmu/vl: Add qemu_cpu_opts QemuOptsList
>>    target/riscv: Add default value for misa property
>>    target/riscv: Add defalut value for string property
>>    linux-user: Move qemu_cpu_opts to cpu.c
>>
>>   cpu.c                        | 63 +++++++++++++++++++++++++++++-------
>>   hw/core/qdev-prop-internal.h |  2 ++
>>   hw/core/qdev-properties.c    |  7 ++++
>>   include/exec/cpu-common.h    |  3 ++
>>   include/hw/core/cpu.h        | 11 +++++++
>>   include/hw/qdev-properties.h |  8 +++++
>>   linux-user/main.c            | 10 ++++++
>>   softmmu/vl.c                 | 11 +++++++
>>   target/riscv/cpu.c           | 30 +++++++++++++----
>>   target/riscv/cpu.h           |  2 ++
>>   10 files changed, 128 insertions(+), 19 deletions(-)
>>
> 

