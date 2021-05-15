Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1li0B9-0000jd-17
	for mharc-qemu-riscv@gnu.org; Sat, 15 May 2021 15:42:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1li0B5-0000ha-HP; Sat, 15 May 2021 15:42:23 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:53404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1li0Az-0000oM-5C; Sat, 15 May 2021 15:42:21 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id BCABE74570E;
 Sat, 15 May 2021 21:42:14 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 9BBEE745709; Sat, 15 May 2021 21:42:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 9A79F7456E3;
 Sat, 15 May 2021 21:42:14 +0200 (CEST)
Date: Sat, 15 May 2021 21:42:14 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>
cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org, 
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 David Gibson <david@gibson.dropbear.id.au>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2 10/12] hw/isa/vt82c686: Add missing Kconfig dependencies
 (build error)
In-Reply-To: <20210515173716.358295-11-philmd@redhat.com>
Message-ID: <50a2fbad-72ee-8fd6-e1d5-5687abb1c4b7@eik.bme.hu>
References: <20210515173716.358295-1-philmd@redhat.com>
 <20210515173716.358295-11-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1641504594-1621107734=:7809"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 15 May 2021 19:42:25 -0000

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1641504594-1621107734=:7809
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT


On Sat, 15 May 2021, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
>
> The VT82C686 device model misses various dependencies:
>
>  /usr/bin/ld: libcommon.fa.p/hw_isa_vt82c686.c.o: in function `vt82c686b_realize':
>  hw/isa/vt82c686.c:622: undefined reference to `i8259_init'
>  /usr/bin/ld: hw/isa/vt82c686.c:624: undefined reference to `i8257_dma_init'
>  /usr/bin/ld: hw/isa/vt82c686.c:627: undefined reference to `mc146818_rtc_init'
>
> Add them.
>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>

> ---
> hw/isa/Kconfig | 3 +++
> 1 file changed, 3 insertions(+)
>
> diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
> index 55e0003ce40..0703512209a 100644
> --- a/hw/isa/Kconfig
> +++ b/hw/isa/Kconfig
> @@ -49,6 +49,9 @@ config VT82C686
>     select FDC
>     select USB_UHCI
>     select APM
> +    select I8257
> +    select I8259
> +    select MC146818RTC
>
> config SMC37C669
>     bool
>
--3866299591-1641504594-1621107734=:7809--

