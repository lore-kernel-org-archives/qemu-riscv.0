Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVSDA-0002l5-Q2
	for mharc-qemu-riscv@gnu.org; Fri, 24 Feb 2023 02:09:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pVSD8-0002Xt-M1
 for qemu-riscv@nongnu.org; Fri, 24 Feb 2023 02:09:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pVSD6-0006Cs-UK
 for qemu-riscv@nongnu.org; Fri, 24 Feb 2023 02:09:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677222580;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K4ZvmC9FbcEEulfeWUM/vzyyQcGof9qH0iQevbTe1ko=;
 b=da8SbOOEFQnx5T4NLhXXQ+NIUM7gV/m0WwThEJMXLxAs2CX8uovU2LJOfbqcUEpxfpTSPX
 I2Wl5Ny5OIPVepPBOul7Ij1BEaiXJFsYYE34uFnlnAAUMdfbSzUjTbN1ZTJEKtC+xhzobW
 q8jnCT7vstar6GqrhmY2vZrqKaUOj98=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-197-lVfD_nH0PpWY81IJBXPjqw-1; Fri, 24 Feb 2023 02:09:36 -0500
X-MC-Unique: lVfD_nH0PpWY81IJBXPjqw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5BB9D380452A;
 Fri, 24 Feb 2023 07:09:35 +0000 (UTC)
Received: from [10.64.54.42] (vpn2-54-42.bne.redhat.com [10.64.54.42])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 88E2D492B13;
 Fri, 24 Feb 2023 07:09:26 +0000 (UTC)
Reply-To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH v2 0/4] NUMA: Apply socket-NUMA-node boundary for aarch64
 and RiscV machines
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, rad@semihalf.com,
 peter.maydell@linaro.org, quic_llindhol@quicinc.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 thuth@redhat.com, lvivier@redhat.com, pbonzini@redhat.com,
 imammedo@redhat.com, yihyu@redhat.com, shan.gavin@gmail.com
References: <20230223081401.248835-1-gshan@redhat.com>
 <2d37d157-12a1-07aa-4c70-974ac1503283@ventanamicro.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <fc0d2c66-5600-c33a-62d7-c72f1d16518b@redhat.com>
Date: Fri, 24 Feb 2023 18:09:23 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <2d37d157-12a1-07aa-4c70-974ac1503283@ventanamicro.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 24 Feb 2023 07:09:43 -0000

On 2/24/23 12:18 AM, Daniel Henrique Barboza wrote:
> On 2/23/23 05:13, Gavin Shan wrote:
>> For arm64 and RiscV architecture, the driver (/base/arch_topology.c) is
>> used to populate the CPU topology in the Linux guest. It's required that
>> the CPUs in one socket can't span mutiple NUMA nodes. Otherwise, the Linux
>> scheduling domain can't be sorted out, as the following warning message
>> indicates. To avoid the unexpected confusion, this series attempts to
>> rejects such kind of insane configurations.
>>
>>     -smp 6,maxcpus=6,sockets=2,clusters=1,cores=3,threads=1 \
>>     -numa node,nodeid=0,cpus=0-1,memdev=ram0                \
>>     -numa node,nodeid=1,cpus=2-3,memdev=ram1                \
>>     -numa node,nodeid=2,cpus=4-5,memdev=ram2                \
> 
> 
> And why is this a QEMU problem? This doesn't hurt ACPI.
> 
> Also, this restriction impacts breaks ARM guests in the wild that are running
> non-Linux OSes. I don't see why we should impact use cases that has nothing to
> do with Linux Kernel feelings about sockets - NUMA nodes exclusivity.
> 

With above configuration, CPU-0/1/2 are put into socket-0-cluster-0 while CPU-3/4/5
are put into socket-1-cluster-0, meaning CPU-2/3 belong to different socket and
cluster. However, CPU-2/3 are associated with NUMA node-1. In summary, multiple
CPUs in different clusters and sockets have been associated with one NUMA node.

If I'm correct, the configuration isn't sensible in a baremetal environment and
same Linux kernel is supposed to work well for baremetal and virtualized machine.
So I think QEMU needs to emulate the topology as much as we can to match with the
baremetal environment. It's the reason why I think it's a QEMU problem even it
doesn't hurt ACPI. As I said in the reply to Daniel P. Berrangé <berrange@redhat.com>
in another thread, we may need to gurantee that the CPUs in one cluster can't be
split to multiple NUMA nodes, which matches with the baremetal environment, as I
can understand.

Right, the restriction to have socket-NUMA-node or cluster-NUMA-node boundary will
definitely break the configurations running in the wild.

Thanks,
Gavin

[...]


