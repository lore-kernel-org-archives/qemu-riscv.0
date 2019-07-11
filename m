Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hlZYk-0000PY-6c
	for mharc-qemu-riscv@gnu.org; Thu, 11 Jul 2019 09:56:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51909)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hlZYh-0000O2-G3
 for qemu-riscv@nongnu.org; Thu, 11 Jul 2019 09:56:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hlZYg-0006kT-3V
 for qemu-riscv@nongnu.org; Thu, 11 Jul 2019 09:56:27 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:43298)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hlZYf-0006iS-PK
 for qemu-riscv@nongnu.org; Thu, 11 Jul 2019 09:56:25 -0400
Received: by mail-wr1-f65.google.com with SMTP id p13so6394216wru.10
 for <qemu-riscv@nongnu.org>; Thu, 11 Jul 2019 06:56:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9XcUkxuS1Ft/qbru0yxa1/rGH/W5tcz8bzDQ94VVXfo=;
 b=sB8snQiF81QDsHppUDN9HRY9gnH2GmQp5uhg37agoUZmUmeincR8rrZVL+E5CD+pWw
 iuMWeqaT45USiL4+dfuVN8cIrP0lKF0SeeH3ZvhyFyc/hXmkCT2IUID1CUS4KauupOvi
 tOM42hZZR3Nn6QMmFsn/gJ8oUrB0hzfX9i9zD79uy4T9esGvvZzozWymEVJsrZhImkTq
 Z04wCZnp9yfJDTDUyi+k69vdBP8s1A/S021MdsYmxAeGy0+02Mj7MqSgRyk+xdtUGdOx
 U1km4zvtWI27pWHlQWEs/UfbO4SMSKb5d8dJbtDgTLTqhIhSjVdAeIbt6+s6dWoO48cn
 akfw==
X-Gm-Message-State: APjAAAXxf54q9GS9mcLJrlJahOhlWBARnDCGJMPcl06Y62EIf0GHEhEN
 xZXzdAYCrZVuXmAZw1SyCEAkRQ==
X-Google-Smtp-Source: APXvYqxK7uNnNDkMGDfDdbLZly+thpKJp9zv21Cd/H7YFmHbwoQbPp6uWlCBsZc1wB/w8deYbSfKHQ==
X-Received: by 2002:a5d:4090:: with SMTP id o16mr5599870wrp.292.1562853384730; 
 Thu, 11 Jul 2019 06:56:24 -0700 (PDT)
Received: from [192.168.1.38] (62.red-83-42-61.dynamicip.rima-tde.net.
 [83.42.61.62])
 by smtp.gmail.com with ESMTPSA id x17sm4398480wrq.64.2019.07.11.06.56.23
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Jul 2019 06:56:23 -0700 (PDT)
To: Chih-Min Chao <chihmin.chao@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Eduardo Habkost <ehabkost@redhat.com>, Cornelia Huck <cohuck@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Cleber Rosa <crosa@redhat.com>, Caio Carrara <ccarrara@redhat.com>
References: <1562781026-27570-1-git-send-email-chihmin.chao@sifive.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <57c27698-c9ee-72f9-7074-0c0eee2ab275@redhat.com>
Date: Thu, 11 Jul 2019 15:56:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1562781026-27570-1-git-send-email-chihmin.chao@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.65
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH] tests/boot_linux_console: add
 a test for riscv64 + virt
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
X-List-Received-Date: Thu, 11 Jul 2019 13:56:29 -0000

Hi Chih-Min,

On 7/10/19 7:50 PM, Chih-Min Chao wrote:
> Similar to the mips + malta test, it boots a Linux kernel on a virt
> board and verify the serial is working.  Also, it relies on the serial
> device set by the machine itself.

Good idea!

> 
> If riscv64 is a target being built, "make check-acceptance" will
> automatically include this test by the use of the "arch:riscv64" tags.
> 
> Alternatively, this test can be run using:
> 
>   $ avocado run -t arch:riscv64 tests/acceptance
> 
> Signed-off-by: Chih-Min Chao <chihmin.chao@sifive.com>
> ---
>  tests/acceptance/boot_linux_console.py | 40 ++++++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
> index 3215950..bbc6b06 100644
> --- a/tests/acceptance/boot_linux_console.py
> +++ b/tests/acceptance/boot_linux_console.py
> @@ -354,3 +354,43 @@ class BootLinuxConsole(Test):
>          self.vm.launch()
>          console_pattern = 'Kernel command line: %s' % kernel_command_line
>          self.wait_for_console_pattern(console_pattern)
> +
> +    def test_riscv64_virt(self):
> +        """
> +        :avocado: tags=arch:riscv64
> +        :avocado: tags=machine:virt
> +        """
> +
> +        kernel_url = ('https://github.com/chihminchao/test-binary/raw/'
> +                      '0b7787305d9e40815c05a805266cc74ff356239e/qemu/riscv64/'
> +                      'bbl_w_kernel.gz')

I recommend you to extract fw_jump.elf from [1] and
vmlinux-4.19.0-5-riscv64 from [2] with the extract_from_deb() helper.

[1] https://packages.debian.org/sid/all/opensbi
[2] https://packages.debian.org/sid/linux-image-4.19.0-5-riscv64

> +        kernel_hash = 'c7f6cc7967975ad42dc61ee0535db01c9cbd0968'
> +        kernel_path_gz = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
> +        kernel_path = self.workdir + "bbl_w_kernel"
> +
> +        with gzip.open(kernel_path_gz, 'rb') as f_in:
> +            with open(kernel_path, 'wb') as f_out:
> +                shutil.copyfileobj(f_in, f_out)
> +
> +        initrd_url = ('https://github.com/groeck/linux-build-test/raw/'
> +                      '8584a59ed9e5eb5ee7ca91f6d74bbb06619205b8/rootfs/'
> +                      'riscv64/rootfs.cpio.gz')
> +        initrd_hash = 'f4867d263754961b6f626cdcdc0cb334c47e3b49'
> +        initrd_path = self.fetch_asset(initrd_url, asset_hash=initrd_hash)
> +
> +        self.vm.set_machine('virt')
> +        self.vm.set_console()
> +        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE
> +                               + 'console=ttyS0 noreboot')
> +        self.vm.add_args('-kernel', kernel_path,
> +                         '-initrd', initrd_path,
> +                         '-append', kernel_command_line)

You might want to use '-no-reboot' here too.

> +        self.vm.launch()
> +        self.wait_for_console_pattern('Boot successful.')
> +
> +        self.exec_command_and_wait_for_pattern('cat /proc/cpuinfo',
> +                                               'isa')
> +        self.exec_command_and_wait_for_pattern('uname -a',
> +                                               'sifive')
> +        self.exec_command_and_wait_for_pattern('reboot',
> +                                               'reboot: Restarting system')

Regards,

Phil.

