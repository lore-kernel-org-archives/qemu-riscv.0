Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nhbH3-00085t-4q
	for mharc-qemu-riscv@gnu.org; Thu, 21 Apr 2022 14:11:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nhbH0-0007zh-MH; Thu, 21 Apr 2022 14:11:22 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:41070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nhbGy-0001Dv-KU; Thu, 21 Apr 2022 14:11:22 -0400
Received: from [192.168.13.13] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id CC1E620896;
 Thu, 21 Apr 2022 18:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1650564677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E4BhfBZ/gOulsuXtZcPtnjd0j85oRMKXMtwm7UXYT1I=;
 b=2uhd+2OOxTifN64la9wSm+Af6GcImxiVbENSnpMqdXdpw+zxUGyqhiH29p3fRbhBO4nuXc
 zICjhVGYloTekt71eYHDLOLGslq/ZnwprZYLkm3isjiYuyru1Mmbjmihxcs1PuRpkONhcG
 ZJLQknouoEdUG7Zx1u0pIPZqZTnRtDs=
Message-ID: <e41b4422-1324-a710-ad6b-7d00531f8b47@greensocs.com>
Date: Thu, 21 Apr 2022 20:11:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH 00/18] user-creatable cpu clusters
Content-Language: en-US-large
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, mark.burton@greensocs.com,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Bin Meng <bin.meng@windriver.com>, Vijai Kumar K <vijai@behindbytes.com>,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org
References: <20220330125639.201937-1-damien.hedde@greensocs.com>
 <CAFEAcA-RW411mWCQOu03i=LaPHRm1F6R3Z9bquBDJPhv-ZxWGQ@mail.gmail.com>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <CAFEAcA-RW411mWCQOu03i=LaPHRm1F6R3Z9bquBDJPhv-ZxWGQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Thu, 21 Apr 2022 18:11:23 -0000



On 4/21/22 17:51, Peter Maydell wrote:
> On Wed, 30 Mar 2022 at 13:56, Damien Hedde <damien.hedde@greensocs.com> wrote:
>>
>> Hi,
>>
>> This series add devices to be able to user-create (coldplug) cpu
>> clusters. The existing cpu cluster dictates how cpus are exposed
>> in gdb, but it does not handle the cpu objects creation. This series
>> adds a new device to handle both issues and adds support for two
>> architectures: arm and riscv.
>>
>> Please look at patches 2 and 3 for more details about the new device.
>>
>> Last part concerning the riscv is rfc as I do non-backward compatible
>> updates. I'm not sure what migration (or other) constraints we have
>> on these machines and I probably need to make some changes to cope
>> with them.
>>
>> This series almost deprecates the cpu-cluster type as all uses
>> but one are replaced.
> 
> I don't think we should have two different concepts which
> are "a group of CPUs". It means we wind up with two different
> ways to do something (which we have too many examples of
> already), only one of which gets to use the nicer, more obvious
> name.

I was not sure that I could merge the cpu-cluster into the new object 
and agree having both is not ideal. I can
1. delete the last cpu-cluster usecase and the object type
2. manage to update in place the cpu-cluster instead of adding the new type.

In the end, the object will be the same.

I am also confused by the "cluster" naming.

The original cpu-cluster is used only to set cluster_index of cpus which 
is used in the gdbstub to group cpus in inferiors. So it is just a 
container to expose cpus in a specific gdb inferior.

But in most machines (which don't use explicit cpu-clusters) this 
cluster[_index] has nothing to do with the topology's cluster.

In practice, topology's cluster is not a 1-1 match of gdb inferior in 
gsbtub ("cpu-cluster") and I'm not sure what to do with that...

I'm happy to keep the "cpu-cluster" if everyone feel the same.

> 
> The stated motivation is to allow user creation of CPU clusters,
> but I'm not sure how this would work -- CPUs need a lot of
> things wiring up like interrupt lines and memory regions, which
> you can't do on the command line anyway. Do you have an example
> of what the new code lets you do?

This simplify the place where cpu-cluster was used (see patch 9 for 
example) as you don't need to create both the cpus and the cluster.

But mostly the goal is to provide cpu cold plug functionality with the 
qapi interface (not the cli interface). With this series + my other 
series adding commands to cold-plug devices and memory-map sysbus 
devices, I reproduced the arm virt board starting from the none machine.

Interrupts are wired using qom_set.

Thanks,
--
Damien

