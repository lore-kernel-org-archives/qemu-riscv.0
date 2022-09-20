Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oadox-0004f0-M7
	for mharc-qemu-riscv@gnu.org; Tue, 20 Sep 2022 10:01:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oadoM-0004ak-3b; Tue, 20 Sep 2022 10:01:18 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c]:43755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oadoJ-0001I2-LF; Tue, 20 Sep 2022 10:01:17 -0400
Received: by mail-ot1-x32c.google.com with SMTP id
 cm7-20020a056830650700b006587fe87d1aso1763150otb.10; 
 Tue, 20 Sep 2022 07:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=obx72+8lj9qm2WhrMMX0CKsbEGig5oqUktdJe59wJ8c=;
 b=EYGsqsWfnaYLIUhNnwR+W3+HQV7e1PVwf2K+QWqXr8T8ik7uhUchYwfaPRXzwOSNdj
 Y/VehUxaTawGdfoqwV5K3tSuvfrPWqckFhn+PXkxZYghBOhI2+TO0xbTzdFFrdhpyh2x
 veDoWSvsPDca3I578Fy9amlMqEZxQtbHz3JbXHWjMiu5OfyH5uyFImUWMMUvuKamIuTS
 YG8Kte9lSMN+Y8mrfYFVvuA43odoGtzEhiO8+jo4NP0P6X2/MTgvqMcLEzX/vDtgsO9b
 Gwc7jwC79qXCaM1/HPNBUkVZGrFZS5xRrwr2Ne3iu0RW7Y6naElU5JeR1p5TlLLhSvzD
 4tyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=obx72+8lj9qm2WhrMMX0CKsbEGig5oqUktdJe59wJ8c=;
 b=pNAVbaV0cdBTBX9aeYZ8R39h0Bp2hhrTwkrjEY6+7dW5Xey+HrO+YmOTdLJjRs5VLb
 RvtCLKnlMM1bhZ0UnQ0iQX67NO5zf7lKEJxWC1IboWCg/OpvR8H35i8H/92JPkqb8Za0
 ZadMSB9W8pFRN38gowU72bu80rjveWFaFspXkFMDJzdAYQJqFNGgfGwbxxM+k7PYDHYr
 +ToyOYak834RmJLBzkusXuC5NEwNOPb63UwGgc0j29iZ68DFbTx+lS/HNWx/56S1Nag0
 5syCyV4KGYBkoV77uUQjW4lfPPoOHP0qZs+W/pGwkZtorPAAZJuUNE6/mqiXP9sDDHe0
 bveQ==
X-Gm-Message-State: ACrzQf2dzpMK357zbVSiVzbLEuGbT2d5QP97UAT23N0TaoohkBBzvXYu
 lou87CRbDrSV/gtHkxZU76w=
X-Google-Smtp-Source: AMsMyM7SJwY7Rzq8kp0hCW9RSDbUha/Eoq34TgM/6q2jfQ2yIYDABRMiwIOljIt9IFN/T/DE/u7ntw==
X-Received: by 2002:a05:6830:18d8:b0:655:1f50:715f with SMTP id
 v24-20020a05683018d800b006551f50715fmr10392167ote.97.1663682472036; 
 Tue, 20 Sep 2022 07:01:12 -0700 (PDT)
Received: from [192.168.10.102] ([191.193.2.69])
 by smtp.gmail.com with ESMTPSA id
 y22-20020a056830071600b0065892f42157sm821295ots.75.2022.09.20.07.00.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Sep 2022 07:01:10 -0700 (PDT)
Message-ID: <8906f236-dbfc-7d51-a87d-2c02e8c506b2@gmail.com>
Date: Tue, 20 Sep 2022 11:00:50 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 4/9] hw/ppc/spapr: Fix code style problems reported by
 checkpatch
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Magnus Damm
 <magnus.damm@gmail.com>, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Bandan Das <bsd@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
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
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-riscv@nongnu.org, Stafford Horne <shorne@gmail.com>,
 Paul Durrant <paul@xen.org>, Havard Skinnemoen <hskinnemoen@google.com>,
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
 <20220919231720.163121-5-shentey@gmail.com>
Content-Language: en-US
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220919231720.163121-5-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32c.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-2.182,
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
X-List-Received-Date: Tue, 20 Sep 2022 14:01:22 -0000


On 9/19/22 20:17, Bernhard Beschow wrote:
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>


And I've queued it in gitlab.com/danielhb/qemu/tree/ppc-next since it's not
tied with the rest of the series. Thanks,


Daniel

>   include/hw/ppc/spapr.h | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index 530d739b1d..04a95669ab 100644
> --- a/include/hw/ppc/spapr.h
> +++ b/include/hw/ppc/spapr.h
> @@ -848,7 +848,8 @@ static inline uint64_t ppc64_phys_to_real(uint64_t addr)
>   
>   static inline uint32_t rtas_ld(target_ulong phys, int n)
>   {
> -    return ldl_be_phys(&address_space_memory, ppc64_phys_to_real(phys + 4*n));
> +    return ldl_be_phys(&address_space_memory,
> +                       ppc64_phys_to_real(phys + 4 * n));
>   }
>   
>   static inline uint64_t rtas_ldq(target_ulong phys, int n)
> @@ -858,7 +859,7 @@ static inline uint64_t rtas_ldq(target_ulong phys, int n)
>   
>   static inline void rtas_st(target_ulong phys, int n, uint32_t val)
>   {
> -    stl_be_phys(&address_space_memory, ppc64_phys_to_real(phys + 4*n), val);
> +    stl_be_phys(&address_space_memory, ppc64_phys_to_real(phys + 4 * n), val);
>   }
>   
>   typedef void (*spapr_rtas_fn)(PowerPCCPU *cpu, SpaprMachineState *sm,

