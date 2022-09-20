Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oaVpZ-000852-0n
	for mharc-qemu-riscv@gnu.org; Tue, 20 Sep 2022 01:30:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oaVpV-00081m-4s; Tue, 20 Sep 2022 01:29:57 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:42871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oaVpR-0005wz-OZ; Tue, 20 Sep 2022 01:29:56 -0400
Received: by mail-wr1-x434.google.com with SMTP id n12so2374776wrx.9;
 Mon, 19 Sep 2022 22:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=vLavNPct5HZ2zw6lCN44DF82TIWb7S+NcGLLhGiFgbY=;
 b=EK29FpxAwJTevxxTP1Jl5+8Y1nnFTDF4cikh0gdLoXjAqssLIc3NK6aJqtIC/sl76l
 dQN74iwKJIJ8m0vzpT+oBMXb5MWlRMSIdHBzXKYK5Up+7xMeAWU2OrFa0PkuuSntFnfD
 X7ztP7+ETA8Fnzon/RDPQskBBm2PsWXO/DiTgFqR7DYzUYuJeytUDF0rJT4iCR/ALlAA
 RNwcv8k60hb5BUXFwIL4fqj+86FL8NznWTo23V8HDCS9Sc8g3g84j4YS3ADG95ZJ5qc0
 HY0W7gF2cKRT2O+FinLEbnd2WC7FWDJUGcCanGw3nw0m2niEWG4+ilLXeWs4pDnNwah0
 Td6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=vLavNPct5HZ2zw6lCN44DF82TIWb7S+NcGLLhGiFgbY=;
 b=eSk6rEa82XX5InFhimjETOCJHr/7sSMrs73/kTs+XlUnMgsu/162TA+cNS9hkypgQl
 Ejgy9o1XosWIJIgJpszJhcHnwz1FDD3gLKVCyvQ6S22Fh5EDh43VPk9UmS97jKlqM9Yu
 2SQRgML0MfxpOHdjoGdRzZkqoJY8Euvr9pN9aUpc/wp3rkwFHLSBBwRlWfaJSWH8Jvfw
 SikUTS0CGFy5ZLJk05dcyuwF/9oJqNtlRu9WMurT+IqOY+SwI6DmFRDrAIdxUNU7RTf/
 v7jfnYmR3QK5NixUhR/eoEx9MwoXaX8Bj92ft64SKa+5okGUPu6Xx0ouh5n1IuLQ/tc/
 UMLg==
X-Gm-Message-State: ACrzQf1OSIzgxOJB7Sjh6gwTZMI1ze3pPW8kK5pk9Uj0LpWFc7e9Mra+
 r3Aaschi2+BHkWG9j20Fstc=
X-Google-Smtp-Source: AMsMyM7ISxf8TowQHPXzwCB3gJbnhv9fjXayvDOx/H9iOPRnaX40Rdq5is+DoWs7bHq7Ygny4DwhKA==
X-Received: by 2002:adf:eec3:0:b0:22a:d159:456c with SMTP id
 a3-20020adfeec3000000b0022ad159456cmr12283036wrp.463.1663651790518; 
 Mon, 19 Sep 2022 22:29:50 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 t18-20020adfdc12000000b0022762b0e2a2sm510363wri.6.2022.09.19.22.29.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Sep 2022 22:29:49 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Message-ID: <63a4afba-546b-5c4c-94f8-c689b8fa0e0b@amsat.org>
Date: Tue, 20 Sep 2022 07:29:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH 9/9] exec/address-spaces: Inline legacy functions
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
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
 <e1ef18a0-6a85-e536-1fbd-9f8794dc0217@amsat.org>
In-Reply-To: <e1ef18a0-6a85-e536-1fbd-9f8794dc0217@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
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
X-List-Received-Date: Tue, 20 Sep 2022 05:29:59 -0000

On 20/9/22 07:15, Philippe Mathieu-Daudé wrote:
> On 20/9/22 01:17, Bernhard Beschow wrote:
>> The functions just access a global pointer and perform some pointer
>> arithmetic on top. Allow the compiler to see through this by inlining.
> 
> I thought about this while reviewing the previous patch, ...
> 
>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>> ---
>>   include/exec/address-spaces.h | 30 ++++++++++++++++++++++++++----
>>   softmmu/physmem.c             | 28 ----------------------------
>>   2 files changed, 26 insertions(+), 32 deletions(-)
>>
>> diff --git a/include/exec/address-spaces.h 
>> b/include/exec/address-spaces.h
>> index b31bd8dcf0..182af27cad 100644
>> --- a/include/exec/address-spaces.h
>> +++ b/include/exec/address-spaces.h
>> @@ -23,29 +23,51 @@
>>   #ifndef CONFIG_USER_ONLY
>> +#include "hw/boards.h"
> 
> ... but I'm not a fan of including this header here. It is restricted to 
> system emulation, but still... Let see what the others think.
> 
>>   /**
>>    * Get the root memory region.  This is a legacy function, provided for
>>    * compatibility. Prefer using SysBusState::system_memory directly.
>>    */
>> -MemoryRegion *get_system_memory(void);
>> +inline MemoryRegion *get_system_memory(void)
>> +{
>> +    assert(current_machine);
>> +
>> +    return &current_machine->main_system_bus.system_memory;
>> +}

Maybe we can simply declare them with __attribute__ ((const)) in the 
previous patch?
See 
https://gcc.gnu.org/onlinedocs/gcc/Common-Function-Attributes.html#Common-Function-Attributes

