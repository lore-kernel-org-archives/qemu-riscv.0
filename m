Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gpiBA-0008Al-GV
	for mharc-qemu-riscv@gnu.org; Fri, 01 Feb 2019 18:25:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50738)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gpiB5-0007yk-UH
	for qemu-riscv@nongnu.org; Fri, 01 Feb 2019 18:24:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gpi2S-0007w5-Up
	for qemu-riscv@nongnu.org; Fri, 01 Feb 2019 18:16:01 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:38120)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gpi2R-0007oB-9k
	for qemu-riscv@nongnu.org; Fri, 01 Feb 2019 18:16:00 -0500
Received: by mail-wm1-f65.google.com with SMTP id m22so7812357wml.3
	for <qemu-riscv@nongnu.org>; Fri, 01 Feb 2019 15:15:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:cc:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=CG6VQYrPZT5v+S32WjvNAnQN24lTKjqv6pyttjU75ik=;
	b=qFtXXXFon/2thrvWeLLpN+F5igAUAxu1TnDd/gmWbOpv2Wl2s5nwnTFfM1TYGt8MAK
	MjJcponNeJlef2mClWj/mkB80GjFbvfqMlxhwWscli9LbCv9881iz3fw8y4wJgk9Ra2U
	3jmTtnHLecVPrYTZ+o6lDWNNBxnwNIrUeY2AiMDmKZAWKCJNI9p3/n9/2bVSM9WLmQfD
	slhSa6AvOggB7VI2400ROGBMT/HGzoD0GtVq7KvYVdkukMbQEAqwkkKvEGBZHSJno8Eq
	u5PDvZd5ZSszoa6MT3NJnfjNBD/JA2CoFZbw5YTNjvC7E8dUB9+NSw8eD3KkUV8WMXXB
	fVtw==
X-Gm-Message-State: AHQUAuZeUbLD8eNTbta1V6AgUANEY4akJj/zgEzs5YbR0YLsy3zKi0EK
	IZp1LEZa+j45mBhoskjEiuycnePnbV8=
X-Google-Smtp-Source: AHgI3IYJKfXEdqBtI8Ok2KmARy+RyCKoXBM1ZyWKJgXSEzWEK3KpN9kTn8D7jMtKA6/GjgEPEnFznA==
X-Received: by 2002:a7b:c852:: with SMTP id c18mr4044170wml.49.1549062956147; 
	Fri, 01 Feb 2019 15:15:56 -0800 (PST)
Received: from [192.168.1.33] (110.red-83-51-161.dynamicip.rima-tde.net.
	[83.51.161.110])
	by smtp.gmail.com with ESMTPSA id 67sm5484115wra.37.2019.02.01.15.15.55
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Feb 2019 15:15:55 -0800 (PST)
To: Bug 1814343 <1814343@bugs.launchpad.net>, qemu-devel@nongnu.org,
	Alistair Francis <Alistair.Francis@wdc.com>
References: <154905879413.25667.2843143192142684785.malonedeb@chaenomeles.canonical.com>
Cc: Alistair Francis <alistair@alistair23.me>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <a667006b-44e2-f72d-8164-c52a9374cb84@redhat.com>
Date: Sat, 2 Feb 2019 00:15:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <154905879413.25667.2843143192142684785.malonedeb@chaenomeles.canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.65
Subject: Re: [Qemu-riscv] [Qemu-devel] [Bug 1814343] [NEW] Initrd not loaded
 on riscv32
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Feb 2019 23:24:57 -0000

Hi Jonathan,

On 2/1/19 11:06 PM, Jonathan Behrens wrote:
> Public bug reported:
> 
> I attempted to run qemu with a ram disk. However, when reading the
> contents of the disk from within the VM I only get back zeros.
> 
> I was able to trace the issue to a mismatch of expectations on line 93
> of hw/riscv/virt.c. Specifically, when running in 32-bit mode the value
> of kernel_entry is sign extended to 64-bits, but load_image_targphys
> expects the start address to not be sign extended.
> 
> Straw man patch (works for 32-bit but would probably break 64-bit VMs?):
> 
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index e7f0716fb6..32216f993c 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -90,7 +90,7 @@ static hwaddr load_initrd(const char *filename, uint64_t mem_size,
>       * halfway into RAM, and for boards with 256MB of RAM or more we put
>       * the initrd at 128MB.
>       */
> -    *start = kernel_entry + MIN(mem_size / 2, 128 * MiB);
> +    *start = (kernel_entry & 0xffffffff) + MIN(mem_size / 2, 128 * MiB);
>  
>      size = load_ramdisk(filename, *start, mem_size - *start);
>      if (size == -1) {
> 
> 
> Run command:
> 
> $ qemu/build/riscv32-softmmu/qemu-system-riscv32 -machine virt -kernel
> mykernel.elf -nographic -initrd payload
> 
> Commit hash:
> 
> 3a183e330dbd7dbcac3841737ac874979552cca2
> 
> ** Affects: qemu
>      Importance: Undecided
>          Status: New

I believe this is fixed by the following patch:
"Ensure the kernel start address is correctly cast"
https://lists.gnu.org/archive/html/qemu-devel/2019-01/msg06358.html

Can you test it?
If if works you can reply to it with a
"Tested-by: Jonathan Behrens <your-email>"
to increases the odds it get merged ;)

Thanks,

Phil.

