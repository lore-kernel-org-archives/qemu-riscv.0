Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pPOYO-0002LH-BR
	for mharc-qemu-riscv@gnu.org; Tue, 07 Feb 2023 09:02:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pPOYK-0002JZ-U5
 for qemu-riscv@nongnu.org; Tue, 07 Feb 2023 09:02:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pPOYI-0001k3-0h
 for qemu-riscv@nongnu.org; Tue, 07 Feb 2023 09:02:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675778549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1yJKAX12sfWoby8JOQXqMuUJf9J6IrBCjo1lt2jEfxI=;
 b=GGlTLu3WtX359IJ+VsPL9NTZ5RyH0Mr6XXuRxzwOqD9xOUEHRnLXnPd6f1GQJ/njTuQnd5
 tDdp5gSmMmqZ2vwIpn5uiXi85j03QQv0E3ZcytVMPpsTtL8w/iAeyD78KPwzyZF9NhZqet
 hwDSJxYYospXHoq8+Jd2ESM0chPpE20=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-670-xLH17hr0PVqeWURVb1y1JQ-1; Tue, 07 Feb 2023 09:02:26 -0500
X-MC-Unique: xLH17hr0PVqeWURVb1y1JQ-1
Received: by mail-oi1-f200.google.com with SMTP id
 j5-20020a056808118500b0036b1cfb4778so2640451oil.2
 for <qemu-riscv@nongnu.org>; Tue, 07 Feb 2023 06:02:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1yJKAX12sfWoby8JOQXqMuUJf9J6IrBCjo1lt2jEfxI=;
 b=5BXGLEIC3tTRR8WVR4ojqUfZhuyOyd1do9K+fjoZ+FA1sDEgPrfpUV9wleSMPSXC+R
 BlRsr8omqQhhxvPurUgrbkpyp64kn1teoBQ/cbqZ9YUI3CSCdz1Qtfs+u4ZWYsZMyRC/
 U5XJXWsn/JBft88o9QnoJBPv+Qs4rQT9OQ1gCmVs0XCA6/Mcuh5UAk+Cwq5eUrSAdkUL
 CLc2dAU3X+EMqz2JQS9r9doIHNYmSGCTVS+t9piPh5L+GwiidHLP7oJnxHJu3FtEJPd7
 W/jAz498jpMlEhzzVzSsDfIb6LDM4k6fNLl/EfQesoFeuk580OJMSXor7CNzJ3beflIh
 QylQ==
X-Gm-Message-State: AO0yUKUbDiPO52AhNiARW5QyxhzmoByu/4+gaq+bl8/6O5cfFOP7D9y9
 FKIbNY0CbFsclvYSGx85LTeQBrnOu/G+E8KDVVWnzWBMStWfCpjSyin6uDrrCbpMuslN7K14zn6
 eDhwaJLSjkz3RRm0=
X-Received: by 2002:a9d:62c2:0:b0:68b:bbaf:a29a with SMTP id
 z2-20020a9d62c2000000b0068bbbafa29amr2001328otk.31.1675778545350; 
 Tue, 07 Feb 2023 06:02:25 -0800 (PST)
X-Google-Smtp-Source: AK7set/8WqMWvlfSzb9zBr3gzQsmU4Zgn1A5JJNMVN6FJoAYvXHZL1CaOXTH4HOtAG0t1shb+bu05Q==
X-Received: by 2002:a9d:62c2:0:b0:68b:bbaf:a29a with SMTP id
 z2-20020a9d62c2000000b0068bbbafa29amr2001248otk.31.1675778544579; 
 Tue, 07 Feb 2023 06:02:24 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-120.web.vodafone.de.
 [109.43.176.120]) by smtp.gmail.com with ESMTPSA id
 c11-20020a05620a164b00b0071c9bf854c6sm9359071qko.69.2023.02.07.06.02.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 06:02:23 -0800 (PST)
Message-ID: <9c05b850-ae25-12aa-c6d0-b7a813a5ee03@redhat.com>
Date: Tue, 7 Feb 2023 15:02:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 02/10] hw/riscv/virt: Add a switch to enable/disable ACPI
To: Andrea Bolognani <abologna@redhat.com>,
 Andrew Jones <ajones@ventanamicro.com>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Sunil V L <sunilvl@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>, Ani Sinha <ani@anisinha.ca>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster
 <armbru@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Bernhard Beschow <shentey@gmail.com>
References: <20230202045223.2594627-1-sunilvl@ventanamicro.com>
 <20230202045223.2594627-3-sunilvl@ventanamicro.com>
 <CABJz62PFGT1H-AArbfTkpiX24mHU=q3wk7h-bpduZhJyy7tTLw@mail.gmail.com>
 <fe3b5794-be2a-eec7-9d4e-9a13eab48378@linaro.org>
 <20230207102353.hpg2gxh22urjbebu@orel>
 <CABJz62M+n4DFqMPttzaDrSRzDcjkyEduX_NAv=-9J58mmUe+Ng@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CABJz62M+n4DFqMPttzaDrSRzDcjkyEduX_NAv=-9J58mmUe+Ng@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Tue, 07 Feb 2023 14:02:35 -0000

On 07/02/2023 14.56, Andrea Bolognani wrote:
> On Tue, Feb 07, 2023 at 11:23:53AM +0100, Andrew Jones wrote:
>> On Mon, Feb 06, 2023 at 12:18:06PM +0100, Philippe Mathieu-Daudé wrote:
>>> On 6/2/23 11:54, Andrea Bolognani wrote:
>>>> On Thu, Feb 02, 2023 at 10:22:15AM +0530, Sunil V L wrote:
>>>>> +    object_class_property_add(oc, "acpi", "OnOffAuto",
>>>>> +                              virt_get_acpi, virt_set_acpi,
>>>>> +                              NULL, NULL);
>>>>> +    object_class_property_set_description(oc, "acpi",
>>>>> +                                          "Enable ACPI");
>>>>
>>>> The way this works on other architectures (x86_64, aarch64) is that
>>>> you get ACPI by default and can use -no-acpi to disable it if
>>>> desired. Can we have the same on RISC-V, for consistency?
>>>
>>> -no-acpi rather seems a x86-specific hack for the ISA PC machine, and
>>> has a high maintenance cost / burden.
>>
>> Can you elaborate on this? RISCV doesn't need '-no-acpi' specifically.
>> If -no-acpi is problematic for some reason, then something like
>> '-machine virt,acpi=off' would be sufficient for switching to DT too.
> 
> I would greatly prefer it if the command line interface could be kept
> consistent across architectures.
> 
> It looks like i440fx and q35 both have an 'acpi' machine property. Is
> -no-acpi just sugar for acpi=off?

Yes, it is, see softmmu/vl.c:

             case QEMU_OPTION_no_acpi:
                 qdict_put_str(machine_opts_dict, "acpi", "off");
                 break;

> Is it considered desirable to get rid of -no-acpi?

Sounds like a good idea, indeed!

> If so, we should follow the usual deprecation
> process and get rid of it after libvirt has had a chance to adapt.
> 
> In the scenario described above, it would make sense for RISC-V to
> only offer the machine type option (assuming that -no-acpi doesn't
> come for free with that) instead of putting additional effort into
> implementing an interface that is already on its way out.

I agree. IMHO the machine parameter should be enough, no need to introduce 
"-no-acpi" here.

  Thomas


