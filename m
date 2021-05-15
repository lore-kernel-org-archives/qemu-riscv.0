Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1li0AT-00083y-0G
	for mharc-qemu-riscv@gnu.org; Sat, 15 May 2021 15:41:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1li0AP-0007wu-6E; Sat, 15 May 2021 15:41:41 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:53388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1li0AN-0000QA-15; Sat, 15 May 2021 15:41:40 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id E7C9874570E;
 Sat, 15 May 2021 21:41:36 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id C8B45745709; Sat, 15 May 2021 21:41:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id C6BDB745708;
 Sat, 15 May 2021 21:41:36 +0200 (CEST)
Date: Sat, 15 May 2021 21:41:36 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>
cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org, 
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 David Gibson <david@gibson.dropbear.id.au>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>, 
 Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v2 12/12] hw/ppc/Kconfig: Add dependency PEGASOS2 ->
 ATI_VGA
In-Reply-To: <20210515173716.358295-13-philmd@redhat.com>
Message-ID: <e164f246-80a6-d65b-3dc-8b9cb16d0e8@eik.bme.hu>
References: <20210515173716.358295-1-philmd@redhat.com>
 <20210515173716.358295-13-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1266767945-1621107696=:7809"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Sat, 15 May 2021 19:41:42 -0000

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1266767945-1621107696=:7809
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Sat, 15 May 2021, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
>
> While the ATI VGA device isn't a requisite (no crash without it):
>
>  $ qemu-system-ppc -M pegasos2
>  qemu-system-ppc: standard VGA not available
>
> it is useful to have it with the Pegasos2 machine:
>
>  $ qemu-system-ppc -M pegasos2 -vga none -bios pegasos2.rom -device ati-vga,romfile=
>  qemu-system-ppc: -device ati-vga,romfile=: 'ati-vga' is not a valid device model name
>
> Add it as an implicit Kconfig dependency.
>
> Fixes: ba7e5ac18e7 ("hw/ppc: Add emulation of Genesi/bPlan Pegasos II")

You can list it as a fix but I regard this more an enhancement or 
amandment to that commit as it was not broken in this regard as the commit 
message above also explains. To me Fixes tag means more that something was 
broken in that commit that this one patches up but I don't care much about 
this tag. It would probably make more sense in your other commits fixing 
missing dependencies (although not clear which commit those fix as the 
missing dependencies were probably also missing before the latest clean 
ups).

> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Acked-by: BALATON Zoltan <balaton@eik.bme.hu>

> ---
> hw/ppc/Kconfig | 1 +
> 1 file changed, 1 insertion(+)
>
> diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
> index 2e4c56eb770..e36db08665a 100644
> --- a/hw/ppc/Kconfig
> +++ b/hw/ppc/Kconfig
> @@ -77,6 +77,7 @@ config PEGASOS2
>     select SMBUS_EEPROM
> # This should come with VT82C686
>     select ACPI_X86
> +    imply ATI_VGA
>
> config PREP
>     bool
>
--3866299591-1266767945-1621107696=:7809--

