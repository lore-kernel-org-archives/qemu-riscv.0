Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oL4I4-0002SZ-In
	for mharc-qemu-riscv@gnu.org; Mon, 08 Aug 2022 11:03:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1oL4Hz-0002QU-KS; Mon, 08 Aug 2022 11:03:31 -0400
Received: from mail-sender.a4lg.com ([153.120.152.154]:62412
 helo=mail-sender-0.a4lg.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1oL4Ht-0006H7-FS; Mon, 08 Aug 2022 11:03:31 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by mail-sender-0.a4lg.com (Postfix) with ESMTPSA id 18B2A300089;
 Mon,  8 Aug 2022 15:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irq.a4lg.com;
 s=2017s01; t=1659970994;
 bh=DgSyfOgUNFubFDCGFCAz4VdWSvv8D4vLl+5Gq2B4Td4=;
 h=Message-ID:Date:Mime-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type:Content-Transfer-Encoding;
 b=fwmhxYd6TGpchqoh5EXeU8H/iKS6grmwSQJK58A7ns40Nq/S6IOzosaOGL4+MOArt
 g9UZYrqOSP8POiClzPMr3MxbVdACf4Mr03YFPu+VtrEEE26lZQf3Dol6D32njOedSs
 fX2dIw/wHUW9DMbj5qsxkOaKG9ae9gzAyKH8xIfk=
Message-ID: <0f453024-1d1e-105d-855b-234c3c8fedbb@irq.a4lg.com>
Date: Tue, 9 Aug 2022 00:03:12 +0900
Mime-Version: 1.0
Subject: Re: [PATCH 1/5] target/riscv: Ignore the S and U letters when
 formatting ISA strings
Content-Language: en-US
To: Conor Dooley <mail@conchuod.ie>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, 
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@sifive.com>
References: <20220805155405.1504081-1-mail@conchuod.ie>
 <20220805155405.1504081-2-mail@conchuod.ie>
From: Tsukasa OI <research_trasio@irq.a4lg.com>
In-Reply-To: <20220805155405.1504081-2-mail@conchuod.ie>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=153.120.152.154;
 envelope-from=research_trasio@irq.a4lg.com; helo=mail-sender-0.a4lg.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Aug 2022 15:03:35 -0000

On 2022/08/06 0:54, Conor Dooley wrote:
> From: Palmer Dabbelt <palmer@sifive.com>
> 
> The ISA strings we're providing from QEMU aren't actually legal RISC-V
> ISA strings, as both S and U cannot exist as single-letter extensions
> and must instead be multi-letter strings.  We're still using the ISA
> strings inside QEMU to track the availiable extensions, so just strip
> out the S and U extensions when formatting ISA strings.
> 
> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> [Conor: rebased on 7.1.0-rc1 & slightly tweaked the commit message]
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  target/riscv/cpu.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index ac6f82ebd0..95fdc03b3d 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1122,7 +1122,23 @@ char *riscv_isa_string(RISCVCPU *cpu)
>      char *p = isa_str + snprintf(isa_str, maxlen, "rv%d", TARGET_LONG_BITS);
>      for (i = 0; i < sizeof(riscv_single_letter_exts) - 1; i++) {
>          if (cpu->env.misa_ext & RV(riscv_single_letter_exts[i])) {
> -            *p++ = qemu_tolower(riscv_single_letter_exts[i]);
> +            char lower = qemu_tolower(riscv_single_letter_exts[i]);
> +            switch (lower) {
> +                case 's':
> +                case 'u':
> +                    /*
> +                    * The 's' and 'u' letters shouldn't show up in ISA strings as
> +                    * they're not extensions, but they should show up in MISA.
> +                    * Since we use these letters interally as a pseudo ISA string
> +                    * to set MISA it's easier to just strip them out when
> +                    * formatting the ISA string.
> +                    */
> +                    break;
> +
> +                default:
> +                    *p++ = lower;
> +                    break;
> +            }
>          }
>      }
>      *p = '\0';

I agree with Alistair.  **I** removed 'S' and 'U' from the ISA string
and it should be working in the latest development branch (I tested).

I tested it on master and QEMU 7.1-rc1 (tag: v7.1-rc1).

Example:
/opt/riscv/bin/qemu-system-riscv64
         -machine virt
         -nographic
         -cpu rv64
         -smp 1
         -kernel images/linux.bin
         -initrd images/busybox.cpio.gz
         -append 'console=hvc0 earlycon=sbi'
         -bios images/opensbi-fw_jump.elf
         -gdb tcp::9000

Replacing -machine virt with -machine virt,dumpdtb=sample.dtb dumps the
binary DeviceTree as sample.dtb and generated CPU-related parts like...

                cpu@0 {
                        phandle = <0x01>;
                        device_type = "cpu";
                        reg = <0x00>;
                        status = "okay";
                        compatible = "riscv";
                        riscv,isa =
"rv64imafdch_zicsr_zifencei_zba_zbb_zbc_zbs";
                        mmu-type = "riscv,sv48";

                        interrupt-controller {
                                #interrupt-cells = <0x01>;
                                interrupt-controller;
                                compatible = "riscv,cpu-intc";
                                phandle = <0x02>;
                        };
                };

Besides, this function alone generates the ISA string for DTB and
there's no way such ISA strings with invalid 'S' and 'U' can be
generated.  It's definitely a behavior of QEMU 7.0 or before.

Please. Please make sure that you are testing the right version of QEMU.

Thanks,
Tsukasa

