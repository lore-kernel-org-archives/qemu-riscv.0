Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oaVcB-00043m-F7
	for mharc-qemu-riscv@gnu.org; Tue, 20 Sep 2022 01:16:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oaVc3-00041o-Ud; Tue, 20 Sep 2022 01:16:04 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:43895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oaVc1-0004Jp-AJ; Tue, 20 Sep 2022 01:16:03 -0400
Received: by mail-wr1-x42d.google.com with SMTP id t7so2336714wrm.10;
 Mon, 19 Sep 2022 22:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=zoCj17/FoLXwtexZcC8HC08ap2gyp0m31eL5ZvThkKo=;
 b=R32rY7NSj7Fx9wnIFsIakEDibCO9xnK1hZUIT2HKqPdw/Ary8UunlhchQEe50uZAKt
 IcHwDoHg8BNyr+4XdYGESfHcm//PXvOEVjvXhZPD7y8P5Fpsvk8XUpPTrNV902a8L/l1
 kcrrndYyNFP2f9XhMPsIOO8AQ/iM1BglRxvcvsKItT0E660ecmBZDaSsn0HIoqSf61pq
 K8m/cNkANRYMDuR3+HLK4MzuEAvEdEvPrSnSDqRQAwpf1NMYx6hw3Df9VJdBqPRBqe1C
 BtFe2Lxkcsnodwk0vjI79xEIH7dEOtyIxG8EM0q8g5XNnP9vD2TPzFgVglIz9uW5QTr9
 RzWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=zoCj17/FoLXwtexZcC8HC08ap2gyp0m31eL5ZvThkKo=;
 b=pPS2YtWXOkaINuKdC3WgIzm+72CSBg9ZUBrExMdngpjdmOvrhf/pS0hLSfv7sOXY3l
 iGAH6pE1NF9b5Tr6e/v+OHvWcGmi9+va3g6EpRmuIbs2iIRHMiRuaSyHPB1ZGoilKxbg
 Lzitl+vbg8VR2P4ee/OqnmiUAccSnB7TH9UB0h/Yx1bTWkBqZV10cq+NwqG0XP3oBaYy
 T6k2Nictty406gXiLbN9YjA4HrghdBNCTFoGzpZqb3K3QwaVQbf8eGsd2xy0TK4l6P5y
 RVGkgoIJ/k3ViYYHRJUd9Ain2744uw8nRYoR92vO8B9NhHqpPDbWupMQCN7vEqJa8Lmw
 TKkA==
X-Gm-Message-State: ACrzQf0YfzgMiEN+Z2wGBb52rfhJ5ds7IART7BiW0b2Ge/Q0IA1Ug75W
 DgmbdY9Q/H0VqOD95LXMd0k=
X-Google-Smtp-Source: AMsMyM765pemA7LP3GGPKGAEZ4snxehIWXXseDoYmmmzhMIFFSLEBCiGTStpb6E6ujtqvUpeq7Gp3g==
X-Received: by 2002:a05:6000:2a7:b0:22a:f98f:b75f with SMTP id
 l7-20020a05600002a700b0022af98fb75fmr6627886wry.373.1663650957809; 
 Mon, 19 Sep 2022 22:15:57 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 t1-20020adfdc01000000b002252ec781f7sm480793wri.8.2022.09.19.22.15.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Sep 2022 22:15:55 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Message-ID: <e1ef18a0-6a85-e536-1fbd-9f8794dc0217@amsat.org>
Date: Tue, 20 Sep 2022 07:15:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH 9/9] exec/address-spaces: Inline legacy functions
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Magnus Damm
 <magnus.damm@gmail.com>, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Bandan Das <bsd@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Sergio Lopez <slp@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Cameron Esfahani
 <dirty@apple.com>, Michael Rolnik <mrolnik@gmail.com>,
 Song Gao <gaosong@loongson.cn>, Jagannathan Raman <jag.raman@oracle.com>,
 Greg Kurz <groug@kaod.org>, Kamil Rytarowski <kamil@netbsd.org>,
 Peter Xu <peterx@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, haxm-team@intel.com,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Helge Deller <deller@gmx.de>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-riscv@nongnu.org,
 Stafford Horne <shorne@gmail.com>, Paul Durrant <paul@xen.org>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Alexander Graf <agraf@csgraf.de>, Thomas Huth <thuth@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Wenchao Wang <wenchao.wang@intel.com>, Tony Krowiak
 <akrowiak@linux.ibm.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 qemu-s390x@nongnu.org, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Eric Farman <farman@linux.ibm.com>, Reinoud Zandijk <reinoud@netbsd.org>,
 Alexander Bulekov <alxndr@bu.edu>, Yanan Wang <wangyanan55@huawei.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Tyrone Ting <kfting@nuvoton.com>,
 xen-devel@lists.xenproject.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Darren Kenny <darren.kenny@oracle.com>, kvm@vger.kernel.org,
 Qiuhao Li <Qiuhao.Li@outlook.com>, John G Johnson
 <john.g.johnson@oracle.com>, Bin Meng <bin.meng@windriver.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Max Filippov
 <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Anthony Perard <anthony.perard@citrix.com>, Andrew Jeffery
 <andrew@aj.id.au>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Alistair Francis
 <alistair@alistair23.me>, Jason Herne <jjherne@linux.ibm.com>
References: <20220919231720.163121-1-shentey@gmail.com>
 <20220919231720.163121-10-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220919231720.163121-10-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.952,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 20 Sep 2022 05:16:07 -0000

On 20/9/22 01:17, Bernhard Beschow wrote:
> The functions just access a global pointer and perform some pointer
> arithmetic on top. Allow the compiler to see through this by inlining.

I thought about this while reviewing the previous patch, ...

> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   include/exec/address-spaces.h | 30 ++++++++++++++++++++++++++----
>   softmmu/physmem.c             | 28 ----------------------------
>   2 files changed, 26 insertions(+), 32 deletions(-)
> 
> diff --git a/include/exec/address-spaces.h b/include/exec/address-spaces.h
> index b31bd8dcf0..182af27cad 100644
> --- a/include/exec/address-spaces.h
> +++ b/include/exec/address-spaces.h
> @@ -23,29 +23,51 @@
>   
>   #ifndef CONFIG_USER_ONLY
>   
> +#include "hw/boards.h"

... but I'm not a fan of including this header here. It is restricted to 
system emulation, but still... Let see what the others think.

>   /**
>    * Get the root memory region.  This is a legacy function, provided for
>    * compatibility. Prefer using SysBusState::system_memory directly.
>    */
> -MemoryRegion *get_system_memory(void);
> +inline MemoryRegion *get_system_memory(void)
> +{
> +    assert(current_machine);
> +
> +    return &current_machine->main_system_bus.system_memory;
> +}
>   
>   /**
>    * Get the root I/O port region.  This is a legacy function, provided for
>    * compatibility. Prefer using SysBusState::system_io directly.
>    */
> -MemoryRegion *get_system_io(void);
> +inline MemoryRegion *get_system_io(void)
> +{
> +    assert(current_machine);
> +
> +    return &current_machine->main_system_bus.system_io;
> +}
>   
>   /**
>    * Get the root memory address space.  This is a legacy function, provided for
>    * compatibility. Prefer using SysBusState::address_space_memory directly.
>    */
> -AddressSpace *get_address_space_memory(void);
> +inline AddressSpace *get_address_space_memory(void)
> +{
> +    assert(current_machine);
> +
> +    return &current_machine->main_system_bus.address_space_memory;
> +}
>   
>   /**
>    * Get the root I/O port address space.  This is a legacy function, provided
>    * for compatibility. Prefer using SysBusState::address_space_io directly.
>    */
> -AddressSpace *get_address_space_io(void);
> +inline AddressSpace *get_address_space_io(void)
> +{
> +    assert(current_machine);
> +
> +    return &current_machine->main_system_bus.address_space_io;
> +}
>   
>   #endif
>   
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index 07e9a9171c..dce088f55c 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -2674,34 +2674,6 @@ static void memory_map_init(SysBusState *sysbus)
>       address_space_init(&sysbus->address_space_io, system_io, "I/O");
>   }
>   
> -MemoryRegion *get_system_memory(void)
> -{
> -    assert(current_machine);
> -
> -    return &current_machine->main_system_bus.system_memory;
> -}
> -
> -MemoryRegion *get_system_io(void)
> -{
> -    assert(current_machine);
> -
> -    return &current_machine->main_system_bus.system_io;
> -}
> -
> -AddressSpace *get_address_space_memory(void)
> -{
> -    assert(current_machine);
> -
> -    return &current_machine->main_system_bus.address_space_memory;
> -}
> -
> -AddressSpace *get_address_space_io(void)
> -{
> -    assert(current_machine);
> -
> -    return &current_machine->main_system_bus.address_space_io;
> -}
> -
>   static void invalidate_and_set_dirty(MemoryRegion *mr, hwaddr addr,
>                                        hwaddr length)
>   {


