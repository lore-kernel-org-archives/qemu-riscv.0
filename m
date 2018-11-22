Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPpFQ-0002dI-CI
	for mharc-qemu-riscv@gnu.org; Thu, 22 Nov 2018 08:42:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37385)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gPkbL-0000Ld-5L
	for qemu-riscv@nongnu.org; Thu, 22 Nov 2018 03:44:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gPkbJ-0001MM-Sv
	for qemu-riscv@nongnu.org; Thu, 22 Nov 2018 03:44:43 -0500
Received: from mx1.redhat.com ([209.132.183.28]:37362)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gPkbE-0001Gk-JX; Thu, 22 Nov 2018 03:44:36 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D769BC05681F;
	Thu, 22 Nov 2018 08:44:34 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-181.ams2.redhat.com [10.36.116.181])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9F93A282CE;
	Thu, 22 Nov 2018 08:44:33 +0000 (UTC)
To: Palmer Dabbelt <palmer@sifive.com>, qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org
References: <20181121233123.6408-1-palmer@sifive.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=thuth@redhat.com; keydata=
	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
Organization: Red Hat
Message-ID: <fcc9d781-43a4-1881-47da-1ca26ba7e9b2@redhat.com>
Date: Thu, 22 Nov 2018 09:44:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20181121233123.6408-1-palmer@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Thu, 22 Nov 2018 08:44:34 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
X-Mailman-Approved-At: Thu, 22 Nov 2018 08:42:23 -0500
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
X-List-Received-Date: Thu, 22 Nov 2018 08:44:44 -0000

 Hi,

On 2018-11-22 00:31, Palmer Dabbelt wrote:
> These machines had names that were too general: there are many E
> and U machines, and it's easy for users to get confused about which one
> is which.  The one configuration that can faithfully match an existing
> ASIC-based board has been renamed to 'sifive-hifive1', we'll work
> through the emulation fidelity issues apparent in the other targets
> before adding machines for those.
> 
> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> ---
>  hw/riscv/sifive_e.c  | 26 ++++++++++++++++++++++++--
>  hw/riscv/sifive_u.c  |  2 ++
>  qemu-deprecated.texi |  7 +++++++
>  3 files changed, 33 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
> index cb513cc3bb50..439d20e0efe7 100644
> --- a/hw/riscv/sifive_e.c
> +++ b/hw/riscv/sifive_e.c
> @@ -95,7 +95,7 @@ static void sifive_mmio_emulate(MemoryRegion *parent, const char *name,
>      memory_region_add_subregion(parent, offset, mock_mmio);
>  }
>  
> -static void riscv_sifive_e_init(MachineState *machine)
> +static void riscv_sifive_hifive1_init(MachineState *machine)
>  {
>      const struct MemmapEntry *memmap = sifive_e_memmap;
>  
> @@ -135,6 +135,17 @@ static void riscv_sifive_e_init(MachineState *machine)
>      }
>  }
>  
> +static void riscv_sifive_e_init(MachineState *machine)
> +{
> +#if defined(TARGET_RISCV32)
> +    warn_report("The sifive_e machine is deprecated in favor of sifive-hifive1");
> +#else
> +    warn_report("The sifive_e machine is deprecated.");
> +#endif
> +
> +    return riscv_sifive_hifive1_init(machine);
> +}
> +
>  static void riscv_sifive_e_soc_init(Object *obj)
>  {
>      SiFiveESoCState *s = RISCV_E_SOC(obj);
> @@ -213,13 +224,24 @@ static void riscv_sifive_e_soc_realize(DeviceState *dev, Error **errp)
>  
>  static void riscv_sifive_e_machine_init(MachineClass *mc)
>  {
> -    mc->desc = "RISC-V Board compatible with SiFive E SDK";
> +    mc->desc = "(deprecated) RISC-V Board compatible with SiFive E SDK";
>      mc->init = riscv_sifive_e_init;
>      mc->max_cpus = 1;
>  }
>  
>  DEFINE_MACHINE("sifive_e", riscv_sifive_e_machine_init)
>  
> +#if defined(TARGET_RISCV32)
> +static void riscv_sifive_hifive1_machine_init(MachineClass *mc)
> +{
> +    mc->desc = "SiFive's HiFive1 Development Board";
> +    mc->init = riscv_sifive_hifive1_init;
> +    mc->max_cpus = 1;
> +}
> +
> +DEFINE_MACHINE("sifive-hifive1", riscv_sifive_hifive1_machine_init)
> +#endif
> +
>  static void riscv_sifive_e_soc_class_init(ObjectClass *oc, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(oc);
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index ef07df244241..0ce6a9dd2609 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -238,6 +238,8 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
>  
>  static void riscv_sifive_u_init(MachineState *machine)
>  {
> +    warn_report("The sifive_u machine is deprecated.");

FWIW, you can also simply set MachineClass->deprecation_reason nowadays
instead of manually issuing a warn_report() and tweaking the description
... that would be a little bit easier and is in sync with the other
deprecated boards (see e.g. commit 08fe68244 or 54c86f5a4844d51 for
other examples).

 Thomas


