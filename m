Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6B7FC83F15
	for <qemu-riscv@archiver.kernel.org>; Tue, 29 Aug 2023 03:04:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qap1E-0004Yj-Te; Mon, 28 Aug 2023 23:03:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qap14-0004O8-Dj; Mon, 28 Aug 2023 23:03:44 -0400
Received: from out30-124.freemail.mail.aliyun.com ([115.124.30.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qap0w-0003Jf-Vy; Mon, 28 Aug 2023 23:03:41 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R461e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046056;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=18; SR=0;
 TI=SMTPD_---0VqpUuJ1_1693278195; 
Received: from 30.221.108.235(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VqpUuJ1_1693278195) by smtp.aliyun-inc.com;
 Tue, 29 Aug 2023 11:03:16 +0800
Message-ID: <e6e97f8b-e9a7-9b4c-7f7d-3cd9df7b8f31@linux.alibaba.com>
Date: Tue, 29 Aug 2023 11:02:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [RFC PATCH v2 0/6] Add API for list cpu extensions
Content-Language: en-US
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 philmd@linaro.org, wangyanan55@huawei.com, pbonzini@redhat.com,
 berrange@redhat.com, richard.henderson@linaro.org, laurent@vivier.eu,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com, qemu-riscv@nongnu.org,
 Jiri Denemark <jdenemar@redhat.com>, Tim Wiederhake <twiederh@redhat.com>
References: <20230828084536.231-1-zhiwei_liu@linux.alibaba.com>
 <20230828155828.561dc83e@imammedo.users.ipa.redhat.com>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230828155828.561dc83e@imammedo.users.ipa.redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.124;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-124.freemail.mail.aliyun.com
X-Spam_score_int: -120
X-Spam_score: -12.1
X-Spam_bar: ------------
X-Spam_report: (-12.1 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-2.169, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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


On 2023/8/28 21:58, Igor Mammedov wrote:
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

I agree query-cpu-model-expansion command is necessary. But for users 
that manually

run qemu command line, it is difficult to for them to give a json-based 
input.

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

>
> Also the timing when 'help' is processed should ensure that
> machine is available/initialized (i.e. compat properties are in effect)

Agree. I can defer the helper handler process to the machine initialized 
stage.

Thanks,
Zhiwei

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

