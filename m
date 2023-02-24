Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVYwO-0004zV-9V
	for mharc-qemu-riscv@gnu.org; Fri, 24 Feb 2023 09:20:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pVYwF-0004uO-H4
 for qemu-riscv@nongnu.org; Fri, 24 Feb 2023 09:20:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pVYwD-0007EE-Mn
 for qemu-riscv@nongnu.org; Fri, 24 Feb 2023 09:20:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677248440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=duFaQFEJZBHzw4iu9tyvHLS481Znbz/oki4PQOdwMBU=;
 b=LyYeGvMGtoaeWslS18fQcsTDOc0VmtAOKv83VnBZnku+VufnYsPLH+w6NLZWeGtKZLD4cx
 1iVCXCw+lyAOHXSH8QXUlW8crvPKTVcM8rMmaMRROfGW03oj952MMWmGhFSOu24XxPQWkY
 CDziWhCv0pgxIuMeiB8MPQ6zSuJOlYM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-93-0hfmw5RIMDO-ULM2BUvEkw-1; Fri, 24 Feb 2023 09:20:39 -0500
X-MC-Unique: 0hfmw5RIMDO-ULM2BUvEkw-1
Received: by mail-wr1-f71.google.com with SMTP id
 m15-20020adfa3cf000000b002be0eb97f4fso2985966wrb.8
 for <qemu-riscv@nongnu.org>; Fri, 24 Feb 2023 06:20:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vGjhVMhdY/xB3DUIF5pgS1G/Py7xNS13VwXfSXKGFBk=;
 b=twkG9b8aQwA02cCPaHmBDI/nxwdOzMzs5N0Y8RqTk3u1jUQYND/7pYW8ZdBoUz2c0S
 yxn8WJ+/0W+GJXr2dqua9EB5Z+pzpDrwQFO3CnuMUOngp6AmeqPJWPWQghHrm241NhFI
 KOVgQ29gvkWgGvjp06rNl2GQsJ6rdnxH0ef5X3FLG88HlfH+SM8YdkErEAVMG8zHbcY1
 TuxxOliW7+rzy0KJDKkUH8Uf1S9V54O0nzjoZfTXf8r4avC1SdHPCOCj/E51wpfSyI7Q
 cNLFLg9P0sfdaJqYIoU2lrRD87TGi4iXIjQqWfXrIOalcfFJC56LWVfOIAsD+D0d90bU
 TnuA==
X-Gm-Message-State: AO0yUKX6ZIak0UGha5m1oKmO6b7vxDkTUlTGs3/XYpwqa8iXWV8dY8rk
 S37OiEUxVLorab9tzgqe51+odLdpibApqvKpyTpkIB8+2JDN/viyQ5fmZkHu5BUuEmNBzRmdsiT
 ssosQZMS6Y8YD+LY=
X-Received: by 2002:a05:600c:510f:b0:3e9:c2f4:8ad4 with SMTP id
 o15-20020a05600c510f00b003e9c2f48ad4mr6202855wms.8.1677248438233; 
 Fri, 24 Feb 2023 06:20:38 -0800 (PST)
X-Google-Smtp-Source: AK7set8AP+apyfLmQqYq46pVZtOnhCniuEfnbmeyPyS8jKNEJ87T3AzVYlN8nE3CMkfowF73TNQbxQ==
X-Received: by 2002:a05:600c:510f:b0:3e9:c2f4:8ad4 with SMTP id
 o15-20020a05600c510f00b003e9c2f48ad4mr6202835wms.8.1677248437923; 
 Fri, 24 Feb 2023 06:20:37 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com ([185.140.112.229])
 by smtp.gmail.com with ESMTPSA id
 z14-20020a05600c220e00b003e11f280b8bsm2910257wml.44.2023.02.24.06.20.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 06:20:37 -0800 (PST)
Date: Fri, 24 Feb 2023 15:20:35 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 rad@semihalf.com, peter.maydell@linaro.org, quic_llindhol@quicinc.com,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, thuth@redhat.com, lvivier@redhat.com,
 pbonzini@redhat.com, yihyu@redhat.com, shan.gavin@gmail.com, Michal
 =?UTF-8?B?UHLDrXZvem7DrWs=?= <mprivozn@redhat.com>
Subject: Re: [PATCH v2 0/4] NUMA: Apply socket-NUMA-node boundary for
 aarch64 and RiscV machines
Message-ID: <20230224152035.6edfa832@imammedo.users.ipa.redhat.com>
In-Reply-To: <9e8523a9-9059-e3a0-e32e-414f83e06a6f@redhat.com>
References: <20230223081401.248835-1-gshan@redhat.com>
 <2d37d157-12a1-07aa-4c70-974ac1503283@ventanamicro.com>
 <fc0d2c66-5600-c33a-62d7-c72f1d16518b@redhat.com>
 <11e958b1-4763-f710-fe02-832cfd559e7b@ventanamicro.com>
 <9e8523a9-9059-e3a0-e32e-414f83e06a6f@redhat.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
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
X-List-Received-Date: Fri, 24 Feb 2023 14:20:45 -0000

On Fri, 24 Feb 2023 21:16:39 +1100
Gavin Shan <gshan@redhat.com> wrote:

> On 2/24/23 8:26 PM, Daniel Henrique Barboza wrote:
> > On 2/24/23 04:09, Gavin Shan wrote: =20
> >> On 2/24/23 12:18 AM, Daniel Henrique Barboza wrote: =20
> >>> On 2/23/23 05:13, Gavin Shan wrote: =20
> >>>> For arm64 and RiscV architecture, the driver (/base/arch_topology.c)=
 is
> >>>> used to populate the CPU topology in the Linux guest. It's required =
that
> >>>> the CPUs in one socket can't span mutiple NUMA nodes. Otherwise, the=
 Linux
> >>>> scheduling domain can't be sorted out, as the following warning mess=
age
> >>>> indicates. To avoid the unexpected confusion, this series attempts t=
o
> >>>> rejects such kind of insane configurations.
> >>>>
> >>>> =C2=A0=C2=A0=C2=A0 -smp 6,maxcpus=3D6,sockets=3D2,clusters=3D1,cores=
=3D3,threads=3D1 \
> >>>> =C2=A0=C2=A0=C2=A0 -numa node,nodeid=3D0,cpus=3D0-1,memdev=3Dram0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 \
> >>>> =C2=A0=C2=A0=C2=A0 -numa node,nodeid=3D1,cpus=3D2-3,memdev=3Dram1=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 \
> >>>> =C2=A0=C2=A0=C2=A0 -numa node,nodeid=3D2,cpus=3D4-5,memdev=3Dram2=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 \ =20
> >>>
> >>>
> >>> And why is this a QEMU problem? This doesn't hurt ACPI.
> >>>
> >>> Also, this restriction impacts breaks ARM guests in the wild that are=
 running
> >>> non-Linux OSes. I don't see why we should impact use cases that has n=
othing to
> >>> do with Linux Kernel feelings about sockets - NUMA nodes exclusivity.
> >>> =20
> >>
> >> With above configuration, CPU-0/1/2 are put into socket-0-cluster-0 wh=
ile CPU-3/4/5
> >> are put into socket-1-cluster-0, meaning CPU-2/3 belong to different s=
ocket and
> >> cluster. However, CPU-2/3 are associated with NUMA node-1. In summary,=
 multiple
> >> CPUs in different clusters and sockets have been associated with one N=
UMA node.
> >>
> >> If I'm correct, the configuration isn't sensible in a baremetal enviro=
nment and
> >> same Linux kernel is supposed to work well for baremetal and virtualiz=
ed machine.
> >> So I think QEMU needs to emulate the topology as much as we can to mat=
ch with the
> >> baremetal environment. It's the reason why I think it's a QEMU problem=
 even it
> >> doesn't hurt ACPI. As I said in the reply to Daniel P. Berrang=C3=A9 <=
berrange@redhat.com>
> >> in another thread, we may need to gurantee that the CPUs in one cluste=
r can't be
> >> split to multiple NUMA nodes, which matches with the baremetal environ=
ment, as I
> >> can understand.
> >>
> >> Right, the restriction to have socket-NUMA-node or cluster-NUMA-node b=
oundary will
> >> definitely break the configurations running in the wild. =20
> >=20
> >=20
> > What about a warning? If the user attempts to use an exotic NUMA config=
uration
> > like the one you mentioned we can print something like:
> >=20
> > "Warning: NUMA topologies where a socket belongs to multiple NUMA nodes=
 can cause OSes like Linux to misbehave"
> >=20
> > This would inform the user what might be going wrong in case Linux is c=
rashing/error
> > out on them and then the user is free to fix their topology (or the ker=
nel). And
> > at the same time we wouldn't break existing stuff that happens to be wo=
rking.
> >=20
> >  =20
>=20
> Yes, I think a warning message is more appropriate, so that users can fix=
 their
> irregular configurations and the existing configurations aren't disconnec=
ted.
> It would be nice to get the agreements from Daniel P. Berrang=C3=A9 and D=
rew, before
> I'm going to change the code and post next revision.

Honestly you (and libvirt as far as I recall) are using legacy options
to assign cpus to numa nodes.
With '-numa node,nodeid=3D0,cpus=3D0-1' you can't really be sure what/where
in topology those cpus are.
What you can do is to use '-numa cpu,...' option to assign socket/core/...
to numa node, ex:
        "-numa cpu,node-id=3D1,socket-id=3D0 "           or                =
             =20
        "-numa cpu,node-id=3D0,socket-id=3D1,core-id=3D0 "       or        =
             =20
        "-numa cpu,node-id=3D0,socket-id=3D1,core-id=3D1,thread-id=3D0
to get your desired mapping.

The problem that's so far was stopping the later adoption by libvirt (Micha=
l CCed)
is that values used by it are machine specific and to do it properly, for a=
 concrete
'-M x -smp ...' at least for the first time qemu should be started with-
 -preconfig option and then user should query possible cpus for those value=
s
and assign them to numa nodes via QMP.

btw: on x86 we also allow 'insane' configuration incl. those that do not
exist on baremetal and do not warn about it anyone (i.e. it's user's
responsibility to provide topology that specific guest OS could handle,
aka it's not QEMU business but upper layers). (I do occasionally try
introduce stricter checks in that are, but that gets push back more
often that not).

I'd do check only in case of a specific board where mapping is fixed
in specs of emulated machine, otherwise I wouldn't bother.

> Thanks,
> Gavin
>=20
>=20


