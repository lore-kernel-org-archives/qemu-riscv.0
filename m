Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kCHA3-0002iO-6k
	for mharc-qemu-riscv@gnu.org; Sun, 30 Aug 2020 02:49:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <natechancellor@gmail.com>)
 id 1kCHA1-0002hB-73; Sun, 30 Aug 2020 02:49:53 -0400
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841]:38914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <natechancellor@gmail.com>)
 id 1kCH9y-0002iP-05; Sun, 30 Aug 2020 02:49:52 -0400
Received: by mail-qt1-x841.google.com with SMTP id 92so2662904qtb.6;
 Sat, 29 Aug 2020 23:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=IyuquDcaBU2SqanxajM5i0WfnSdaboHahekXl6RU0Fs=;
 b=czN24mKh1c0mxb4/NKlW5AJC8G3hkXwgmQpBCPUo4tBvxYFmmrFo0MvmxOEbx/ngwc
 RWckjxOGeItyuzucjseIsc+fSSSFXJWf++be3GdqVKd3pqh+Nm35JBb//QZ74rm/Jndd
 n/4x5xpQxi2ixc+PYfw8N3YFyq+DAR9wso87SWt4i0vYeQCqqdwnK9humrpVk6/QloYS
 kHIDge6vAPDSdnh9K4wSZsMrW78/Ndbh2neYBK5Hq57eMzfTiu3bfucE1rc4Y6bYwbgK
 s86W+RDBFbxUklKBp1i3p7NmqJRzi/NIkH++uOiMTX5WkLyCEcql6nnc9P6qEsy+p6AO
 W52Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IyuquDcaBU2SqanxajM5i0WfnSdaboHahekXl6RU0Fs=;
 b=oAhG4/TeTSqwt8g075wIii3u1+4PxYuTu7+0hfHbQ+5SERQ5hPmqhaJLq1oMUwrDg3
 3nwaV1jfHLvxFLhk9DP6k/wS71wBjb5s8HmWDOGd2PGkazS/2H96bb35P4wOnvCOjzw+
 204FazK8wE/Bjz+YzgvkBWI+caI7dFY/hyWhTRojBr/06qjnvbMpNVkFsyn2GQdLQ070
 jDOMdlrrigI2KzgHDMkzTiQ9BIAWl/HuQXHyqC1bE60emuTyy1dKpO2cC8SZ8Hf+pnzL
 N2AjyPGQUObMx9GKN7EemaHehvDRvm2gUTRgpi75aWCJQVRCQaRFk5FAfaTwMvIReqJR
 ptKw==
X-Gm-Message-State: AOAM530r+96hJ1oZgPNaNBR437yOwQXeMvPVljx/kGM5JDC56HA40NnP
 KtXv0KtKv5E2J5Q2zfH61po=
X-Google-Smtp-Source: ABdhPJwVpu0kMrcT7uu08uZ4ivMwshQnRwbdbQkucjEPlWe/6RXtfWS5OfkUvNcGOE71GQuQbVYLbQ==
X-Received: by 2002:ac8:5b09:: with SMTP id m9mr8184639qtw.12.1598770187772;
 Sat, 29 Aug 2020 23:49:47 -0700 (PDT)
Received: from ubuntu-n2-xlarge-x86 ([2604:1380:45d1:2600::1])
 by smtp.gmail.com with ESMTPSA id g129sm4987092qkb.39.2020.08.29.23.49.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Aug 2020 23:49:46 -0700 (PDT)
Date: Sat, 29 Aug 2020 23:49:44 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-stable@nongnu.org, Richard Henderson <rth@twiddle.net>,
 qemu-riscv@nongnu.org
Subject: Re: [PATCH] memory: Revert "memory: accept mismatching sizes in
 memory_region_access_valid"
Message-ID: <20200830064944.GA1073664@ubuntu-n2-xlarge-x86>
References: <20200610134731.1514409-1-mst@redhat.com>
 <20200827053216.GA1515751@ubuntu-n2-xlarge-x86>
 <20200830021939-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200830021939-mutt-send-email-mst@kernel.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::841;
 envelope-from=natechancellor@gmail.com; helo=mail-qt1-x841.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sun, 30 Aug 2020 06:49:53 -0000

On Sun, Aug 30, 2020 at 02:20:38AM -0400, Michael S. Tsirkin wrote:
> On Wed, Aug 26, 2020 at 10:32:16PM -0700, Nathan Chancellor wrote:
> > Hi all,
> > 
> > Sorry for the duplicate reply, my first one was rejected by a mailing
> > list administrator for being too long so I resent it with the error logs
> > as a link instead of inline.
> > 
> > On Wed, Jun 10, 2020 at 09:47:49AM -0400, Michael S. Tsirkin wrote:
> > > Memory API documentation documents valid .min_access_size and .max_access_size
> > > fields and explains that any access outside these boundaries is blocked.
> > > 
> > > This is what devices seem to assume.
> > > 
> > > However this is not what the implementation does: it simply
> > > ignores the boundaries unless there's an "accepts" callback.
> > > 
> > > Naturally, this breaks a bunch of devices.
> > > 
> > > Revert to the documented behaviour.
> > > 
> > > Devices that want to allow any access can just drop the valid field,
> > > or add the impl field to have accesses converted to appropriate
> > > length.
> > > 
> > > Cc: qemu-stable@nongnu.org
> > > Reviewed-by: Richard Henderson <rth@twiddle.net>
> > > Fixes: CVE-2020-13754
> > > Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=1842363
> > > Fixes: a014ed07bd5a ("memory: accept mismatching sizes in memory_region_access_valid")
> > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > ---
> > >  memory.c | 29 +++++++++--------------------
> > >  1 file changed, 9 insertions(+), 20 deletions(-)
> > > 
> > > diff --git a/memory.c b/memory.c
> > > index 91ceaf9fcf..3e9388fb74 100644
> > > --- a/memory.c
> > > +++ b/memory.c
> > > @@ -1352,35 +1352,24 @@ bool memory_region_access_valid(MemoryRegion *mr,
> > >                                  bool is_write,
> > >                                  MemTxAttrs attrs)
> > >  {
> > > -    int access_size_min, access_size_max;
> > > -    int access_size, i;
> > > +    if (mr->ops->valid.accepts
> > > +        && !mr->ops->valid.accepts(mr->opaque, addr, size, is_write, attrs)) {
> > > +        return false;
> > > +    }
> > >  
> > >      if (!mr->ops->valid.unaligned && (addr & (size - 1))) {
> > >          return false;
> > >      }
> > >  
> > > -    if (!mr->ops->valid.accepts) {
> > > +    /* Treat zero as compatibility all valid */
> > > +    if (!mr->ops->valid.max_access_size) {
> > >          return true;
> > >      }
> > >  
> > > -    access_size_min = mr->ops->valid.min_access_size;
> > > -    if (!mr->ops->valid.min_access_size) {
> > > -        access_size_min = 1;
> > > +    if (size > mr->ops->valid.max_access_size
> > > +        || size < mr->ops->valid.min_access_size) {
> > > +        return false;
> > >      }
> > > -
> > > -    access_size_max = mr->ops->valid.max_access_size;
> > > -    if (!mr->ops->valid.max_access_size) {
> > > -        access_size_max = 4;
> > > -    }
> > > -
> > > -    access_size = MAX(MIN(size, access_size_max), access_size_min);
> > > -    for (i = 0; i < size; i += access_size) {
> > > -        if (!mr->ops->valid.accepts(mr->opaque, addr + i, access_size,
> > > -                                    is_write, attrs)) {
> > > -            return false;
> > > -        }
> > > -    }
> > > -
> > >      return true;
> > >  }
> > >  
> > > -- 
> > > MST
> > > 
> > > 
> > 
> > I just ran into a regression with booting RISC-V kernels due to this
> > commit. I can reproduce it with QEMU 5.1.0 and latest tip of tree
> > (25f6dc28a3a8dd231c2c092a0e65bd796353c769 at the time of initially
> > writing this).
> > 
> > The error message, commands, and bisect logs are available here:
> > 
> > https://gist.githubusercontent.com/nathanchance/c106dd22ec0c0e00f6a25daba106a1b9/raw/d929f2fff6da9126ded156affb0f19f359e9f693/qemu-5.1.0-issue-terminal-log.txt
> > 
> > I have attached the rootfs and kernel image used for these tests. If for
> > some reason there is a problem receiving them, the kernel is just an
> > arch/riscv/configs/defconfig kernel at Linux 5.9-rc2 and the rootfs is
> > available here:
> > 
> > https://github.com/ClangBuiltLinux/boot-utils/blob/3b21a5b71451742866349ba4f18638c5a754e660/images/riscv/rootfs.cpio.zst
> > 
> > Please let me know if I can provide any follow up information or if I am
> > doing something wrong.
> > 
> > Cheers,
> > Nathan
> 
> 
> The following patch was proposed to fix the issue:
> 
> -----------------------------------------------------------
>  hw/display/tcx.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/display/tcx.c b/hw/display/tcx.c
> index 1fb45b1aab8..96c6898b149 100644
> --- a/hw/display/tcx.c
> +++ b/hw/display/tcx.c
> @@ -548,20 +548,28 @@ static const MemoryRegionOps tcx_stip_ops = {
>      .read = tcx_stip_readl,
>      .write = tcx_stip_writel,
>      .endianness = DEVICE_NATIVE_ENDIAN,
> -    .valid = {
> +    .impl = {
>          .min_access_size = 4,
>          .max_access_size = 4,
>      },
> +    .valid = {
> +        .min_access_size = 4,
> +        .max_access_size = 8,
> +    },
>  };
>  
>  static const MemoryRegionOps tcx_rstip_ops = {
>      .read = tcx_stip_readl,
>      .write = tcx_rstip_writel,
>      .endianness = DEVICE_NATIVE_ENDIAN,
> -    .valid = {
> +    .impl = {
>          .min_access_size = 4,
>          .max_access_size = 4,
>      },
> +    .valid = {
> +        .min_access_size = 4,
> +        .max_access_size = 8,
> +    },
>  };
>  
>  static uint64_t tcx_blit_readl(void *opaque, hwaddr addr,
> @@ -650,10 +658,14 @@ static const MemoryRegionOps tcx_rblit_ops = {
>      .read = tcx_blit_readl,
>      .write = tcx_rblit_writel,
>      .endianness = DEVICE_NATIVE_ENDIAN,
> -    .valid = {
> +    .impl = {
>          .min_access_size = 4,
>          .max_access_size = 4,
>      },
> +    .valid = {
> +        .min_access_size = 4,
> +        .max_access_size = 8,
> +    },
>  };
>  
>  static void tcx_invalidate_cursor_position(TCXState *s)
> 
> 
> -----------------------------------------------------------
> 
> does this fix the issue for you?

Unfortunately, it does not. I applied it on top of latest
git (ac8b279f13865d1a4f1958d3bf34240c1c3af90d) and I can still
reproduce my failure. Is it possible that type of fix is needed
in a RISC-V specific driver?

Would you like me to comment on the Launchpad bug as well?

Cheers,
Nathan

> > -- 
> > 2.26.2
> > 
> > -- 
> > You received this bug notification because you are subscribed to the bug
> > report.
> > https://bugs.launchpad.net/bugs/1892540
> > 
> > Title:
> >   qemu can no longer boot NetBSD/sparc
> > 
> > Status in QEMU:
> >   New
> > 
> > Bug description:
> >   Booting NetBSD/sparc in qemu no longer works.  It broke between qemu
> >   version 5.0.0 and 5.1.0, and a bisection identified the following as
> >   the offending commit:
> > 
> >     [5d971f9e672507210e77d020d89e0e89165c8fc9] memory: Revert "memory:
> >   accept mismatching sizes in memory_region_access_valid"
> > 
> >   It's still broken as of 7fd51e68c34fcefdb4d6fd646ed3346f780f89f4.
> > 
> >   To reproduce, run
> > 
> >     wget http://ftp.netbsd.org/pub/NetBSD/NetBSD-9.0/images/NetBSD-9.0-sparc.iso
> >     qemu-system-sparc -nographic -cdrom NetBSD-9.0-sparc.iso -boot d
> > 
> >   The expected behavior is that the guest boots to the prompt
> > 
> >     Installation medium to load the additional utilities from:
> > 
> >   The observed behavior is a panic:
> > 
> >     [   1.0000050] system[0]: trap 0x29: pc=0xf0046b14 sfsr=0xb6 sfva=0x54000000
> >     [   1.0000050] cpu0: data fault: pc=0xf0046b14 addr=0x54000000 sfsr=0xb6<PERR=0x0,LVL=0x0,AT=0x5,FT=0x5,FAV,OW>
> >     [   1.0000050] panic: kernel fault
> >     [   1.0000050] halted
> > 
> > To manage notifications about this bug go to:
> > https://bugs.launchpad.net/qemu/+bug/1892540/+subscriptions
> 
> 
> 

