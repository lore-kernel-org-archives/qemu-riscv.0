Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hn0cX-0001Yx-DW
	for mharc-qemu-riscv@gnu.org; Mon, 15 Jul 2019 09:02:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43223)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hn0cU-0001Xa-9F
 for qemu-riscv@nongnu.org; Mon, 15 Jul 2019 09:02:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hn0cS-0000Zx-I3
 for qemu-riscv@nongnu.org; Mon, 15 Jul 2019 09:02:18 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:35229)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hn0cS-0000ZC-A4
 for qemu-riscv@nongnu.org; Mon, 15 Jul 2019 09:02:16 -0400
Received: by mail-wm1-f66.google.com with SMTP id l2so15126052wmg.0
 for <qemu-riscv@nongnu.org>; Mon, 15 Jul 2019 06:02:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aQUbreS5cB116LZMVz4xekSUdCzoSQwePI1aHMQzfjU=;
 b=F2Hs1nbL3RRXrwzd1+SAzX3ti2oXsqf5ZyYgSh57Rrxx/zcPg73LHdeztEwZWiILCo
 497aDESxIuR3d3jnPZf+uQW7N38EWBvqWrZ165XuIBXfAef9RDqgPQs6vPW9XmMr5ZlL
 eclLrlpw3qcZO4F4Ezokcb6z+sK99QWSN9JaWqtxu+YSn49H7thou9kI6D35E9+oBaR0
 lOwxo3LY8lYw6Gd2rxw+3E6kid9OPr4nDejo4Jwe37RJV6YMeBxikfp7MjRKV4XV1K0g
 ohaQfW25FMHi2DGNVE3y9oxQPO3oIyGcBej9heQHn1esjNYAFI+Ofo4cK8c6bBOJntN9
 n89A==
X-Gm-Message-State: APjAAAVAceWFzgJOWRx7L8SKGCDu8W6YxpmYr+6bpeWi1ZxfDPpFYvvW
 ZVSB9Rm/cLcDccDqL3DNIC98zw==
X-Google-Smtp-Source: APXvYqw0ISSSk4CIAaKQqe56wCjfPeHNvE/wdni2fpUgiIx/omJ2soEU743jkCdJtrJYfAm1TMwTwg==
X-Received: by 2002:a1c:d10c:: with SMTP id i12mr24649752wmg.152.1563195735193; 
 Mon, 15 Jul 2019 06:02:15 -0700 (PDT)
Received: from [192.168.1.37] (62.red-83-42-61.dynamicip.rima-tde.net.
 [83.42.61.62])
 by smtp.gmail.com with ESMTPSA id j33sm38923227wre.42.2019.07.15.06.02.13
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Jul 2019 06:02:14 -0700 (PDT)
To: Chih-Min Chao <chihmin.chao@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Fam Zheng <fam@euphon.net>, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Alistair Francis <alistair@alistair23.me>
References: <1563181721-5055-1-git-send-email-chihmin.chao@sifive.com>
 <93b35a5e-c40a-535b-2a91-2c210b4a5928@redhat.com>
 <CAEiOBXXxS-93rTAQuvY_Tkxi1pYc1YfJenpBC_8gG2ou9uUZMg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <7eb239bc-32aa-b5fc-ab2e-a741b005aad7@redhat.com>
Date: Mon, 15 Jul 2019 15:02:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAEiOBXXxS-93rTAQuvY_Tkxi1pYc1YfJenpBC_8gG2ou9uUZMg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.66
Subject: Re: [Qemu-riscv] [PATCH v2] tests/boot_linux_console: add a test
 for riscv64 + virt
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
X-List-Received-Date: Mon, 15 Jul 2019 13:02:20 -0000

On 7/15/19 1:09 PM, Chih-Min Chao wrote:
> On Mon, Jul 15, 2019 at 5:15 PM Philippe Mathieu-Daudé
> <philmd@redhat.com <mailto:philmd@redhat.com>> wrote:
> 
>     On 7/15/19 11:08 AM, Chih-Min Chao wrote:
>     > Similar to the mips + malta test, it boots a Linux kernel on a virt
>     > board and verify the serial is working.  Also, it relies on the serial
>     > device set by the machine itself.
>     >
>     > If riscv64 is a target being built, "make check-acceptance" will
>     > automatically include this test by the use of the "arch:riscv64" tags.
>     >
>     > Alternatively, this test can be run using:
>     >
>     >   $ avocado run -t arch:riscv64 tests/acceptance
>     >
>     > packages
>     >   debian official
>     >     binutils-riscv64-linux-gnu_2.32-8
>     >     opensbi_0.4-1_all
>     >     linux-image-4.19.0-5-riscv64 4.19.37-4
>     >   third-party
>     >   
>      https://github.com/groeck/linux-build-test/rootfs/riscv64/rootfs.cpio.gz
>     >     (the repo is also used in mips target acceptance)
>     >
>     > Signed-off-by: Chih-Min Chao <chihmin.chao@sifive.com
>     <mailto:chihmin.chao@sifive.com>>
>     > ---
>     >  .travis.yml                            |  2 +-
>     >  tests/acceptance/boot_linux_console.py | 66
>     ++++++++++++++++++++++++++++++++++
>     >  2 files changed, 67 insertions(+), 1 deletion(-)
>     >
>     > diff --git a/.travis.yml b/.travis.yml
>     > index 5d3d6ee..21fcead 100644
>     > --- a/.travis.yml
>     > +++ b/.travis.yml
>     > @@ -232,7 +232,7 @@ matrix:
>     > 
>     >      # Acceptance (Functional) tests
>     >      - env:
>     > -        - CONFIG="--python=/usr/bin/python3
>     --target-list=x86_64-softmmu,mips-softmmu,mips64el-softmmu,aarch64-softmmu,arm-softmmu,s390x-softmmu,alpha-softmmu"
>     > +        - CONFIG="--python=/usr/bin/python3
>     --target-list=x86_64-softmmu,mips-softmmu,mips64el-softmmu,aarch64-softmmu,arm-softmmu,s390x-softmmu,alpha-softmmu,riscv64-softmmu"
>     >          - TEST_CMD="make check-acceptance"
>     >        after_failure:
>     >          - cat tests/results/latest/job.log
>     > diff --git a/tests/acceptance/boot_linux_console.py
>     b/tests/acceptance/boot_linux_console.py
>     > index 3215950..0f638bc 100644
>     > --- a/tests/acceptance/boot_linux_console.py
>     > +++ b/tests/acceptance/boot_linux_console.py
>     > @@ -354,3 +354,69 @@ class BootLinuxConsole(Test):
>     >          self.vm.launch()
>     >          console_pattern = 'Kernel command line: %s' %
>     kernel_command_line
>     >          self.wait_for_console_pattern(console_pattern)
>     > +
>     > +    def test_riscv64_virt(self):
>     > +        """
>     > +        :avocado: tags=arch:riscv64
>     > +        :avocado: tags=machine:virt
>     > +        """
>     > +        deb_url = ('https://snapshot.debian.org/archive/debian/'
>     > +                         '20190424T171759Z/pool/main/b/binutils/'
>     > +                       
>      'binutils-riscv64-linux-gnu_2.32-8_amd64.deb')
>     > +        deb_hash = ('7fe376fd4452696c03acd508d6d613ca553ea15e')
>     > +        deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
>     > +        objcopy_path = '/usr/bin/riscv64-linux-gnu-objcopy'
>     > +        objcopy_path = self.extract_from_deb(deb_path, objcopy_path)
>     > +        libbfd_path =
>     '/usr/lib/x86_64-linux-gnu/libbfd-2.32-riscv64.so
>     <http://libbfd-2.32-riscv64.so>'
>     > +        libbfd_path = self.extract_from_deb(deb_path, libbfd_path)
>     > +        process.run('ls -al %s' % (objcopy_path))
>     > +
>     > +        deb_url = ('https://snapshot.debian.org/archive/debian/'
>     > +                   '20190708T032337Z/pool/main/o/opensbi/'
>     > +                   'opensbi_0.4-1_all.deb')
>     > +        deb_hash = ('2319dcd702958291d323acf5649fd98a11d90112')
>     > +        deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
>     > +        opensbi_path = ('/usr/lib/riscv64-linux-gnu/opensbi/'
>     > +                        'qemu/virt/fw_jump.elf')
>     > +        opensbi_path = self.extract_from_deb(deb_path, opensbi_path)
>     > +
>     > +        deb_url =
>     ('https://snapshot.debian.org/archive/debian-ports/'
>     > +                   '20190620T095935Z/pool-riscv64/main/l/linux/'
>     > +                 
>      'linux-image-4.19.0-5-riscv64_4.19.37-4_riscv64.deb')
>     > +        deb_hash = ('bf5b5680c41d92134d22caef4fbd277c5217e1f0')
>     > +        deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
>     > +        kernel_path = '/boot/vmlinux-4.19.0-5-riscv64'
>     > +        kernel_path = self.extract_from_deb(deb_path, kernel_path)
>     > +        kimage_path = self.workdir + "/Image"
>     > +        env = os.environ
>     > +        env['LD_LIBRARY_PATH'] = ('%s:' %
>     (os.path.dirname(libbfd_path)) +
>     > +                                 env.get('LD_LIBRARY_PATH', ''))
>     > +        process.run(('%s -O binary -O binary -R'
>     > +                     '.note -R .note.gnu.build-id -R .comment -S
>     %s %s') %
>     > +                     (objcopy_path, kernel_path, kimage_path))
> 
>     Please explain why you need to do that...
> 
>     Also note these tests are run on other host architecture than x86, at
>     least ppc64/s390x (so this won't work there).
> 
> it is because riscv64 vmlinux doesn't have physical loading address
> information and 
> depends on certain stage bootloader to move kernel raw data to specific
> physical address (0x8020_0000)
> 
> The vmlinux program headers are 
>   Type             Offset       VirtAddr                  PhysAddr      
>     FileSiz  MemSiz   Flg Align
>   LOAD           0x001000 0xffffffe000000000 0x0000000000000000 0x0303a6
> 0x0303a6 R E 0x1000
>   LOAD           0x032000 0xffffffe000031000 0x0000000000031000 0x828f0c
> 0x828f0c RWE 0x1000
>   NOTE           0x85aec0 0xffffffe000859ec0 0x0000000000859ec0 0x00004c
> 0x00004c R   0x4
> 
> For legacy bootloader, bbl, It can handle payload in ELF format. 
> However, for the newer OpenSBI, it can only handle raw data and
> debian doesn't provide linux image in raw data format.

I think you should be able to use -device loader,file=... here, then no
need to use objcopy.

Cc'ing Alistair who is an expert on this.

>     > +
>     > +        initrd_url =
>     ('https://github.com/groeck/linux-build-test/raw/'
>     > +                     
>     '8584a59ed9e5eb5ee7ca91f6d74bbb06619205b8/rootfs/'
>     > +                      'riscv64/rootfs.cpio.gz')
>     > +        initrd_hash = 'f4867d263754961b6f626cdcdc0cb334c47e3b49'
>     > +        initrd_path = self.fetch_asset(initrd_url,
>     asset_hash=initrd_hash)
>     > +
>     > +        self.vm.set_machine('virt')
>     > +        self.vm.set_console()
>     > +        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE
>     > +                               + 'console=ttyS0 noreboot')
>     > +        self.vm.add_args('-bios', opensbi_path,
>     > +                         '-kernel', kimage_path,
>     > +                         '-initrd', initrd_path,
>     > +                         '-append', kernel_command_line,
>     > +                         '-no-reboot')
>     > +
>     > +        self.vm.launch()
>     > +        self.wait_for_console_pattern('Boot successful.')
>     > +
>     > +        self.exec_command_and_wait_for_pattern('cat /proc/cpuinfo',
>     > +                                               'isa')
>     > +        self.exec_command_and_wait_for_pattern('uname -a',
>     > +                                               'SMP Debian')
>     > +        self.exec_command_and_wait_for_pattern('reboot',
>     > +                                               'reboot:
>     Restarting system')
>     >
> 

