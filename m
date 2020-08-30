Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kCUT8-0005GY-Mh
	for mharc-qemu-riscv@gnu.org; Sun, 30 Aug 2020 17:02:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kCUT7-0005FM-K2
 for qemu-riscv@nongnu.org; Sun, 30 Aug 2020 17:02:29 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:31326
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kCUT4-0006Y9-IL
 for qemu-riscv@nongnu.org; Sun, 30 Aug 2020 17:02:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598821345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J28CCJfGG+ljSEorICWLhVTWzErz59BPNB8snhKQgjM=;
 b=RD8q/bXKt+Rv4JYq0vaosTc2ROj/aK5VbZ4xcOkv+9fdWeqNUWgX/TFPlbk5OnZALs3UDI
 qpQOJ0XpiZQUUFHs53MKimN/hn7zggdcr1s6jGkpDo5QRFasAHDTUPAE2ihm7q5nlSoW9x
 SRVOH4urw4fQ+Yke3xc/tmV5Gpnkvbo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-Ben34hazN2uH6209J6pyyg-1; Sun, 30 Aug 2020 17:02:21 -0400
X-MC-Unique: Ben34hazN2uH6209J6pyyg-1
Received: by mail-wr1-f71.google.com with SMTP id i6so2388286wrs.13
 for <qemu-riscv@nongnu.org>; Sun, 30 Aug 2020 14:02:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=J28CCJfGG+ljSEorICWLhVTWzErz59BPNB8snhKQgjM=;
 b=pwa+xownEodbNTZc6eULKl9eaDLlXmI59HloIGxqx+VsKhwlK4VZxb/qQ48Z4lWM55
 YUtePTbNRCAj0bT9M+smLR6DU9cjrC3iBD5F0yNv9PP6kepq90tmCTUn2jm+lRsGltAq
 32CLtnUb9gGdxSIaVGLK7haJdbnArMvvIPIQTkWbHFcvFqCRbuxxO3kXbGZY45psSmtY
 FJh33UFXDAC3umOmZJpvFY0vTFzfiZ+IAMf+t6PiJ5bMNptH06Ivgu//saVbpc1oh4o8
 ZbK9D4gQ+bmmwYFkjkXeK2YkV89FEVNuJztVwkEW2RCCjcnxlDx0rPXZYI7Urwnz4lJe
 OOMg==
X-Gm-Message-State: AOAM531qi/YYSovRtctf6/TfUYSzwuOIzP+IDQIq2Ke85coQUwfb7kVO
 LoaKToeK1h6AQV5Dcy+30csiD0WjGGQ5MYArXN/jVjxifDETziFfjt10R1aYJgZfotsmIG6Ofz5
 83Kw6lMhV6jmLhRU=
X-Received: by 2002:a5d:4a4b:: with SMTP id v11mr8352949wrs.36.1598821340616; 
 Sun, 30 Aug 2020 14:02:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDjyW/wVF0qsKoDpzjVdUqWQbDMa+tm4JECSA2VU5mepE4SDYyMbQXRv7iRMPWn/39DZhrAQ==
X-Received: by 2002:a5d:4a4b:: with SMTP id v11mr8352927wrs.36.1598821340234; 
 Sun, 30 Aug 2020 14:02:20 -0700 (PDT)
Received: from redhat.com (bzq-109-64-136-54.red.bezeqint.net. [109.64.136.54])
 by smtp.gmail.com with ESMTPSA id h184sm8023138wmh.41.2020.08.30.14.02.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Aug 2020 14:02:18 -0700 (PDT)
Date: Sun, 30 Aug 2020 17:02:15 -0400
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
Message-ID: <20200830170132-mutt-send-email-mst@kernel.org>
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
Received-SPF: pass client-ip=207.211.31.81; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/30 17:02:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
X-List-Received-Date: Sun, 30 Aug 2020 21:02:29 -0000

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


So pls try this patch and use gdb backtrace to see access to which MR
triggers the assert.


diff --git a/softmmu/memory.c b/softmmu/memory.c
index 70b93104e8..dc8b7682aa 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1368,6 +1368,7 @@ bool memory_region_access_valid(MemoryRegion *mr,
 
     if (size > mr->ops->valid.max_access_size
         || size < mr->ops->valid.min_access_size) {
+        assert(0);
         return false;
     }
     return true;


