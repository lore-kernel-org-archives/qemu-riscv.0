Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hEZNh-0007LG-Oh
	for mharc-qemu-riscv@gnu.org; Thu, 11 Apr 2019 09:04:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51530)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1hEYH5-0007Gf-Sa
	for qemu-riscv@nongnu.org; Thu, 11 Apr 2019 07:53:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1hEYH4-0007c2-Uk
	for qemu-riscv@nongnu.org; Thu, 11 Apr 2019 07:53:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59104)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1hEYH2-0007al-MO; Thu, 11 Apr 2019 07:53:44 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DD8DA99CE2;
	Thu, 11 Apr 2019 11:53:43 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8A3CA5D719;
	Thu, 11 Apr 2019 11:53:42 +0000 (UTC)
Date: Thu, 11 Apr 2019 13:53:38 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>, "alistair23@gmail.com" <alistair23@gmail.com>, 
	"palmer@sifive.com" <palmer@sifive.com>, "ijc@hellion.org.uk"
	<ijc@hellion.org.uk>
Message-ID: <20190411135338.535472e2@redhat.com>
In-Reply-To: <a832ae5e252c58c1ac4dd99d7d164fdb0de70f10.1554937288.git.alistair.francis@wdc.com>
References: <cover.1554937288.git.alistair.francis@wdc.com>
	<a832ae5e252c58c1ac4dd99d7d164fdb0de70f10.1554937288.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Thu, 11 Apr 2019 11:53:43 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
X-Mailman-Approved-At: Thu, 11 Apr 2019 09:04:39 -0400
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH for 4.1 v3 4/6] riscv: virt:
 Allow specifying a CPU via commandline
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
X-List-Received-Date: Thu, 11 Apr 2019 11:53:48 -0000

On Wed, 10 Apr 2019 23:10:42 +0000
Alistair Francis <Alistair.Francis@wdc.com> wrote:

> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/riscv/virt.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index fc4c6b306e..5b25f028ad 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -400,7 +400,7 @@ static void riscv_virt_board_init(MachineState *machine)
>      /* Initialize SOC */
>      object_initialize_child(OBJECT(machine), "soc", &s->soc, sizeof(s->soc),
>                              TYPE_RISCV_HART_ARRAY, &error_abort, NULL);
> -    object_property_set_str(OBJECT(&s->soc), VIRT_CPU, "cpu-type",
> +    object_property_set_str(OBJECT(&s->soc), machine->cpu_type, "cpu-type",
>                              &error_abort);
>      object_property_set_int(OBJECT(&s->soc), smp_cpus, "num-harts",
>                              &error_abort);
> @@ -526,6 +526,7 @@ static void riscv_virt_board_machine_init(MachineClass *mc)
>      mc->desc = "RISC-V VirtIO Board (Privileged ISA v1.10)";
>      mc->init = riscv_virt_board_init;
>      mc->max_cpus = 8; /* hardcoded limit in BBL */
> +    mc->default_cpu_type = VIRT_CPU;
>  }
>  
>  DEFINE_MACHINE("virt", riscv_virt_board_machine_init)


