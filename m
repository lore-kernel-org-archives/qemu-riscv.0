Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gRMOE-0004pJ-RA
	for mharc-qemu-riscv@gnu.org; Mon, 26 Nov 2018 14:17:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33181)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gRMOC-0004fM-Ve
	for qemu-riscv@nongnu.org; Mon, 26 Nov 2018 14:17:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gRMO9-000060-BD
	for qemu-riscv@nongnu.org; Mon, 26 Nov 2018 14:17:48 -0500
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:44504)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gRMO9-00005a-6L
	for qemu-riscv@nongnu.org; Mon, 26 Nov 2018 14:17:45 -0500
Received: by mail-pf1-x441.google.com with SMTP id u6so7046393pfh.11
	for <qemu-riscv@nongnu.org>; Mon, 26 Nov 2018 11:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
	:content-transfer-encoding;
	bh=fGZl6pT+hGVbGB5C6saZsdIWCV9hHAh7AA5D6fJcp1I=;
	b=XvDegTukr1NruvZe5KSD0iASzM23NAWIRK/TVABWa2dVCdGySbbzFp3CRReGCSxngA
	fYqWdQ929swH8X1br/k17Sf3jg5l6zYnhXHqsMe9zslBbLfmnQ9qduByOTknoHfwLCtU
	CXcfVgiujRqSlQniBM+GiBYr6amoxNodA3bA7sy8TYxDml+/14AwzGq1650fWRY8Mpjr
	gikfQdCjFuiQhfbZmsLUGs8o3w3BZIJ3ICKDYQZsU5tDnUnl9myoywaofV9pZuEV8Sc4
	l3ISuLLOkZGn2wllsTtcMMRoaYx2v3ViM7qa+5JHW6kohUnDEtHAfN4/zpNMx9dcfcHq
	aqWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=fGZl6pT+hGVbGB5C6saZsdIWCV9hHAh7AA5D6fJcp1I=;
	b=aRubMMy92PDLH7c/r3mJixVod0qkUWDksUHaiTuQok6glcyh1jFYmfHIlk+j3AV4GW
	BMVqXNW6aeoBkuOvorBcf3IdvD7IEm9NX4DF8JXDdSFjPgiHfnLsnomkk2ut1Rj7qwb1
	c4zzbzWs73ojJY3Ef+8W1dqdLzHeIhw9mGDOgoqe4nVdnfLdKHSLI8e3nWoluBZll8pb
	b+JUKh4EQfR88kZ0+Puwu+o2X3JCmOcf3wk5B3DrDXOCyKgRA27BuVr891ZvlFyfEOOp
	7JMTP9AGZGBrq7nsxQHSxE6PMz8hIvj5EppbnyIvtH8yPfI6TqJljPv3//iYjJSzOWt9
	69QQ==
X-Gm-Message-State: AGRZ1gITEpQ/CvYTWtx5TMkBUhINYvJsbgRqbFrOOxTumpKdSLIOBWa1
	EhpnFDF9AveFOxbNu7JuVKJt8aXhuUk=
X-Google-Smtp-Source: AJdET5e5qEmZaiRN2veuBS52bcwP6GN+kjNj1zbIEecnWT/GVCOkk3v2kcUZUS12DqeUsYv+HwtYEA==
X-Received: by 2002:a62:5003:: with SMTP id e3mr30262076pfb.23.1543259863799; 
	Mon, 26 Nov 2018 11:17:43 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	d80sm3645189pfm.146.2018.11.26.11.17.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Nov 2018 11:17:43 -0800 (PST)
Date: Mon, 26 Nov 2018 11:17:43 -0800 (PST)
X-Google-Original-Date: Mon, 26 Nov 2018 11:17:39 PST (-0800)
In-Reply-To: <fcc9d781-43a4-1881-47da-1ca26ba7e9b2@redhat.com>
CC: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: thuth@redhat.com
Message-ID: <mhng-93bbdbc4-f768-4c5a-8b07-62d877776744@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH for-3.2] RISC-V: Deprecate
 hifive_e and hifive_u machines
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
X-List-Received-Date: Mon, 26 Nov 2018 19:17:50 -0000

On Thu, 22 Nov 2018 00:44:32 PST (-0800), thuth@redhat.com wrote:
>  Hi,
>
> On 2018-11-22 00:31, Palmer Dabbelt wrote:
>> These machines had names that were too general: there are many E
>> and U machines, and it's easy for users to get confused about which one
>> is which.  The one configuration that can faithfully match an existing
>> ASIC-based board has been renamed to 'sifive-hifive1', we'll work
>> through the emulation fidelity issues apparent in the other targets
>> before adding machines for those.
>>
>> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
>> ---
>>  hw/riscv/sifive_e.c  | 26 ++++++++++++++++++++++++--
>>  hw/riscv/sifive_u.c  |  2 ++
>>  qemu-deprecated.texi |  7 +++++++
>>  3 files changed, 33 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
>> index cb513cc3bb50..439d20e0efe7 100644
>> --- a/hw/riscv/sifive_e.c
>> +++ b/hw/riscv/sifive_e.c
>> @@ -95,7 +95,7 @@ static void sifive_mmio_emulate(MemoryRegion *parent, const char *name,
>>      memory_region_add_subregion(parent, offset, mock_mmio);
>>  }
>>
>> -static void riscv_sifive_e_init(MachineState *machine)
>> +static void riscv_sifive_hifive1_init(MachineState *machine)
>>  {
>>      const struct MemmapEntry *memmap = sifive_e_memmap;
>>
>> @@ -135,6 +135,17 @@ static void riscv_sifive_e_init(MachineState *machine)
>>      }
>>  }
>>
>> +static void riscv_sifive_e_init(MachineState *machine)
>> +{
>> +#if defined(TARGET_RISCV32)
>> +    warn_report("The sifive_e machine is deprecated in favor of sifive-hifive1");
>> +#else
>> +    warn_report("The sifive_e machine is deprecated.");
>> +#endif
>> +
>> +    return riscv_sifive_hifive1_init(machine);
>> +}
>> +
>>  static void riscv_sifive_e_soc_init(Object *obj)
>>  {
>>      SiFiveESoCState *s = RISCV_E_SOC(obj);
>> @@ -213,13 +224,24 @@ static void riscv_sifive_e_soc_realize(DeviceState *dev, Error **errp)
>>
>>  static void riscv_sifive_e_machine_init(MachineClass *mc)
>>  {
>> -    mc->desc = "RISC-V Board compatible with SiFive E SDK";
>> +    mc->desc = "(deprecated) RISC-V Board compatible with SiFive E SDK";
>>      mc->init = riscv_sifive_e_init;
>>      mc->max_cpus = 1;
>>  }
>>
>>  DEFINE_MACHINE("sifive_e", riscv_sifive_e_machine_init)
>>
>> +#if defined(TARGET_RISCV32)
>> +static void riscv_sifive_hifive1_machine_init(MachineClass *mc)
>> +{
>> +    mc->desc = "SiFive's HiFive1 Development Board";
>> +    mc->init = riscv_sifive_hifive1_init;
>> +    mc->max_cpus = 1;
>> +}
>> +
>> +DEFINE_MACHINE("sifive-hifive1", riscv_sifive_hifive1_machine_init)
>> +#endif
>> +
>>  static void riscv_sifive_e_soc_class_init(ObjectClass *oc, void *data)
>>  {
>>      DeviceClass *dc = DEVICE_CLASS(oc);
>> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
>> index ef07df244241..0ce6a9dd2609 100644
>> --- a/hw/riscv/sifive_u.c
>> +++ b/hw/riscv/sifive_u.c
>> @@ -238,6 +238,8 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
>>
>>  static void riscv_sifive_u_init(MachineState *machine)
>>  {
>> +    warn_report("The sifive_u machine is deprecated.");
>
> FWIW, you can also simply set MachineClass->deprecation_reason nowadays
> instead of manually issuing a warn_report() and tweaking the description
> ... that would be a little bit easier and is in sync with the other
> deprecated boards (see e.g. commit 08fe68244 or 54c86f5a4844d51 for
> other examples).

Perfect, thanks!  I couldn't find anything when grepping around, the explicit 
warning seemed a bit ugly.

I'll spin another patch set.

