Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbMoB-0006Sn-BN
	for mharc-qemu-riscv@gnu.org; Fri, 15 Oct 2021 08:59:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mbMo9-0006Ls-0L
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 08:59:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mbMo7-0007pe-1w
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 08:59:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634302769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mWKUxNUGl2oeLuBY/ljbYe4O8kdZCwjFjo4MJYYDqZQ=;
 b=fnwXRiVIpJ8u4ZD+hG2YZoWAVcmSFFW3Xx9of/hyNjYGM1ySIfMYtmronghSYprEL5QYcN
 4PKxFSyjjr7nAJvGmCPFutGkHi1sJa9g/wFePbVfq+JUw7dXkFxgaX1Tp45Z3Jr00YijOX
 FJ1JFY+kM8gfmGB60FLFpneY2+2KXQY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-zx4UmJsmNSKOe_m42u4tUg-1; Fri, 15 Oct 2021 08:59:26 -0400
X-MC-Unique: zx4UmJsmNSKOe_m42u4tUg-1
Received: by mail-ed1-f71.google.com with SMTP id
 r11-20020aa7cfcb000000b003d4fbd652b9so8139402edy.14
 for <qemu-riscv@nongnu.org>; Fri, 15 Oct 2021 05:59:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mWKUxNUGl2oeLuBY/ljbYe4O8kdZCwjFjo4MJYYDqZQ=;
 b=239RSInOiF0kb+HEhk102FDgQvsHnVjGCULfix3AbgJJbJXV0QfkEy93xI8En/QHXT
 ByVQLERearWpT8F+I8f2WVHbhhz7IzdJk0y2N/vizjbx1K4JQ5oUU6PbN0mKcZhJu7Xu
 AXMMFBkdXNIzX/KT0+DOVFIm2MPPnL1ZnOhcRN5J2RqryEffMa4LQVt7HHOz64k84s/o
 JH3bCqptGrvkMjbulqrDKp2oDLb7gDWwKNQ0yEGrusITNLwY4D2at6iIBxEA8fFQbK68
 rcCsfoNyBotccdYGw0VQu6qsCAa0PoQNRpRI/jC0udebyicWHk4IN8vzC805+FROvX9e
 /+iA==
X-Gm-Message-State: AOAM533Vre1335fCc2JqWq+laQNED6jlbJ/s+c1BqunOAEAw8dlZ7E3q
 c6ftqR+d930hZf8mnpf8Dbwxmt6fTrFfroQ6iKCIdjr9wNXmkRzKYiFnemc6P/+xSxHmWWgv7jG
 ho6qDCqiB8BDNOiM=
X-Received: by 2002:a17:906:2346:: with SMTP id
 m6mr6668315eja.512.1634302764784; 
 Fri, 15 Oct 2021 05:59:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy75CcpOd/V/8F/KFhRAFFlXIZY0vHMRLUXTr3qovj3jx0FQND+UZbK+Sgxj5/F4/Ybja9Z9Q==
X-Received: by 2002:a17:906:2346:: with SMTP id
 m6mr6668280eja.512.1634302764480; 
 Fri, 15 Oct 2021 05:59:24 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id p8sm4090658ejo.2.2021.10.15.05.59.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 05:59:23 -0700 (PDT)
Date: Fri, 15 Oct 2021 14:59:22 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: "limingwang (A)" <limingwang@huawei.com>, "open list:RISC-V"
 <qemu-riscv@nongnu.org>, Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, Jiangyifei
 <jiangyifei@huawei.com>, Alistair Francis <alistair.francis@wdc.com>,
 "Wanghaibin \(D\)" <wanghaibin.wang@huawei.com>, "Fanliang \(EulerOS\)"
 <fanliang@huawei.com>, Palmer Dabbelt <palmer@dabbelt.com>, "Wubin \(H\)"
 <wu.wubin@huawei.com>
Subject: Re: [PATCH v2] hw/riscv: virt: bugfix the memory-backend-file
 command is invalid
Message-ID: <20211015145922.5a82e31a@redhat.com>
In-Reply-To: <CAEUhbmVD1jyvGJrQLSZLJYfaz6E-m0b9SZA+DQA2YYK70oL7Lg@mail.gmail.com>
References: <20211012014501.24996-1-limingwang@huawei.com>
 <CAEUhbmX=A4LPgzNgNPcxzzg=veU0=3vXyZQrwikxMFvb_Rcxzw@mail.gmail.com>
 <c4c6cc03d1c6459ea036c08ae30806a5@huawei.com>
 <CAEUhbmVD1jyvGJrQLSZLJYfaz6E-m0b9SZA+DQA2YYK70oL7Lg@mail.gmail.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 15 Oct 2021 12:59:33 -0000

On Fri, 15 Oct 2021 17:25:01 +0800
Bin Meng <bmeng.cn@gmail.com> wrote:

> On Fri, Oct 15, 2021 at 4:52 PM limingwang (A) <limingwang@huawei.com> wrote:
> >
> >
> > On Wed, Oct 13, 2021 at 22:41 PM Bin Meng <bin.meng@windriver.com> wrote:  
> > >
> > > On Tue, Oct 12, 2021 at 9:46 AM MingWang Li <limingwang@huawei.com> wrote:  
> > > >
> > > > From: Mingwang Li <limingwang@huawei.com>
> > > >
> > > > When I start the VM with the following command:
> > > > $ ./qemu-system-riscv64 -M virt,accel=kvm -m 4096M -cpu host -nographic \
> > > >     -name guest=riscv-guset \
> > > >     -smp 2 \
> > > >     -bios none \
> > > >     -kernel ./Image \
> > > >     -drive file=./guest.img,format=raw,id=hd0 \
> > > >     -device virtio-blk-device,drive=hd0 \
> > > >     -append "root=/dev/vda rw console=ttyS0 earlycon=sbi" \
> > > >     -object  
> > > memory-backend-file,id=mem,size=4096M,mem-path=/dev/hugepages,share=on \  
> > > >     -numa node,memdev=mem -mem-prealloc \
> > > >     -chardev socket,id=char0,path=/mnt/vhost-net0 \
> > > >     -netdev type=vhost-user,id=mynet1,chardev=char0,vhostforce \
> > > >     -device
> > > > virtio-net-pci,mac=52:54:00:00:00:01,netdev=mynet1,mrg_rxbuf=on,csum=o
> > > > n,guest_csum=on,guest_ecn=on \
> > > >
> > > > Then, QEMU displays the following error information:
> > > > qemu-system-riscv64: Failed initializing vhost-user memory map,
> > > > consider using -object memory-backend-file share=on  
> > >
> > > I see your command line parameters already contain "-object memory-backend-file
> > > share=on", so this error message is not accurate.  
> >
> > QEMU uses this command to alloc fd in the "memory_region_init_ram_from_file" function
> > and assigns the value of fd to mr->ram_block-fd. If the QEMU uses the default memory to
> > initialize the system, the QEMU cannot obtain the fd in the "vhost_user_mem_section_filter"
> > function when initializing the vhost-user. As a result, an error is reported in the "vhost_user_fill_set_mem_table_msg"
> > function.
> >
> > Because of the above bug, even if "-object memory-backend-file share=on" is added to the command line,
> > the QEMU still reports an error.  
> 
> Yes, what I meant is that QEMU should not report such inaccurate
> messages because of some random codes elsewhere.
> 
> With current message, it suggested user use "-object
> memory-backend-file share=on" in the command line, but it is already
> used. So this is a false alarm. The "bug" is somewhere else.

bug is in using memory_region_init_ram(),
which can't possibly handle vhost-user, and can't work as expected with
'-numa node,memdev' options.
Before main ram infrastructure was converted to memdev,
one should have used memory_region_allocate_system_memory() for
allocating main RAM, so numa usecase was broken from the start.
Later it old API was dropped in favor of more flexible/generic
MachineState::ram approach (see commits 68a86dc15ccd..f0530f14c7c35d).


Modulo commit message, patch looks good to me and does what
every machine should do. (I though that I've converted every
existing to generalized MachineState::ram but it looks like
riscv was missed).

So we can model commit message after bd457782b3b0a,
and also add that the patch fixes broken -numa node,memdev case,
which never properly worked. It also opens possibility to
use vhost-user/virtiosf with main RAM if main RAM is
provided explicitly via machine.memory-backend option
with shared memory backend.

Btw: is there other riscv machines that allocate RAM directly?
(if yes, those should be fixed as well, a patch per machine)


> > This patch can solve this bug.
> >  
> > > Should this message be altered to mention things like what this patch does?  
> >
> > Thanks, I will rewrite the message in next version.  
> > >  
> > > > qemu-system-riscv64: vhost_set_mem_table failed: Interrupted system
> > > > call (4)
> > > > qemu-system-riscv64: unable to start vhost net: 4: falling back on
> > > > userspace virtio
> > > >
> > > > Note that, before starting the kvm-acceled QEMU VM, following
> > > > temporarily unaccepted QEMU patches should be used:
> > > > https://lists.gnu.org/archive/html/qemu-devel/2021-08/msg02516.html
> > > >
> > > > This error was made bacause default main_mem is used to be registered  
> > >
> > > typo: because
> > >  
> > Thanks.
> >  
> > > > as the system memory, other memory cannot be initialized. Therefore,
> > > > the system memory should be initialized to the machine->ram, which
> > > > consists of the default main_mem and other possible memory required by
> > > > applications, such as shared hugepage memory in DPDK.
> > > > Also, the mc->defaul_ram_id should be set to the default main_mem,
> > > > such as "riscv_virt_board.ram" for the virt machine.
> > > >  
> > >
> > > How about changing the commit title to: "Use machine->ram as the system
> > > memory" ??
> > >  
> >
> > I think it is just a bugfix.
> >  
> 
> But the current codes run perfectly okay so far. This patch adds an
> additional use case for the KVM scenario where current codes cannot
> handle.
> 
> Regards,
> Bin
> 


