Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i5a6p-0001IR-2Z
	for mharc-qemu-riscv@gnu.org; Wed, 04 Sep 2019 14:34:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60105)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1i5a6m-0001Fl-4N
 for qemu-riscv@nongnu.org; Wed, 04 Sep 2019 14:34:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1i5a6k-0006Er-LU
 for qemu-riscv@nongnu.org; Wed, 04 Sep 2019 14:34:19 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:43337)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1i5a6k-0006EF-FQ
 for qemu-riscv@nongnu.org; Wed, 04 Sep 2019 14:34:18 -0400
Received: by mail-pf1-f195.google.com with SMTP id d15so4271970pfo.10
 for <qemu-riscv@nongnu.org>; Wed, 04 Sep 2019 11:34:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=H3EMGVk+VziFSQFJg30Na4b8TOSh34z5w7VWeuyW3mI=;
 b=AJ5UuFJsPmMWydxyyZvnvJ/0BmqRmicCil5lEFsK/1AAnGVvKyjTh1kw82/jzpFl7g
 M1j++XUmMzPX6T/TkW+GWtSBkmgx145xFDXL5jNArsMwi1k2YBQ9ZfytBGyXxyATyJTG
 hp26Diez1bm/nYM5M7/GqcjiERgrYr77GqdqYLLc5ccQEWh1nkTSm+2J0lY7nMlpfZR9
 F5SCV8pAgHYTPfRCMi21tpjTV44IdgsHBODHyPYJ+x8kjiRJqE3Aq1UYcZ6P7cfcnpAy
 vjwtc9S4BTkDpW7OcUTwpuCEPYO6Rlj50hOQ8anUt9ddGCSi1lJbvPPr9ZYJgIbE3bqg
 S8QA==
X-Gm-Message-State: APjAAAVW6Rq2gjNuFpd8aEJ2R1sb7Nk7GaL3fC98fiJ0bD7tsDcS3Hge
 1xfSOhDTdCN0FAkTnZwzxZMyfA==
X-Google-Smtp-Source: APXvYqxvJEjtoZZb2+O8G/q70O/eCzuPCkKX8ZZd94TcyC4N7FeGkCXtqD+1pmM/pEtq+OnQlfw21Q==
X-Received: by 2002:a65:6547:: with SMTP id a7mr35723636pgw.65.1567622055917; 
 Wed, 04 Sep 2019 11:34:15 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id b13sm3152922pjz.10.2019.09.04.11.34.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 11:34:15 -0700 (PDT)
Date: Wed, 04 Sep 2019 11:34:15 -0700 (PDT)
X-Google-Original-Date: Wed, 04 Sep 2019 11:34:08 PDT (-0700)
In-Reply-To: <CAEUhbmXh_tYqubC4nF6PymQW795ExfPUN9Ap1u7PNPN2hws=CA@mail.gmail.com>
CC: philmd@redhat.com, Chih-Min Chao <chihmin.chao@sifive.com>,
 qemu-riscv@nongnu.org, sagark@eecs.berkeley.edu,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 qemu-devel@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: bmeng.cn@gmail.com, Peter Maydell <peter.maydell@linaro.org>
Message-ID: <mhng-fd27972e-5f98-4fdb-b4dc-bd020f4fe8e2@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.210.195
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH] riscv: sifive_e: Correct
 various SoC IP block sizes
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
X-List-Received-Date: Wed, 04 Sep 2019 18:34:21 -0000

On Tue, 03 Sep 2019 20:41:52 PDT (-0700), bmeng.cn@gmail.com wrote:
> Palmer,
>
> On Wed, Aug 14, 2019 at 5:34 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>>
>> Hi Palmer,
>>
>> On Wed, Aug 7, 2019 at 10:53 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>> >
>> > On Wed, Aug 7, 2019 at 5:06 AM Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>> > >
>> > > On 8/5/19 8:43 AM, Bin Meng wrote:
>> > > > On Mon, Aug 5, 2019 at 2:14 PM Chih-Min Chao <chihmin.chao@sifive.com> wrote:
>> > > >> On Sat, Aug 3, 2019 at 8:27 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>> > > >>>
>> > > >>> Some of the SoC IP block sizes are wrong. Correct them according
>> > > >>> to the FE310 manual.
>> > > >>>
>> > > >>> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
>> > > >>> ---
>> > > >>>
>> > > >>>  hw/riscv/sifive_e.c | 6 +++---
>> > > >>>  1 file changed, 3 insertions(+), 3 deletions(-)
>> > > >>>
>> > > >>> diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
>> > > >>> index 2a499d8..9655847 100644
>> > > >>> --- a/hw/riscv/sifive_e.c
>> > > >>> +++ b/hw/riscv/sifive_e.c
>> > > >>> @@ -53,13 +53,13 @@ static const struct MemmapEntry {
>> > > >>>      hwaddr base;
>> > > >>>      hwaddr size;
>> > > >>>  } sifive_e_memmap[] = {
>> > > >>> -    [SIFIVE_E_DEBUG] =    {        0x0,      0x100 },
>> > > >>> +    [SIFIVE_E_DEBUG] =    {        0x0,     0x1000 },
>> > > >>>      [SIFIVE_E_MROM] =     {     0x1000,     0x2000 },
>> > > >>>      [SIFIVE_E_OTP] =      {    0x20000,     0x2000 },
>> > > >>>      [SIFIVE_E_CLINT] =    {  0x2000000,    0x10000 },
>> > > >>>      [SIFIVE_E_PLIC] =     {  0xc000000,  0x4000000 },
>> > > >>> -    [SIFIVE_E_AON] =      { 0x10000000,     0x8000 },
>> > > >>> -    [SIFIVE_E_PRCI] =     { 0x10008000,     0x8000 },
>> > > >>> +    [SIFIVE_E_AON] =      { 0x10000000,     0x1000 },
>> > > >>> +    [SIFIVE_E_PRCI] =     { 0x10008000,     0x1000 },
>> > > >>>      [SIFIVE_E_OTP_CTRL] = { 0x10010000,     0x1000 },
>> > > >>>      [SIFIVE_E_GPIO0] =    { 0x10012000,     0x1000 },
>> > > >>>      [SIFIVE_E_UART0] =    { 0x10013000,     0x1000 },
>> > > >>> --
>> > > >>> 2.7.4
>> > > >>>
>> > > >>
>> > > >> It seems the modification follows  E310-G002(Hifive1 Rev B) spec and the origin is for E310-G000(Hifive1) spec.
>> > > >> There should be some way to specify different board version with different memory map or we have policy, always support the latest spec.
>> > >
>> > > I agree with Chao, it would be cleaner to have two different boards
>> > > (machines).
>> > > Since the SoCs are very similar, you could add a 'revision' property and
>> > > use it to select the correct map.
>> > >
>> >
>> > I am not sure if adding two different machines will bring us a lot of
>> > benefits, since the only difference is the SoC revision with different
>> > block sizes.
>> >
>> > > >>
>> > > >
>> > > > Yes, I checked both specs. The older spec says these bigger sizes,
>> > > > however their register sizes fit well in the smaller range as well. So
>> > > > I think the modification works well for both.
>> > >
>> > > This is OK for the PRCI, since sifive_prci_create() does not use
>> > > memmap[SIFIVE_E_PRCI].size.
>> > >
>> > > However the AON case is borderline, since you shrink it from 32KiB to 4KiB.
>> > >
>> >
>> > AON is not implemented anyway currently. And I checked the FE310 old
>> > spec, its register block size is still within the 4KiB range, so
>> > shrinking the size should be fine for both old and new SoC.
>> >
>> > > BTW (not related to this patch) it is odd a function named
>> > > sifive_mmio_emulate() creates a RAM region with memory_region_init_ram()
>> > > and does not use the UnimplementedDevice (see make_unimp_dev() in
>> > > hw/arm/musca.c).
>> > >
>>
>> What's your suggestion regarding this patch?
>
> Ping?

Sorry, I missed this the first time around.  In retrospect, it looks like we 
ended up with the wrong naming scheme for boards: sifive_e is very ambiguous, 
as there are many boards that look like this.  We'd originally chosen a more 
explicit scheme (something like "sifive-fe310-g000"), but that was NAK'd as 
resulting in too many machine types.

Peter: would you be OK deprecating "sifive_e" and adding "sifive-fe310-g000" 
and "sifive-fe310-g002" targets?  We'll end up with a lot of machines this way, 
but I don't see another way to closely match what's out there.  In embedded 
land there isn't really any runtime portability, so if the memory maps don't 
match exactly then it's not a useful target for users.

