Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVBAH-0001Qd-Fd
	for mharc-qemu-riscv@gnu.org; Thu, 23 Feb 2023 07:57:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pVBAG-0001FA-9y
 for qemu-riscv@nongnu.org; Thu, 23 Feb 2023 07:57:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pVBAE-0000vw-A5
 for qemu-riscv@nongnu.org; Thu, 23 Feb 2023 07:57:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677157053;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=AnL0fZO3IgEYdXjPIllGPxgyMFIATdQdlXCyFht6XPA=;
 b=IIdJZ+AXjm9CtVxB0qc4hkeu4jImapz7urfdUzPRmOTRxZPvrhUcESGVc8VRlfwDpzuH3t
 9fSdXZHDBgC3uqQ+50lGd7bhYKMHbAzRgdoqqCx7lCOYNDCy+Bj66MsJMcmaR+J+3VrFvM
 3NdEKAYk0r8RVLjRdTavwmULYOE6u/U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-314-6cVXNoeQNVK6LpRd8OjtSw-1; Thu, 23 Feb 2023 07:57:29 -0500
X-MC-Unique: 6cVXNoeQNVK6LpRd8OjtSw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 23C77800B23;
 Thu, 23 Feb 2023 12:57:29 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.113])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 55D5C40C1423;
 Thu, 23 Feb 2023 12:57:25 +0000 (UTC)
Date: Thu, 23 Feb 2023 12:57:22 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 rad@semihalf.com, peter.maydell@linaro.org,
 quic_llindhol@quicinc.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, thuth@redhat.com,
 lvivier@redhat.com, pbonzini@redhat.com, imammedo@redhat.com,
 yihyu@redhat.com, shan.gavin@gmail.com
Subject: Re: [PATCH v2 0/4] NUMA: Apply socket-NUMA-node boundary for aarch64
 and RiscV machines
Message-ID: <Y/disinKmr6gLby1@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20230223081401.248835-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230223081401.248835-1-gshan@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 23 Feb 2023 12:57:36 -0000

On Thu, Feb 23, 2023 at 04:13:57PM +0800, Gavin Shan wrote:
> For arm64 and RiscV architecture, the driver (/base/arch_topology.c) is
> used to populate the CPU topology in the Linux guest. It's required that
> the CPUs in one socket can't span mutiple NUMA nodes. Otherwise, the Linux
> scheduling domain can't be sorted out, as the following warning message
> indicates. To avoid the unexpected confusion, this series attempts to
> rejects such kind of insane configurations.
> 
>    -smp 6,maxcpus=6,sockets=2,clusters=1,cores=3,threads=1 \
>    -numa node,nodeid=0,cpus=0-1,memdev=ram0                \
>    -numa node,nodeid=1,cpus=2-3,memdev=ram1                \
>    -numa node,nodeid=2,cpus=4-5,memdev=ram2                \

This is somewhat odd as a config, because core 2 is in socket 0
and core 3 is in socket 1, so it wouldn't make much conceptual
sense to have them in the same NUMA node, while other cores within
the same socket are in different NUMA nodes. Basically the split
of NUMA nodes is not aligned with any level in the topology.

This series, however, also rejects configurations that I would
normally consider to be reasonable. I've not tested linux kernel
behaviour though, but as a user I would expect to be able to
ask for:

    -smp 6,maxcpus=6,sockets=2,clusters=1,cores=3,threads=1 \
    -numa node,nodeid=0,cpus=0,memdev=ram0                \
    -numa node,nodeid=1,cpus=1,memdev=ram1                \
    -numa node,nodeid=2,cpus=2,memdev=ram2                \
    -numa node,nodeid=3,cpus=3,memdev=ram3                \
    -numa node,nodeid=4,cpus=4,memdev=ram4                \
    -numa node,nodeid=5,cpus=5,memdev=ram5                \

ie, every core gets its own NUMA node

Or to aask for every cluster as a numa node:

    -smp 6,maxcpus=6,sockets=2,clusters=3,cores=1,threads=1 \
    -numa node,nodeid=0,cpus=0,memdev=ram0                \
    -numa node,nodeid=1,cpus=1,memdev=ram1                \
    -numa node,nodeid=2,cpus=2,memdev=ram2                \
    -numa node,nodeid=3,cpus=3,memdev=ram3                \
    -numa node,nodeid=4,cpus=4,memdev=ram4                \
    -numa node,nodeid=5,cpus=5,memdev=ram5                \

In both cases the NUMA split is aligned with a given level
in the topology, which was not the case with your example.

Rejecting these feels overly strict to me, and may risk breaking
existing valid deployments, unless we can demonstrate those
scenarios were unambiguously already broken ?

If there was something in the hardware specs that requires
this, then it is more valid to do, than if it is merely an
specific guest kernel limitation that might be fixed any day.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


