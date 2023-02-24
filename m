Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVVTx-0007rl-4p
	for mharc-qemu-riscv@gnu.org; Fri, 24 Feb 2023 05:39:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pVVTv-0007r6-Ok
 for qemu-riscv@nongnu.org; Fri, 24 Feb 2023 05:39:15 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pVVTu-0005vf-3u
 for qemu-riscv@nongnu.org; Fri, 24 Feb 2023 05:39:15 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 l7-20020a05600c4f0700b003e79fa98ce1so1447827wmq.2
 for <qemu-riscv@nongnu.org>; Fri, 24 Feb 2023 02:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=FiW8TnaiG91Uh9q6SVRLuxCKb4a4KfdHxOsFZp9kvjg=;
 b=bznsjubzIoOchsezThHK89pYt+7wi2GYz5/HK5HCOr3PdajVT5PTYs7VVJUNAVYr5/
 OVgy0BT9qf+/uBXPArl97yIhJxi6k+B/C262+tLTylhYnT7Y+O4QFfpVbEwazB/q2M5o
 0vQAFCPxkI1Oy7PT7vpw32soL7gRlMZ2/n5gTS79UG13ZNNFdc2TWsOrwRf8r+l51JGw
 7Oyr4waRQhb8WLSIeXRzhP+ERGv70xVB4fcL0v83Alji3XsBt6xjcO3l35u1SldEMtWb
 RgV+/ocmkMEBrKMadS6G1LBPZkiRojvZuOxTbF4ZdfZQAvs+rGs6Rbz8DT/gaoGht+xn
 ANbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FiW8TnaiG91Uh9q6SVRLuxCKb4a4KfdHxOsFZp9kvjg=;
 b=YAZBKFnnjz/kUtFEI/WhyV/1bt6l9RA2pT7Xo03gDzXnvmksbIQ+0TCvt0PfDWMjc3
 a/OCvZUSFJGkbPITPBw27IeXMyTGS9fgxd94dtdUU5FrB17pTGsteYPyXlW2aLSaOJiE
 fXR4U+EMhy0KxTUQ2ePNUAMGYUDRLVe2+EQJNN0Ex0MFqoBQi6Wd7kWh2uLdgIPdvoSo
 Yx3++JIlmYs3Ct5nuONWOZCBMLEoJ1/xwgpksRcGKEJNMmtidEcH2uYRvAYucPuDX/hQ
 BYaJvRicnv9cLdoF4S/yPUqYVakz9QbgyxVZvNoFyqw2d20X1jLocqX4uAjNvYpslAz+
 8fAQ==
X-Gm-Message-State: AO0yUKW5GdCSmbdz604A8FDfhfs+VR9EcUCAn560FgHWTDodV8+0i6lj
 bpYbTY3J10nFOh+CnAwAcPKuQg==
X-Google-Smtp-Source: AK7set+hvm7ytq0vsqFNijB4IUiUUqIktctBLum93Fz/0EorCC+ikaPqhM/CfNoKk80KMmbPubRO+A==
X-Received: by 2002:a05:600c:30d3:b0:3e9:5641:1bbd with SMTP id
 h19-20020a05600c30d300b003e956411bbdmr6812257wmn.41.1677235152119; 
 Fri, 24 Feb 2023 02:39:12 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 y4-20020a05600c364400b003e2066a6339sm2347520wmq.5.2023.02.24.02.39.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 02:39:11 -0800 (PST)
Date: Fri, 24 Feb 2023 11:39:11 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Gavin Shan <gshan@redhat.com>
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 rad@semihalf.com, peter.maydell@linaro.org,
 quic_llindhol@quicinc.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, thuth@redhat.com,
 lvivier@redhat.com, pbonzini@redhat.com, imammedo@redhat.com,
 yihyu@redhat.com, shan.gavin@gmail.com
Subject: Re: [PATCH v2 0/4] NUMA: Apply socket-NUMA-node boundary for aarch64
 and RiscV machines
Message-ID: <20230224103911.snuem6opwesz7kps@orel>
References: <20230223081401.248835-1-gshan@redhat.com>
 <2d37d157-12a1-07aa-4c70-974ac1503283@ventanamicro.com>
 <fc0d2c66-5600-c33a-62d7-c72f1d16518b@redhat.com>
 <11e958b1-4763-f710-fe02-832cfd559e7b@ventanamicro.com>
 <9e8523a9-9059-e3a0-e32e-414f83e06a6f@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9e8523a9-9059-e3a0-e32e-414f83e06a6f@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 24 Feb 2023 10:39:16 -0000

On Fri, Feb 24, 2023 at 09:16:39PM +1100, Gavin Shan wrote:
> On 2/24/23 8:26 PM, Daniel Henrique Barboza wrote:
> > On 2/24/23 04:09, Gavin Shan wrote:
> > > On 2/24/23 12:18 AM, Daniel Henrique Barboza wrote:
> > > > On 2/23/23 05:13, Gavin Shan wrote:
> > > > > For arm64 and RiscV architecture, the driver (/base/arch_topology.c) is
> > > > > used to populate the CPU topology in the Linux guest. It's required that
> > > > > the CPUs in one socket can't span mutiple NUMA nodes. Otherwise, the Linux
> > > > > scheduling domain can't be sorted out, as the following warning message
> > > > > indicates. To avoid the unexpected confusion, this series attempts to
> > > > > rejects such kind of insane configurations.
> > > > > 
> > > > >     -smp 6,maxcpus=6,sockets=2,clusters=1,cores=3,threads=1 \
> > > > >     -numa node,nodeid=0,cpus=0-1,memdev=ram0                \
> > > > >     -numa node,nodeid=1,cpus=2-3,memdev=ram1                \
> > > > >     -numa node,nodeid=2,cpus=4-5,memdev=ram2                \
> > > > 
> > > > 
> > > > And why is this a QEMU problem? This doesn't hurt ACPI.
> > > > 
> > > > Also, this restriction impacts breaks ARM guests in the wild that are running
> > > > non-Linux OSes. I don't see why we should impact use cases that has nothing to
> > > > do with Linux Kernel feelings about sockets - NUMA nodes exclusivity.
> > > > 
> > > 
> > > With above configuration, CPU-0/1/2 are put into socket-0-cluster-0 while CPU-3/4/5
> > > are put into socket-1-cluster-0, meaning CPU-2/3 belong to different socket and
> > > cluster. However, CPU-2/3 are associated with NUMA node-1. In summary, multiple
> > > CPUs in different clusters and sockets have been associated with one NUMA node.
> > > 
> > > If I'm correct, the configuration isn't sensible in a baremetal environment and
> > > same Linux kernel is supposed to work well for baremetal and virtualized machine.
> > > So I think QEMU needs to emulate the topology as much as we can to match with the
> > > baremetal environment. It's the reason why I think it's a QEMU problem even it
> > > doesn't hurt ACPI. As I said in the reply to Daniel P. Berrangé <berrange@redhat.com>
> > > in another thread, we may need to gurantee that the CPUs in one cluster can't be
> > > split to multiple NUMA nodes, which matches with the baremetal environment, as I
> > > can understand.
> > > 
> > > Right, the restriction to have socket-NUMA-node or cluster-NUMA-node boundary will
> > > definitely break the configurations running in the wild.
> > 
> > 
> > What about a warning? If the user attempts to use an exotic NUMA configuration
> > like the one you mentioned we can print something like:
> > 
> > "Warning: NUMA topologies where a socket belongs to multiple NUMA nodes can cause OSes like Linux to misbehave"
> > 
> > This would inform the user what might be going wrong in case Linux is crashing/error
> > out on them and then the user is free to fix their topology (or the kernel). And
> > at the same time we wouldn't break existing stuff that happens to be working.
> > 
> > 
> 
> Yes, I think a warning message is more appropriate, so that users can fix their
> irregular configurations and the existing configurations aren't disconnected.
> It would be nice to get the agreements from Daniel P. Berrangé and Drew, before
> I'm going to change the code and post next revision.
>

If there's a concern that this will break non-Linux OSes on arm, then, at
most, the change needs to be tied to the next machine type version, and
possibly it can never be made for arm. riscv is OK, since it currently
ignores smp parameters anyway. It currently derives the number of sockets
from the number of NUMA nodes, using a 1:1 mapping. When smp parameters
are eventually implemented for riscv, then this can be revisited.

Also, it sounds like not only has the rationale for this series been
changed to "platform choice", but also that the cluster <-> numa node
mapping should be 1:1, not the socket <-> numa node mapping. If that's
the case, then the series probably needs to be reworked for that.

Thanks,
drew

