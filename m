Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gRmek-0001eK-Vr
	for mharc-qemu-riscv@gnu.org; Tue, 27 Nov 2018 18:20:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38941)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1gRlxi-0008Im-Sf
	for qemu-riscv@nongnu.org; Tue, 27 Nov 2018 17:36:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1gRlxg-00075a-ER
	for qemu-riscv@nongnu.org; Tue, 27 Nov 2018 17:36:10 -0500
Received: from mx2.suse.de ([195.135.220.15]:39814 helo=mx1.suse.de)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <agraf@suse.de>)
	id 1gRlxZ-00073W-Hs; Tue, 27 Nov 2018 17:36:01 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay1.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 97910AEC0;
	Tue, 27 Nov 2018 22:35:59 +0000 (UTC)
To: Alistair Francis <alistair23@gmail.com>
Cc: Palmer Dabbelt <palmer@sifive.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-riscv@nongnu.org
References: <CAKmqyKMdNs4etff7rc0vDy_tmZf5deP1Geu0GchkENu+em5=+w@mail.gmail.com>
	<mhng-b345219b-56ea-4aee-b25e-95c762c54b49@palmer-si-x1c4>
	<CAKmqyKPtn-C5rm3ggj5CvAAXh+Gq=u8YDh1S8Wmsb=tsLjcsXA@mail.gmail.com>
	<005a50f1-8270-ee52-d79e-321b03d841e4@suse.de>
	<CAKmqyKOaECi3vEpe8GbdG1y80TODUMMBzmQbo4RVY_jC5PhibA@mail.gmail.com>
	<CAKmqyKP7+GmD7zWDzfECEd7gQp9DQx0bmjpw4WQmMZjvw6R5Jg@mail.gmail.com>
From: Alexander Graf <agraf@suse.de>
Openpgp: preference=signencrypt
Autocrypt: addr=agraf@suse.de; prefer-encrypt=mutual; keydata=
	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
Message-ID: <49ed96fb-85f9-bb74-7814-be09afbd2156@suse.de>
Date: Tue, 27 Nov 2018 23:35:58 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <CAKmqyKP7+GmD7zWDzfECEd7gQp9DQx0bmjpw4WQmMZjvw6R5Jg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic] [fuzzy]
X-Received-From: 195.135.220.15
X-Mailman-Approved-At: Tue, 27 Nov 2018 18:20:38 -0500
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v1 1/1] riscv: virt: Cast the
 initrd start address to target bit length
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
X-List-Received-Date: Tue, 27 Nov 2018 22:36:12 -0000



On 27.11.18 23:28, Alistair Francis wrote:
> On Tue, Nov 27, 2018 at 2:24 PM Alistair Francis <alistair23@gmail.com> wrote:
>>
>> On Tue, Nov 27, 2018 at 2:12 PM Alexander Graf <agraf@suse.de> wrote:
>>>
>>>
>>>
>>> On 27.11.18 23:05, Alistair Francis wrote:
>>>> On Mon, Nov 26, 2018 at 11:02 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>>>>>
>>>>> On Wed, 21 Nov 2018 18:09:27 PST (-0800), alistair23@gmail.com wrote:
>>>>>> On Wed, Nov 21, 2018 at 5:58 PM Palmer Dabbelt <palmer@sifive.com> wrote:
>>>>>>>
>>>>>>> On Wed, 21 Nov 2018 14:34:44 PST (-0800), Alistair Francis wrote:
>>>>>>>> Ensure that the calculate initrd offset points to a valid address for
>>>>>>>> the architecture.
>>>>>>>>
>>>>>>>> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>>>>>>>> Suggested-by: Alexander Graf <agraf@suse.de>
>>>>>>>> Reported-by: Alexander Graf <agraf@suse.de>
>>>>>>>> ---
>>>>>>>>  hw/riscv/virt.c | 7 ++++++-
>>>>>>>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>>>>>>>
>>>>>>>> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
>>>>>>>> index 2b38f89070..4467195fac 100644
>>>>>>>> --- a/hw/riscv/virt.c
>>>>>>>> +++ b/hw/riscv/virt.c
>>>>>>>> @@ -85,7 +85,12 @@ static hwaddr load_initrd(const char *filename, uint64_t mem_size,
>>>>>>>>       * halfway into RAM, and for boards with 256MB of RAM or more we put
>>>>>>>>       * the initrd at 128MB.
>>>>>>>>       */
>>>>>>>> -    *start = kernel_entry + MIN(mem_size / 2, 128 * MiB);
>>>>>>>> +    /* As hwaddr is a 64-bit number we need to cast it for 32-bit */
>>>>>>>> +#if defined(TARGET_RISCV32)
>>>>>>>> +    *start = (uint32_t) (kernel_entry + MIN(mem_size / 2, 128ULL * MiB));
>>>>>>>> +#elif defined(TARGET_RISCV64)
>>>>>>>> +    *start = (uint64_t) (kernel_entry + MIN(mem_size / 2, 128 * MiB));
>>>>>>>> +#endif
>>>>>>>>
>>>>>>>>      size = load_ramdisk(filename, *start, mem_size - *start);
>>>>>>>>      if (size == -1) {
>>>>>>>> --
>>>>>>>> 2.19.1
>>>>>>>
>>>>>>> Maybe I'm missing something, but wouldn't something like
>>>>>>>
>>>>>>>     uint64_t start_unclobbered = kernel_entry + MIN(mem_size / 2, 128ULL * MiB);
>>>>>>>     assert(start_unclobbered == (hwaddr)start_unclobbered);
>>>>>>>     *start = (hwaddr)start_unclobbered;
>>>>>>>
>>>>>>> work better?  That should actually check this all lines up, as opposed to just
>>>>>>> silently truncating a bad address.
>>>>>>
>>>>>> The problem is that hwaddr is always 64-bit.
>>>>>>
>>>>>> Stupidly I forgot about target_ulong, which should work basically the
>>>>>> same as above. An assert() seems a little harsh though, Alex reported
>>>>>> problem was fixed with just a cast.
>>>>>
>>>>> OK, I must be misunderstanding the problem, then.  With the current code, isn't
>>>>> it possible to end up causing start to overflow a 32-bit address?  This would
>>>>> happen if kernel_entry is high, with IIUC is coming from the ELF to load and is
>>>>> therefor user input.  I think that's worth some sort of assertion, as it'll
>>>>> definitely blow up trying to enter the kernel (and possible before that,
>>>>> assuming there's no target memory where it overflows into).
>>>>
>>>> I don't have a setup to reproduce this unfortunately, but Alex
>>>> reported that he saw start being excessively high (0xffffffff88000000)
>>>> when loading an initrd.
>>>
>>> Sorry for only jumping in so late.
>>>
>>> I didn't actually propose the cast as a solution. The problem must be
>>> sign extension of some variable in the mix. I didn't find out quickly
>>> which one it was, so I figured I'd leave it for someone else to debug :).
>>>
>>> The issue is very easy to reproduce: Build U-Boot for the virt machine
>>> for riscv32. Then run it with
>>>
>>>   $ qemu-system-riscv32 -M virt -kernel u-boot -nographic -initrd <a file>
>>
>> Ah, cool I can reproduce it now.
>>
>> It happens in load_elf32() (which is actually glue(load_elf, SZ)).
>>
>> This line ends up sign extending the value:
>>     *pentry = (uint64_t)(elf_sword)ehdr.e_entry;
>>
>> and we just continue it from there.
>>
>> So I think this diff is a much better solution:
>>
>> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
>> index e7f0716fb6..348ecc39d5 100644
>> --- a/hw/riscv/virt.c
>> +++ b/hw/riscv/virt.c
>> @@ -62,7 +62,7 @@ static const struct MemmapEntry {
>>      [VIRT_PCIE_ECAM] =   { 0x30000000,    0x10000000 },
>>  };
>>
>> -static uint64_t load_kernel(const char *kernel_filename)
>> +static target_ulong load_kernel(const char *kernel_filename)
>>  {
>>      uint64_t kernel_entry, kernel_high;
>>
>>
>>
>> Alistair
>>
>>>
>>> You can find the initrd address with
>>>
>>>   U-Boot# fdt addr $fdtcontroladdr
>>>   U-Boot# fdt ls /chosen
>>>
>>> Then take a peek at that address:
>>>
>>>   U-Boot# md.b <addr>
>>>
>>> and you will see that there is nothing there without this patch. The
>>> reason is that the binary was loaded to a negative address. Again,
>>> probably some misguided sign extension.
>>>
>>>> It looks like the kernel entry address ends up being converted to
>>>> 0xffffffff80000000 incorrectly instead of being a real overflow.
>>>
>>> Yeah, so we seem to cast from int32_t to int64_t somewhere. Can you spot
>>> where exactly? That's where the bug is :).
> 
> Actually this diff looks like a better more generic fix:
> 
> diff --git a/include/hw/elf_ops.h b/include/hw/elf_ops.h
> index 81cecaf27e..7c1930e7a3 100644
> --- a/include/hw/elf_ops.h
> +++ b/include/hw/elf_ops.h
> @@ -342,8 +342,9 @@ static int glue(load_elf, SZ)(const char *name, int fd,
>              }
>      }
> 
> -    if (pentry)
> -       *pentry = (uint64_t)(elf_sword)ehdr.e_entry;
> +    if (pentry) {
> +        *pentry = (uint64_t)(elf_word)ehdr.e_entry;
> +    }
> 
>      glue(load_symbols, SZ)(&ehdr, fd, must_swab, clear_lsb, sym_cb);
> 
> My only concern is that it will break some other 32-bit guest. It
> seems odd that no one else has seen this before.

True. IIRC we were playing dirty tricks with sign extension with
OpenBIOS back in the day.

So maybe a riscv (board) specific solution would be better.


Alex

