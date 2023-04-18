Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1polRt-0006Hf-0G
	for mharc-qemu-riscv@gnu.org; Tue, 18 Apr 2023 09:32:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1polRq-0006CN-0q
 for qemu-riscv@nongnu.org; Tue, 18 Apr 2023 09:32:42 -0400
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1polRo-0001Gm-5D
 for qemu-riscv@nongnu.org; Tue, 18 Apr 2023 09:32:41 -0400
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-187949fdb1cso449552fac.0
 for <qemu-riscv@nongnu.org>; Tue, 18 Apr 2023 06:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1681824758; x=1684416758;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8fhTjXwSREiC/6xDtlRtsSZ10cmWrMdZAnI28n0T4aU=;
 b=CjiImZdykYf9s1ws+tAfrxmDQucedwkgC4QQ0vk6EF3nfvcBZn5WsgRdGu9AgDRQ6g
 cSU4CKbL8lTDptzQU6Yh7AdYs4lrfoQAvWawpnlp4xb07CuODOm1ZYA557CNAWCcdZgL
 ut6P68JtiSWI+Xlzb5rAxLf2VFaHeXS99XZIQAjma7BQ+B+4mgiFs1DIfOVc6whL4FUt
 sY5j8ErkWk1h0195iSknNnbQN1PwA8hTp82CEgL4e7K7KD9Tg4cppk3roCpzs1PETkKy
 0isIAtbySbXk179B6s59M2MpCOdsMuCHWnAm71PTIhICIFd6a2bT5oizq29IlRAO9Si0
 D5Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681824758; x=1684416758;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8fhTjXwSREiC/6xDtlRtsSZ10cmWrMdZAnI28n0T4aU=;
 b=lnXo6HEEsfsj3bonVUHPNAWO45YhzvXp//EzM6NZ0E8YjS2tVhHhr41L+a0QQkLeud
 wxp6Q4c7xiBUh4EMLW4syk6AG48TNV6zdIy01o/MCTNTjiL1auIXIIVheTj5wK5bsk+a
 zqjAXSePJ0FCJuYwinqfbvJHx5J8X7Hgk4kvtbbpdNulmk5WTV0iTBDWsBfR+KVbZSZU
 /erV7mz5jRdE1U3X5muyRT2mJSXBF4cBDK2UcXTU5uRnd3XQ3JSlehOPr1CopwFXPDU/
 1GYuC2C1UjKRRk+0mhXMlLW+yi/smksMbcWfCdWFCh+ET5RkoAIUTZm7b3rdq+FRo29l
 4Ayw==
X-Gm-Message-State: AAQBX9c2nqNMg3j3gkWjRJg8BQc0ju79eL4Sq9SxmjfhPNcsyiummrf0
 GR0ZbV824dqJjPgwSdDNGsj5nQ==
X-Google-Smtp-Source: AKy350ac2N1nRbQlxoBH4scShVqJXQ+DweKEPpf1No8g8C/IA1/iFEeX7PQAfS8uPdCi8moTauWaKg==
X-Received: by 2002:a05:6870:80d3:b0:188:fb2:c208 with SMTP id
 r19-20020a05687080d300b001880fb2c208mr613506oab.11.1681824758683; 
 Tue, 18 Apr 2023 06:32:38 -0700 (PDT)
Received: from [192.168.68.107] ([191.255.108.232])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a4a95ce000000b0053e8336f5dcsm5879311ooi.7.2023.04.18.06.32.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Apr 2023 06:32:37 -0700 (PDT)
Message-ID: <2fb70096-a972-7758-3b32-ec5dd820bcb8@ventanamicro.com>
Date: Tue, 18 Apr 2023 10:32:34 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: How to increase memory in a RISCV32 image? Stuck with 988MB
Content-Language: en-US
To: "Mikhail R. Gadelha" <mikhail.ramalho@gmail.com>,
 Thomas Huth <thuth@redhat.com>
Cc: qemu-discuss@nongnu.org, "open list:RISC-V" <qemu-riscv@nongnu.org>
References: <CAORA-9bu70APxEC4w+Ona9dzTN9Wy9kmPzEQAgxOQ6u6eK71ug@mail.gmail.com>
 <3aab7cc1-c068-da71-13bc-58f7dd164bfb@redhat.com>
 <CAORA-9aRVgiA-OZ0NC0PrkTiQL76we12pRzcX_y=NVYPVCt2Dw@mail.gmail.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <CAORA-9aRVgiA-OZ0NC0PrkTiQL76we12pRzcX_y=NVYPVCt2Dw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x34.google.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.597,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Tue, 18 Apr 2023 13:32:42 -0000



On 4/18/23 08:10, Mikhail R. Gadelha wrote:
> Yeah, I mentioned in the email it doesn't even start with mem=4G...
> 
> With lower values, e.g., mem=3G, the image starts but I'm limited to 988MB of RAM.

QEMU doesn't make a distinction between 32 or 64 bits when setting the memory banks.


 From Linux kernel arch/riscv/mm/init.c, early_mem():


         pr_notice("Memory limited to %lldMB\n", (u64)memory_limit >> 20);


'memory_limit' is defined in the same file in setup_vm() as:

         /*
          * The default maximal physical memory size is KERN_VIRT_SIZE for 32-bit
          * kernel, whereas for 64-bit kernel, the end of the virtual address
          * space is occupied by the modules/BPF/kernel mappings which reduces
          * the available size of the linear mapping.
          */
         memory_limit = KERN_VIRT_SIZE - (IS_ENABLED(CONFIG_64BIT) ? SZ_4G : 0);


So my educated guess here is that the kernel is capping the max memory for 32 bits
to 988Mb, as you've pointed in your first email.


Thanks,


Daniel

> 
> 
> Em ter., 18 de abr. de 2023 às 04:42, Thomas Huth <thuth@redhat.com <mailto:thuth@redhat.com>> escreveu:
> 
>     On 17/04/2023 19.21, Mikhail R. Gadelha wrote:
>      > Hi qemu folks,
>      >
>      > I'm using yocto to generate a riscv32 image but qemu seems to be ignoring
>      > the -m argument from the command line and forcing the image to run with
>      > 988MB of RAM.
>      >
>      > Is there any way I can increase it to 4G?
>      >
>      > I'm using the following cmdline to start qemu:
>      >
>      > qemu-system-riscv32 -nographic -machine virt -m 4G -smp 8 -bios
>      > /home/mgadelha/tools/poky/build/tmp/deploy/images/qemuriscv32/fw_jump.elf
>      > -kernel /home/mgadelha/tools/poky/build/tmp/deploy/images/qemuriscv32/Image
>      > -append "root=/dev/vda rw mem=4G" -drive
> 
>     That "mem=4G" part of the -append option looks suspicious ... have you
>     already tried to boot without that, or to decrease it to a number that fits
>     into 32-bit, e.g. "mem=3G" ?
> 
>        HTH,
>         Thomas
> 
>      > id=disk0,file=/home/mgadelha/tools/poky/build/tmp/deploy/images/qemuriscv32/core-image-full-cmdline-qemuriscv32-20230415202008.rootfs.ext4,if=none,format=raw -device virtio-net-device,netdev=usernet -netdev user,id=usernet,hostfwd=tcp::22222-:22 -device virtio-blk-device,drive=disk0 -object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0 -device virtio-tablet-pci -device virtio-keyboard-pci
>      >
>      > Well, it actually doesn't start if I use -m 4G, but any value lower than
>      > that is fine.
>      >
>      > Here's also the boot log: https://pastebin.com/b7ZEP659 <https://pastebin.com/b7ZEP659>
>      > <https://pastebin.com/b7ZEP659 <https://pastebin.com/b7ZEP659>>
>      >
>      > I see that the kernel prints:
>      >
>      > [    0.000000] Memory limited to 1024MB
>      >
>      > so maybe it's a kernel limitation rather than qemu?
>      >
>      > --
>      >
>      > Mikhail Ramalho.
> 
> 
> 
> -- 
> 
> Mikhail Ramalho.

