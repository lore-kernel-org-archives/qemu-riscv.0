Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B276BC83F2C
	for <qemu-riscv@archiver.kernel.org>; Mon,  4 Sep 2023 09:06:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qd5XU-0000lP-Et; Mon, 04 Sep 2023 05:06:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qd5XK-0000eQ-EA
 for qemu-riscv@nongnu.org; Mon, 04 Sep 2023 05:06:26 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qd5XF-0003Wx-2l
 for qemu-riscv@nongnu.org; Mon, 04 Sep 2023 05:06:21 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-401ec23be82so13269985e9.0
 for <qemu-riscv@nongnu.org>; Mon, 04 Sep 2023 02:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1693818364; x=1694423164; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=xqudAHKZd0Mc5V2i+82Mm5o0Qp7Gemx5LAbnwIXsI2w=;
 b=Gc/4Jgyt29sUu0i0uQk0h9O1IW8UREcT5IDZWeme/Kgv7Rd5OuZIOcMxXhGAzB77XC
 xRkfxCwKWjb0iQREXz8FOW4gN6bcYWfI2ErgkcJQIEkJDINDWZSgw/ENZcKra5uNTCCr
 S/i5kGp/ymLajGl6jCkF/c/AW4baQkCZ9cAbdr+bOvw/b6xF2tP1WBZMSXl9bRUTRgnU
 coopKlCHmgxpgqIls3/oHorKbGW4PAnYKxSZ3PCnbftRhXx9q8P6cJ9V27ZXtCQSb+CA
 RE62y4MMJYrlLQzsyJ5AITtxMwtgY0P2pNbplWWDg2i0laFubuaTyEyor9J47WN7Rlkm
 FfRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693818364; x=1694423164;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xqudAHKZd0Mc5V2i+82Mm5o0Qp7Gemx5LAbnwIXsI2w=;
 b=ZE7RpHu69bmBraLidz0z1PGFcqnG3pENiAnm0Tgs1Xuo/zV7MGUU5VeqnlnjH+0DFc
 dO5CaI1MsKPzuhl9nA36Sqpg/f/F9jA+ukzYJ1vzwuEFLpp9M+fqqDuw7X+XcRFiQLDp
 noBmCjwYmJ7gn877MsJuzvcwsoOzSUszq5H6T4cZFDP6DnsG5uklQj2Koh2+85HABl5k
 xxOndMBBOc5NBatrhp+fP6HD14bG3xa99iBcgBF5CV5ZMtIZWAcjztrdnOFn5SUjHbfI
 JTnyXCKhtTXxiaqnutk5cpGarfVYcZzc3SZ719hPqewqqwYdL25kaBTGYtvoGvNW3ako
 q5ow==
X-Gm-Message-State: AOJu0YwKA3WjmrlH6TjRhppJT0GZIT4ulN5QOA9sLgZAjEzTAxS6nB4L
 x+Vn81CvI5S9FYGxjrZDA2d24Q==
X-Google-Smtp-Source: AGHT+IGpFRE90A7pIDa6VkvzKFmK2UDc48p3cKpWZ4Jd98KzaoisiKLl33f2ZFyokekIC0mEOE84Lg==
X-Received: by 2002:a1c:7911:0:b0:401:4542:5edf with SMTP id
 l17-20020a1c7911000000b0040145425edfmr6645987wme.0.1693818364154; 
 Mon, 04 Sep 2023 02:06:04 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 k33-20020a05600c1ca100b0040210a27e29sm13851526wms.32.2023.09.04.02.05.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Sep 2023 02:05:44 -0700 (PDT)
Date: Mon, 4 Sep 2023 11:05:20 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH 20/20] target/riscv: add 'kvm_supported' class property
Message-ID: <20230904-1b7add86ab4c666c700d20b2@orel>
References: <20230825130853.511782-1-dbarboza@ventanamicro.com>
 <20230825130853.511782-21-dbarboza@ventanamicro.com>
 <20230831-786fd32dfa7014f439b69775@orel>
 <7b4c103a-facd-6965-5bb3-8354ab03feb0@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b4c103a-facd-6965-5bb3-8354ab03feb0@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Fri, Sep 01, 2023 at 05:57:46PM -0300, Daniel Henrique Barboza wrote:
> 
> 
> On 8/31/23 09:47, Andrew Jones wrote:
> > On Fri, Aug 25, 2023 at 10:08:53AM -0300, Daniel Henrique Barboza wrote:
> > > This follows the same idea of 'tcg_support' property added in the
> > > previous patch. Note that we're now implementing the 'cpu_realizefn' for
> > > the KVMAccel class since this verification is done in realize() time.
> > > 
> > > Supporting vendor CPUs with KVM is not possible. We rely on the
> > > extension support of the KVM module running in the host, making it
> > > impossible to guarantee that a vendor CPU will have all the required
> > > extensions available. The only way to guarantee that a vendor CPU is KVM
> > > compatible is running KVM in a host that has the same vendor CPU, and
> > 
> > Or to attempt to enable each extension which the vendor CPU expects and
> > to attempt to disable everything else. If all those actions succeed, then
> > we can override the ID registers with those of the CPU we want to model
> > and go for it. There's still risk, though, that the guest kernel will see
> > the ID registers of the model and attempt to apply some errata workaround
> > which may or may not work and/or crash the guest.
> 
> This can also happen when migrating the guest from a host that happens to have
> an errata to one that doesn't have, regardless of the CPU type the guest
> is using (host CPU vs vendor CPU). The guest would need a power cycle to
> identify the current model ID.

We shouldn't migrate a 'host' CPU model anywhere other than to an exactly
identical host (same ID registers, same errata). Also, migration must
consider the host kernel. The aim is to support "ping-pong" migration,
i.e. migrate A->B->A, where B has a host kernel which is the same or more
recent than A. This is a reasonable level of support, as it supports host
upgrades with rollback. B cannot be older than A, as it may not handle
errata in the same way.

> 
> We don't have the tooling needed to mitigate this risk in QEMU I'm afraid. Upper
> layers like libvirt are more able to deal with it.

And higher layers yet, libvirt daemons capture all the information of the
hosts they run on. Layers above libvirt compare information from all hosts
under their control to create sets of possible migration destinations for
each VM, considering the VM configurations.

> 
> > 
> > > for this case we already have the 'host' CPU type.
> > > 
> > > We're better of declaring that all vendors CPUs are not KVM capable.
> > > After this patch, running KVM accel with a vendor CPU will produce an
> > > error like the following:
> > > 
> > > $ ./qemu-system-riscv64 -M virt,accel=kvm -cpu veyron-v1
> > > qemu-system-riscv64: 'veyron-v1' CPU is not compatible with KVM acceleration
> > 
> > Shouldn't we at least check if the host matches the requested CPU first?
> > So, if we happen to be on a veyron-v1, then the veyron-v1 model should
> > be equivalent to 'host'. (They may not be 100% equivalent in practice, but
> > theoretically they should be, which means trying it and debugging the bugs
> > should improve the CPU models on both sides.)
> 
> If we're really going this route we would need to match host and vendor CPU
> in the extension level, matching each vendor CPU extension with what the
> CPU can provide, failing if the host can't provide all extensions the vendor
> CPU requires.

We can't support arbitrary vendor CPU models on arbitrary hosts. I'm only
advocating for supporting CPU model XYZ when KVM is running on XYZ CPUs
or compatible CPUs (more on the compatible CPUs later).

To elaborate, I don't really see a problem with expecting KVM to provide a
VCPU which matches the CPU model of the physical CPU which KVM is running
on (minus M-mode). KVM should be steadily learning how to expose all
extensions of the CPUs it runs on to its guests. So, while it may not be
possible now to enable all extensions of a particular model, it should be
eventually. If there are extensions in the CPU model which cannot be
virtualized, then it may be tolerable for QEMU to just warn about them,
rather than abort the whole thing (hopefully we don't have any of those
anyway). And, the "VCPU only almost matching the CPU model" problem isn't
much different than the "VCPU not actually matching the host CPU when
using '-cpu host'" problem. In both cases, a user may not be pleased that
they didn't get exactly what they asked for. At least with the CPU model,
QEMU will be aware of the differences and can warn about them.

> I wouldn't even bother checking for things like machine ID since
> they can be easily impersonated (e.g. use a rv64 emulated host, edit mvendorid)
> and can't be trusted.

We should definitely check the ID registers. If KVM says it's running on
XYZ CPUs, then we should consider allowing the XYZ model to be used with
KVM guests. If the host is emulated and the user configured things in
a strange way, then, when things blow up, they can keep the pieces.

> 
> TBH I am not thrilled with the idea of supporting vendor CPUs with KVM. The user
> can pick the 'host' CPU to have the most capable KVM CPU available in the host,
> and that is already not trivial to support in cases like live migration and so
> on.

(And now back to compatible CPUs.)

The user may not want the most capable VCPU. The user may want the most
compatible for their datacenter. If the datacenter is a bunch of XYZ
revision 1 CPUs which are slowly getting replaced with XYZ revision 2
CPUs, and revision 2 is compatible with revision 1, then it should be
safe to use the XYZ revision 1 CPU model for KVM VCPUs. Using '-cpu host'
would require that the guests only migrate to other hosts of the exact
same type (either revision 1 or revision 2, depending on where they were
launched first).

> Vendor CPU KVM support will promote things like:
> 
> "I tried to use a veyron-v2 KVM CPU in a veyron-v1 host, why is that not possible
> it should be it's not fair"
> 
> "why can't I use a vendor X KVM CPU A into a vendor Y CPU B host it surely should
> work since CPU A is older than CPU B right"

If KVM and QEMU decide a CPU model is compatible with the host they're
running on, then the model will be allowed. If not, then the model will
error out. Documentation about what is possible and not for RISC-V KVM
CPU models is the best we can do to educate users.

> 
> And then, even if we decide to support vendor CPUs with KVM in a feasible way, with
> a lot of conditions and training wheels, we'll be so restrictive that the user will
> be better of using the 'host' CPU anyway.

Whether 'host' is the better choice or not depends on the use case. Being
able to migrate a less capable VM to similar hardware in a datacenter
could be a higher priority than extension support. The admins deploying
VMs will need to collect the requirements from their users and make those
choices. We should try to provide support for both.

There could be an argument made that the set of compatible CPUs is too
small to bother with supporting CPU models at all. (That's basically the
argument we have in the Arm KVM world where only '-cpu host' is
supported since errata mitigations are installed based on ID registers.)
I'm a bit more optimistic with RISC-V, because the base of the RISC-V
instruction set is small and I hope vendors will conform to the specs for
it (there are already examples to the contrary, but let's stay optimistic
a bit longer :-). So, if we assume the size and spec compliance of the
base keeps errata out of the base, then the errata will only be in
extensions. This means that the mitigations, which will still use ID
registers to install, would only apply to extensions. Then, it's easy to
avoid those mitigations by simply disabling the affected extensions
altogether.

Now, one might state, if we're disabling extensions to avoid errata, then
we're no longer properly providing the model. That statement is correct,
which is why we also need to provide a bare minimal base CPU model where
each extension that should be enabled is explicitly enabled on the QEMU
command line. This base CPU model would use zero for the ID registers,
which is a legal value and indicates that the CPU "is a non-commercial
implementation". Actually, I could be convinced to not support XYZ VCPUs
on XYZ CPU hosts at all, as long as we have this base CPU model working
with KVM, since the base CPU model can satisfy those that prioritize
migration over capabilities even better than CPU models can.

> 
> 
> All this said, there's a lot going on in this series already and this vendor CPU + KVM
> discussion might deserve its own RFC/thread. I'll drop this patch from the series to
> give us time to discuss this properly. Let's leave it as is for now.

Works for me.

Thanks,
drew

