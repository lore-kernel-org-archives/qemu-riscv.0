Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pXewJ-0002U5-UB
	for mharc-qemu-riscv@gnu.org; Thu, 02 Mar 2023 04:09:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.dooks@codethink.co.uk>)
 id 1pXewI-0002Tf-BC; Thu, 02 Mar 2023 04:09:26 -0500
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.dooks@codethink.co.uk>)
 id 1pXewG-0001z3-QH; Thu, 02 Mar 2023 04:09:26 -0500
Received: from [167.98.27.226] (helo=[10.35.5.0])
 by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
 id 1pXeR5-00Blko-7q; Thu, 02 Mar 2023 08:37:11 +0000
Message-ID: <cc29c762-16e7-8a72-7ad9-b9fd6535c1c1@codethink.co.uk>
Date: Thu, 2 Mar 2023 08:37:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/1] hw/riscv/virt.c: add cbom-block-size fdt property
Content-Language: en-GB
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Anup Patel <apatel@ventanamicro.com>
References: <20230301215902.375217-1-dbarboza@ventanamicro.com>
 <20230301215902.375217-2-dbarboza@ventanamicro.com>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <20230301215902.375217-2-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=78.40.148.171;
 envelope-from=ben.dooks@codethink.co.uk; helo=imap5.colo.codethink.co.uk
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.09,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 02 Mar 2023 09:09:26 -0000

On 01/03/2023 21:59, Daniel Henrique Barboza wrote:
> From: Anup Patel <apatel@ventanamicro.com>
> 
> The cbom-block-size fdt property property is used to inform the OS about
> the blocksize in bytes for the Zicbom cache operations.
> 
> Linux documents it in Documentation/devicetree/bindings/riscv/cpus.yaml
> as:
> 
>    riscv,cbom-block-size:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      description:
>        The blocksize in bytes for the Zicbom cache operations.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>   hw/riscv/virt.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 49acb57da4..31b55cc62f 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -244,6 +244,12 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
>           name = riscv_isa_string(cpu_ptr);
>           qemu_fdt_setprop_string(ms->fdt, cpu_name, "riscv,isa", name);
>           g_free(name);
> +
> +        if (cpu_ptr->cfg.ext_icbom) {
> +            qemu_fdt_setprop_cell(ms->fdt, cpu_name, "riscv,cbom-block-size",
> +                                  cpu_ptr->cfg.cbom_blocksize);
> +        }
> +
>           qemu_fdt_setprop_string(ms->fdt, cpu_name, "compatible", "riscv");
>           qemu_fdt_setprop_string(ms->fdt, cpu_name, "status", "okay");
>           qemu_fdt_setprop_cell(ms->fdt, cpu_name, "reg",

You'll need the same for riscv,cboz-block-size as well.

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html


