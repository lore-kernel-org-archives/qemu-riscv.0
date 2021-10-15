Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbJSw-0003uX-45
	for mharc-qemu-riscv@gnu.org; Fri, 15 Oct 2021 05:25:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mbJSs-0003rY-0n; Fri, 15 Oct 2021 05:25:23 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:37831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mbJSq-0000R3-6o; Fri, 15 Oct 2021 05:25:21 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id w10so21248498ybt.4;
 Fri, 15 Oct 2021 02:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BWGAy2dDj+uU5+IFToudNOqgeNMMtr0zeovYO9dWX/I=;
 b=X2ZiChrjvVbeiZ8FvMB8/dEs2T9hWHi8on6OvO+KSBTKP5+sL0DaJu5t9pEhinUfTr
 pOPXkk3IDAmn6hgHkSUJ41gmh1hgtjgaqykG21PxYp+Nz2FNd7sSiWwhgEYdfD0oT+ZD
 CkS1ggSio/luCmMQa6Wg3jCd7rfo+7Etulv7KymcKIZ6gUO6+w6IPB2R0FJgzpXXQLQN
 +arJNqXkNMCSpUqDJ8Ji3v9mnBVif1vCR1BITA2kWhAKkjLuS2vNdOLIzv+KVzKse6D2
 u8YHCMGsD4AcIV3yXTKHekKSSBNRPl/fXFKeYA3Haw2ky4soUK1vGoWJWM6jGQnBA2yR
 BoUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BWGAy2dDj+uU5+IFToudNOqgeNMMtr0zeovYO9dWX/I=;
 b=02gcH82SsTSN9SRmWA8K8QCmVxbmm+X3CUs7XGpDt2euRFd3qCaY8wqHsAFHGlDKeN
 Cs2aTxJW+oS0RGh5WREsD6DEBWiStw/q0LUM9ixbkfSEWvqoMy4UJ/iD1gWUt7cdPaSS
 h1E5CtfdmbSVC4J0K0JvJaq/gELG/RzRXfveGZ33Ow8kKhWvfMe9r6B2R1nfCaKiRXdD
 JFutuPZ84IvnrumFgCxp0P1Z0+zyad4gR+ykcyP3TIF2I+gzKmMP7/BM3KQPecQS37T9
 uckGklXNmnv+zGGocIoJATd4pSWU2eFarXJTm4llMGbeGDWfeFifPxDCcMxSR/+i5rHM
 lxtw==
X-Gm-Message-State: AOAM531heB3cxWEv6KWnlxA+1PnvnjJ2ob5HP7qeG1IlgEy9ZM8o2t1e
 MxFqXAhawGl43+EkPUkSmUU1Vz6lFaPrqsKpIBc=
X-Google-Smtp-Source: ABdhPJy2OhAIlQdlqb8RUd8ywbiDBtil93NGCrJ789MbUm3QsCmHBt0V3pWNkldmQA1oteOLZVraIZllLQX+8Q5peN4=
X-Received: by 2002:a25:e048:: with SMTP id x69mr12562188ybg.293.1634289916946; 
 Fri, 15 Oct 2021 02:25:16 -0700 (PDT)
MIME-Version: 1.0
References: <20211012014501.24996-1-limingwang@huawei.com>
 <CAEUhbmX=A4LPgzNgNPcxzzg=veU0=3vXyZQrwikxMFvb_Rcxzw@mail.gmail.com>
 <c4c6cc03d1c6459ea036c08ae30806a5@huawei.com>
In-Reply-To: <c4c6cc03d1c6459ea036c08ae30806a5@huawei.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 15 Oct 2021 17:25:01 +0800
Message-ID: <CAEUhbmVD1jyvGJrQLSZLJYfaz6E-m0b9SZA+DQA2YYK70oL7Lg@mail.gmail.com>
Subject: Re: [PATCH v2] hw/riscv: virt: bugfix the memory-backend-file command
 is invalid
To: "limingwang (A)" <limingwang@huawei.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 "Wubin (H)" <wu.wubin@huawei.com>,
 "Wanghaibin (D)" <wanghaibin.wang@huawei.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, "Fanliang (EulerOS)" <fanliang@huawei.com>,
 Jiangyifei <jiangyifei@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2c.google.com
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
X-List-Received-Date: Fri, 15 Oct 2021 09:25:23 -0000

On Fri, Oct 15, 2021 at 4:52 PM limingwang (A) <limingwang@huawei.com> wrote:
>
>
> On Wed, Oct 13, 2021 at 22:41 PM Bin Meng <bin.meng@windriver.com> wrote:
> >
> > On Tue, Oct 12, 2021 at 9:46 AM MingWang Li <limingwang@huawei.com> wrote:
> > >
> > > From: Mingwang Li <limingwang@huawei.com>
> > >
> > > When I start the VM with the following command:
> > > $ ./qemu-system-riscv64 -M virt,accel=kvm -m 4096M -cpu host -nographic \
> > >     -name guest=riscv-guset \
> > >     -smp 2 \
> > >     -bios none \
> > >     -kernel ./Image \
> > >     -drive file=./guest.img,format=raw,id=hd0 \
> > >     -device virtio-blk-device,drive=hd0 \
> > >     -append "root=/dev/vda rw console=ttyS0 earlycon=sbi" \
> > >     -object
> > memory-backend-file,id=mem,size=4096M,mem-path=/dev/hugepages,share=on \
> > >     -numa node,memdev=mem -mem-prealloc \
> > >     -chardev socket,id=char0,path=/mnt/vhost-net0 \
> > >     -netdev type=vhost-user,id=mynet1,chardev=char0,vhostforce \
> > >     -device
> > > virtio-net-pci,mac=52:54:00:00:00:01,netdev=mynet1,mrg_rxbuf=on,csum=o
> > > n,guest_csum=on,guest_ecn=on \
> > >
> > > Then, QEMU displays the following error information:
> > > qemu-system-riscv64: Failed initializing vhost-user memory map,
> > > consider using -object memory-backend-file share=on
> >
> > I see your command line parameters already contain "-object memory-backend-file
> > share=on", so this error message is not accurate.
>
> QEMU uses this command to alloc fd in the "memory_region_init_ram_from_file" function
> and assigns the value of fd to mr->ram_block-fd. If the QEMU uses the default memory to
> initialize the system, the QEMU cannot obtain the fd in the "vhost_user_mem_section_filter"
> function when initializing the vhost-user. As a result, an error is reported in the "vhost_user_fill_set_mem_table_msg"
> function.
>
> Because of the above bug, even if "-object memory-backend-file share=on" is added to the command line,
> the QEMU still reports an error.

Yes, what I meant is that QEMU should not report such inaccurate
messages because of some random codes elsewhere.

With current message, it suggested user use "-object
memory-backend-file share=on" in the command line, but it is already
used. So this is a false alarm. The "bug" is somewhere else.

> This patch can solve this bug.
>
> > Should this message be altered to mention things like what this patch does?
>
> Thanks, I will rewrite the message in next version.
> >
> > > qemu-system-riscv64: vhost_set_mem_table failed: Interrupted system
> > > call (4)
> > > qemu-system-riscv64: unable to start vhost net: 4: falling back on
> > > userspace virtio
> > >
> > > Note that, before starting the kvm-acceled QEMU VM, following
> > > temporarily unaccepted QEMU patches should be used:
> > > https://lists.gnu.org/archive/html/qemu-devel/2021-08/msg02516.html
> > >
> > > This error was made bacause default main_mem is used to be registered
> >
> > typo: because
> >
> Thanks.
>
> > > as the system memory, other memory cannot be initialized. Therefore,
> > > the system memory should be initialized to the machine->ram, which
> > > consists of the default main_mem and other possible memory required by
> > > applications, such as shared hugepage memory in DPDK.
> > > Also, the mc->defaul_ram_id should be set to the default main_mem,
> > > such as "riscv_virt_board.ram" for the virt machine.
> > >
> >
> > How about changing the commit title to: "Use machine->ram as the system
> > memory" ??
> >
>
> I think it is just a bugfix.
>

But the current codes run perfectly okay so far. This patch adds an
additional use case for the KVM scenario where current codes cannot
handle.

Regards,
Bin

