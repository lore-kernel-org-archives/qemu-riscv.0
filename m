Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kCGi2-0007fC-2S
	for mharc-qemu-riscv@gnu.org; Sun, 30 Aug 2020 02:20:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kCGi0-0007cg-7H
 for qemu-riscv@nongnu.org; Sun, 30 Aug 2020 02:20:56 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:37190
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kCGhs-0000Gb-K3
 for qemu-riscv@nongnu.org; Sun, 30 Aug 2020 02:20:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598768447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dtDWKcW89q+Ftt9uCoYc7tBBrjmqgHOx8mIB74jVTtc=;
 b=Ty7bl0dqikGQ/6zzDTid3E781BFDyg653+5n6P8CJ18ZTx1OoLHTzSt72HtsfOA194Q45J
 +r286cIcyqfUcmNnAguVJNUgrQFiTCIfxxWW0eFCy88dx/xFN35jGBGtagInx8ANEo7gPj
 K1NE21edYas3ZCheoth1OklfvoxquVY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-hPJF3_iEOte_qDZ-W1N_QQ-1; Sun, 30 Aug 2020 02:20:43 -0400
X-MC-Unique: hPJF3_iEOte_qDZ-W1N_QQ-1
Received: by mail-wr1-f72.google.com with SMTP id l15so728295wro.10
 for <qemu-riscv@nongnu.org>; Sat, 29 Aug 2020 23:20:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dtDWKcW89q+Ftt9uCoYc7tBBrjmqgHOx8mIB74jVTtc=;
 b=W6tZ9zloORAOPOdDB1QbwkXgiYoTT4//xOiYWuJhvY6+Re65XH7HutfPeqjf10RV5f
 gYirdvKX5uCOPdmf/usgHU5tSkWP0+h457emVvhTHd9wtOkSjSUzxX3xaQ0ldGR1cbr9
 VQW1m8BwIxBiJWHcojGANLvfmXL5ysQRRqgyO6MsuzALu8fj9Y6gRK5bOoF0OLfpITMl
 CrKJAinyN6+kpmbuH0NYlhLQHZu+Ha0Pbx/nyNI3aK1omem9yaPDQFE9Cc/YWMSGOAR2
 nUTUl4g8oxAsQAv3g5qCloZowkJoAORoa7PtLqoCR1Q/Xm1Kx5gKBAEiHkCZyVGHb1YQ
 pjog==
X-Gm-Message-State: AOAM530e4FRyyFHZXFF3J6I9hGYGQv270QW7HnxlGtUyUbv3kEetoCRQ
 R9CWIRLhPqE0tUgi//M39OlRjSxTExm9nAXMYZn5cxyo89BMhaW2/FooFdCNVg/AY21E8T7CpJ4
 BCqasr2Rs2/dtZMg=
X-Received: by 2002:adf:a287:: with SMTP id s7mr6672363wra.103.1598768442200; 
 Sat, 29 Aug 2020 23:20:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5YbtoHXF+no8PKTlSCp8iIGRC9w0k9TFJ4KzQNYA+vKlrfrOKlKILb6kClJuLPeYO3hS7Tw==
X-Received: by 2002:adf:a287:: with SMTP id s7mr6672336wra.103.1598768441891; 
 Sat, 29 Aug 2020 23:20:41 -0700 (PDT)
Received: from redhat.com (bzq-109-64-136-54.red.bezeqint.net. [109.64.136.54])
 by smtp.gmail.com with ESMTPSA id z11sm576426wru.88.2020.08.29.23.20.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Aug 2020 23:20:41 -0700 (PDT)
Date: Sun, 30 Aug 2020 02:20:38 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Nathan Chancellor <natechancellor@gmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-stable@nongnu.org, Richard Henderson <rth@twiddle.net>,
 qemu-riscv@nongnu.org
Subject: Re: [PATCH] memory: Revert "memory: accept mismatching sizes in
 memory_region_access_valid"
Message-ID: <20200830021939-mutt-send-email-mst@kernel.org>
References: <20200610134731.1514409-1-mst@redhat.com>
 <20200827053216.GA1515751@ubuntu-n2-xlarge-x86>
MIME-Version: 1.0
In-Reply-To: <20200827053216.GA1515751@ubuntu-n2-xlarge-x86>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=mst@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/30 02:07:05
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.959,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 30 Aug 2020 06:20:56 -0000

On Wed, Aug 26, 2020 at 10:32:16PM -0700, Nathan Chancellor wrote:
> Hi all,
> 
> Sorry for the duplicate reply, my first one was rejected by a mailing
> list administrator for being too long so I resent it with the error logs
> as a link instead of inline.
> 
> On Wed, Jun 10, 2020 at 09:47:49AM -0400, Michael S. Tsirkin wrote:
> > Memory API documentation documents valid .min_access_size and .max_access_size
> > fields and explains that any access outside these boundaries is blocked.
> > 
> > This is what devices seem to assume.
> > 
> > However this is not what the implementation does: it simply
> > ignores the boundaries unless there's an "accepts" callback.
> > 
> > Naturally, this breaks a bunch of devices.
> > 
> > Revert to the documented behaviour.
> > 
> > Devices that want to allow any access can just drop the valid field,
> > or add the impl field to have accesses converted to appropriate
> > length.
> > 
> > Cc: qemu-stable@nongnu.org
> > Reviewed-by: Richard Henderson <rth@twiddle.net>
> > Fixes: CVE-2020-13754
> > Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=1842363
> > Fixes: a014ed07bd5a ("memory: accept mismatching sizes in memory_region_access_valid")
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > ---
> >  memory.c | 29 +++++++++--------------------
> >  1 file changed, 9 insertions(+), 20 deletions(-)
> > 
> > diff --git a/memory.c b/memory.c
> > index 91ceaf9fcf..3e9388fb74 100644
> > --- a/memory.c
> > +++ b/memory.c
> > @@ -1352,35 +1352,24 @@ bool memory_region_access_valid(MemoryRegion *mr,
> >                                  bool is_write,
> >                                  MemTxAttrs attrs)
> >  {
> > -    int access_size_min, access_size_max;
> > -    int access_size, i;
> > +    if (mr->ops->valid.accepts
> > +        && !mr->ops->valid.accepts(mr->opaque, addr, size, is_write, attrs)) {
> > +        return false;
> > +    }
> >  
> >      if (!mr->ops->valid.unaligned && (addr & (size - 1))) {
> >          return false;
> >      }
> >  
> > -    if (!mr->ops->valid.accepts) {
> > +    /* Treat zero as compatibility all valid */
> > +    if (!mr->ops->valid.max_access_size) {
> >          return true;
> >      }
> >  
> > -    access_size_min = mr->ops->valid.min_access_size;
> > -    if (!mr->ops->valid.min_access_size) {
> > -        access_size_min = 1;
> > +    if (size > mr->ops->valid.max_access_size
> > +        || size < mr->ops->valid.min_access_size) {
> > +        return false;
> >      }
> > -
> > -    access_size_max = mr->ops->valid.max_access_size;
> > -    if (!mr->ops->valid.max_access_size) {
> > -        access_size_max = 4;
> > -    }
> > -
> > -    access_size = MAX(MIN(size, access_size_max), access_size_min);
> > -    for (i = 0; i < size; i += access_size) {
> > -        if (!mr->ops->valid.accepts(mr->opaque, addr + i, access_size,
> > -                                    is_write, attrs)) {
> > -            return false;
> > -        }
> > -    }
> > -
> >      return true;
> >  }
> >  
> > -- 
> > MST
> > 
> > 
> 
> I just ran into a regression with booting RISC-V kernels due to this
> commit. I can reproduce it with QEMU 5.1.0 and latest tip of tree
> (25f6dc28a3a8dd231c2c092a0e65bd796353c769 at the time of initially
> writing this).
> 
> The error message, commands, and bisect logs are available here:
> 
> https://gist.githubusercontent.com/nathanchance/c106dd22ec0c0e00f6a25daba106a1b9/raw/d929f2fff6da9126ded156affb0f19f359e9f693/qemu-5.1.0-issue-terminal-log.txt
> 
> I have attached the rootfs and kernel image used for these tests. If for
> some reason there is a problem receiving them, the kernel is just an
> arch/riscv/configs/defconfig kernel at Linux 5.9-rc2 and the rootfs is
> available here:
> 
> https://github.com/ClangBuiltLinux/boot-utils/blob/3b21a5b71451742866349ba4f18638c5a754e660/images/riscv/rootfs.cpio.zst
> 
> Please let me know if I can provide any follow up information or if I am
> doing something wrong.
> 
> Cheers,
> Nathan


The following patch was proposed to fix the issue:

-----------------------------------------------------------
 hw/display/tcx.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/hw/display/tcx.c b/hw/display/tcx.c
index 1fb45b1aab8..96c6898b149 100644
--- a/hw/display/tcx.c
+++ b/hw/display/tcx.c
@@ -548,20 +548,28 @@ static const MemoryRegionOps tcx_stip_ops = {
     .read = tcx_stip_readl,
     .write = tcx_stip_writel,
     .endianness = DEVICE_NATIVE_ENDIAN,
-    .valid = {
+    .impl = {
         .min_access_size = 4,
         .max_access_size = 4,
     },
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 8,
+    },
 };
 
 static const MemoryRegionOps tcx_rstip_ops = {
     .read = tcx_stip_readl,
     .write = tcx_rstip_writel,
     .endianness = DEVICE_NATIVE_ENDIAN,
-    .valid = {
+    .impl = {
         .min_access_size = 4,
         .max_access_size = 4,
     },
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 8,
+    },
 };
 
 static uint64_t tcx_blit_readl(void *opaque, hwaddr addr,
@@ -650,10 +658,14 @@ static const MemoryRegionOps tcx_rblit_ops = {
     .read = tcx_blit_readl,
     .write = tcx_rblit_writel,
     .endianness = DEVICE_NATIVE_ENDIAN,
-    .valid = {
+    .impl = {
         .min_access_size = 4,
         .max_access_size = 4,
     },
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 8,
+    },
 };
 
 static void tcx_invalidate_cursor_position(TCXState *s)


-----------------------------------------------------------

does this fix the issue for you?


> -- 
> 2.26.2
> 
> -- 
> You received this bug notification because you are subscribed to the bug
> report.
> https://bugs.launchpad.net/bugs/1892540
> 
> Title:
>   qemu can no longer boot NetBSD/sparc
> 
> Status in QEMU:
>   New
> 
> Bug description:
>   Booting NetBSD/sparc in qemu no longer works.  It broke between qemu
>   version 5.0.0 and 5.1.0, and a bisection identified the following as
>   the offending commit:
> 
>     [5d971f9e672507210e77d020d89e0e89165c8fc9] memory: Revert "memory:
>   accept mismatching sizes in memory_region_access_valid"
> 
>   It's still broken as of 7fd51e68c34fcefdb4d6fd646ed3346f780f89f4.
> 
>   To reproduce, run
> 
>     wget http://ftp.netbsd.org/pub/NetBSD/NetBSD-9.0/images/NetBSD-9.0-sparc.iso
>     qemu-system-sparc -nographic -cdrom NetBSD-9.0-sparc.iso -boot d
> 
>   The expected behavior is that the guest boots to the prompt
> 
>     Installation medium to load the additional utilities from:
> 
>   The observed behavior is a panic:
> 
>     [   1.0000050] system[0]: trap 0x29: pc=0xf0046b14 sfsr=0xb6 sfva=0x54000000
>     [   1.0000050] cpu0: data fault: pc=0xf0046b14 addr=0x54000000 sfsr=0xb6<PERR=0x0,LVL=0x0,AT=0x5,FT=0x5,FAV,OW>
>     [   1.0000050] panic: kernel fault
>     [   1.0000050] halted
> 
> To manage notifications about this bug go to:
> https://bugs.launchpad.net/qemu/+bug/1892540/+subscriptions




