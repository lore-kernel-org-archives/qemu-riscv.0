Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcIDx-00074B-Pv
	for mharc-qemu-riscv@gnu.org; Sun, 17 Oct 2021 22:18:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mcIDw-00073X-1O; Sun, 17 Oct 2021 22:18:00 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:37512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mcIDu-0000Cy-EZ; Sun, 17 Oct 2021 22:17:59 -0400
Received: by mail-yb1-xb29.google.com with SMTP id l80so1781470ybf.4;
 Sun, 17 Oct 2021 19:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jyCGJUEQaLVIefhqFNExPOSmol5P8lXHJ3BUr+mKsFI=;
 b=C+1iYCirSQfPNbW9cD3NAn09MhZzuLxEoXNU9Q9A5LocAWhQAmiB3kTiLnbTBDctY5
 2kHKE1afBpN/gi/g70C7BKwhSsgf688vjmR0liVFZvFwvMr11We4LUCLZzfKmjnaTPtF
 xeCQgnssvdZCSqyvNT3SULzM1J0LpPC4Ezr/R6W6r3Q6EmOFIS76UCZLec+HqHQ3CbYM
 hfpAW0Wx7z+hBRehlOcO6Khut5+TMRKfBDK2cUo8vEO1rFlLkDE3xwFFZP16MXM8yZhz
 3LHNIEMRVsP2RU0bd1WHNdbK/Ic1Wd3lB25NFNiwsQpDQkyVZHli2E4/l8UvlkedYUzi
 FMcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jyCGJUEQaLVIefhqFNExPOSmol5P8lXHJ3BUr+mKsFI=;
 b=XTwr/gWVf3n/ncpqvWbA/xOl0nIAO87hy/p/9WDzu+05lSJgNGE4uOqgbemglefuqz
 A1iHyghnRHVCNdUcwVhdTY2UK1CGh6LFLlPgbhY7j49ZX4TRZLtbcaoF0zvYTShoxtN6
 MPgC5gB97193KoknBDJnC7D4w/smqdfS1Y3bTQakGapRN9QrM/1/tDCNHbLKPj8UWKOA
 sWctpkh/GweETterhjli4nGlyRPoRG99uhK/oK3X4hTedk6p1HM+mO/cdL4uf+R3EmmL
 lasPelib+T6CqoOOQzZLKInOzcX/wZWh6Qs/jPzhGyeK0SCMQ68XKytisTJ1uneT1Yux
 2sjw==
X-Gm-Message-State: AOAM532cJHP3djH3SZx1/nNO6QCWVgF0PHMzBWtDfrW/zAgytWg9tV91
 qJoQF3PnID2AeHSiZEwCT25HGZkSR3UZ2Ql6s4k=
X-Google-Smtp-Source: ABdhPJyo5M0BYIU46y1DETLGD/DpJQb5aULIvMdzxj9TDY165+oy0BVE/NU9si40qtvhEnnp/3uLNziSKImMb6kHHco=
X-Received: by 2002:a25:c0d2:: with SMTP id c201mr8993984ybf.467.1634523476534; 
 Sun, 17 Oct 2021 19:17:56 -0700 (PDT)
MIME-Version: 1.0
References: <20211012014501.24996-1-limingwang@huawei.com>
 <CAEUhbmX=A4LPgzNgNPcxzzg=veU0=3vXyZQrwikxMFvb_Rcxzw@mail.gmail.com>
 <c4c6cc03d1c6459ea036c08ae30806a5@huawei.com>
 <CAEUhbmVD1jyvGJrQLSZLJYfaz6E-m0b9SZA+DQA2YYK70oL7Lg@mail.gmail.com>
 <20211015145922.5a82e31a@redhat.com>
In-Reply-To: <20211015145922.5a82e31a@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 18 Oct 2021 10:17:45 +0800
Message-ID: <CAEUhbmVTs109MLog+wjnayJY++SvEPhuCKcG3xXotqySkpGAaA@mail.gmail.com>
Subject: Re: [PATCH v2] hw/riscv: virt: bugfix the memory-backend-file command
 is invalid
To: Igor Mammedov <imammedo@redhat.com>
Cc: "limingwang (A)" <limingwang@huawei.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Jiangyifei <jiangyifei@huawei.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 "Wanghaibin (D)" <wanghaibin.wang@huawei.com>, 
 "Fanliang (EulerOS)" <fanliang@huawei.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 "Wubin (H)" <wu.wubin@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb29.google.com
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
X-List-Received-Date: Mon, 18 Oct 2021 02:18:00 -0000

Hi Igor,

On Fri, Oct 15, 2021 at 8:59 PM Igor Mammedov <imammedo@redhat.com> wrote:
>
> On Fri, 15 Oct 2021 17:25:01 +0800
> Bin Meng <bmeng.cn@gmail.com> wrote:
>
> > On Fri, Oct 15, 2021 at 4:52 PM limingwang (A) <limingwang@huawei.com> wrote:
> > >
> > >
> > > On Wed, Oct 13, 2021 at 22:41 PM Bin Meng <bin.meng@windriver.com> wrote:
> > > >
> > > > On Tue, Oct 12, 2021 at 9:46 AM MingWang Li <limingwang@huawei.com> wrote:
> > > > >
> > > > > From: Mingwang Li <limingwang@huawei.com>
> > > > >
> > > > > When I start the VM with the following command:
> > > > > $ ./qemu-system-riscv64 -M virt,accel=kvm -m 4096M -cpu host -nographic \
> > > > >     -name guest=riscv-guset \
> > > > >     -smp 2 \
> > > > >     -bios none \
> > > > >     -kernel ./Image \
> > > > >     -drive file=./guest.img,format=raw,id=hd0 \
> > > > >     -device virtio-blk-device,drive=hd0 \
> > > > >     -append "root=/dev/vda rw console=ttyS0 earlycon=sbi" \
> > > > >     -object
> > > > memory-backend-file,id=mem,size=4096M,mem-path=/dev/hugepages,share=on \
> > > > >     -numa node,memdev=mem -mem-prealloc \
> > > > >     -chardev socket,id=char0,path=/mnt/vhost-net0 \
> > > > >     -netdev type=vhost-user,id=mynet1,chardev=char0,vhostforce \
> > > > >     -device
> > > > > virtio-net-pci,mac=52:54:00:00:00:01,netdev=mynet1,mrg_rxbuf=on,csum=o
> > > > > n,guest_csum=on,guest_ecn=on \
> > > > >
> > > > > Then, QEMU displays the following error information:
> > > > > qemu-system-riscv64: Failed initializing vhost-user memory map,
> > > > > consider using -object memory-backend-file share=on
> > > >
> > > > I see your command line parameters already contain "-object memory-backend-file
> > > > share=on", so this error message is not accurate.
> > >
> > > QEMU uses this command to alloc fd in the "memory_region_init_ram_from_file" function
> > > and assigns the value of fd to mr->ram_block-fd. If the QEMU uses the default memory to
> > > initialize the system, the QEMU cannot obtain the fd in the "vhost_user_mem_section_filter"
> > > function when initializing the vhost-user. As a result, an error is reported in the "vhost_user_fill_set_mem_table_msg"
> > > function.
> > >
> > > Because of the above bug, even if "-object memory-backend-file share=on" is added to the command line,
> > > the QEMU still reports an error.
> >
> > Yes, what I meant is that QEMU should not report such inaccurate
> > messages because of some random codes elsewhere.
> >
> > With current message, it suggested user use "-object
> > memory-backend-file share=on" in the command line, but it is already
> > used. So this is a false alarm. The "bug" is somewhere else.
>
> bug is in using memory_region_init_ram(),
> which can't possibly handle vhost-user, and can't work as expected with
> '-numa node,memdev' options.
> Before main ram infrastructure was converted to memdev,
> one should have used memory_region_allocate_system_memory() for
> allocating main RAM, so numa usecase was broken from the start.
> Later it old API was dropped in favor of more flexible/generic
> MachineState::ram approach (see commits 68a86dc15ccd..f0530f14c7c35d).

Thanks for the detailed pointers.

I wonder if it is possible to make the error message to be clearer, so
instead of having

    "qemu-system-riscv64: Failed initializing vhost-user memory map,
consider using -object memory-backend-file share=on"

can we do:

    "qemu-system-riscv64: Failed initializing vhost-user memory map,
considering using MachineState::ram instead of manually initializing
RAM memory region."

which is more straightforward?

>
>
> Modulo commit message, patch looks good to me and does what
> every machine should do. (I though that I've converted every
> existing to generalized MachineState::ram but it looks like
> riscv was missed).

Indeed all riscv boards are doing the same thing.

>
> So we can model commit message after bd457782b3b0a,
> and also add that the patch fixes broken -numa node,memdev case,
> which never properly worked. It also opens possibility to
> use vhost-user/virtiosf with main RAM if main RAM is
> provided explicitly via machine.memory-backend option
> with shared memory backend.
>
> Btw: is there other riscv machines that allocate RAM directly?
> (if yes, those should be fixed as well, a patch per machine)
>

I will see if I can get some patches to fix other riscv machines.

Regards,
Bin

