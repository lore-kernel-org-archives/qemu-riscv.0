Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ouilv-0006MZ-Md
	for mharc-qemu-riscv@gnu.org; Mon, 14 Nov 2022 18:21:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ouifz-0006MO-FJ
 for qemu-riscv@nongnu.org; Mon, 14 Nov 2022 18:15:43 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ouV0m-0007iK-U6
 for qemu-riscv@nongnu.org; Mon, 14 Nov 2022 03:40:23 -0500
Received: by mail-wr1-x432.google.com with SMTP id cl5so16763954wrb.9
 for <qemu-riscv@nongnu.org>; Mon, 14 Nov 2022 00:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ak2u6iPYyyGsUX3po+0Xb46H7FHfYDGvM9I35aDqK4E=;
 b=SMMiRH2El5oVSEpmMPzj/vK5eq1FLH9ZeTrPXIurNCrUjcCVtNfb/ICux+89RjJMJ5
 83KKZdqwi0Kyld5aZFNFqsV/Iyn5gAO8bae6fSq8leLYlYgQeolVy0wq2t8e0tyzTV1Y
 wmJG4MwLdHvpqhqxIJb/lmSSX1BoFJw+4cJkd34O+GIZ8OVCqu7qnsjm12jC2k34t+tb
 2fyWNjh/idalEpEk4I0pzDKGTldHiS0PV2moH+L0uLJiroGbc3+t9ZNw2vy1NNyM3NWR
 SLmi0EYshoJz5rMG7AxUKKj8+7D1gnhHhHsG/ifsMi0LUrm7johdzm+ls72GA9tofvB3
 DnwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ak2u6iPYyyGsUX3po+0Xb46H7FHfYDGvM9I35aDqK4E=;
 b=Zn4P2nRhi5DA0OaEbDLIwLRDerN+EQ+YLRGTf9lS2i8qz3Eb3Wcy8Imn7l7+vChWdU
 EgZgV9q/rD3VffJ4NX6Pl924fh9GMfy6ksQsX51gZUI5aarLs0zuQVijoBrWrAsoJrnV
 VdSOBmE/6Un2vnJKeIgC6BiqWFKIEcw9f2PC0eXe/Pnuf7Vqiv6796FBMpKqdtFCZCyG
 XvOxHtuB/42lIucjNH9bWzb7PvyqXdf27G7TC0ySGvirciabnkmS46dDWzukiMmbKTzp
 fVaArjKvUNVJ0DcxZMJcc87N+4TJRT2Q+lfJRUFVaq4AIyMMb+lvvBknYSlGv3+RJzC2
 BHCw==
X-Gm-Message-State: ANoB5plyTRmUq1N7gwHUnQ9fzlIIyK2ZuyW2IsTg0rlDhEH63ivzCY1N
 4o1isI10s8rIVhhosgSVOyMoZQ==
X-Google-Smtp-Source: AA0mqf4nGkgjGubMBfUyzbv3RMR//maUMSa7xB3R1Or0HXXLfAInNVDkKlEytPxDo+rFqQbY6vYqYw==
X-Received: by 2002:a5d:63d1:0:b0:236:71f9:95db with SMTP id
 c17-20020a5d63d1000000b0023671f995dbmr6742142wrw.551.1668415209764; 
 Mon, 14 Nov 2022 00:40:09 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 k5-20020adff5c5000000b0022e344a63c7sm8910139wrp.92.2022.11.14.00.40.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Nov 2022 00:40:09 -0800 (PST)
Message-ID: <48729f3f-80eb-8c7b-7bbb-7cd6bfa65a3e@linaro.org>
Date: Mon, 14 Nov 2022 09:40:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH] hw/intc: sifive_plic: Renumber the S irqs for numa support
Content-Language: en-US
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, Alistair.Francis@wdc.com,
 bin.meng@windriver.com, palmer@dabbelt.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20221111121913.1531030-1-frederic.petrot@univ-grenoble-alpes.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221111121913.1531030-1-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 14 Nov 2022 23:15:48 -0000

On 11/11/22 13:19, Frédéric Pétrot wrote:
> Commit 40244040 changed the way the S irqs are numbered. This breaks when

40244040a7 in case?

> using numa configuration, e.g.:
> ./qemu-system-riscv64 -nographic -machine virt,dumpdtb=numa-tree.dtb \
>                        -m 2G -smp cpus=16 \
> 		      -object memory-backend-ram,id=mem0,size=512M \
> 		      -object memory-backend-ram,id=mem1,size=512M \
> 		      -object memory-backend-ram,id=mem2,size=512M \
> 		      -object memory-backend-ram,id=mem3,size=512M \
> 		      -numa node,cpus=0-3,memdev=mem0,nodeid=0 \
> 		      -numa node,cpus=4-7,memdev=mem1,nodeid=1 \
> 		      -numa node,cpus=8-11,memdev=mem2,nodeid=2 \
> 		      -numa node,cpus=12-15,memdev=mem3,nodeid=3
> leads to:
> Unexpected error in object_property_find_err() at ../qom/object.c:1304:
> qemu-system-riscv64: Property 'riscv.sifive.plic.unnamed-gpio-out[8]' not
> found
> 
> This patch makes the nubering of the S irqs identical to what it was before.
> 
> Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
> ---
>   hw/intc/sifive_plic.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
> index c2dfacf028..89d2122742 100644
> --- a/hw/intc/sifive_plic.c
> +++ b/hw/intc/sifive_plic.c
> @@ -480,7 +480,7 @@ DeviceState *sifive_plic_create(hwaddr addr, char *hart_config,
>                                     qdev_get_gpio_in(DEVICE(cpu), IRQ_M_EXT));
>           }
>           if (plic->addr_config[i].mode == PLICMode_S) {
> -            qdev_connect_gpio_out(dev, cpu_num,
> +            qdev_connect_gpio_out(dev, cpu_num - plic->hartid_base,
>                                     qdev_get_gpio_in(DEVICE(cpu), IRQ_S_EXT));
>           }
>       }

Oops.

Eventually we could unify the style:

-- >8 --
@@ -476,11 +476,11 @@ DeviceState *sifive_plic_create(hwaddr addr, char 
*hart_config,
          CPUState *cpu = qemu_get_cpu(cpu_num);

          if (plic->addr_config[i].mode == PLICMode_M) {
-            qdev_connect_gpio_out(dev, num_harts - plic->hartid_base + 
cpu_num,
+            qdev_connect_gpio_out(dev, cpu_num - hartid_base + num_harts,
                                    qdev_get_gpio_in(DEVICE(cpu), 
IRQ_M_EXT));
          }
          if (plic->addr_config[i].mode == PLICMode_S) {
-            qdev_connect_gpio_out(dev, cpu_num,
+            qdev_connect_gpio_out(dev, cpu_num - hartid_base,
                                    qdev_get_gpio_in(DEVICE(cpu), 
IRQ_S_EXT));
          }
      }
---

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


